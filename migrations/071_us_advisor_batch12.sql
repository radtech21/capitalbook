-- US Financial Advisor enrichment, batch 12 (21 contacts / 20 groups).
--
-- One phone-number data error corrected: 366 Charles C. Zhang's CRM
-- phone (810) is a Flint, MI area code with no connection to Zhang
-- Financial's Portage, MI (Kalamazoo-area) office — same pattern as
-- prior out-of-region area-code errors in this CRM.
--
-- Cross-reference confirmed: 364 Erin Scannell (Ameriprise Mercer
-- Island) and 365 Randall Linde (Ameriprise Renton) are Co-CEOs of the
-- same "Heritage Wealth Advisors" practice, operating from two
-- different WA branch offices.
--
-- Investigated but ruled negative: 361 Scott Mahoney and 977 Darren
-- Hugo (Morgan Stanley Morristown, NJ) share a building (340 Mount
-- Kemble Avenue) with The Ricca Group (batch 9, contacts 252/418), but
-- are confirmed to be two entirely separate teams/business lines, not
-- colleagues of Ricca's team or each other.

-- ===== GROUP 221: Merrill Private Wealth Management, Fairfield, CT =====
-- 348 Thomas Vacheron (Vacheron DiSabato & Associates)
UPDATE contacts SET
  address = '1499 Post Rd, #14',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Co-Managing Director of Vacheron DiSabato & Associates, Merrill Fairfield CT (40+ year Merrill career). Barron''s Top 1,200 every year 2014-2025; Forbes America''s Top 250 Wealth Advisors 2016-2025.')), 512)
WHERE id = 348;
INSERT INTO contact_people (contact_id, name, role)
SELECT 348, x.name, x.role FROM (
  SELECT 'Bob DiSabato' AS name, 'Co-Managing Director, Vacheron DiSabato & Associates' AS role
  UNION ALL SELECT 'Jack Vacheron, CFP, CRPC', 'Wealth Management Advisor/Partner, Vacheron DiSabato & Associates'
  UNION ALL SELECT 'Peter Smith, CFA, CRPC', 'Private Wealth Senior Investment Manager, VP, Vacheron DiSabato & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 348) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 348 AND name = x.name);

-- ===== GROUP 222: Morgan Stanley Private Wealth Management, Indianapolis, IN — 317-264-2600 =====
-- 349 John Perry (Perry Wealth Management)
UPDATE contacts SET
  address = '800 E 96th Street, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Management, Financial Advisor, Family Wealth Director, leads Perry Wealth Management, Morgan Stanley Indianapolis. Chairman''s Club (top 3%); team #4 Best-In-State Indiana 2025.')), 512)
WHERE id = 349;
INSERT INTO contact_people (contact_id, name, role)
SELECT 349, x.name, x.role FROM (
  SELECT 'Lee A. Sperling' AS name, 'Team member (joined ~2021 from J.P. Morgan Private Bank), Perry Wealth Management' AS role
  UNION ALL SELECT 'Josh Miller', 'Business Development Associate (joined 2016), Perry Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 349) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 349 AND name = x.name);

-- ===== GROUP 223: Neuberger Berman, Dallas, TX =====
-- 350 Richard Szelc — CRM phone was NB's NY HQ switchboard; confirmed dual-registered
-- NY/TX but Dallas-based per all current bios/press.
UPDATE contacts SET
  address = '200 Crescent Court, 18th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Advisor, Neuberger Berman Dallas (joined 2000), leads a team managing ~$1.6-1.7B in assets. #1 Texas Barron''s Top 1,200 for 6 consecutive years through 2021. Note: CRM phone (212) 476-9000 is NB''s NY HQ switchboard — he is dual-registered NY/TX but based in Dallas per all current bios.')), 512)
WHERE id = 350;
INSERT INTO contact_people (contact_id, name, role)
SELECT 350, x.name, x.role FROM (
  SELECT 'John Whitehead, CFA' AS name, 'Senior Vice President/Wealth Advisor, Neuberger Berman Dallas' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 350) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 350 AND name = x.name);

