import { describe, it, expect, beforeAll, afterAll } from 'vitest';
import request from 'supertest';
import { readFileSync, readdirSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import mysql from 'mysql2/promise';
import { createApp } from '../src/app.js';
import { pool, q, one, run, closePool } from '../src/db.js';
import { hashPassword } from '../src/auth.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const app = createApp();

let adminToken = '';
let editorToken = '';
let viewerToken = '';
let sampleContactId = 0;

const CONTACT_COLS = ['id','name','title','firm','segment','priority','lead_score','email','email_status','phone','city','state','country','sub_region','aum_mm','aum_tier','net_worth_mm','firm_type','state_rank','rank_movement','uhnw','institutional','foundation','client_types','reachable','source_list','data_flags'];
const TABLES = ['audit_log','contact_tags','tags','saved_views','templates','tasks','activities','pipeline','contacts','users'];

beforeAll(async () => {
  // The suite exercises registration, which is disabled by default in the app.
  process.env.ALLOW_REGISTRATION = 'true';
  // Ensure the test database exists with the CURRENT schema (every migration,
  // in order, exactly as the app applies them), then start clean.
  const migDir = join(__dirname, '..', 'migrations');
  const ddl = readdirSync(migDir).filter((f) => f.endsWith('.sql')).sort()
    .map((f) => readFileSync(join(migDir, f), 'utf8')).join('\n');
  const dbName = process.env.DB_NAME || 'capitalbook_test';
  const root = await mysql.createConnection({
    host: process.env.DB_HOST || '127.0.0.1',
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER || 'cbuser',
    password: process.env.DB_PASSWORD || 'cbpass',
    multipleStatements: true,
  });
  await root.query(`DROP DATABASE IF EXISTS \`${dbName}\``);
  await root.query(`CREATE DATABASE \`${dbName}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`);
  await root.query(`USE \`${dbName}\``);
  await root.query(ddl);
  await root.end();

  await run('SET FOREIGN_KEY_CHECKS = 0');
  for (const t of TABLES) await run('TRUNCATE TABLE ' + t);
  await run('SET FOREIGN_KEY_CHECKS = 1');

  // seed a 300-contact subset of the shipped seed
  const seedPath = join(__dirname, '..', 'seeds', 'contacts-seed.json');
  const seed = JSON.parse(readFileSync(seedPath, 'utf8')).slice(0, 300);
  const values = seed.map((c: any) => CONTACT_COLS.map((col) => (c[col] === undefined ? null : c[col])));
  await pool.query(`INSERT INTO contacts (${CONTACT_COLS.join(',')}) VALUES ?`, [values]);
  sampleContactId = seed[0].id;

  // seed an editor and a viewer directly
  await run('INSERT INTO users (email,password_hash,name,role) VALUES (?,?,?,?)', ['editor@test.local', hashPassword('password123'), 'Editor', 'editor']);
  await run('INSERT INTO users (email,password_hash,name,role) VALUES (?,?,?,?)', ['viewer@test.local', hashPassword('password123'), 'Viewer', 'viewer']);
});

afterAll(async () => {
  await closePool();
});

describe('health', () => {
  it('reports contact count', async () => {
    const res = await request(app).get('/api/health');
    expect(res.status).toBe(200);
    expect(res.body.ok).toBe(true);
    expect(res.body.contacts).toBeGreaterThan(0);
  });
});

describe('auth', () => {
  it('registers a new user as viewer', async () => {
    const res = await request(app).post('/api/auth/register').send({ email: 'new@test.local', password: 'password123', name: 'New' });
    expect(res.status).toBe(201);
    expect(res.body.user.role).toBe('viewer');
    expect(res.body.token).toBeTruthy();
  });

  it('rejects duplicate registration', async () => {
    const res = await request(app).post('/api/auth/register').send({ email: 'new@test.local', password: 'password123' });
    expect(res.status).toBe(409);
  });

  it('rejects weak passwords', async () => {
    const res = await request(app).post('/api/auth/register').send({ email: 'weak@test.local', password: 'short' });
    expect(res.status).toBe(400);
  });

  it('logs in seeded accounts', async () => {
    // promote the registered user to admin for admin tests
    const u = await one('SELECT id FROM users WHERE email = ?', ['new@test.local']) as { id: number };
    await run('UPDATE users SET role = ? WHERE id = ?', ['admin', u.id]);

    const a = await request(app).post('/api/auth/login').send({ email: 'new@test.local', password: 'password123' });
    expect(a.status).toBe(200);
    adminToken = a.body.token;

    const e = await request(app).post('/api/auth/login').send({ email: 'editor@test.local', password: 'password123' });
    editorToken = e.body.token;
    const v = await request(app).post('/api/auth/login').send({ email: 'viewer@test.local', password: 'password123' });
    viewerToken = v.body.token;
    expect(editorToken && viewerToken).toBeTruthy();
  });

  it('rejects bad credentials', async () => {
    const res = await request(app).post('/api/auth/login').send({ email: 'new@test.local', password: 'wrongpass' });
    expect(res.status).toBe(401);
  });

  it('returns the current user from a token', async () => {
    const res = await request(app).get('/api/auth/me').set('Authorization', `Bearer ${adminToken}`);
    expect(res.status).toBe(200);
    expect(res.body.user.email).toBe('new@test.local');
  });
});

describe('contacts', () => {
  it('requires auth', async () => {
    const res = await request(app).get('/api/contacts');
    expect(res.status).toBe(401);
  });

  it('lists with pagination', async () => {
    const res = await request(app).get('/api/contacts?pageSize=10').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.rows.length).toBe(10);
    expect(res.body.total).toBeGreaterThan(10);
    expect(res.body.pages).toBeGreaterThan(1);
  });

  it('filters by segment', async () => {
    const res = await request(app).get('/api/contacts?segment=Financial%20Advisor&pageSize=5').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.rows.every((r: any) => r.segment === 'Financial Advisor')).toBe(true);
  });

  it('searches by name/firm', async () => {
    const res = await request(app).get('/api/contacts?q=merrill&pageSize=5').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.total).toBeGreaterThan(0);
  });

  it('sorts by AUM descending with nulls last', async () => {
    const res = await request(app).get('/api/contacts?sort=a&dir=desc&pageSize=5').set('Authorization', `Bearer ${viewerToken}`);
    const aums = res.body.rows.map((r: any) => r.aum_mm).filter((x: any) => x != null);
    const sorted = [...aums].sort((a, b) => b - a);
    expect(aums).toEqual(sorted);
  });

  it('returns a contact detail', async () => {
    const res = await request(app).get(`/api/contacts/${sampleContactId}`).set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.contact.id).toBe(sampleContactId);
  });

  it('exposes filter metadata', async () => {
    const res = await request(app).get('/api/contacts/meta').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.segments.length).toBeGreaterThan(0);
  });
});

describe('pipeline (RBAC + sync)', () => {
  it('blocks viewers from writing (403)', async () => {
    const res = await request(app).put(`/api/pipeline/${sampleContactId}`).set('Authorization', `Bearer ${viewerToken}`).send({ status: 'Contacted' });
    expect(res.status).toBe(403);
  });

  it('allows editors to upsert', async () => {
    const res = await request(app).put(`/api/pipeline/${sampleContactId}`).set('Authorization', `Bearer ${editorToken}`).send({ status: 'Meeting', due: '2026-07-15', opp: 25000, poc: 'Head of IR', note: 'warm intro' });
    expect(res.status).toBe(200);
    expect(res.body.pipeline.status).toBe('Meeting');
    expect(res.body.pipeline.opp).toBe(25000);
  });

  it('persists pipeline per user (sync) and merges partial updates', async () => {
    // partial update: only status, keep opp
    await request(app).put(`/api/pipeline/${sampleContactId}`).set('Authorization', `Bearer ${editorToken}`).send({ status: 'Replied' });
    const list = await request(app).get('/api/pipeline').set('Authorization', `Bearer ${editorToken}`);
    const entry = list.body.pipeline.find((p: any) => p.contact_id === sampleContactId);
    expect(entry.status).toBe('Replied');
    expect(entry.opp).toBe(25000); // preserved across partial update
  });

  it('keeps pipelines separate between users', async () => {
    const list = await request(app).get('/api/pipeline').set('Authorization', `Bearer ${adminToken}`);
    // admin has not touched this contact
    const entry = list.body.pipeline.find((p: any) => p.contact_id === sampleContactId);
    expect(entry).toBeUndefined();
  });

  it('rejects invalid status', async () => {
    const res = await request(app).put(`/api/pipeline/${sampleContactId}`).set('Authorization', `Bearer ${editorToken}`).send({ status: 'Nope' });
    expect(res.status).toBe(400);
  });

  it('deletes a pipeline entry', async () => {
    const res = await request(app).delete(`/api/pipeline/${sampleContactId}`).set('Authorization', `Bearer ${editorToken}`);
    expect(res.status).toBe(200);
    expect(res.body.removed).toBe(1);
  });
});

