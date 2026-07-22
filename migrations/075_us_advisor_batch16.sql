-- US Financial Advisor enrichment, batch 16 (31 contacts / 20 groups).
--
-- Two location discrepancies flagged rather than silently resolved:
-- 479 Michael Shalhoup's team ("The Shalhoup Group," $1.7B+ AUM) is
-- actually NYC-based per Forbes/press — the CRM's Charleston, WV
-- address is only his FINRA-registered branch, not his working office.
-- 487 Edward Lang's current team page lists Portland, OR, not the CRM's
-- Lake Oswego, OR — applied the Portland address with a flag.

-- ===== GROUP 301: Creative Planning, Omaha, NE =====
-- 464 Ryan Swartz (Partner & Managing Director)
UPDATE contacts SET
  address = '12925 West Dodge Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner & Managing Director, Creative Planning, oversees the Omaha regional office. #1 Nebraska, Barron''s 2019 & 2025; Forbes Best-In-State 2025.')), 512)
WHERE id = 464;
INSERT INTO contact_people (contact_id, name, role)
SELECT 464, x.name, x.role FROM (
  SELECT 'Nate Farmer' AS name, 'Wealth Manager, Creative Planning Omaha' AS role
  UNION ALL SELECT 'Jerry Sharkey, CFP', 'Wealth Manager, Creative Planning Omaha'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 464) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 464 AND name = x.name);

-- ===== GROUP 302: Wells Fargo Advisors, Portland, OR =====
-- 465 Justin Buell (Continuity Group)
UPDATE contacts SET
  address = '9755 Southwest Barnes Road, Suite 290',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, Managing Partner of the Continuity Group practice, Wells Fargo Portland OR. #3 Forbes Best-In-State Oregon 2026; Barron''s Top 1,200 Mar 2025.')), 512)
WHERE id = 465;
INSERT INTO contact_people (contact_id, name, role)
SELECT 465, x.name, x.role FROM (
  SELECT 'Gerald Rouleau' AS name, 'Managing Partner, Continuity Group' AS role
  UNION ALL SELECT 'Dominic Corleto', 'Managing Partner, Continuity Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 465) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 465 AND name = x.name);

-- ===== GROUP 303: Principle Wealth Partners, Madison, CT =====
-- 476 Robert Paolucci (Founder & CEO)
UPDATE contacts SET
  address = '670 Boston Post Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Principle Wealth Partners, Madison CT. Forbes Best-In-State CT #4 (High Net Worth) Apr 2025; recognition streak 2019-2026.')), 512)
WHERE id = 476;
INSERT INTO contact_people (contact_id, name, role)
SELECT 476, x.name, x.role FROM (
  SELECT 'Colin M. Dugan, CFP' AS name, 'Chief Relationship Officer / Senior Wealth Advisor, Principle Wealth Partners' AS role
  UNION ALL SELECT 'Theresa V. Donatelli', 'Advisor, Principle Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 476) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 476 AND name = x.name);

-- ===== GROUP 304: Merrill Wealth Management, The Woodlands, TX =====
-- 466 Frederick de Groot (de Groot & Associates), 571 Charles Johansen + 572 Brian
-- Petrauskas (Johansen Petrauskas & Associates), 1059 Timothy Hickman (own team) — three
-- separate teams sharing the same building/switchboard.
UPDATE contacts SET
  address = '9595 Six Pines Drive, Suite 8380',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, leads de Groot & Associates, Merrill The Woodlands TX; works with Merrill''s Global Corporate & Institutional Advisory Services Group. #2 Texas-South Forbes Best-in-State 2025/2026.')), 512)
WHERE id = 466;
UPDATE contacts SET
  address = '9595 Six Pines Drive, Suite 8380',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor & Managing Director, founding member of Johansen Petrauskas & Associates, Merrill The Woodlands TX (joined Merrill 1992), alongside id 572 Brian Petrauskas. Barron''s Top 1,200 and Forbes Best-in-State recognized.')), 512)
WHERE id = 571;
UPDATE contacts SET
  address = '9595 Six Pines Drive, Suite 8380',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Manager, CIMA, co-lead of Johansen Petrauskas & Associates, Merrill The Woodlands TX, alongside id 571 Charles Johansen.')), 512)
WHERE id = 572;
UPDATE contacts SET
  address = '9595 Six Pines Drive, Suite 8380',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, leads own team, Merrill The Woodlands TX (joined Merrill July 2009, prior UBS SVP; separate team from de Groot & Associates and Johansen Petrauskas & Associates, sharing the same building). #23 Forbes Best-in-State 2026.')), 512)
WHERE id = 1059;

-- ===== GROUP 305: Baird, Seattle, WA =====
-- 467 Will Strong (The Strong Group), 468 Cameron Ragen (The Ragen Group) — two separate
-- teams; office recently relocated to 601 Union Street.
UPDATE contacts SET
  address = '601 Union Street, Suite 4700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Family Wealth Advisor, leads/part of The Strong Group, Baird Seattle (office relocated to 601 Union St from 925 Fourth Ave). Barron''s 2024 Top 1,200; Forbes 2026 Best-In-State #42.')), 512)
