-- Rest-of-Canada Financial Advisor enrichment, batch 7 of ~24 (18 contacts).
-- Address + team-roster research, same methodology as prior batches. All
-- web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- 1744 Mark Gawargy + 1778 Ian Hamilton (ScotiaMcLeod, Ottawa) are
-- confirmed colleagues — team is literally named "Gawargy Hamilton
-- Temidire Group" after both surnames.
--
-- Two confirmed departures this batch (firm change applied per the
-- established precedent — new firm, address, and team, never silently
-- reassigned):
--   1711 Eric Muir: Raymond James, Burnaby -> Scotia Wealth Management
--     (ScotiaMcLeod), same building, ~April 2026, "Muir Investment Team."
--   1228 Mary Ellen Byrne: TD Wealth, Halifax -> Richardson Wealth
--     (May 2024), whole team moved, rebranded "Mary Ellen Byrne Wealth
--     Management"; the TD listing is explicitly marked Closed.
--
-- 1729 Kristofer Jensen (ScotiaMcLeod, Edmonton): team applied, but
-- address deliberately NOT applied — search snippets conflicted (one
-- boilerplate Calgary corporate address, others unrelated Edmonton
-- buildings with no confirmed link to this team).
--
-- 1227 Michael Anderssen (TD Wealth, Bridgewater): address applied, but
-- flagged — an ambiguous bio phrase ("completed a 39-year journey...")
-- could indicate retirement, though his profile still lists him active.

-- 1358 Tim Conlin, Richardson Wealth Ltd, Calgary, AB
UPDATE contacts SET address = 'Eighth Avenue Place, 525 8th Avenue SW, Suite 4700' WHERE id = 1358;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1358, x.name, x.role FROM (
  SELECT 'Maria Miletic' AS name, 'Associate Portfolio Manager (Team Partner)' AS role
  UNION ALL SELECT 'Laura Gerrish', 'Associate Wealth Planner'
  UNION ALL SELECT 'Euan Hannigan', 'Associate Portfolio Manager / Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1358)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1358 AND name = x.name);

-- 1597 Christopher Helm, CIBC Wood Gundy, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1597;

-- 1681 Alan O'Brien, Nicola Wealth, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1681;

-- 1227 Michael Anderssen, TD Wealth Private Investment Advice, Bridgewater, NS
UPDATE contacts SET
  address = '135 North Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AMBIGUOUS: bio phrase "completed a 39-year journey in banking and wealth management" could indicate retirement — profile/LinkedIn still list him as active; needs manual verification.')), 512)
WHERE id = 1227;

-- 1729 Kristofer Jensen, ScotiaMcLeod, Edmonton, AB (team only — address NOT_FOUND, conflicting snippets)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1729, x.name, x.role FROM (
  SELECT 'Kaelan Jensen' AS name, 'Administrative Assistant' AS role
  UNION ALL SELECT 'Taytum Jensen', 'Administrative Assistant'
  UNION ALL SELECT 'D-Nay Stockbrugger', 'Director, Scotia Wealth Insurance Services Inc.'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1729)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1729 AND name = x.name);

-- 1744 Mark Gawargy, ScotiaMcLeod (Gawargy Hamilton Temidire Group), Ottawa, ON
UPDATE contacts SET address = 'Constitution Square, 350 Albert Street, Suite 2100' WHERE id = 1744;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1744, x.name, x.role FROM (
  SELECT 'Ian Hamilton' AS name, 'Senior Wealth Advisor, Portfolio Manager (CIM®)' AS role
  UNION ALL SELECT 'Angela Temidire', 'Wealth Advisor, Portfolio Manager (CFP®, CIM®)'
  UNION ALL SELECT 'Kate Goneau', 'Senior Financial Planning Associate (B.Comm, CFP®)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1744)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1744 AND name = x.name);

-- 1778 Ian Hamilton, ScotiaMcLeod (Gawargy Hamilton Temidire Group), Ottawa, ON
UPDATE contacts SET address = 'Constitution Square, 350 Albert Street, Suite 2100' WHERE id = 1778;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1778, x.name, x.role FROM (
  SELECT 'Mark Gawargy' AS name, 'Senior Wealth Advisor, Portfolio Manager (CFP®, CIM®, FCSI®)' AS role
  UNION ALL SELECT 'Angela Temidire', 'Wealth Advisor, Portfolio Manager (CFP®, CIM®)'
  UNION ALL SELECT 'Kate Goneau', 'Senior Financial Planning Associate (B.Comm, CFP®)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1778)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1778 AND name = x.name);

-- 1711 Eric Muir — CONFIRMED DEPARTURE: Raymond James -> Scotia Wealth
-- Management (ScotiaMcLeod), same building, ~April 2026, "Muir Investment
-- Team." Applying new firm/address/team per the established precedent.
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod)',
  address = 'Suite 1133 - 4720 Kingsway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Left Raymond James for Scotia Wealth Management (ScotiaMcLeod), same Burnaby building, ~April 2026 — "Muir Investment Team." Firm field updated accordingly.')), 512)
