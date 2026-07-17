-- Rest-of-Canada Financial Advisor enrichment, batch 6 of ~24 (18 contacts).
-- Address + team-roster research, same methodology as the GTA project and
-- prior rest-of-Canada batches (027-032). All web-search-derived; direct
-- fetches to advisor sites returned 403 throughout, as expected.
--
-- 1238 Neil Chappell + 1239 Graham Isenegger (IC Blue Heron Wealth Advisory
-- Group, Richardson Wealth, Victoria) are confirmed co-founders/colleagues
-- on the same practice — each cross-references the other, consistent with
-- the recurring shared-team-pair pattern.
--
-- 1652 Randy Yozipovic + 1656 Ian Munro (R&R Investment Partners, CIBC Wood
-- Gundy, Calgary) are confirmed partners on the same practice — team applied
-- to both, but no street address could be confirmed for either (403-blocked,
-- no verified suite number in any snippet), so address is deliberately left
-- unset for this pair.
--
-- 1405 Jeff Rivett (Creed Capital Management Group) and 1415 Simon Doran
-- (Holyk Doran Wealth Management Group) share the same NBF Vancouver
-- building (475 Howe Street, Suite 3000) but are independent teams.
-- Similarly 1412 Michel Bertrand and 1418 Martin Lacroix share the same NBF
-- Ottawa building (50 O'Connor Street, Suite 1602) as independent teams.
--
-- 1313 Peter Pomponio (Assante Dorval): address and team applied per the
-- weak/unconfirmed-signal precedent, but flagged — LinkedIn/RocketReach
-- suggest a possible move to "Nextt Family Office" as Managing Partner,
-- while other (older) sources still describe him as President/Owner of
-- Assante Dorval. Needs manual verification before being treated as current.
--
-- 1686 Jason Nicola and 1218 Jillian Bryan: address confirmed, no team
-- roster could be confirmed (bio/team pages 403-blocked, no named
-- colleagues surfaced in search snippets).
--
-- New contacts 2455-2457: the three surviving Sutherland Investment Group
-- advisors (Tom Porteous, Julia McClintock, Alex Kealey), added per user's
-- explicit choice after 1599 Fraser Sutherland's confirmed death (see
-- migration 032). Firm continues under Canaccord Genuity Wealth Management.

-- 1313 Peter Pomponio, Assante Wealth Management (Assante Dorval), Dorval, QC
UPDATE contacts SET
  address = '2020 Trans-Canada Highway, Suite 200',
  data_flags = TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: LinkedIn/RocketReach suggest possible move to Nextt Family Office (Managing Partner) — other sources still show him as President/Owner Assante Dorval; needs manual verification.'))
WHERE id = 1313;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1313, x.name, x.role FROM (
  SELECT 'Nick Marando' AS name, 'Chief Financial Officer, Assante Dorval' AS role
  UNION ALL SELECT 'Martin Frenette', 'Senior Securities Representative'
  UNION ALL SELECT 'Anthony (Tony) Diab', 'Senior Investment Advisor'
  UNION ALL SELECT 'Sergio Scanga', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1313)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1313 AND name = x.name);

-- 1238 Neil Chappell, IC Blue Heron Wealth Advisory Group (Richardson Wealth), Victoria, BC
UPDATE contacts SET address = '2950 Jutland Road, Suite 400' WHERE id = 1238;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1238, x.name, x.role FROM (
  SELECT 'Graham Isenegger' AS name, 'Senior Portfolio Manager & Senior Investment Advisor (Co-Founder)' AS role
  UNION ALL SELECT 'Courtney Lance', 'Investment Associate & Advisor'
  UNION ALL SELECT 'James Spencer', 'Investment Associate & Advisor'
  UNION ALL SELECT 'Hanna Kent', 'Investment Associate & Advisor'
  UNION ALL SELECT 'Kenidy Welyk', 'IR Licensed Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1238)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1238 AND name = x.name);

-- 1239 Graham Isenegger, IC Blue Heron Wealth Advisory Group (Richardson Wealth), Victoria, BC
UPDATE contacts SET address = '2950 Jutland Road, Suite 400' WHERE id = 1239;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1239, x.name, x.role FROM (
  SELECT 'Neil Chappell' AS name, 'Co-Founder / Lead Advisor' AS role
  UNION ALL SELECT 'Courtney Lance', 'Investment Associate & Advisor'
  UNION ALL SELECT 'James Spencer', 'Investment Associate & Advisor'
  UNION ALL SELECT 'Hanna Kent', 'Investment Associate & Advisor'
  UNION ALL SELECT 'Kenidy Welyk', 'IR Licensed Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1239)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1239 AND name = x.name);

-- 1686 Jason Nicola, Nicola Wealth, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1686;

-- 1415 Simon Doran, NBF Wealth Management (Holyk Doran Wealth Management Group), Vancouver, BC
UPDATE contacts SET address = '475 Howe Street, Suite 3000' WHERE id = 1415;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1415, 'Bryan Holyk', 'Senior Wealth Advisor & Portfolio Manager (Co-Founder)'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1415)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1415 AND name = 'Bryan Holyk');

