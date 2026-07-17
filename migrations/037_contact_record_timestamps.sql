-- Record timestamps on contacts, matching standard CRM practice (every
-- mainstream CRM tracks created/last-modified time on the core record).
--
-- created_at backfills to the migration run time for pre-existing rows —
-- the true import date isn't recoverable, so this is the honest floor.
-- updated_at automatically bumps on any UPDATE from here on, so future
-- enrichment passes and manual edits leave a last-modified trail.
--
-- Same plain-ALTER pattern as migration 008: each migration runs exactly
-- once (tracked in schema_migrations), so no IF NOT EXISTS guard is needed.
ALTER TABLE contacts
  ADD COLUMN created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ADD COLUMN updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
