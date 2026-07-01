import 'dotenv/config';
import { createApp } from './app.js';
import { contactCount } from './db.js';

const app = createApp();
const PORT = Number(process.env.PORT || 4000);

app.listen(PORT, async () => {
  console.log(`Capital Book API listening on http://localhost:${PORT}`);
  try {
    const n = await contactCount();
    console.log(`Contacts in database: ${n.toLocaleString()}`);
    if (n === 0) console.log('No contacts found. Run: npm run setup');
  } catch (e) {
    console.log('Could not reach the database yet. Check your .env and run: npm run migrate && npm run seed');
  }
});