describe('dashboard', () => {
  it('returns aggregate stats', async () => {
    const res = await request(app).get('/api/dashboard/stats').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.total).toBeGreaterThan(0);
    expect(res.body.bySegment.length).toBeGreaterThan(0);
    expect(res.body.bySegment[0]).toHaveProperty('count');
    expect(res.body.bySegment[0]).toHaveProperty('aum_sum');
  });
});

describe('audit (admin only)', () => {
  it('blocks non-admins (403)', async () => {
    const res = await request(app).get('/api/audit').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(403);
  });

  it('returns the log for admins and recorded prior actions', async () => {
    const res = await request(app).get('/api/audit?limit=50').set('Authorization', `Bearer ${adminToken}`);
    expect(res.status).toBe(200);
    expect(res.body.audit.length).toBeGreaterThan(0);
    const actions = res.body.audit.map((a: any) => a.action);
    expect(actions).toContain('pipeline_update');
  });

  it('lets admins list and change user roles', async () => {
    const users = await request(app).get('/api/auth/users').set('Authorization', `Bearer ${adminToken}`);
    expect(users.status).toBe(200);
    const viewer = users.body.users.find((u: any) => u.email === 'viewer@test.local');
    const patch = await request(app).patch(`/api/auth/users/${viewer.id}/role`).set('Authorization', `Bearer ${adminToken}`).send({ role: 'editor' });
    expect(patch.status).toBe(200);
    expect(patch.body.role).toBe('editor');
  });
});

describe('activities (timeline)', () => {
  it('lets editors log an activity', async () => {
    const res = await request(app).post(`/api/contacts/${sampleContactId}/activities`).set('Authorization', `Bearer ${editorToken}`).send({ type: 'call', body: 'Left voicemail with IR' });
    expect(res.status).toBe(201);
    expect(res.body.activity.type).toBe('call');
  });
  it('blocks viewers from logging (403)', async () => {
    const res = await request(app).post(`/api/contacts/${sampleContactId}/activities`).set('Authorization', `Bearer ${viewerToken}`).send({ type: 'note', body: 'x' });
    expect(res.status).toBe(403);
  });
  it('returns the timeline to any authenticated user', async () => {
    const res = await request(app).get(`/api/contacts/${sampleContactId}/activities`).set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.activities.length).toBeGreaterThan(0);
    expect(res.body.activities[0].body).toContain('voicemail');
  });
  it('rejects empty body', async () => {
    const res = await request(app).post(`/api/contacts/${sampleContactId}/activities`).set('Authorization', `Bearer ${editorToken}`).send({ type: 'note', body: '' });
    expect(res.status).toBe(400);
  });
});

describe('tasks (follow-ups)', () => {
  let taskId = 0;
  it('lets editors create a task tied to a contact', async () => {
    const res = await request(app).post('/api/tasks').set('Authorization', `Bearer ${editorToken}`).send({ contact_id: sampleContactId, title: 'Send deck', due: '2020-01-01' });
    expect(res.status).toBe(201);
    taskId = res.body.task.id;
  });
  it('blocks viewers from creating tasks (403)', async () => {
    const res = await request(app).post('/api/tasks').set('Authorization', `Bearer ${viewerToken}`).send({ title: 'x' });
    expect(res.status).toBe(403);
  });
  it('lists tasks with counts and flags overdue', async () => {
    const res = await request(app).get('/api/tasks').set('Authorization', `Bearer ${editorToken}`);
    expect(res.status).toBe(200);
    expect(res.body.tasks.some((t: any) => t.id === taskId)).toBe(true);
    expect(res.body.counts.open).toBeGreaterThan(0);
    expect(res.body.counts.overdue).toBeGreaterThan(0); // due 2020 is in the past
  });
  it('filters by overdue status', async () => {
    const res = await request(app).get('/api/tasks?status=overdue').set('Authorization', `Bearer ${editorToken}`);
    expect(res.body.tasks.every((t: any) => t.done === 0)).toBe(true);
  });
  it('marks a task done and stamps completion', async () => {
    const res = await request(app).patch(`/api/tasks/${taskId}`).set('Authorization', `Bearer ${editorToken}`).send({ done: true });
    expect(res.status).toBe(200);
    expect(res.body.task.done).toBe(1);
    expect(res.body.task.completed_at).toBeTruthy();
  });
  it('keeps tasks private to the owner', async () => {
    const res = await request(app).get('/api/tasks').set('Authorization', `Bearer ${adminToken}`);
    expect(res.body.tasks.some((t: any) => t.id === taskId)).toBe(false);
  });
});

describe('contact mutation', () => {
  let newId = 0;
  it('lets admins create a contact', async () => {
    const res = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`).send({ name: 'Test Allocator', firm: 'Test Capital', segment: 'Family Office', aum_mm: 1200, priority: 'B' });
    expect(res.status).toBe(201);
    newId = res.body.contact.id;
    expect(res.body.contact.firm).toBe('Test Capital');
  });
  it('lets editors create (viewers still 403)', async () => {
    const ed = await request(app).post('/api/contacts').set('Authorization', `Bearer ${editorToken}`).send({ name: 'Editor Made' });
    expect(ed.status).toBe(201);
    await run('DELETE FROM contacts WHERE id = ?', [ed.body.contact.id]);
    const vw = await request(app).post('/api/contacts').set('Authorization', `Bearer ${viewerToken}`).send({ name: 'Nope' });
    expect(vw.status).toBe(403);
  });
  it('lets editors edit selected fields', async () => {
    const res = await request(app).patch(`/api/contacts/${newId}`).set('Authorization', `Bearer ${editorToken}`).send({ priority: 'A', email: 'ir@testcapital.com' });
    expect(res.status).toBe(200);
    expect(res.body.contact.priority).toBe('A');
    expect(res.body.contact.email).toBe('ir@testcapital.com');
  });
  it('blocks viewers from editing (403)', async () => {
    const res = await request(app).patch(`/api/contacts/${newId}`).set('Authorization', `Bearer ${viewerToken}`).send({ priority: 'C' });
    expect(res.status).toBe(403);
  });
  it('coerces boolean and numeric fields on edit', async () => {
    const res = await request(app).patch(`/api/contacts/${newId}`).set('Authorization', `Bearer ${editorToken}`).send({ uhnw: 'Yes', lead_score: '88' });
    expect(res.body.contact.uhnw).toBe(1);
    expect(res.body.contact.lead_score).toBe(88);
  });
});

describe('CSV export', () => {
  it('returns CSV with a header row', async () => {
    const res = await request(app).get('/api/contacts/export.csv?segment=Financial%20Advisor').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.headers['content-type']).toContain('text/csv');
    const firstLine = res.text.split('\n')[0];
    expect(firstLine).toContain('id,name,title,firm,segment');
    expect(res.text.split('\n').length).toBeGreaterThan(1);
  });
});

describe('CSV / bulk import', () => {
  it('lets admins bulk upsert contacts', async () => {
    const before = (await request(app).get('/api/health')).body.contacts;
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${adminToken}`).send({ contacts: [
      { name: 'Imported One', firm: 'Alpha LP', segment: 'Endowment / Foundation', aum_mm: 5000 },
      { name: 'Imported Two', firm: 'Beta Trust', segment: 'Family Office', uhnw: 'Yes' },
    ] });
    expect(res.status).toBe(200);
    expect(res.body.imported).toBe(2);
    expect(res.body.total).toBe(before + 2);
  });
  it('blocks non-admins from importing (403)', async () => {
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${editorToken}`).send({ contacts: [{ name: 'x' }] });
    expect(res.status).toBe(403);
  });
  it('rejects a non-array body', async () => {
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${adminToken}`).send({ contacts: 'nope' });
    expect(res.status).toBe(400);
  });
});

