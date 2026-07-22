import { Router } from 'express';
import { z } from 'zod';
import { q, one, run, tx } from '../db.js';
import { requireAuth, requireRole, requireSuperAdmin, orgScope } from '../auth.js';
import { writeAudit } from '../audit.js';

export const contactsRouter = Router();

const SORT_COLUMNS: Record<string, string> = {
  a: 'c.aum_mm', ls: 'c.lead_score', pr: 'c.priority', r25: 'c.state_rank', n: 'c.name',
};
const BOOL_FILTERS: Record<string, string> = {
  reachable: 'c.reachable', uhnw: 'c.uhnw', institutional: 'c.institutional', foundation: 'c.foundation',
};

// columns that may be written by create/edit/import (id handled separately)
const WRITABLE = [
  'name', 'title', 'firm', 'segment', 'priority', 'lead_score', 'email', 'email_status', 'phone',
  'city', 'address', 'state', 'country', 'sub_region', 'aum_mm', 'aum_tier', 'net_worth_mm', 'firm_type',
  'state_rank', 'rank_movement', 'uhnw', 'institutional', 'foundation', 'client_types', 'reachable',
  'source_list', 'data_flags',
] as const;

// The country filter offers exactly three buckets in the UI — Canada, USA, Other —
// rather than the ~40 raw country strings in the data. 'Other' covers everything
// that isn't Canada or the United States, so the three buckets always add up to
// the whole book. Falls back to an exact match for any other value (e.g. a saved
// view stored before this change, which may hold a raw country name).
function countryBucketWhere(bucket: string, col = 'c.country'): { sql: string; params: unknown[] } {
  if (bucket === 'Canada') return { sql: `${col} = ?`, params: ['Canada'] };
  if (bucket === 'USA') return { sql: `${col} = ?`, params: ['United States'] };
  if (bucket === 'Other') return { sql: `${col} NOT IN ('Canada', 'United States')`, params: [] };
  return { sql: `${col} = ?`, params: [bucket] };
}

// shared filter builder used by list and CSV export. Returns the WHERE clause and
// its params (the pipeline join's user_id is prepended by the caller).
function buildFilter(req: any): { whereSql: string; params: unknown[] } {
  const where: string[] = [];
  const params: unknown[] = [];
  const term = String(req.query.q || '').trim().toLowerCase();
  if (term) {
    where.push(
      `(LOWER(c.name) LIKE ? OR LOWER(c.firm) LIKE ? OR LOWER(c.email) LIKE ? OR LOWER(c.city) LIKE ?
        OR EXISTS (SELECT 1 FROM contact_people cp WHERE cp.contact_id = c.id
                   AND (LOWER(cp.name) LIKE ? OR LOWER(cp.email) LIKE ?)))`
    );
    const like = '%' + term + '%';
    params.push(like, like, like, like, like, like);
  }
  for (const [param, col] of [['segment', 'c.segment'], ['priority', 'c.priority'], ['state', 'c.state'], ['city', 'c.city'], ['tier', 'c.aum_tier'], ['source', 'c.source_list'], ['firmtype', 'c.firm_type'], ['emailstatus', 'c.email_status']] as const) {
    const v = req.query[param];
    if (v) { where.push(`${col} = ?`); params.push(String(v)); }
  }
  if (req.query.country) {
    const { sql, params: bucketParams } = countryBucketWhere(String(req.query.country));
    where.push(sql); params.push(...bucketParams);
  }
  for (const [param, col] of Object.entries(BOOL_FILTERS)) {
    if (req.query[param] === 'true' || req.query[param] === '1') where.push(`${col} = 1`);
  }
  if (req.query.flag === 'true' || req.query.flag === '1') where.push("c.data_flags <> ''");
  // no email at all: 626 of the book. These are the ones you cannot reach.
  if (req.query.noemail === 'true' || req.query.noemail === '1') where.push("(c.email IS NULL OR c.email = '')");
  // never entered your pipeline: the untouched names
  if (req.query.nopipeline === 'true' || req.query.nopipeline === '1') where.push('p.status IS NULL');
  if (req.query.status) { where.push('p.status = ?'); params.push(String(req.query.status)); }
  if (req.query.due === 'true' || req.query.due === '1') where.push("p.due IS NOT NULL AND p.due <> '' AND p.due <= CURDATE()");
  if (req.query.tag) { where.push('c.id IN (SELECT contact_id FROM contact_tags WHERE tag_id = ?)'); params.push(Number(req.query.tag)); }
  if (req.query.owner) {
    const o = String(req.query.owner);
    if (o === 'none') where.push('c.owner_id IS NULL');
    else if (o === 'me') { where.push('c.owner_id = ?'); params.push(req.user!.uid); }
    else { where.push('c.owner_id = ?'); params.push(Number(o)); }
  }
  const org = orgScope(req);
  if (org.sql) { where.push(org.sql); params.push(...org.params); }
  return { whereSql: where.length ? 'WHERE ' + where.join(' AND ') : '', params };
}

