-- Rest-of-Canada Financial Advisor enrichment, batch 13 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Two archived contacts this batch (reachable=0, no reassignment):
--   1462 Ludovic Siouffi (CG Vancouver): LEFT THE INDUSTRY — quit wealth
--     advising to co-found and run Fox Fold (sustainable tissue startup);
--     The Ludo Group dissolved, team site offline. No confirmed successor.
--   1431 David Christianson (NBF Winnipeg): RETIRED — NBF's own pages say
--     his "retirement plan unfolded" in 2022; team rebranded "Current
--     Wealth Advisors" under Paul Kawchuk, Andrew Froese, and Eric Nipp.
--     Archive-only per the Kaplin retirement precedent; successors are
--     documented in data_flags, not added as contacts.
--
-- One confirmed firm departure (firm/title updated + flagged):
--   1430 Benji Miles (Winnipeg): Miles Wealth Management Group left
--     Richardson Wealth for Raymond James Ltd. (announced Sept 25, 2025,
--     closed Q4 2025) — one of three Winnipeg teams (~$1B AUM combined).
--     New street address not yet published, so address is left unset and
--     the stale Richardson email is flagged.
--
-- Shared-building notes (independent teams): 1440 Vincent Stewart and
-- 1453 Jerry Basran are the 8th and 9th independent CG teams at 1133
-- Melville St, Suite 1200, Vancouver; 1615 Peter Leacock is the 4th team
-- at the CIBC Bentall suite (1055 Dunsmuir St, Suite 2434); 1644 Kurt
-- Miller is the 3rd team at the CIBC Edmonton suite (10180-101 St, Suite
-- 1800); 1710 Christina Chow shares the Raymond James Calgary suite
-- (525 8th Ave SW, Suite 4100) with the Hougen and Moore teams; 1302
-- April Dorey Hartwig shares the RJ Victoria suite (1175 Douglas St,
-- Suite 1000) with Harp Sandhu (batch 12).
--
-- Rebrand notes (name changes, not departures): 1520 Goulet ("GGB &
-- Associates"), 1391 Mallender (practice now under the multi-office
-- Fairway Wealth Management team), 1302 Dorey Hartwig ("Heart Wealth"),
-- 1644 Miller ("The Miller Wealth Group"), and a WEAK succession signal
-- on 1526 Kingsford ("Smith Soutière Wealth Management" rebrand).
--
-- Address-only entries (no team member met the strict full-name+title
-- bar): 1782 Papworth, 1440 Stewart, 1615 Leacock (lead's own title only).

-- 1462 Ludovic Siouffi — LEFT THE INDUSTRY (archived per precedent).
UPDATE contacts SET
  reachable = 0,
  address = 'Suite 2200, 609 Granville St (former office)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LEFT WEALTH MANAGEMENT: quit advising to become Co-Founder & CEO of Fox Fold (Vancouver startup, launched Feb 2024, $5M Series A). The Ludo Group at CG dissolved; team site offline. No confirmed successor at Canaccord.')), 512)
WHERE id = 1462;

-- 1526 Thalia Kingsford, BMO Nesbitt Burns (Kingsford & Associates), Calgary, AB
UPDATE contacts SET
  address = '525 8th Avenue SW, Suite 1100 (Eighth Avenue Place, East Tower)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: team rebranded "Smith Soutière Wealth Management" (after Cheryl Smith and Stacy Soutière) at the same office, consistent with her published succession plan; her LinkedIn still shows her active at BMO — verify status before outreach.')), 512)
WHERE id = 1526;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1526, x.name, x.role FROM (
  SELECT 'Cheryl Smith' AS name, 'Investment Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Stacy Soutière', 'Investment Advisor, Portfolio Manager & Financial Planner'
  UNION ALL SELECT 'Hameda Ali', 'Client Service Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1526)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1526 AND name = x.name);

-- 1704 Paul Delfino, Raymond James (The Delfino Group), Kanata, ON
UPDATE contacts SET address = '450 March Road, Unit 400' WHERE id = 1704;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1704, x.name, x.role FROM (
  SELECT 'Sharon Clewlow' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Maureen O''Brien', 'Associate Wealth Advisor (CFP, CFA, CLU)'
  UNION ALL SELECT 'Monika Stoicescu', 'Senior Wealth Advisor Associate'
  UNION ALL SELECT 'Melissa Delfino', 'Business Development Associate (CPA)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1704)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1704 AND name = x.name);

-- 1391 Craig Mallender, NBF Wealth Management, Windsor, ON
UPDATE contacts SET
  address = '1 Riverside Dr. W, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice now operates under the multi-office "Fairway Wealth Management" NBF team (London/Toronto/Waterloo/Chatham/Windsor) — affiliation change, still at NBF Windsor.')), 512)
