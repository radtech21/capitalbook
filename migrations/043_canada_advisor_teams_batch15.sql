-- Rest-of-Canada Financial Advisor enrichment, batch 15 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Shared-team pair CONFIRMED: 1253 Paul Shipton + 1270 Omar Duric
-- co-founded one Wellington-Altus practice ("Shipton Duric & Associates,"
-- rebranded "Oram Financial") spanning Gibsons and White Rock — the
-- identical $250.9M AUM is one shared book, not a data error. Each
-- contact keeps their own office address with cross-referenced rosters.
--
-- One internal role change, applied + flagged per the Astaneh precedent
-- (no archive): 1736 Craig Emptage stepped out of client-facing advisory
-- into ScotiaMcLeod branch management effective July 1, 2026; his team
-- rebranded "Pillar Advisory Group" under Yousef Nassereddine.
--
-- Weak signals flagged, applied anyway per precedent:
--   1359 Susan O'Brien — a live BMO Nesbitt Burns microsite lists her
--     same team (Suite 1100, same tower), suggesting a possible post-iA
--     return to BMO; no dated announcement found, firm of record kept as
--     Richardson pending verification.
--   1356 Brad Hunter — team member Chris Ward may have departed to CG
--     Wealth (Wyder Wealth Partners); Brad himself shows no move.
--
-- Shared-building notes (independent teams): 1423 Suzanne Alton is the
-- 3rd team at NBF Winnipeg (400 St. Mary Ave, Suite 1000); 1650 Penny
-- Omell is the 4th team at the CIBC Edmonton suite (10180-101 St, Suite
-- 1800); 1746 Rene Welz is the 4th Scotia team at Edmonton's Stantec
-- Tower; 1452 Kathy Sager is the 10th CG team at 1133 Melville St; 1356
-- Hunter and 1359 O'Brien join Broadley (batch 14) at Richardson Calgary
-- (525 8th Ave SW, Suite 4700); 1736 Emptage joins the CIBC/BMO teams'
-- London tower at 255 Queens Ave. Anthony Windeyer (Senior Insurance
-- Consultant) appears on both the Ksionzyk (batch 13) and Chang team
-- pages — now treated as a shared regional Scotia specialist and
-- excluded from Chang's roster.
--
-- Practice-name notes: Dunphy's dealer is IPC Investment Corporation
-- (CRM lists "IPC Securities"); Nobrega's dealer renamed Manulife
-- Securities -> Manulife Wealth; Welz's team renamed "Welz Kehr Marano
-- Group"; Sager's former "Sager Lecky Peters" team split.
--
-- Address-only entry (no team member met the strict full-name+title
-- bar): 1817 Marina Newson.

-- 1817 Marina Newson, Odlum Brown, Vancouver, BC (address only)
UPDATE contacts SET address = 'Suite 1100 - 250 Howe Street' WHERE id = 1817;

-- 1502 David Nobrega, Manulife Wealth dealer (Nobrega Financial), Edmonton, AB
UPDATE contacts SET
  address = 'Suite 201, 6050 Andrews Way SW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice is "Nobrega Financial" (his own firm) with Manulife Wealth Inc. as dealer — Manulife Securities was renamed Manulife Wealth (branding change, not a departure).')), 512)
WHERE id = 1502;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1502, x.name, x.role FROM (
  SELECT 'Kurtis Schultz' AS name, 'Financial Planner (BCom, CFP, CLU)' AS role
  UNION ALL SELECT 'Shirley Featherstone', 'Mutual Fund Advisor'
  UNION ALL SELECT 'Lucas Samson', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1502)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1502 AND name = x.name);

-- 1736 Craig Emptage, ScotiaMcLeod (Pillar Advisory Group), London, ON (role change, applied + flagged)
UPDATE contacts SET
  address = '255 Queens Avenue, Suite 1700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ROLE CHANGE: effective July 1, 2026 stepped out of client-facing advisory into a ScotiaMcLeod Branch Administrator / Assistant Branch Manager role; team rebranded from "The Emptage Financial Group" to "Pillar Advisory Group" with Yousef Nassereddine as advisory lead — may no longer be a prospect, verify.')), 512)
