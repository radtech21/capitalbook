-- Batch 10 of GTA "advisor team" enrichment (18 more contacts, same
-- methodology as migrations 009-017). Three contacts are skipped entirely
-- this round — all confirmed employer changes, not branch moves:
--
--   1498 Paul Polyviou — one of 13 advisors who left Manulife Wealth for
--     Harbourfront Wealth Management in July 2025 (Investment Executive
--     industry-moves item, corroborated by LinkedIn and Harbourfront's own
--     team page). CRM's firm field is stale.
--   1456 Jaime Carrasco — left CG Wealth Management (Canaccord Genuity) for
--     Harbourfront Wealth Management as Senior Portfolio Manager, reportedly
--     bringing his team (Investment Executive, Jan 2025). Same reasoning.
--   1398 Fred Banwell — "Banwell Private Wealth" (Fred Banwell, Franca
--     Banwell, Bonnie Wilson) moved from Richardson Wealth Ltd to
--     Wellington-Altus Private Wealth in Feb 2024 (Investment Executive,
--     advisor.ca, and a LinkedIn welcome post from Wellington-Altus's SVP
--     Ontario & Eastern Canada all corroborate this).
--
-- Two firm-wide rebrands surfaced this round, noted but not treated as
-- departures: "Manulife Securities" became "Manulife Wealth Inc." (CIRO
-- amalgamation effective Jan 1, 2024) — applies to 1504 and 1485 below and
-- likely to other "Manulife Securities" contacts from earlier batches, worth
-- a broader CRM firm-name cleanup at some point but out of scope here.
--
-- 1454 Lindsay Kosnik shares a building/suite (40 Temperance Street, Suite
-- 2100) with three earlier-batch CG Wealth Management contacts (1442
-- Wolfgang Klein, 1455 Darrell Thompson, 1464 Peter Kirby) — a fourth
-- independent team at what is evidently a large CG Wealth Management floor.
-- 1399 Gerardo Cappelli shares a building/suite (130 King Street West, The
-- Exchange Tower, Suite 3200) with batch 9's 1419 Erin Racioppa — both NBF
-- Wealth Management, independent teams.

-- 1307 Gordon Stockman, Efficient Wealth Management, Mississauga (address only)
UPDATE contacts SET address = '39 Lakeshore Road East, Suite 100A' WHERE id = 1307;

