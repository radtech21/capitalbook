-- Rest-of-Canada Financial Advisor enrichment, batch 16 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Four confirmed firm/dealer switches this batch (firm/title updated +
-- flagged):
--   1700 Steve Switzer (Fort Saskatchewan): moved his whole practice
--     (Switzer Financial Services) from Raymond James to iA Private
--     Wealth, ~Oct 2023 — same office, new email.
--   1491 Sonny Wadera (Saint-Laurent): Kelson Wealth Management moved
--     from Manulife to iA Private Wealth Inc. — same office.
--   1693 Brad Ginet (Calgary): left Raymond James for Wellington-Altus,
--     now Principal of "NOW Wealth Management Solutions." New street
--     address unverified ("11th Avenue Place" only), left unset.
--   1292 Larry Lovis (Thunder Bay): left IG Private Wealth for
--     Wellington-Altus, new office ("Lovis & Partners Private Wealth")
--     opened ~Dec 2023.
--
-- One firm-level affiliation flagged (not a personal departure): 1723
-- Jeremy Clark's CH Financial has merged/partnered with Optimize Wealth
-- Management (both sites now co-branded); exact nature unconfirmed.
--
-- Practice rebrands, applied + flagged, no departure: 1323 Stephen
-- Jones ("Jones Private Client" -> "Unified Advisory Group," apparent
-- merger with Mike Gomes's practice).
--
-- Shared-building notes (independent teams): 1381 Johanne Claveau is
-- the 2nd NBF team at the Brossard branch (1040 rue du Lux, Bureau 710)
-- alongside F. Fortier's group (batch 15); 1447 Brent Todd and 1457 Leon
-- Pedwerbeski are the 11th/12th independent CG teams at 1133 Melville
-- St; 1449 Clinton Orr shares 201 Portage Ave, Winnipeg with Endeavour
-- Wealth (batch 14) at a different suite; 1259 Chuck McNaughton shares
-- the Scotia Sidney branch (9838 Fourth St, Suite 102) with Ksionzyk
-- Financial Management (batch 13) as an independent team.
--
-- Address correction: 1699 Sam Yau's primary office is now Sherwood
-- Park (Emerald Hills), not the Edmonton corporate branch; also, the
-- Edmonton branch building at 10060 Jasper Ave is Scotia Place Tower 1,
-- not Rice Howard Place as noted in a prior batch.
--
-- Address-only entries (no team member met the strict full-name+title
-- bar): 1481 Leanne Kohtala, 1589 Benoit Lussier.

-- 1381 Johanne Claveau, NBF Wealth Management (Groupe Claveau), Brossard, QC
UPDATE contacts SET address = '1040, rue du Lux, Bureau 710' WHERE id = 1381;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1381, x.name, x.role FROM (
  SELECT 'Allan Xavier' AS name, 'Wealth Advisor (CFA)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1381)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1381 AND name = x.name);

-- 1723 Jeremy Clark, CH Financial, Calgary, AB (firm-level affiliation flagged)
UPDATE contacts SET
  address = 'Suite 450, 700 4 Avenue SW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CH Financial has merged/partnered with Optimize Wealth Management (both sites now co-branded "CH Financial... With Optimize"; Clark also listed as an Optimize Wealth Planner) — exact nature of the relationship unconfirmed, verify.')), 512)
WHERE id = 1723;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1723, x.name, x.role FROM (
  SELECT 'Erika Stewart' AS name, 'Chief Operating Officer' AS role
  UNION ALL SELECT 'Devin Gorgchuck', 'Vice President, Wealth Services'
  UNION ALL SELECT 'Aby Brook', 'Director'
  UNION ALL SELECT 'Joanne Jackson', 'Office Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1723)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1723 AND name = x.name);

-- 1447 Brent Todd, CG Wealth Management, Vancouver, BC
UPDATE contacts SET address = '1133 Melville St., Suite 1200' WHERE id = 1447;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1447, x.name, x.role FROM (
  SELECT 'Johnny Markovina' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Sean Kamensek', 'Investment Associate / Registered Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1447)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1447 AND name = x.name);

-- 1700 Steve Switzer — CONFIRMED move to iA Private Wealth (firm/title/email updated).
UPDATE contacts SET
  firm = 'iA Private Wealth',
  title = 'Portfolio Manager',
  address = '10202B 100 Avenue',
  email = 'steve.switzer@iaprivatewealth.ca',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Moved practice "Switzer Financial Services" from Raymond James to iA Private Wealth, ~Oct 2023 — same Fort Saskatchewan office.')), 512)