describe('dashboard additions', () => {
  it('includes task and activity rollups', async () => {
    const res = await request(app).get('/api/dashboard/stats').set('Authorization', `Bearer ${editorToken}`);
    expect(res.body.tasks).toHaveProperty('open');
    expect(res.body.tasks).toHaveProperty('overdue');
    expect(res.body).toHaveProperty('activity7d');
    expect(res.body.activity7d).toBeGreaterThan(0); // we logged a call above
  });
});

describe('tags', () => {
  let tagId = 0;
  it('lets editors create a tag', async () => {
    const res = await request(app).post('/api/tags').set('Authorization', `Bearer ${editorToken}`).send({ name: 'Roadshow Q3', color: '#B0436E' });
    expect(res.status).toBe(201);
    tagId = res.body.tag.id;
  });
  it('blocks viewers from creating tags (403)', async () => {
    const res = await request(app).post('/api/tags').set('Authorization', `Bearer ${viewerToken}`).send({ name: 'Nope' });
    expect(res.status).toBe(403);
  });
  it('attaches a tag to a contact and shows it in detail', async () => {
    const att = await request(app).post(`/api/contacts/${sampleContactId}/tags`).set('Authorization', `Bearer ${editorToken}`).send({ tagId });
    expect(att.status).toBe(201);
    const detail = await request(app).get(`/api/contacts/${sampleContactId}`).set('Authorization', `Bearer ${viewerToken}`);
    expect(detail.body.tags.some((t: any) => t.id === tagId)).toBe(true);
  });
  it('filters the contact list by tag', async () => {
    const res = await request(app).get(`/api/contacts?tag=${tagId}`).set('Authorization', `Bearer ${viewerToken}`);
    expect(res.body.total).toBeGreaterThan(0);
    expect(res.body.rows.some((r: any) => r.id === sampleContactId)).toBe(true);
  });
  it('attaches by name, creating the tag if new', async () => {
    const res = await request(app).post(`/api/contacts/${sampleContactId}/tags`).set('Authorization', `Bearer ${editorToken}`).send({ name: 'Warm Intro' });
    expect(res.status).toBe(201);
    expect(res.body.tags.some((t: any) => t.name === 'Warm Intro')).toBe(true);
  });
  it('detaches a tag', async () => {
    const res = await request(app).delete(`/api/contacts/${sampleContactId}/tags/${tagId}`).set('Authorization', `Bearer ${editorToken}`);
    expect(res.status).toBe(200);
    const detail = await request(app).get(`/api/contacts/${sampleContactId}`).set('Authorization', `Bearer ${editorToken}`);
    expect(detail.body.tags.some((t: any) => t.id === tagId)).toBe(false);
  });
  it('lists tags with usage counts', async () => {
    const res = await request(app).get('/api/tags').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.body.tags.length).toBeGreaterThan(0);
    expect(res.body.tags[0]).toHaveProperty('count');
  });
});

describe('saved views', () => {
  let viewId = 0;
  it('saves a view for the user', async () => {
    const res = await request(app).post('/api/views').set('Authorization', `Bearer ${editorToken}`).send({ name: 'A-priority quant', query: 'segment=Multi-Manager+%2F+Quant+Fund&priority=A', shared: false });
    expect(res.status).toBe(201);
    viewId = res.body.view.id;
  });
  it('lists the owner views', async () => {
    const res = await request(app).get('/api/views').set('Authorization', `Bearer ${editorToken}`);
    expect(res.body.views.some((v: any) => v.id === viewId)).toBe(true);
  });
  it('shares a view so other users can see it', async () => {
    await request(app).post('/api/views').set('Authorization', `Bearer ${editorToken}`).send({ name: 'Team targets', query: 'tier=Mega+%28%2410B%2B%29', shared: true });
    const asViewer = await request(app).get('/api/views').set('Authorization', `Bearer ${viewerToken}`);
    expect(asViewer.body.views.some((v: any) => v.name === 'Team targets')).toBe(true);
    // the private one is not visible to the viewer
    expect(asViewer.body.views.some((v: any) => v.id === viewId)).toBe(false);
  });
  it('lets the owner delete a view', async () => {
    const res = await request(app).delete(`/api/views/${viewId}`).set('Authorization', `Bearer ${editorToken}`);
    expect(res.status).toBe(200);
  });
});

describe('templates + mail merge', () => {
  let tplId = 0;
  it('lets editors create a template', async () => {
    const res = await request(app).post('/api/templates').set('Authorization', `Bearer ${editorToken}`).send({ name: 'Test Intro', subject: 'Hello {{first_name}} at {{firm}}', body: 'Hi {{first_name}},\n\nReaching out about {{firm}} in {{city}}.\n\n{{unknown_token}}' });
    expect(res.status).toBe(201);
    tplId = res.body.template.id;
  });
  it('blocks viewers from creating templates (403)', async () => {
    const res = await request(app).post('/api/templates').set('Authorization', `Bearer ${viewerToken}`).send({ name: 'x' });
    expect(res.status).toBe(403);
  });
  it('renders a template against a contact (merge fields filled)', async () => {
    const detail = await request(app).get(`/api/contacts/${sampleContactId}`).set('Authorization', `Bearer ${editorToken}`);
    const c = detail.body.contact;
    const res = await request(app).post(`/api/templates/${tplId}/render`).set('Authorization', `Bearer ${editorToken}`).send({ contactId: sampleContactId });
    expect(res.status).toBe(200);
    const first = String(c.name).split(' ')[0];
    expect(res.body.subject).toContain(first);
    expect(res.body.subject).toContain(c.firm);
    expect(res.body.body).toContain(c.firm);
    // unknown tokens are left visible, not blanked
    expect(res.body.body).toContain('{{unknown_token}}');
  });
  it('updates a template', async () => {
    const res = await request(app).patch(`/api/templates/${tplId}`).set('Authorization', `Bearer ${editorToken}`).send({ subject: 'Updated {{firm}}' });
    expect(res.status).toBe(200);
    expect(res.body.template.subject).toBe('Updated {{firm}}');
  });
  it('seeded starter templates are present', async () => {
    const res = await request(app).get('/api/templates').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.body.templates.length).toBeGreaterThanOrEqual(1);
  });
});

