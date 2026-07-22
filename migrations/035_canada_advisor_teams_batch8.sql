-- Rest-of-Canada Financial Advisor enrichment, batch 8 of ~24 (18 contacts).
-- Address + team-roster research, same methodology as prior batches. All
-- web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- 1473 Jamie Switzer, 1450 Cam Currie, and (from batch 7) 1476 Graham
-- Stanley are three independent Canaccord Genuity teams sharing the same
-- building (1133 Melville St, Suite 1200, Vancouver) — consistent with the
-- recurring shared-building pattern. Cindy David (insurance/estate
-- planning) appears as a shared strategic partner across several of these
-- teams and is deliberately not listed as an exclusive team member on any
-- one contact.
--
-- 1799 Cameron Knechtel shares the exact same Stantec Tower suite as 1722
-- Kevin Klein (batch 6, Edmonton) — another independent-teams-sharing-a-
-- building case. Stephanie Tsui (Scotiatrust) is a shared estate
-- consultant across multiple Scotia Wealth teams, same treatment as Cindy
-- David above.
--
-- 1787 Shay Keil's team includes Tricia McIver, who also appears on 1711
-- Eric Muir's Scotia Wealth team (batch 7, Burnaby) — likely a shared
-- specialist across multiple Scotia Wealth teams rather than exclusive to
-- either; not re-listed here to avoid a misleading exclusive attribution.
--
-- One confirmed departure this batch (firm change applied per the
-- established precedent):
--   1727 Quinn Sherdahl: ScotiaMcLeod, Saskatoon -> Wellington-Altus
--     Private Wealth (~April 2026), joined by colleague Terry Shaw,
--     "Shaw Sherdahl Wealth Management Group," 10-person team, $750M AUM.

-- 1515 Andrew McManus, BMO Nesbitt Burns (MSB Wealth Advisory), Calgary, AB
UPDATE contacts SET address = '4954 Richard Road SW, Suite 100' WHERE id = 1515;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1515, x.name, x.role FROM (
  SELECT 'Drew J. McIntosh, BBA, CIM®' AS name, 'Portfolio Manager and Investment Advisor' AS role
  UNION ALL SELECT 'Christopher Burns, B.A., CIM®', 'Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Kim Kaethler', 'Senior Client Service Associate'
  UNION ALL SELECT 'Benjamin (Ben) Stone, CFA', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1515)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1515 AND name = x.name);

-- 1510 Philip Brock, BMO Nesbitt Burns (Brock & Paputsakis Wealth Management), Ottawa, ON
UPDATE contacts SET address = '979 Bank Street, 6th Floor' WHERE id = 1510;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1510, x.name, x.role FROM (
  SELECT 'Pierre Paputsakis' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Patricia Butler', 'Senior Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1510)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1510 AND name = x.name);

-- 1437 Jennifer Tozser, NBF Wealth Management (Tozser Wealth Management), Calgary, AB
UPDATE contacts SET address = '239 8th Ave. SW, Suite 200' WHERE id = 1437;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1437, x.name, x.role FROM (
  SELECT 'Laura Carlisle' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'David Zhou', 'Senior Wealth Associate'
  UNION ALL SELECT 'Rumaan Fatema', 'Senior Investment Associate'
  UNION ALL SELECT 'Dustin Erbach', 'Wealth Associate'
  UNION ALL SELECT 'Ralph Jerome Madriaga', 'Wealth Management Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1437)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1437 AND name = x.name);

-- 1473 Jamie Switzer, CG Wealth Management / Canaccord Genuity (The Switzer Group), Vancouver, BC
UPDATE contacts SET address = '1133 Melville St., Suite 1200' WHERE id = 1473;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1473, x.name, x.role FROM (
  SELECT 'Jack Stillie, CIM®' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Jordan Mann', 'Marketing Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1473)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1473 AND name = x.name);

-- 1534 Brent Hamilton, BMO Nesbitt Burns (Hamilton Bellegarde Wealth Management Team), Regina, SK
UPDATE contacts SET address = '2103 11th Avenue, Suite 1171' WHERE id = 1534;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1534, x.name, x.role FROM (
  SELECT 'Stacy Bellegarde' AS name, 'Investment Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Ben Hamilton', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1534)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1534 AND name = x.name);

-- 1689 Russell Feenstra, Nicola Wealth, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1689;

-- 1612 Brady Doyle, CIBC Wood Gundy (Doyle Jacobs Advisory Group), Halifax, NS
UPDATE contacts SET address = '1969 Upper Water Street, Tower Two, Suite 1801' WHERE id = 1612;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1612, x.name, x.role FROM (
  SELECT 'Ross Jacobs, MBA, CIM' AS name, 'Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Leanne Moore', 'Financial Associate'
  UNION ALL SELECT 'Nancy Wry-Wilton', 'Client Associate'
  UNION ALL SELECT 'Liza Polivina', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1612)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1612 AND name = x.name);

