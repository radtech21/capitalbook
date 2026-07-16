-- Batch 4 of GTA "advisor team" enrichment (18 more contacts, same methodology
-- as migrations 009-011). This batch's research prompts added an explicit
-- employment-status check after batch 3 surfaced a deceased advisor and a
-- firm departure — none of these 18 turned up anything that serious. Two
-- notes worth keeping in mind, not blockers:
--
--   1684 Darren Coleman — two directories still list him at 40 King St W,
--     Toronto (matches the CRM's existing city), but his practice has
--     rebranded to "Portage Cross Border Wealth Management," whose own site
--     lists Oakville/Vancouver offices instead. Applied the Toronto address
--     since it's corroborated and matches what's on file, but this may be a
--     multi-office practice rather than a single current address.
--   1779 Alejandro Gomez — his former joint team ("Gomez Valencia Portfolio
--     Management Group") appears to have split into two separate practices;
--     he's still active at the same address, just solo-branded now.
--
-- Two more pairs share a building with contacts from earlier batches (not
-- duplicates — independent teams at the same large downtown floor, a pattern
-- seen repeatedly: 1601 Ryan Gerstel is in the same building as 1600 Robert
-- Leon from batch 3, and both share Jamie Golombek, CIBC's firm-wide tax
-- specialist, as a real if non-exclusive team contact).

-- 1551 Alisa Carli, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 40th Floor' WHERE id = 1551;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1551, x.name, x.role FROM (
  SELECT 'Sharon Kubicek' AS name, 'Senior Portfolio Manager, Founder' AS role
  UNION ALL SELECT 'Zahid Chaudhery', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1551)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1551 AND name = x.name);

-- 1619 Mark Slater, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '333 Bay St., Suite 2800' WHERE id = 1619;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1619, x.name, x.role FROM (
  SELECT 'Jeannie Tse' AS name, 'Associate Wealth Advisor and Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Hamed Amri', 'Registered Representative'
  UNION ALL SELECT 'Ryan Tam', 'Client Associate / Registered Representative'
  UNION ALL SELECT 'Eloise Slater', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1619)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1619 AND name = x.name);

-- 1754 Felipe Lavalle, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 16th Floor' WHERE id = 1754;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1754, 'Luis Gisbert', 'Senior Wealth Advisor / Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1754)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1754 AND name = 'Luis Gisbert');

-- 1779 Alejandro Gomez, ScotiaMcLeod, Toronto — address only, see note above
UPDATE contacts SET address = '40 King Street W, 16th Floor' WHERE id = 1779;

-- 1637 Andrew McDonald, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = 'Brookfield Place, Suite 600, 181 Bay Street' WHERE id = 1637;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1637, x.name, x.role FROM (
  SELECT 'Michele Milton' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Luke Robertson', 'Associate Investment Advisor'
  UNION ALL SELECT 'Dally Bola', 'Client Associate'
  UNION ALL SELECT 'Dana Shaver', 'Administrative Associate'
  UNION ALL SELECT 'Mac Petryshyn', 'Associate Portfolio Manager and Associate Wealth Advisor'
  UNION ALL SELECT 'Stefan Ilincic', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1637)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1637 AND name = x.name);

-- 1561 Fred Bruun, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 42nd Floor' WHERE id = 1561;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1561, x.name, x.role FROM (
  SELECT 'Steve Gaull' AS name, 'Discretionary Portfolio Manager' AS role
  UNION ALL SELECT 'Nicholas Retter', 'Client Service Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1561)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1561 AND name = x.name);

-- 1606 Adam Doering, CIBC Wood Gundy, Burlington
UPDATE contacts SET address = '390 Brant Street, Suite 500' WHERE id = 1606;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1606, x.name, x.role FROM (
  SELECT 'Danielle Chvedukas' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Deva Thangapandian', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1606)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1606 AND name = x.name);

-- 1377 Simon Partington, Richardson Wealth Ltd, Toronto (moderate confidence
-- on the exact suite — Richardson Wealth has two Toronto offices)
UPDATE contacts SET address = '100 Queens Quay East, Suite 2500' WHERE id = 1377;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1377, 'Tiffany Harding', 'Wealth Strategist'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1377)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1377 AND name = 'Tiffany Harding');

