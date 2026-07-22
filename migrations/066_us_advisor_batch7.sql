-- US Financial Advisor enrichment, batch 7 (29 contacts / 20 groups).
--
-- Firm-change corrections: 185 David Hou's firm Evoke Advisors was
-- acquired by MAI Capital Management (deal closed ~Oct/Nov 2025) — he
-- now heads MAI's UHNW division, branded "Evoke by MAI." 200 Barry
-- Garber retired from Alex. Brown/Raymond James in 2025; his team
-- continues under his son Zachary Garber.
--
-- Neuberger Berman's shared (212) 476-9000 line is confirmed to be the
-- firm's general HQ switchboard (1290 Avenue of the Americas), spanning
-- at least 5 separate, unbranded Private Wealth practices rather than
-- one team.

-- ===== GROUP 121: Evoke Advisors (now MAI Capital Management), Los Angeles, CA =====
-- 185 David Hou
UPDATE contacts SET
  firm = 'MAI Capital Management (Evoke by MAI)',
  title = 'Managing Partner, UHNW Division (Evoke by MAI)',
  address = '10635 Santa Monica Blvd, Suite 240',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: Evoke Advisors was acquired by MAI Capital Management (deal closed ~Oct/Nov 2025); David Hou continues as Managing Partner heading MAI''s UHNW division, branded "Evoke by MAI." Named to Barron''s Top 1,500 Financial Advisors by State 2026 and Forbes Best-in-State.')), 512)
WHERE id = 185;

-- ===== GROUP 122: Morgan Stanley Private Wealth Management, Houston, TX =====
-- 186 Brent Anderson (Anderson Sheen Team), 810 David Novelli (Novelli Vander Voort & Burkett Group)
UPDATE contacts SET
  address = '845 Texas Ave, Suite 1810',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads/co-leads the Anderson Sheen Team (with Michael Sheen), Morgan Stanley PWM Houston. Forbes Best-in-State Wealth Management Teams (Texas-South) 2025.')), 512)
WHERE id = 186;
UPDATE contacts SET
  address = '845 Texas Ave, Suite 1810',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Senior Portfolio Management Director, CFP, leads The Novelli, Vander Voort & Burkett Group (formerly The Novelli Group), Morgan Stanley PWM Houston. Forbes 2026 Best-in-State Wealth Management Teams.')), 512)
WHERE id = 810;
INSERT INTO contact_people (contact_id, name, role)
SELECT 186, x.name, x.role FROM (
  SELECT 'Michael Sheen' AS name, 'Co-lead, Anderson Sheen Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 186) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 186 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 810, x.name, x.role FROM (
  SELECT 'John Colvin Vander Voort' AS name, 'Private Wealth Advisor, Novelli Vander Voort & Burkett Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 810) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 810 AND name = x.name);

-- ===== GROUP 123: Neuberger Berman, New York, NY =====
-- 187 Stephanie Stiefel, 272 Seth Finkel, 373 Holly Newman Kroft, 567 William Peterson,
-- 801 Virginia Guy, 1057 Roger Tulcin, 1135 Peter Arbes — the CRM phone (212) 476-9000 is
-- Neuberger Berman's general HQ switchboard, spanning several separate, unbranded PW practices.
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, CPA, Head of Client Development for The Straus Group (equity-investing team within NB Private Asset Management, est. 1967), Neuberger Berman NY.')), 512)
WHERE id = 187;
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Wealth Advisor, Neuberger Berman NY, leads own unbranded team (~$3.1B AUM); team ranked Barron''s 2025 Top 250 Private Wealth Management Teams.')), 512)
WHERE id = 272;
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Wealth Advisor, Neuberger Berman NY, leads own dedicated team (no public team brand name found).')), 512)
WHERE id = 373;
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Wealth Advisor, Neuberger Berman NY, leads own unbranded team, serves 3 generations of clients.')), 512)
WHERE id = 567;
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, Neuberger Berman NY; appears to operate individually with unnamed support staff, no branded team name found.')), 512)
WHERE id = 801;
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, Neuberger Berman NY, partners with Jordan Lichtenberg (VP); no formal branded team name found.')), 512)
WHERE id = 1057;
UPDATE contacts SET
  address = '1290 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, Neuberger Berman NY; operates individually with unnamed support staff, no branded team name found.')), 512)
