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

Three more cuts were added after auditing which columns held real data but were
not filterable:

* **Firm type** - the distribution axis: Wirehouse (739), Independent RIA (206),
  Regional / National B-D (183), Public Pension (87), and so on. Ordered biggest
  first because the column has a long tail of 89 distinct values.
* **Email status** - whether an address is Provided (618), a Constructed pattern
  (909), Verified (198), or there is No public contact (570). Check this before
  trusting a campaign to the book.
* **Foundation** - the 263 foundation-flagged contacts, alongside the existing
  UHNW and Institutional checkboxes.

Considered and rejected: lead_score (opaque provenance, priority already encodes
desk judgment), rank_movement (half the rows are blank), client_types (free-text
combinations), and last-activity staleness (the activities table is empty today;
worth revisiting once activity logging is in daily use).

## Report

The **Report** button in the toolbar (everyone, including viewers) takes whatever
you have filtered right now and groups it by one dimension: firm type, segment,
country, province, AUM tier, priority, email status, list, your pipeline status,
or owner. Each group shows contact count with share, AUM rolled up, how many sit
in your pipeline, and your open opportunity dollars. Inline bars, CSV export. It
runs the exact same filter engine as the list, so the numbers always reconcile
with what is on screen. This is the report builder from Sales Nebula distilled to
the one query shape a distribution desk uses daily.

## Pipeline board

The **Board** button in the topbar shows your pipeline as a kanban: one column
per stage (New, Contacted, Replied, Meeting, Passed), a card per contact with
firm, opportunity, and due date, and a money rollup in each column header.
Editors and admins drag cards between columns to move status; viewers get the
same board read-only. Clicking a card opens the contact drawer. Also ported from
Sales Nebula.

Considered from Sales Nebula and rejected: the AI routes (deal coach, forecast)
need an external model API; document upload adds server storage and backup
burden; scheduled reports need cron plus SMTP; and the ERP modules have no place
in a wealth book. Any of these can be revisited deliberately.

## Command palette

Press **Ctrl+K** (Cmd+K on a Mac), or click the "Ctrl K" chip in the search box.
One box reaches everything: type a few letters to jump to any contact in the
book (live search, arrow keys, Enter opens the drawer), or run an action:
tasks, feed, dashboard, templates, export the current view, reset all filters,
account, sign out. Admins also get Import, Manage users, and Audit log; viewers
never see those. Esc closes only the palette, never whatever is open beneath it.

## Meeting brief

Every contact drawer has a **Print brief** button: one clean page to walk into a
call with. It carries the contact header, segment/priority/AUM/location, email
with its status, your pipeline entry (status, next step, opportunity, point of
contact, note), the people at the firm, open tasks with due dates, and the last
six activities. Dated and attributed to whoever printed it. The brief exists only
on paper: it is invisible in the app and the print stylesheet renders nothing
else. Print to PDF from the dialog to attach it to an email.

## Integrations

Two were added; both generate standard files in the browser, so there is no
server component, no OAuth, and nothing to configure:

* **Calendar (.ics)** - in My tasks. Exports every open task that has a due date
  as an all-day event (RFC 5545, one VEVENT per task, linked contact in the
  description). Opens in Outlook, Apple Calendar, and Google Calendar.
* **Save .vcf** - in the contact drawer. A vCard 3.0 with name, title, firm,
  email, phone, and city/country. Opens in Outlook, iPhone/Apple Contacts, and
  Google Contacts.

Considered and rejected for now: SSO/OAuth sign-in, two-way Gmail/Outlook sync,
webhooks/Zapier, and sending email from inside the app. The compose window plus
templates already hand a drafted email to your real mail client, which keeps
deliverability and retention where compliance expects them. All four are real
projects, not features; say the word if one becomes worth it.

Also fixed in this round: **Reset filters** was not clearing the List, No-email,
and Not-in-pipeline filters (they were added after the reset handler was written
and never wired in). Reset now clears every filter, including the three new ones.

Three more filters were added, all of which the API already supported or the book
plainly needed:

* **List** - the broadest cut in the book: Barron's Top 1,200 (1,234 advisors) vs
  Global Pension & Institutional (1,210 institutions). The API always accepted
  this; the sidebar simply never exposed it.
* **No email on file** - the 627 contacts you cannot reach at all. The existing
  "Reachable only" checkbox was the positive case; this is the coverage gap.
* **Not in my pipeline** - names you have never touched.

## Screen sizes

Three tiers, because the topbar and the contact table run out of room at
different widths.

**Above 1250px** - the original desktop layout: every action inline in the topbar,
a 230px filter rail, the seven-column table.

**861 to 1250px** - the topbar alone collapses into a menu behind a hamburger.
Eight buttons plus the brand, search, user and Sign out need about 1257px of
width that cannot shrink, so on a 1024px or 1366px-with-sidebar laptop the bar
could not fit. Because the app shell is a CSS grid, that width became a floor on
the whole page: a 1024px window still rendered 1257px wide and scrolled sideways.
The filter rail and the table are untouched at this tier.

**860px and below** - full mobile. The filter rail becomes a sheet opened by a
Filters button (with a badge showing how many filters are on), list rows reflow
into cards, and the drawer and modals go full screen.

Verified with no horizontal scroll at 375, 390, 768, 1024, 1152, 1200, 1280,
1366, 1440, 1600, and 1920px, and confirmed that widening the window never leaves
a sheet stuck open.

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

## Two bugs fixed in the base

Both existed before this work and both destroyed data quietly.

**Import duplicated the whole book.** Rows were matched to existing contacts by
`id` alone. An advisor list from any outside source has no `id` column, so every
row was given a fresh id: re-importing a refreshed copy of your 2,444 contacts
would have created 2,444 duplicates. Rows are now matched by email, and the
result reports `created` and `updated` separately.

