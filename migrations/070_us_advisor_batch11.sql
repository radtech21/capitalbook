-- US Financial Advisor enrichment, batch 11 (34 contacts / 20 groups).
--
-- Notable finding: contacts 336 (Derek Jancisin) and 545 (Michael
-- Duckworth), both filed under the same Merrill Pittsburgh CRM phone
-- group, are confirmed to now be at two distinct addresses/teams
-- roughly 0.3 miles apart (600 Grant St vs. 260 Forbes Ave) rather than
-- one shared office — likely a past team split.

-- ===== GROUP 201: Baird, Nashville, TN =====
-- 314 Hale Hooper III (The Carter Hooper Group), 589 Malcolm Liles (The Liles Group) —
-- two separate teams sharing the same building.
UPDATE contacts SET
  address = '1600 West End Avenue, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, lead portfolio manager, co-leader (with Larry Carter) of The Carter Hooper Group, Baird Nashville.')), 512)
WHERE id = 314;
UPDATE contacts SET
  address = '1600 West End Avenue, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Family Wealth Advisor, managing partner of The Liles Group, Baird Nashville (separate team from id 314 Hale Hooper III, sharing the same office).')), 512)
WHERE id = 589;
INSERT INTO contact_people (contact_id, name, role)
SELECT 314, x.name, x.role FROM (
  SELECT 'Larry Carter' AS name, 'Managing Director, co-lead, The Carter Hooper Group' AS role
  UNION ALL SELECT 'Brian Hanrahan, CFP, CPWA, QPFC', 'Team member, The Carter Hooper Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 314) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 314 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 589, x.name, x.role FROM (
  SELECT 'William Liles' AS name, 'Financial Advisor (father-son team with Malcolm), The Liles Group' AS role
  UNION ALL SELECT 'Leighton Liles', 'Financial Advisor, The Liles Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 589) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 589 AND name = x.name);

-- ===== GROUP 202: J.P. Morgan Wealth Management, Boston, MA =====
-- 316 Peter Noonan (Peter C. Noonan Group)
UPDATE contacts SET
  address = '50 Rowes Wharf, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Wealth Partner, leads the Peter C. Noonan Group, J.P. Morgan Boston (also serves NY clients).')), 512)
WHERE id = 316;
INSERT INTO contact_people (contact_id, name, role)
SELECT 316, x.name, x.role FROM (
  SELECT 'Patrick Noonan' AS name, 'Wealth Advisor, Peter C. Noonan Group' AS role
  UNION ALL SELECT 'Matt Flaks', 'Client Associate, Peter C. Noonan Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 316) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 316 AND name = x.name);

-- ===== GROUP 203: MAI Capital Management, Cleveland, OH =====
-- 318 Marla Petti (Regional President, Cleveland Family Office)
UPDATE contacts SET
  address = '6050 Oak Tree Blvd., Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Wealth Advisor, Team Leader & Managing Director, Regional President of the Cleveland Family Office, MAI Capital Management (joined 2021). Barron''s 2025 Top 100 Women Financial Advisors.')), 512)
WHERE id = 318;
INSERT INTO contact_people (contact_id, name, role)
SELECT 318, x.name, x.role FROM (
  SELECT 'Lauren Lippert, CPA, CFP' AS name, 'Senior Wealth Advisor, Managing Director, MAI Capital Management (Cleveland Family Office team)' AS role
  UNION ALL SELECT 'Stephanie Sandle, CPA, CFP, CPWA', 'Managing Director, Wealth Management, MAI Capital Management (Cleveland)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 318) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 318 AND name = x.name);

-- ===== GROUP 204: Morgan Stanley Private Wealth Management, Atlanta, GA — 404-542-2600 =====
-- 321 Al Parker (Parker Pulliam Walls Team), 338 Brian Frank (The Premier Group) — two
-- separate teams sharing the same building.
UPDATE contacts SET
  address = '3280 Peachtree Rd NE, Suite 2000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founding member, Parker Pulliam Walls Team, Morgan Stanley PWM Atlanta (with firm since 2002). #18 Forbes Georgia-Atlanta Best-In-State 2026.')), 512)