WHERE id = 467;
UPDATE contacts SET
  address = '601 Union Street, Suite 4700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor, leads The Ragen Group, Baird Seattle (joined Baird 2014 via McAdams Wright Ragen; ~33 yrs industry experience; separate team from id 467 Will Strong, sharing the same office).')), 512)
WHERE id = 468;
INSERT INTO contact_people (contact_id, name, role)
SELECT 467, x.name, x.role FROM (
  SELECT 'Sissi Sondgroth, CFP' AS name, 'Financial Planner, The Strong Group' AS role
  UNION ALL SELECT 'Scott Schoenfeld', 'Family Wealth Advisor, The Strong Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 467) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 467 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 468, x.name, x.role FROM (
  SELECT 'Casi Jones' AS name, 'Team member, The Ragen Group' AS role
  UNION ALL SELECT 'Phil Banta', 'Senior Vice President, Financial Advisor, The Ragen Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 468) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 468 AND name = x.name);

-- ===== GROUP 306: Morgan Stanley Wealth Management, West Des Moines, IA =====
-- 469 Bryan Boesen
UPDATE contacts SET
  address = '1080 Jordan Creek Parkway, Suite 400 North',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Morgan Stanley West Des Moines IA. #4 Best-In-State Wealth Advisor Iowa (Forbes 2025); Barron''s Top 1,200 2020, 2022, 2023. No named team members found.')), 512)
WHERE id = 469;

-- ===== GROUP 307: Ameriprise Financial, Wilmington, DE =====
-- 470 Kimberlee Orth (Orth Financial Group, lead advisor)
UPDATE contacts SET
  address = '3513 Concord Pike, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP/CKA, lead advisor of Orth Financial Group (~17 advisors/team members, ~1,000 families), Ameriprise Wilmington DE. Forbes 2025 Top Women Wealth Advisors.')), 512)
WHERE id = 470;
INSERT INTO contact_people (contact_id, name, role)
SELECT 470, x.name, x.role FROM (
  SELECT 'Michael Orth, APMA, CRPC, CMFA' AS name, 'Financial Advisor, Orth Financial Group' AS role
  UNION ALL SELECT 'Mary Reopell, CFP', 'Financial Advisor (12 yrs with firm), Orth Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 470) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 470 AND name = x.name);

-- ===== GROUP 308: Morgan Stanley Private Wealth Management, Coeur d'Alene, ID =====
-- 471 Dale Miller (The Pacific Wealth Management Group, co-founder)
UPDATE contacts SET
  address = '505 E. Front Avenue, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Corporate Client Director, Family Wealth Director, co-founder/Managing Partner of The Pacific Wealth Management Group, Morgan Stanley Coeur d''Alene ID (also serves Kirkland WA and Spokane WA). #1 Idaho advisor, Forbes and Barron''s 2023.')), 512)
WHERE id = 471;
INSERT INTO contact_people (contact_id, name, role)
SELECT 471, x.name, x.role FROM (
  SELECT 'Larry Garcia' AS name, 'Private Wealth Advisor, Family Wealth Director, founding partner, The Pacific Wealth Management Group' AS role
  UNION ALL SELECT 'Brian McCann, MBA, CFP, CEPA', 'Team member (serves Spokane/Coeur d''Alene), The Pacific Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 471) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 471 AND name = x.name);

-- ===== GROUP 309: Wells Fargo Advisors, Charleston, SC =====
-- 472 Robert Vingi (Roseate Group), 1109 Dennis Coleman (Coleman Dunleavy Wealth
-- Management Group) — two separate teams, different floors of the same building.
UPDATE contacts SET
  address = '320 Broad Street, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Robert Vingi Jr., Private Wealth Financial Advisor / Managing Director-Investments, leads the Roseate Group, Wells Fargo Charleston SC (rebranded from "The Vingi, Edwards & McCallum Private Wealth Management Group" Feb 2024). Barron''s Top 1,200 2025; Forbes Best-In-State 2025.')), 512)