// GET /api/contacts/report?by=<dimension>
// The current filtered view, grouped by one dimension, with the rollups a desk
// actually asks for: how many, how much AUM, how many in my pipeline, how much
// open opportunity. Same buildFilter and same join as the list, so the numbers
// always reconcile with what is on screen. This is Sales Nebula's report builder
// distilled to the one query shape this desk uses.
const REPORT_DIMS: Record<string, string> = {
  firmtype: 'c.firm_type', segment: 'c.segment', country: 'c.country', state: 'c.state',
  tier: 'c.aum_tier', priority: 'c.priority', emailstatus: 'c.email_status',
  source: 'c.source_list', status: 'p.status', owner: "COALESCE(ou.email, '')",
};
contactsRouter.get('/report', requireAuth, async (req, res) => {
  const by = String(req.query.by || 'firmtype');
  const dim = REPORT_DIMS[by];
  if (!dim) return res.status(400).json({ error: 'Unknown dimension', allowed: Object.keys(REPORT_DIMS) });
  const { whereSql, params } = buildFilter(req);
  const join = 'LEFT JOIN pipeline p ON p.contact_id = c.id AND p.user_id = ? LEFT JOIN users ou ON ou.id = c.owner_id';
  const rows = await q(
    `SELECT COALESCE(NULLIF(${dim}, ''), '(blank)') AS bucket,
            COUNT(*) AS contacts,
            COALESCE(SUM(c.aum_mm), 0) AS aum_mm,
            SUM(CASE WHEN p.status IS NOT NULL THEN 1 ELSE 0 END) AS in_pipeline,
            COALESCE(SUM(CASE WHEN p.status IS NOT NULL AND p.status <> 'Passed' THEN p.opp ELSE 0 END), 0) AS open_opp
     FROM contacts c ${join} ${whereSql}
     GROUP BY bucket
     ORDER BY contacts DESC, bucket ASC
     LIMIT 100`,
    [req.user!.uid, ...params]
  );
  return res.json({ by, rows });
});

// GET /api/contacts -> filtered, sorted, paginated list
contactsRouter.get('/', requireAuth, async (req, res) => {
  const { whereSql, params } = buildFilter(req);
  const sortKey = SORT_COLUMNS[String(req.query.sort || 'a')] || 'c.aum_mm';
  const dir = String(req.query.dir || 'desc').toLowerCase() === 'asc' ? 'ASC' : 'DESC';
  const page = Math.max(1, parseInt(String(req.query.page || '1'), 10) || 1);
  const pageSize = Math.min(200, Math.max(1, parseInt(String(req.query.pageSize || '60'), 10) || 60));
  const offset = (page - 1) * pageSize;
  const join = 'LEFT JOIN pipeline p ON p.contact_id = c.id AND p.user_id = ? LEFT JOIN users ou ON ou.id = c.owner_id';

  const countRow = await one<{ n: number }>(`SELECT COUNT(*) AS n FROM contacts c ${join} ${whereSql}`, [req.user!.uid, ...params]);
  const total = countRow ? Number(countRow.n) : 0;
  const rows = await q(
    `SELECT c.id, c.name, c.title, c.firm, c.segment, c.priority, c.lead_score,
            c.email, c.email_status, c.phone, c.city, c.state, c.country,
            c.aum_mm, c.aum_tier, c.firm_type, c.state_rank, c.uhnw, c.institutional,
            c.foundation, c.reachable, c.source_list, c.data_flags, c.owner_id,
            ou.email AS owner_email, ou.name AS owner_name,
            p.status AS pipe_status, p.due AS pipe_due, p.opp AS pipe_opp
     FROM contacts c ${join} ${whereSql}
     ORDER BY (${sortKey} IS NULL), ${sortKey} ${dir}, c.id ASC
     LIMIT ${pageSize} OFFSET ${offset}`,
    [req.user!.uid, ...params]
  );
  return res.json({ total, page, pageSize, pages: Math.ceil(total / pageSize), rows });
});