-- 1412 Michel Bertrand, NBF Wealth Management (Bertrand Dubreuil Wealth Management Team), Ottawa, ON
UPDATE contacts SET address = '50 O''Connor Street, Suite 1602' WHERE id = 1412;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1412, 'Simon-Pierre Dubreuil', 'Wealth Advisor & Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1412)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1412 AND name = 'Simon-Pierre Dubreuil');

-- 1328 John Davis, Aligned Capital Partners (Blackburn Davis Financial / Blackburn Davis Wealth), Edmonton, AB
UPDATE contacts SET address = '7345 Roper Road NW' WHERE id = 1328;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1328, x.name, x.role FROM (
  SELECT 'Stephen MacDonald' AS name, 'Partner (CFP®, CIM®)' AS role
  UNION ALL SELECT 'Timothy Goodkey', 'Certified Financial Planner / Portfolio Manager'
  UNION ALL SELECT 'Robert Bradburn', 'AVP Wealth Advisory Services (CFP®, CIM®, CLU®)'
  UNION ALL SELECT 'Ally Davis', 'Associate Advisor'
  UNION ALL SELECT 'Sammi Manuel', 'Lead Insurance Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1328)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1328 AND name = x.name);

-- 1648 Don Promhouse, CIBC Wood Gundy (The Promhouse Financial Group), Regina, SK
UPDATE contacts SET address = '1801 Hamilton Street, Suite 420' WHERE id = 1648;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1648, x.name, x.role FROM (
  SELECT 'Jon Promhouse, BA, CIM®' AS name, 'Senior Portfolio Manager & Wealth Advisor' AS role
  UNION ALL SELECT 'Michael Urbanski', 'Client Associate'
  UNION ALL SELECT 'Joey Johannsen', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1648)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1648 AND name = x.name);

-- 1652 Randy Yozipovic, CIBC Wood Gundy (R&R Investment Partners), Calgary, AB (team only — address NOT_FOUND)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1652, x.name, x.role FROM (
  SELECT 'Ian Munro' AS name, 'Senior Wealth Advisor & Portfolio Manager (CIM®)' AS role
  UNION ALL SELECT 'Harrison J. Love', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Tanya Kittananthawongs', 'Financial Associate (CFA)'
  UNION ALL SELECT 'Pedro A. Montoya', 'Financial Associate'
  UNION ALL SELECT 'Colton Yozipovic', 'Client Associate'
  UNION ALL SELECT 'Vanessa Espiritu', 'Client Associate'
  UNION ALL SELECT 'Kate Couture', 'Client Associate'
  UNION ALL SELECT 'Eliora Johnson', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1652)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1652 AND name = x.name);

-- 1656 Ian Munro, CIBC Wood Gundy (R&R Investment Partners), Calgary, AB (team only — address NOT_FOUND)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1656, x.name, x.role FROM (
  SELECT 'Randy B. Yozipovic' AS name, 'Senior Wealth Advisor & Portfolio Manager (CIM®)' AS role
  UNION ALL SELECT 'Harrison J. Love', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Tanya Kittananthawongs', 'Financial Associate (CFA)'
  UNION ALL SELECT 'Pedro A. Montoya', 'Financial Associate'
  UNION ALL SELECT 'Colton Yozipovic', 'Client Associate'
  UNION ALL SELECT 'Vanessa Espiritu', 'Client Associate'
  UNION ALL SELECT 'Kate Couture', 'Client Associate'
  UNION ALL SELECT 'Eliora Johnson', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1656)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1656 AND name = x.name);

