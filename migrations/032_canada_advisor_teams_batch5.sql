-- Batch 5 of "rest of Canada" advisor team/address enrichment. One
-- contact is skipped this round:
--
--   1599 Fraser Sutherland (CIBC Wood Gundy, Ottawa) — confirmed deceased
--     (died unexpectedly Jan 17, 2025). His CRM record was already stale
--     before that: he'd moved his ~$1B practice to Canaccord Genuity in
--     Nov 2024. The surviving team ("Sutherland Investment Group," now
--     under Canaccord Genuity) continues without one single clear
--     successor figure (unlike McGlade->McGoey or Baun->Pate), so this is
--     flagged the same mechanical way as those two (migrations 022, 029)
--     — unreachable + data_flags note — pending a human decision on
--     whether/how to add a successor contact.
--
-- Two confirmed employer departures resolved in full:
--
--   1525 David Boyd (BMO Nesbitt Burns, Windsor) -> National Bank
--     Financial, April 2026, after 26 years at BMO — brought his whole
--     ~$900M team ("The Boyd Group").
--   1459 Mark Hewett + 1475 Erik Dekker (CG Wealth Management, Vancouver)
--     -> BMO Nesbitt Burns, together, as "Dekker Hewett Labelle Wealth
--     Advisory" — both are separate CRM contacts on the same new team.
--
-- 1417 Rory O'Connor is both a named colleague on 1414 Neil Kumar's and
-- 1426 Tyler Steele's "JSK Partners" team (confirmed in migration 030)
-- AND a separate CRM contact in his own right — applied directly here
-- using the already-confirmed JSK Partners data, no new research needed.
--
-- 1316 Rob McClelland's CRM city (Thornhill) is corrected to Markham,
-- where Assante's office actually relocated to.
--
-- Several more shared-building notes: 1275 Wes Ashton and 1276 Miro
-- Svoboda are two independent Harbourfront Wealth Management teams in
-- different suites of the same Vancouver building (Marine Building, 355
-- Burrard St). 1609 Ted Velikonja and 1610 Peter Lochead are independent
-- CIBC Wood Gundy teams sharing 255 Queens Ave, Suite 2200, London ON.
-- 1640 Justin Hui is a third independent CIBC Wood Gundy Vancouver team
-- at 1055 Dunsmuir St, Suite 2434 (alongside 1623/1639 Gilbert/Watchorn).
-- 1587 Sean Messing is a sixth independent CIBC Wood Gundy Calgary team
-- at 500 Centre Street SE, 27th Floor. 1441 Thane Stenner and 1451 Jenny
-- Zhou are two more independent CG Wealth Management teams at 1133
-- Melville Street, Suite 1200, Vancouver (alongside 1472 LePoidevin, 1474
-- Mann). 1718 Bob Thompson shares Suite 2100, 925 West Georgia Street,
-- Vancouver with 1676 Clark Linton — different independent Raymond James
-- teams in the same branch building.

-- 1441 Thane Stenner, CG Wealth Management (Stenner Wealth Partners+), Vancouver
UPDATE contacts SET address = '1133 Melville Street, Suite 1200' WHERE id = 1441;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1441, x.name, x.role FROM (
  SELECT 'Simon Jochlin' AS name, 'Senior Wealth Advisor and Portfolio Manager' AS role
  UNION ALL SELECT 'Jerome Li', 'Senior Portfolio Manager and Senior Wealth Advisor'
  UNION ALL SELECT 'Justynne Stenner', 'Senior Associate, Client Services & Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1441)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1441 AND name = x.name);

-- 1459 Mark Hewett + 1475 Erik Dekker: CG Wealth Management -> BMO
-- Nesbitt Burns (Dekker Hewett Labelle Wealth Advisory), same team, both
-- CRM contacts
UPDATE contacts SET firm = 'BMO Nesbitt Burns', address = '595 Burrard Street, 9th Floor' WHERE id IN (1459, 1475);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1459, x.name, x.role FROM (
  SELECT 'Erik Dekker' AS name, 'Senior Investment Advisor / Senior Portfolio Manager, co-founder' AS role
  UNION ALL SELECT 'Shawn Labelle', 'Senior Investment Advisor & Portfolio Manager, co-lead'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1459)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1459 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1475, x.name, x.role FROM (
  SELECT 'Mark Hewett' AS name, 'Senior Portfolio Manager, co-founder' AS role
  UNION ALL SELECT 'Shawn Labelle', 'Senior Investment Advisor & Portfolio Manager, co-lead'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1475)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1475 AND name = x.name);

