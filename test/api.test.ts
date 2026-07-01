import { describe, it, expect, beforeAll, afterAll } from 'vitest';
import request from 'supertest';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import mysql from 'mysql2/promise';
import { createApp } from '../src/app.js';
import { pool, one, run, closePool } from '../src/db.js';
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
  // Ensure the test database exists with the current schema, then start clean.
  const ddl = readFileSync(join(__dirname, '..', 'migrations', '001_init.sql'), 'utf8');
  const dbName = process.env.DB_NAME || 'capitalbook_test';
  const root = await mysql.createConnection({
    host: process.env.DB_HOST || '127.0.0.1',
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER || 'cbuser',
    password: process.env.DB_PASSWORD || 'cbpass',
    multipleStatements: true,
  });
  await root.query(`CREATE DATABASE IF NOT EXISTS \`${dbName}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`);
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
  it('blocks editors from creating (admin only) (403)', async () => {
    const res = await request(app).post('/api/contacts').set('Authorization', `Bearer ${editorToken}`).send({ name: 'Nope' });
    expect(res.status).toBe(403);
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
