-- US Financial Advisor enrichment, batch 23 (23 contacts / 20 groups).
--
-- Firm-change correction: 710 Raymond Chase departed UBS Private
-- Wealth Management (Florham Park, NJ) in April 2025 for Rockefeller
-- Global Family Office, forming "Chase Newman Riordan Wealth Partners"
-- (~$1.2B AUM / ~$10M revenue team) at the same Florham Park address.
--
-- Confirmed a placeholder/dummy CRM phone value: 690 Gary Wayne's CRM
-- number (602) 222-2222 does not correspond to any real line — real
-- number is (973) 765-6945. Several other stale/generic phone numbers
-- flagged in data_flags (Klingman & Associates, Carver Financial
-- Services, Ameriprise Glendale, Segment Wealth Management).
--
-- Confirmed two Ameriprise advisor pairs (698/699 Bedford NH; 704/705
-- Springfield MO) are genuine co-founders/colleagues, each sharing a
-- named practice. Confirmed two Morgan Stanley Boston advisors
-- (713/973) are unrelated teams sharing one building's switchboard.

-- ===== GROUP 441: Klingman & Associates, New York, NY =====
-- 689 Gerard Klingman
UPDATE contacts SET
  address = '120 West 45th Street, Suite 3800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and President, Klingman & Associates, LLC (RIA, ~$3.5-4B AUM, custodied via Raymond James since 2006), New York NY. Forbes #2 Best-In-State NY 2026; team ranked #15 by Forbes Oct 2025. CRM phone (212) 644-4477 could not be corroborated; firm''s own ADV filing and directories consistently show (212) 867-7647.')), 512)
WHERE id = 689;
INSERT INTO contact_people (contact_id, name, role)
SELECT 689, x.name, x.role FROM (
  SELECT 'Thomas Klingman' AS name, 'Wealth Advisor (son of Gerard), Klingman & Associates' AS role
  UNION ALL SELECT 'Daniel Delmoro', 'Director of Investments / Principal, Klingman & Associates'
  UNION ALL SELECT 'Michael Paley', 'Chief Operating Officer, Klingman & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 689) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 689 AND name = x.name);

-- ===== GROUP 442: Center Street Capital Advisors, Chatham, NJ =====
-- 690 Gary Wayne
UPDATE contacts SET
  address = '19 Center Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, Co-Founder and Managing Partner, Center Street Capital Advisors (co-founded May 2022 with brother Andrew Wayne; ~$6B AUM as of 3/31/25), Chatham NJ. Forbes Best-In-State Wealth Advisor 2020-2022. CORRECTION: CRM phone (602) 222-2222 appears to be a placeholder/dummy value, not a real number — verified number is (973) 765-6945.')), 512)
WHERE id = 690;
INSERT INTO contact_people (contact_id, name, role)
SELECT 690, x.name, x.role FROM (
  SELECT 'Andrew Wayne' AS name, 'Co-Founder and Managing Partner, Center Street Capital Advisors' AS role
  UNION ALL SELECT 'Mark Klein', 'Chief Executive Officer (ex-Wells Fargo Advisors), Center Street Capital Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 690) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 690 AND name = x.name);

-- ===== GROUP 443: Morgan Stanley Wealth Management, Seattle, WA =====
-- 693 Brian Acarregui (The Northwest Compass Group)
UPDATE contacts SET
  address = '601 Union Street, Suite 5200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Management Director, portfolio manager for "The Northwest Compass Group," Morgan Stanley Seattle WA. Forbes Best-In-State #6 2026; Barron''s Top 1,500 2014-2023/2025-2026; MS Chairman''s Club 2021-2025. Confirmed unrelated to id 703 Mark Russo (UBS Seattle) — different firm entirely.')), 512)
WHERE id = 693;
INSERT INTO contact_people (contact_id, name, role)
SELECT 693, x.name, x.role FROM (
  SELECT 'Michael Healey' AS name, 'Team member, The Northwest Compass Group' AS role
  UNION ALL SELECT 'Brian Oliger, CFP', 'Team member, The Northwest Compass Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 693) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 693 AND name = x.name);

-- ===== GROUP 444: Merrill Wealth Management, Frisco, TX =====
-- 697 Jason Tarver (Tarver & Campbell Wealth Partners)
UPDATE contacts SET
  address = '1 Cowboys Way, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "Tarver & Campbell Wealth Partners," Merrill Frisco TX (The Star; team of 15, ~$7.2B AUM). Forbes Best-in-State Wealth Management Team 2026; Barron''s Top 1,200 2024.')), 512)