-- 1587 Sean Messing, CIBC Wood Gundy (Messing Ross Advisory Group), Calgary
UPDATE contacts SET address = '500 Centre Street SE, 27th Floor' WHERE id = 1587;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1587, 'Colin Ross', 'Senior Investment Advisor, Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1587)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1587 AND name = 'Colin Ross');

-- 1417 Rory O'Connor, Richardson Wealth Ltd (JSK Partners), Vancouver —
-- already-confirmed colleague of 1414/1426, applied directly
UPDATE contacts SET address = 'Guinness Tower, 1055 West Hastings Street, Suite 2200' WHERE id = 1417;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1417, x.name, x.role FROM (
  SELECT 'Neil Kumar' AS name, 'Portfolio Manager, Investment Advisor, Founding Partner' AS role
  UNION ALL SELECT 'Tyler Steele', 'Senior Investment Advisor, Senior Portfolio Manager'
  UNION ALL SELECT 'Tim Engelbert', 'Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Heather Meehan', 'Member of JSK Partners'
  UNION ALL SELECT 'Maryam Fejvai', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1417)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1417 AND name = x.name);

-- 1609 Ted Velikonja, CIBC Wood Gundy, London ON
UPDATE contacts SET address = '255 Queens Avenue, Suite 2200' WHERE id = 1609;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1609, x.name, x.role FROM (
  SELECT 'Connor Velikonja' AS name, 'Associate Portfolio Manager, Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Bill Brown', 'Certified Financial Planner'
  UNION ALL SELECT 'Debbie Bear', 'Senior Administrative Assistant'
  UNION ALL SELECT 'Adam Ferrett', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1609)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1609 AND name = x.name);

-- 1791 Jonathan Rigby, ScotiaMcLeod (Grand Advisory Group), Waterloo
UPDATE contacts SET address = '115 King Street South, Suite 210' WHERE id = 1791;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1791, x.name, x.role FROM (
  SELECT 'Ankur Gupta' AS name, 'Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Tanner Michalek', 'Senior Wealth Advisor, Portfolio Manager'
  UNION ALL SELECT 'Sourida Muonghane', 'Administrative Support Assistant'
  UNION ALL SELECT 'Becky Morwood', 'Administrative Support Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1791)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1791 AND name = x.name);

-- 1275 Wes Ashton, Harbourfront Wealth Management (Oakwater Wealth Counsel), Vancouver
UPDATE contacts SET address = 'Marine Building, 355 Burrard Street, Suite 510' WHERE id = 1275;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1275, x.name, x.role FROM (
  SELECT 'Ladan Shokrgozar' AS name, 'Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Andy Trinh', 'Associate Portfolio Manager'
  UNION ALL SELECT 'Domenico Poletto', 'Investment Advisor'
  UNION ALL SELECT 'Justin Toevs', 'Investment Advisor'
  UNION ALL SELECT 'Elaine Bonilla', 'Investor Relations Associate'
  UNION ALL SELECT 'Kanika Malhan', 'Administration Manager & Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1275)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1275 AND name = x.name);

-- 1276 Miro Svoboda, Harbourfront Wealth Management (Sonora Wealth Group), Vancouver
UPDATE contacts SET address = 'Marine Building, Suite 910, 355 Burrard Street' WHERE id = 1276;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1276, x.name, x.role FROM (
  SELECT 'David Eng' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Warren Goldblum', 'Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1276)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1276 AND name = x.name);

-- 1525 David Boyd: BMO Nesbitt Burns -> NBF Wealth Management (The Boyd
-- Group), Windsor, April 2026
UPDATE contacts SET firm = 'NBF Wealth Management', address = '1 Riverside Dr W, Suite 600' WHERE id = 1525;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1525, x.name, x.role FROM (
  SELECT 'Tyler Kirby' AS name, 'Investment Associate' AS role
  UNION ALL SELECT 'Amy Boose', 'Team Operations & Administration'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1525)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1525 AND name = x.name);