WHERE id = 1700;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1700, x.name, x.role FROM (
  SELECT 'Claus Mueller' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Amanda Sears', 'Assistant'
  UNION ALL SELECT 'Carly Switzer', 'Assistant / Associate Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1700)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1700 AND name = x.name);

-- 1813 Chad Price, Odlum Brown (Price Wealth Advisory Group), Vancouver, BC
UPDATE contacts SET address = 'Suite 1100 - 250 Howe Street' WHERE id = 1813;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1813, x.name, x.role FROM (
  SELECT 'Andrea Lee' AS name, 'Wealth Associate and Investment Associate' AS role
  UNION ALL SELECT 'Yaeji Kim', 'Associate Financial Planner and Wealth Assistant (CFP)'
  UNION ALL SELECT 'Krista Scott', 'Investment Assistant'
  UNION ALL SELECT 'Fraser Crawford', 'Investment Assistant / Wealth Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1813)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1813 AND name = x.name);

-- 1457 Leon Pedwerbeski, CG Wealth Management (The Pedwerbeski Group), Vancouver, BC
UPDATE contacts SET address = '1133 Melville St., Suite 1200' WHERE id = 1457;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1457, x.name, x.role FROM (
  SELECT 'Kevin Vandermeer' AS name, 'Lead Portfolio Manager' AS role
  UNION ALL SELECT 'Christopher Law', 'Investment Advisor & Associate Portfolio Manager (CFA)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1457)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1457 AND name = x.name);

-- 1699 Sam Yau, Raymond James (Yau & Associates Wealth Advisory Group), Sherwood Park, AB
UPDATE contacts SET
  address = 'Suite 828, 8005 Emerald Drive, Sherwood Park, AB T8H 0P1',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Primary office is now Sherwood Park (Emerald Hills), not Edmonton proper; also affiliated with the Edmonton corporate branch, Suite 2300, Scotia Place Tower 1, 10060 Jasper Avenue.')), 512)
WHERE id = 1699;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1699, x.name, x.role FROM (
  SELECT 'Corina Grue' AS name, 'Wealth Advisor Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1699)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1699 AND name = x.name);

-- 1538 Jason Del Vicario, iA Private Wealth (Hillside Wealth Management), Vancouver, BC
UPDATE contacts SET address = '700-609 Granville Street' WHERE id = 1538;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1538, x.name, x.role FROM (
  SELECT 'Michael (Mike) Preto' AS name, 'Portfolio Manager (B.Comm., CFP, CIM)' AS role
  UNION ALL SELECT 'Amanda Baxter', 'Associate Investment Advisor'
  UNION ALL SELECT 'Steven Chen', 'Analyst'
  UNION ALL SELECT 'Sabrina Del Vicario', 'Business Development Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1538)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1538 AND name = x.name);

-- 1693 Brad Ginet — CONFIRMED DEPARTURE to Wellington-Altus (firm/title updated).
-- New street address unverified ("11th Avenue Place" only), left unset.
UPDATE contacts SET
  firm = 'Wellington-Altus Private Wealth',
  title = 'Senior Wealth Advisor and Principal',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Left Raymond James (10+ years there) for Wellington-Altus — now leads "NOW Wealth Management Solutions," Calgary. New office at "11th Avenue Place" per team materials; exact street address unverified. Old Raymond James email/address stale — verify before outreach.')), 512)
WHERE id = 1693;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1693, x.name, x.role FROM (
  SELECT 'Jeff Goldmintz' AS name, 'Associate Wealth Advisor (NOW Wealth Management Solutions)' AS role
  UNION ALL SELECT 'Jill Palomares', 'Investment Associate (NOW Wealth Management Solutions)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1693)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1693 AND name = x.name);

-- 1481 Leanne Kohtala, Manulife Wealth (Your Plan by Kohtala Financial), Timmins, ON (address only)
UPDATE contacts SET address = '207 First Avenue' WHERE id = 1481;

-- 1491 Sonny Wadera — CONFIRMED DEALER SWITCH to iA Private Wealth (firm/title updated).
UPDATE contacts SET
  firm = 'iA Private Wealth',
  title = 'Senior Mutual Funds Advisor',
  address = '1500 Rue du Collège, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Kelson Wealth Management moved from Manulife to iA Private Wealth Inc. — same Saint-Laurent office.')), 512)
WHERE id = 1491;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1491, x.name, x.role FROM (
  SELECT 'Glenn P. Kelly' AS name, 'Partner & Financial Planner / Senior Mutual Funds Advisor — co-founder' AS role
  UNION ALL SELECT 'Jeremy Kelly', 'Wealth Advisor (F.Pl.)'
  UNION ALL SELECT 'Yavor Nikov', 'Wealth Advisor'
  UNION ALL SELECT 'Carla Wojciechowski', 'Wealth Advisor'
  UNION ALL SELECT 'Savtanter Wadera', 'Business Relations Associate'
  UNION ALL SELECT 'Lloyd Flanagan', 'Financial Security Advisor'
  UNION ALL SELECT 'Rosina Scerbo', 'Office Manager / Licensed Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1491)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1491 AND name = x.name);

-- 1589 Benoit Lussier, CIBC Wood Gundy, Laval, QC (address only)
UPDATE contacts SET address = '2540 Boulevard Daniel-Johnson, Suite 800' WHERE id = 1589;

-- 1449 Clinton Orr, CG Wealth Management (Becker Orr Wealth Management), Winnipeg, MB
UPDATE contacts SET address = 'Suite 1010, 201 Portage Avenue' WHERE id = 1449;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1449, x.name, x.role FROM (
  SELECT 'Kevin Becker' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Alicia Roache', 'Senior Investment Associate'
  UNION ALL SELECT 'Maricar Irwin', 'Senior Investment Advisor Assistant (Licensed)'
  UNION ALL SELECT 'Adam Buss', 'Wealth & Estate Planning Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1449)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1449 AND name = x.name);

-- 1259 Chuck McNaughton, ScotiaMcLeod (The McNaughton Group), Sidney, BC
UPDATE contacts SET address = '9838 Fourth Street, Suite 102' WHERE id = 1259;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1259, x.name, x.role FROM (
  SELECT 'Christopher Kenny' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Anne Marie Weston', 'Administrative Support Assistant'
  UNION ALL SELECT 'Allison Turcotte', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1259)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1259 AND name = x.name);

-- 1284 Travis Forman, Harbourfront Wealth Management (Strategic Private Wealth Counsel), Surrey, BC
UPDATE contacts SET address = '310-15252 32nd Avenue' WHERE id = 1284;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1284, x.name, x.role FROM (
  SELECT 'Ian Goodman' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Marco Angelo Goco', 'Investment Advisor (Associate Portfolio Manager, Financial Planner)'
  UNION ALL SELECT 'Bryson Dutzi', 'Investment Advisor'
  UNION ALL SELECT 'Jay Rittinger', 'Investment Advisor'
  UNION ALL SELECT 'Gwyneth Quayle', 'Director of Operations'
  UNION ALL SELECT 'Karyn Forman', 'Marketing Manager'
  UNION ALL SELECT 'Carol Ritchie', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1284)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1284 AND name = x.name);

-- 1292 Larry Lovis — CONFIRMED DEPARTURE to Wellington-Altus (firm/address/title updated).
UPDATE contacts SET
  firm = 'Wellington-Altus Private Wealth',
  title = 'Senior Wealth Advisor',
  address = '920 Tungsten Street, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Left IG Private Wealth Management for Wellington-Altus — "Lovis & Partners Private Wealth," new office opened ~Dec 2023. Old IG email/address stale — verify before outreach.')), 512)
