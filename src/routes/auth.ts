import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { hashPassword, verifyPassword, signToken, requireAuth, requireRole } from '../auth.js';
import { writeAudit } from '../audit.js';
import type { Role } from '../types.js';

export const authRouter = Router();

const credsSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
  name: z.string().max(120).optional(),
});

// Open registration -> creates a viewer. Admins can elevate later.
authRouter.post('/register', async (req, res) => {
  const parsed = credsSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { email, password, name } = parsed.data;
  const existing = await one('SELECT id FROM users WHERE email = ?', [email.toLowerCase()]);
  if (existing) return res.status(409).json({ error: 'Email already registered' });

  const info = await run('INSERT INTO users (email, password_hash, name, role) VALUES (?, ?, ?, ?)', [email.toLowerCase(), hashPassword(password), name || '', 'viewer']);
  const user = { id: info.insertId, email: email.toLowerCase(), role: 'viewer' as Role, name: name || '' };
  await writeAudit({ uid: user.id, email: user.email, role: user.role }, 'register', 'user', user.id);
  const token = signToken({ uid: user.id, email: user.email, role: user.role });
  return res.status(201).json({ token, user });
});

authRouter.post('/login', async (req, res) => {
  const parsed = credsSchema.pick({ email: true, password: true }).safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input' });
  const { email, password } = parsed.data;
  const row = await one<{ id: number; email: string; password_hash: string; name: string; role: Role }>(
    'SELECT id, email, password_hash, name, role FROM users WHERE email = ?', [email.toLowerCase()]
  );
  if (!row || !verifyPassword(password, row.password_hash)) {
    return res.status(401).json({ error: 'Invalid email or password' });
  }
  const token = signToken({ uid: row.id, email: row.email, role: row.role });
  await writeAudit({ uid: row.id, email: row.email, role: row.role }, 'login', 'user', row.id);
  return res.json({ token, user: { id: row.id, email: row.email, name: row.name, role: row.role } });
});

authRouter.get('/me', requireAuth, async (req, res) => {
  const row = await one('SELECT id, email, name, role, created_at FROM users WHERE id = ?', [req.user!.uid]);
  if (!row) return res.status(404).json({ error: 'Not found' });
  return res.json({ user: row });
});

// ---- admin: user management ----
authRouter.get('/users', requireAuth, requireRole('admin'), async (_req, res) => {
  const rows = await q('SELECT id, email, name, role, created_at FROM users ORDER BY id');
  return res.json({ users: rows });
});

// lightweight member list for assignment pickers (editor or admin)
authRouter.get('/members', requireAuth, requireRole('editor'), async (_req, res) => {
  const rows = await q('SELECT id, name, email, role FROM users ORDER BY name');
  return res.json({ members: rows });
});

const roleSchema = z.object({ role: z.enum(['admin', 'editor', 'viewer']) });
authRouter.patch('/users/:id/role', requireAuth, requireRole('admin'), async (req, res) => {
  const parsed = roleSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid role' });
  const id = Number(req.params.id);
  const exists = await one('SELECT id FROM users WHERE id = ?', [id]);
  if (!exists) return res.status(404).json({ error: 'User not found' });
  await run('UPDATE users SET role = ? WHERE id = ?', [parsed.data.role, id]);
  await writeAudit(req.user, 'set_role', 'user', id, { role: parsed.data.role });
  return res.json({ ok: true, id, role: parsed.data.role });
});