// distinct filter option values
contactsRouter.get('/meta', requireAuth, async (req, res) => {
  // Filter option lists only ever offer values that exist within the caller's
  // own org (platform org sees everything, unchanged from before multi-org).
  const org = orgScope(req, 'org_id');
  const orgAnd = org.sql ? ` AND ${org.sql}` : '';

  const distinct = async (col: string) =>
    (await q<{ v: string }>(`SELECT DISTINCT ${col} AS v FROM contacts WHERE ${col} <> ''${orgAnd} ORDER BY v`, org.params)).map((r) => r.v);

  // Geography narrows in three steps: country -> province/state -> city. There
  // are 54 US states and 550 cities across the book, so each list is scoped to
  // what sits above it rather than shown all at once. Ordered by size then name,
  // so the places you actually cover lead the dropdown.
  const country = req.query.country ? String(req.query.country) : '';
  const stateSel = req.query.state ? String(req.query.state) : '';
  const countryClause = country ? countryBucketWhere(country, 'country') : null;

  const states = await q<{ v: string; n: number }>(
    `SELECT state AS v, COUNT(*) AS n FROM contacts
      WHERE state <> ''${countryClause ? ' AND ' + countryClause.sql : ''}${orgAnd}
      GROUP BY state ORDER BY n DESC, v ASC`,
    [...(countryClause ? countryClause.params : []), ...org.params]
  );

  const cityWhere: string[] = ["city <> ''"];
  const cityParams: unknown[] = [];
  if (countryClause) { cityWhere.push(countryClause.sql); cityParams.push(...countryClause.params); }
  if (stateSel) { cityWhere.push('state = ?'); cityParams.push(stateSel); }
  if (org.sql) { cityWhere.push(org.sql); cityParams.push(...org.params); }
  const cities = await q<{ v: string; n: number }>(
    `SELECT city AS v, COUNT(*) AS n FROM contacts
      WHERE ${cityWhere.join(' AND ')}
      GROUP BY city ORDER BY n DESC, v ASC`,
    cityParams
  );

  return res.json({
    segments: await distinct('segment'), countries: await distinct('country'), tiers: await distinct('aum_tier'),
    priorities: await distinct('priority'), sources: await distinct('source_list'),
    // firm_type has a long tail (89 distinct values); biggest first puts the
    // eight that matter at the top of the dropdown instead of alphabetical noise
    firmTypes: (await q<{ v: string }>(
      `SELECT firm_type AS v FROM contacts WHERE firm_type <> ''${orgAnd} GROUP BY firm_type ORDER BY COUNT(*) DESC, v ASC`, org.params
    )).map((r) => r.v),
    emailStatuses: (await q<{ v: string }>(
      `SELECT email_status AS v FROM contacts WHERE email_status <> ''${orgAnd} GROUP BY email_status ORDER BY COUNT(*) DESC, v ASC`, org.params
    )).map((r) => r.v),
    states: states.map((r) => ({ name: r.v, count: Number(r.n) })),
    cities: cities.map((r) => ({ name: r.v, count: Number(r.n) })),
  });
});