WHERE id = 697;
INSERT INTO contact_people (contact_id, name, role)
SELECT 697, x.name, x.role FROM (
  SELECT 'Chris Campbell' AS name, 'VP, Senior Financial Advisor & Senior Portfolio Advisor, Tarver & Campbell Wealth Partners' AS role
  UNION ALL SELECT 'Eric Wynn', 'Financial Advisor & Senior Portfolio Advisor, Tarver & Campbell Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 697) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 697 AND name = x.name);

-- ===== GROUP 445: Ameriprise Financial, Bedford, NH =====
-- 698 Brent Kiley, 699 Robert Bonfiglio (confirmed co-founders, Rise Private Wealth Management)
UPDATE contacts SET
  address = '262 S River Rd, Ste 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-founder (2010) and CEO of Rise Private Wealth Management, Ameriprise Bedford NH (now a 14-office national practice, ~$4B AUM, after merging with Pell Wealth Partners 2024/2025). Confirmed colleague of id 699 Robert Bonfiglio (co-founder). Barron''s Top 1,200 #1 NH; Forbes #1 NH 2026.')), 512)
WHERE id = 698;
UPDATE contacts SET
  address = '262 S River Rd, Ste 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-founder of Rise Private Wealth Management, Ameriprise Bedford NH. Confirmed colleague of id 698 Brent Kiley (co-founder). Ameriprise Hall of Fame 2021; Barron''s Top 1,200; Forbes #2 NH 2026.')), 512)
WHERE id = 699;
INSERT INTO contact_people (contact_id, name, role)
SELECT 698, x.name, x.role FROM (
  SELECT 'Nancy Burt' AS name, 'Private Wealth Advisor (Bedford NH office), Rise Private Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 698) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 698 AND name = x.name);

-- ===== GROUP 446: Carver Financial Services, Mentor, OH =====
-- 700 Randy Carver
UPDATE contacts SET
  address = '7473 Center St.',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CEO/founder, Carver Financial Services (founded 1990, via Raymond James Financial Services; ~28 professionals, converted to partnership structure Feb 2025), Mentor OH. Forbes #1 Best-In-State Ohio 2026; Barron''s Top 1,200 annually since 2010, Top 100 2026. CRM phone (440) 255-8036 differs from a firm number found in search ((440) 974-0808) — worth verifying.')), 512)
WHERE id = 700;
INSERT INTO contact_people (contact_id, name, role)
SELECT 700, x.name, x.role FROM (
  SELECT 'Bobbi J. Bruner, CFP' AS name, 'Chief Operating Officer & Partner, Carver Financial Services' AS role
  UNION ALL SELECT 'Raj Chatterjee, CFP, CEPA', 'Partner, RJFS Financial Advisor, Carver Financial Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 700) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 700 AND name = x.name);

-- ===== GROUP 447: Merrill Private Wealth Management, West Palm Beach, FL =====
-- 702 John Olson (The Olson Group)
UPDATE contacts SET
  address = '222 Lakeview Ave, Suite 1300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, founder of "The Olson Group," Merrill West Palm Beach FL (also splits time at a NY/Rockefeller Center office). Forbes 2026 Top Wealth Advisors #55 nationally; longtime Barron''s Top 100/Hall of Fame honoree.')), 512)
