import { Router } from 'express';
import { q } from '../db.js';
import { requireAuth, requireRole } from '../auth.js';

export const auditRouter = Router();

// GET /api/audit?limit=100  (admin only)
auditRouter.get('/', requireAuth, requireRole('admin'), async (req, res) => {
  const limit = Math.min(1000, Math.max(1, parseInt(String(req.query.limit || '100'), 10) || 100));
  const rows = await q(`SELECT id, user_id, user_email, action, entity, entity_id, detail, created_at FROM audit_log ORDER BY id DESC LIMIT ${limit}`);
  return res.json({ audit: rows });
});
