-- US Financial Advisor enrichment, batch 24 (25 contacts / 20 groups).
--
-- Location-discrepancy resolved: 734 James McLaughlin's CRM city
-- "Vero Beach, FL" is not a real Princeton Wealth Advisors branch —
-- no separate office found there; his actual registered office is
-- Princeton, NJ. Vero Beach appears to be a personal residence,
-- consistent with Barron's/Forbes ranking him under Florida lists.
--
-- Confirmed genuine colleague pairs (not just shared building/phone):
-- 730/731 (Merrill Wyomissing PA, "The Swift Group"), 740/826
-- (Raymond James Houston, "Edwards Fitzpatrick Group"), 743/744
-- (Merrill New Haven CT, "The GKH Group" — the "G"/"K"/"H" in the
-- team name derive from Kampf and Hutchison).
--
-- Confirmed separate/unrelated advisors sharing a building despite a
-- shared CRM phone: 721/856 (UBS Minneapolis, two distinct teams in
-- the same suite); 727/1040 (Wells Fargo Houston, distinct direct
-- lines and only one has a branded team).
--
-- Several phone discrepancies flagged (not corrected in the phone
-- column, only data_flags): 735 Ameriprise Powell OH, 738 Winthrop
-- Wealth, 741 Merrill Columbus, 745 RiverFront Wealth Advisors.

-- ===== GROUP 461: UBS Wealth Management, Minneapolis, MN =====
-- 721 Joseph Loftus (Raskin Loftus Group), 856 Robert Swiller (Swiller Lederfine O'Brien) — separate teams, same suite
UPDATE contacts SET
  address = '80 South 8th Street, Suite 2900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, member of "The Raskin Loftus Group," UBS Minneapolis MN. Barron''s Top 1,200 2022-2025; Forbes Best-in-State 2022-2026. Id 856 Robert Swiller leads a separate, unrelated team ("Swiller Lederfine O''Brien Wealth Management") in the same suite.')), 512)
WHERE id = 721;
UPDATE contacts SET
  address = '80 South 8th Street, Suite 2900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Goes by "Bobby," First VP-Wealth Management/Sr. Portfolio Manager, leads "Swiller Lederfine O''Brien Wealth Management," UBS Minneapolis MN. UBS Chairman''s Council 2024-2025. Id 721 Joseph Loftus is on a separate, unrelated team ("The Raskin Loftus Group") in the same suite.')), 512)
WHERE id = 856;
INSERT INTO contact_people (contact_id, name, role)
SELECT 721, x.name, x.role FROM (
  SELECT 'Aaron Raskin, CFP' AS name, 'Financial Advisor, The Raskin Loftus Group' AS role
  UNION ALL SELECT 'Jonathan Monson', 'Senior Wealth Strategy Associate, The Raskin Loftus Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 721) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 721 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 856, x.name, x.role FROM (
  SELECT 'Darren Lederfine' AS name, 'Advisor/partner, Swiller Lederfine O''Brien Wealth Management' AS role
  UNION ALL SELECT 'Allison O''Brien, CFP', 'Advisor/partner, Swiller Lederfine O''Brien Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 856) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 856 AND name = x.name);

-- ===== GROUP 462: Merrill Wealth Management, Alpharetta, GA =====
-- 722 Donna Joyner (Joyner & Associates)
UPDATE contacts SET
  address = '10000 Avalon Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, Managing Director/Wealth Management Advisor, leads "Joyner & Associates," Merrill Alpharetta GA (24+ yrs experience). Forbes Top Women Wealth Advisors Best-in-State GA #2 2025; America''s Top Women Advisors #47 2025.')), 512)
