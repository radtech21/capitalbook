import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth, requireRole } from '../auth.js';
import { writeAudit } from '../audit.js';

export const pipelineRouter = Router();

const STATUSES = ['New', 'Contacted', 'Replied', 'Meeting', 'Passed'] as const;
const pipeSchema = z.object({
  status: z.enum(STATUSES).optional(),
  due: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).nullable().optional(),
  opp: z.number().nonnegative().nullable().optional(),
  poc: z.string().max(200).optional(),
  note: z.string().max(4000).optional(),
});

// GET /api/pipeline -> all of the current user's entries (for cross-device sync)
pipelineRouter.get('/', requireAuth, async (req, res) => {
  // joined with the contact so the kanban board has card data in one call
  const rows = await q(
    `SELECT p.contact_id, p.status, p.due, p.opp, p.poc, p.note, p.updated_at,
            c.name, c.firm, c.aum_mm, c.city
     FROM pipeline p JOIN contacts c ON c.id = p.contact_id
     WHERE p.user_id = ? ORDER BY p.updated_at DESC`, [req.user!.uid]);
  return res.json({ pipeline: rows });
});

// PUT /api/pipeline/:contactId -> upsert (editor or admin only)
pipelineRouter.put('/:contactId', requireAuth, requireRole('editor'), async (req, res) => {
  const contactId = Number(req.params.contactId);
  if (!(await one('SELECT id FROM contacts WHERE id = ?', [contactId]))) return res.status(404).json({ error: 'Contact not found' });

  const parsed = pipeSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const p = parsed.data;

  const existing = await one<{ status: string; due: string | null; opp: number | null; poc: string; note: string }>(
    'SELECT status, due, opp, poc, note FROM pipeline WHERE contact_id = ? AND user_id = ?', [contactId, req.user!.uid]
  );
  const merged = {
    status: p.status ?? existing?.status ?? 'New',
    due: p.due !== undefined ? p.due : existing?.due ?? null,
    opp: p.opp !== undefined ? p.opp : existing?.opp ?? null,
    poc: p.poc !== undefined ? p.poc : existing?.poc ?? '',
    note: p.note !== undefined ? p.note : existing?.note ?? '',
  };

  await run(
    `INSERT INTO pipeline (contact_id, user_id, status, due, opp, poc, note, updated_at)
     VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
     ON DUPLICATE KEY UPDATE status = VALUES(status), due = VALUES(due), opp = VALUES(opp),
       poc = VALUES(poc), note = VALUES(note), updated_at = NOW()`,
    [contactId, req.user!.uid, merged.status, merged.due, merged.opp, merged.poc, merged.note]
  );
  await writeAudit(req.user, existing ? 'pipeline_update' : 'pipeline_create', 'contact', contactId, merged);
  const row = await one('SELECT contact_id, status, due, opp, poc, note, updated_at FROM pipeline WHERE contact_id = ? AND user_id = ?', [contactId, req.user!.uid]);
  return res.json({ pipeline: row });
});

// DELETE /api/pipeline/:contactId
pipelineRouter.delete('/:contactId', requireAuth, requireRole('editor'), async (req, res) => {
  const contactId = Number(req.params.contactId);
  const info = await run('DELETE FROM pipeline WHERE contact_id = ? AND user_id = ?', [contactId, req.user!.uid]);
  await writeAudit(req.user, 'pipeline_delete', 'contact', contactId);
  return res.json({ ok: true, removed: info.affectedRows });
});
