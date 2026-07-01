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