WHERE id = 1292;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1292, x.name, x.role FROM (
  SELECT 'Hayley Lovis' AS name, 'Associate (operations/administration, mortgage planning)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1292)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1292 AND name = x.name);

-- 1305 John Woodfield, Raymond James (SWAN Wealth Management), Kelowna, BC
UPDATE contacts SET address = '#500 - 1726 Dolphin Ave' WHERE id = 1305;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1305, x.name, x.role FROM (
  SELECT 'Tiffany Woodfield' AS name, 'Associate Portfolio Manager & Senior Wealth Advisor — co-founder' AS role
  UNION ALL SELECT 'Jake Imrich', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Candace Sced', 'Administrative Assistant'
  UNION ALL SELECT 'Katelyn Baumbusch', 'Business Development Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1305)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1305 AND name = x.name);

-- 1323 Stephen Jones, Assante Wealth Management (Unified Advisory Group), Waterloo, ON
UPDATE contacts SET
  address = 'Suite 1002, 20 Erb Street West',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice rebranded/merged from "Jones Private Client" to "Unified Advisory Group" (Waterloo + Bowmanville, apparently combined with Mike Gomes''s practice) — still active Senior Financial Advisor, not a departure.')), 512)
WHERE id = 1323;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1323, x.name, x.role FROM (
  SELECT 'Lynley Schwartzentruber' AS name, 'Senior Wealth Advisor (CFP)' AS role
  UNION ALL SELECT 'Christian Battistelli', 'Senior Wealth Advisor (CFP)'
  UNION ALL SELECT 'Mike Gomes', 'Senior Wealth Advisor (CFP)'
  UNION ALL SELECT 'Catherine Jones', 'Communications Associate'
  UNION ALL SELECT 'Ana Ferreira', 'Office Manager and Mutual Fund Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1323)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1323 AND name = x.name);
