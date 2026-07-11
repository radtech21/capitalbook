# Capital Book: setup for this change

Two things shipped: the three desk accounts with a working password reset, and
cascading geography filters. Everything else in this version is unchanged.

## Filtering

Geography narrows in three steps, stacked in the sidebar:

    Country  ->  Province / State  ->  City

Each level is disabled until the one above it is chosen, and holds only the
values that exist beneath it, ordered biggest first with contact counts:

* United States -> 53 states (New York 231, California 196, Texas 108, ...)
* California -> 39 cities (San Francisco 51, Los Angeles 41, Menlo Park 28, ...)
* Canada -> 9 provinces (ON 318, BC 149, AB 88, ...)

Changing a level clears everything under it, so a stale filter can never silently
return zero rows: pick California, then San Francisco, then switch to New York,
and the city clears rather than filtering to a San Francisco that no longer
exists in that state.

The lists are scoped rather than shown all at once because the book holds 53
states and 550 cities. Countries with no province recorded say so and stay
disabled. All of it stacks with the other filters and applies to CSV export.

The old Region filter has been removed. It duplicated Country.

Three more filters were added, all of which the API already supported or the book
plainly needed:

* **List** - the broadest cut in the book: Barron's Top 1,200 (1,234 advisors) vs
  Global Pension & Institutional (1,210 institutions). The API always accepted
  this; the sidebar simply never exposed it.
* **No email on file** - the 627 contacts you cannot reach at all. The existing
  "Reachable only" checkbox was the positive case; this is the coverage gap.
* **Not in my pipeline** - names you have never touched.

## People at a firm

A contact keeps its one primary email. Everyone else you deal with at that desk
(the assistant, the associate advisor, the branch manager) is recorded underneath
it in the contact drawer, with a name, role, email, and phone.

The point is that they are **searchable**. Type an assistant's email or name into
the main search box and you get back the advisor they work for, not a separate
record. That is the whole reason to store them here rather than in a spreadsheet.

Editors and admins can add and remove them; viewers see them read-only. They are
tied to the contact by a foreign key that cascades, so they can never be orphaned.

## What changed

**Backend (`capitalback`)**

| File | Change |
| --- | --- |
| `migrations/002_auth.sql` | new. Adds `reset_token_hash` and `reset_expires_at` to `users`. Additive only. |
| `migrations/003_contact_people.sql` | new. Adds the `contact_people` table (name, role, email, phone per contact). Additive only. |
| `src/mailer.ts` | new. Sends the reset email over SMTP. Configured entirely from env, no settings table. |
| `src/routes/auth.ts` | adds `POST /auth/forgot`, `POST /auth/reset`, `POST /auth/password`, `POST /auth/users`, `DELETE /auth/users/:id`, `POST /auth/users/:id/password`, `GET /auth/policy`. Closes `POST /auth/register` unless `ALLOW_REGISTRATION=true`. |
| `src/routes/contacts.ts` | adds `state` and `city` filters alongside `country` in the shared filter builder, so they apply to the list and the CSV export. `GET /contacts/meta?country=X&state=Y` returns the provinces in that country and the cities in that province, with counts. |
| `seeds/users.ts` | new. Creates the three accounts and nothing else. Safe on a live database. |
| `seeds/seed.ts` | full seed now delegates account creation to `seeds/users.ts`. No demo accounts. |
| `.env.example` | documents `SMTP_*`, `APP_URL`, `ALLOW_REGISTRATION`, `SEED_USER_PASSWORD`. |
| `test/api.test.ts` | 79 -> 101 tests. Reset flow is tested against a real in-process SMTP server. |

New dependency: `nodemailer`. Dev only: `smtp-server`.

**Frontend (`capitalbook`)**

| File | Change |
| --- | --- |
| `app.html` | sign-in screen reworked: no prefilled credentials, no published demo passwords, adds "Forgot password?" and a set-new-password view. Adds Province / State and City filters under Country, an Account panel, and the add-user form in Users. |
| `js/app.js` | wires the reset flow, the country/state/city cascade, self password change, and admin add/remove/set-password. |
| `css/app.css` | styles for the above. |

## Setting up an EXISTING database (your RDS)

Do not run `npm run seed` against it. The full seed upserts all 2,444 seeded
contacts by id and would revert any edits your desk has made to them (name,
firm, title, phone, city, segment, priority). Owners, pipeline, tags, tasks,
activities, and contacts you added yourself are not affected, but the contact
fields would be.

```bash
cd capitalback
npm install
npm run migrate        # applies 002 and 003; already-applied files are skipped
npm run seed:users     # creates the three accounts, touches nothing else
```

`npm run seed:users` prints each password once. It is idempotent: run it twice
and it leaves existing accounts alone.

Then, signed in as an admin, open Users and remove the old demo accounts
(`admin@capitalbook.local`, `editor@…`, `viewer@…`) if they still exist.

## Setting up a FRESH database

```bash
cd capitalback
npm install
cp .env.example .env   # fill it in
npm run setup          # migrate + full seed (contacts, templates, the three accounts)
```

## Environment

Required as before: `DB_*`, `JWT_SECRET`, `PORT`, `CORS_ORIGIN`.

New:

```
SMTP_HOST=smtp.yourprovider.com
SMTP_PORT=587
SMTP_SECURE=false
SMTP_USER=...
SMTP_PASS=...
SMTP_FROM="Capital Book <no-reply@ninepoint.com>"

APP_URL=https://app.capitalbook.ca     # where the FRONTEND is served
ALLOW_REGISTRATION=false               # keep this off
```

`APP_URL` is the one people get wrong. Reset links are built from it, so it must
point at wherever `app.html` is served, not at the API.

Without `SMTP_HOST` and `SMTP_FROM`, "Forgot password?" returns a clear message
saying reset email is not configured, and admins set passwords from the Users
panel instead. Everything else works normally.

## How password reset behaves

The link is single use and expires in 60 minutes. Only a SHA-256 hash of the
token is stored, so a database leak cannot be replayed into account takeover.
The endpoint returns the same response whether or not the address has an
account, so it cannot be used to discover who has one.