WHERE id = 702;
INSERT INTO contact_people (contact_id, name, role)
SELECT 702, x.name, x.role FROM (
  SELECT 'Kyle Olson' AS name, 'Managing Director, Senior Financial Advisor (daughter), The Olson Group' AS role
  UNION ALL SELECT 'Alexander M. Galasso', 'Senior VP, Senior Financial Advisor (son-in-law, NY office), The Olson Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 702) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 702 AND name = x.name);

-- ===== GROUP 448: UBS Wealth Management, Seattle, WA =====
-- 703 Mark Russo (Sound Wealth Management Group)
UPDATE contacts SET
  address = '925 Fourth Avenue, 31st & 32nd Floors',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, "Sound Wealth Management Group," UBS Seattle WA (~23 yrs at UBS). Barron''s Top 1,500 2026; Forbes Best-in-State 2024-2026. Confirmed unrelated to id 693 Brian Acarregui (Morgan Stanley Seattle) — different firm entirely.')), 512)
WHERE id = 703;
INSERT INTO contact_people (contact_id, name, role)
SELECT 703, x.name, x.role FROM (
  SELECT 'Shawn Macfarlan' AS name, 'Founding Partner, Senior Portfolio Manager, Sound Wealth Management Group' AS role
  UNION ALL SELECT 'Brad Weiner, CFP', 'Founding Partner, Sound Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 703) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 703 AND name = x.name);

-- ===== GROUP 449: Ameriprise Financial, Springfield, MO =====
-- 704 Seth Murray, 705 Ron Penney (confirmed colleagues, Penney, Murray & Associates)
UPDATE contacts SET
  address = '1342 E Kingsley St, Ste E',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, "Penney, Murray & Associates," Ameriprise Springfield MO. Confirmed colleague of id 705 Ron Penney (practice namesake). Forbes #2 Missouri 2025.')), 512)
WHERE id = 704;
UPDATE contacts SET
  address = '1342 E Kingsley St, Ste E',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP/ChFC, "Penney, Murray & Associates" (namesake practice, 39 yrs in business), Ameriprise Springfield MO. Confirmed colleague of id 704 Seth Murray.')), 512)
WHERE id = 705;
INSERT INTO contact_people (contact_id, name, role)
SELECT 704, x.name, x.role FROM (
  SELECT 'Carolyn Crim, CRPC' AS name, 'Financial Advisor (Springfield MO office), Penney, Murray & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 704) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 704 AND name = x.name);

-- ===== GROUP 450: Ameriprise Financial, Alcoa, TN =====
-- 706 Brent Trentham (The Trentham Santiago Group)
UPDATE contacts SET
  address = '371 Fountain View Cir',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-lead, CFP, "The Trentham Santiago Group" (aka TSG Financial Advisors; offices in Alcoa, Knoxville, Sevierville, Orlando FL), Ameriprise Alcoa TN (32 yrs experience). Forbes Best-In-State #5 Tennessee 2026.')), 512)
WHERE id = 706;
INSERT INTO contact_people (contact_id, name, role)
SELECT 706, x.name, x.role FROM (
  SELECT 'Conrad Santiago, CFP, MSFS' AS name, 'Co-Lead, The Trentham Santiago Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 706) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 706 AND name = x.name);

-- ===== GROUP 451: UBS Private Wealth Management, Fort Lauderdale, FL =====
-- 707 Chris Garvin (The Garvin Financial Team)
UPDATE contacts SET
  address = '401 East Las Olas Boulevard, Suite 2300, Las Olas Centre',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor and Portfolio Manager, leads "The Garvin Financial Team," UBS Fort Lauderdale FL (30+ yrs). Barron''s Top 1,200 nine times (2014-2018/2020-2025); UBS Chairman''s Council 2026.')), 512)
WHERE id = 707;
INSERT INTO contact_people (contact_id, name, role)
SELECT 707, x.name, x.role FROM (
  SELECT 'H. Glenn Garvin' AS name, 'Senior team member/founder (father, industry since 1968), The Garvin Financial Team' AS role
  UNION ALL SELECT 'Jennifer Garvin', 'Financial Advisor/Wealth Planning (since 2015), The Garvin Financial Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 707) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 707 AND name = x.name);

-- ===== GROUP 452: Ameriprise Financial, Glendale, CA =====
-- 708 Gail Reid (Castlewatch Wealth)
UPDATE contacts SET
  address = '535 N Brand Blvd, Ste 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Partner / Private Wealth Advisor, "Castlewatch Wealth," Ameriprise Glendale CA. Barron''s Top 100 Women Financial Advisors 2025, Hall of Fame 2022. CRM phone (818) 549-2800 differs from a team number found in search ((818) 662-1999) — worth verifying.')), 512)
WHERE id = 708;
INSERT INTO contact_people (contact_id, name, role)
SELECT 708, x.name, x.role FROM (
  SELECT 'Jose L. Godinez, CFP, ChFC, CLU' AS name, 'Private Wealth Advisor, Castlewatch Wealth' AS role
  UNION ALL SELECT 'Paul Avina, MBA, CFP, ChFC, CLU, CDFA, APMA', 'President, Castlewatch Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 708) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 708 AND name = x.name);

-- ===== GROUP 453: Ameriprise Financial, Vienna, VA =====
-- 709 Susan Kim (Kim, Hopkins & Associates)
UPDATE contacts SET
  address = '8150 Leesburg Pike, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner (co-lead), CFP/CRPC/APMA, "Kim, Hopkins & Associates," Ameriprise Vienna VA. Forbes Best-In-State #2 Virginia.')), 512)