describe('CSV import', () => {
  it('imports from raw CSV text with header aliasing', async () => {
    const before = (await request(app).get('/api/health')).body.contacts;
    const csv = 'Name,Firm,Segment,Role / Title,AUM ($mm)\nCsv Allocator,CSV Capital,Family Office,Chief Investment Officer,3200\nSecond Csv,Beta Family Office,Family Office,Principal,800';
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${adminToken}`).send({ csv });
    expect(res.status).toBe(200);
    expect(res.body.imported).toBe(2);
    expect(res.body.total).toBe(before + 2);
    // verify the alias mapped Role / Title -> title and AUM -> aum_mm
    const found = await request(app).get('/api/contacts?q=Csv%20Allocator&pageSize=1').set('Authorization', `Bearer ${adminToken}`);
    const row = found.body.rows[0];
    expect(row.title).toBe('Chief Investment Officer');
    expect(row.aum_mm).toBe(3200);
  });
});

describe('bulk operations', () => {
  let ids: number[] = [];
  let bulkTagId = 0;
  it('sets pipeline status across many contacts', async () => {
    const page = await request(app).get('/api/contacts?pageSize=3&sort=a').set('Authorization', `Bearer ${editorToken}`);
    ids = page.body.rows.map((r: any) => r.id);
    expect(ids.length).toBe(3);
    const res = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids, action: 'pipeline', status: 'Contacted' });
    expect(res.status).toBe(200);
    expect(res.body.affected).toBe(3);
    const filtered = await request(app).get('/api/contacts?status=Contacted&pageSize=200').set('Authorization', `Bearer ${editorToken}`);
    expect(filtered.body.total).toBeGreaterThanOrEqual(3);
    expect(ids.every((id) => filtered.body.rows.some((r: any) => r.id === id))).toBe(true);
  });
  it('keeps bulk pipeline changes private to the acting user', async () => {
    const asAdmin = await request(app).get('/api/contacts?status=Contacted&pageSize=200').set('Authorization', `Bearer ${adminToken}`);
    expect(asAdmin.body.rows.some((r: any) => ids.includes(r.id))).toBe(false);
  });
  it('bulk-tags many contacts, creating the tag by name', async () => {
    const res = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids, action: 'tag', name: 'BulkTag' });
    expect(res.status).toBe(200);
    expect(res.body.affected).toBe(3);
    const tags = await request(app).get('/api/tags').set('Authorization', `Bearer ${editorToken}`);
    bulkTagId = tags.body.tags.find((t: any) => t.name === 'BulkTag').id;
    const filtered = await request(app).get(`/api/contacts?tag=${bulkTagId}&pageSize=200`).set('Authorization', `Bearer ${editorToken}`);
    expect(filtered.body.total).toBe(3);
  });
  it('bulk-untags contacts', async () => {
    const res = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids: [ids[0]], action: 'untag', tagId: bulkTagId });
    expect(res.status).toBe(200);
    const filtered = await request(app).get(`/api/contacts?tag=${bulkTagId}&pageSize=200`).set('Authorization', `Bearer ${editorToken}`);
    expect(filtered.body.total).toBe(2);
  });
  it('bulk-creates a task per contact for the acting user', async () => {
    const before = (await request(app).get('/api/tasks').set('Authorization', `Bearer ${editorToken}`)).body.counts.open;
    const res = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids, action: 'task', title: 'Bulk follow-up', due: '2030-01-01' });
    expect(res.body.affected).toBe(3);
    const after = (await request(app).get('/api/tasks').set('Authorization', `Bearer ${editorToken}`)).body.counts.open;
    expect(after).toBe(before + 3);
  });
  it('blocks viewers from bulk actions (403)', async () => {
    const res = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${viewerToken}`).send({ ids, action: 'tag', name: 'Nope' });
    expect(res.status).toBe(403);
  });
  it('rejects an empty id list and unknown actions (400)', async () => {
    const empty = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids: [], action: 'tag', name: 'x' });
    expect(empty.status).toBe(400);
    const bad = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids, action: 'frobnicate' });
    expect(bad.status).toBe(400);
    const noStatus = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids, action: 'pipeline' });
    expect(noStatus.status).toBe(400);
  });
});

