import { Router } from 'express';
import { z } from 'zod';
import { randomBytes, createHash } from 'node:crypto';
import { q, one, run } from '../db.js';
import { hashPassword, verifyPassword, signToken, requireAuth, requireRole } from '../auth.js';
import { writeAudit } from '../audit.js';
import { sendMail, mailConfigured, appUrl } from '../mailer.js';
import type { Role } from '../types.js';

export const authRouter = Router();

const RESET_TTL_MIN = 60;
const sha256 = (v: string) => createHash('sha256').update(v).digest('hex');
// Self-registration is OFF unless explicitly enabled. This is an internal tool:
// admins create accounts from the Users panel.
const registrationOpen = () => process.env.ALLOW_REGISTRATION === 'true';

const credsSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
  name: z.string().max(120).optional(),
});

// Open registration -> creates a viewer. Admins can elevate later.
authRouter.post('/register', async (req, res) => {
  if (!registrationOpen()) {
    return res.status(403).json({ error: 'Self-registration is disabled. Ask an administrator to create your account.' });
  }
  const parsed = credsSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { email, password, name } = parsed.data;
  const existing = await one('SELECT id FROM users WHERE email = ?', [email.toLowerCase()]);
  if (existing) return res.status(409).json({ error: 'Email already registered' });

  const info = await run('INSERT INTO users (email, password_hash, name, role, must_change_password) VALUES (?, ?, ?, ?, 0)', [email.toLowerCase(), hashPassword(password), name || '', 'viewer']);
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
    'SELECT id, email, password_hash, name, role, must_change_password FROM users WHERE email = ?', [email.toLowerCase()]
  );
  if (!row || !verifyPassword(password, row.password_hash)) {
    return res.status(401).json({ error: 'Invalid email or password' });
  }
  const token = signToken({ uid: row.id, email: row.email, role: row.role });
  await writeAudit({ uid: row.id, email: row.email, role: row.role }, 'login', 'user', row.id);
  return res.json({ token, user: { id: row.id, email: row.email, name: row.name, role: row.role, mustChange: !!(row as any).must_change_password } });
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


// ---------------------------------------------------------------------------
// Password reset. Requested from the sign-in screen, delivered by email as a
// single-use link that expires. The token is random and only its SHA-256 hash
// is stored, so a database leak cannot be replayed into account takeover.
// ---------------------------------------------------------------------------

// public: what the sign-in screen needs to know
authRouter.get('/policy', async (_req, res) => {
  return res.json({ allowRegistration: registrationOpen(), canEmailReset: mailConfigured() });
});

const forgotSchema = z.object({ email: z.string().email() });
authRouter.post('/forgot', async (req, res) => {
  const parsed = forgotSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Enter a valid email address' });
  if (!mailConfigured()) {
    // This is a server configuration fact, not a fact about the account, so it
    // reveals nothing about whether the address exists.
    return res.status(503).json({ error: 'Password reset email is not configured on this server. Ask an administrator to set your password directly.' });
  }
  const email = parsed.data.email.toLowerCase().trim();
  const user = await one<{ id: number; email: string; name: string }>('SELECT id, email, name FROM users WHERE email = ?', [email]);

  if (user) {
    const token = randomBytes(32).toString('base64url');
    await run('UPDATE users SET reset_token_hash = ?, reset_expires_at = (NOW() + INTERVAL ? MINUTE) WHERE id = ?',
      [sha256(token), RESET_TTL_MIN, user.id]);
    const link = `${appUrl()}/app.html?reset=${encodeURIComponent(token)}`;
    try {
      await sendMail(user.email, 'Reset your Capital Book password',
        `Hello${user.name ? ' ' + user.name : ''},\n\n` +
        `Someone asked to reset the password for this Capital Book account. ` +
        `If it was you, open the link below within ${RESET_TTL_MIN} minutes to choose a new password:\n\n${link}\n\n` +
        `If it was not you, ignore this email and nothing will change.`);
      await writeAudit({ uid: user.id, email: user.email, role: 'viewer' as Role }, 'password_reset_requested', 'user', user.id);
    } catch (e) {
      console.error('Password reset email failed:', (e as Error).message);
    }
  }
  // Always the same answer, so this endpoint cannot be used to discover which
  // addresses have accounts.
  return res.json({ ok: true, message: 'If that address has an account, a reset link is on its way.' });
});

const resetSchema = z.object({ token: z.string().min(10), password: z.string().min(8).max(200) });
authRouter.post('/reset', async (req, res) => {
  const parsed = resetSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Password must be at least 8 characters' });
  const { token, password } = parsed.data;
  const user = await one<{ id: number; email: string; role: Role }>(
    'SELECT id, email, role FROM users WHERE reset_token_hash = ? AND reset_expires_at IS NOT NULL AND reset_expires_at > NOW()',
    [sha256(token)]
  );
  if (!user) return res.status(400).json({ error: 'This reset link is invalid or has expired. Request a new one.' });
  await run('UPDATE users SET password_hash = ?, reset_token_hash = NULL, reset_expires_at = NULL, must_change_password = 0 WHERE id = ?',
    [hashPassword(password), user.id]);
  await writeAudit({ uid: user.id, email: user.email, role: user.role }, 'password_reset', 'user', user.id);
  return res.json({ ok: true });
});

// change your own password while signed in
const changeSchema = z.object({ currentPassword: z.string().min(1), newPassword: z.string().min(8).max(200) });
authRouter.post('/password', requireAuth, async (req, res) => {
  const parsed = changeSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'New password must be at least 8 characters' });
  const { currentPassword, newPassword } = parsed.data;
  const me = await one<{ id: number; password_hash: string }>('SELECT id, password_hash FROM users WHERE id = ?', [req.user!.uid]);
  if (!me || !verifyPassword(currentPassword, me.password_hash)) return res.status(401).json({ error: 'Your current password is not correct' });
  if (verifyPassword(newPassword, me.password_hash)) return res.status(400).json({ error: 'Choose a password you have not used here before' });
  await run('UPDATE users SET password_hash = ?, reset_token_hash = NULL, reset_expires_at = NULL, must_change_password = 0 WHERE id = ?', [hashPassword(newPassword), me.id]);
  await writeAudit(req.user, 'password_change', 'user', me.id);
  return res.json({ ok: true });
});