WHERE id = 1135;
INSERT INTO contact_people (contact_id, name, role)
SELECT 187, x.name, x.role FROM (
  SELECT 'Marvin C. Schwartz' AS name, 'Senior Portfolio Manager, The Straus Group' AS role
  UNION ALL SELECT 'Taylor L. Glasebrook', 'Associate Portfolio Manager/Senior Research Analyst, The Straus Group'
  UNION ALL SELECT 'Charlie W. Schwartz', 'SVP, Associate Portfolio Manager, The Straus Group'
  UNION ALL SELECT 'Joshua A. Bronstein, CFA', 'VP, Wealth Advisor, The Straus Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 187) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 187 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1057, x.name, x.role FROM (
  SELECT 'Jordan Lichtenberg' AS name, 'Vice President, partners with Roger Tulcin' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1057) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1057 AND name = x.name);

-- ===== GROUP 124: Morgan Stanley Private Wealth Management, Atlanta, GA =====
-- 188 James Hansberger (The Hansberger Group)
UPDATE contacts SET
  address = '3280 Peachtree Rd NE, Suite 2000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founder/senior partner, The Hansberger Group, Morgan Stanley PWM Atlanta; ~50 years with Morgan Stanley, longtime Chairman''s Club member. #2 Georgia-Atlanta (Private Wealth) Forbes Best-in-State Apr 2026.')), 512)
WHERE id = 188;
INSERT INTO contact_people (contact_id, name, role)
SELECT 188, x.name, x.role FROM (
  SELECT 'Morton "Morty" Levey' AS name, 'CPA, team member (holistic planning), The Hansberger Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 188) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 188 AND name = x.name);

-- ===== GROUP 125: Merrill Wealth Management, Aspen, CO =====
-- 189 Donna Di Ianni (Di Ianni & Associates)
UPDATE contacts SET
  address = '301 E. Hopkins Ave.',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, Portfolio Manager, practice name Di Ianni & Associates, Merrill Aspen. With Merrill 38+ years; opened the Aspen branch in 2000. Multiple Barron''s "Top Women Advisors" mentions. No other named team members found.')), 512)
WHERE id = 189;

-- ===== GROUP 126: Merrill Wealth Management, Punta Gorda, FL =====
-- 191 Robert Dwyer (The Casanueva Group)
UPDATE contacts SET
  address = '1190 W. Marion Ave.',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, CPWA, CIMA, C(k)P, part of The Casanueva Group – Casanueva, Dwyer, Hynes, Kowadla, Merrill Punta Gorda; joined Merrill 1996. Note: this practice spans multiple SW Florida offices (Punta Gorda, Sarasota, Venice, Lakewood Ranch, Naples).')), 512)
WHERE id = 191;
INSERT INTO contact_people (contact_id, name, role)
SELECT 191, x.name, x.role FROM (
  SELECT 'Dominic Casanueva' AS name, 'Managing Director, Resident Director, The Casanueva Group' AS role
  UNION ALL SELECT 'Richard Hynes', 'Senior Financial Advisor, Senior Vice President, The Casanueva Group'
  UNION ALL SELECT 'Ryan Kowadla', 'Wealth Management Advisor, Senior Vice President, The Casanueva Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 191) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 191 AND name = x.name);

-- ===== GROUP 127: Morgan Stanley | Graystone Consulting, Tampa, FL =====
-- 192 Adam Palmer, 325 Scott Owens
UPDATE contacts SET
  address = '100 N Tampa St, Suite 3000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Graystone Consulting Tampa. Barron''s Top 1,200 (2023); Forbes Best-In-State Wealth Advisors 2025/2026 (#30).')), 512)