-- 1251 Maili Wong, Wellington-Altus Private Wealth (The Wong Group), Vancouver, BC
UPDATE contacts SET address = 'Suite #1480, 1075 West Georgia St' WHERE id = 1251;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1251, x.name, x.role FROM (
  SELECT 'Terrence Wong' AS name, 'Strategic Advisory Consultant' AS role
  UNION ALL SELECT 'Cindy Liang', 'Portfolio Manager'
  UNION ALL SELECT 'Morgan Boone', 'Wealth Management Associate'
  UNION ALL SELECT 'Elaine Lee', 'Portfolio Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1251)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1251 AND name = x.name);

-- 1370 Stephane Masse, NBF Wealth Management (Patrimoine Familial Massé Morneau Daoust), Brossard, QC
UPDATE contacts SET address = '1040, rue du Lux, Bureau 710' WHERE id = 1370;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1370, x.name, x.role FROM (
  SELECT 'Pierre-Luc Morneau' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Maxime Daoust', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'François Quesnel', 'Wealth Advisor'
  UNION ALL SELECT 'Michel Théroux', 'Wealth Advisor and Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1370)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1370 AND name = x.name);

-- 1321 Jamie Geisler, Assante Wealth Management (Spire Advisors), Powassan, ON
UPDATE contacts SET address = '535 Main St' WHERE id = 1321;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1321, x.name, x.role FROM (
  SELECT 'Ian Jenner' AS name, 'Senior Financial Advisor (Co-Founder)' AS role
  UNION ALL SELECT 'Tony Sutey', 'Senior Financial Advisor, CFP, FMA, CIM'
  UNION ALL SELECT 'Zachary St. Clair', 'Financial Advisor'
  UNION ALL SELECT 'Trina Odd', 'Financial Planning Advisor, B.B.A.'
  UNION ALL SELECT 'Lisa Ferry', 'Financial Advisor'
  UNION ALL SELECT 'Amy Cronkwright', 'Financial Advisor'
  UNION ALL SELECT 'Wade Perkins', 'Senior Financial Advisor, CFP'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1321)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1321 AND name = x.name);

-- 1218 Jillian Bryan, TD Wealth Private Investment Advice, Vancouver, BC (address only — no team confirmed)
UPDATE contacts SET address = '700 West Georgia Street, Suite 1000-1101' WHERE id = 1218;

-- 1405 Jeff Rivett, NBF Wealth Management (Creed Capital Management Group), Vancouver, BC
UPDATE contacts SET address = '475 Howe Street, Suite 3000' WHERE id = 1405;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1405, x.name, x.role FROM (
  SELECT 'Brett Creed' AS name, 'Senior Wealth Advisor & Portfolio Manager (Founding Partner)' AS role
  UNION ALL SELECT 'Manie Ho', 'Senior Wealth Associate, CFP®'
  UNION ALL SELECT 'Zach Der', 'Senior Wealth Associate'
  UNION ALL SELECT 'Suzi Pena', 'Associate'
  UNION ALL SELECT 'Rosa Maghsoudloo', 'Associate'
  UNION ALL SELECT 'Rukhsar Salimi', 'Associate'
  UNION ALL SELECT 'Angel Payumo', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1405)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1405 AND name = x.name);

-- 1547 Robert Luft, iA Private Wealth (Luft Financial), Vancouver, BC
UPDATE contacts SET address = '690-1385 West 8th Avenue' WHERE id = 1547;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1547, x.name, x.role FROM (
  SELECT 'Jon Glougie' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Elvis Picardo, CFA, CIM', 'Senior Portfolio Manager'
  UNION ALL SELECT 'Karman Gill', 'Associate Investment Advisor'
  UNION ALL SELECT 'Kadeem Somji', 'Wealth Advisor'
  UNION ALL SELECT 'Erin Cooper', 'Wealth Advisor'
  UNION ALL SELECT 'Christina Schild', 'Client Service Associate'
  UNION ALL SELECT 'Andrew Sutherland', 'Client Service Associate'
  UNION ALL SELECT 'Gerald Madaje', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1547)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1547 AND name = x.name);

-- 1418 Martin Lacroix, NBF Wealth Management (Martin Lacroix Wealth Management Team), Ottawa, ON
UPDATE contacts SET address = '50 O''Connor Street, Suite 1602' WHERE id = 1418;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1418, x.name, x.role FROM (
  SELECT 'Martin Bisson' AS name, 'Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Dérick Duchesne', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Sébastien Joachim', 'Wealth Associate'
  UNION ALL SELECT 'Marie-Andrée Lajoie', 'Wealth Associate'
  UNION ALL SELECT 'Nate Bazinet-Chalifoux', 'Wealth Management Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1418)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1418 AND name = x.name);

-- 1722 Kevin Klein, ScotiaMcLeod (Klein Investment Management), Edmonton, AB
UPDATE contacts SET address = '10220 103 Avenue NW, Suite 2100 (Stantec Tower)' WHERE id = 1722;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1722, x.name, x.role FROM (
  SELECT 'Michael Ash' AS name, 'Senior Associate' AS role
  UNION ALL SELECT 'Molly Woelinga (formerly Molly Cunningham)', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1722)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1722 AND name = x.name);

