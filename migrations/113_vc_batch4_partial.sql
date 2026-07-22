-- Venture Capital / Growth segment enrichment, batch 4 (7 of 52 records):
-- 3 UK firms + 4 Toronto firms. Still pending: OMERS Ventures, Georgian,
-- Inovia Capital, Real Ventures, BDC Capital, and DST Global -- awaiting a
-- follow-up research pass (WebSearch budget exhausted mid-run on the
-- parent research task for this batch).

-- 2296 Atomico, London, UK
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | HQ address unresolved (29 Rathbone St W1T 1NJ per Companies House vs. 50 New Bond St per aggregators) -- verify. $1.24B raised across 2 funds (Sept 2024): Growth VI $754M + Venture V $485M.')), 512)
WHERE id = 2296;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2296, x.name, x.role FROM (
  SELECT 'Niklas Zennström' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2296) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2296 AND name = x.name);

-- 2297 Balderton Capital, London, UK
UPDATE contacts SET
  address = 'The Stables, 28 Britannia Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $1.3B across 2 funds (Aug 2024): Early Stage IX $615M + Growth II $685M.')), 512)
WHERE id = 2297;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2297, x.name, x.role FROM (
  SELECT 'Bernard Liautaud' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'James Wise', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2297) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2297 AND name = x.name);

-- 2298 Northzone, London, UK
UPDATE contacts SET
  address = 'Elsley Court, 1st Floor, 20-22 Great Titchfield Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Northzone X ~EUR1B (closed Sept 2022) is the last confirmed close; a separate "$500M new fund" reference is unresolved.')), 512)
WHERE id = 2298;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2298, x.name, x.role FROM (
  SELECT 'Jörgen Bladh' AS name, 'Founder & General Partner' AS role
  UNION ALL SELECT 'Pär-Jörgen Pärson', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2298) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2298 AND name = x.name);

-- 2304 Relay Ventures, Toronto, ON
UPDATE contacts SET
  address = '446 Spadina Road, Suite 303',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Fund size not found. Also has SF and Calgary offices. Active (new investment Jan 2026).')), 512)
WHERE id = 2304;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2304, x.name, x.role FROM (
  SELECT 'John Albright' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Kevin Talbot', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2304) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2304 AND name = x.name);

-- 2306 Portage (Sagard), Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Fintech arm of Sagard (Paul Desmarais III, Power Corp family). Portage III final close $655M (Jul 2022); firm ~$5.7B AUM (2026). Jan 2026: assumed Point72 Ventures'' fintech portfolio.')), 512)
WHERE id = 2306;

-- 2307 Round13 Capital, Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Fund size not found (Fund III exists among ~6 funds). Founded 2013, active (new investment Feb 2026); ~12 people/6 partners.')), 512)
WHERE id = 2307;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2307, x.name, x.role FROM (
  SELECT 'Wilson Lee' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2307) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2307 AND name = x.name);

-- 2308 Framework Venture Partners, Toronto, ON
UPDATE contacts SET
  address = '80 Richmond Street West, Suite 1502',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Debut fund ~$100M; Fund II first close >$100M (2022), $250M target -- current AUM unconfirmed. Founded 2018.')), 512)
WHERE id = 2308;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2308, x.name, x.role FROM (
  SELECT 'Peter Misek' AS name, 'Managing Partner & Co-Founder' AS role
  UNION ALL SELECT 'Andrew Lugsdin', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2308) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2308 AND name = x.name);