WHERE id = 709;
INSERT INTO contact_people (contact_id, name, role)
SELECT 709, x.name, x.role FROM (
  SELECT 'Micah Hopkins, CFP, CMFC, CIMA' AS name, 'Managing Partner (co-lead), Kim, Hopkins & Associates' AS role
  UNION ALL SELECT 'Brandon S. Lee, RICP', 'Managing Director, Kim, Hopkins & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 709) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 709 AND name = x.name);

-- ===== GROUP 454: UBS Private Wealth Management, Florham Park, NJ (actual firm: Rockefeller Capital Management) =====
-- 710 Raymond Chase
UPDATE contacts SET
  firm = 'Rockefeller Capital Management (Chase Newman Riordan Wealth Partners)',
  title = 'Private Advisor & Managing Director',
  address = '180 Park Ave, Suite 203',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Raymond L. Chase departed UBS Private Wealth Management (formerly Certus Financial Group at UBS, ~$2.3B AUM) in April 2025, moving to Rockefeller Global Family Office with Angeline Newman and Daniel Riordan III, forming "Chase Newman Riordan Wealth Partners" (~$1.2B AUM/~$10M revenue), same Florham Park NJ address. Forbes Best-in-State Wealth Management Team 2023-2025.')), 512)
WHERE id = 710;
INSERT INTO contact_people (contact_id, name, role)
SELECT 710, x.name, x.role FROM (
  SELECT 'Angeline E. Newman' AS name, 'Private Advisor & Managing Director, Chase Newman Riordan Wealth Partners' AS role
  UNION ALL SELECT 'Daniel Riordan III', 'Private Advisor & Senior Vice President, Chase Newman Riordan Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 710) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 710 AND name = x.name);

-- ===== GROUP 455: Morgan Stanley Wealth Management, Westlake Village, CA =====
-- 711 Seth Haye (The Oaks Group)
UPDATE contacts SET
  address = '100 N. Westlake Blvd., Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Senior Portfolio Management Director, senior partner of "The Oaks Group," Morgan Stanley Westlake Village CA. Forbes #1 Best-In-State Wealth Management Team (CA) 2025/2026; individually #4 Best-In-State CA. Barron''s Top 1,200 since 2020.')), 512)
WHERE id = 711;
INSERT INTO contact_people (contact_id, name, role)
SELECT 711, x.name, x.role FROM (
  SELECT 'Duncan Hizzey' AS name, 'Senior Vice President, Financial Advisor, The Oaks Group' AS role
  UNION ALL SELECT 'Katie DuBois', 'Vice President, Financial Advisor, The Oaks Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 711) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 711 AND name = x.name);

-- ===== GROUP 456: Morgan Stanley Wealth Management, Boston, MA =====
-- 713 Raju Pathak (The Pathak Group), 973 Domenic Marinelli (The Marinelli Group) — separate teams
UPDATE contacts SET
  address = '28 State St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, Senior Portfolio Management Director, leads "The Pathak Group" (~$2.4B AUM as of Dec 2025), Morgan Stanley Boston MA. Barron''s Top 1,200 2025 (#28 MA), Top 1,500 2026. Id 973 Domenic Marinelli leads a separate, unrelated team ("The Marinelli Group") in the same building.')), 512)
