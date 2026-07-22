-- Cleanup pass (part 1 of N) on items flagged for manual review across
-- migrations 009-021. This file covers the purely mechanical fixes that
-- don't require new research: a firm-wide rebrand rename, a deceased-
-- contact flag, and data-quality-flag corrections. Confirmed employer
-- departures, city-mismatch address corrections, and unresolved
-- ambiguities are handled in follow-up migrations after additional
-- research, since those need new addresses/team rosters, not just a
-- field correction.
--
-- 1. "Manulife Securities" -> "Manulife Wealth Inc." rename for all
--    contacts still on the old name, per the CIRO amalgamation effective
--    Jan 1 2024 (first flagged in migration 018 as a broader cleanup
--    opportunity "out of scope" at the time). Excludes 1498 Paul Polyviou,
--    who is a confirmed departure to Harbourfront Wealth Management and
--    will get his firm corrected to that instead in the departures
--    migration.
--
-- 2. 1760 Allan McGlade (ScotiaMcLeod) — confirmed deceased (ALS, April
--    2023, per the ScotiaMcLeod Charitable Foundation and the firm's own
--    "Staff Update" post; migration 011). Rather than silently
--    reassigning his book to his successor (Andrew McGoey, "The McGoey
--    Financial Group," same address) — a business decision this migration
--    shouldn't make unilaterally — this marks the contact unreachable and
--    notes the succession info in data_flags for a human to act on
--    (e.g. archive this contact and/or add Andrew McGoey as a new one).
--
-- 3. Four contacts whose CRM data_flags say "Generic media/IR inbox — not
--    a direct contact," but independent research (migrations 020-021)
--    found each to be a real, active, named entity/individual worth
--    keeping as a contact. Appending a research note rather than
--    replacing the original flag, since the original inbox-quality
--    observation about the on-file email may still be accurate.

UPDATE contacts SET firm = 'Manulife Wealth Inc.'
WHERE id IN (1477, 1479, 1480, 1481, 1482, 1483, 1484, 1485, 1486, 1487, 1488, 1489, 1490, 1491, 1492, 1500, 1501, 1502, 1503, 1504, 1505)
  AND firm = 'Manulife Securities';

UPDATE contacts
SET reachable = 0,
    data_flags = LEFT(TRIM(CONCAT(COALESCE(data_flags, ''),
      CASE WHEN COALESCE(data_flags, '') = '' THEN '' ELSE ' | ' END,
      'DECEASED (ALS, April 2023, per ScotiaMcLeod Charitable Foundation + firm Staff Update post). Book now led by Andrew McGoey, The McGoey Financial Group, same address — needs human decision: archive this contact and/or add Andrew McGoey as a new contact.')), 512)
WHERE id = 1760
  AND data_flags NOT LIKE '%DECEASED%';

UPDATE contacts
SET data_flags = LEFT(TRIM(CONCAT(COALESCE(data_flags, ''),
  ' | Research note: real, active philanthropic-advisory firm (est. 1997, founder William "Bill" Petruck) — CRM "Financial Advisor" segment tag likely a miscategorization, but entity/contact are genuine.')), 512)
WHERE id = 1497
  AND data_flags NOT LIKE '%Research note%';

UPDATE contacts
SET data_flags = LEFT(TRIM(CONCAT(COALESCE(data_flags, ''),
  ' | Research note: real, active independent multi-family office (~$800M+ AUM, founded 2018) with a confirmed 3-person leadership team — original "generic inbox" flag appears mismatched to this entity.')), 512)
WHERE id = 1573
  AND data_flags NOT LIKE '%Research note%';

UPDATE contacts
SET data_flags = LEFT(TRIM(CONCAT(COALESCE(data_flags, ''),
  ' | Research note: real named individual, but an Advisory Board member (former Tim Hortons Chief Brand/Marketing Officer, retired ~2014), not an active staff financial advisor — CRM "Financial Advisor" tag likely doesn''t fit his actual role.')), 512)
WHERE id = 1666
  AND data_flags NOT LIKE '%Research note%';

UPDATE contacts
SET data_flags = LEFT(TRIM(CONCAT(COALESCE(data_flags, ''),
  ' | Research note: real, active firm and team confirmed independently — original "generic inbox" flag appears mismatched to this entity.')), 512)
WHERE id = 1342
  AND data_flags NOT LIKE '%Research note%';
