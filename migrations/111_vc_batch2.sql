-- Venture Capital / Growth segment enrichment, batch 2 of 4 (13 of 52
-- records). GGV Capital (2274) gets a name/firm update: the GGV brand was
-- retired March 2024, splitting into Notable Capital (US, this entity)
-- and Granite Asia (Asia-focused, unrelated going forward).

-- 2270 Battery Ventures, Boston, MA
UPDATE contacts SET
  address = '1 Marina Park Dr, Suite 1150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Battery XV $3.25B (Feb 2026); >$16B raised since inception, ~$15.1B AUM. Multi-office (Boston/SF/Menlo Park/Tel Aviv/London/NY).')), 512)
WHERE id = 2270;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2270, x.name, x.role FROM (
  SELECT 'Neeraj Agrawal' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Roger Lee', 'General Partner'
  UNION ALL SELECT 'Dharmesh Thakker', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2270) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2270 AND name = x.name);

-- 2271 Bain Capital Ventures, Boston, MA
UPDATE contacts SET
  address = '200 Clarendon St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Address is parent Bain Capital''s (BCV suite unconfirmed). ~$9-10B AUM (2024); $1.9B across 2 new funds recently. Venture arm within Bain Capital, not fully standalone.')), 512)
WHERE id = 2271;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2271, x.name, x.role FROM (
  SELECT 'Ajay Agarwal' AS name, 'Partner' AS role
  UNION ALL SELECT 'Matt Harris', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2271) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2271 AND name = x.name);

-- 2272 IVP (Institutional Venture Partners), Menlo Park, CA
UPDATE contacts SET
  address = '3000 Sand Hill Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | IVP XVIII $1.6B (closed Mar 2024).')), 512)
WHERE id = 2272;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2272, x.name, x.role FROM (
  SELECT 'Dennis Phelps' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Cack Wilhelm', 'General Partner'
  UNION ALL SELECT 'Norm Fogelsong', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2272) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2272 AND name = x.name);

-- 2273 Redpoint Ventures, Menlo Park, CA
UPDATE contacts SET
  address = '3000 Sand Hill Rd, Building 2, Suite 290',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Redpoint X $650M (May 2025) + Growth V $740M; ~$4.5B total AUM.')), 512)
WHERE id = 2273;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2273, x.name, x.role FROM (
  SELECT 'Satish Dharmaraj' AS name, 'Managing Director' AS role
  UNION ALL SELECT 'Scott Raney', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2273) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2273 AND name = x.name);

-- 2274 GGV Capital -> renamed Notable Capital, Menlo Park, CA
UPDATE contacts SET
  name = 'Notable Capital',
  firm = 'Notable Capital (formerly GGV Capital, US)',
  address = '3000 Sand Hill Rd, Building 4, Suite 230',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Entity renamed: GGV brand retired Mar 2024, split into Notable Capital (US, this record) and Granite Asia (Asia-focused, unrelated). Current fund size not found.')), 512)
WHERE id = 2274;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2274, x.name, x.role FROM (
  SELECT 'Hans Tung' AS name, 'Co-founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2274) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2274 AND name = x.name);

-- 2275 Menlo Ventures, Menlo Park, CA
UPDATE contacts SET
  address = '1300 El Camino Real, Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $3B raised 2025 (largest in firm''s 50yr history, Anthropic stake driven); investing Fund XV $500M + Inflection Fund $500M.')), 512)
WHERE id = 2275;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2275, x.name, x.role FROM (
  SELECT 'Shawn Carolan' AS name, 'Partner' AS role
  UNION ALL SELECT 'Venky Ganesan', 'Partner / Managing Director'
  UNION ALL SELECT 'Matt Murphy', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2275) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2275 AND name = x.name);

-- 2276 Norwest Venture Partners, Palo Alto, CA
UPDATE contacts SET
  address = '525 University Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | NVP XVII $3B (Apr 2024); ~$15.5B total AUM.')), 512)
WHERE id = 2276;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2276, x.name, x.role FROM (
  SELECT 'Jeff Crowe' AS name, 'Senior Managing Partner' AS role
  UNION ALL SELECT 'Ran Ding', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2276) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2276 AND name = x.name);

-- 2277 Spark Capital, San Francisco, CA
UPDATE contacts SET
  address = '332 Pine St, Floor 7',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Spark VIII $700M + Growth V $1.4B = $2.3B (Mar 2024); >$12B total AUM.')), 512)
WHERE id = 2277;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2277, x.name, x.role FROM (
  SELECT 'Alex Finkelstein' AS name, 'Co-founder & General Partner' AS role
  UNION ALL SELECT 'Santo Politi', 'Co-founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2277) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2277 AND name = x.name);

-- 2278 Union Square Ventures (USV), New York, NY
UPDATE contacts SET
  address = '817 Broadway, 14th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$275M targeted flagship fund (deliberately modest by strategy vs. peers). Address not independently reverified this pass.')), 512)
WHERE id = 2278;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2278, x.name, x.role FROM (
  SELECT 'Fred Wilson' AS name, 'Co-founder & Managing Partner' AS role
  UNION ALL SELECT 'Albert Wenger', 'Managing Partner'
  UNION ALL SELECT 'Rebecca Kaden', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2278) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2278 AND name = x.name);

-- 2279 First Round Capital, San Francisco, CA
UPDATE contacts SET
  address = '595 Pacific Ave, Floor 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Fund X targeting $500M (launched Sept 2025), firm''s 10th institutional fund.')), 512)
WHERE id = 2279;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2279, x.name, x.role FROM (
  SELECT 'Josh Kopelman' AS name, 'Managing Partner & Co-founder' AS role
  UNION ALL SELECT 'Bill Trenchard', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2279) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2279 AND name = x.name);

-- 2280 Craft Ventures, San Francisco, CA
UPDATE contacts SET
  address = '855 Front St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Craft IV $712M + Growth II $608M = $1.32B (Nov 2023); ~$3.3B total AUM. New Austin office opened Dec 2025.')), 512)
WHERE id = 2280;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2280, x.name, x.role FROM (
  SELECT 'David Sacks' AS name, 'Co-founder & General Partner' AS role
  UNION ALL SELECT 'Jeff Fluhr', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2280) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2280 AND name = x.name);

-- 2281 8VC, Austin, TX
UPDATE contacts SET
  address = '907 S. Congress Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Fund 7 $1.5B (Jul 2026, largest ever); total AUM >$6B. HQ relocated to Austin 2020.')), 512)
WHERE id = 2281;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2281, x.name, x.role FROM (
  SELECT 'Joe Lonsdale' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2281) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2281 AND name = x.name);

-- 2282 Ribbit Capital, Palo Alto, CA
UPDATE contacts SET
  address = '364 University Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$12-14.5B total AUM. Press-shy firm -- only 1 senior partner confirmed by name.')), 512)
WHERE id = 2282;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2282, x.name, x.role FROM (
  SELECT 'Micky Malka' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2282) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2282 AND name = x.name);