WHERE id = 192;
UPDATE contacts SET
  address = '100 N Tampa St, Suite 3000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Institutional Consultant, CFA/CIMA, Graystone Consulting Tampa. Barron''s Top 100 Institutional Consulting Teams (2026); #25 Florida-Tampa Area Forbes Apr 2025.')), 512)
WHERE id = 325;
INSERT INTO contact_people (contact_id, name, role)
SELECT 192, x.name, x.role FROM (
  SELECT 'Theodore "TJ" Loew, CFA, CRPS' AS name, 'Financial Advisor, Graystone Consulting Tampa (with team since 2008)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 192) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 192 AND name = x.name);

-- ===== GROUP 128: Merrill Wealth Management, Latham, NY =====
-- 193 Michael Chrys (The Chrys Group)
UPDATE contacts SET
  address = '26 Century Hill Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads The Chrys Group, Merrill Latham NY; in securities business since 1981. Barron''s Top 1,200 for 8 consecutive years incl. 2024; #10 Forbes 2026 NY Best-in-State. No other named team members found.')), 512)
WHERE id = 193;

-- ===== GROUP 129: Morgan Stanley Private Wealth Management, Birmingham, MI =====
-- 194 Brian Brice, 197 Timothy Brice (The Brice Group)
UPDATE contacts SET
  address = '34901 Woodward Ave, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner/Head of The Brice Group, Morgan Stanley PWM Birmingham MI, CIMA, 30+ yrs experience. #5 Michigan-Detroit Area (Private Wealth) Forbes Apr 2026.')), 512)
WHERE id = 194;
UPDATE contacts SET
  address = '34901 Woodward Ave, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — co-leads The Brice Group with id 194 Brian Brice (relative), Institutional Consulting Director for Graystone Consulting, Morgan Stanley Birmingham MI. Barron''s Top 1,200 Financial Advisors 2025.')), 512)
WHERE id = 197;
INSERT INTO contact_people (contact_id, name, role)
SELECT 194, x.name, x.role FROM (
  SELECT 'Glen Young, CFP' AS name, 'Senior VP, Institutional Consultant & Financial Advisor, The Brice Group' AS role
  UNION ALL SELECT 'William A. LaRosa', 'Senior VP, Wealth Management Advisor, CFP/CRPC, The Brice Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 194) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 194 AND name = x.name);

-- ===== GROUP 130: The Bahnsen Group, Newport Beach, CA =====
-- 195 David Bahnsen (founder)
UPDATE contacts SET
  address = '520 Newport Center Drive, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Managing Partner & Chief Investment Officer, The Bahnsen Group, Newport Beach.')), 512)
WHERE id = 195;
INSERT INTO contact_people (contact_id, name, role)
SELECT 195, x.name, x.role FROM (
  SELECT 'Joseph Klein' AS name, 'President, The Bahnsen Group' AS role
  UNION ALL SELECT 'Luis Garcia', 'Chief Financial Officer, The Bahnsen Group'
  UNION ALL SELECT 'Brian T. Szytel, CFP, AIF', 'Managing Director, Partner (leads Palm Beach, FL office), The Bahnsen Group'
  UNION ALL SELECT 'Trevor Cummings', 'Head of Private Wealth Advisor Group, The Bahnsen Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 195) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 195 AND name = x.name);

-- ===== GROUP 131: Morgan Stanley | Graystone Consulting, Scranton, PA =====
-- 196 Andrew Wilshinsky (The Wilshinsky Group)
UPDATE contacts SET
  address = '111 North Washington Avenue, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Institutional Consulting Director & Corporate Retirement Director, senior partner of The Wilshinsky Group, Graystone Consulting Scranton (with firm since 1999; team also has a New York, NY location).')), 512)
