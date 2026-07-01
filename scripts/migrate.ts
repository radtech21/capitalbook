import { readdirSync, readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import mysql from 'mysql2/promise';
import 'dotenv/config';

const __dirname = dirname(fileURLToPath(import.meta.url));
const migrationsDir = join(__dirname, '..', 'migrations');

const DB = {
  host: process.env.DB_HOST || '127.0.0.1',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER || 'cbuser',
  password: process.env.DB_PASSWORD || 'cbpass',
  database: process.env.DB_NAME || 'capitalbook',
};

async function main() {
  // Connect without selecting a database first, so we can create it if needed.
  const root = await mysql.createConnection({
    host: DB.host, port: DB.port, user: DB.user, password: DB.password, multipleStatements: true,
  });
  // Try to create the database. If the user lacks the global privilege, assume an
  // admin already created it and continue (USE will fail clearly if it truly is missing).
  try {
    await root.query(`CREATE DATABASE IF NOT EXISTS \`${DB.database}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci`);
  } catch (e) {
    console.log(`(could not create database, assuming it exists: ${(e as Error).message})`);
  }
  await root.query(`USE \`${DB.database}\``);
  await root.query(
    `CREATE TABLE IF NOT EXISTS schema_migrations (
       filename   VARCHAR(255) NOT NULL PRIMARY KEY,
       applied_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
     ) ENGINE=InnoDB`
  );

  const [appliedRows] = (await root.query('SELECT filename FROM schema_migrations')) as any;
  const applied = new Set((appliedRows as any[]).map((r) => r.filename));

  const files = readdirSync(migrationsDir).filter((f) => f.endsWith('.sql')).sort();
  let ran = 0;
  for (const file of files) {
    if (applied.has(file)) { console.log(`= skip ${file} (already applied)`); continue; }
    const sql = readFileSync(join(migrationsDir, file), 'utf8');
    process.stdout.write(`+ applying ${file} ... `);
    await root.query(sql);
    await root.query('INSERT INTO schema_migrations (filename) VALUES (?)', [file]);
    console.log('done');
    ran++;
  }

  const [[{ n }]] = (await root.query('SELECT COUNT(*) AS n FROM information_schema.tables WHERE table_schema = ?', [DB.database])) as any;
  console.log(`Migrations complete. ${ran} applied this run. Database "${DB.database}" now has ${n} tables.`);
  await root.end();
}

main().catch((e) => { console.error('Migration failed:', e.message); process.exit(1); });