-- 1748 Chad Allison, ScotiaMcLeod, Oakville — same building as batch9's 1749
-- Natalie Jamison, independent team; both listed team members are shared
-- firm-wide resources, included with a note per Golombek/Fawcett precedent
UPDATE contacts SET address = '1235 North Service Road West, Suite 200' WHERE id = 1748;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1748, x.name, x.role FROM (
  SELECT 'Andy Nasr' AS name, 'Chief Investment Officer / Portfolio Manager (shared firm resource)' AS role
  UNION ALL SELECT 'Keri O''Driscoll', 'Insurance Consultant, Scotia Wealth Insurance Services (shared firm resource)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1748)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1748 AND name = x.name);

-- 1311 Andrew Sheppard, Flatiron Wealth Management (Q Wealth Partners), Toronto
UPDATE contacts SET address = '49 Wellington Street East, Suite 400' WHERE id = 1311;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1311, x.name, x.role FROM (
  SELECT 'Mark Davies' AS name, 'Partner' AS role
  UNION ALL SELECT 'Fabien Ouellette', 'Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1311)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1311 AND name = x.name);

-- 1399 Gerardo Cappelli, NBF Wealth Management, Toronto
UPDATE contacts SET address = '130 King Street West, The Exchange Tower, Suite 3200' WHERE id = 1399;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1399, 'Melissa DaCosta', 'Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1399)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1399 AND name = 'Melissa DaCosta');

-- 1315 Tina Tehranchian, Assante Wealth Management, Richmond Hill
UPDATE contacts SET address = '9130 Leslie Street, Suite 302' WHERE id = 1315;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1315, x.name, x.role FROM (
  SELECT 'Dilmini Bonas' AS name, 'Regional Vice-President, Wealth Planning' AS role
  UNION ALL SELECT 'Salman Khan', 'Regional Vice-President, Wealth Planning'
  UNION ALL SELECT 'Christine Petrie', 'Regional Wealth Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1315)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1315 AND name = x.name);

-- 1454 Lindsay Kosnik, CG Wealth Management, Toronto (address only; same
-- building/suite as batch6/7/8's other CG Wealth Management contacts, see
-- note above)
UPDATE contacts SET address = '40 Temperance Street, Suite 2100' WHERE id = 1454;

-- 1522 Danny Leung, iA Private Wealth (Zenith Private Wealth Counsel), Markham
UPDATE contacts SET address = '3950 14th Avenue, Suite 608' WHERE id = 1522;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1522, x.name, x.role FROM (
  SELECT 'Charles Licalzi' AS name, 'Investment Associate & Advisor' AS role
  UNION ALL SELECT 'Rodrigo Palhares', 'Portfolio Analytics Associate / Associate Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1522)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1522 AND name = x.name);

-- 1558 Melissa Rush, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '1 First Canadian Place' WHERE id = 1558;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1558, 'Gordon Minty', 'Senior Client Services Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1558)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1558 AND name = 'Gordon Minty');

-- 1274 Brian Schofield, Wellington-Altus Private Wealth, Burlington (address only)
UPDATE contacts SET address = '3455 North Service Road, Suite 300' WHERE id = 1274;

-- 1504 Robert Agouri, Manulife Securities (now Manulife Wealth Inc.), Toronto
UPDATE contacts SET address = '3080 Yonge Street, Suite 5027' WHERE id = 1504;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1504, 'Teri Ponzo', 'Marketing Assistant'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1504)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1504 AND name = 'Teri Ponzo');

-- 1485 Marc Hamel, Manulife Securities (now Manulife Wealth Inc.), Burlington
UPDATE contacts SET address = '5515 North Service Road' WHERE id = 1485;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1485, x.name, x.role FROM (
  SELECT 'BobbieJoe Babiak' AS name, 'Financial Advisor' AS role
  UNION ALL SELECT 'Ty Smith', 'Financial Advisor'
  UNION ALL SELECT 'Matthew Hamel', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1485)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1485 AND name = x.name);

-- 1537 Gary Lewin, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '1 First Canadian Place, 40th Floor' WHERE id = 1537;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1537, x.name, x.role FROM (
  SELECT 'Eysha Syeda' AS name, 'Client Service Associate' AS role
  UNION ALL SELECT 'Rhonda Blanch', 'Senior Estate and Insurance Advisor'
  UNION ALL SELECT 'Cherie Ahlberg', 'Senior Private Banker'
  UNION ALL SELECT 'David Tremblett', 'Trust & Estate Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1537)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1537 AND name = x.name);

-- 1571 Jamie Keenan, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 42nd Floor' WHERE id = 1571;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1571, x.name, x.role FROM (
  SELECT 'Lianne Di Rocco' AS name, 'Senior Wealth Advisor & Portfolio Manager (co-lead)' AS role
  UNION ALL SELECT 'Bailey Solomon', 'Associate Portfolio Manager & Financial Planner'
  UNION ALL SELECT 'Teresa Bellissimo', 'Client Service Associate'
  UNION ALL SELECT 'Joti Shah', 'Registered Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1571)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1571 AND name = x.name);

-- 1701 Tim Niblett, Raymond James (Retirement Sherpa), Burlington
UPDATE contacts SET address = '980 Fraser Drive, Unit 115' WHERE id = 1701;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1701, x.name, x.role FROM (
  SELECT 'Deborah Boyce-Taylor' AS name, 'Branch Administrator' AS role
  UNION ALL SELECT 'Jay Bondy', 'Financial Advisor Associate'
  UNION ALL SELECT 'Jennifer Rice', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1701)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1701 AND name = x.name);

-- 1544 Christopher With, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '2 St. Clair Avenue West, 19th Floor' WHERE id = 1544;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1544, 'Ethan Ward', 'Client Services Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1544)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1544 AND name = 'Ethan Ward');

-- 1498 Paul Polyviou — DELIBERATELY NOTHING APPLIED. See note at top of file:
-- confirmed departure from Manulife Wealth to Harbourfront Wealth
-- Management (July 2025, part of a 13-advisor group move).

-- 1456 Jaime Carrasco — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: confirmed departure from CG Wealth Management to Harbourfront
-- Wealth Management (Jan 2025).

-- 1398 Fred Banwell — DELIBERATELY NOTHING APPLIED. See note at top of file:
-- confirmed departure from Richardson Wealth Ltd to Wellington-Altus
-- Private Wealth (Feb 2024).