// GET /api/contacts/export.csv -> filtered set as CSV (must precede /:id)
function csvCell(v: unknown): string {
  if (v == null) return '';
  const s = String(v);
  return /[",\n]/.test(s) ? '"' + s.replace(/"/g, '""') + '"' : s;
}
contactsRouter.get('/export.csv', requireAuth, async (req, res) => {
  const { whereSql, params } = buildFilter(req);
  const join = 'LEFT JOIN pipeline p ON p.contact_id = c.id AND p.user_id = ?';
  const rows = await q<Record<string, unknown>>(
    `SELECT c.id, c.name, c.title, c.firm, c.segment, c.priority, c.lead_score, c.email,
            c.email_status, c.phone, c.address, c.city, c.state, c.country, c.aum_mm, c.aum_tier,
            c.firm_type, c.source_list, c.data_flags,
            p.status AS pipeline_status, p.due AS follow_up, p.opp AS opportunity_mm, p.poc, p.note
     FROM contacts c ${join} ${whereSql}
     ORDER BY (c.aum_mm IS NULL), c.aum_mm DESC, c.id ASC`,
    [req.user!.uid, ...params]
  );
  const headers = ['id', 'name', 'title', 'firm', 'segment', 'priority', 'lead_score', 'email', 'email_status', 'phone', 'address', 'city', 'state', 'country', 'aum_mm', 'aum_tier', 'firm_type', 'source_list', 'data_flags', 'pipeline_status', 'follow_up', 'opportunity_mm', 'poc', 'note'];
  const lines = [headers.join(',')];
  for (const r of rows) lines.push(headers.map((h) => csvCell(r[h])).join(','));
  await writeAudit(req.user, 'export_csv', 'contacts', rows.length);
  res.setHeader('Content-Type', 'text/csv; charset=utf-8');
  res.setHeader('Content-Disposition', 'attachment; filename="capital-book-export.csv"');
  return res.send(lines.join('\n'));
});

// Shared by this file and other route files (pipeline/tasks/activities/tags/
// templates) that reference a contact_id and must confirm it belongs to the
// caller's own org before reading/writing against it. Platform org bypasses
// the check, matching the app's single-tenant behavior before multi-org.
export async function contactInOrg(req: any, id: number): Promise<boolean> {
  if (req.user!.isPlatformOrg) return !!(await one('SELECT id FROM contacts WHERE id = ?', [id]));
  return !!(await one('SELECT id FROM contacts WHERE id = ? AND org_id = ?', [id, req.user!.orgId]));
}

// POST /api/contacts -> create (admin)
const createSchema = z.object({
  name: z.string().min(1).max(300),
  firm: z.string().max(300).optional(),
  segment: z.string().max(120).optional(),
  email: z.string().max(200).optional(),
  priority: z.string().max(4).optional(),
}).passthrough();
// Editors can enter a contact they meet; bulk import stays admin-only. This was
// admin-only by design originally; opened to editors on explicit instruction.
contactsRouter.post('/', requireAuth, requireRole('editor'), async (req, res) => {
  const parsed = createSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const next = Number((await one<{ n: number }>('SELECT COALESCE(MAX(id),0)+1 AS n FROM contacts'))!.n);
  const body = req.body as Record<string, unknown>;
  // A contact you create always lands in your own org, including for platform
  // users (whose org_id is the platform org).
  const cols = ['id', 'org_id', ...WRITABLE];
  const vals = cols.map((c) => (c === 'id' ? next : c === 'org_id' ? req.user!.orgId : body[c] ?? defaultFor(c)));
  await run(`INSERT INTO contacts (${cols.join(',')}) VALUES (${cols.map(() => '?').join(',')})`, vals);
  await writeAudit(req.user, 'contact_create', 'contact', next, { name: body.name });
  return res.status(201).json({ contact: await one('SELECT * FROM contacts WHERE id = ?', [next]) });
});

// PATCH /api/contacts/:id -> edit selected fields (editor or admin)
contactsRouter.patch('/:id', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  if (!(await contactInOrg(req, id))) return res.status(404).json({ error: 'Contact not found' });
  const body = req.body as Record<string, unknown>;
  const sets: string[] = [];
  const vals: unknown[] = [];
  for (const col of WRITABLE) {
    if (col in body) { sets.push(`${col} = ?`); vals.push(coerce(col, body[col])); }
  }
  if (!sets.length) return res.status(400).json({ error: 'No writable fields provided' });
  vals.push(id);
  await run(`UPDATE contacts SET ${sets.join(', ')} WHERE id = ?`, vals);
  await writeAudit(req.user, 'contact_update', 'contact', id, { fields: sets.map((s) => s.split(' ')[0]) });
  return res.json({ contact: await one('SELECT * FROM contacts WHERE id = ?', [id]) });
});