-- ===== GROUP 224: UBS Private Wealth Management, Bellevue, WA =====
-- 351 Michael Matthews (The Matthews Group, founder)
UPDATE contacts SET
  address = '225 108th Avenue NE, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor/Managing Director, founder of The Matthews Group, UBS Bellevue. #1 Washington Forbes/SHOOK 2025; Barron''s Top 1,200.')), 512)
WHERE id = 351;
INSERT INTO contact_people (contact_id, name, role)
SELECT 351, x.name, x.role FROM (
  SELECT 'Tyler Matthews' AS name, 'Team member, The Matthews Group' AS role
  UNION ALL SELECT 'Michael Bockner, CEPA', 'Senior VP-Wealth Management, Financial Advisor, The Matthews Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 351) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 351 AND name = x.name);

-- ===== GROUP 225: Alex. Brown | Raymond James, Winston-Salem, NC =====
-- 352 Lee Bryan III (The Bryan Zaks Team)
UPDATE contacts SET
  address = '100 N Main St, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Francis Lee Bryan III, Managing Director, Alex. Brown Winston-Salem (with firm/predecessor entities since 1987), leads The Bryan Zaks Team. Barron''s and Forbes Best-in-State each of the last 5 years through 2025.')), 512)
WHERE id = 352;
INSERT INTO contact_people (contact_id, name, role)
SELECT 352, x.name, x.role FROM (
  SELECT 'Jason Zaks' AS name, 'Co-lead/Managing Director, The Bryan Zaks Team' AS role
  UNION ALL SELECT 'Lee Bryan IV', 'Team member, The Bryan Zaks Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 352) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 352 AND name = x.name);

-- ===== GROUP 226: Neuberger Berman, Chicago, IL =====
-- 354 Brian Hahn
UPDATE contacts SET
  address = '190 S. LaSalle Street, 24th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Brian E. Hahn, Managing Director, Senior Wealth Advisor, Neuberger Berman Chicago (with firm since 1995). #12 Illinois Barron''s Top 1,200 2025; #5 Illinois-Chicago Forbes Best-In-State 2025. Note: NB signed a Jan 2025 lease to relocate its Chicago office to 191 N. Wacker Drive — this address may be superseded. No named team members found.')), 512)
WHERE id = 354;

-- ===== GROUP 227: UBS Private Wealth Management, St. Louis, MO =====
-- 355 Bud King (King Wealth Management)
UPDATE contacts SET
  address = '8027 Forsyth Blvd., 10th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Bernard "Bud" King, CFA, Managing Director-Investments, Private Wealth Advisor, leads King Wealth Management, UBS St. Louis (branded office is technically in Clayton, MO; with UBS 38+ years). Barron''s Top 1,200 2014-2024.')), 512)
WHERE id = 355;
INSERT INTO contact_people (contact_id, name, role)
SELECT 355, x.name, x.role FROM (
  SELECT 'Altaf Merchant' AS name, 'Wealth Advisor, King Wealth Management' AS role
  UNION ALL SELECT 'Leo Schmid', 'Financial Advisor, King Wealth Management'
  UNION ALL SELECT 'Timothy J. Torretta, CFP, CEPA', 'Financial Advisor, King Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 355) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 355 AND name = x.name);

-- ===== GROUP 228: Merrill Private Wealth Management, Kansas City, MO =====
-- 356 James Hise (The Renz Hise Lowry Group, formerly Hise Lowry Group)
UPDATE contacts SET
  address = '4801 Main St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name James T. Hise, Private Wealth Advisor, Merrill Kansas City (28+ years in industry); team now branded The Renz Hise Lowry Group (formerly Hise Lowry Group). #1 Missouri Forbes Best-in-State Wealth Management Teams 2024-2026.')), 512)
