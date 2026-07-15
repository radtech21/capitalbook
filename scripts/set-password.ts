// Break-glass password reset, run from the server with database access.
//
//   npm run set-password -- jlo@ninepoint.com                 (generates one)
//   npm run set-password -- jlo@ninepoint.com 'MyNewPass123'  (sets a chosen one)
//   npm run set-password -- --list                            (who exists)
//
// This is the way back in when nobody can sign in and SMTP is not configured.
// It needs shell access to the server and the database credentials, which is the
// correct security boundary: whoever can run this could read the database anyway.

import 'dotenv/config';
import { randomBytes } from 'node:crypto';
import { pool, q, one, run, closePool } from '../src/db.js';
import { hashPassword } from '../src/auth.js';

async function main() {
  const args = process.argv.slice(2).filter((a) => a !== '--');

  if (args[0] === '--list' || args.length === 0) {
    const users = await q<{ id: number; email: string; name: string; role: string }>(
      'SELECT id, email, name, role FROM users ORDER BY id'
    );
    if (!users.length) {
      console.log('\nNo users exist. Run `npm run seed:users` to create the three desk accounts.\n');
      return;
    }
    console.log('\nUsers in this database:\n');
    for (const u of users) console.log(`  ${String(u.id).padStart(3)}  ${u.email.padEnd(28)} ${u.role.padEnd(7)} ${u.name}`);
    console.log('\nTo reset one:  npm run set-password -- <email> [password]\n');
    return;
  }

  const email = String(args[0]).toLowerCase().trim();
  const user = await one<{ id: number; email: string; role: string }>(
    'SELECT id, email, role FROM users WHERE email = ?', [email]
  );
  if (!user) {
    console.error(`\nNo account with the email "${email}".`);
    console.error('Run `npm run set-password -- --list` to see who exists.\n');
    process.exitCode = 1;
    return;
  }

  const chosen = args[1];
  if (chosen && chosen.length < 8) {
    console.error('\nPassword must be at least 8 characters.\n');
    process.exitCode = 1;
    return;
  }
  const password = chosen || randomBytes(9).toString('base64url');

  await run(
    'UPDATE users SET password_hash = ?, reset_token_hash = NULL, reset_expires_at = NULL, must_change_password = 1 WHERE id = ?',
    [hashPassword(password), user.id]
  );

  console.log(`\nPassword set for ${user.email} (${user.role}).`);
  if (!chosen) {
    console.log('\n  ' + password + '\n');
    console.log('Shown once. Hand it over directly. They will be required to set their own at next sign-in.\n');
  } else {
    console.log('\nAny outstanding reset links for this account are now void.\n');
  }
}

main()
  .then(() => closePool())
  .catch(async (e) => { console.error('Failed:', e); await closePool(); process.exit(1); });
