import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth, requirePlatformAdmin } from '../auth.js';
import { writeAudit } from '../audit.js';

export const organizationsRouter = Router();

// Onboarding a client org (e.g. a VC firm scoped to a specific contact
// segment) is entirely a Capital Book platform-admin action: create the org
// here, populate/assign its contacts via POST /api/contacts/bulk
// (action: 'assign_org'), then create its first user via POST /api/auth/users
// with an explicit orgId.

// GET /api/organizations -> list with basic counts (platform admin only)
organizationsRouter.get('/', requireAuth, requirePlatformAdmin, async (_req, res) => {
  const rows = await q(
    `SELECT o.id, o.name, o.is_platform, o.created_at,
            (SELECT COUNT(*) FROM users u WHERE u.org_id = o.id) AS user_count,
            (SELECT COUNT(*) FROM contacts c WHERE c.org_id = o.id) AS contact_count
     FROM organizations o ORDER BY o.is_platform DESC, o.name ASC`
  );
  return res.json({ organizations: rows });
});

const orgSchema = z.object({ name: z.string().min(1).max(160) });

// POST /api/organizations -> create a new client org (platform admin only)
organizationsRouter.post('/', requireAuth, requirePlatformAdmin, async (req, res) => {
  const parsed = orgSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const name = parsed.data.name.trim();
  if (await one('SELECT id FROM organizations WHERE name = ?', [name])) {
    return res.status(409).json({ error: 'An organization with that name already exists' });
  }
  const info = await run('INSERT INTO organizations (name, is_platform) VALUES (?, 0)', [name]);
  await writeAudit(req.user, 'org_create', 'organization', info.insertId, { name });
  return res.status(201).json({ organization: await one('SELECT id, name, is_platform, created_at FROM organizations WHERE id = ?', [info.insertId]) });
});

// PATCH /api/organizations/:id -> rename (platform admin only)
organizationsRouter.patch('/:id', requireAuth, requirePlatformAdmin, async (req, res) => {
  const id = Number(req.params.id);
  const existing = await one<{ id: number; is_platform: number }>('SELECT id, is_platform FROM organizations WHERE id = ?', [id]);
  if (!existing) return res.status(404).json({ error: 'Organization not found' });
  const parsed = orgSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const name = parsed.data.name.trim();
  await run('UPDATE organizations SET name = ? WHERE id = ?', [name, id]);
  await writeAudit(req.user, 'org_update', 'organization', id, { name });
  return res.json({ organization: await one('SELECT id, name, is_platform, created_at FROM organizations WHERE id = ?', [id]) });
});
