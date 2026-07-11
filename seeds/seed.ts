import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { pool, closePool, one } from '../src/db.js';
import { randomBytes } from 'node:crypto';
import { hashPassword } from '../src/auth.js';
import { seedUsers } from './users.js';
import type { Role } from '../src/types.js';

const __dirname = dirname(fileURLToPath(import.meta.url));

const CONTACT_COLS = [
  'id', 'name', 'title', 'firm', 'segment', 'priority', 'lead_score', 'email', 'email_status',
  'phone', 'city', 'state', 'country', 'sub_region', 'aum_mm', 'aum_tier', 'net_worth_mm',
  'firm_type', 'state_rank', 'rank_movement', 'uhnw', 'institutional', 'foundation',
  'client_types', 'reachable', 'source_list', 'data_flags',
];


async function seedTemplates() {
  const admin = await one<{ id: number }>("SELECT id FROM users WHERE email = 'admin@capitalbook.local'");
  const adminId = admin ? admin.id : null;
  const templates = [
    {
      name: 'Intro - Fund Manager',
      subject: 'Introduction: {{firm}} and our systematic strategies',
      body: 'Hi {{first_name}},\n\nI lead capital formation for a systematic strategy and am reaching out to {{firm}} given your work across {{segment}}. We run a track record I think would be relevant to your mandate.\n\nWould you be open to a short introductory call in the next two weeks?\n\nBest regards',
    },
    {
      name: 'Follow-up',
      subject: 'Following up - {{firm}}',
      body: 'Hi {{first_name}},\n\nCircling back on my note below. Happy to send a one-page summary or find time that works for you.\n\nThanks,',
    },
  ];
  let added = 0;
  for (const t of templates) {
    const exists = await one("SELECT id FROM templates WHERE name = ?", [t.name]);
    if (!exists) {
      await pool.query('INSERT INTO templates (name, subject, body, created_by) VALUES (?, ?, ?, ?)', [t.name, t.subject, t.body, adminId]);
      added++;
    }
  }
  console.log(`Seeded ${added} starter template(s).`);
}

async function seedContacts() {
  const seedPath = join(__dirname, '..', 'seeds', 'contacts-seed.json');
  const data = JSON.parse(readFileSync(seedPath, 'utf8')) as Record<string, any>[];
  const updateClause = CONTACT_COLS.filter((c) => c !== 'id').map((c) => `${c} = VALUES(${c})`).join(', ');
  const sql = `INSERT INTO contacts (${CONTACT_COLS.join(', ')}) VALUES ? ON DUPLICATE KEY UPDATE ${updateClause}`;

  const CHUNK = 500;
  let total = 0;
  for (let i = 0; i < data.length; i += CHUNK) {
    const slice = data.slice(i, i + CHUNK);
    const values = slice.map((c) => CONTACT_COLS.map((col) => (c[col] === undefined ? null : c[col])));
    await pool.query(sql, [values]);
    total += slice.length;
  }
  console.log(`Seeded ${total.toLocaleString()} contacts.`);
}

async function main() {
  await seedUsers();
  await seedTemplates();
  await seedContacts();
  const c = await one<{ n: number }>('SELECT COUNT(*) AS n FROM contacts');
  console.log(`Seed complete. Database holds ${Number(c!.n).toLocaleString()} contacts.`);
  await closePool();
}

main().catch(async (e) => { console.error('Seed failed:', e.message); try { await closePool(); } catch { /* */ } process.exit(1); });