-- 1799 Cameron Knechtel, ScotiaMcLeod (Knechtel Investment Management), Edmonton, AB
UPDATE contacts SET address = '10220 103 Ave NW, Suite 2100 (Stantec Tower)' WHERE id = 1799;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1799, 'Michael Zheng', 'Senior Wealth Advisor, ScotiaMcLeod (M.Fin)'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1799)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1799 AND name = 'Michael Zheng');

-- 1727 Quinn Sherdahl — CONFIRMED DEPARTURE: ScotiaMcLeod -> Wellington-Altus
-- Private Wealth, Saskatoon, ~April 2026, joined by Terry Shaw
-- ("Shaw Sherdahl Wealth Management Group," 10-person team, $750M AUM).
UPDATE contacts SET
  firm = 'Wellington-Altus Private Wealth',
  address = '410-22nd St. East, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Left ScotiaMcLeod for Wellington-Altus Private Wealth, Saskatoon, ~April 2026, with colleague Terry Shaw — "Shaw Sherdahl Wealth Management Group." Firm field updated accordingly. Other ex-ScotiaMcLeod colleagues (Nerasha Pather, Frieda Gesiorowski) not confirmed to have moved with him.')), 512)
WHERE id = 1727;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1727, 'Terry Shaw', 'Senior Wealth Advisor and Portfolio Manager (CIM)'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1727)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1727 AND name = 'Terry Shaw');

-- 1682 Brad Coutts, Nicola Wealth, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = '1508 West Broadway, Suite 500' WHERE id = 1682;

-- 1234 Eric Davis, TD Wealth Private Investment Advice (Davis Wealth Management Team), Kamloops, BC
UPDATE contacts SET address = '301 Victoria Street, Suite 350' WHERE id = 1234;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1234, x.name, x.role FROM (
  SELECT 'Keith Davis' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Heidi Bradley', 'Associate Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1234)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1234 AND name = x.name);

-- 1450 Cam Currie, CG Wealth Management / Canaccord Genuity (Currie Metals & Mining Group), Vancouver, BC
UPDATE contacts SET address = '1133 Melville Street, Suite 1200' WHERE id = 1450;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1450, 'Celestine King', 'Senior Investment Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1450)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1450 AND name = 'Celestine King');

-- 1585 Sarah Murphy, CIBC Wood Gundy (The Murphy Investment Group), Hamilton, ON (address only — no team confirmed)
UPDATE contacts SET address = '21 King Street West, Suite 600' WHERE id = 1585;

-- 1787 Shay (Shy) Keil, ScotiaMcLeod (Keil Investment Group), Vancouver, BC
UPDATE contacts SET address = '650 West Georgia Street, Suite 1100' WHERE id = 1787;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1787, x.name, x.role FROM (
  SELECT 'Angela Wadsworth' AS name, 'Head of Investments' AS role
  UNION ALL SELECT 'Vilma Castellani', 'Head of Operations'
  UNION ALL SELECT 'Josh Gibney', 'Total Wealth Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1787)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1787 AND name = x.name);

-- 1716 Paul Rietkerk, Nicola Wealth, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1716;

-- 1767 Christian Mattenley, ScotiaMcLeod (Mattenley Group), Victoria, BC
UPDATE contacts SET address = '1803 Douglas Street, Suite 400' WHERE id = 1767;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1767, x.name, x.role FROM (
  SELECT 'Patrick Smith' AS name, 'Wealth Advisor & Portfolio Manager (CPA, CIM, TEP)' AS role
  UNION ALL SELECT 'Geoff Cooke', 'Senior Associate'
  UNION ALL SELECT 'Michele Machan', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1767)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1767 AND name = x.name);

-- 1604 Neil Yarmoshuk, CIBC Wood Gundy (The Yarmoshuk Reedman Huehn Financial Group), Surrey, BC
UPDATE contacts SET address = '1688-152nd Street, Suite 408' WHERE id = 1604;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1604, x.name, x.role FROM (
  SELECT 'Jeremy Reedman' AS name, 'Investment Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Jeff Huehn', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1604)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1604 AND name = x.name);

-- 1260 Rod Mahrt, Wellington-Altus Private Wealth (The Mahrt Investment Group), Victoria, BC
UPDATE contacts SET address = '230-1515 Douglas St' WHERE id = 1260;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1260, x.name, x.role FROM (
  SELECT 'Alex Mahrt' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Cailie O''Hara', 'Senior Wealth Planner / Associate Investment Advisor'
  UNION ALL SELECT 'Karen Ma', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1260)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1260 AND name = x.name);