**Import blanked columns the file did not carry.** A partial list (name, email,
firm) overwrote phone, city, province, and AUM with empty values on every row it
touched. Imports now write only the columns actually present in the file.

**Saved views dropped half their filters.** The save routine stored six of the
twelve filters, so a view built as "Canada / Ontario / Toronto / priority A" came
back as "Canada / priority A". Worse, the dropped filters were not cleared on
apply, so a view could inherit whatever was on screen a moment earlier and return
rows nobody asked for. Views now round-trip every filter, rebuild the province and
city dropdowns for the saved country, and clear anything the view does not name.

## What an admin can do

**Admin only**

* **Users** - add people (name, email, temporary password, role), set anyone's
  password, change roles inline, remove people. Self-registration is off, so this
  is the only way accounts are created.
* **Audit** - every material action, newest first: who did it, to what, when.
  Sensitive actions (password changes, user creation and deletion, imports) are
  highlighted. Filterable, and exportable to CSV for compliance.
* **Import** - bulk CSV import of contacts.
* Creating a new contact, and deleting a tag.

**Editor and admin**

Edit contacts and bulk-edit them, assign owners, move the pipeline, log activities,
create and complete tasks, manage tags, write email templates, and add or remove
the people at a firm.

**Everyone, including viewers**

Search, the full filter set, saved views, CSV export, the dashboard, the activity
feed, and reading contacts.

Contact creation is open to editors (changed on explicit instruction; it was
admin-only by original design). A "New contact" button sits in the toolbar for
editors and admins, and in the command palette. Only a name is required; the
drawer opens on the new record so the rest can be filled in. Bulk import remains
admin-only, and viewers can still create nothing.

## First sign-in password policy

Temporary passwords cannot be kept. Any password that was handed to someone,
rather than chosen by them, arms a requirement: at their next sign-in the app
holds them at the change-password screen (Escape, the close button, and the
backdrop are all disabled) until they set their own. The requirement is armed by
an admin creating an account, an admin using "Set password", the break-glass
CLI, and the seed. It is cleared by the person changing their password under
Account or completing an emailed reset link.

To apply this to the three existing desk accounts sharing TonyG2026, run
`force-password-change.sql` (delivered alongside the zips) once on the live
database after `npm run migrate`. Each person signs in once more with the shared
password and is required to pick their own before doing anything else.

## Credential rotation runbook

The `.env` uploaded at the start of this engagement contained the live RDS
endpoint, an admin database password, and the JWT signing secret. Treat all
three as exposed and rotate them. None of this requires code changes.

**JWT secret.** Generate locally, never in a chat or ticket:

```bash
openssl rand -base64 48
```

Put the value in `JWT_SECRET` in the server `.env` and restart the API. Every
existing session token becomes invalid immediately, which is the point;
everyone signs in again.

**Database credential.** Better than rotating the admin password is retiring it
from the app entirely. On RDS, connect as admin once and create a dedicated
application user:

```sql
CREATE USER 'capitalapp'@'%' IDENTIFIED BY '<generate with: openssl rand -base64 24>';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP, REFERENCES
  ON capital.* TO 'capitalapp'@'%';
FLUSH PRIVILEGES;
```

Point `DB_USER` / `DB_PASSWORD` in `.env` at the new account, restart, and then
change the RDS admin password in the AWS console (RDS, your instance, Modify,
new master password) so the exposed one is dead. `npm run set-password -- --list`
doubles as a quick connectivity check after the swap.

## SMTP quickstart

"Forgot password?" and the Users panel's **Send test email** need five values in
the server `.env`:

```
SMTP_HOST=email-smtp.eu-west-1.amazonaws.com
SMTP_PORT=587
SMTP_USER=<SES SMTP username>
SMTP_PASS=<SES SMTP password>
SMTP_FROM="Capital Book <no-reply@yourdomain>"
APP_URL=https://capitalbook.ca
```

Since the database already lives in eu-west-1, SES in the same region is the
natural relay: verify the sending domain or address in SES, create SMTP
credentials, paste them in, restart the API, then sign in as an admin and press
**Send test email** in the Users panel. It emails your own address and reports
the exact failure if anything is wrong. Until SMTP is set, that button says so
plainly, reset links are unavailable, and `npm run set-password` on the server
remains the recovery path.

## Passwords

There are no default passwords. `npm run seed:users` generates a random one per
account and prints it exactly once; only a bcrypt hash is stored. Nothing is
hardcoded anywhere in this repository.

If you would rather choose the password up front, set it before the first seed:

```bash
SEED_USER_PASSWORD='SomethingStrong123' npm run seed:users
```

That only applies to accounts that do not exist yet. The seed never touches an
account that is already there.

### If a password is lost

```bash
npm run set-password -- --list                            # who exists
npm run set-password -- jlo@ninepoint.com                 # generate, printed once
npm run set-password -- jlo@ninepoint.com 'MyNewPass123'  # or choose one
```

This runs on the server against the database, so it works even when every account
is locked out and SMTP is not configured. It also voids any outstanding reset
links for that account. Needing shell and database access is the point: anyone who
can run it could read the database anyway.

Otherwise: "Forgot password?" on the sign-in screen (needs SMTP), or another admin
can set a password from the Users panel.

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
npm run setup          # schema migrations, then full seed, then remaining migrations
```

`setup` applies schema-only migrations first, then seeds (contacts, templates,
the three accounts), then runs the remaining migrations — several of those
(the advisor-team/address enrichment, the AUM refresh) are `UPDATE`/`INSERT`
statements keyed to specific seeded contact ids, so they need contacts to
already exist or they silently apply to zero rows.

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
