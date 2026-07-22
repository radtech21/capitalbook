import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth, requireRole, orgScope } from '../auth.js';
import { writeAudit } from '../audit.js';
import { contactInOrg } from './contacts.js';

export const activitiesRouter = Router();

const TYPES = ['note', 'call', 'email', 'meeting'] as const;
const bodySchema = z.object({ type: z.enum(TYPES).default('note'), body: z.string().min(1).max(8000) });

// GET /api/activity -> recent activity across all contacts (team feed), scoped
// to contacts in the caller's own org (platform org sees everything, as before)
activitiesRouter.get('/activity', requireAuth, async (req, res) => {
  const limit = Math.min(100, Math.max(1, parseInt(String(req.query.limit || '50'), 10) || 50));
  const org = orgScope(req);
  const where = org.sql ? `WHERE ${org.sql}` : '';
  const rows = await q(
    `SELECT a.id, a.contact_id, a.user_email, a.type, a.body, a.created_at,
            c.name AS contact_name, c.firm AS contact_firm
     FROM activities a LEFT JOIN contacts c ON c.id = a.contact_id
     ${where}
     ORDER BY a.id DESC LIMIT ${limit}`,
    org.params
  );
  return res.json({ activities: rows });
});

// GET /api/contacts/:id/activities -> full timeline (any authenticated user)
activitiesRouter.get('/contacts/:id/activities', requireAuth, async (req, res) => {
  const contactId = Number(req.params.id);
  if (!(await contactInOrg(req, contactId))) return res.status(404).json({ error: 'Contact not found' });
  const rows = await q('SELECT id, contact_id, user_id, user_email, type, body, created_at FROM activities WHERE contact_id = ? ORDER BY id DESC', [contactId]);
  return res.json({ activities: rows });
});

// POST /api/contacts/:id/activities -> log an activity (editor or admin)
activitiesRouter.post('/contacts/:id/activities', requireAuth, requireRole('editor'), async (req, res) => {
  const contactId = Number(req.params.id);
  if (!(await contactInOrg(req, contactId))) return res.status(404).json({ error: 'Contact not found' });
  const parsed = bodySchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });

  const info = await run('INSERT INTO activities (contact_id, user_id, user_email, type, body) VALUES (?, ?, ?, ?, ?)', [contactId, req.user!.uid, req.user!.email, parsed.data.type, parsed.data.body]);
  await writeAudit(req.user, 'activity_add', 'contact', contactId, { type: parsed.data.type });
  const row = await one('SELECT id, contact_id, user_id, user_email, type, body, created_at FROM activities WHERE id = ?', [info.insertId]);
  return res.status(201).json({ activity: row });
});

// DELETE /api/activities/:id -> remove (author or admin)
activitiesRouter.delete('/activities/:id', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  const row = await one<{ user_id: number; type: string; contact_id: number; contact_name: string; contact_org_id: number | null }>(
    `SELECT a.user_id, a.type, a.contact_id, c.name AS contact_name, c.org_id AS contact_org_id
     FROM activities a LEFT JOIN contacts c ON c.id = a.contact_id WHERE a.id = ?`,
    [id]
  );
  if (!row || (!req.user!.isPlatformOrg && row.contact_org_id !== req.user!.orgId)) return res.status(404).json({ error: 'Not found' });
  if (row.user_id !== req.user!.uid && req.user!.role !== 'admin') return res.status(403).json({ error: 'Only the author or an admin can delete this' });
  await run('DELETE FROM activities WHERE id = ?', [id]);
  await writeAudit(req.user, 'activity_delete', 'activity', id, { type: row.type, contact: row.contact_name });
  return res.json({ ok: true });
});