-- 1610 Peter Lochead, CIBC Wood Gundy (One London Group), London ON
UPDATE contacts SET address = '255 Queens Ave, Suite 2200' WHERE id = 1610;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1610, x.name, x.role FROM (
  SELECT 'Barry Gray' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Peter McIntosh', 'Investment Advisor'
  UNION ALL SELECT 'Josh Melchers', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1610)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1610 AND name = x.name);

-- 1640 Justin Hui, CIBC Wood Gundy (Hui Portfolio Management), Vancouver (address only)
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1640;

-- 1718 Bob Thompson, Raymond James, Vancouver
UPDATE contacts SET address = 'Suite 2100, 925 West Georgia Street' WHERE id = 1718;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1718, x.name, x.role FROM (
  SELECT 'Martin Danielak' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Tawnya Skujins', 'Financial Advisor Associate'
  UNION ALL SELECT 'Emily Miles', 'Client Service Specialist / Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1718)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1718 AND name = x.name);

-- 1316 Rob McClelland, Assante Wealth Management — city corrected from
-- Thornhill to Markham
UPDATE contacts SET city = 'Markham', address = '675 Cochrane Drive, East Tower, Suite 701' WHERE id = 1316;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1316, x.name, x.role FROM (
  SELECT 'Michael (Mike) Connon' AS name, 'Senior Financial Planning Advisor, Co-Branch Manager' AS role
  UNION ALL SELECT 'Carlo Cansino', 'Senior Financial Advisor'
  UNION ALL SELECT 'John Iaconetti', 'Financial Advisor'
  UNION ALL SELECT 'Michael Ams', 'Senior Data Analyst, Strategy and Analytics'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1316)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1316 AND name = x.name);

-- 1231 Michael Thor, TD Wealth (Thor Wealth Management Group), Midland
UPDATE contacts SET address = '295 King St, 2nd Floor' WHERE id = 1231;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1231, x.name, x.role FROM (
  SELECT 'Sarah Thor' AS name, 'Associate Portfolio Manager / Investment Advisor' AS role
  UNION ALL SELECT 'Doug Thorhauge', 'Associate Investment Advisor'
  UNION ALL SELECT 'Stephen Bell', 'Associate Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Danielle Desjardin', 'Sales Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1231)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1231 AND name = x.name);

-- 1743 Graham Fallis, ScotiaMcLeod, Ottawa
UPDATE contacts SET address = '350 Albert Street, Suite 2100' WHERE id = 1743;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1743, x.name, x.role FROM (
  SELECT 'Andrea Labelle' AS name, 'Administrative Associate' AS role
  UNION ALL SELECT 'Alex Roy', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1743)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1743 AND name = x.name);

-- 1451 Jenny Zhou, CG Wealth Management, Vancouver
UPDATE contacts SET address = '1133 Melville St, Suite 1200' WHERE id = 1451;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1451, x.name, x.role FROM (
  SELECT 'Jeff Hou (Yanlin Hou)' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Cindy David', 'Strategic Partner, Senior Vice President, Wealth and Estate Planning & Insurance'
  UNION ALL SELECT 'Alexander (Oleksandr) Izmailov', 'Strategic Partner, Senior Financial Planner'
  UNION ALL SELECT 'Eileen Dong', 'Investment Associate'
  UNION ALL SELECT 'Stella Yao', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1451)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1451 AND name = x.name);

-- 1599 Fraser Sutherland — DELIBERATELY NO ADDRESS/TEAM APPLIED. See note
-- at top of file: confirmed deceased January 2025, needs a human decision.
UPDATE contacts
SET reachable = 0,
    data_flags = TRIM(CONCAT(COALESCE(data_flags, ''),
      CASE WHEN COALESCE(data_flags, '') = '' THEN '' ELSE ' | ' END,
      'DECEASED (Jan 17, 2025). Practice had already moved from CIBC Wood Gundy to Canaccord Genuity (Nov 2024) before his death. Surviving team "Sutherland Investment Group" continues under Canaccord Genuity, 50 O''Connor Street Suite 1120, Ottawa, with no single clear successor (Tom Porteous, Julia McClintock, Alex Kealey) — needs human decision on whether/how to add a successor contact.'))
WHERE id = 1599
  AND data_flags NOT LIKE '%DECEASED%';