WHERE id = 1391;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1391, x.name, x.role FROM (
  SELECT 'Reg Jackson' AS name, 'Senior Wealth Advisor & Portfolio Manager (Fairway Wealth Management)' AS role
  UNION ALL SELECT 'Paul Manders', 'Senior Wealth Advisor & Portfolio Manager (Fairway Wealth Management)'
  UNION ALL SELECT 'Zach Davidson', 'Wealth Advisor & Portfolio Manager — Partner (Fairway Wealth Management)'
  UNION ALL SELECT 'Adam Watson', 'Wealth Advisor & Portfolio Manager (Fairway Wealth Management)'
  UNION ALL SELECT 'Joe Di Brita', 'Wealth Advisor (Fairway Wealth Management)'
  UNION ALL SELECT 'Youssef Haidar', 'Wealth Advisor (Fairway Wealth Management)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1391)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1391 AND name = x.name);

-- 1520 Richard Goulet, BMO Nesbitt Burns (GGB & Associates Wealth Management), Ottawa, ON
UPDATE contacts SET
  address = '979 Bank Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team rebranded from "Goulet Wealth Advisory Team" to "GGB & Associates Wealth Management" (Goulet, Guillemette, Bernier) — same BMO office.')), 512)
WHERE id = 1520;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1520, x.name, x.role FROM (
  SELECT 'Pierre Bernier' AS name, 'Investment Advisor and Financial Planner (CFP, FMA)' AS role
  UNION ALL SELECT 'Krista Guillemette', 'Senior Wealth Associate and Financial Planner'
  UNION ALL SELECT 'Roxanne Laporte', 'Investment Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1520)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1520 AND name = x.name);

-- 1782 Chris Papworth, ScotiaMcLeod, Salmon Arm, BC (address only)
UPDATE contacts SET address = '391 Hudson Avenue NE, Suite 202' WHERE id = 1782;

-- 1440 Vincent Stewart, CG Wealth Management, Vancouver, BC (address only — solo advisor)
UPDATE contacts SET address = '1133 Melville St, Suite 1200' WHERE id = 1440;

-- 1615 Peter Leacock, CIBC Wood Gundy (The Leacock Group), Vancouver, BC (address only)
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1615;

-- 1431 David Christianson — CONFIRMED RETIRED (archived per precedent).
UPDATE contacts SET
  reachable = 0,
  address = 'Suite 1000 - 400 St. Mary Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'RETIRED: NBF pages state his "retirement plan unfolded" in 2022; team rebranded "Current Wealth Advisors" under Paul Kawchuk, Andrew Froese, and Eric Nipp (all Wealth Advisor & Portfolio Manager, same Winnipeg office) — needs human decision on whether/how to add a successor contact.')), 512)
WHERE id = 1431;

-- 1820 Blake Griffith, Sun Life (Griffith & Associates), Calgary, AB
UPDATE contacts SET address = '1918 Kensington Road NW, Unit 350' WHERE id = 1820;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1820, x.name, x.role FROM (
  SELECT 'Andrew Maxwell' AS name, 'Advisor (CFP)' AS role
  UNION ALL SELECT 'Genna Bey', 'Operations Manager'
  UNION ALL SELECT 'Sam Argote', 'Associate Advisor'
  UNION ALL SELECT 'Taylor Hibbert', 'Associate Advisor'
  UNION ALL SELECT 'Deborah Taylor', 'Executive Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1820)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1820 AND name = x.name);

-- 1302 April Dorey Hartwig, Raymond James (Heart Wealth Management Group), Victoria, BC
UPDATE contacts SET
  address = '1175 Douglas Street, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team rebranded from "Dorey Wealth Management" to "Heart Wealth Management Group" (name change, not a departure); same RJ Victoria suite as Sandhu Wealth — independent teams. Also AB offices in Stony Plain and Edmonton.')), 512)