WHERE id = 196;
INSERT INTO contact_people (contact_id, name, role)
SELECT 196, x.name, x.role FROM (
  SELECT 'Andrew Bernstein' AS name, 'Senior VP, Institutional Consulting Analyst & Portfolio Management Associate Director, The Wilshinsky Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 196) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 196 AND name = x.name);

-- ===== GROUP 132: TFO Wealth Partners, Maumee, OH =====
-- 198 Brady Fineske
UPDATE contacts SET
  address = '1440 Arrowhead Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President and Family Wealth Strategist, CFP, TFO Wealth Partners, Maumee OH. Named to Barron''s 2024 Top 1,200 Advisors.')), 512)
WHERE id = 198;
INSERT INTO contact_people (contact_id, name, role)
SELECT 198, x.name, x.role FROM (
  SELECT 'Christopher Erblich' AS name, 'Principal, TFO Wealth Partners' AS role
  UNION ALL SELECT 'Jim Herrick', 'Principal, TFO Wealth Partners'
  UNION ALL SELECT 'Adele Sobieszczanski', 'Principal, TFO Wealth Partners'
  UNION ALL SELECT 'Cleves Delp', 'Principal, TFO Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 198) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 198 AND name = x.name);

-- ===== GROUP 133: Wells Fargo Advisors, Washington, DC =====
-- 199 Frederick "Tripp" Shreves III (The Monument Group)
UPDATE contacts SET
  address = '1133 Connecticut Ave NW, 9th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Frederick D. Shreves III, goes professionally by "Tripp Shreves," Senior Financial Advisor / lead institutional consultant, The Monument Group, Wells Fargo Advisors, Washington DC. Holds CIMA.')), 512)
WHERE id = 199;
INSERT INTO contact_people (contact_id, name, role)
SELECT 199, x.name, x.role FROM (
  SELECT 'Gregory Keil' AS name, 'Managing Director, Investment Officer, The Monument Group' AS role
  UNION ALL SELECT 'Matthew Carroccio', 'Financial Advisor, The Monument Group'
  UNION ALL SELECT 'Lisa Elbert', 'Senior Vice President, Investments, Financial Advisor, The Monument Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 199) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 199 AND name = x.name);

-- ===== GROUP 134: Alex. Brown | Raymond James, Hunt Valley, MD =====
-- 200 Barry Garber — RETIRED 2025, team continues under his son Zachary Garber
UPDATE contacts SET
  title = 'Founding Managing Director (Retired 2025)',
  address = '226 Schilling Circle, Suite 270',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: retired in 2025 after ~32-35 years (career started 1991 at Alex. Brown & Sons); the Garber Wealth Management Team continues at Alex. Brown, Hunt Valley MD under his son and successor Zachary (Zack) Garber, CFA. Barry retains an outside role as Investment Committee Chair, USM Foundation.')), 512)
WHERE id = 200;
INSERT INTO contact_people (contact_id, name, role)
SELECT 200, x.name, x.role FROM (
  SELECT 'Zachary Garber, CFA' AS name, 'Managing Director, son/successor, Garber Wealth Management Team' AS role
  UNION ALL SELECT 'Christopher Conway, CFP', 'Certified Financial Planner, Garber Wealth Management Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 200) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 200 AND name = x.name);

-- ===== GROUP 135: Morgan Stanley | Graystone Consulting, Portland, OR =====
-- 201 Joshua Ulmer (Graystone Consulting – Pacific Mountain)
UPDATE contacts SET
  address = '760 SW 9th Ave, #2100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Institutional Consulting Director, CFA, CIMA, CRPS, leads Graystone Consulting – Pacific Mountain team, Portland OR. Barron''s Top 1,200 Financial Advisors 2016-2025; PLANADVISER Top 100 Retirement Plan Advisers 2017-2025.')), 512)