WHERE id = 1736;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1736, x.name, x.role FROM (
  SELECT 'Yousef Nassereddine' AS name, 'Associate Portfolio Manager (CFP, CIM) — advisory lead, Pillar Advisory Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1736)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1736 AND name = x.name);

-- 1423 Suzanne Alton, NBF Wealth Management (Alton Ashcroft Wealth Advisory Group), Winnipeg, MB
UPDATE contacts SET address = 'Suite 1000 - 400 St. Mary Avenue' WHERE id = 1423;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1423, x.name, x.role FROM (
  SELECT 'David Ashcroft' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Samantha Schau', 'Wealth Advisor & Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1423)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1423 AND name = x.name);

-- 1671 Kevin Dunphy, IPC (Dunphy-Molloy & Associates), St. John's, NL
UPDATE contacts SET
  address = '556 Topsail Road, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Dealer is IPC Investment Corporation, not "IPC Securities" as recorded; practice is Dunphy-Molloy & Associates (he is President). Former 90 Barters Hill address is outdated.')), 512)
WHERE id = 1671;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1671, x.name, x.role FROM (
  SELECT 'Greg O''Brien' AS name, 'Certified Financial Planner (CFP, CLU)' AS role
  UNION ALL SELECT 'Bailey Ryan', 'Office Manager'
  UNION ALL SELECT 'Joanne Lester', 'Client Services Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1671)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1671 AND name = x.name);

-- 1359 Susan O'Brien, Richardson Wealth (The Susan O'Brien Group), Calgary, AB (weak signal, applied + flagged)
UPDATE contacts SET
  address = '525 8th Avenue SW, Suite 4700 (Eighth Avenue Place)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: a live BMO Nesbitt Burns microsite ("The Susan O''Brien Group Wealth Advisory of BMO Nesbitt Burns", Suite 1100 same tower) lists her same team, suggesting a possible post-iA-acquisition return to BMO (she was at BMO 1998-2021). No dated announcement found — verify employer before outreach.')), 512)
WHERE id = 1359;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1359, x.name, x.role FROM (
  SELECT 'Blair Baert' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Jodi McLaughlin', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Courtney Lance', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1359)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1359 AND name = x.name);

-- 1322 Dale Lamb, Assante (DKL Financial Group), Kelowna, BC
UPDATE contacts SET address = '216 - 3477 Lakeshore Road' WHERE id = 1322;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1322, x.name, x.role FROM (
  SELECT 'Matthew (Matt) Williams' AS name, 'Associate Financial Advisor (B.Comm, CFP)' AS role
  UNION ALL SELECT 'Christian Santos', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1322)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1322 AND name = x.name);

-- 1452 Kathy Sager, CG Wealth Management (Sager Financial Group), Vancouver, BC
UPDATE contacts SET
  address = '1133 Melville St., Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Former joint team "Sager Lecky Peters Wealth Management" split — Patrick Lecky and Brian Peters now run a separate Lecky Peters Advisory Group at 609 Granville St.')), 512)
WHERE id = 1452;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1452, x.name, x.role FROM (
  SELECT 'Jennifer Johnson' AS name, 'Investment Representative' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1452)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1452 AND name = x.name);

-- 1709 Dave Lougheed, Raymond James (Lougheed Wealth Management), Calgary, AB
UPDATE contacts SET address = 'Suite 900, 2303 4 Street SW' WHERE id = 1709;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1709, x.name, x.role FROM (
  SELECT 'Dana Lougheed' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Boston Rowe', 'Financial Planner & Wealth Advisor Associate (CFP, BCom)'
  UNION ALL SELECT 'Varsha Ladwa', 'Client Service Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1709)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1709 AND name = x.name);

-- 1797 Ivan Chang, ScotiaMcLeod, Richmond, BC
UPDATE contacts SET address = '6300 No. 3 Road, 2nd Floor' WHERE id = 1797;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1797, x.name, x.role FROM (
  SELECT 'Linda Jiang' AS name, 'Administrative Associate' AS role
  UNION ALL SELECT 'Arthur Szeto', 'Private Banker'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1797)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1797 AND name = x.name);