WHERE id = 472;
UPDATE contacts SET
  address = '320 Broad Street, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, leads the Coleman Dunleavy Wealth Management Group, Wells Fargo Charleston SC (separate team/floor from id 472 Robert Vingi, same building). 2026 Platinum Council; #10 SC Forbes Best-In-State 2025.')), 512)
WHERE id = 1109;
INSERT INTO contact_people (contact_id, name, role)
SELECT 472, x.name, x.role FROM (
  SELECT 'Wendy Brewer' AS name, 'Financial Advisor, Roseate Group' AS role
  UNION ALL SELECT 'David McCallum', 'Financial Advisor, Roseate Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 472) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 472 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1109, x.name, x.role FROM (
  SELECT 'Thomas Dunleavy' AS name, 'Co-lead, Coleman Dunleavy Wealth Management Group' AS role
  UNION ALL SELECT 'Travis Burdette', 'Financial Consultant, Coleman Dunleavy Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1109) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1109 AND name = x.name);

-- ===== GROUP 310: Merrill Wealth Management, Little Rock, AR =====
-- 473 John Engskov (Jackson-Engskov & Associates), 625 Pledger Monk (Monk, Mitchell,
-- Williams, Vincent & McCauley) — two separate teams sharing the same building.
UPDATE contacts SET
  address = '2200 N. Rodney Parham Road, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Senior Vice President, co-founded Jackson-Engskov & Associates (with Douglas Jackson), Merrill Little Rock AR (with Merrill since 1996).')), 512)
WHERE id = 473;
UPDATE contacts SET
  address = '2200 N. Rodney Parham Road, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Pledger E. Monk III, CFA/CFP/CIMA, part of Monk, Mitchell, Williams, Vincent & McCauley, Merrill Little Rock AR (~25 yrs in practice; separate team from id 473 John Engskov, sharing the same building).')), 512)
WHERE id = 625;
INSERT INTO contact_people (contact_id, name, role)
SELECT 473, x.name, x.role FROM (
  SELECT 'Douglas Jackson' AS name, 'Wealth Management Advisor/Co-founder, CFP, Jackson-Engskov & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 473) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 473 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 625, x.name, x.role FROM (
  SELECT 'Justin Mitchell' AS name, 'Financial Advisor, Monk, Mitchell, Williams, Vincent & McCauley' AS role
  UNION ALL SELECT 'Kimberly Williams', 'Financial Advisor, Monk, Mitchell, Williams, Vincent & McCauley'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 625) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 625 AND name = x.name);

-- ===== GROUP 311: UBS Wealth Management, Phoenix, AZ =====
-- 477 Steven Schultz + 573 Stockton Schultz (father/son, The Schultz Group), 1101 Brad
-- Howell (Howell Wealth Consulting Group) — two separate teams sharing the same building.
UPDATE contacts SET
  address = '2575 East Camelback Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor / Portfolio Manager, founder/lead of The Schultz Group, UBS Phoenix (FA since 1981), alongside his son id 573 Stockton Schultz.')), 512)
WHERE id = 477;
UPDATE contacts SET
  address = '2575 East Camelback Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, member of The Schultz Group, UBS Phoenix; is the son of id 477 Steven Schultz.')), 512)
WHERE id = 573;
UPDATE contacts SET
  address = '2575 East Camelback Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, leads Howell Wealth Consulting Group, UBS Phoenix (separate team from The Schultz Group, sharing the same building). Forbes Best-in-State AZ 2025.')), 512)
