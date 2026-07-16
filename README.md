# Capital Book — Backend

API for the Capital Book CRM (Express + TypeScript + MySQL/MariaDB).

The frontend lives in [`../frontend`](../frontend) of this same repository.

See [SETUP.md](./SETUP.md) for full local setup (database, environment variables, seeding).

## Quick start

```
npm install
cp .env.example .env   # fill in DB_* / JWT_SECRET / SMTP_* etc.
npm run setup           # migrate + seed
npm run dev
```