// POST /api/contacts/import -> bulk upsert (super admin only). Body: { contacts: [...] } or { csv: "..." },
// plus an optional top-level orgId (defaults to the platform org, 1) so a
// future list (e.g. a client org's own contact set) can be imported straight
// into that org instead of Capital Book's.
contactsRouter.post('/import', requireAuth, requireSuperAdmin, async (req, res) => {
  let arr: unknown;
  if (req.body && typeof req.body.csv === 'string') {
    try { arr = csvToObjects(req.body.csv); }
    catch (e) { return res.status(400).json({ error: 'CSV parse failed', detail: String(e) }); }
  } else {
    arr = (req.body && (req.body.contacts || req.body)) as unknown;
  }
  if (!Array.isArray(arr)) return res.status(400).json({ error: 'Body must be { contacts: [...] }, { csv: "..." }, or an array' });
  const orgId = req.body?.orgId != null ? Number(req.body.orgId) : 1;
  if (!(await one('SELECT id FROM organizations WHERE id = ?', [orgId]))) return res.status(404).json({ error: 'Organization not found' });

  // Rows are matched to existing contacts by EMAIL, not just by id. An advisor
  // list from any outside source has no id column, so matching on id alone would
  // mint a fresh id for every row and duplicate the entire book on the first
  // refresh. Email is the only stable key such a list actually carries. Matching
  // is scoped to the target org, so importing into a client org can never
  // silently overwrite a same-email contact that belongs to a different org.
  const emailRows = await q<{ e: string; i: number }>(
    "SELECT LOWER(email) AS e, MIN(id) AS i FROM contacts WHERE email IS NOT NULL AND email <> '' AND org_id = ? GROUP BY LOWER(email)",
    [orgId]
  );
  const byEmail = new Map(emailRows.map((r) => [r.e, Number(r.i)]));

  let next = Number((await one<{ n: number }>('SELECT COALESCE(MAX(id),0)+1 AS n FROM contacts'))!.n);
  let imported = 0, created = 0, updated = 0;
  try {
    await tx(async (conn) => {
      for (const raw of arr as unknown[]) {
        if (!raw || typeof raw !== 'object') continue;
        const rec = raw as Record<string, unknown>;
        if (!rec.name) continue;

        const email = rec.email != null ? String(rec.email).trim().toLowerCase() : '';
        let id: number;
        let isNew = false;
        if (rec.id != null) { id = Number(rec.id); updated++; }
        else if (email && byEmail.has(email)) { id = byEmail.get(email)!; updated++; }
        else { id = next++; if (email) byEmail.set(email, id); created++; isNew = true; }

        // Only touch the columns the file actually supplies. A partial list (say
        // name, email, firm) must never blank a phone number, city, or AUM that
        // is already on file. New rows get sensible defaults for the rest.
        const present = WRITABLE.filter((c) => c in rec);
        const insertCols = isNew ? ['id', 'org_id', ...WRITABLE] : ['id', ...present];
        const insertVals = insertCols.map((c) =>
          c === 'id' ? id : c === 'org_id' ? orgId : c in rec ? coerce(c, rec[c]) : defaultFor(c)
        );
        const updateCols = present.length ? present : ['name'];
        const sql =
          `INSERT INTO contacts (${insertCols.join(',')}) VALUES (${insertCols.map(() => '?').join(',')})` +
          ` ON DUPLICATE KEY UPDATE ${updateCols.map((c) => `${c} = VALUES(${c})`).join(', ')}`;
        await conn.query(sql, insertVals);
        imported++;
      }
    });
  } catch (e) {
    return res.status(400).json({ error: 'Import failed', detail: String(e) });
  }
  await writeAudit(req.user, 'import_contacts', 'contacts', imported, { created, updated, orgId });
  const total = Number((await one<{ n: number }>('SELECT COUNT(*) AS n FROM contacts WHERE org_id = ?', [orgId]))!.n);
  return res.json({ imported, created, updated, total });
});