-- 1650 Penny Omell, CIBC Wood Gundy (The Omell Financial Group), Edmonton, AB
UPDATE contacts SET address = '10180-101 Street, Suite 1800' WHERE id = 1650;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1650, x.name, x.role FROM (
  SELECT 'Ron Omell' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1650)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1650 AND name = x.name);

-- 1356 Brad Hunter, Richardson Wealth (The Hunter Team), Calgary, AB (weak signal on team member, flagged)
UPDATE contacts SET
  address = 'Suite 4700, 525 8th Avenue SW (Eighth Avenue Place)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: team member Chris Ward may have departed to CG Wealth (Wyder Wealth Partners, Calgary) — unverified; Brad himself shows no post-iA move.')), 512)
WHERE id = 1356;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1356, x.name, x.role FROM (
  SELECT 'Chris Ward' AS name, 'Senior Wealth Associate & Portfolio Manager (possible recent departure to CG Wealth — verify)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1356)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1356 AND name = x.name);

-- 1756 Julie Brady Campbell, ScotiaMcLeod (Brady Campbell Advisory Group), Sarnia, ON
UPDATE contacts SET address = '265 Front Street N, Suite 410' WHERE id = 1756;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1756, x.name, x.role FROM (
  SELECT 'Shannon Brady' AS name, 'Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1756)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1756 AND name = x.name);

-- 1380 Francois Fortier, NBF Wealth Management (F. Fortier Wealth Management Group), Brossard, QC
UPDATE contacts SET address = '1040, rue du Lux, Bureau 710' WHERE id = 1380;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1380, x.name, x.role FROM (
  SELECT 'Charles-Antoine Lévesque' AS name, 'Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Olivier Lamoureux', 'Senior Financial Planning Advisor'
  UNION ALL SELECT 'Liette Rivest', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1380)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1380 AND name = x.name);

-- 1746 Rene Welz, ScotiaMcLeod (Welz Kehr Group / Welz Kehr Marano Group), Edmonton, AB
UPDATE contacts SET
  address = 'Suite 2100, 10220 103 Avenue NW (Stantec Tower)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team renamed "Welz Kehr Marano Group" in directories (Donni Marano elevated) — a rebrand, not a departure.')), 512)
WHERE id = 1746;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1746, x.name, x.role FROM (
  SELECT 'Aaron Kehr' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Jennifer Tweddle', 'Senior Total Wealth Planner (BA, CFP, CLU, CHS, TEP)'
  UNION ALL SELECT 'Cheryl Garth', 'Licensed Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1746)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1746 AND name = x.name);

-- 1298 Sean O'Connor, IG Private Wealth Management (O'Connor and Associates), Calgary, AB
UPDATE contacts SET address = '110 Country Hills Landing NW, Suite 202' WHERE id = 1298;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1298, x.name, x.role FROM (
  SELECT 'Allan Reimer' AS name, 'Associate Consultant' AS role
  UNION ALL SELECT 'Ryan O''Connor', 'Associate Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1298)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1298 AND name = x.name);

-- 1253 Paul Shipton, Wellington-Altus (Oram Financial, ex Shipton Duric & Associates), Gibsons, BC
UPDATE contacts SET
  address = 'Suite 202 - 938 Gibsons Way',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Same team as 1270 Omar Duric — co-founded "Shipton Duric & Associates," rebranded "Oram Financial," spanning Gibsons and White Rock; identical AUM is one shared book, not a data error.')), 512)
WHERE id = 1253;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1253, x.name, x.role FROM (
  SELECT 'Omar Duric' AS name, 'Senior Wealth Advisor & Senior Portfolio Manager — team co-founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1253)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1253 AND name = x.name);

-- 1270 Omar Duric, Wellington-Altus (Oram Financial, ex Shipton Duric & Associates), White Rock, BC
UPDATE contacts SET
  address = '34 White Rock Square, 1480 Foster Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Same team as 1253 Paul Shipton — co-founded "Shipton Duric & Associates," rebranded "Oram Financial," spanning Gibsons and White Rock; identical AUM is one shared book, not a data error.')), 512)
WHERE id = 1270;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1270, x.name, x.role FROM (
  SELECT 'Paul Shipton' AS name, 'Senior Wealth Advisor & Senior Portfolio Manager — team co-founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1270)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1270 AND name = x.name);