WHERE id = 321;
UPDATE contacts SET
  address = '3280 Peachtree Rd NE, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor/Private Wealth Advisor, leads The Premier Group, Morgan Stanley PWM Atlanta (with firm since 2002; separate team/suite from id 321 Al Parker in the same building). #3 Forbes Georgia-Atlanta Private Wealth 2026; Chairman''s Club.')), 512)
WHERE id = 338;
INSERT INTO contact_people (contact_id, name, role)
SELECT 338, x.name, x.role FROM (
  SELECT 'Jonathan Braatz' AS name, 'Financial Advisor/wealth management specialist, The Premier Group' AS role
  UNION ALL SELECT 'Sherry Perchik', 'Wealth management team member, The Premier Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 338) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 338 AND name = x.name);

-- ===== GROUP 205: Morgan Stanley Private Wealth Management, Pasadena, CA =====
-- 323 Sean Yu (The Sean Yu Group)
UPDATE contacts SET
  address = '55 South Lake Avenue, Pasadena Towers – Tower II, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads The Sean Yu Group, Morgan Stanley PWM Pasadena.')), 512)
WHERE id = 323;
INSERT INTO contact_people (contact_id, name, role)
SELECT 323, x.name, x.role FROM (
  SELECT 'Davin Chen, CFP' AS name, 'FA Partner / Private Wealth Advisor / Family Wealth Director, The Sean Yu Group' AS role
  UNION ALL SELECT 'Jenny Lee, CRPC', 'Financial Advisor, The Sean Yu Group'
  UNION ALL SELECT 'Kevin Yu', 'Financial Advisor / Family Wealth Director, The Sean Yu Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 323) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 323 AND name = x.name);

-- ===== GROUP 206: Janney Montgomery Scott, Glastonbury, CT =====
-- 324 Marilyn Mantziaris (Axea Financial)
UPDATE contacts SET
  address = '95 Glastonbury Boulevard, Suite 404',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Vice President/Investments, leads Axea Financial, Janney Montgomery Scott Glastonbury; also serves as Resident/Satellite Branch Manager. Barron''s Top 100 Women 2025.')), 512)
WHERE id = 324;

-- ===== GROUP 207: Merrill Wealth Management, Florham Park, NJ =====
-- 326 Jack Burke (The Harbor Group), 481 Christopher Cook (The GCCA Group), 1085 David
-- Comito (Bishop Comito Group / Principe Bishop Comito Guthrie Group) — three separate
-- teams sharing the same building/switchboard.
UPDATE contacts SET
  address = '100 Campus Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name John J. Burke III, Managing Director, Wealth Management Advisor & Portfolio Manager, leads The Harbor Group, Merrill Florham Park (with Merrill since 1995).')), 512)
WHERE id = 326;
UPDATE contacts SET
  address = '100 Campus Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, CIMA, founder/leader of The GCCA Group (12-person team, ~$2.5B AUM), Merrill Florham Park (with Merrill since 1992).')), 512)
WHERE id = 481;
UPDATE contacts SET
  address = '100 Campus Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, member of the Bishop Comito Group, recently rebranded/expanded as Principe Bishop Comito Guthrie Group, Merrill Florham Park.')), 512)
WHERE id = 1085;
INSERT INTO contact_people (contact_id, name, role)
SELECT 326, x.name, x.role FROM (
  SELECT 'Alex Joyce' AS name, 'Team member, The Harbor Group' AS role
  UNION ALL SELECT 'Andrew Allen', 'Team member, The Harbor Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 326) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 326 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1085, x.name, x.role FROM (
  SELECT 'Julia Bishop' AS name, 'Financial Advisor, Principe Bishop Comito Guthrie Group' AS role
  UNION ALL SELECT 'Joseph Principe', 'Managing Director, Senior Relationship Manager, Principe Bishop Comito Guthrie Group'
  UNION ALL SELECT 'Ryan Guthrie', 'Senior VP, Senior Financial Advisor, Principe Bishop Comito Guthrie Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1085) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1085 AND name = x.name);

-- ===== GROUP 208: UBS Wealth Management, Warren, NJ =====
-- 328 Gary Tantleff (The Tantleff Group / Credit Union Advisory Group), 333 Jack Riley
-- (Liberty Trail Wealth Management) — two separate teams sharing the same building.
UPDATE contacts SET
  address = '184 Liberty Corner Road, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, leads The Tantleff Group / Credit Union Advisory Group, UBS Warren NJ. Barron''s Top 1,500 Financial Advisors 2026.')), 512)