WHERE id = 1101;
INSERT INTO contact_people (contact_id, name, role)
SELECT 477, x.name, x.role FROM (
  SELECT 'Justin M. Low' AS name, 'Financial Advisor, Senior Portfolio Manager, SVP-Wealth Management, The Schultz Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 477) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 477 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1101, x.name, x.role FROM (
  SELECT 'Matt Ryan' AS name, 'Client Service Associate, Howell Wealth Consulting Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1101) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1101 AND name = x.name);

-- ===== GROUP 312: Obermeyer Wealth Partners, Aspen, CO =====
-- 478 Wally Obermeyer (President and CIO, co-founder)
UPDATE contacts SET
  address = 'Obermeyer Place, 501 Rio Grande Place, Suite 107',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President and Chief Investment Officer (co-founder/partner), Obermeyer Wealth Partners, Aspen CO (~$3.0B AUM; also has Denver, Steamboat, Vail offices).')), 512)
WHERE id = 478;
INSERT INTO contact_people (contact_id, name, role)
SELECT 478, x.name, x.role FROM (
  SELECT 'Tom Obermeyer' AS name, 'CEO (Wally''s brother), Obermeyer Wealth Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 478) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 478 AND name = x.name);

-- ===== GROUP 313: Merrill Wealth Management, Charleston, WV =====
-- 479 Michael Shalhoup — DISCREPANCY: team ("The Shalhoup Group," $1.7B+ AUM, 12-person
-- team) actually operates out of Merrill's NYC flagship office per Forbes; Charleston, WV
-- is only his FINRA-registered branch.
UPDATE contacts SET
  address = '500 Lee Street East',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'NOTE: FINRA-registered branch is this Charleston, WV address, but his team (The Shalhoup Group, ~$1.7B+ AUM, 12-person team, per Forbes 2023/2024) actually operates out of Merrill''s New York City flagship office — treat Charleston as a registration address, not his working office. Senior Financial Advisor/Managing Director.')), 512)
WHERE id = 479;

-- ===== GROUP 314: Hightower Bethesda, Bethesda, MD =====
-- 480 Jeff Leventhal (Managing Director and Partner, co-founder)
UPDATE contacts SET
  address = '7200 Wisconsin Ave, Suite 910',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Partner, co-founded Hightower Bethesda in 2011 (previously SVP of Investments at UBS and Merrill Lynch).')), 512)
WHERE id = 480;
INSERT INTO contact_people (contact_id, name, role)
SELECT 480, x.name, x.role FROM (
  SELECT 'Evan Nowack' AS name, 'Managing Director and Partner, Hightower Bethesda' AS role
  UNION ALL SELECT 'Stephen Rosen', 'Managing Director and Partner (joined 2013), Hightower Bethesda'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 480) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 480 AND name = x.name);

-- ===== GROUP 315: Morgan Stanley Wealth Management, Salt Lake City, UT =====
-- 484 Paul Shoemaker (The Capital Street Group, senior partner)
UPDATE contacts SET
  address = '60 E South Temple, 20th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Portfolio Management Director, Family Wealth Director, senior partner/manager of The Capital Street Group, Morgan Stanley Salt Lake City. Barron''s Top 1,200 2022-2026; Forbes Best-In-State since 2019.')), 512)
WHERE id = 484;
INSERT INTO contact_people (contact_id, name, role)
SELECT 484, x.name, x.role FROM (
  SELECT 'Daniel J. Bryant' AS name, 'Financial Advisor, The Capital Street Group' AS role
  UNION ALL SELECT 'Melissa Hirschi, CFP', 'Financial Advisor, The Capital Street Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 484) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 484 AND name = x.name);

-- ===== GROUP 316: Merrill Wealth Management, Nashville, TN =====
-- 486 Russell Jones — team rebranded from "Klindt, Jones & Robbins" to "Klindt, Jones & Herring"
UPDATE contacts SET
  address = '222 2nd Ave S',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Russ Jones, Managing Director, Wealth Management Advisor, CFP/CPFA, Merrill Nashville. Team rebranded from "Klindt, Jones & Robbins" to "Klindt, Jones & Herring" (Colby Robbins departed, Josh Herring joined).')), 512)
WHERE id = 486;
INSERT INTO contact_people (contact_id, name, role)
SELECT 486, x.name, x.role FROM (
  SELECT 'Eric Klindt, CIMA' AS name, 'Managing Director, Private Wealth Advisor, Klindt, Jones & Herring' AS role
  UNION ALL SELECT 'Josh Herring, CPWA, SE-AWMA', 'Investment Analyst/Advisor, Klindt, Jones & Herring'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 486) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 486 AND name = x.name);

-- ===== GROUP 317: UBS Wealth Management, Lake Oswego, OR =====
-- 487 Edward Lang — DISCREPANCY: team's current office is Portland, OR, not Lake Oswego.
-- 636 Cameron Cheek (Heritage Wealth Management) — confirmed Lake Oswego.
UPDATE contacts SET
  address = '760 SW 9th Ave, Suite 2450, Portland, OR 97205',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'NOTE: CRM lists Lake Oswego, OR, but current team page for Lang Wealth Management / Lang-Vista Group shows this Portland, OR office — may reflect a relocation or rebrand since the CRM record was created. Managing Director, UBS. Forbes Best-in-State Wealth Advisor 2020-2026.')), 512)
