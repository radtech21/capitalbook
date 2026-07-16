import { Router } from 'express';
import { q } from '../db.js';
import { requireAuth, requireRole } from '../auth.js';

export const auditRouter = Router();

// GET /api/audit?limit=100  (admin only)
// entity/entity_id only ever recorded a generic type + numeric id, so the "on"
// column used to render as e.g. "contact 1236" or "user 1". Resolve the real
// name here via a per-entity-type join (one is null unless its type matches);
// deleted rows fall back to the name captured in `detail` at write time.
auditRouter.get('/', requireAuth, requireRole('admin'), async (req, res) => {
  const limit = Math.min(1000, Math.max(1, parseInt(String(req.query.limit || '100'), 10) || 100));
  const rows = await q(
    `SELECT a.id, a.user_id, a.user_email, a.action, a.entity, a.entity_id, a.detail, a.created_at,
            c.name   AS contact_name,
            tu.name  AS target_user_name, tu.email AS target_user_email,
            tk.title AS task_title,
            tg.name  AS tag_name,
            tp.name  AS template_name,
            v.name   AS view_name
     FROM audit_log a
     LEFT JOIN contacts     c  ON a.entity = 'contact'  AND a.entity_id = CAST(c.id  AS CHAR)
     LEFT JOIN users        tu ON a.entity = 'user'     AND a.entity_id = CAST(tu.id AS CHAR)
     LEFT JOIN tasks        tk ON a.entity = 'task'     AND a.entity_id = CAST(tk.id AS CHAR)
     LEFT JOIN tags         tg ON a.entity = 'tag'      AND a.entity_id = CAST(tg.id AS CHAR)
     LEFT JOIN templates    tp ON a.entity = 'template' AND a.entity_id = CAST(tp.id AS CHAR)
     LEFT JOIN saved_views  v  ON a.entity = 'view'     AND a.entity_id = CAST(v.id  AS CHAR)
     ORDER BY a.id DESC LIMIT ${limit}`
  );
  return res.json({ audit: rows });
});
