import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import type { Request, Response, NextFunction } from 'express';
import type { JwtPayload, Role } from './types.js';

const JWT_SECRET = process.env.JWT_SECRET || 'dev-secret-change-me-in-production';
const JWT_EXPIRES = process.env.JWT_EXPIRES || '12h';

export function hashPassword(plain: string): string {
  return bcrypt.hashSync(plain, 10);
}
export function verifyPassword(plain: string, hash: string): boolean {
  return bcrypt.compareSync(plain, hash);
}
export function signToken(payload: JwtPayload): string {
  const options = { expiresIn: JWT_EXPIRES } as jwt.SignOptions;
  return jwt.sign(payload, JWT_SECRET, options);
}
export function verifyToken(token: string): JwtPayload | null {
  try { return jwt.verify(token, JWT_SECRET) as JwtPayload; } catch { return null; }
}

// Require a valid bearer token; attaches req.user
export function requireAuth(req: Request, res: Response, next: NextFunction): void {
  const header = req.headers.authorization || '';
  const token = header.startsWith('Bearer ') ? header.slice(7) : '';
  const payload = token ? verifyToken(token) : null;
  if (!payload) { res.status(401).json({ error: 'Unauthorized' }); return; }
  req.user = payload;
  next();
}

// Require at least the given role (admin > editor > viewer)
const RANK: Record<Role, number> = { viewer: 1, editor: 2, admin: 3 };
export function requireRole(min: Role) {
  return (req: Request, res: Response, next: NextFunction): void => {
    if (!req.user) { res.status(401).json({ error: 'Unauthorized' }); return; }
    if (RANK[req.user.role] < RANK[min]) {
      res.status(403).json({ error: 'Forbidden: requires ' + min + ' role' });
      return;
    }
    next();
  };
}

// Require the single super-admin account rather than just any admin. Used for
// contacts CSV import, which can overwrite large parts of the book in one request.
const SUPER_ADMIN_EMAIL = (process.env.SUPER_ADMIN_EMAIL || 'admin@capitalbook.local').toLowerCase();
export function requireSuperAdmin(req: Request, res: Response, next: NextFunction): void {
  if (!req.user) { res.status(401).json({ error: 'Unauthorized' }); return; }
  if ((req.user.email || '').toLowerCase() !== SUPER_ADMIN_EMAIL) {
    res.status(403).json({ error: 'Forbidden: only the super admin can import contacts' });
    return;
  }
  next();
}

// Require admin AND membership in Capital Book's own "platform" organization.
// A client org's own admin manages their own team, but org creation and
// cross-org user placement are platform-only.
export function requirePlatformAdmin(req: Request, res: Response, next: NextFunction): void {
  if (!req.user) { res.status(401).json({ error: 'Unauthorized' }); return; }
  if (req.user.role !== 'admin' || !req.user.isPlatformOrg) {
    res.status(403).json({ error: 'Forbidden: requires a Capital Book platform admin' });
    return;
  }
  next();
}

// ---------------------------------------------------------------------------
// Org scoping. Every query that reads from a table with an org_id column
// (contacts, templates, audit_log) narrows to the caller's own org, UNLESS
// the caller belongs to the platform org, in which case they see across
// every org — identical to the app's single-tenant behavior before
// multi-org support existed.
// ---------------------------------------------------------------------------
export function orgScope(req: Request, col = 'c.org_id'): { sql: string; params: unknown[] } {
  if (req.user!.isPlatformOrg) return { sql: '', params: [] };
  return { sql: `${col} = ?`, params: [req.user!.orgId] };
}