WHERE id = 722;
INSERT INTO contact_people (contact_id, name, role)
SELECT 722, x.name, x.role FROM (
  SELECT 'Alexander Bush, AWMA, SE-AWMA' AS name, 'First Vice President, Wealth Management Advisor, Joyner & Associates' AS role
  UNION ALL SELECT 'Giovanna Godina', 'Registered Wealth Management Client Associate, Joyner & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 722) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 722 AND name = x.name);

-- ===== GROUP 463: Truist Investment Services, Nashville, TN =====
-- 725 Trey Smith (The Smith Group)
UPDATE contacts SET
  address = '3322 West End Ave, Suite 620',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director & Financial Advisor, leads "The Smith Group of Truist Investment Services" (~$1.1B AUM, 25 yrs experience), Nashville TN. Forbes Best-in-State Wealth Management Teams 2026; Barron''s Top 1,500 2026.')), 512)
WHERE id = 725;
INSERT INTO contact_people (contact_id, name, role)
SELECT 725, x.name, x.role FROM (
  SELECT 'Steve Laughter' AS name, 'Financial Consultant, The Smith Group' AS role
  UNION ALL SELECT 'Grant Anderson', 'Financial Consultant, The Smith Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 725) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 725 AND name = x.name);

-- ===== GROUP 464: Merrill Wealth Management, Toms River, NJ =====
-- 726 Benjamin Kaplowitz (Kaplowitz Group)
UPDATE contacts SET
  address = '1415 Hooper Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Senior Financial Advisor, leads "the Kaplowitz Group," Merrill Toms River NJ. Forbes Best-In-State #4 NJ-South 2026; Barron''s Top 1,200 2024.')), 512)
WHERE id = 726;
INSERT INTO contact_people (contact_id, name, role)
SELECT 726, x.name, x.role FROM (
  SELECT 'Jonathan Panigel' AS name, 'Vice President, Financial Advisor, Kaplowitz Group' AS role
  UNION ALL SELECT 'Abbie Greenberg', 'Officer, Wealth Management Client Associate, Kaplowitz Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 726) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 726 AND name = x.name);

-- ===== GROUP 465: Wells Fargo Advisors, Houston, TX =====
-- 727 Charles Neuhaus, 1040 Howard Lorch (The Lorch Group) — confirmed separate, unrelated
UPDATE contacts SET
  address = '1000 Louisiana St, Wells Fargo Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, Wells Fargo Advisors, Houston TX; appears to practice standalone (no distinct team brand found). Id 1040 Howard Lorch is a separate, unrelated advisor/team ("The Lorch Group") in the same building — distinct direct lines confirm this.')), 512)
WHERE id = 727;
UPDATE contacts SET
  address = '1000 Louisiana St, Wells Fargo Plaza, 7th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, leads "The Lorch Group of Wells Fargo Advisors," Houston TX. Forbes Best-In-State #36 TX 2025. Id 727 Charles Neuhaus is a separate, unrelated advisor in the same building — distinct direct lines confirm this.')), 512)
WHERE id = 1040;

-- ===== GROUP 466: Morgan Stanley Private Wealth Management, St. Louis, MO =====
-- 728 Kathleen Youngerman (The Harmony Family Office)
UPDATE contacts SET
  address = '14805 N Outer Forty Rd, Suite 200, Chesterfield, MO 63017',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, CPM, Managing Director, Senior Portfolio Management Director, Private Wealth Advisor, Founding Partner/leader of "The Harmony Family Office," Morgan Stanley Private Wealth Management, St. Louis metro (Chesterfield MO office; ~36 yrs experience, joined via Smith Barney/Citi Family Office 2005). Forbes 2026 America''s Top Women Wealth Advisors.')), 512)
WHERE id = 728;
INSERT INTO contact_people (contact_id, name, role)
SELECT 728, x.name, x.role FROM (
  SELECT 'Rebecca Hance' AS name, 'Portfolio management support (31+ yrs experience), The Harmony Family Office' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 728) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 728 AND name = x.name);

-- ===== GROUP 467: Merrill Wealth Management, Wyomissing, PA =====
-- 730 Stephen Bealer, 731 John Minnich (confirmed colleagues, The Swift Group)
UPDATE contacts SET
  address = '985 Berkshire Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP, member of "The Swift Group," Merrill Wyomissing PA (joined/partnered 2003). Confirmed colleague of id 731 John Minnich, same team. Forbes Best-in-State Wealth Management Teams 2024.')), 512)
WHERE id = 730;
UPDATE contacts SET
  address = '985 Berkshire Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, member of "The Swift Group," Merrill Wyomissing PA (career start 2003). Confirmed colleague of id 730 Stephen Bealer, same team. Forbes Best-in-State Wealth Management Teams 2024.')), 512)