WHERE id = 356;
INSERT INTO contact_people (contact_id, name, role)
SELECT 356, x.name, x.role FROM (
  SELECT 'Steve Renz, CPFA' AS name, 'Advisor/Team lead, The Renz Hise Lowry Group' AS role
  UNION ALL SELECT 'Michael Lowry', 'Advisor, The Renz Hise Lowry Group'
  UNION ALL SELECT 'Brian Piel', 'Financial Advisor (with Merrill since Jan 2019), The Renz Hise Lowry Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 356) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 356 AND name = x.name);

-- ===== GROUP 229: Rockefeller Capital Management, Franklin, TN =====
-- 358 John Montgomery — CRM phone was Rockefeller's NY HQ line; confirmed relocated from
-- Atlanta (Montgomery Levin Group) to TN registration Feb 2024.
UPDATE contacts SET
  address = '2550 Meridian Blvd, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: full name John Robert Montgomery, Managing Director & Senior Portfolio Manager. Previously co-led the Montgomery Levin Group out of Rockefeller''s Atlanta, GA office (moved from UBS in 2021 with partner Andrew Levin); now registered with Rockefeller Capital Management in Franklin/Nashville, TN since Feb 22, 2024. #8 Tennessee/Nashville Forbes Best-in-State 2026. CRM phone (212) 549-5100 is Rockefeller''s NY HQ switchboard, not this local office.')), 512)
WHERE id = 358;

-- ===== GROUP 230: Creative Planning, Orange, CT =====
-- 360 Ken Steeves — no dedicated Orange CT office found; likely serviced from nearby Milford, CT
UPDATE contacts SET
  address = '472 Wheelers Farm Rd, Suite 101, Milford, CT 06461',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner/Managing Director, Creative Planning. No dedicated "Orange, CT" office found; nearest Creative Planning branch serving this area is Milford, CT (address applied here as best estimate). Barron''s 2025 Top 1,200 (2nd consecutive year); Forbes 2025 Best-In-State CT (#13).')), 512)
WHERE id = 360;

-- ===== GROUP 231: Morgan Stanley Private Wealth Management, Morristown, NJ =====
-- 361 Scott Mahoney (The Mahoney Team), 977 Darren Hugo (The Meridian Group) — same
-- building as The Ricca Group (batch 9, ids 252/418) but confirmed as two entirely
-- separate, unrelated teams/business lines.
UPDATE contacts SET
  address = '340 Mount Kemble Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Managing Director, Private Wealth Advisor, CPWA, leads The Mahoney Team, Morgan Stanley PWM Morristown NJ. #1 Forbes 2026 Best-In-State NJ. Note: shares a building with The Ricca Group (batch 9) but is a separate, unrelated team.')), 512)
WHERE id = 361;
UPDATE contacts SET
  address = '340 Mount Kemble Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Darren L. Hugo, Managing Director, Private Wealth Advisor/Family Wealth Director, CFP, leads The Meridian Group, Morgan Stanley PWM Morristown NJ (career began 1989). #14 Forbes 2026 Best-In-State NJ. Note: shares a building with The Ricca Group (batch 9) and id 361 Scott Mahoney''s Mahoney Team, but is a separate, unrelated team.')), 512)