WHERE id = 328;
UPDATE contacts SET
  address = '184 Liberty Corner Road, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, part of Liberty Trail Wealth Management, UBS Warren NJ (separate team from id 328 Gary Tantleff, sharing the same building). #4 Forbes 2026 Best-In-State NJ; Barron''s Top 1,500 2026.')), 512)
WHERE id = 333;
INSERT INTO contact_people (contact_id, name, role)
SELECT 328, x.name, x.role FROM (
  SELECT 'Ryan Tantleff' AS name, 'Financial Advisor (son of Gary), The Tantleff Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 328) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 328 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 333, x.name, x.role FROM (
  SELECT 'John T. Cusate, CFP, ChFC, CLU' AS name, 'Team member (since 1998), Liberty Trail Wealth Management' AS role
  UNION ALL SELECT 'Michael Jordao, CRPC', 'Team member (joined 2013), Liberty Trail Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 333) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 333 AND name = x.name);

-- ===== GROUP 209: J.P. Morgan Wealth Management, Boca Raton, FL =====
-- 329 Andrew Vahab (The Vahab Group, founder)
UPDATE contacts SET
  address = '5100 Town Center Circle, Suite 650',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Partner, CFP, founder and leader of The Vahab Group, J.P. Morgan Boca Raton (team also has a Manhattan/Rockefeller Center office). Barron''s and Forbes top-advisor lists 2026.')), 512)
WHERE id = 329;
INSERT INTO contact_people (contact_id, name, role)
SELECT 329, x.name, x.role FROM (
  SELECT 'Nicholas Perez' AS name, 'Investment Associate, The Vahab Group' AS role
  UNION ALL SELECT 'David Stecker', 'Team member, The Vahab Group (Boca Raton office)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 329) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 329 AND name = x.name);

-- ===== GROUP 210: Merrill Private Wealth Management, Towson, MD =====
-- 334 Kent Pearce (The Pearce Group)
UPDATE contacts SET
  address = '901 Dulaney Valley Rd, Suite 516',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Kent V. Pearce, Managing Director & Private Wealth Manager, leads The Pearce Group, Merrill Towson MD (also has a West Palm Beach, FL office). #29 Forbes "America''s Top Wealth Advisors" 2026; #1 Maryland Barron''s Top 1500.')), 512)
WHERE id = 334;
INSERT INTO contact_people (contact_id, name, role)
SELECT 334, x.name, x.role FROM (
  SELECT 'James Lillie' AS name, 'Senior Vice President, The Pearce Group' AS role
  UNION ALL SELECT 'Stephen Ross', 'Vice President, The Pearce Group'
  UNION ALL SELECT 'Jeremy Kober', 'Vice President, Wealth Management Advisor, The Pearce Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 334) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 334 AND name = x.name);

-- ===== GROUP 211: Merrill Private Wealth Management, Pittsburgh, PA =====
-- 336 Derek Jancisin (Jancisin | DiSilvio), 545 Michael Duckworth (Duckworth Haggerty
-- Group) — confirmed two distinct addresses ~0.3 mi apart, not one shared office.
UPDATE contacts SET
  address = '600 Grant Street, 49th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Partner of Jancisin | DiSilvio, Merrill Pittsburgh, CFP/CPWA/CEPA/SE-AWMA. Note: confirmed at a different address from id 545 Michael Duckworth despite sharing the CRM phone-group; also has a satellite office at 6493 Robinson Centre Drive, Pittsburgh PA 15205.')), 512)
