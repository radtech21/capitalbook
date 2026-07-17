-- Rest-of-Canada Financial Advisor enrichment, batch 12 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Both suspected shared-team pairs were CONFIRMED as single practices:
--   1593 Adam Pion + 1621 Michel Matifat — "PionMatifat Investment Group"
--   1622 Nav Maharaj + 1635 Damian Cenkowski — "MC Financial Group"
-- Both practices sit in the same CIBC Wood Gundy Vancouver branch suite
-- (1055 Dunsmuir St, Suite 2434) as 1597 Christopher Helm (batch 7) —
-- three independent teams in one branch. The identical AUM within each
-- pair reflects shared team AUM, not a data error.
--
-- Other shared-branch notes (independent teams): 1383 Mark Horsley joins
-- the MacDougall team's NBF Red Deer branch; 1386 Ben Smit joins Chad
-- Krahn's NBF Kelowna branch (both rosters mention a "Lise" Senior Wealth
-- Associate — possibly one shared branch associate); 1586 Rolanda
-- Campbell shares the CIBC Edmonton suite with Brad Hummel (batch 4);
-- 1714 Brad Moore shares the Raymond James Calgary suite with Mark
-- Hougen (batch 8); 1363 Joyce Marbach shares the NBF Regina branch with
-- the Schneider Financial Group (batch 9); 1416 Randall Takasaki is the
-- 3rd NBF team at 475 Howe St, Vancouver; 1568 Joe Goverde (BMO) is in
-- the same London tower as the CIBC teams at 255 Queens Ave.
--
-- Address-only entries (no team member met the strict full-name+title
-- bar): 1568 Goverde, 1416 Takasaki, 1613 Butler.

-- 1505 William Frenn, Manulife Wealth, Dorval, QC
UPDATE contacts SET address = '1405 Trans-Canada Highway, Suite 200' WHERE id = 1505;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1505, x.name, x.role FROM (
  SELECT 'Dimitri Lappos' AS name, 'Investment Advisor, Manulife Wealth' AS role
  UNION ALL SELECT 'Pierre-Erwan Pène', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Pierre (Alex) Richard', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'John Buratti', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Nicholas Pinos', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Jade E. Sheiner', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Jian Yi Zhang', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Lylia Benjelloun', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Massimo Spano (CPA, CMA)', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Benjamin Lelouche', 'Investment Advisor, Manulife Wealth'
  UNION ALL SELECT 'Felix Daigneault', 'Investment Advisor, Manulife Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1505)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1505 AND name = x.name);

-- 1568 Joe Goverde, BMO Nesbitt Burns, London, ON (address only)
UPDATE contacts SET address = '255 Queens Ave., Suite 1900' WHERE id = 1568;

-- 1416 Randall Takasaki, NBF Wealth Management, Vancouver, BC (address only)
UPDATE contacts SET address = '475 Howe Street, Suite 3000' WHERE id = 1416;

-- 1593 Adam Pion, CIBC Wood Gundy (PionMatifat Investment Group), Vancouver, BC
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1593;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1593, x.name, x.role FROM (
  SELECT 'Michel Matifat' AS name, 'Senior Portfolio Manager (CPA, CA, CIM) — team co-lead' AS role
  UNION ALL SELECT 'Alexander D. Wong', 'Associate Investment Advisor (CFP, CIM)'
  UNION ALL SELECT 'Manjit Sidhu', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1593)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1593 AND name = x.name);

-- 1621 Michel Matifat, CIBC Wood Gundy (PionMatifat Investment Group), Vancouver, BC
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1621;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1621, x.name, x.role FROM (
  SELECT 'Adam G. Pion' AS name, 'Portfolio Manager (CFA, CFP) — team co-lead' AS role
  UNION ALL SELECT 'Alexander D. Wong', 'Associate Investment Advisor (CFP, CIM)'
  UNION ALL SELECT 'Manjit Sidhu', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1621)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1621 AND name = x.name);

-- 1383 Mark Horsley, NBF Wealth Management (Horsley Wealth Management Group), Red Deer, AB
UPDATE contacts SET address = '4719 48th Avenue, Suite 200' WHERE id = 1383;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1383, x.name, x.role FROM (
  SELECT 'Dale Horsley' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Charlene Sunderland', 'Premium Banker'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1383)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1383 AND name = x.name);

-- 1586 Rolanda Campbell, CIBC Wood Gundy, Edmonton, AB
UPDATE contacts SET address = '10180-101 Street, Suite 1800' WHERE id = 1586;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1586, x.name, x.role FROM (
  SELECT 'Samantha Avery' AS name, 'Financial Associate' AS role
  UNION ALL SELECT 'Senate Patton', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1586)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1586 AND name = x.name);

