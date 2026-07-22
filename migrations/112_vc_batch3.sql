-- Venture Capital / Growth segment enrichment, batch 3 of 4 (12 of 52
-- records). DST Global (id 2295) not included -- WebSearch budget was
-- exhausted before it could be researched, pending a follow-up pass.

-- 2283 QED Investors, Alexandria, VA
UPDATE contacts SET
  address = '405 Cameron St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$4B AUM (2025). Frank Rotman (co-founder) transitions to Partner Emeritus Jan 1 2026.')), 512)
WHERE id = 2283;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2283, x.name, x.role FROM (
  SELECT 'Nigel Morris' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Amias Gerety', 'Partner, US Investment Team & Exec Committee'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2283) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2283 AND name = x.name);

-- 2284 Sapphire Ventures, Menlo Park, CA
UPDATE contacts SET
  address = '556 Santa Cruz Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$10-11B AUM (2025). Sapphire Partners/Sport units spun out 2025-26 (to LGT and 359 Capital resp.) -- doesn''t affect core Sapphire Ventures.')), 512)
WHERE id = 2284;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2284, x.name, x.role FROM (
  SELECT 'Nino Marakovic' AS name, 'CEO & Partner' AS role
  UNION ALL SELECT 'Jai Das', 'President, Partner & Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2284) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2284 AND name = x.name);

-- 2285 Insight Partners, New York, NY
UPDATE contacts SET
  address = '1114 Avenue of the Americas, 36th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $90B+ regulatory AUM (12/31/25); $12.5B closed across 2 funds Jan 2025. No single "CEO" -- led by MD group.')), 512)
WHERE id = 2285;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2285, x.name, x.role FROM (
  SELECT 'Jeff Horing' AS name, 'Co-Founder & Managing Director' AS role
  UNION ALL SELECT 'Deven Parekh', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2285) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2285 AND name = x.name);

-- 2286 General Atlantic, New York, NY
UPDATE contacts SET
  address = 'Park Avenue Plaza, 55 East 52nd Street, 33rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$126B AUM (12/31/25).')), 512)
WHERE id = 2286;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2286, x.name, x.role FROM (
  SELECT 'William "Bill" Ford' AS name, 'Chairman & CEO' AS role
  UNION ALL SELECT 'Gabriel Caillaux', 'Co-President'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2286) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2286 AND name = x.name);

-- 2287 Tiger Global Management, New York, NY
UPDATE contacts SET
  address = '9 W 57th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM $69.5-79B (methodology-dependent); venture unit ~$34B; new PIP 17 fund targeting close ~Mar 2026. Strategic reset ("small and beautiful") after prior markdowns.')), 512)
WHERE id = 2287;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2287, x.name, x.role FROM (
  SELECT 'Chase Coleman' AS name, 'Founder (retook direct control of venture unit 2025)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2287) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2287 AND name = x.name);

-- 2288 Coatue Management, New York, NY
UPDATE contacts SET
  address = '9 West 57th Street, 25th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM wide range $54-92.7B across sources. Offices also Menlo Park, London, Shanghai, Hong Kong.')), 512)
WHERE id = 2288;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2288, x.name, x.role FROM (
  SELECT 'Philippe Laffont' AS name, 'Founder & Portfolio Manager' AS role
  UNION ALL SELECT 'Thomas Laffont', 'Co-Founder & CIO of Privates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2288) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2288 AND name = x.name);

-- 2289 Thrive Capital, New York, NY
UPDATE contacts SET
  address = '295 Lafayette St, Floor 7',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$15.6B (early 2025) growing to $50B (2026) after Thrive X $10B closed Feb 2026.')), 512)
WHERE id = 2289;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2289, x.name, x.role FROM (
  SELECT 'Joshua Kushner' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2289) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2289 AND name = x.name);

-- 2290 Dragoneer Investment Group, San Francisco, CA
UPDATE contacts SET
  address = '1 Letterman Drive, Building D, Suite M-500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $30B+ AUM (late 2025, incl $12B evergreen fund); new $4.3B VC fund Dec 2025. Co-led Anthropic''s $30B round.')), 512)
WHERE id = 2290;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2290, x.name, x.role FROM (
  SELECT 'Marc Stad' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2290) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2290 AND name = x.name);

-- 2291 Altimeter Capital, Menlo Park, CA
UPDATE contacts SET
  address = '2550 Sand Hill Road, Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM range $12.7-18B. Only founder confirmed by name -- other named partners not found.')), 512)
WHERE id = 2291;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2291, x.name, x.role FROM (
  SELECT 'Brad Gerstner' AS name, 'Founder, Chairman & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2291) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2291 AND name = x.name);

-- 2292 D1 Capital Partners, New York, NY
UPDATE contacts SET
  address = '9 W 57th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM $20-31B range. Only founder confirmed by name -- other named partners not found. Public+private portfolios both up 30%+ in 2025.')), 512)
WHERE id = 2292;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2292, x.name, x.role FROM (
  SELECT 'Daniel Sundheim' AS name, 'Founder & Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2292) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2292 AND name = x.name);

-- 2293 ICONIQ Growth, San Francisco, CA
UPDATE contacts SET
  address = '394 Pacific Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$26B under management (VC arm); 7th flagship fund $5.75B (2024); parent ICONIQ ~$100B (2026). Notably low public profile.')), 512)
WHERE id = 2293;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2293, x.name, x.role FROM (
  SELECT 'Divesh Makan' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Will Griffith', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2293) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2293 AND name = x.name);

-- 2294 SoftBank Vision Fund, London, UK
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Address on file is from a 2016 source (original Mayfair HQ opening) -- not reconfirmed current. $166B AUM (2025): SVF1 $98.6B + SVF2 $56B; $46B annual gain (May 2026) driven by OpenAI stake. No fund-specific CIO/MP found distinct from parent-level Son.')), 512)
WHERE id = 2294;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2294, x.name, x.role FROM (
  SELECT 'Masayoshi Son' AS name, 'Founder, SoftBank Group Chairman & CEO (parent-level oversight)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2294) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2294 AND name = x.name);