WHERE id = 977;
INSERT INTO contact_people (contact_id, name, role)
SELECT 361, x.name, x.role FROM (
  SELECT 'Oliver Kearns' AS name, 'Portfolio Management Associate, The Mahoney Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 361) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 361 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 977, x.name, x.role FROM (
  SELECT 'Gerald E. Crum Jr.' AS name, 'Team member, The Meridian Group' AS role
  UNION ALL SELECT 'Chip Wieczorek, CFP', 'Wealth Advisor, The Meridian Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 977) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 977 AND name = x.name);

-- ===== GROUP 232: Merrill Private Wealth Management, Brentwood, TN =====
-- 362 Matthew Miller (The Miller Group)
UPDATE contacts SET
  address = '201 Franklin Rd, Suite 250',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Private Wealth Advisor, CPWA, leads The Miller Group, Merrill Brentwood TN. Barron''s Top 1,200 2023; #5 Forbes Best-In-State 2025.')), 512)
WHERE id = 362;
INSERT INTO contact_people (contact_id, name, role)
SELECT 362, x.name, x.role FROM (
  SELECT 'Shane Dempster' AS name, 'Wealth Management Specialist (joined 2021), The Miller Group' AS role
  UNION ALL SELECT 'Mallory Neal, CPA', 'Team member, The Miller Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 362) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 362 AND name = x.name);

-- ===== GROUP 233: Requisite Capital Management, Dallas, TX =====
-- 363 Doug John (Founder/Managing Partner)
UPDATE contacts SET
  address = '4001 Maple Avenue, Suite 290',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Douglas G. John, CFP, Founder/Managing Partner, Requisite Capital Management, Dallas (co-founded 2017 with Bryn Talkington after both left UBS). Barron''s Top 1,200 Advisors 2021-2025.')), 512)
WHERE id = 363;
INSERT INTO contact_people (contact_id, name, role)
SELECT 363, x.name, x.role FROM (
  SELECT 'Bryn Talkington' AS name, 'Founder/Managing Partner, Requisite Capital Management' AS role
  UNION ALL SELECT 'Ryan Dilworth', 'Managing Director, Director of Investments, Requisite Capital Management'
  UNION ALL SELECT 'Rachel Niemuth', 'Executive Director, Head of Private Client Services, Requisite Capital Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 363) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 363 AND name = x.name);

-- ===== GROUP 234: Ameriprise Financial, Mercer Island, WA =====
-- 364 Erin Scannell — cross-referenced Co-CEO with id 365 Randall Linde (Renton, WA branch)
UPDATE contacts SET
  address = '2630 77th Ave SE, Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and Co-CEO, Heritage Wealth Advisors (Ameriprise practice), Mercer Island WA. Cross-referenced: co-CEO alongside id 365 Randall Linde, who operates from Heritage''s Renton, WA branch. #1 Washington Forbes (3rd consecutive year as of 2024).')), 512)
WHERE id = 364;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-CEO, Heritage Wealth Advisors (Ameriprise practice), based at the firm''s Renton, WA branch. Cross-referenced: co-CEO alongside id 364 Erin Scannell (Mercer Island, WA branch), same firm.')), 512)
WHERE id = 365;
INSERT INTO contact_people (contact_id, name, role)
SELECT 364, x.name, x.role FROM (
  SELECT 'Kathy Hobart, CIMA' AS name, 'Team member, Heritage Wealth Advisors' AS role
  UNION ALL SELECT 'Steve Bealey, CFP', 'Team member, Heritage Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 364) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 364 AND name = x.name);

-- ===== GROUP 235: Ameriprise Financial, Renton, WA =====
-- 365 Randall Linde (see cross-reference above)
UPDATE contacts SET
  address = '126 Wells Ave S',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Randall S. "Randy" Linde, CFP/CRPC/AAMS, 33+ years experience. Forbes Best-in-State 2024-2026; Barron''s Hall of Fame 2020.')), 512)
WHERE id = 365;
INSERT INTO contact_people (contact_id, name, role)
SELECT 365, x.name, x.role FROM (
  SELECT 'Alan Blinn' AS name, 'Team member, Heritage Wealth Advisors (Renton branch)' AS role
  UNION ALL SELECT 'Jim Bennett', 'Team member, Heritage Wealth Advisors (Renton branch)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 365) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 365 AND name = x.name);

-- ===== GROUP 236: Zhang Financial, Portage, MI =====
-- 366 Charles C. Zhang (Founder/President)
UPDATE contacts SET
  address = '5931 Oakland Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (810) 220-6322 is a Flint-area code with no connection to Zhang Financial''s Portage, MI (Kalamazoo-area) office; correct number is (269) 385-5888. Confirmed current — Founder (2012) and President; #1 Michigan Barron''s Top Advisors 14 consecutive years (2013-2026); #5 Forbes 2026 America''s Top Wealth Advisors.')), 512)