WHERE id = 1711;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1711, x.name, x.role FROM (
  SELECT 'Derek Lacroix' AS name, 'Wealth Advisor (BBA, CFP, CIM)' AS role
  UNION ALL SELECT 'Tricia McIver', 'Business and Family Wealth Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1711)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1711 AND name = x.name);

-- 1717 Seth Allen, Raymond James (Cadence Financial Group), Vancouver, BC
UPDATE contacts SET address = 'Suite 810 - 1040 West Georgia Street' WHERE id = 1717;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1717, x.name, x.role FROM (
  SELECT 'Jason Castelli' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Laura Furtado', 'Head of Business Development'
  UNION ALL SELECT 'Ryan Cha', 'Associate Financial Advisor'
  UNION ALL SELECT 'Herman Wong', 'Wealth Manager Assistant'
  UNION ALL SELECT 'Jason Mai', 'Trading Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1717)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1717 AND name = x.name);

-- 1376 Dave Bromley, NBF Wealth Management (The Bromley Wealth Management Team), Surrey, BC
UPDATE contacts SET address = '2121 160th St., Suite 100' WHERE id = 1376;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1376, x.name, x.role FROM (
  SELECT 'Parker Bromley' AS name, 'Wealth Advisor and Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Tara Senicki', 'Senior Wealth Associate'
  UNION ALL SELECT 'Jennifer Yaremchuk', 'Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1376)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1376 AND name = x.name);

-- 1624 Adam Slumskie, CIBC Wood Gundy (Intrinsic Financial Group), Sault Ste. Marie, ON
UPDATE contacts SET address = '530 Queen Street East, Suite 100' WHERE id = 1624;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1624, x.name, x.role FROM (
  SELECT 'Greg Zahn' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Jessica D''Angelo, CIM, CFP', 'Associate Investment Advisor and Relationship Manager'
  UNION ALL SELECT 'Andrew Lepore, CIM', 'Financial Associate and Relationship Manager'
  UNION ALL SELECT 'Alexa Notte, MBA', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1624)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1624 AND name = x.name);

-- 1371 Rock Pelletier, Desjardins Securities, Brossard, QC
UPDATE contacts SET address = '2000 De l''Éclipse Street, 11th Floor' WHERE id = 1371;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1371, x.name, x.role FROM (
  SELECT 'Manon Raymond' AS name, 'Investment Advisor, Financial Planner' AS role
  UNION ALL SELECT 'Priscilla Lestage', 'Investment Advisor, Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1371)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1371 AND name = x.name);

-- 1408 Jay Nash, NBF Wealth Management (Nash Family Wealth Management), London, ON
UPDATE contacts SET address = '380 Wellington St., Suite 802' WHERE id = 1408;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1408, 'Diane Nash', 'Wealth Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1408)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1408 AND name = 'Diane Nash');

-- 1476 Graham Stanley, CG Wealth Management / Canaccord Genuity (Stanley Asset Management), Vancouver, BC
UPDATE contacts SET address = '1133 Melville St., Suite 1200' WHERE id = 1476;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1476, x.name, x.role FROM (
  SELECT 'Mark Potter, CIM' AS name, 'Investment Management & Trading Lead' AS role
  UNION ALL SELECT 'Doug Anderson', 'Portfolio Manager'
  UNION ALL SELECT 'Liz Helmel', 'Senior Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1476)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1476 AND name = x.name);

-- 1360 Fred Esposito, NBF Wealth Management (Esposito Advisory Team), Edmonton, AB
UPDATE contacts SET address = '1701 – TD Tower, 10088 – 102 Ave' WHERE id = 1360;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1360, 'McKenzie Esposito', 'Wealth Advisor & Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1360)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1360 AND name = 'McKenzie Esposito');

-- 1228 Mary Ellen Byrne — CONFIRMED DEPARTURE: TD Wealth -> Richardson
-- Wealth (May 2024), whole team moved, rebranded "Mary Ellen Byrne Wealth
-- Management." TD listing explicitly marked Closed. Applying new
-- firm/address/team per the established precedent.
UPDATE contacts SET
  firm = 'Richardson Wealth',
  address = '1959 Upper Water Street, Purdy''s Wharf Tower I, Suite #1800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Left TD Wealth for Richardson Wealth, Halifax, May 2024 (whole team moved) — rebranded "Mary Ellen Byrne Wealth Management." Firm field updated accordingly.')), 512)
WHERE id = 1228;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1228, x.name, x.role FROM (
  SELECT 'Julie Grant' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Paula Campbell', 'Associate Investment Advisor'
  UNION ALL SELECT 'Jennifer O''Connor', 'Associate'
  UNION ALL SELECT 'Lisa Kuehn', 'Associate'
  UNION ALL SELECT 'Noha Elkady', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1228)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1228 AND name = x.name);

-- 1584 Fraser Wilson, CIBC Wood Gundy (Wilson Shipp-Colter Financial Group), London, ON
UPDATE contacts SET address = '255 Queens Avenue, Suite 2200' WHERE id = 1584;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1584, 'Gavin Shipp-Colter, CIM', 'Associate Portfolio Manager, Wealth Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1584)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1584 AND name = 'Gavin Shipp-Colter, CIM');

-- 1393 Bernard Filiatrault, NBF Wealth Management, Baie-Comeau, QC
UPDATE contacts SET address = '600 Boulevard Laflèche, Bureau 340-B' WHERE id = 1393;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1393, x.name, x.role FROM (
  SELECT 'Jean-Pierre De Champlain' AS name, 'Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'David Normand', 'Wealth Advisor'
  UNION ALL SELECT 'Michel Beaulieu', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1393)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1393 AND name = x.name);