WHERE id = 731;
INSERT INTO contact_people (contact_id, name, role)
SELECT 730, x.name, x.role FROM (
  SELECT 'Scott Swift' AS name, 'Founder/Financial Advisor (joined Merrill 1980, team namesake), The Swift Group' AS role
  UNION ALL SELECT 'Kevin Kusmierz, CFP, ChFC, CLU', 'Investment Management/Advisor (with team since 2017), The Swift Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 730) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 730 AND name = x.name);

-- ===== GROUP 468: Ameriprise Financial, Palm Coast, FL =====
-- 732 Saroj "Kris" Kasturi (Gratium Wealth Planning)
UPDATE contacts SET
  address = '10 Florida Park Drive N, Ste D',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Goes professionally by "Kris Kasturi," CRPC/APMA, Co-Founder of "Gratium Wealth Planning," Ameriprise Palm Coast FL (large multi-office practice, ~43 advisors across FL/LA/AL). Forbes/SHOOK #1 Best-In-State FL-North 2025; #243 America''s Top Wealth Advisors 2025.')), 512)
WHERE id = 732;
INSERT INTO contact_people (contact_id, name, role)
SELECT 732, x.name, x.role FROM (
  SELECT 'James Evans, CRPC, APMA' AS name, 'Co-Founder, Gratium Wealth Planning' AS role
  UNION ALL SELECT 'Tara J. Showalter, JD, CFP, APMA, CRPC', 'Managing Director (recruiting/acquisitions), Gratium Wealth Planning'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 732) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 732 AND name = x.name);

-- ===== GROUP 469: Ameriprise Financial, Farmington Hills, MI =====
-- 733 Eric Furlotte (TruVista Wealth Advisors)
UPDATE contacts SET
  address = '33493 W 14 Mile Rd, Ste 80',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner of "TruVista Wealth Advisors" (also has a Troy MI location), Ameriprise Farmington Hills MI. Forbes #14 Best-In-State (MI, HNW) 2025.')), 512)
WHERE id = 733;
INSERT INTO contact_people (contact_id, name, role)
SELECT 733, x.name, x.role FROM (
  SELECT 'Jason Batchelder' AS name, 'Managing Partner, TruVista Wealth Advisors' AS role
  UNION ALL SELECT 'Kevin Hepner', 'Managing Partner, TruVista Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 733) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 733 AND name = x.name);

-- ===== GROUP 470: Princeton Wealth Advisors | Raymond James, Vero Beach, FL (actual office: Princeton, NJ) =====
-- 734 James McLaughlin
UPDATE contacts SET
  address = '902 Carnegie Center, Suite 320, Princeton, NJ 08540',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LOCATION DISCREPANCY: CRM lists city as Vero Beach, FL, but no separate Princeton Wealth Advisors branch was found there — his registered office is Princeton, NJ. Vero Beach appears to be a personal residence (Barron''s/Forbes rank him under Florida lists for this reason). Confirmed current — Founding member, Managing Director, SVP-Investments, Private Wealth Advisor/branch manager, Princeton Wealth Advisors of Raymond James (joined 2007, 30+ yrs experience). Barron''s Top 1,200 #25 FL 2025, Top 1,500 #28 FL 2026.')), 512)
WHERE id = 734;
INSERT INTO contact_people (contact_id, name, role)
SELECT 734, x.name, x.role FROM (
  SELECT 'Kendrick W. White' AS name, 'Managing Director, Private Wealth Advisor, SVP-Investments, Princeton Wealth Advisors' AS role
  UNION ALL SELECT 'Peter G. Barlow, CIMA, CPFA', 'Team member, Princeton Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 734) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 734 AND name = x.name);

-- ===== GROUP 471: Ameriprise Financial, Powell, OH =====
-- 735 Paul Carbetta (Comprehensive Wealth Partners)
UPDATE contacts SET
  address = '90 Hidden Ravines Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO/Private Wealth Advisor, practice "Comprehensive Wealth Partners," Ameriprise Powell OH. Barron''s Top 1,200 2024; Forbes 2026 Top 250 Wealth Advisors/Best-In-State Wealth Management Teams. CRM phone (800) 297-7378 is Ameriprise''s generic toll-free line; direct branch line (614) 396-3800.')), 512)
