// Creates the desk's user accounts and nothing else.
//
// This is the safe one to run against a live database: it never touches
// contacts, pipeline, tags, tasks, activities, or templates. It only adds the
// accounts below if they do not already exist, and leaves existing users alone.
//
//   npm run seed:users
//
// Passwords come from SEED_USER_PASSWORD if set, otherwise each account gets a
// strong random password, printed once, here. Nothing is stored in plain text.

import { randomBytes } from 'node:crypto';
import { pool, one, closePool } from '../src/db.js';
import { hashPassword } from '../src/auth.js';
import type { Role } from '../src/types.js';

export const ACCOUNTS: Array<[string, string, Role]> = [
  ['jlo@ninepoint.com', 'J. Lo', 'admin'],
  ['smitter@ninepoint.com', 'S. Mitter', 'admin'],
  ['tonyg@ninepoint.com', 'Tony Genua', 'admin'],
];

export async function seedUsers(): Promise<void> {
  const shared = process.env.SEED_USER_PASSWORD;
  const created: Array<[string, string]> = [];

  for (const [email, name, role] of ACCOUNTS) {
    const existing = await one<{ id: number }>('SELECT id FROM users WHERE email = ?', [email]);
    if (existing) {
      console.log(`  ${email} already exists, left untouched.`);
      continue;
    }
    const pw = shared || randomBytes(9).toString('base64url');
    await pool.query(
      'INSERT INTO users (email, password_hash, name, role) VALUES (?, ?, ?, ?)',
      [email, hashPassword(pw), name, role]
    );
    created.push([email, pw]);
  }

  if (created.length) {
    console.log('\nAccounts created (admin). Passwords are shown once, here:\n');
    for (const [email, pw] of created) console.log(`  ${email.padEnd(26)} ${pw}`);
    console.log('\nSign in, then change your password under Account. "Forgot password?" on the');
    console.log('sign-in screen also works once SMTP_HOST and SMTP_FROM are set.\n');
  } else {
    console.log('\nNo new accounts to create.\n');
  }
}

// standalone entry point: `npm run seed:users`
const isDirect = process.argv[1] && process.argv[1].endsWith('users.ts');
if (isDirect) {
  seedUsers()
    .then(() => closePool())
    .catch(async (e) => { console.error('Seeding users failed:', e); await closePool(); process.exit(1); });
}