WHERE id = 1302;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1302, x.name, x.role FROM (
  SELECT 'Chad Katunar' AS name, 'Wealth Manager (BBA, CFP, CIM, CLU)' AS role
  UNION ALL SELECT 'Pamela (Pam) Katunar', 'Wealth Manager (CIM)'
  UNION ALL SELECT 'Marla Mae Abusmas', 'Investment Representative'
  UNION ALL SELECT 'Samuel Della Monica', 'Client Service Associate'
  UNION ALL SELECT 'Cameron Gregory', 'Wealth Manager Assistant'
  UNION ALL SELECT 'Sophia Sparanese', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1302)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1302 AND name = x.name);

-- 1763 Walter Flores, ScotiaMcLeod (Flores Advisory Group), Calgary, AB
UPDATE contacts SET address = '225 6th Avenue SW, Suite 1700' WHERE id = 1763;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1763, x.name, x.role FROM (
  SELECT 'Anthony McQueen' AS name, 'Wealth Advisor & Associate Portfolio Manager (CFA)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1763)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1763 AND name = x.name);

-- 1453 Jerry Basran, CG Wealth Management (The Basran Wealth Management Group), Vancouver, BC
UPDATE contacts SET address = '1133 Melville St., Suite 1200' WHERE id = 1453;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1453, x.name, x.role FROM (
  SELECT 'Sonia Taylor' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Delia Barbosa', 'Senior Investment Associate'
  UNION ALL SELECT 'Alicia Wu', 'Investment Associate'
  UNION ALL SELECT 'Napa Iamnopparat', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1453)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1453 AND name = x.name);

-- 1710 Christina Chow, Raymond James (Eighth Avenue Private Wealth Management), Calgary, AB
UPDATE contacts SET address = '525 8th Avenue SW, Suite 4100' WHERE id = 1710;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1710, x.name, x.role FROM (
  SELECT 'David Jung' AS name, 'Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Tish Nuttgens', 'Senior Wealth Advisor Assistant (options licensed)'
  UNION ALL SELECT 'Dana Nguyen', 'Senior Wealth Advisor Assistant'
  UNION ALL SELECT 'Sydney Danielewicz', 'Wealth Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1710)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1710 AND name = x.name);

-- 1242 Dean Ksionzyk, ScotiaMcLeod (Ksionzyk Financial Management), Sidney, BC
UPDATE contacts SET address = '9838 Fourth Street, Suite 102' WHERE id = 1242;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1242, x.name, x.role FROM (
  SELECT 'Anthony Windeyer' AS name, 'Senior Insurance Consultant' AS role
  UNION ALL SELECT 'Tricia McIver', 'Business and Family Wealth Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1242)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1242 AND name = x.name);

-- 1241 Christine LaLiberte, Raymond James (Insightful Wealth Group), Surrey, BC
UPDATE contacts SET address = '5455 152nd Street, Suite 309' WHERE id = 1241;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1241, x.name, x.role FROM (
  SELECT 'Joni Fast' AS name, 'Associate Financial Advisor' AS role
  UNION ALL SELECT 'Jennifer Moulder', 'Financial Advisor Assistant (Licensed Associate)'
  UNION ALL SELECT 'Jenelle Porter', 'Associate Administrator'
  UNION ALL SELECT 'Jewel Miller', 'Client Relations Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1241)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1241 AND name = x.name);

-- 1430 Benji Miles — CONFIRMED DEPARTURE to Raymond James (firm/title updated).
-- New Winnipeg street address not yet published; old Richardson address
-- would be stale, so address stays unset and the old email is flagged.
UPDATE contacts SET
  firm = 'Raymond James',
  title = 'Senior Wealth Advisor & Senior Portfolio Manager',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Left Richardson Wealth for Raymond James Ltd. (announced Sept 25, 2025, closed Q4 2025) — Miles Wealth Management Group, one of three Winnipeg teams (~$1B combined AUM) in the move. New street address not yet published (old office: One Lombard Place, Suite 1100); old Richardson email likely stale — verify before outreach.')), 512)
WHERE id = 1430;

-- 1644 Kurt Miller, CIBC Wood Gundy (The Miller Wealth Group), Edmonton, AB
UPDATE contacts SET address = '10180-101 Street, Suite 1800' WHERE id = 1644;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1644, x.name, x.role FROM (
  SELECT 'Melinda Peacock' AS name, 'Financial Associate' AS role
  UNION ALL SELECT 'Richard McBryer', 'Financial Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1644)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1644 AND name = x.name);