describe('ownership and team feed', () => {
  let editorId = 0; let cId = 0; let bulkIds: number[] = [];
  it('exposes members to editors but not viewers', async () => {
    const ed = await request(app).get('/api/auth/members').set('Authorization', `Bearer ${editorToken}`);
    expect(ed.status).toBe(200);
    expect(ed.body.members.length).toBeGreaterThanOrEqual(2);
    editorId = ed.body.members.find((m: any) => m.email === 'editor@test.local').id;
    const vi = await request(app).get('/api/auth/members').set('Authorization', `Bearer ${viewerToken}`);
    expect(vi.status).toBe(403);
  });
  it('assigns and clears a contact owner', async () => {
    const page = await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${editorToken}`);
    cId = page.body.rows[0].id;
    const set = await request(app).put(`/api/contacts/${cId}/owner`).set('Authorization', `Bearer ${editorToken}`).send({ ownerId: editorId });
    expect(set.status).toBe(200);
    expect(set.body.owner.email).toBe('editor@test.local');
    const detail = await request(app).get(`/api/contacts/${cId}`).set('Authorization', `Bearer ${editorToken}`);
    expect(detail.body.owner.id).toBe(editorId);
    const clr = await request(app).put(`/api/contacts/${cId}/owner`).set('Authorization', `Bearer ${editorToken}`).send({ ownerId: null });
    expect(clr.body.owner).toBeNull();
  });
  it('filters by owner=me and owner=none', async () => {
    await request(app).put(`/api/contacts/${cId}/owner`).set('Authorization', `Bearer ${editorToken}`).send({ ownerId: editorId });
    const mine = await request(app).get('/api/contacts?owner=me&pageSize=200').set('Authorization', `Bearer ${editorToken}`);
    expect(mine.body.rows.some((r: any) => r.id === cId)).toBe(true);
    expect(mine.body.rows.every((r: any) => r.owner_id === editorId)).toBe(true);
    const none = await request(app).get('/api/contacts?owner=none&pageSize=200').set('Authorization', `Bearer ${editorToken}`);
    expect(none.body.rows.some((r: any) => r.id === cId)).toBe(false);
  });
  it('blocks viewers from assigning (403)', async () => {
    const res = await request(app).put(`/api/contacts/${cId}/owner`).set('Authorization', `Bearer ${viewerToken}`).send({ ownerId: editorId });
    expect(res.status).toBe(403);
  });
  it('bulk-assigns and bulk-unassigns owners', async () => {
    const page = await request(app).get('/api/contacts?pageSize=3&sort=n').set('Authorization', `Bearer ${editorToken}`);
    bulkIds = page.body.rows.map((r: any) => r.id);
    const set = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids: bulkIds, action: 'assign', ownerId: editorId });
    expect(set.body.affected).toBe(3);
    const mine = await request(app).get(`/api/contacts?owner=${editorId}&pageSize=200`).set('Authorization', `Bearer ${editorToken}`);
    expect(bulkIds.every((id) => mine.body.rows.some((r: any) => r.id === id))).toBe(true);
    const unset = await request(app).post('/api/contacts/bulk').set('Authorization', `Bearer ${editorToken}`).send({ ids: bulkIds, action: 'assign', ownerId: null });
    expect(unset.body.affected).toBe(3);
  });
  it('rejects assigning to a non-existent user (404)', async () => {
    const res = await request(app).put(`/api/contacts/${cId}/owner`).set('Authorization', `Bearer ${editorToken}`).send({ ownerId: 999999 });
    expect(res.status).toBe(404);
  });
  it('returns a team-wide activity feed', async () => {
    const res = await request(app).get('/api/activity?limit=10').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(Array.isArray(res.body.activities)).toBe(true);
    if (res.body.activities.length) {
      expect(res.body.activities[0]).toHaveProperty('contact_name');
      expect(res.body.activities[0]).toHaveProperty('user_email');
      expect(res.body.activities[0]).toHaveProperty('type');
    }
  });
  it('dashboard reports assignedToMe', async () => {
    await request(app).put(`/api/contacts/${cId}/owner`).set('Authorization', `Bearer ${editorToken}`).send({ ownerId: editorId });
    const res = await request(app).get('/api/dashboard/stats').set('Authorization', `Bearer ${editorToken}`);
    expect(res.body).toHaveProperty('assignedToMe');
    expect(res.body.assignedToMe).toBeGreaterThanOrEqual(1);
  });
});


// ---------------------------------------------------------------------------
// Password reset, account management, and the region filter.
// The reset flow is exercised against a real in-process SMTP server, so the
// link under test is the one that actually goes out on the wire.
// ---------------------------------------------------------------------------
// MIME bodies are quoted-printable: soft line breaks are "=\r\n" and a literal
// "=" is encoded as "=3D". Decode before reading the link out of the message.
const decodeMail = (raw: string) => raw.replace(/=\r?\n/g, '').replace(/=3D/gi, '=');

describe('password reset from the sign-in screen', () => {
  let smtp: any;
  let mails: Array<{ to: string[]; raw: string }> = [];
  let uid = 0;
  const EMAIL = 'reset.subject@ninepoint.com';

  beforeAll(async () => {
    const { SMTPServer } = await import('smtp-server' as any) as any;
    smtp = new SMTPServer({
      authOptional: true, disabledCommands: ['STARTTLS'],
      onData(stream: any, session: any, cb: any) {
        let raw = '';
        stream.on('data', (c: any) => (raw += c.toString('utf8')));
        stream.on('end', () => { mails.push({ to: session.envelope.rcptTo.map((r: any) => r.address), raw }); cb(); });
      },
    });
    await new Promise<void>((r) => smtp.listen(0, '127.0.0.1', () => r()));
    const port = smtp.server.address().port;
    process.env.SMTP_HOST = '127.0.0.1';
    process.env.SMTP_PORT = String(port);
    process.env.SMTP_SECURE = 'false';
    process.env.SMTP_FROM = 'Capital Book <no-reply@ninepoint.com>';
    process.env.APP_URL = 'http://localhost:5173';
    delete process.env.SMTP_USER;

    const u = await request(app).post('/api/auth/users').set('Authorization', `Bearer ${adminToken}`)
      .send({ email: EMAIL, password: 'originalpass1', name: 'Reset Subject', role: 'editor' });
    uid = u.body.user.id;
  });
  afterAll(async () => {
    await request(app).delete(`/api/auth/users/${uid}`).set('Authorization', `Bearer ${adminToken}`).catch(() => null);
    await new Promise<void>((r) => smtp.close(() => r()));
    delete process.env.SMTP_HOST; delete process.env.SMTP_FROM;
  });

  it('emails a reset link that actually works end to end', async () => {
    mails = [];
    const req1 = await request(app).post('/api/auth/forgot').send({ email: EMAIL });
    expect(req1.status).toBe(200);
    await new Promise((r) => setTimeout(r, 400));
    expect(mails.length).toBe(1);
    expect(mails[0].to).toContain(EMAIL);

    const link = /https?:\/\/[^\s"]*app\.html\?reset=([A-Za-z0-9_\-]+)/.exec(decodeMail(mails[0].raw));
    expect(link).toBeTruthy();
    const token = link![1];

    const done = await request(app).post('/api/auth/reset').send({ token, password: 'brandnewpass9' });
    expect(done.status).toBe(200);

    const oldLogin = await request(app).post('/api/auth/login').send({ email: EMAIL, password: 'originalpass1' });
    expect(oldLogin.status).toBe(401);
    const newLogin = await request(app).post('/api/auth/login').send({ email: EMAIL, password: 'brandnewpass9' });
    expect(newLogin.status).toBe(200);
    expect(newLogin.body.token).toBeTruthy();
  });

  it('a reset token is single use', async () => {
    mails = [];
    await request(app).post('/api/auth/forgot').send({ email: EMAIL });
    await new Promise((r) => setTimeout(r, 400));
    const token = /app\.html\?reset=([A-Za-z0-9_\-]+)/.exec(decodeMail(mails[0].raw))![1];
    const first = await request(app).post('/api/auth/reset').send({ token, password: 'secondpass77' });
    expect(first.status).toBe(200);
    const replay = await request(app).post('/api/auth/reset').send({ token, password: 'thirdpass888' });
    expect(replay.status).toBe(400);
  });

  it('an expired token is refused', async () => {
    mails = [];
    await request(app).post('/api/auth/forgot').send({ email: EMAIL });
    await new Promise((r) => setTimeout(r, 400));
    const token = /app\.html\?reset=([A-Za-z0-9_\-]+)/.exec(decodeMail(mails[0].raw))![1];
    await run('UPDATE users SET reset_expires_at = (NOW() - INTERVAL 1 MINUTE) WHERE id = ?', [uid]);
    const res = await request(app).post('/api/auth/reset').send({ token, password: 'toolatepass1' });
    expect(res.status).toBe(400);
  });

  it('a forged token is refused', async () => {
    const res = await request(app).post('/api/auth/reset').send({ token: 'not-a-real-token-at-all', password: 'whateverpass1' });
    expect(res.status).toBe(400);
  });

  it('the raw token is never stored, only its hash', async () => {
    mails = [];
    await request(app).post('/api/auth/forgot').send({ email: EMAIL });
    await new Promise((r) => setTimeout(r, 400));
    const token = /app\.html\?reset=([A-Za-z0-9_\-]+)/.exec(decodeMail(mails[0].raw))![1];
    const row = await one<{ reset_token_hash: string }>('SELECT reset_token_hash FROM users WHERE id = ?', [uid]);
    expect(row!.reset_token_hash).toBeTruthy();
    expect(row!.reset_token_hash).not.toBe(token);
    expect(row!.reset_token_hash.length).toBe(64); // sha-256 hex
  });

  it('does not reveal whether an address has an account', async () => {
    const known = await request(app).post('/api/auth/forgot').send({ email: EMAIL });
    const unknown = await request(app).post('/api/auth/forgot').send({ email: 'nobody.here@ninepoint.com' });
    expect(unknown.status).toBe(known.status);
    expect(unknown.body.message).toBe(known.body.message);
  });
});

describe('changing your own password', () => {
  it('requires the current password and then works', async () => {
    const created = await request(app).post('/api/auth/users').set('Authorization', `Bearer ${adminToken}`)
      .send({ email: 'selfchange@ninepoint.com', password: 'startingpw1', role: 'viewer' });
    const login = await request(app).post('/api/auth/login').send({ email: 'selfchange@ninepoint.com', password: 'startingpw1' });
    const t = login.body.token;

    const wrong = await request(app).post('/api/auth/password').set('Authorization', `Bearer ${t}`)
      .send({ currentPassword: 'notmypassword', newPassword: 'changedpw123' });
    expect(wrong.status).toBe(401);

    const ok = await request(app).post('/api/auth/password').set('Authorization', `Bearer ${t}`)
      .send({ currentPassword: 'startingpw1', newPassword: 'changedpw123' });
    expect(ok.status).toBe(200);

    const relog = await request(app).post('/api/auth/login').send({ email: 'selfchange@ninepoint.com', password: 'changedpw123' });
    expect(relog.status).toBe(200);
    await request(app).delete(`/api/auth/users/${created.body.user.id}`).set('Authorization', `Bearer ${adminToken}`);
  });
});

describe('admin user management', () => {
  it('adds a user, sets their password, and removes them', async () => {
    const created = await request(app).post('/api/auth/users').set('Authorization', `Bearer ${adminToken}`)
      .send({ email: 'lifecycle@ninepoint.com', password: 'firstpass11', name: 'Life Cycle', role: 'editor' });
    expect(created.status).toBe(201);
    const id = created.body.user.id;

    const dupe = await request(app).post('/api/auth/users').set('Authorization', `Bearer ${adminToken}`)
      .send({ email: 'lifecycle@ninepoint.com', password: 'otherpass11' });
    expect(dupe.status).toBe(409);

    const setPw = await request(app).post(`/api/auth/users/${id}/password`).set('Authorization', `Bearer ${adminToken}`)
      .send({ password: 'adminsetpw22' });
    expect(setPw.status).toBe(200);
    const login = await request(app).post('/api/auth/login').send({ email: 'lifecycle@ninepoint.com', password: 'adminsetpw22' });
    expect(login.status).toBe(200);

    const gone = await request(app).delete(`/api/auth/users/${id}`).set('Authorization', `Bearer ${adminToken}`);
    expect(gone.status).toBe(200);
    const after = await request(app).post('/api/auth/login').send({ email: 'lifecycle@ninepoint.com', password: 'adminsetpw22' });
    expect(after.status).toBe(401);
  });

  it('is admin only, and refuses to remove the last admin or yourself', async () => {
    const forbidden = await request(app).post('/api/auth/users').set('Authorization', `Bearer ${editorToken}`)
      .send({ email: 'nope@ninepoint.com', password: 'nopass12345' });
    expect(forbidden.status).toBe(403);

    const me = await request(app).get('/api/auth/me').set('Authorization', `Bearer ${adminToken}`);
    const self = await request(app).delete(`/api/auth/users/${me.body.user.id}`).set('Authorization', `Bearer ${adminToken}`);
    expect(self.status).toBe(400);
  });

  it('self-registration is closed unless explicitly enabled', async () => {
    const prev = process.env.ALLOW_REGISTRATION;
    delete process.env.ALLOW_REGISTRATION;              // the shipped default
    const res = await request(app).post('/api/auth/register')
      .send({ email: 'walkin@ninepoint.com', password: 'walkinpass1' });
    expect(res.status).toBe(403);
    const policy = await request(app).get('/api/auth/policy');
    expect(policy.body.allowRegistration).toBe(false);
    process.env.ALLOW_REGISTRATION = prev;
  });
});

describe('geography filters: country, province/state, city', () => {
  // The shipped fixture is a 300-row US slice, so plant known rows across two
  // countries and two states to prove the scoping at every level.
  let ids: number[] = [];
  beforeAll(async () => {
    const mk = async (name: string, country: string, st: string, city: string) =>
      (await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
        .send({ name, firm: 'GeoCo', email: name.replace(/ /g, '.').toLowerCase() + '@geo.test', country, state: st, city })).body.contact.id;
    ids.push(await mk('Geo SF One', 'United States', 'California', 'San Francisco'));
    ids.push(await mk('Geo SF Two', 'United States', 'California', 'San Francisco'));
    ids.push(await mk('Geo LA One', 'United States', 'California', 'Los Angeles'));
    ids.push(await mk('Geo NYC One', 'United States', 'New York', 'New York'));
    ids.push(await mk('Geo Toronto One', 'Canada', 'ON', 'Toronto'));
  });
  afterAll(async () => {
    for (const id of ids) await run('DELETE FROM contacts WHERE id = ?', [id]).catch(() => null);
  });

  const qs = (params: Record<string, string>) => new URLSearchParams(params).toString();
  // every geo query is scoped to the planted rows (firm "GeoCo") so the result
  // is exact and independent of paging
  const get = (params: Record<string, string>) =>
    request(app).get('/api/contacts?' + qs({ pageSize: '200', q: 'GeoCo', ...params })).set('Authorization', `Bearer ${viewerToken}`);
  const meta = (params: Record<string, string> = {}) =>
    request(app).get('/api/contacts/meta' + (Object.keys(params).length ? '?' + qs(params) : '')).set('Authorization', `Bearer ${viewerToken}`);

  it('filters by province/state', async () => {
    const res = await get({ state: 'California' });
    expect(res.body.total).toBe(3);
    expect(res.body.rows.every((r: any) => r.state === 'California')).toBe(true);
  });

  it('narrows country -> state -> city, each level tightening the last', async () => {
    const country = await get({ country: 'United States' });
    const st = await get({ country: 'United States', state: 'California' });
    const city = await get({ country: 'United States', state: 'California', city: 'San Francisco' });
    expect(country.body.total).toBe(4);   // 4 US rows planted
    expect(st.body.total).toBe(3);        // 3 of them in California
    expect(city.body.total).toBe(2);      // 2 of those in San Francisco
    expect(city.body.rows.every((r: any) => r.city === 'San Francisco' && r.state === 'California')).toBe(true);
  });

  it('a state from the wrong country yields nothing, rather than silently ignoring the mismatch', async () => {
    const res = await get({ country: 'Canada', state: 'California' });
    expect(res.body.total).toBe(0);
  });

  it('meta scopes provinces to the selected country, with counts', async () => {
    const us = await meta({ country: 'United States' });
    const names = us.body.states.map((r: any) => r.name);
    expect(names).toContain('California');
    expect(names).toContain('New York');
    expect(names).not.toContain('ON');            // a Canadian province
    const ca = await meta({ country: 'Canada' });
    expect(ca.body.states.map((r: any) => r.name)).toContain('ON');
    expect(ca.body.states.map((r: any) => r.name)).not.toContain('California');
    // biggest first
    const counts = us.body.states.map((r: any) => r.count);
    expect(counts[0]).toBeGreaterThanOrEqual(counts[counts.length - 1]);
  });

  it('meta scopes cities to the selected province, not just the country', async () => {
    const caOnly = await meta({ country: 'United States', state: 'California' });
    const names = caOnly.body.cities.map((r: any) => r.name);
    expect(names).toContain('San Francisco');
    expect(names).toContain('Los Angeles');
    expect(names).not.toContain('New York');      // a different state
    const sf = caOnly.body.cities.find((r: any) => r.name === 'San Francisco');
    expect(sf.count).toBeGreaterThanOrEqual(2);

    // without a state, the city list widens back out to the whole country
    const countryWide = await meta({ country: 'United States' });
    expect(countryWide.body.cities.map((r: any) => r.name)).toContain('New York');
  });

  it('geography filters apply to CSV export too', async () => {
    const res = await request(app)
      .get('/api/contacts/export.csv?' + qs({ country: 'United States', state: 'California', city: 'San Francisco' }))
      .set('Authorization', `Bearer ${viewerToken}`);
    expect(res.status).toBe(200);
    expect(res.text).toContain('Geo SF One');
    expect(res.text).not.toContain('Geo LA One');
    expect(res.text).not.toContain('Geo NYC One');
  });

  it('the old region parameter is gone and is simply ignored', async () => {
    const all = await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${viewerToken}`);
    const withRegion = await request(app).get('/api/contacts?region=canada&pageSize=1').set('Authorization', `Bearer ${viewerToken}`);
    expect(withRegion.body.total).toBe(all.body.total);
  });
});