// POST /api/contacts/bulk -> apply one action to many contacts (editor or admin)
const bulkSchema = z.object({
  ids: z.array(z.number().int()).min(1).max(2000),
  action: z.enum(['pipeline', 'tag', 'untag', 'task', 'assign', 'assign_org']),
  status: z.string().max(40).optional(),
  due: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).nullable().optional(),
  tagId: z.number().int().optional(),
  name: z.string().max(60).optional(),
  title: z.string().max(300).optional(),
  ownerId: z.number().int().nullable().optional(),
  orgId: z.number().int().optional(),
});
contactsRouter.post('/bulk', requireAuth, requireRole('editor'), async (req, res) => {
  const parsed = bulkSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { action } = parsed.data;
  // assign_org moves contacts BETWEEN orgs, so it is platform-admin only and
  // deliberately sees across every org — every other action stays scoped to
  // contacts the caller can already see.
  if (action === 'assign_org' && !(req.user!.role === 'admin' && req.user!.isPlatformOrg)) {
    return res.status(403).json({ error: 'Forbidden: requires a Capital Book platform admin' });
  }
  const org = orgScope(req);
  const orgAnd = action === 'assign_org' ? '' : (org.sql ? ` AND ${org.sql}` : '');
  const placeholders = parsed.data.ids.map(() => '?').join(',');
  const ids = (await q<{ id: number }>(
    `SELECT id FROM contacts WHERE id IN (${placeholders})${orgAnd}`,
    action === 'assign_org' ? parsed.data.ids : [...parsed.data.ids, ...org.params]
  )).map((r) => r.id);
  if (!ids.length) return res.status(404).json({ error: 'No matching contacts' });
  const uid = req.user!.uid;
  let affected = 0;

  if (action === 'pipeline') {
    if (!parsed.data.status) return res.status(400).json({ error: 'status is required for pipeline action' });
    const due = parsed.data.due ?? null;
    await tx(async (conn) => {
      for (const id of ids) {
        await conn.query(
          `INSERT INTO pipeline (contact_id, user_id, status, due, updated_at) VALUES (?, ?, ?, ?, NOW())
           ON DUPLICATE KEY UPDATE status = VALUES(status), due = COALESCE(VALUES(due), pipeline.due), updated_at = NOW()`,
          [id, uid, parsed.data.status, due]
        );
        affected++;
      }
    });
  } else if (action === 'tag') {
    let tagId = parsed.data.tagId || 0;
    const name = (parsed.data.name || '').trim();
    if (!tagId && name) {
      const found = await one<{ id: number }>('SELECT id FROM tags WHERE name = ?', [name]);
      tagId = found ? found.id : (await run('INSERT INTO tags (name) VALUES (?)', [name])).insertId;
    }
    if (!tagId) return res.status(400).json({ error: 'tagId or name is required for tag action' });
    if (!(await one('SELECT id FROM tags WHERE id = ?', [tagId]))) return res.status(404).json({ error: 'Tag not found' });
    await tx(async (conn) => {
      for (const id of ids) { await conn.query('INSERT IGNORE INTO contact_tags (contact_id, tag_id) VALUES (?, ?)', [id, tagId]); affected++; }
    });
  } else if (action === 'untag') {
    if (!parsed.data.tagId) return res.status(400).json({ error: 'tagId is required for untag action' });
    await tx(async (conn) => {
      for (const id of ids) { await conn.query('DELETE FROM contact_tags WHERE contact_id = ? AND tag_id = ?', [id, parsed.data.tagId]); affected++; }
    });
  } else if (action === 'task') {
    const title = (parsed.data.title || '').trim();
    if (!title) return res.status(400).json({ error: 'title is required for task action' });
    const due = parsed.data.due ?? null;
    await tx(async (conn) => {
      for (const id of ids) { await conn.query('INSERT INTO tasks (contact_id, user_id, title, due) VALUES (?, ?, ?, ?)', [id, uid, title, due]); affected++; }
    });
  } else if (action === 'assign') {
    const ownerId = parsed.data.ownerId ?? null;
    if (ownerId != null) {
      // Non-platform callers can only hand contacts to a teammate in their own
      // org; platform callers keep today's unrestricted behavior.
      const ownerWhere = req.user!.isPlatformOrg ? 'id = ?' : 'id = ? AND org_id = ?';
      const ownerParams = req.user!.isPlatformOrg ? [ownerId] : [ownerId, req.user!.orgId];
      if (!(await one(`SELECT id FROM users WHERE ${ownerWhere}`, ownerParams))) return res.status(404).json({ error: 'Owner not found' });
    }
    await tx(async (conn) => {
      for (const id of ids) { await conn.query('UPDATE contacts SET owner_id = ? WHERE id = ?', [ownerId, id]); affected++; }
    });
  } else if (action === 'assign_org') {
    const orgId = parsed.data.orgId;
    if (orgId == null) return res.status(400).json({ error: 'orgId is required for assign_org action' });
    if (!(await one('SELECT id FROM organizations WHERE id = ?', [orgId]))) return res.status(404).json({ error: 'Organization not found' });
    await tx(async (conn) => {
      // Moving a contact to a different org clears any owner assignment, since
      // the previous owner may not even be a member of the new org.
      for (const id of ids) { await conn.query('UPDATE contacts SET org_id = ?, owner_id = NULL WHERE id = ?', [orgId, id]); affected++; }
    });
  }

  await writeAudit(req.user, 'bulk_' + action, 'contacts', affected, { action });
  return res.json({ affected, action });
});