-- New contacts 2455-2457: surviving Sutherland Investment Group advisors,
-- added per user's explicit choice after 1599 Fraser Sutherland's death.
-- Tom Porteous's personal email/direct line withheld: search results
-- repeatedly conflate him with an unrelated, similarly-named Vancouver
-- advisor (BPS Wealth Management/Canaccord Genuity) — only the verified
-- shared office line is used. Alex Kealey's formal title string could not
-- be confirmed from any source, so a generic role is used with a flag.

INSERT INTO contacts (id, name, title, firm, segment, priority, lead_score, email, email_status, phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm, firm_type, state_rank, rank_movement, uhnw, institutional, foundation, client_types, reachable, source_list, data_flags, address)
SELECT 2455, 'Tom Porteous', 'Senior Wealth Advisor and Portfolio Manager', 'Canaccord Genuity Wealth Management', 'Financial Advisor', 'C', 0,
  '', 'Unknown', '', 'Ottawa', 'ON', 'Canada',
  'ONTARIO', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as one of three surviving leads of Sutherland Investment Group after 1599 Fraser Sutherland''s death (Jan 17, 2025). Caution: search results repeatedly conflate this Ottawa advisor with an unrelated, similarly-named advisor at BPS Wealth Management/Canaccord Genuity in Vancouver — personal email/direct phone withheld pending manual verification; use main office line 613-212-4444 in the interim.',
  '50 O''Connor Street, Suite 1120'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2455);

INSERT INTO contact_people (contact_id, name, role)
SELECT 2455, x.name, x.role FROM (
  SELECT 'Julia McClintock' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Alex Kealey', 'Advisor (financial planning, portfolio management, business development)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2455)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2455 AND name = x.name);

INSERT INTO contacts (id, name, title, firm, segment, priority, lead_score, email, email_status, phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm, firm_type, state_rank, rank_movement, uhnw, institutional, foundation, client_types, reachable, source_list, data_flags, address)
SELECT 2456, 'Julia McClintock', 'Wealth Advisor', 'Canaccord Genuity Wealth Management', 'Financial Advisor', 'C', 0,
  'jmcclintock@cgf.com', 'Provided', '613-212-4417', 'Ottawa', 'ON', 'Canada',
  'ONTARIO', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as one of three surviving leads of Sutherland Investment Group after 1599 Fraser Sutherland''s death (Jan 17, 2025).',
  '50 O''Connor Street, Suite 1120'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2456);

INSERT INTO contact_people (contact_id, name, role)
SELECT 2456, x.name, x.role FROM (
  SELECT 'Tom Porteous' AS name, 'Senior Wealth Advisor and Portfolio Manager' AS role
  UNION ALL SELECT 'Alex Kealey', 'Advisor (financial planning, portfolio management, business development)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2456)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2456 AND name = x.name);

INSERT INTO contacts (id, name, title, firm, segment, priority, lead_score, email, email_status, phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm, firm_type, state_rank, rank_movement, uhnw, institutional, foundation, client_types, reachable, source_list, data_flags, address)
SELECT 2457, 'Alex Kealey', 'Advisor', 'Canaccord Genuity Wealth Management', 'Financial Advisor', 'C', 0,
  'Akealey@cgf.com', 'Provided', '613-212-4418', 'Ottawa', 'ON', 'Canada',
  'ONTARIO', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as one of three surviving leads of Sutherland Investment Group after 1599 Fraser Sutherland''s death (Jan 17, 2025). Formal job title could not be confirmed from any source (role covers financial planning, portfolio management, business development, succession strategies) — "Advisor" used as a placeholder title.',
  '50 O''Connor Street, Suite 1120'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2457);

INSERT INTO contact_people (contact_id, name, role)
SELECT 2457, x.name, x.role FROM (
  SELECT 'Tom Porteous' AS name, 'Senior Wealth Advisor and Portfolio Manager' AS role
  UNION ALL SELECT 'Julia McClintock', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2457)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2457 AND name = x.name);