describe('people at the firm (assistants, associates, branch managers)', () => {
  let cid = 0;
  beforeAll(async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Branch Advisor', firm: 'Northgate Wealth', email: 'branch.advisor@northgate.test', city: 'Toronto', country: 'Canada', state: 'ON' });
    cid = c.body.contact.id;
  });
  afterAll(async () => {
    await run('DELETE FROM contacts WHERE id = ?', [cid]).catch(() => null);
  });

  it('adds, lists, edits, and removes people on a contact', async () => {
    const add = await request(app).post(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Dana Reyes', role: 'Executive assistant', email: 'Dana.Reyes@NORTHGATE.test', phone: '416-555-0180' });
    expect(add.status).toBe(201);
    expect(add.body.person.email).toBe('dana.reyes@northgate.test');   // normalised

    await request(app).post(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Sam Okoye', role: 'Branch manager', email: 'sam.okoye@northgate.test' });

    const list = await request(app).get(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${viewerToken}`);
    expect(list.body.people.length).toBe(2);

    const pid = add.body.person.id;
    const edit = await request(app).patch(`/api/contacts/${cid}/people/${pid}`).set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Dana Reyes', role: 'Chief of staff', email: 'dana.reyes@northgate.test', phone: '416-555-0180' });
    expect(edit.status).toBe(200);
    expect(edit.body.person.role).toBe('Chief of staff');

    const del = await request(app).delete(`/api/contacts/${cid}/people/${pid}`).set('Authorization', `Bearer ${editorToken}`);
    expect(del.status).toBe(200);
    const after = await request(app).get(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${viewerToken}`);
    expect(after.body.people.length).toBe(1);
  });

  it('searching an assistant by name or email finds the advisor they work for', async () => {
    await request(app).post(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Priya Raman', role: 'Associate advisor', email: 'priya.raman@northgate.test' });

    const byName = await request(app).get('/api/contacts?q=' + encodeURIComponent('Priya Raman')).set('Authorization', `Bearer ${viewerToken}`);
    expect(byName.body.total).toBe(1);
    expect(byName.body.rows[0].id).toBe(cid);
    expect(byName.body.rows[0].name).toBe('Branch Advisor');   // the contact, not the assistant

    const byEmail = await request(app).get('/api/contacts?q=' + encodeURIComponent('priya.raman@northgate.test')).set('Authorization', `Bearer ${viewerToken}`);
    expect(byEmail.body.total).toBe(1);
    expect(byEmail.body.rows[0].id).toBe(cid);
  });

  it('viewers cannot add or remove people', async () => {
    const res = await request(app).post(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${viewerToken}`)
      .send({ name: 'Nope', email: 'nope@northgate.test' });
    expect(res.status).toBe(403);
  });

  it('requires a name, and rejects a malformed email', async () => {
    const noName = await request(app).post(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${editorToken}`).send({ role: 'Assistant' });
    expect(noName.status).toBe(400);
    const badEmail = await request(app).post(`/api/contacts/${cid}/people`).set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Bad Email', email: 'not-an-email' });
    expect(badEmail.status).toBe(400);
  });

  it('people cannot outlive their contact (foreign key cascades)', async () => {
    // This version has no delete-contact endpoint, so the guarantee we need is
    // the database constraint itself: remove the row and the people go with it,
    // leaving no orphans behind whatever deletes a contact in future.
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Doomed Advisor', firm: 'Doomed Co', email: 'doomed@x.test' });
    const id = c.body.contact.id;
    await request(app).post(`/api/contacts/${id}/people`).set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Doomed Assistant', email: 'doomed.assistant@x.test' });
    expect((await q('SELECT id FROM contact_people WHERE contact_id = ?', [id])).length).toBe(1);

    await run('DELETE FROM contacts WHERE id = ?', [id]);
    const orphans = await q('SELECT id FROM contact_people WHERE contact_id = ?', [id]);
    expect(orphans.length).toBe(0);
  });
});

describe('coverage filters: list, no email, not in pipeline', () => {
  it('filters by source list (advisors versus institutional)', async () => {
    const all = await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${viewerToken}`);
    const meta = await request(app).get('/api/contacts/meta').set('Authorization', `Bearer ${viewerToken}`);
    expect(meta.body.sources.length).toBeGreaterThan(0);
    const src = meta.body.sources[0];
    const res = await request(app).get('/api/contacts?pageSize=200&source=' + encodeURIComponent(src)).set('Authorization', `Bearer ${viewerToken}`);
    expect(res.body.total).toBeGreaterThan(0);
    expect(res.body.total).toBeLessThanOrEqual(all.body.total);
    expect(res.body.rows.every((r: any) => r.source_list === src)).toBe(true);
  });

  it('finds contacts with no email on file', async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Unreachable Person', firm: 'NoMailCo' });
    const res = await request(app).get('/api/contacts?noemail=true&pageSize=200&q=Unreachable').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.body.total).toBe(1);
    expect(res.body.rows[0].email === null || res.body.rows[0].email === '').toBe(true);
    // and it is excluded when the filter is off but "reachable only" is on
    const reach = await request(app).get('/api/contacts?reachable=true&q=Unreachable').set('Authorization', `Bearer ${viewerToken}`);
    expect(reach.body.total).toBe(0);
    await run('DELETE FROM contacts WHERE id = ?', [c.body.contact.id]);
  });

  it('finds contacts not in your pipeline, and drops them once they are', async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Untouched Prospect', firm: 'UntouchedCo', email: 'untouched@x.test' });
    const id = c.body.contact.id;

    const before = await request(app).get('/api/contacts?nopipeline=true&q=Untouched').set('Authorization', `Bearer ${adminToken}`);
    expect(before.body.total).toBe(1);

    await request(app).put(`/api/pipeline/${id}`).set('Authorization', `Bearer ${adminToken}`).send({ status: 'Contacted' });

    const after = await request(app).get('/api/contacts?nopipeline=true&q=Untouched').set('Authorization', `Bearer ${adminToken}`);
    expect(after.body.total).toBe(0);   // now tracked, so no longer "untouched"
    await run('DELETE FROM contacts WHERE id = ?', [id]);
  });
});


describe('import must not destroy the book', () => {
  it('a list with no id column updates existing contacts instead of duplicating them', async () => {
    const before = (await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${adminToken}`)).body.total;
    const known = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Known Advisor', firm: 'Original Firm', email: 'known.advisor@imp.test', phone: '416-555-3000', city: 'Toronto', aum_mm: 640 });
    const id = known.body.contact.id;

    // exactly what a refreshed advisor list looks like: no id column at all
    const csv = 'name,firm,email\nKnown Advisor,Renamed Firm,known.advisor@imp.test\nBrand New One,NewCo,brand.new1@imp.test\nBrand New Two,NewCo,brand.new2@imp.test\n';
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${adminToken}`).send({ csv });
    expect(res.status).toBe(200);
    expect(res.body.created).toBe(2);     // the two we are actually missing
    expect(res.body.updated).toBe(1);     // matched by email, not duplicated

    const after = (await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${adminToken}`)).body.total;
    expect(after).toBe(before + 3);       // 1 known + 2 new, no duplicate of the known one

    const dupes = await q<{ n: number }>("SELECT COUNT(*) AS n FROM contacts WHERE email = 'known.advisor@imp.test'");
    expect(Number(dupes[0].n)).toBe(1);

    for (const e of ['brand.new1@imp.test', 'brand.new2@imp.test']) await run('DELETE FROM contacts WHERE email = ?', [e]);
    await run('DELETE FROM contacts WHERE id = ?', [id]);
  });

  it('a partial list updates only the columns it supplies, and blanks nothing else', async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Partial Target', firm: 'Original', email: 'partial@imp.test', phone: '416-555-7000', city: 'Toronto', state: 'ON', country: 'Canada', aum_mm: 750 });
    const id = c.body.contact.id;

    const csv = 'name,email,firm\nPartial Target,partial@imp.test,Renamed Firm\n';
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${adminToken}`).send({ csv });
    expect(res.body.updated).toBe(1);
    expect(res.body.created).toBe(0);

    const after = (await request(app).get(`/api/contacts/${id}`).set('Authorization', `Bearer ${adminToken}`)).body.contact;
    expect(after.firm).toBe('Renamed Firm');    // supplied -> updated
    expect(after.phone).toBe('416-555-7000');   // absent from the file -> preserved
    expect(after.city).toBe('Toronto');         // absent -> preserved
    expect(after.state).toBe('ON');             // absent -> preserved
    expect(Number(after.aum_mm)).toBe(750);     // absent -> preserved
    await run('DELETE FROM contacts WHERE id = ?', [id]);
  });

  it('exporting the book and re-importing it leaves the book the same size', async () => {
    const before = (await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${viewerToken}`)).body.total;
    const csv = (await request(app).get('/api/contacts/export.csv?priority=A').set('Authorization', `Bearer ${viewerToken}`)).text;
    const res = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${adminToken}`).send({ csv });
    expect(res.body.created).toBe(0);
    const after = (await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${viewerToken}`)).body.total;
    expect(after).toBe(before);
  });
});

