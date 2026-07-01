import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth, requireRole } from '../auth.js';
import { writeAudit } from '../audit.js';

export const tagsRouter = Router();

const tagSchema = z.object({ name: z.string().min(1).max(60), color: z.string().regex(/^#[0-9a-fA-F]{6}$/).optional() });

// GET /api/tags -> all tags with how many contacts carry each
tagsRouter.get('/tags', requireAuth, async (_req, res) => {
  const rows = await q(
    `SELECT t.id, t.name, t.color, COUNT(ct.contact_id) AS count
     FROM tags t LEFT JOIN contact_tags ct ON ct.tag_id = t.id
     GROUP BY t.id ORDER BY t.name`
  );
  return res.json({ tags: rows });
});

// POST /api/tags -> create (editor or admin)
tagsRouter.post('/tags', requireAuth, requireRole('editor'), async (req, res) => {
  const parsed = tagSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input' });
  const name = parsed.data.name.trim();
  if (await one('SELECT id FROM tags WHERE name = ?', [name])) return res.status(409).json({ error: 'Tag already exists' });
  const info = await run('INSERT INTO tags (name, color) VALUES (?, ?)', [name, parsed.data.color || '#6B7787']);
  await writeAudit(req.user, 'tag_create', 'tag', info.insertId, { name });
  return res.status(201).json({ tag: await one('SELECT id, name, color FROM tags WHERE id = ?', [info.insertId]) });
});

// DELETE /api/tags/:id -> remove a tag everywhere (admin)
tagsRouter.delete('/tags/:id', requireAuth, requireRole('admin'), async (req, res) => {
  const id = Number(req.params.id);
  if (!(await one('SELECT id FROM tags WHERE id = ?', [id]))) return res.status(404).json({ error: 'Tag not found' });
  await run('DELETE FROM tags WHERE id = ?', [id]);
  await writeAudit(req.user, 'tag_delete', 'tag', id);
  return res.json({ ok: true });
});

// GET /api/contacts/:id/tags
tagsRouter.get('/contacts/:id/tags', requireAuth, async (req, res) => {
  const rows = await q('SELECT t.id, t.name, t.color FROM tags t JOIN contact_tags ct ON ct.tag_id = t.id WHERE ct.contact_id = ? ORDER BY t.name', [Number(req.params.id)]);
  return res.json({ tags: rows });
});

// POST /api/contacts/:id/tags -> attach by {tagId} or {name} (created if new). editor or admin
tagsRouter.post('/contacts/:id/tags', requireAuth, requireRole('editor'), async (req, res) => {
  const contactId = Number(req.params.id);
  if (!(await one('SELECT id FROM contacts WHERE id = ?', [contactId]))) return res.status(404).json({ error: 'Contact not found' });
  let tagId = req.body?.tagId ? Number(req.body.tagId) : 0;
  const name = typeof req.body?.name === 'string' ? req.body.name.trim() : '';
  if (!tagId && name) {
    const found = await one<{ id: number }>('SELECT id FROM tags WHERE name = ?', [name]);
    tagId = found ? found.id : (await run('INSERT INTO tags (name) VALUES (?)', [name])).insertId;
  }
  if (!tagId) return res.status(400).json({ error: 'Provide tagId or name' });
  if (!(await one('SELECT id FROM tags WHERE id = ?', [tagId]))) return res.status(404).json({ error: 'Tag not found' });
  await run('INSERT IGNORE INTO contact_tags (contact_id, tag_id) VALUES (?, ?)', [contactId, tagId]);
  await writeAudit(req.user, 'tag_attach', 'contact', contactId, { tagId });
  const tags = await q('SELECT t.id, t.name, t.color FROM tags t JOIN contact_tags ct ON ct.tag_id = t.id WHERE ct.contact_id = ? ORDER BY t.name', [contactId]);
  return res.status(201).json({ tags });
});

// DELETE /api/contacts/:id/tags/:tagId -> detach (editor or admin)
tagsRouter.delete('/contacts/:id/tags/:tagId', requireAuth, requireRole('editor'), async (req, res) => {
  const contactId = Number(req.params.id);
  const tagId = Number(req.params.tagId);
  await run('DELETE FROM contact_tags WHERE contact_id = ? AND tag_id = ?', [contactId, tagId]);
  await writeAudit(req.user, 'tag_detach', 'contact', contactId, { tagId });
  return res.json({ ok: true });
});
