import { Router } from 'express';
import { z } from 'zod';
import { q, one, run } from '../db.js';
import { requireAuth, requireRole } from '../auth.js';
import { writeAudit } from '../audit.js';

export const templatesRouter = Router();

const tplSchema = z.object({
  name: z.string().min(1).max(160),
  subject: z.string().max(300).default(''),
  body: z.string().max(20000).default(''),
});

// the contact fields available as {{placeholders}} in a template
function mergeFields(c: Record<string, any>): Record<string, string> {
  const first = String(c.name || '').trim().split(/\s+/)[0] || '';
  return {
    name: c.name || '', first_name: first, title: c.title || '', firm: c.firm || '',
    segment: c.segment || '', city: c.city || '', state: c.state || '', country: c.country || '',
    email: c.email || '', aum_tier: c.aum_tier || '',
  };
}
function render(text: string, fields: Record<string, string>): string {
  return String(text || '').replace(/\{\{\s*([a-z_]+)\s*\}\}/gi, (m, key) => {
    const k = String(key).toLowerCase();
    return k in fields ? fields[k] : m; // leave unknown tokens visible
  });
}

templatesRouter.get('/', requireAuth, async (_req, res) => {
  const rows = await q('SELECT id, name, subject, body, created_by, created_at FROM templates ORDER BY name');
  return res.json({ templates: rows });
});

templatesRouter.post('/', requireAuth, requireRole('editor'), async (req, res) => {
  const parsed = tplSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { name, subject, body } = parsed.data;
  const info = await run('INSERT INTO templates (name, subject, body, created_by) VALUES (?, ?, ?, ?)', [name.trim(), subject, body, req.user!.uid]);
  await writeAudit(req.user, 'template_create', 'template', info.insertId, { name });
  return res.status(201).json({ template: await one('SELECT id, name, subject, body FROM templates WHERE id = ?', [info.insertId]) });
});

templatesRouter.patch('/:id', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  const existing = await one<any>('SELECT * FROM templates WHERE id = ?', [id]);
  if (!existing) return res.status(404).json({ error: 'Template not found' });
  const parsed = tplSchema.partial().safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input' });
  const name = parsed.data.name ?? existing.name;
  const subject = parsed.data.subject ?? existing.subject;
  const body = parsed.data.body ?? existing.body;
  await run('UPDATE templates SET name = ?, subject = ?, body = ? WHERE id = ?', [name, subject, body, id]);
  await writeAudit(req.user, 'template_update', 'template', id);
  return res.json({ template: await one('SELECT id, name, subject, body FROM templates WHERE id = ?', [id]) });
});

templatesRouter.delete('/:id', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  const row = await one<{ created_by: number; name: string }>('SELECT created_by, name FROM templates WHERE id = ?', [id]);
  if (!row) return res.status(404).json({ error: 'Template not found' });
  if (row.created_by !== req.user!.uid && req.user!.role !== 'admin') return res.status(403).json({ error: 'Only the author or an admin can delete this' });
  await run('DELETE FROM templates WHERE id = ?', [id]);
  await writeAudit(req.user, 'template_delete', 'template', id, { name: row.name });
  return res.json({ ok: true });
});

// POST /api/templates/:id/render  body { contactId } -> merged subject/body for that contact
templatesRouter.post('/:id/render', requireAuth, async (req, res) => {
  const id = Number(req.params.id);
  const tpl = await one<{ name: string; subject: string; body: string }>('SELECT name, subject, body FROM templates WHERE id = ?', [id]);
  if (!tpl) return res.status(404).json({ error: 'Template not found' });
  const contactId = Number(req.body?.contactId);
  const c = await one<Record<string, any>>('SELECT * FROM contacts WHERE id = ?', [contactId]);
  if (!c) return res.status(404).json({ error: 'Contact not found' });
  const fields = mergeFields(c);
  return res.json({ to: c.email || '', subject: render(tpl.subject, fields), body: render(tpl.body, fields) });
});