describe('the role model holds', () => {
  // Deliberate, per the Users panel: admins manage users and the book itself,
  // editors work the pipeline on top of it. Documented here so it is a decision
  // rather than an accident.
  it('editors can create a contact; viewers cannot; import stays admin-only', async () => {
    const ed = await request(app).post('/api/contacts').set('Authorization', `Bearer ${editorToken}`)
      .send({ name: 'Met At Conference', firm: 'ConfCo', email: 'met@conf.test' });
    expect(ed.status).toBe(201);
    await run('DELETE FROM contacts WHERE id = ?', [ed.body.contact.id]);

    const vw = await request(app).post('/api/contacts').set('Authorization', `Bearer ${viewerToken}`)
      .send({ name: 'Nope', firm: 'NopeCo', email: 'nope@conf.test' });
    expect(vw.status).toBe(403);

    const imp = await request(app).post('/api/contacts/import').set('Authorization', `Bearer ${editorToken}`)
      .send({ csv: 'name,email\nSneaky,sneaky@x.test\n' });
    expect(imp.status).toBe(403);
  });

  it('but editors can edit the contacts that exist, and work the pipeline', async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Editable One', firm: 'EditCo', email: 'editable@x.test' });
    const id = c.body.contact.id;
    const edit = await request(app).patch(`/api/contacts/${id}`).set('Authorization', `Bearer ${editorToken}`)
      .send({ phone: '416-555-9100' });
    expect(edit.status).toBe(200);
    const pipe = await request(app).put(`/api/pipeline/${id}`).set('Authorization', `Bearer ${editorToken}`)
      .send({ status: 'Contacted' });
    expect(pipe.status).toBe(200);
    await run('DELETE FROM contacts WHERE id = ?', [id]);
  });
});


