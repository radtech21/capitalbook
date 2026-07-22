import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth, requireRole } from '../auth.js';
import { writeAudit } from '../audit.js';
import { contactInOrg } from './contacts.js';

export const tasksRouter = Router();

const createSchema = z.object({
  contact_id: z.number().int().nullable().optional(),
  title: z.string().min(1).max(300),
  due: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).nullable().optional(),
});
const patchSchema = z.object({
  title: z.string().min(1).max(300).optional(),
  due: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).nullable().optional(),
  done: z.boolean().optional(),
});

// GET /api/tasks?status=open|done|overdue&contact_id=
tasksRouter.get('/', requireAuth, async (req, res) => {
  const where = ['t.user_id = ?'];
  const params: unknown[] = [req.user!.uid];
  const status = String(req.query.status || '');
  if (status === 'open') where.push('t.done = 0');
  else if (status === 'done') where.push('t.done = 1');
  else if (status === 'overdue') where.push("t.done = 0 AND t.due IS NOT NULL AND t.due <> '' AND t.due < CURDATE()");
  if (req.query.contact_id) { where.push('t.contact_id = ?'); params.push(Number(req.query.contact_id)); }

  const rows = await q(
    `SELECT t.id, t.contact_id, t.title, t.due, t.done, t.created_at, t.completed_at, c.name AS contact_name
     FROM tasks t LEFT JOIN contacts c ON c.id = t.contact_id
     WHERE ${where.join(' AND ')}
     ORDER BY t.done ASC, (t.due IS NULL), t.due ASC, t.id DESC`,
    params
  );
  const counts = await one(
    `SELECT
       COALESCE(SUM(CASE WHEN done = 0 THEN 1 ELSE 0 END), 0) AS open,
       COALESCE(SUM(CASE WHEN done = 0 AND due IS NOT NULL AND due <> '' AND due < CURDATE() THEN 1 ELSE 0 END), 0) AS overdue,
       COALESCE(SUM(CASE WHEN done = 1 THEN 1 ELSE 0 END), 0) AS done
     FROM tasks WHERE user_id = ?`,
    [req.user!.uid]
  );
  return res.json({ tasks: rows, counts });
});

// POST /api/tasks (editor or admin)
tasksRouter.post('/', requireAuth, requireRole('editor'), async (req, res) => {
  const parsed = createSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { contact_id = null, title, due = null } = parsed.data;
  if (contact_id != null && !(await contactInOrg(req, contact_id))) return res.status(404).json({ error: 'Contact not found' });
  const info = await run('INSERT INTO tasks (contact_id, user_id, title, due) VALUES (?, ?, ?, ?)', [contact_id, req.user!.uid, title, due]);
  await writeAudit(req.user, 'task_create', 'task', info.insertId, { contact_id, title });
  const row = await one('SELECT id, contact_id, title, due, done, created_at, completed_at FROM tasks WHERE id = ?', [info.insertId]);
  return res.status(201).json({ task: row });
});

// PATCH /api/tasks/:id (owner; editors and admins)
tasksRouter.patch('/:id', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  const existing = await one<any>('SELECT * FROM tasks WHERE id = ?', [id]);
  if (!existing) return res.status(404).json({ error: 'Task not found' });
  if (existing.user_id !== req.user!.uid && req.user!.role !== 'admin') return res.status(403).json({ error: 'Not your task' });
  const parsed = patchSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input' });
  const p = parsed.data;
  const title = p.title ?? existing.title;
  const due = p.due !== undefined ? p.due : existing.due;
  const done = p.done !== undefined ? (p.done ? 1 : 0) : existing.done;
  await run('UPDATE tasks SET title = ?, due = ?, done = ? WHERE id = ?', [title, due, done, id]);
  if (done && !existing.done) await run('UPDATE tasks SET completed_at = NOW() WHERE id = ?', [id]);
  else if (!done) await run('UPDATE tasks SET completed_at = NULL WHERE id = ?', [id]);
  await writeAudit(req.user, 'task_update', 'task', id, { done: !!done });
  const row = await one('SELECT id, contact_id, title, due, done, created_at, completed_at FROM tasks WHERE id = ?', [id]);
  return res.json({ task: row });
});

// DELETE /api/tasks/:id
tasksRouter.delete('/:id', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  const existing = await one<{ user_id: number; title: string }>('SELECT user_id, title FROM tasks WHERE id = ?', [id]);
  if (!existing) return res.status(404).json({ error: 'Task not found' });
  if (existing.user_id !== req.user!.uid && req.user!.role !== 'admin') return res.status(403).json({ error: 'Not your task' });
  await run('DELETE FROM tasks WHERE id = ?', [id]);
  await writeAudit(req.user, 'task_delete', 'task', id, { title: existing.title });
  return res.json({ ok: true });
});