WHERE id = 336;
UPDATE contacts SET
  address = '260 Forbes Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Private Wealth Advisor, part of The Duckworth Haggerty Group, Merrill Pittsburgh. Note: confirmed at a different address from id 336 Derek Jancisin despite sharing the CRM phone-group. Barron''s Top 1,200 Financial Advisors.')), 512)
WHERE id = 545;
INSERT INTO contact_people (contact_id, name, role)
SELECT 336, x.name, x.role FROM (
  SELECT 'Gennaro R. DiSilvio' AS name, 'Partner/Advisor, Jancisin | DiSilvio' AS role
  UNION ALL SELECT 'Kevin R. Cox', 'Financial Advisor, Jancisin | DiSilvio'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 336) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 336 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 545, x.name, x.role FROM (
  SELECT 'Jennifer Haggerty' AS name, 'Private Wealth Advisor, The Duckworth Haggerty Group' AS role
  UNION ALL SELECT 'Helen Sims Duerr', 'Private Wealth Advisor, The Duckworth Haggerty Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 545) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 545 AND name = x.name);

-- ===== GROUP 212: UBS Private Wealth Management, Paramus, NJ =====
-- 337 Nicholas Pepe (Soteria Wealth Management)
UPDATE contacts SET
  address = '61 South Paramus Road, Mack Center IV, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor & Family Office Consultant, part of Soteria Wealth Management, UBS Paramus NJ. #4 North NJ (Private Wealth) Forbes/SHOOK Apr 2025.')), 512)
WHERE id = 337;
INSERT INTO contact_people (contact_id, name, role)
SELECT 337, x.name, x.role FROM (
  SELECT 'Michael James' AS name, 'Team member, Soteria Wealth Management' AS role
  UNION ALL SELECT 'Joseph Vogler', 'Team member, Soteria Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 337) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 337 AND name = x.name);

-- ===== GROUP 213: Moneta Group, Clayton, MO =====
-- 339 Diane Compardo (CWCJ, founding partner), 858 Bradford Koeneman (Koeneman Glenn team)
UPDATE contacts SET
  address = '100 South Brentwood Blvd, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner, Compardo, Wienstroer, Conrad & Janes (CWCJ) team, Moneta Group HQ, Clayton MO. Barron''s/Forbes/Financial Times Top 100 Advisor.')), 512)
WHERE id = 339;
UPDATE contacts SET
  address = '100 South Brentwood Blvd, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner, sits on Moneta Group''s Board of Directors, leads the Koeneman Glenn team (formerly "Koeneman Team"), Moneta Group HQ, Clayton MO. Barron''s Top Advisor rankings 10 consecutive years 2016-2025.')), 512)
WHERE id = 858;
INSERT INTO contact_people (contact_id, name, role)
SELECT 339, x.name, x.role FROM (
  SELECT 'Ron Wienstroer' AS name, 'Partner (Compardo''s husband), CWCJ team' AS role
  UNION ALL SELECT 'Mark Conrad, CPA, CFP', 'Partner, CWCJ team'
  UNION ALL SELECT 'Jordan Janes', 'Partner, leads professional athlete practice, CWCJ team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 339) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 339 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 858, x.name, x.role FROM (
  SELECT 'Andy Glenn, CFA' AS name, 'Partner, Koeneman Glenn team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 858) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 858 AND name = x.name);

-- ===== GROUP 214: Kaplan Financial Services, Newton, MA =====
-- 340 Susan Kaplan (President/founder)
UPDATE contacts SET
  address = '2227 Washington St, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/Founder, Kaplan Financial Services, Newton MA (started firm 1993, currently affiliated with LPL Financial). #1 Forbes 2026 Best-In-State MA.')), 512)