// PUT /api/contacts/:id/owner -> assign or clear the owner (editor or admin)
contactsRouter.put('/:id/owner', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  if (!(await contactInOrg(req, id))) return res.status(404).json({ error: 'Contact not found' });
  const ownerId = req.body?.ownerId == null ? null : Number(req.body.ownerId);
  if (ownerId != null) {
    const ownerWhere = req.user!.isPlatformOrg ? 'id = ?' : 'id = ? AND org_id = ?';
    const ownerParams = req.user!.isPlatformOrg ? [ownerId] : [ownerId, req.user!.orgId];
    if (!(await one(`SELECT id FROM users WHERE ${ownerWhere}`, ownerParams))) return res.status(404).json({ error: 'Owner not found' });
  }
  await run('UPDATE contacts SET owner_id = ? WHERE id = ?', [ownerId, id]);
  await writeAudit(req.user, 'assign', 'contact', id, { ownerId });
  const owner = ownerId ? await one('SELECT id, name, email FROM users WHERE id = ?', [ownerId]) : null;
  return res.json({ ok: true, owner });
});

// GET /api/contacts/:id -> contact plus the caller's pipeline entry, tags, and owner
contactsRouter.get('/:id', requireAuth, async (req, res) => {
  const id = Number(req.params.id);
  const c = await one<Record<string, any>>('SELECT * FROM contacts WHERE id = ?', [id]);
  if (!c || (!req.user!.isPlatformOrg && c.org_id !== req.user!.orgId)) return res.status(404).json({ error: 'Contact not found' });
  const pipe = (await one('SELECT contact_id, status, due, opp, poc, note, updated_at FROM pipeline WHERE contact_id = ? AND user_id = ?', [id, req.user!.uid])) || null;
  const tags = await q('SELECT t.id, t.name, t.color FROM tags t JOIN contact_tags ct ON ct.tag_id = t.id WHERE ct.contact_id = ? ORDER BY t.name', [id]);
  const owner = c.owner_id ? ((await one('SELECT id, name, email FROM users WHERE id = ?', [c.owner_id])) || null) : null;
  return res.json({ contact: c, pipeline: pipe, tags, owner });
});

// helpers for typed columns
const NUM_COLS = new Set(['lead_score', 'aum_mm', 'net_worth_mm', 'state_rank']);
const BOOL_COLS = new Set(['uhnw', 'institutional', 'foundation', 'reachable']);
function coerce(col: string, v: unknown): unknown {
  if (BOOL_COLS.has(col)) return v === 1 || v === true || v === 'Yes' || v === 'yes' || v === '1' ? 1 : 0;
  if (NUM_COLS.has(col)) { if (v === '' || v == null) return col === 'lead_score' ? 0 : null; const n = Number(v); return Number.isFinite(n) ? n : (col === 'lead_score' ? 0 : null); }
  return v == null ? '' : String(v);
}
function defaultFor(col: string): unknown {
  if (BOOL_COLS.has(col)) return 0;
  if (col === 'lead_score') return 0;
  if (NUM_COLS.has(col)) return null;
  if (col === 'aum_tier') return 'Unknown';
  return '';
}

// ---- CSV text -> array of contact objects (tolerant header mapping) ----
const HEADER_ALIAS: Record<string, string> = {
  role_title: 'title', role: 'title', state_province: 'state', province: 'state',
  aum: 'aum_mm', aum_mm: 'aum_mm', net_worth: 'net_worth_mm', client_net_worth: 'net_worth_mm',
  sub_region: 'sub_region', source: 'source_list', source_list: 'source_list', flags: 'data_flags', data_flags: 'data_flags',
};
const IMPORTABLE = new Set<string>(['id', ...WRITABLE]);