WHERE id = 201;
INSERT INTO contact_people (contact_id, name, role)
SELECT 201, x.name, x.role FROM (
  SELECT 'Brian Holmes' AS name, 'Assistant Vice President, Institutional Consulting Associate, Graystone Consulting Pacific Mountain' AS role
  UNION ALL SELECT 'Brian Murphy', 'Vice President, Relationship Manager, Graystone Consulting Pacific Mountain'
  UNION ALL SELECT 'Gregory Touchette', 'Institutional Consulting Analyst, Graystone Consulting Pacific Mountain'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 201) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 201 AND name = x.name);

-- ===== GROUP 136: UBS Wealth Management, Stamford, CT =====
-- 202 Frank Lockwood
UPDATE contacts SET
  address = '600 Washington Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, UBS Stamford; 30 years in industry, focuses on UHNW capital preservation, fixed income, estate planning. Barron''s Top 1,500 Financial Advisor 2026; Forbes Best-in-State 2026; UBS Wealth Management President''s Council 2025.')), 512)
WHERE id = 202;

-- ===== GROUP 137: CIBC Private Wealth, Houston, TX =====
-- 203 Bas Solleveld
UPDATE contacts SET
  address = '11 Greenway Plaza, Suite 2625',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Head of Texas / Senior Relationship Manager, CIBC Private Wealth (leads Austin, Dallas, Houston teams); joined Houston office 2012. #15 of 90 Texas advisors, Barron''s 2025 Top Advisor Rankings by State. No team members reliably confirmed.')), 512)
WHERE id = 203;

-- ===== GROUP 138: RBC Wealth Management, Nashville, TN =====
-- 208 Brett Bartman (Bartman Capital)
UPDATE contacts SET
  address = '818 18th Ave S, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Bartman Capital practice, RBC Wealth Management Nashville; with RBC since 2002. Confirmed via RBC''s 2026 newsroom releases (Barron''s Top 1,500, Forbes Best-in-State, AdvisorHub). Note: current office phone found is (615) 928-9510, differs from CRM''s (615) 690-3900; also a same-named Beverly Hills, CA advisor appeared in searches but is not corroborated as the same person by RBC''s own materials.')), 512)
WHERE id = 208;

-- ===== GROUP 139: Compass Capital Management, Minneapolis, MN =====
-- 209 Charlie Kelley (founder)
UPDATE contacts SET
  address = '706 2nd Avenue South, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Principal and Senior Portfolio Manager, CFA, Compass Capital Management, Minneapolis; founded firm 1988, remains on investment committee.')), 512)
WHERE id = 209;
INSERT INTO contact_people (contact_id, name, role)
SELECT 209, x.name, x.role FROM (
  SELECT 'Christopher Kelley, CFA, CAIA' AS name, 'CEO & Senior Portfolio Manager, Compass Capital Management' AS role
  UNION ALL SELECT 'Phil Stern, CAIA', 'President, Compass Capital Management'
  UNION ALL SELECT 'Maren Lapham', 'Head of Marketing & Business Development, Compass Capital Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 209) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 209 AND name = x.name);

-- ===== GROUP 140: Morgan Stanley Wealth Management, Palo Alto, CA =====
-- 210 Daniel Murphy (The Palo Alto Group / Graystone)
UPDATE contacts SET
  address = '1400 Page Mill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Daniel W. Murphy, Managing Director, Financial Advisor, leads The Palo Alto Group (Graystone Consulting), Morgan Stanley Palo Alto. Barron''s Top 1,200 Financial Advisors (State-by-State) through 2025. Note: some sources tag his office as Menlo Park, CA — treated as the same person/practice.')), 512)
WHERE id = 210;
INSERT INTO contact_people (contact_id, name, role)
SELECT 210, x.name, x.role FROM (
  SELECT 'Tim Skelly' AS name, 'Managing Director, Institutional Consulting Director, founding partner, The Palo Alto Group' AS role
  UNION ALL SELECT 'Mark T. Curtis', 'Managing Director, Investments & Wealth Management, The Palo Alto Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 210) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 210 AND name = x.name);