WHERE id = 340;
INSERT INTO contact_people (contact_id, name, role)
SELECT 340, x.name, x.role FROM (
  SELECT 'Lawrence D. Kaplan, CFP' AS name, 'Executive Vice President (son of Susan), Kaplan Financial Services' AS role
  UNION ALL SELECT 'Ann DeCaprio', 'Vice President, Strategy & Operations, Kaplan Financial Services'
  UNION ALL SELECT 'Jamie Freidhof', 'Vice President of Investment Research, Kaplan Financial Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 340) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 340 AND name = x.name);

-- ===== GROUP 215: UBS Wealth Management, Cincinnati, OH =====
-- 341 Stephen Fish, 555 William McCarthy, 584 Michael Hyzdu, 691 Timothy Dumont, 1014
-- Luke Wiley — four separate teams sharing the same building/switchboard.
UPDATE contacts SET
  address = 'The Towers At Kenwood, 8044 Montgomery Road, Suite 100W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads Ovid Wealth Management, UBS Cincinnati.')), 512)
WHERE id = 341;
UPDATE contacts SET
  address = 'The Towers At Kenwood, 8044 Montgomery Road, Suite 100W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name William "Bill" McCarthy, CFP, leads FTB Financial Services, UBS Cincinnati (serves current/former Procter & Gamble families). #5 Forbes Best-In-State (Ohio-Cincinnati) 2025.')), 512)
WHERE id = 555;
UPDATE contacts SET
  address = 'The Towers At Kenwood, 8044 Montgomery Road, Suite 100W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, CEPA, Financial Advisor with 3 Point Private Wealth (also seen as "3 Point Legacy Advisors"), UBS Cincinnati. #12 Forbes Best-In-State 2025.')), 512)
WHERE id = 584;
UPDATE contacts SET
  address = 'The Towers At Kenwood, 8044 Montgomery Road, Suite 100W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, CFA, team member/partner at FTB Financial Services, UBS Cincinnati, alongside id 555 William McCarthy. #8 Forbes Best-In-State 2025.')), 512)
WHERE id = 691;
UPDATE contacts SET
  address = 'The Towers At Kenwood, 8044 Montgomery Road, Suite 100W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, leads Wiley Wealth Management, UBS Cincinnati. #9 Forbes 2026 Best-In-State.')), 512)
WHERE id = 1014;
INSERT INTO contact_people (contact_id, name, role)
SELECT 555, x.name, x.role FROM (
  SELECT 'Scott Cengia' AS name, 'Team member, FTB Financial Services' AS role
  UNION ALL SELECT 'Kelly Wittich', 'Team member, FTB Financial Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 555) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 555 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 584, x.name, x.role FROM (
  SELECT 'Tom Hampton' AS name, 'Team member, 3 Point Private Wealth' AS role
  UNION ALL SELECT 'Scott Hiles', 'Team member, 3 Point Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 584) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 584 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1014, x.name, x.role FROM (
  SELECT 'Zachary H. Wiley' AS name, 'Team member, Wiley Wealth Management' AS role
  UNION ALL SELECT 'Nicholas J. Shine', 'Team member, Wiley Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1014) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1014 AND name = x.name);

-- ===== GROUP 216: Merrill Private Wealth Management, San Antonio, TX =====
-- 342 F Michael Wood Jr., 343 Dan Nelson (NWG/VMT & Associates)
UPDATE contacts SET
  address = '1803 Broadway St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — with Merrill Private Wealth Management San Antonio (joined 2002); team leader of NWG/VMT & Associates. Forbes 2025 Best-In-State Wealth Management Teams member.')), 512)
WHERE id = 342;
UPDATE contacts SET
  address = '1803 Broadway St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Daniel Russell Nelson, CFP/CIMA/CPWA, Merrill Private Wealth Management San Antonio (26+ years in industry), NWG/VMT & Associates. #28 Forbes Best-In-State Texas-South 2025.')), 512)
WHERE id = 343;
INSERT INTO contact_people (contact_id, name, role)
SELECT 343, x.name, x.role FROM (
  SELECT 'John Carrillo' AS name, 'Financial Advisor, NWG/VMT & Associates' AS role
  UNION ALL SELECT 'Austin Burt', 'Investment Committee, NWG/VMT & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 343) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 343 AND name = x.name);

-- ===== GROUP 217: Truist Investment Services, Raleigh, NC =====
-- 344 David Rakestraw, 485 Jack Taylor (The Lighthouse Group)
UPDATE contacts SET
  address = '3605 Glenwood Ave, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director/Financial Advisor, leads The Lighthouse Group, Truist Raleigh NC. #5 Forbes 2026 Best-in-State.')), 512)