-- 1445 Matthew Langsford, CG Wealth Management, Oakville
UPDATE contacts SET address = '1267 Cornwall Road, Suite 200' WHERE id = 1445;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1445, x.name, x.role FROM (
  SELECT 'Maria Jakovcic' AS name, 'Senior Investment Associate' AS role
  UNION ALL SELECT 'Shelley Yokom', 'Senior Investment Advisor Assistant'
  UNION ALL SELECT 'Pamela Smith', 'Senior Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1445)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1445 AND name = x.name);

-- 1217 Mark Miller, TD Wealth Private Investment Advice, Mississauga (address only)
UPDATE contacts SET address = '25 Watline Avenue, 6th Floor' WHERE id = 1217;

-- 1223 Kathryn Del Greco, TD Wealth Private Investment Advice, Toronto (address only)
UPDATE contacts SET address = '66 Wellington St W, 29th Floor' WHERE id = 1223;

-- 1420 Alexandra Horwood, Richardson Wealth Ltd, Toronto
UPDATE contacts SET address = '100 Queens Quay East, Suite 2500' WHERE id = 1420;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1420, x.name, x.role FROM (
  SELECT 'Kyle Johnson' AS name, 'Chief Investment Officer' AS role
  UNION ALL SELECT 'Sharbari Chakraborty', 'Client/Operations Support'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1420)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1420 AND name = x.name);

-- 1678 Mark McNulty, Raymond James, Markham
UPDATE contacts SET address = 'Suite 308, 7050 Woodbine Avenue' WHERE id = 1678;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1678, x.name, x.role FROM (
  SELECT 'Robert Mark, CFA' AS name, 'Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Michael Wilson, CPA, CFP', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1678)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1678 AND name = x.name);

-- 1626 Doug Wright, CIBC Wood Gundy, Toronto (address only)
UPDATE contacts SET address = '333 Bay St., Suite 2800' WHERE id = 1626;

-- 1545 Ian Butler, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 38th Floor' WHERE id = 1545;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1545, 'Robert Vogel', 'Portfolio Manager & Senior Wealth Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1545)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1545 AND name = 'Robert Vogel');

-- 1684 Darren Coleman, Raymond James, Toronto — see note above on the rebrand
UPDATE contacts SET address = '40 King St. W., Suite 1900' WHERE id = 1684;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1684, x.name, x.role FROM (
  SELECT 'Ryan Connolly' AS name, 'Senior Financial Planner' AS role
  UNION ALL SELECT 'Carolina Altamirano', 'Financial Planner'
  UNION ALL SELECT 'Nik Zabaljac', 'Associate Portfolio Manager & Certified Financial Planner'
  UNION ALL SELECT 'Ruby Fernandes', 'Registered Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1684)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1684 AND name = x.name);

-- 1774 Jason Polsinelli, ScotiaMcLeod, Vaughan
UPDATE contacts SET address = '200 Apple Mill Road, Suite 800' WHERE id = 1774;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1774, 'Franca DiBartolomeo', 'Administrative Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1774)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1774 AND name = 'Franca DiBartolomeo');

-- 1601 Ryan Gerstel, CIBC Wood Gundy, Toronto — shares Jamie Golombek with
-- Robert Leon (1600, batch 3), the firm's tax/estate specialist
UPDATE contacts SET address = 'Brookfield Place, Suite 600, 181 Bay Street' WHERE id = 1601;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1601, 'Jamie Golombek', 'Managing Director, Tax and Estate Planning'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1601)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1601 AND name = 'Jamie Golombek');
