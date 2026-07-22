-- Rest-of-Canada Financial Advisor enrichment, batch 21 of ~21 (3 contacts).
-- This is the final batch of "with firm" candidates for the rest-of-Canada
-- Financial Advisor enrichment phase — after this, all remaining
-- non-GTA Canadian Financial Advisor contacts have no firm recorded in
-- the CRM and will need a separate, explicitly lower-confidence pass.
--
-- All three contacts in this batch turned out to be unverifiable: no
-- advisor bio, LinkedIn profile, press mention, or registry record could
-- be found tying any of these names to their CRM-recorded firm, despite
-- thorough searching (not a tooling/budget failure this time — genuine
-- absence of any public record). Possible explanations include a CRM
-- name/spelling mismatch, a very low public profile, or a stale record.
-- No address/team/firm changes are applied; each receives only a
-- data_flags note recommending manual verification.
--   1620 Sandra Smith (CIBC Wood Gundy, Vancouver) — several other
--     same-surname advisors were found and ruled out as mismatches.
--   1803 Dorothy Keating (Odlum Brown, Vancouver) — no record at all.
--   1807 Kevin Algar (AlgarVirtue, Calgary) — this ONE was fully
--     confirmed and applied normally; see below. (Not unverifiable —
--     included here for completeness of the batch.)

-- 1620 Sandra Smith, CIBC Wood Gundy, Vancouver, BC (unverifiable, flag only)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Could not verify: no CIBC Wood Gundy advisor named "Sandra Smith" locatable in Vancouver via advisor locator, bio pages, LinkedIn, or press. Recommend manual verification (call Vancouver Bentall office, 604-806-5516).')), 512)
WHERE id = 1620;

-- 1803 Dorothy Keating, Odlum Brown, Vancouver, BC (unverifiable, flag only)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Could not verify: no advisor bio, LinkedIn, press, or registry record found linking this name to Odlum Brown at all. Possible CRM name/spelling issue.')), 512)
WHERE id = 1803;

-- 1807 Kevin Algar, AlgarVirtue, Calgary, AB
UPDATE contacts SET
  address = '2424 4 St SW, Suite 920',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Firm co-founder Jim Virtue sold his stake ~2010 and became PPI CEO (retired ~Dec 2025) — no longer an active AlgarVirtue partner, excluded from roster.')), 512)
WHERE id = 1807;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1807, x.name, x.role FROM (
  SELECT 'Robert (Rob) Koski' AS name, 'Vice President, Operations' AS role
  UNION ALL SELECT 'Ada Gaudette', 'Office Manager'
  UNION ALL SELECT 'Angela Houghton', 'Planner (CFP)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1807)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1807 AND name = x.name);
