-- Venture Capital / Growth segment enrichment, batch 1 of 4 (13 of 52
-- records). Firm-level bare seed records enriched with HQ street address
-- and senior partner team (via contact_people), mirroring the Financial
-- Advisor team-roster methodology. WebFetch to firm sites is blocked in
-- this environment; findings are from WebSearch results, dated Jul 2026.

-- 2257 Sequoia Capital, Menlo Park, CA
UPDATE contacts SET
  address = '2800 Sand Hill Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$7B late-stage/AI fund (Apr 2026); ~$56-85B total AUM est. Leadership change: Roelof Botha stepped down as sole managing partner Nov 2025; Alfred Lin & Pat Grady now co-stewards.')), 512)
WHERE id = 2257;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2257, x.name, x.role FROM (
  SELECT 'Alfred Lin' AS name, 'Co-Steward / Managing Partner' AS role
  UNION ALL SELECT 'Pat Grady', 'Co-Steward / Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2257) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2257 AND name = x.name);

-- 2258 Andreessen Horowitz (a16z), Menlo Park, CA
UPDATE contacts SET
  address = '2865 Sand Hill Rd, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$90B AUM (Jan 2026); $15B+ raised Jan 2026. Large GP bench beyond founders.')), 512)
WHERE id = 2258;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2258, x.name, x.role FROM (
  SELECT 'Marc Andreessen' AS name, 'Co-founder & General Partner' AS role
  UNION ALL SELECT 'Ben Horowitz', 'Co-founder & General Partner'
  UNION ALL SELECT 'Chris Dixon', 'General Partner (crypto)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2258) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2258 AND name = x.name);

-- 2259 Accel, Palo Alto, CA
UPDATE contacts SET
  address = '500 University Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $5B raised 2025 (Leaders Fund V $4B + sidecar); $650M India/SEA Fund VIII. Flat "Partner" titling firm-wide, no confirmed Managing Partner.')), 512)
WHERE id = 2259;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2259, x.name, x.role FROM (
  SELECT 'Andrew Braccia' AS name, 'Partner' AS role
  UNION ALL SELECT 'Sara Ittelson', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2259) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2259 AND name = x.name);

-- 2260 Kleiner Perkins, Menlo Park, CA
UPDATE contacts SET
  address = '2750 Sand Hill Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $3.5B raised 2026 (KP22); AUM >$21B. Firm "reinvention" under Hamid/Fushman leadership.')), 512)
WHERE id = 2260;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2260, x.name, x.role FROM (
  SELECT 'Mamoon Hamid' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Ilya Fushman', 'Co-Lead Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2260) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2260 AND name = x.name);

-- 2261 Greylock Partners, Menlo Park, CA
UPDATE contacts SET
  address = '2550 Sand Hill Rd, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $1.5B Fund 18 closed Jul 2026 (deliberately capped fund size). ~10 active partners.')), 512)
WHERE id = 2261;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2261, x.name, x.role FROM (
  SELECT 'Reid Hoffman' AS name, 'General Partner' AS role
  UNION ALL SELECT 'David Sze', 'General Partner'
  UNION ALL SELECT 'Saam Motamedi', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2261) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2261 AND name = x.name);

-- 2262 Benchmark, San Francisco, CA
UPDATE contacts SET
  address = '140 New Montgomery St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $425M Fund XI (deliberately small by design). Victor Lazarte departed Jul 2025 for own fund; Jack Altman joined Feb 2026. Bill Gurley now inactive.')), 512)
WHERE id = 2262;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2262, x.name, x.role FROM (
  SELECT 'Peter Fenton' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Eric Vishria', 'General Partner'
  UNION ALL SELECT 'Chetan Puttagunta', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2262) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2262 AND name = x.name);

-- 2263 Lightspeed Venture Partners, Menlo Park, CA
UPDATE contacts SET
  address = '2200 Sand Hill Rd, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $9B+ closed across 6 funds Dec 2025 (largest raise in firm history); $40B+ total AUM.')), 512)
WHERE id = 2263;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2263, x.name, x.role FROM (
  SELECT 'Ravi Mhatre' AS name, 'Co-founder & Managing Director' AS role
  UNION ALL SELECT 'Nicole Quinn', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2263) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2263 AND name = x.name);

-- 2264 New Enterprise Associates (NEA), Menlo Park, CA
UPDATE contacts SET
  address = '2855 Sand Hill Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $6.2B closed across 2 funds; $28B+ AUM (Jun 2025). Dual tech/healthcare practice structure under one roof.')), 512)
WHERE id = 2264;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2264, x.name, x.role FROM (
  SELECT 'Scott Sandell' AS name, 'Executive Chairman & Chief Investment Officer' AS role
  UNION ALL SELECT 'Tony Florence', 'Managing General Partner, Technology'
  UNION ALL SELECT 'Mohamad Makhzoumi', 'Managing General Partner, Healthcare'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2264) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2264 AND name = x.name);

-- 2265 Bessemer Venture Partners -- HQ address ambiguous (SF vs Redwood City), San Francisco, CA
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | HQ address ambiguous across sources (539 Bryant St SF vs 889 Winslow St Redwood City) -- verify before use. $1.35B raised 2025 (BVP Forge II + India Fund II). Flat "Partner" titling.')), 512)
WHERE id = 2265;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2265, x.name, x.role FROM (
  SELECT 'Byron Deeter' AS name, 'Partner (Cloud/AI)' AS role
  UNION ALL SELECT 'Talia Goldberg', 'Partner (software/consumer)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2265) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2265 AND name = x.name);

-- 2266 General Catalyst, Cambridge, MA
UPDATE contacts SET
  address = '20 University Rd, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $8B raised 2024; $40-45.5B AUM. Transforming toward PE/holding-co model (agreed to acquire Janus Henderson ~$7.4-8B).')), 512)
WHERE id = 2266;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2266, x.name, x.role FROM (
  SELECT 'Hemant Taneja' AS name, 'CEO & Managing Director' AS role
  UNION ALL SELECT 'Ken Chenault', 'Chairman & Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2266) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2266 AND name = x.name);

-- 2267 Index Ventures -- HQ address unresolved, San Francisco, CA
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | HQ address unresolved (2 conflicting SF addresses found) -- verify. Current fund size not found. Volpi departed for own fund (Hanabi Capital) 2025; Rimer possibly considering retirement (unconfirmed).')), 512)
WHERE id = 2267;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2267, x.name, x.role FROM (
  SELECT 'Danny Rimer' AS name, 'Partner' AS role
  UNION ALL SELECT 'Nina Achadjian', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2267) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2267 AND name = x.name);

-- 2268 Founders Fund, San Francisco, CA
UPDATE contacts SET
  address = 'One Letterman Dr, Building D, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$17B total AUM (2025); most recent standalone fund size not confirmed.')), 512)
WHERE id = 2268;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2268, x.name, x.role FROM (
  SELECT 'Peter Thiel' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Trae Stephens', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2268) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2268 AND name = x.name);

-- 2269 Khosla Ventures, Menlo Park, CA
UPDATE contacts SET
  address = '2128 Sand Hill Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$3.5B sought 2025 (incl ~$650M seed); ~$16B total AUM.')), 512)
WHERE id = 2269;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2269, x.name, x.role FROM (
  SELECT 'Vinod Khosla' AS name, 'Co-founder & Managing Director' AS role
  UNION ALL SELECT 'Samir Kaul', 'Co-founder & Managing Director'
  UNION ALL SELECT 'Keith Rabois', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2269) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2269 AND name = x.name);