WHERE id = 735;
INSERT INTO contact_people (contact_id, name, role)
SELECT 735, x.name, x.role FROM (
  SELECT 'John Kenneth Natale' AS name, 'President, Comprehensive Wealth Partners' AS role
  UNION ALL SELECT 'John M. Reymann, CFP', 'Advisor, Comprehensive Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 735) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 735 AND name = x.name);

-- ===== GROUP 472: Jacobi Capital Management, Pittston, PA =====
-- 736 Michael Hirthler
UPDATE contacts SET
  address = '154 Enterprise Way',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Chief Investment Officer, Jacobi Capital Management, LLC (SEC-registered RIA founded 2008, predecessor branch dates to 1992; also markets as "Jacobi Wealth Advisors"), Pittston PA. Barron''s Top 1,200 honoree 2011-2012/2018-2022 (9 times per firm materials).')), 512)
WHERE id = 736;
INSERT INTO contact_people (contact_id, name, role)
SELECT 736, x.name, x.role FROM (
  SELECT 'April L. Vinciarelli' AS name, 'COO, Chief Compliance Officer & Wealth Advisor, Jacobi Capital Management' AS role
  UNION ALL SELECT 'Mathew Hammer', 'Financial Advisor (34 yrs experience), Jacobi Capital Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 736) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 736 AND name = x.name);

-- ===== GROUP 473: Winthrop Wealth, Westborough, MA =====
-- 738 Mark Winthrop
UPDATE contacts SET
  address = '1400 Computer Drive, Suite 105',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President, Founding Partner, Wealth Advisor, and CIO of Winthrop Wealth (co-runs firm with brother Earl since 1985), Westborough MA. Barron''s Top 1,200 2025 (#16 Massachusetts). CRM phone (508) 366-3700 differs from the firm''s own listed contact number (508) 836-5500 — worth re-verifying.')), 512)
WHERE id = 738;
INSERT INTO contact_people (contact_id, name, role)
SELECT 738, x.name, x.role FROM (
  SELECT 'Earl B. Winthrop, AIF' AS name, 'Co-President & Senior Founding Partner, Winthrop Wealth' AS role
  UNION ALL SELECT 'Max Winthrop', 'Chief Executive Officer (son of Earl, built out the RIA in 2017), Winthrop Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 738) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 738 AND name = x.name);

-- ===== GROUP 474: Ameriprise Financial, Hurst, TX =====
-- 739 Charla McIntyre Fields (Fields Wealth Management)
UPDATE contacts SET
  address = '1401 Precinct Line Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, practice "Fields Wealth Management," Ameriprise Hurst TX. Barron''s Hall of Fame 2022 (10 yrs on Top 100 lists); Barron''s Top 100 Women Financial Advisors 2013-2025; AdvisorHub Advisors to Watch (over $1Bil) 2026.')), 512)
WHERE id = 739;
INSERT INTO contact_people (contact_id, name, role)
SELECT 739, x.name, x.role FROM (
  SELECT 'Rob O''Brien, MBA, CFP' AS name, 'Financial Advisor, Fields Wealth Management' AS role
  UNION ALL SELECT 'Danielle Schlech, MBA, CFP', 'Private Wealth Advisor, Fields Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 739) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 739 AND name = x.name);

-- ===== GROUP 475: Raymond James, Houston, TX =====
-- 740 Sean Fitzpatrick, 826 Jim Edwards (confirmed colleagues, Edwards Fitzpatrick Group)
UPDATE contacts SET
  address = '5847 San Felipe St, Ste 3900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President of Investments, WMS, member of the "Edwards Fitzpatrick Group" of Raymond James, Houston TX (joined 2002). Confirmed colleague of id 826 Jim Edwards, same practice.')), 512)
WHERE id = 740;
UPDATE contacts SET
  address = '5847 San Felipe St, Ste 3900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Sr. VP of Investments, member of the "Edwards Fitzpatrick Group" of Raymond James, Houston TX (joined 2003, ex-UBS/PaineWebber). Confirmed colleague of id 740 Sean Fitzpatrick, same practice. Forbes #7 Best-In-State TX 2026.')), 512)
WHERE id = 826;

-- ===== GROUP 476: Merrill Wealth Management, Columbus, OH =====
-- 741 Stephen Mangum (Atlas Wealth Management Group)
UPDATE contacts SET
  address = '8890 Lyra Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, CRPC, member of "Atlas Wealth Management Group," Merrill Columbus OH (joined Merrill 2003). Forbes Best-in-State Wealth Management Teams 2023-2025; individually Best-in-State 2019-2024. CRM phone (614) 227-4000 differs from a listed direct line ((614) 825-0355) — worth verifying.')), 512)