WHERE id = 366;
INSERT INTO contact_people (contact_id, name, role)
SELECT 366, x.name, x.role FROM (
  SELECT 'Lynn Chen-Zhang' AS name, 'CEO & Chief Compliance Officer (also his wife), Zhang Financial' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 366) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 366 AND name = x.name);

-- ===== GROUP 237: Ameriprise Financial, Pittsburgh, PA =====
-- 367 Andrew Jugan (Premier Wealth Partners)
UPDATE contacts SET
  address = '1570 Omega Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor & Managing Partner, CFP/CRPC, leads Premier Wealth Partners, Ameriprise Pittsburgh. Forbes "Top Next-Generation Wealth Advisors"; #2 Forbes 2026 Best-In-State; team on Barron''s Top 250 Private Wealth Management Teams 2024.')), 512)
WHERE id = 367;
INSERT INTO contact_people (contact_id, name, role)
SELECT 367, x.name, x.role FROM (
  SELECT 'Brian Stumpf' AS name, 'Team member, Premier Wealth Partners' AS role
  UNION ALL SELECT 'Jeffery Suhayda', 'Team member, Premier Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 367) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 367 AND name = x.name);

-- ===== GROUP 238: Cassaday & Co., McLean, VA =====
-- 368 Stephan Cassaday (Founder, Chairman & CEO)
UPDATE contacts SET
  address = '8180 Greensboro Dr., Suite 1180',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Steve (Stephan) Cassaday, Founder, Chairman & CEO, Cassaday & Company, McLean VA (31+ years leading the firm). #1 Financial Advisor in Virginia, Barron''s, 9 consecutive years.')), 512)
WHERE id = 368;
INSERT INTO contact_people (contact_id, name, role)
SELECT 368, x.name, x.role FROM (
  SELECT 'Waleed Bississo' AS name, 'COO, Cassaday & Company' AS role
  UNION ALL SELECT 'Justin Harris', 'Senior Partner, Cassaday & Company'
  UNION ALL SELECT 'Christopher Krell', 'Senior Partner, Cassaday & Company'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 368) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 368 AND name = x.name);

-- ===== GROUP 239: UBS Wealth Management, Madison, WI =====
-- 369 Jason Maas (The Burish Group)
UPDATE contacts SET
  address = '8020 Excelsior Drive, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director-Wealth Management, Senior Portfolio Manager at The Burish Group, UBS Madison; business partner to Andrew Burish since 2000, reportedly positioned to succeed Burish as team lead over the next five years.')), 512)
WHERE id = 369;
INSERT INTO contact_people (contact_id, name, role)
SELECT 369, x.name, x.role FROM (
  SELECT 'Andrew D. Burish' AS name, 'Financial Advisor, Managing Director, founder/senior partner, The Burish Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 369) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 369 AND name = x.name);

-- ===== GROUP 240: Venture Visionary Partners, Sylvania, OH =====
-- 370 Craig Findley (Founder, Chairman/CEO)
UPDATE contacts SET
  address = '5520 Monroe St, STE B',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Chairman/CEO, Venture Visionary Partners, Sylvania OH (founded 2019 after prior role as Managing Director at UBS Wealth Management); firm now ~$5.1B AUM, #1 Ohio / #16 nationally Forbes Top RIA 2025.')), 512)
WHERE id = 370;
INSERT INTO contact_people (contact_id, name, role)
SELECT 370, x.name, x.role FROM (
  SELECT 'Brian J. Funkhouser' AS name, 'Partner & Managing Director, Investments, Venture Visionary Partners' AS role
  UNION ALL SELECT 'Robert W. Retzloff', 'Partner & Chief Operating Officer, Venture Visionary Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 370) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 370 AND name = x.name);