-- 1386 Ben Smit, NBF Wealth Management (Smit Wealth Management Group), Kelowna, BC
UPDATE contacts SET address = '1631 Dickson Ave., Suite 1710 (Landmark 6)' WHERE id = 1386;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1386, 'Paul Cescon', 'Wealth Advisor & Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1386)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1386 AND name = 'Paul Cescon');

-- 1613 Keith Butler, CIBC Wood Gundy, St. John's, NL (address only)
UPDATE contacts SET address = '215 Water Street, 8th Floor' WHERE id = 1613;

-- 1714 Brad Moore, Raymond James (SAGE Connected Investing), Calgary, AB
UPDATE contacts SET address = 'Suite 4100, 525 8th Avenue SW' WHERE id = 1714;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1714, x.name, x.role FROM (
  SELECT 'David Sherlock' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Brad Antoniuk', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Nick Mazer', 'Wealth Advisor'
  UNION ALL SELECT 'Yvonne Martin-Morrison, CFP, CRPC', 'Senior Financial Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1714)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1714 AND name = x.name);

-- 1290 Harp Sandhu, Raymond James (Sandhu Wealth), Victoria, BC
UPDATE contacts SET address = '1175 Douglas St, Suite 1000' WHERE id = 1290;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1290, x.name, x.role FROM (
  SELECT 'Christophe Vencatareddy' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Ines Iraoui', 'Financial Planner'
  UNION ALL SELECT 'Amy Chen', 'Wealth Advisor Associate'
  UNION ALL SELECT 'Keegan Durrance', 'Wealth Advisor Associate'
  UNION ALL SELECT 'Amir Ezati', 'Wealth Advisor Associate'
  UNION ALL SELECT 'Rachel Reynolds', 'Client Service Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1290)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1290 AND name = x.name);

-- 1622 Nav Maharaj, CIBC Wood Gundy (MC Financial Group), Vancouver, BC
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1622;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1622, x.name, x.role FROM (
  SELECT 'Damian Cenkowski' AS name, 'Senior Wealth Advisor — team co-lead' AS role
  UNION ALL SELECT 'Andrew Marolla', 'Registered Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1622)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1622 AND name = x.name);

-- 1635 Damian Cenkowski, CIBC Wood Gundy (MC Financial Group), Vancouver, BC
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1635;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1635, x.name, x.role FROM (
  SELECT 'Nav Maharaj' AS name, 'First Vice-President and Senior Investment Advisor — team co-lead' AS role
  UNION ALL SELECT 'Andrew Marolla', 'Registered Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1635)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1635 AND name = x.name);

-- 1363 Joyce Marbach, NBF Wealth Management (Marbach Wealth Management Group), Regina, SK
UPDATE contacts SET address = '2075 Prince of Wales Drive, Suite 305' WHERE id = 1363;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1363, x.name, x.role FROM (
  SELECT 'Ryan van Gelder' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Austin Nieswandt', 'Associate'
  UNION ALL SELECT 'Holly Ripplinger', 'Client Relationship Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1363)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1363 AND name = x.name);

-- 1390 Anna Hilberry, NBF Wealth Management (The Hilberry Group), Duncan, BC
UPDATE contacts SET address = '2763 Beverly St., Suite 206' WHERE id = 1390;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1390, x.name, x.role FROM (
  SELECT 'Steven Hilberry' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Brandy Addison', 'Wealth Management Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1390)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1390 AND name = x.name);

-- 1528 Jonathan Walton-Ball, BMO Nesbitt Burns (Walton-Ball Wealth Advisory Group), Ancaster, ON
UPDATE contacts SET address = '737 Golf Links Road, Unit #5' WHERE id = 1528;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1528, x.name, x.role FROM (
  SELECT 'Jeff Rowan' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Corbin Myers', 'Senior Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1528)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1528 AND name = x.name);

-- 1695 George McConechy, Raymond James (Novus Pro), Edmonton, AB
UPDATE contacts SET address = 'Suite 2300, Rice Howard Place Tower 1, 10060 Jasper Avenue' WHERE id = 1695;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1695, x.name, x.role FROM (
  SELECT 'Scott McCartney' AS name, 'Partner, Portfolio Manager (co-founder, Novus Pro)' AS role
  UNION ALL SELECT 'Monique Lavigne', 'Administration Team Lead'
  UNION ALL SELECT 'Dylan Pannu', 'Investment Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1695)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1695 AND name = x.name);

-- 1422 Diane Cormier, NBF Wealth Management, Moncton, NB
UPDATE contacts SET address = '735 Main Street, Suite 402' WHERE id = 1422;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1422, 'Ginette Goulet', 'Wealth Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1422)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1422 AND name = 'Ginette Goulet');