WHERE id = 741;
INSERT INTO contact_people (contact_id, name, role)
SELECT 741, x.name, x.role FROM (
  SELECT 'Cary Hanosek' AS name, 'Financial Advisor, Atlas Wealth Management Group' AS role
  UNION ALL SELECT 'Michael NeCamp', 'Team member, Atlas Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 741) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 741 AND name = x.name);

-- ===== GROUP 477: Wells Fargo Advisors, Short Hills, NJ =====
-- 742 Jake DeCotiis (1776 Financial Management Group)
UPDATE contacts SET
  address = '51 John F. Kennedy Parkway, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, leads "1776 Financial Management Group of Wells Fargo Advisors," Short Hills NJ. Barron''s Top 1,200 #15 2025; Forbes Best-in-State #12 NJ 2025.')), 512)
WHERE id = 742;
INSERT INTO contact_people (contact_id, name, role)
SELECT 742, x.name, x.role FROM (
  SELECT 'Therese Miller' AS name, 'Senior Registered Client Associate, 1776 Financial Management Group' AS role
  UNION ALL SELECT 'Paulo Gaspar', 'Senior Wealth Client Performance Analytics Consultant, 1776 Financial Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 742) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 742 AND name = x.name);

-- ===== GROUP 478: Merrill Wealth Management, New Haven, CT =====
-- 743 Thomas Hutchison, 744 Joshua Kampf (confirmed colleagues, The GKH Group)
UPDATE contacts SET
  address = '157 Church Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CIMA, goes by "Hutch," member/co-namesake of "The GKH Group," Merrill New Haven CT. Confirmed colleague of id 744 Joshua Kampf, same team (the "G"/"K"/"H" derive from Kampf and Hutchison). Forbes Best-in-State CT 2020-2026.')), 512)
WHERE id = 743;
UPDATE contacts SET
  address = '157 Church Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, senior partner of "The GKH Group," Merrill New Haven CT (joined Merrill 2005). Confirmed colleague of id 743 Thomas Hutchison, same team. Barron''s Top 1,200 State-by-State 2020-2025; Forbes Best-in-State CT 2020-2026.')), 512)
WHERE id = 744;
INSERT INTO contact_people (contact_id, name, role)
SELECT 743, x.name, x.role FROM (
  SELECT 'Andrew S. Kampf' AS name, 'Managing Director, Senior Relationship Manager, The GKH Group' AS role
  UNION ALL SELECT 'Luke Rassow-Kantor', 'AVP, Business Manager, The GKH Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 743) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 743 AND name = x.name);

-- ===== GROUP 479: RiverFront Wealth Advisors | Wells Fargo Advisors FiNet, Alexandria, VA =====
-- 745 Tristan Caudron
UPDATE contacts SET
  address = '99 Canal Center Plaza, Suite 310',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, RiverFront Wealth Advisors (Wells Fargo Advisors Financial Network; formerly "Caudron Megary Blackburn Wealth Management Group," co-founded 1995), Alexandria VA. Barron''s Top 1,200/1,500 multiple years; Forbes Best-In-State 2020-2026. CRM phone (877) 879-2495 is generic toll-free; direct office line (703) 739-4545.')), 512)
WHERE id = 745;
INSERT INTO contact_people (contact_id, name, role)
SELECT 745, x.name, x.role FROM (
  SELECT 'Matt Megary' AS name, 'Managing Partner, RiverFront Wealth Advisors' AS role
  UNION ALL SELECT 'Laurie Blackburn', 'Managing Director, RiverFront Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 745) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 745 AND name = x.name);

-- ===== GROUP 480: Baird, Pittsburgh, PA =====
-- 746 James Meredith (The Meredith Group at Baird)
UPDATE contacts SET
  address = '2545 Railroad Street, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CPA/PFS, Managing Director, leads "The Meredith Group at Baird" (formerly Hefren-Tillotson, acquired by Baird), Pittsburgh PA (Strip District; ~47-49 yrs in industry, KDKA radio host). Forbes/Barron''s Best-in-State Wealth Management Teams 2025.')), 512)
WHERE id = 746;
INSERT INTO contact_people (contact_id, name, role)
SELECT 746, x.name, x.role FROM (
  SELECT 'Matthew Snider, CFP' AS name, 'Branch Manager, Greensburg office (joined 1999), The Meredith Group' AS role
  UNION ALL SELECT 'Raymond Ballantine, CFP', 'Financial Advisor, Director (joined 2023), The Meredith Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 746) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 746 AND name = x.name);
