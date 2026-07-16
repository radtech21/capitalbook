-- Batch 6 of GTA "advisor team" enrichment (18 more contacts, same
-- methodology as migrations 009-013). No firm departures/mergers this round,
-- but one weak, unverified signal worth a manual look:
--
--   1780 Peter Volpe — a single AI-search-summary claimed he "retired ...
--     after a 25-year career," but the research agent could not reproduce
--     that claim in three follow-up searches, and other sources describe him
--     as still active/Director. Address applied (well corroborated); no team
--     members met the accuracy bar either way. Worth a human glance, not a
--     reason to withhold the address.
--
-- One contact pair confirmed as teammates: 1406/1427 (Orlic Harding Cooke,
-- Richardson Wealth Burlington). As in every prior batch, several unrelated
-- teams turn up sharing the same downtown floor/building — not duplicates.

-- 1564 Faisal Hassan, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '4881 Yonge St, 9th Floor' WHERE id = 1564;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1564, x.name, x.role FROM (
  SELECT 'Brad Fox' AS name, 'Portfolio Manager and Senior Investment Advisor (Branch Manager)' AS role
  UNION ALL SELECT 'Erik Olesen', 'Portfolio Manager'
  UNION ALL SELECT 'Suzanne Probyn-Romano', 'Investment Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1564)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1564 AND name = x.name);

-- 1406 Ty Cooke + 1427 Diana Orlic — same Richardson Wealth team ("Orlic Harding Cooke")
UPDATE contacts SET address = '1111 International Blvd, Suite 400' WHERE id IN (1406, 1427);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, x.name, x.role FROM contacts c, (
  SELECT 'Elizabeth Harding' AS name, 'Director, Wealth Management (retired, consulting basis)' AS role
  UNION ALL SELECT 'Kimberley Sevcik', 'Business Development Assistant'
) x
WHERE c.id IN (1406, 1427)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = x.name);

-- 1751 Stan Wong, ScotiaMcLeod, Markham
UPDATE contacts SET address = '675 Cochrane Drive, Suite 115' WHERE id = 1751;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1751, x.name, x.role FROM (
  SELECT 'Brandon Mack' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Adriana Narvaez', 'Administrative Associate'
  UNION ALL SELECT 'Shavena Bacchus', 'Administrative Assistant'
  UNION ALL SELECT 'Jean Yong', 'Estate and Trust Consultant'
  UNION ALL SELECT 'Jennie Ho', 'Senior Manager, Wealth Management Taxation'
  UNION ALL SELECT 'Suzanne Reid-Skidmore', 'Senior Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1751)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1751 AND name = x.name);

-- 1389 Tim Pritchard, Richardson Wealth Ltd, Toronto
UPDATE contacts SET address = '100 Queens Quay East, Suite 2500' WHERE id = 1389;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1389, 'Stefan Antonakos', 'Richardson Wealth Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1389)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1389 AND name = 'Stefan Antonakos');

-- 1442 Wolfgang Klein, CG Wealth Management, Toronto
UPDATE contacts SET address = '40 Temperance Street, Suite 2100' WHERE id = 1442;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1442, x.name, x.role FROM (
  SELECT 'Jack Hardill' AS name, 'Associate / Chartered Investment Manager' AS role
  UNION ALL SELECT 'Zachery Kim', 'Licensed Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1442)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1442 AND name = x.name);

-- 1793 Scott Stollmeyer, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 16th Floor' WHERE id = 1793;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1793, x.name, x.role FROM (
  SELECT 'Melodi Liao' AS name, 'Investment Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Hamish Young', 'Administrative Associate'
  UNION ALL SELECT 'Maria Montagne', 'Administrative Assistant'
  UNION ALL SELECT 'Nathan Marshall', 'Administrative Assistant'
  UNION ALL SELECT 'Andres Fuentes', 'International Investment Advisory'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1793)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1793 AND name = x.name);

-- 1630 Maria Zakos, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '200 King Street West, Suite 1807' WHERE id = 1630;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1630, x.name, x.role FROM (
  SELECT 'David MacNeill' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Sean McMahon', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1630)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1630 AND name = x.name);

-- 1535 James Naylor, BMO Nesbitt Burns, Toronto (address only)
UPDATE contacts SET address = '4881 Yonge Street, 9th Floor' WHERE id = 1535;

-- 1627 JP Bernardi, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = 'Brookfield Place, Suite 600, 181 Bay Street' WHERE id = 1627;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1627, x.name, x.role FROM (
  SELECT 'Michael Bishop' AS name, 'Administrative Associate' AS role
  UNION ALL SELECT 'Raisa Rashid', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1627)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1627 AND name = x.name);

-- 1780 Peter Volpe, ScotiaMcLeod, Toronto — see note above on the unverified
-- retirement signal
UPDATE contacts SET address = '40 King Street West' WHERE id = 1780;

-- 1556 Abe Gottesman, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 38th Floor' WHERE id = 1556;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1556, 'Victoria Karkar', 'Client Service Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1556)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1556 AND name = 'Victoria Karkar');

-- 1318 Gillian Stovel Rivers, Assante Wealth Management, Burlington
UPDATE contacts SET address = '5420 North Service Road' WHERE id = 1318;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1318, x.name, x.role FROM (
  SELECT 'Andrew Hawryluk' AS name, 'Wealth Advisor (Principal/Partner)' AS role
  UNION ALL SELECT 'Adil Mohammed', 'Wealth Advisor (Principal/Partner)'
  UNION ALL SELECT 'Astrid Banks', 'Client Service & Marketing Associate'
  UNION ALL SELECT 'Danielle Raycroft', 'Client Service & Marketing Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1318)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1318 AND name = x.name);

-- 1559 Mike McPhillips, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '1 First Canadian Place' WHERE id = 1559;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1559, 'Hani Zakaria', 'Portfolio Manager / Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1559)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1559 AND name = 'Hani Zakaria');

-- 1786 Jeremy Tabarrok, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1786;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1786, x.name, x.role FROM (
  SELECT 'Sonya Frei' AS name, 'Administrative Associate' AS role
  UNION ALL SELECT 'Malcolm Burrows', 'Head, Philanthropic Advisory Services'
  UNION ALL SELECT 'Miranda Chan', 'Senior Total Wealth Planner'
  UNION ALL SELECT 'Daniel Cherney', 'Associate Insurance Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1786)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1786 AND name = x.name);

-- 1516 Geoffrey Marshall, BMO Nesbitt Burns, Oakville
UPDATE contacts SET address = '132 Trafalgar Road' WHERE id = 1516;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1516, 'Max Reil', 'Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1516)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1516 AND name = 'Max Reil');

-- 1594 Will MacKay, CIBC Wood Gundy, Mississauga
UPDATE contacts SET address = '1 City Centre Drive, Suite 1100' WHERE id = 1594;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1594, x.name, x.role FROM (
  SELECT 'Hina Naseer' AS name, 'Financial Associate' AS role
  UNION ALL SELECT 'Ryan Cowden', 'Financial Associate'
  UNION ALL SELECT 'Nichole Killinger', 'Client Associate'
  UNION ALL SELECT 'Michaela McInnis', 'Client Associate'
  UNION ALL SELECT 'Edna Fedele', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1594)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1594 AND name = x.name);

-- 1572 Larry Ross, BMO Nesbitt Burns, Toronto (address only; his son Noah
-- Ross is on the team but no formal title was found for him, only a bio
-- description, so he was left out)
UPDATE contacts SET address = '1 First Canadian Place, 38th Floor' WHERE id = 1572;
