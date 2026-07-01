import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth } from '../auth.js';
import { writeAudit } from '../audit.js';

export const viewsRouter = Router();

const viewSchema = z.object({
  name: z.string().min(1).max(120),
  query: z.string().max(2000).default(''),
  shared: z.boolean().optional(),
});

// GET /api/views -> the caller's own views plus any shared by others
viewsRouter.get('/', requireAuth, async (req, res) => {
  const rows = await q(
    `SELECT v.id, v.name, v.query, v.shared, v.user_id, u.email AS owner, (v.user_id = ?) AS mine
     FROM saved_views v LEFT JOIN users u ON u.id = v.user_id
     WHERE v.user_id = ? OR v.shared = 1
     ORDER BY v.name`,
    [req.user!.uid, req.user!.uid]
  );
  return res.json({ views: rows });
});

// POST /api/views -> save a view (any authenticated user)
viewsRouter.post('/', requireAuth, async (req, res) => {
  const parsed = viewSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input' });
  const { name, query, shared } = parsed.data;
  const info = await run('INSERT INTO saved_views (user_id, name, query, shared) VALUES (?, ?, ?, ?)', [req.user!.uid, name.trim(), query, shared ? 1 : 0]);
  await writeAudit(req.user, 'view_save', 'view', info.insertId, { name, shared: !!shared });
  return res.status(201).json({ view: await one('SELECT id, name, query, shared FROM saved_views WHERE id = ?', [info.insertId]) });
});

// DELETE /api/views/:id -> owner or admin
viewsRouter.delete('/:id', requireAuth, async (req, res) => {
  const id = Number(req.params.id);
  const row = await one<{ user_id: number }>('SELECT user_id FROM saved_views WHERE id = ?', [id]);
  if (!row) return res.status(404).json({ error: 'View not found' });
  if (row.user_id !== req.user!.uid && req.user!.role !== 'admin') return res.status(403).json({ error: 'Not your view' });
  await run('DELETE FROM saved_views WHERE id = ?', [id]);
  await writeAudit(req.user, 'view_delete', 'view', id);
  return res.json({ ok: true });
});