WHERE id = 344;
UPDATE contacts SET
  address = '3605 Glenwood Ave, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director, Financial Advisor, part of The Lighthouse Group, Truist Raleigh NC. Barron''s 2026 Top 1,500 Financial Advisors.')), 512)
WHERE id = 485;
INSERT INTO contact_people (contact_id, name, role)
SELECT 344, x.name, x.role FROM (
  SELECT 'Matthew Johnson, CFP' AS name, 'Financial Advisor, The Lighthouse Group' AS role
  UNION ALL SELECT 'Colin Pelletier, CFP', 'Financial Consultant, The Lighthouse Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 344) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 344 AND name = x.name);

-- ===== GROUP 218: Merrill Private Wealth Management, Washington, DC =====
-- 345 Tom Rietano (The Rietano Group, aka Nelson-Rietano Group)
UPDATE contacts SET
  address = '1152 15th St NW, Suite 6000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Thomas J. Rietano III, CAIA, Managing Director & Private Wealth Advisor, Merrill Washington DC (31+ years in industry); leads The Rietano Group (also referred to as the Nelson-Rietano Group). Barron''s Top 1,500/1,200 (9th time); Forbes Best-in-State 2022-2026.')), 512)
WHERE id = 345;
INSERT INTO contact_people (contact_id, name, role)
SELECT 345, x.name, x.role FROM (
  SELECT 'Trevor Nelson' AS name, 'Partner/Financial Advisor, The Rietano Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 345) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 345 AND name = x.name);

-- ===== GROUP 219: Merrill Private Wealth Management, Denver, CO =====
-- 346 Scott Thisted (The Thisted Group, founder)
UPDATE contacts SET
  address = '200 Josephine Street, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, founder of The Thisted Group, Merrill Denver (Cherry Creek office; with Merrill since 1998). Barron''s Top 1,200 (14th consecutive year 2024); Forbes Best-In-State (7th consecutive year 2024).')), 512)
WHERE id = 346;
INSERT INTO contact_people (contact_id, name, role)
SELECT 346, x.name, x.role FROM (
  SELECT 'Diane Padalino, CFP' AS name, 'Private Wealth Advisor, The Thisted Group' AS role
  UNION ALL SELECT 'Mitchell Hoover', 'Financial Advisor, The Thisted Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 346) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 346 AND name = x.name);

-- ===== GROUP 220: Wells Fargo Advisors, Charlotte, NC =====
-- 347 William Oliver (The Oliver Private Wealth Management Group), 566 Kathleen Malone
-- (Tryon Private Wealth Group, formerly Malone Nelson Sontag) — two teams, different floors.
UPDATE contacts SET
  address = '550 S. Tryon Street, 45th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Financial Advisor, Managing Director-Investments, founder of The Oliver Private Wealth Management Group, Wells Fargo Charlotte. #1 Forbes Best-In-State (NC-West) Apr 2026; #156 Forbes America''s Top Wealth Advisors 2026; team on Barron''s Top 250 Private Wealth Teams 2026.')), 512)
WHERE id = 347;
UPDATE contacts SET
  address = '550 S. Tryon Street, 44th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, now leads the Tryon Private Wealth Group (formerly branded Malone Nelson Sontag), Wells Fargo Charlotte (separate team/floor from id 347 William Oliver, same tower). 16 years in practice, 9 at Wells Fargo. #9 North Carolina, #40 NC-West Forbes 2026.')), 512)
WHERE id = 566;
INSERT INTO contact_people (contact_id, name, role)
SELECT 566, x.name, x.role FROM (
  SELECT 'Andy Sontag, CFP' AS name, 'Financial Advisor, Tryon Private Wealth Group' AS role
  UNION ALL SELECT 'Emily Malone', 'Financial Advisor (joined Mar 2020), Tryon Private Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 566) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 566 AND name = x.name);