WHERE id = 713;
UPDATE contacts SET
  address = '28 State St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "The Marinelli Group" (with Morgan Stanley since 1994), Boston MA. Barron''s Top 1,200 2022-2026; Forbes Top 250 Wealth Advisors in America 2026, Best-In-State #3 2026; MS Chairman''s Club since 2015. Id 713 Raju Pathak leads a separate, unrelated team ("The Pathak Group") in the same building.')), 512)
WHERE id = 973;
INSERT INTO contact_people (contact_id, name, role)
SELECT 713, x.name, x.role FROM (
  SELECT 'Brendan Doyle' AS name, 'Wealth Management Financial Advisor, Portfolio Management Director, The Pathak Group' AS role
  UNION ALL SELECT 'Eric Carpenter', 'Assistant VP, Marketing & Communications Director, The Pathak Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 713) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 713 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 973, x.name, x.role FROM (
  SELECT 'Jillian M. MacKinnon' AS name, 'Team member, The Marinelli Group' AS role
  UNION ALL SELECT 'Andrew E. Fotos', 'Team member, The Marinelli Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 973) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 973 AND name = x.name);

-- ===== GROUP 457: Morgan Stanley Wealth Management, Kirkland, WA =====
-- 714 J.B. Champion (The Champion Group)
UPDATE contacts SET
  address = '4000 Carillon Point, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, Senior Portfolio Management Director, Lending Specialist, part of "The Champion Group," Morgan Stanley Kirkland WA. Forbes #9 Seattle Area (HNW) Apr 2026. CRM phone (800) 869-3326 is a generic toll-free line.')), 512)
WHERE id = 714;
INSERT INTO contact_people (contact_id, name, role)
SELECT 714, x.name, x.role FROM (
  SELECT 'Karen J. Witt' AS name, 'Senior Vice President, Wealth Management, The Champion Group' AS role
  UNION ALL SELECT 'Jack Oman, CFP', 'Team member, The Champion Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 714) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 714 AND name = x.name);

-- ===== GROUP 458: Segment Wealth Management, Houston, TX =====
-- 716 Gil Baumgarten
UPDATE contacts SET
  address = '3040 Post Oak Blvd, Suite 1725',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, President & CEO, Segment Wealth Management (independent fee-only RIA founded 2010, ex-Smith Barney/UBS), Houston TX (Galleria area). Forbes Best-In-State #4 Houston Private Wealth 2026. CRM phone (713) 650-2000 differs from the firm''s currently published number (713) 800-7150 — likely outdated.')), 512)
WHERE id = 716;
INSERT INTO contact_people (contact_id, name, role)
SELECT 716, x.name, x.role FROM (
  SELECT 'Bill Enszer' AS name, 'Managing Director of Portfolio Management (ex-CEO of Salient Partners), Segment Wealth Management' AS role
  UNION ALL SELECT 'Ryan Farias, CFA', 'Senior Portfolio Manager (joined 2016), Segment Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 716) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 716 AND name = x.name);

-- ===== GROUP 459: Rockefeller Capital Management, Boca Raton, FL =====
-- 719 Michael Siden (Siden Fink Wealth Partners)
UPDATE contacts SET
  address = '5355 Town Center Rd, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Advisor, Sports & Entertainment Director, founding member of "Siden Fink Wealth Partners," Rockefeller Capital Management, Boca Raton FL (joined from Morgan Stanley, Chairman''s Club 2009-2019). Forbes Best-In-State #34 FL-South 2025/2026.')), 512)
WHERE id = 719;
INSERT INTO contact_people (contact_id, name, role)
SELECT 719, x.name, x.role FROM (
  SELECT 'Clifton Fink, CRPS' AS name, 'Private Advisor, Team Director of Corporate Retirement, Managing Director (based NYC), Siden Fink Wealth Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 719) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 719 AND name = x.name);

-- ===== GROUP 460: Merrill Wealth Management, Miami, FL =====
-- 720 Michael Romanchuk (Romanchuk & Associates)
UPDATE contacts SET
  address = '200 S Biscayne Blvd, Suite 4500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director / Senior Financial Advisor, CPFA, leads "Romanchuk & Associates," Merrill Miami FL (continuously registered here since 2006). Forbes Best-In-State #20 Miami 2025.')), 512)
WHERE id = 720;