WHERE id = 487;
UPDATE contacts SET
  address = '5300 Meadows Rd, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads/co-leads Heritage Wealth Management, UBS Lake Oswego OR. Barron''s Top 1,200 2018-2020, 2025.')), 512)
WHERE id = 636;
INSERT INTO contact_people (contact_id, name, role)
SELECT 636, x.name, x.role FROM (
  SELECT 'Greg Hollingsworth' AS name, 'Team member, Heritage Wealth Management' AS role
  UNION ALL SELECT 'Brandon Hall', 'Team member, Heritage Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 636) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 636 AND name = x.name);

-- ===== GROUP 318: CIBC Private Wealth, Denver, CO =====
-- 488 J Kent Nossaman (head of CIBC PW's U.S. West Region)
UPDATE contacts SET
  address = '100 Saint Paul Street, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, head of CIBC Private Wealth''s U.S. West Region and the Denver office; senior relationship manager (30+ yrs experience, CPA); joined CIBC (via Harris myCFO) in 2005. Barron''s 2025 Top Advisor by State (CO, #11 of 18).')), 512)
WHERE id = 488;
INSERT INTO contact_people (contact_id, name, role)
SELECT 488, x.name, x.role FROM (
  SELECT 'Colleen Harvey, CFA' AS name, 'Team member, CIBC Private Wealth Denver' AS role
  UNION ALL SELECT 'Joseph M. Wittels, CFA', 'Team member, CIBC Private Wealth Denver'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 488) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 488 AND name = x.name);

-- ===== GROUP 319: Abacus Planning Group, Columbia, SC =====
-- 489 Cheryl Holland (Founder and President)
UPDATE contacts SET
  address = '2500 Devine Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and President, Abacus Planning Group, Columbia SC (~$1.7-1.8B AUM; also has a Greenville, SC office). Barron''s Advisor Hall of Fame 2023 (Top 100 Advisor 10 consecutive years); Barron''s top SC advisor 2017, 2018.')), 512)
WHERE id = 489;
INSERT INTO contact_people (contact_id, name, role)
SELECT 489, x.name, x.role FROM (
  SELECT 'Charles Flowers, CFA' AS name, 'Team member, Abacus Planning Group' AS role
  UNION ALL SELECT 'Karlyn Jones, CFP', 'Team member, Abacus Planning Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 489) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 489 AND name = x.name);

-- ===== GROUP 320: J.P. Morgan Wealth Management, Palm Beach Gardens, FL =====
-- 490 Louise Armour (The Armour Bellavia Stuhlman Group), 813 Mark Donohue (The Donohue
-- Group), 962 David Li (The LHX Group) — three separate teams sharing the same building.
UPDATE contacts SET
  address = '3825 PGA Boulevard, Floor 9',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner, heads The Armour Bellavia Stuhlman Group, J.P. Morgan Palm Beach Gardens FL.')), 512)
WHERE id = 490;
UPDATE contacts SET
  address = '3825 PGA Boulevard, Floor 9',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner, founder of The Donohue Group, J.P. Morgan Palm Beach Gardens FL (separate team from id 490 Louise Armour, sharing the same building).')), 512)
WHERE id = 813;
UPDATE contacts SET
  address = '3825 PGA Boulevard, Floor 9',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner, The LHX Group (multi-office team: Boston, DC, Miami, Palm Beach Gardens), J.P. Morgan.')), 512)
WHERE id = 962;
INSERT INTO contact_people (contact_id, name, role)
SELECT 490, x.name, x.role FROM (
  SELECT 'Joseph Bellavia' AS name, 'Managing Director, Wealth Partner, founding member, The Armour Bellavia Stuhlman Group' AS role
  UNION ALL SELECT 'Michael Armour', 'Wealth Advisor, The Armour Bellavia Stuhlman Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 490) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 490 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 813, x.name, x.role FROM (
  SELECT 'Gordon Sommer' AS name, 'Executive Director, Wealth Advisor (partner since 2009), The Donohue Group' AS role
  UNION ALL SELECT 'Butch Massaro', 'VP, Relationship Manager (since 2007), The Donohue Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 813) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 813 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 962, x.name, x.role FROM (
  SELECT 'Michael Parks' AS name, 'Sr. Relationship Manager/COO of team, The LHX Group' AS role
  UNION ALL SELECT 'Kevin Xiong', 'Head of Client Strategy, The LHX Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 962) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 962 AND name = x.name);