function normHeader(h: string): string {
  let k = h.trim().toLowerCase().replace(/\([^)]*\)/g, '').replace(/[^a-z0-9]+/g, '_').replace(/^_+|_+$/g, '');
  if (k in HEADER_ALIAS) k = HEADER_ALIAS[k];
  return k;
}
function parseCsv(text: string): string[][] {
  const rows: string[][] = [];
  let row: string[] = [], field = '', inQ = false;
  const s = text.replace(/\r\n/g, '\n').replace(/\r/g, '\n');
  for (let i = 0; i < s.length; i++) {
    const ch = s[i];
    if (inQ) {
      if (ch === '"') { if (s[i + 1] === '"') { field += '"'; i++; } else inQ = false; }
      else field += ch;
    } else if (ch === '"') inQ = true;
    else if (ch === ',') { row.push(field); field = ''; }
    else if (ch === '\n') { row.push(field); rows.push(row); row = []; field = ''; }
    else field += ch;
  }
  if (field.length || row.length) { row.push(field); rows.push(row); }
  return rows.filter((r) => r.length && !(r.length === 1 && r[0] === ''));
}
function csvToObjects(text: string): Record<string, unknown>[] {
  const rows = parseCsv(text);
  if (!rows.length) return [];
  const headers = rows[0].map(normHeader);
  const out: Record<string, unknown>[] = [];
  for (let i = 1; i < rows.length; i++) {
    const obj: Record<string, unknown> = {};
    headers.forEach((h, j) => { if (h && IMPORTABLE.has(h)) obj[h] = rows[i][j]; });
    if (obj.name) out.push(obj);
  }
  return out;
}


// ---------------------------------------------------------------------------
// People attached to a contact: assistants, associates, branch managers. The
// contact keeps one primary email; these are everyone else you deal with at
// that firm. They are searchable from the main search box.
// ---------------------------------------------------------------------------
const personSchema = z.object({
  name: z.string().min(1).max(255),
  role: z.string().max(120).optional().default(''),
  email: z.string().email().or(z.literal('')).optional().default(''),
  phone: z.string().max(60).optional().default(''),
});

contactsRouter.get('/:id/people', requireAuth, async (req, res) => {
  const id = Number(req.params.id);
  if (!(await contactInOrg(req, id))) return res.status(404).json({ error: 'Contact not found' });
  const people = await q(
    'SELECT id, contact_id, name, role, email, phone, created_at FROM contact_people WHERE contact_id = ? ORDER BY id',
    [id]
  );
  return res.json({ people });
});

contactsRouter.post('/:id/people', requireAuth, requireRole('editor'), async (req, res) => {
  const id = Number(req.params.id);
  if (!(await contactInOrg(req, id))) return res.status(404).json({ error: 'Contact not found' });
  const parsed = personSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { name, role, email, phone } = parsed.data;
  const info = await run(
    'INSERT INTO contact_people (contact_id, name, role, email, phone) VALUES (?, ?, ?, ?, ?)',
    [id, name, role, email.toLowerCase().trim(), phone]
  );
  await writeAudit(req.user, 'person_add', 'contact', id, { person: name });
  return res.status(201).json({ person: await one('SELECT * FROM contact_people WHERE id = ?', [info.insertId]) });
});

contactsRouter.patch('/:id/people/:pid', requireAuth, requireRole('editor'), async (req, res) => {
  const pid = Number(req.params.pid);
  const person = await one<{ id: number; contact_id: number }>('SELECT id, contact_id FROM contact_people WHERE id = ?', [pid]);
  if (!person || !(await contactInOrg(req, person.contact_id))) return res.status(404).json({ error: 'Person not found' });
  const parsed = personSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ error: 'Invalid input', details: parsed.error.flatten() });
  const { name, role, email, phone } = parsed.data;
  await run('UPDATE contact_people SET name = ?, role = ?, email = ?, phone = ? WHERE id = ?',
    [name, role, email.toLowerCase().trim(), phone, pid]);
  await writeAudit(req.user, 'person_update', 'contact', person.contact_id, { person: name });
  return res.json({ person: await one('SELECT * FROM contact_people WHERE id = ?', [pid]) });
});

contactsRouter.delete('/:id/people/:pid', requireAuth, requireRole('editor'), async (req, res) => {
  const pid = Number(req.params.pid);
  const person = await one<{ id: number; contact_id: number; name: string }>('SELECT id, contact_id, name FROM contact_people WHERE id = ?', [pid]);
  if (!person || !(await contactInOrg(req, person.contact_id))) return res.status(404).json({ error: 'Person not found' });
  await run('DELETE FROM contact_people WHERE id = ?', [pid]);
  await writeAudit(req.user, 'person_remove', 'contact', person.contact_id, { person: person.name });
  return res.json({ ok: true });
});
