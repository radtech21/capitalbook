-- Batch 2 of "rest of Canada" advisor team/address enrichment (18 more
-- contacts, same methodology as migration 027). No contacts skipped this
-- round.
--
-- 1543 Jed Brezer, 1548 Marion Reems, and 1552 Lili Hao are three separate
-- CRM contacts on the same BMO Nesbitt Burns Vancouver team ("Brezer,
-- Mandell, Reems & Hao Group") — each one's INSERT lists the other two
-- plus shared staff, never themselves. 1549 Steve Sun is a different BMO
-- Vancouver advisor confirmed NOT on that team — he runs an independent
-- practice ("Team Solomon & Steve") at a different address.
--
-- 1433 Rahim Chatur and 1434 Jeffrey Mackie are two separate CRM contacts
-- on the same Richardson Wealth Calgary team ("Chatur Mackie Wealth
-- Partners," formerly "Mackie Wealth Group") — each lists the other.
-- 1396 Tricia Leadbeater shares the same Calgary office building but runs
-- an entirely separate, independently-branded practice ("Leadbeater
-- Wealth Management") — confirmed not on the Chatur/Mackie team.
--
-- 1581 Wade Kozak (CIBC Wood Gundy, Calgary) — a weak signal suggests he
-- has stepped back into semi-retirement, with Harrison Kozak (his son,
-- per shared surname) named co-head of the group in 2026; no confirmed
-- departure, so data applied per the established weak-signal precedent,
-- flagged for manual review.
--
-- 1396 Tricia Leadbeater also carries a compliance note worth surfacing
-- directly in the CRM rather than just this migration's comments: a 2015
-- IIROC settlement in which she admitted to using discretionary trading
-- authority without proper disclosure/consent at a predecessor firm. This
-- is persisted to her data_flags column, not just noted here.
--
-- 1815 Christina Anthony, 1810 Dan Sambolec, and 1802 Shelly Appleton-
-- Benko are three independent Odlum Brown teams sharing one building (250
-- Howe St, Suite 1100, Vancouver) — consistent with the recurring shared-
-- building/independent-teams pattern seen throughout this project.

-- 1783 Andrew Cook, ScotiaMcLeod (The Cook Team), Vancouver
UPDATE contacts SET address = '650 West Georgia Street, Suite 1100' WHERE id = 1783;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1783, x.name, x.role FROM (
  SELECT 'Darla Johnston' AS name, 'Investment Associate' AS role
  UNION ALL SELECT 'Jacqueline Knowles', 'Wealth Planner'
  UNION ALL SELECT 'Martha Angulo', 'Senior Associate'
  UNION ALL SELECT 'Darren Wallace', 'Senior Associate'
  UNION ALL SELECT 'Bach Pham', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1783)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1783 AND name = x.name);

-- 1303 Chris Stephenson, Steadyhand Investment Funds (now part of Purpose
-- Unlimited, acquired June 2025), Vancouver
UPDATE contacts SET address = '1747 West 3rd Avenue' WHERE id = 1303;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1303, x.name, x.role FROM (
  SELECT 'Lori Norman' AS name, 'Investor Specialist' AS role
  UNION ALL SELECT 'Evan Parubets', 'Investor Specialist'
  UNION ALL SELECT 'Jeff Stashuk', 'Investor Specialist'
  UNION ALL SELECT 'Reena Olk', 'Associate Investor Specialist'
  UNION ALL SELECT 'Salman Ahmed', 'Chief Investment Officer'
  UNION ALL SELECT 'Tom Bradley', 'President & Co-Founder'
  UNION ALL SELECT 'Neil Jensen', 'CEO & Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1303)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1303 AND name = x.name);

-- 1312 Brian Lipskie, The RaeLipskie Partnership, Waterloo
UPDATE contacts SET address = '20 Erb Street West, Suite 201' WHERE id = 1312;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1312, x.name, x.role FROM (
  SELECT 'Rick (Richard) Vandermey' AS name, 'Chief Investment Officer' AS role
  UNION ALL SELECT 'Alex Stoody', 'Vice President & Portfolio Manager'
  UNION ALL SELECT 'Robin Stanton', 'Vice President & Portfolio Manager'
  UNION ALL SELECT 'Andréa Miljkovic', 'Vice President & Portfolio Manager'
  UNION ALL SELECT 'Dave Brune', 'Vice President & Portfolio Manager'
  UNION ALL SELECT 'Jason Taylor', 'Associate Portfolio Manager'
  UNION ALL SELECT 'John Zondo', 'Portfolio Manager'
  UNION ALL SELECT 'Sheila Yendt', 'Deputy Chief Operating Officer'
  UNION ALL SELECT 'Heather J. Dewar', 'Client Relationship Manager & Advising Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1312)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1312 AND name = x.name);

-- 1373 Philippe McGale, NBF Wealth Management, Granby
UPDATE contacts SET address = '975 rue Principale, Suite 201' WHERE id = 1373;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1373, x.name, x.role FROM (
  SELECT 'William McGale' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Nathalie Trudeau', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Chantal Lareau', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Marie-Claude Durand', 'Wealth Advisor'
  UNION ALL SELECT 'Xavier Dufour', 'Wealth Advisor'
  UNION ALL SELECT 'Vincent Poirier', 'Wealth Advisor'
  UNION ALL SELECT 'Sylvie Poirier', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Jonathan McGale', 'Wealth Management & Portfolio Management Counsel'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1373)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1373 AND name = x.name);

-- 1396 Tricia Leadbeater, Richardson Wealth Ltd (Leadbeater Wealth
-- Management), Calgary — see compliance note above
UPDATE contacts SET address = 'Eighth Avenue Place, 525 8th Avenue SW, Suite 4700' WHERE id = 1396;
UPDATE contacts
SET data_flags = LEFT(TRIM(CONCAT(COALESCE(data_flags, ''),
  CASE WHEN COALESCE(data_flags, '') = '' THEN '' ELSE ' | ' END,
  'Compliance note: 2015 IIROC settlement — admitted to using discretionary trading authority without proper disclosure/consent for 7 managed accounts at predecessor firm Mackie Research Capital.')), 512)
WHERE id = 1396
  AND data_flags NOT LIKE '%Compliance note%';

-- 1433 Rahim Chatur + 1434 Jeffrey Mackie, Richardson Wealth Ltd (Chatur
-- Mackie Wealth Partners), Calgary — same team, both CRM contacts
UPDATE contacts SET address = 'Eighth Avenue Place, 525 8th Avenue SW, Suite 4700' WHERE id IN (1433, 1434);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1433, 'Jeffrey Mackie', 'Senior Investment Advisor, Senior Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1433)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1433 AND name = 'Jeffrey Mackie');
INSERT INTO contact_people (contact_id, name, role)
SELECT 1434, 'Rahim Chatur', 'Senior Investment Advisor, Senior Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1434)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1434 AND name = 'Rahim Chatur');

-- 1483 Matt McGill, Manulife Wealth Inc (already renamed via migration 022), Guelph
UPDATE contacts SET address = '275 Hanlon Creek Boulevard, Suite 1' WHERE id = 1483;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1483, x.name, x.role FROM (
  SELECT 'Ryan Schneider' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Jeff Bennett', 'Investment Advisor'
  UNION ALL SELECT 'Maria McGill', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1483)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1483 AND name = x.name);

-- 1543 Jed Brezer + 1548 Marion Reems + 1552 Lili Hao, BMO Nesbitt Burns
-- (Brezer, Mandell, Reems & Hao Group), Vancouver — same team, all 3 CRM contacts
UPDATE contacts SET address = '595 Burrard Street, 9th Floor' WHERE id IN (1543, 1548, 1552);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1543, x.name, x.role FROM (
  SELECT 'Marion Reems' AS name, 'Senior Wealth Advisor, Portfolio Manager & Partner' AS role
  UNION ALL SELECT 'Lili Hao', 'Senior Investment Advisor'
  UNION ALL SELECT 'David Mandell', 'Senior Investment Advisor / Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1543)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1543 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1548, x.name, x.role FROM (
  SELECT 'Jed Brezer' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Lili Hao', 'Senior Investment Advisor'
  UNION ALL SELECT 'David Mandell', 'Senior Investment Advisor / Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1548)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1548 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1552, x.name, x.role FROM (
  SELECT 'Jed Brezer' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Marion Reems', 'Senior Wealth Advisor, Portfolio Manager & Partner'
  UNION ALL SELECT 'David Mandell', 'Senior Investment Advisor / Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1552)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1552 AND name = x.name);

-- 1549 Steve Sun, BMO Nesbitt Burns (Team Solomon & Steve — separate,
-- independent practice), Vancouver
UPDATE contacts SET address = '885 West Georgia Street, 18th Floor' WHERE id = 1549;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1549, 'Solomon (Yun) Chin', 'Senior Portfolio Manager / Senior Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1549)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1549 AND name = 'Solomon (Yun) Chin');

-- 1581 Wade Kozak, CIBC Wood Gundy, Calgary — weak signal of
-- semi-retirement, apply anyway per established precedent
UPDATE contacts SET address = '500 Centre Street SE, 27th Floor' WHERE id = 1581;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1581, x.name, x.role FROM (
  SELECT 'Brenda Akins' AS name, 'Associate Portfolio Manager and Wealth Advisor' AS role
  UNION ALL SELECT 'Harrison Kozak', 'Associate Investment Advisor / Portfolio Manager (co-head as of 2026)'
  UNION ALL SELECT 'Ted Kozak', 'Wealth Advisor / Associate Investment Advisor'
  UNION ALL SELECT 'Chris Porochnuk', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1581)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1581 AND name = x.name);

-- 1815 Christina Anthony, Odlum Brown, Vancouver (address only)
UPDATE contacts SET address = 'Suite 1100, 250 Howe Street' WHERE id = 1815;

-- 1257 Andrew McQuiston, Wellington-Altus Private Wealth (West Oak Family
-- Office), Calgary
UPDATE contacts SET address = 'TD Canada Trust Tower, Suite 3400, 421 - 7 Avenue SW' WHERE id = 1257;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1257, x.name, x.role FROM (
  SELECT 'Kelly Demo' AS name, 'Senior Portfolio Manager, Co-Founder, West Oak Family Office' AS role
  UNION ALL SELECT 'Justin Charbonneau', 'Senior Portfolio Manager & Senior Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1257)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1257 AND name = x.name);

-- 1590 Neil Pope, CIBC Wood Gundy (The Pope Team), Richmond BC
UPDATE contacts SET address = '5811 Cooney Road, Suite 606' WHERE id = 1590;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1590, x.name, x.role FROM (
  SELECT 'Rick Aulik' AS name, 'Sr. Investment Advisor and Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Susan Christie', 'Associate Investment Advisor and Portfolio Manager'
  UNION ALL SELECT 'Melanie Burns', 'Client Associate'
  UNION ALL SELECT 'Cheryl Sy', 'Client Associate'
  UNION ALL SELECT 'Phoebe Tagaca', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1590)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1590 AND name = x.name);

-- 1539 Elizabeth Petticrew, BMO Nesbitt Burns, Vancouver
UPDATE contacts SET address = '885 West Georgia Street, Suite 2300' WHERE id = 1539;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1539, x.name, x.role FROM (
  SELECT 'Nikki Sayson' AS name, 'Senior Associate' AS role
  UNION ALL SELECT 'Malcolm McKinney', 'Client Service Associate'
  UNION ALL SELECT 'Holly Castle', 'Wealth and Tax Planning'
  UNION ALL SELECT 'Eniko Kozma', 'Administration Associate'
  UNION ALL SELECT 'Nicco Bautista', 'Director, Wills & Estate Planning'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1539)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1539 AND name = x.name);

-- 1802 Shelly Appleton-Benko, Odlum Brown (STM Wealth Management),
-- Vancouver — same building as 1810/1815, independent team
UPDATE contacts SET address = '250 Howe St, Suite 1100' WHERE id = 1802;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1802, x.name, x.role FROM (
  SELECT 'Tannis Calder (Pratt)' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Mary MacDonald', 'Investment Advisor'
  UNION ALL SELECT 'Julianna Zumpano', 'Business Optimization'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1802)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1802 AND name = x.name);