// ---------------------------------------------------------------------------
// Admin user management. With self-registration closed, this is the only way
// people get accounts, so add and remove both have to work.
// ---------------------------------------------------------------------------

const newUserSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8).max(200),
  name: z.string().max(120).optional(),
  role: z.enum(['admin', 'editor', 'viewer']).default('viewer'),
});
authRouter.post('/users', requireAuth, requireRole('admin'), async (req, res) => {
  const parsed = newUserSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { email, password, name, role } = parsed.data;
  const addr = email.toLowerCase().trim();
  const existing = await one('SELECT id FROM users WHERE email = ?', [addr]);
  if (existing) return res.status(409).json({ error: 'That email already has an account' });
  const info = await run('INSERT INTO users (email, password_hash, name, role, must_change_password) VALUES (?, ?, ?, ?, 1)',
    [addr, hashPassword(password), name || '', role]);
  await writeAudit(req.user, 'create_user', 'user', info.insertId, { email: addr, role });
  return res.status(201).json({ user: { id: info.insertId, email: addr, name: name || '', role } });
});

authRouter.delete('/users/:id', requireAuth, requireRole('admin'), async (req, res) => {
  const id = Number(req.params.id);
  if (id === req.user!.uid) return res.status(400).json({ error: 'You cannot remove your own account' });
  const target = await one<{ id: number; email: string; role: Role }>('SELECT id, email, role FROM users WHERE id = ?', [id]);
  if (!target) return res.status(404).json({ error: 'User not found' });
  if (target.role === 'admin') {
    const admins = await one<{ n: number }>("SELECT COUNT(*) AS n FROM users WHERE role = 'admin'");
    if (Number(admins!.n) <= 1) return res.status(400).json({ error: 'This is the only admin. Promote someone else first.' });
  }
  // contacts they own fall back to unowned; their pipeline rows go with them
  await run('DELETE FROM users WHERE id = ?', [id]);
  await writeAudit(req.user, 'delete_user', 'user', id, { email: target.email });
  return res.json({ ok: true });
});

// admin sets someone's password directly. This is the fallback when SMTP is
// not configured, and the way a new hire gets their first password.
const setPwSchema = z.object({ password: z.string().min(8).max(200) });
authRouter.post('/users/:id/password', requireAuth, requireRole('admin'), async (req, res) => {
  const parsed = setPwSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Password must be at least 8 characters' });
  const id = Number(req.params.id);
  const target = await one<{ id: number; email: string }>('SELECT id, email FROM users WHERE id = ?', [id]);
  if (!target) return res.status(404).json({ error: 'User not found' });
  await run('UPDATE users SET password_hash = ?, reset_token_hash = NULL, reset_expires_at = NULL, must_change_password = 1 WHERE id = ?',
    [hashPassword(parsed.data.password), id]);
  await writeAudit(req.user, 'admin_set_password', 'user', id, { email: target.email });
  return res.json({ ok: true });
});

// POST /api/auth/test-email -> sends a test message to the signed-in admin, so
// SMTP configuration is verifiable from inside the app instead of guessed at.
authRouter.post('/test-email', requireAuth, requireRole('admin'), async (req, res) => {
  if (!mailConfigured()) {
    return res.status(400).json({ error: 'SMTP is not configured. Set SMTP_HOST and SMTP_FROM (and SMTP_USER/SMTP_PASS if your relay needs them) in the server .env, then restart the API.' });
  }
  try {
    await sendMail(req.user!.email, 'Capital Book test email',
      'This is a test message from Capital Book. If you are reading it, outbound email works and "Forgot password?" is live.');
    await writeAudit(req.user, 'test_email', 'user', req.user!.uid);
    return res.json({ ok: true, to: req.user!.email });
  } catch (e: any) {
    return res.status(502).json({ error: 'SMTP is configured but sending failed: ' + String(e && e.message || e) });
  }
});