describe('firm type, email status, and foundation filters', () => {
  it('filters by firm type, stacking with geography', async () => {
    const meta = await request(app).get('/api/contacts/meta').set('Authorization', `Bearer ${viewerToken}`);
    expect(meta.body.firmTypes.length).toBeGreaterThan(0);
    expect(meta.body.emailStatuses.length).toBeGreaterThan(0);
    const ft = meta.body.firmTypes[0];
    const all = await request(app).get('/api/contacts?pageSize=200&firmtype=' + encodeURIComponent(ft)).set('Authorization', `Bearer ${viewerToken}`);
    expect(all.body.total).toBeGreaterThan(0);
    expect(all.body.rows.every((r: any) => r.firm_type === ft)).toBe(true);
    const stacked = await request(app).get('/api/contacts?pageSize=200&' + new URLSearchParams({ firmtype: ft, country: 'United States' })).set('Authorization', `Bearer ${viewerToken}`);
    expect(stacked.body.total).toBeLessThanOrEqual(all.body.total);
  });

  it('filters by email status', async () => {
    const meta = await request(app).get('/api/contacts/meta').set('Authorization', `Bearer ${viewerToken}`);
    const es = meta.body.emailStatuses[0];
    const res = await request(app).get('/api/contacts?pageSize=200&emailstatus=' + encodeURIComponent(es)).set('Authorization', `Bearer ${viewerToken}`);
    expect(res.body.total).toBeGreaterThan(0);
    expect(res.body.rows.every((r: any) => r.email_status === es)).toBe(true);
  });

  it('filters by the foundation flag and applies to CSV export', async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Foundation Probe', firm: 'FdnCo', email: 'fdn@x.test', foundation: true });
    const id = c.body.contact.id;
    const res = await request(app).get('/api/contacts?foundation=true&q=Foundation Probe').set('Authorization', `Bearer ${viewerToken}`);
    expect(res.body.total).toBe(1);
    const csv = await request(app).get('/api/contacts/export.csv?foundation=true').set('Authorization', `Bearer ${viewerToken}`);
    expect(csv.status).toBe(200);
    expect(csv.text).toContain('Foundation Probe');
    await run('DELETE FROM contacts WHERE id = ?', [id]);
  });
});


describe('desk report (grouped rollups over the current filters)', () => {
  it('grouping by firm type reconciles exactly with the list', async () => {
    const rep = await request(app).get('/api/contacts/report?by=firmtype').set('Authorization', `Bearer ${viewerToken}`);
    expect(rep.status).toBe(200);
    const total = rep.body.rows.reduce((a: number, r: any) => a + Number(r.contacts), 0);
    const list = await request(app).get('/api/contacts?pageSize=1').set('Authorization', `Bearer ${viewerToken}`);
    expect(total).toBe(list.body.total);
    const manual = await q<{ n: number }>(
      "SELECT COUNT(*) AS n FROM contacts WHERE COALESCE(NULLIF(firm_type,''),'x') = ?",
      [rep.body.rows[0].bucket]
    );
    expect(Number(rep.body.rows[0].contacts)).toBe(Number(manual[0].n));
  });

  it('honors the same filters as the list', async () => {
    const qs = 'country=' + encodeURIComponent('United States');
    const rep = await request(app).get('/api/contacts/report?by=tier&' + qs).set('Authorization', `Bearer ${viewerToken}`);
    const total = rep.body.rows.reduce((a: number, r: any) => a + Number(r.contacts), 0);
    const list = await request(app).get('/api/contacts?pageSize=1&' + qs).set('Authorization', `Bearer ${viewerToken}`);
    expect(total).toBe(list.body.total);
  });

  it('rolls my open pipeline dollars into the right bucket, and rejects unknown dimensions', async () => {
    const c = await request(app).post('/api/contacts').set('Authorization', `Bearer ${adminToken}`)
      .send({ name: 'Rollup Probe', firm: 'RollCo', email: 'roll@x.test', firm_type: 'Wirehouse' });
    const id = c.body.contact.id;
    await request(app).put(`/api/pipeline/${id}`).set('Authorization', `Bearer ${adminToken}`).send({ status: 'Meeting', opp: 125 });
    const rep = await request(app).get('/api/contacts/report?by=firmtype&q=rollup probe').set('Authorization', `Bearer ${adminToken}`);
    const row = rep.body.rows.find((r: any) => r.bucket === 'Wirehouse');
    expect(Number(row.in_pipeline)).toBe(1);
    expect(Number(row.open_opp)).toBe(125);
    const bad = await request(app).get('/api/contacts/report?by=DROP TABLE').set('Authorization', `Bearer ${viewerToken}`);
    expect(bad.status).toBe(400);
    await run('DELETE FROM contacts WHERE id = ?', [id]);
  });
});


describe('temporary passwords must be changed at first sign-in', () => {
  it('an admin-created account signs in with mustChange, and self-change clears it', async () => {
    await request(app).post('/api/auth/users').set('Authorization', `Bearer ${adminToken}`)
      .send({ email: 'fresh@ninepoint.test', password: 'TempHandout1', role: 'viewer' });
    const l1 = await request(app).post('/api/auth/login').send({ email: 'fresh@ninepoint.test', password: 'TempHandout1' });
    expect(l1.body.user.mustChange).toBe(true);
    const change = await request(app).post('/api/auth/password').set('Authorization', `Bearer ${l1.body.token}`)
      .send({ currentPassword: 'TempHandout1', newPassword: 'MyOwnChoice22' });
    expect(change.status).toBe(200);
    const l2 = await request(app).post('/api/auth/login').send({ email: 'fresh@ninepoint.test', password: 'MyOwnChoice22' });
    expect(l2.body.user.mustChange).toBe(false);
    await run("DELETE FROM users WHERE email = 'fresh@ninepoint.test'");
  });

  it('an admin resetting someone re-arms the requirement', async () => {
    await request(app).post('/api/auth/users').set('Authorization', `Bearer ${adminToken}`)
      .send({ email: 'rearm@ninepoint.test', password: 'TempHandout1', role: 'viewer' });
    const l1 = await request(app).post('/api/auth/login').send({ email: 'rearm@ninepoint.test', password: 'TempHandout1' });
    await request(app).post('/api/auth/password').set('Authorization', `Bearer ${l1.body.token}`)
      .send({ currentPassword: 'TempHandout1', newPassword: 'MyOwnChoice22' });
    const u = await one<{ id: number }>("SELECT id FROM users WHERE email = 'rearm@ninepoint.test'");
    await request(app).post(`/api/auth/users/${u!.id}/password`).set('Authorization', `Bearer ${adminToken}`)
      .send({ password: 'AdminHandout9' });
    const l2 = await request(app).post('/api/auth/login').send({ email: 'rearm@ninepoint.test', password: 'AdminHandout9' });
    expect(l2.body.user.mustChange).toBe(true);
    await run("DELETE FROM users WHERE email = 'rearm@ninepoint.test'");
  });

  it('test-email is admin-only and reports missing SMTP clearly', async () => {
    const asEditor = await request(app).post('/api/auth/test-email').set('Authorization', `Bearer ${editorToken}`);
    expect(asEditor.status).toBe(403);
    const asAdmin = await request(app).post('/api/auth/test-email').set('Authorization', `Bearer ${adminToken}`);
    expect(asAdmin.status).toBe(400);
    expect(asAdmin.body.error).toContain('SMTP');
  });
});
