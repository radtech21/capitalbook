-- US Financial Advisor enrichment, batch 34 (20 contacts / 20 groups).
--
-- Firm-affiliation updates:
-- 998 Russell Riggan — left Edward Jones May 2021 (~15-16 yrs there),
-- founded Talent Financial Services, now affiliated with Raymond
-- James Financial Services (firm field should note this).
-- 989 Gautam Muthusamy — firm rebranded from "Ockerlund Wealth
-- Management" (founded 1984) to "Arcadia Capital" (~2022); still a
-- Raymond James Financial Services affiliate. CRM firm field already
-- correct.
-- 1007 Jeffrey Corliss — as of Jan 2026, Hightower folded RDM
-- Financial Group into its national "Hightower Signature Wealth"
-- brand; Westport office now operates under that name, still via
-- Hightower Securities LLC. CRM firm field updated to reflect both.
--
-- Compliance flags (factual record, not data errors):
-- 986 V. Peter Traphagen Jr. (Traphagen Investment Advisors, Oradell
-- NJ) — firm-level SEC settled enforcement action (~Sept 2024,
-- $225,000 civil penalty) for failing to timely file Form 13F reports
-- (required starting Feb 2020, not filed until May 2024).
-- 988 Jennifer Marcontell (Ameriprise, Mont Belvieu TX) — pending
-- FINRA customer dispute filed ~June 2022 alleging failure to follow
-- instructions to hold funds in a money market account instead of
-- growth funds; $188,255.04 claimed. Resolution unconfirmed.
-- 1001 Mitchell Stillman (Wells Fargo Advisors, Scottsdale AZ) —
-- pending customer complaint filed Dec 2025 alleging failure to meet
-- client investment objectives, $500,000-$1,000,000 claimed; also an
-- earlier disclosed 2008 complaint (then at Wachovia Securities)
-- alleging failure to act on account-loss instructions.
-- 1007 Jeffrey Corliss (Hightower Signature Wealth, Westport CT) —
-- single historical Form U4 disclosure: a 1995 personal bankruptcy
-- was not initially marked on a later Form U4; his then-employer
-- terminated him upon discovery. He has stated he did not believe
-- disclosure was required at the time and did not intend to mislead,
-- later acknowledging the answer should have been "Yes." No other
-- disputes/actions found. Decades-old, factual record only.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free lines, wrong-region area codes, or simply
-- unmatched to current listings); phone column left untouched per
-- convention except where explicitly noted as data-quality context.

-- ===== GROUP 661: Traphagen Investment Advisors, Oradell, NJ =====
-- 986 V. Peter Traphagen Jr.
UPDATE contacts SET
  address = '234 Kinderkamack Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Principal-Owner and Chief Compliance Officer, CPA PFS AEP CFP, Traphagen Investment Advisors LLC (dba Traphagen Financial Group/Traphagen CPAs & Wealth Advisors, independent RIA founded 1970, ~$1.9B AUM Dec 2024), Oradell NJ. CNBC Top 100 Financial Advisors 2023/2024 (#9 in 2024). CRM phone (914) 631-0404 is a Westchester County NY number and does not belong to this NJ firm — correct number (201) 262-1040, flagged as a data error. COMPLIANCE FLAG (factual record, firm-level): SEC settled enforcement action ~Sept 2024, $225,000 civil penalty, for failing to timely file Form 13F reports (required starting Feb 2020, not filed until May 2024).')), 512)
WHERE id = 986;
INSERT INTO contact_people (contact_id, name, role)
SELECT 986, x.name, x.role FROM (
  SELECT 'Robert J. Traphagen' AS name, 'Managing Partner, CPA, Traphagen Investment Advisors' AS role
  UNION ALL SELECT 'Alexander S. Macchio, CFP', 'Advisor, Traphagen Investment Advisors'
  UNION ALL SELECT 'Adrian Rodriguez, CFP', 'Advisor, Traphagen Investment Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 986) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 986 AND name = x.name);

-- ===== GROUP 662: Morgan Stanley Wealth Management, Baltimore, MD =====
-- 987 M. Kent Strosnider (The Strosnider Dudderar Wealth Management Group)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP, Alternative Investments Director, Family Wealth Director, Global Sports and Entertainment Director, co-leads "The Strosnider Dudderar Wealth Management Group" (offices Baltimore MD and Naples FL, with firm since 1994), Morgan Stanley Baltimore MD. Team named to Forbes Best-in-State Wealth Management Teams Jan 2026; Barron''s Top Advisor Rankings Maryland 2009-2012. CRM phone (410) 332-2600 not independently corroborated but not contradicted; a separate direct line (410) 736-5389 was also found.')), 512)
WHERE id = 987;
INSERT INTO contact_people (contact_id, name, role)
SELECT 987, x.name, x.role FROM (
  SELECT 'Jason Dudderar, CFA' AS name, 'Co-lead, The Strosnider Dudderar Wealth Management Group' AS role
  UNION ALL SELECT 'Brad Schulze, CFP', 'Financial Advisor, The Strosnider Dudderar Wealth Management Group'
  UNION ALL SELECT 'Sandy Loys', 'Financial Advisor, The Strosnider Dudderar Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 987) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 987 AND name = x.name);

-- ===== GROUP 663: Ameriprise Financial, Mont Belvieu, TX =====
-- 988 Jennifer Marcontell (Marcontell Wealth Management)
UPDATE contacts SET
  address = '2830 N FM 565 Rd, Ste 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP ChFC AAMS APMA CRPC, leads "Marcontell Wealth Management" (Ameriprise, moved from Edward Jones 7/1/2022 with a $1.7B book), Mont Belvieu TX. Barron''s Top 1,200 2015-2022/2024-2025; Barron''s Hall of Fame 2025 (10 yrs on Top 100); Forbes Best-in-State/Top Women Wealth Advisors 2021-2022/2024-2026, ranked #3 Texas 2026; ~$1.7-1.8B AUM. CRM phone (800) 297-7378 is Ameriprise''s generic line; direct office line (281) 838-3100. COMPLIANCE FLAG (factual record): pending FINRA customer dispute filed ~June 2022 alleging failure to follow instructions to hold funds in a money market account instead of growth funds, $188,255.04 claimed — resolution unconfirmed, recommend periodic re-check.')), 512)
WHERE id = 988;
INSERT INTO contact_people (contact_id, name, role)
SELECT 988, x.name, x.role FROM (
  SELECT 'Allie Gwynn, CFP' AS name, 'Associate Financial Advisor, Marcontell Wealth Management' AS role
  UNION ALL SELECT 'Todd Patton', 'Associate Financial Advisor, Marcontell Wealth Management'
  UNION ALL SELECT 'Ryan Heard, CFP', 'Investment Operations Coordinator, Marcontell Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 988) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 988 AND name = x.name);

-- ===== GROUP 664: Arcadia Capital, Saline, MI =====
-- 989 Gautam Muthusamy
UPDATE contacts SET
  address = '123 N. Ann Arbor St.',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner and Senior Financial Advisor, Arcadia Capital (rebrand of "Ockerlund Wealth Management," founded 1984 by Bill Ockerlund, ~2022 rebrand; a Raymond James Financial Services Advisors/Raymond James Financial Services affiliate, not independent), Saline MI. Forbes Best-in-State Next-Gen Wealth Advisors 2022/2025/2026 (~$1.6B firm AUM). CRM phone (949) 706-1433 is a California area code with no found association to this advisor — correct office line (734) 429-3971, flagged as likely data error.')), 512)
WHERE id = 989;
INSERT INTO contact_people (contact_id, name, role)
SELECT 989, x.name, x.role FROM (
  SELECT 'Bill Ockerlund' AS name, 'Partner, Senior Financial Advisor (firm founder), Arcadia Capital' AS role
  UNION ALL SELECT 'Tom Baughman', 'Partner, Private Wealth Manager, Arcadia Capital'
  UNION ALL SELECT 'Luke Panning, CFP', 'Senior Financial Advisor, Arcadia Capital'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 989) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 989 AND name = x.name);

-- ===== GROUP 665: Sparks Financial, Denver, CO =====
-- 991 Scott Sparks
UPDATE contacts SET
  address = '1873 S. Bellaire St, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, President & CEO, CLU, Sparks Financial (Northwestern Mutual Private Client Group practice, ~38 members across Denver/Dallas-Fort Worth/New York offices), Denver CO. Ranked #1 Colorado/Denver, Forbes Best-in-State 2026; Barron''s Top 1,500 #14 Colorado 2026; ~$2.5B+ AUM. Phone was previously unrecorded — found (303) 512-2123.')), 512)
WHERE id = 991;
INSERT INTO contact_people (contact_id, name, role)
SELECT 991, x.name, x.role FROM (
  SELECT 'Taven Sparks, CFP' AS name, 'Partner & Wealth Advisor, Sparks Financial' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 991) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 991 AND name = x.name);

-- ===== GROUP 666: Merrill Wealth Management, San Antonio, TX =====
-- 994 Brian Tramontano (Tramontano & Associates)
UPDATE contacts SET
  address = '1803 Broadway St, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CIMA CRPC, founded "Tramontano & Associates" (2010, ~14-person team, 230+ combined yrs experience), Merrill San Antonio TX (with firm since 1993). Ranked #1 Texas, Forbes Best-in-State 2026; #87 Forbes America''s Top Wealth Advisors 2026; Forbes Top 250 Wealth Advisors 2021-2024; Barron''s Top 1,200 2015/2016-2025. Note: unrelated "Michael/Quinton Tramontano" group departed Merrill for Rockefeller Capital Oct 2021 — separate individuals, do not conflate. CRM phone (210) 225-4000 does not match current listings — correct number (210) 805-7160, flagged for correction.')), 512)
WHERE id = 994;
INSERT INTO contact_people (contact_id, name, role)
SELECT 994, x.name, x.role FROM (
  SELECT 'Jacob Flach' AS name, 'Financial Advisor (joined 2017), Tramontano & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 994) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 994 AND name = x.name);

-- ===== GROUP 667: Merrill Wealth Management, Gilbert, AZ =====
-- 995 Christopher Downs (DJA Group)
UPDATE contacts SET
  address = '275 E Rivulon Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, CEPA CRPC, part of "DJA Group" (Downs/Jakubowski/Albery, with firm since 2002), Merrill Gilbert AZ. Ranked #9 Arizona, Forbes Best-in-State 2025; named to Barron''s Top 1,200 9 consecutive years through 2022 (currency of later years unconfirmed). Phone confirmed correct (480) 752-6410.')), 512)
WHERE id = 995;
INSERT INTO contact_people (contact_id, name, role)
SELECT 995, x.name, x.role FROM (
  SELECT 'Martin A. Jakubowski' AS name, 'Senior Vice President, Senior Relationship Manager, DJA Group' AS role
  UNION ALL SELECT 'Nathan Scott Albery', 'Senior Vice President, Senior Financial Advisor, DJA Group'
  UNION ALL SELECT 'Ryan William Berns, CFP, CRPC, CSRIC, CEPA, CPFA', 'First Vice President, Wealth Management Advisor, DJA Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 995) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 995 AND name = x.name);

-- ===== GROUP 668: Morgan Stanley Wealth Management, Troy, MI =====
-- 996 Mark Fudold
UPDATE contacts SET
  address = '101 W Big Beaver Rd, Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Portfolio Management Director, Financial Planning Specialist (with firm since 1995), Morgan Stanley Troy MI. Ranked #8 Michigan, Forbes Best-in-State 2025. CRM phone (248) 524-2600 does not match current listings — direct line (248) 740-7123, flagged for correction.')), 512)
WHERE id = 996;
INSERT INTO contact_people (contact_id, name, role)
SELECT 996, x.name, x.role FROM (
  SELECT 'Sharon K. McCaslin' AS name, 'Assistant Vice President, Director of Business Strategy' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 996) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 996 AND name = x.name);

-- ===== GROUP 669: Talent Financial Services, Snyder, TX =====
-- 998 Russell Riggan
UPDATE contacts SET
  firm = 'Talent Financial Services | Raymond James',
  address = '2100 College Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: left Edward Jones May 2021 (~15-16 yrs there), founded "Talent Financial Services," now affiliated with Raymond James Financial Services Advisors/Raymond James Financial Services (~$1.75B firm AUM, 9 TX branch locations). Financial Advisor/Private Wealth Advisor, Snyder TX. Raymond James Private Wealth Advisory Council member; Raymond James Chairman''s Council 2022-2025; Forbes Best-in-State 2024-2026. CRM phone (325) 573-0080 could not be corroborated by any source — published number is (325) 216-9444, flagged for correction. Note: an unrelated St. Louis MO employment attorney also named "Russell Riggan" surfaced in search — different individual, different profession.')), 512)
WHERE id = 998;
INSERT INTO contact_people (contact_id, name, role)
SELECT 998, x.name, x.role FROM (
  SELECT 'Nicole Singleton' AS name, 'Financial Advisor & Branch Manager (Fredericksburg TX), Talent Financial Services' AS role
  UNION ALL SELECT 'Garrett T. Gunn, AAMS', 'Financial Advisor, Talent Financial Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 998) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 998 AND name = x.name);

-- ===== GROUP 670: Creative Planning, Bellevue, WA =====
-- 999 Carlos Lopez
UPDATE contacts SET
  address = '500 108th Ave NE, Office 11, Ste. 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner and Managing Director, Creative Planning, Bellevue WA. Named to Barron''s Top 1,200 by state 2024/2025. Phone confirmed correct (866) 273-2848. Note: multiple similarly-named "Carlos Lopez" individuals exist in FINRA/IAPD records at other firms — likely CRD 2386699 for this advisor, not independently confirmed with certainty, flagged for verification before relying on compliance fields.')), 512)
WHERE id = 999;

-- ===== GROUP 671: Morgan Stanley Wealth Management, Cincinnati, OH =====
-- 1000 J.R. Randall (Seven Hills Wealth Management / The Seven Hills Group)
UPDATE contacts SET
  address = '7755 Montgomery Road, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Portfolio Management Director, Family Wealth Director, CFP, leads "Seven Hills Wealth Management"/"The Seven Hills Group," Morgan Stanley Cincinnati OH. Ranked #7 Ohio-Cincinnati, Forbes Best-in-State (period ~2023-2024); Financial Planning Magazine Top 40 Broker Under 40 2022; team #10 Forbes Best-in-State Wealth Management Teams 2025 (Ohio). CRM phone (513) 629-2600 could not be verified — number found (513) 562-8350, flagged for correction.')), 512)
WHERE id = 1000;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1000, x.name, x.role FROM (
  SELECT 'Brad Vitucci, CFP' AS name, 'Family Wealth Director, Seven Hills Wealth Management' AS role
  UNION ALL SELECT 'Cam McClung', 'Team member, Seven Hills Wealth Management'
  UNION ALL SELECT 'Elizabeth Moore', 'Family Wealth Director, Seven Hills Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1000) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1000 AND name = x.name);

-- ===== GROUP 672: Wells Fargo Advisors, Scottsdale, AZ =====
-- 1001 Mitchell Stillman (Source Private Wealth Group)
UPDATE contacts SET
  address = '18700 North Hayden Road, Suite 525',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, PIM Portfolio Manager, leads "Source Private Wealth Group" (with firm since 1990), Wells Fargo Advisors Scottsdale AZ. Barron''s Top 1,200 2022/2023; Forbes Best-in-State 2023; Wells Fargo Platinum Council 2004-2024 (20 consecutive years). CRM phone (480) 624-2300 could not be verified — number found (480) 991-7575, flagged for correction. COMPLIANCE FLAG (factual record): pending customer complaint filed Dec 2025 against Wells Fargo Clearing Services alleging failure to meet client investment objectives, $500,000-$1,000,000 claimed, under investigation as of Jan 2026; also an earlier disclosed 2008 complaint (then at Wachovia Securities, a WF predecessor) alleging failure to act on account-loss instructions.')), 512)
WHERE id = 1001;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1001, x.name, x.role FROM (
  SELECT 'Sonja Stillman' AS name, 'Operations/research/trust-estate documentation (spouse/partner), Source Private Wealth Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1001) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1001 AND name = x.name);

-- ===== GROUP 673: Ameriprise Financial, Thornton, CO =====
-- 1002 Adam Strickman (Ethos Financial Partners)
UPDATE contacts SET
  address = '9351 Grant St, Ste 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor and CEO, CFP BFA APMA CRPC, leads "Ethos Financial Partners" (Ameriprise, multi-office CO/NM practice), Thornton CO. Ranked #8 Colorado, Forbes 2025; team on Forbes Best-in-State Wealth Management Teams 2026. Phone was previously unrecorded — found (303) 252-9777.')), 512)
WHERE id = 1002;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1002, x.name, x.role FROM (
  SELECT 'Matthew Monks' AS name, 'Managing Partner, Ethos Financial Partners' AS role
  UNION ALL SELECT 'Brian Spinnato, CFP', 'Advisor, Ethos Financial Partners'
  UNION ALL SELECT 'Jenne Trembley', 'Private Wealth Advisor, Ethos Financial Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1002) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1002 AND name = x.name);

-- ===== GROUP 674: UBS Wealth Management, Canonsburg, PA =====
-- 1004 Peter Strope (Strope Financial Group)
UPDATE contacts SET
  address = '4000 Town Center Blvd, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP CAP, leads "Strope Financial Group," UBS Canonsburg PA. Team on Forbes Best-in-State Wealth Management Teams 2023-2026; UBS Wealth Management Pinnacle Council 2025. CRM phone (800) 354-9103 unverified as a direct line (plausibly a general UBS toll-free line) — not confirmed wrong, flagged for verification.')), 512)
WHERE id = 1004;

-- ===== GROUP 675: Raymond James, Grosse Pointe Farms, MI =====
-- 1005 Van Hauswirth (Grosse Pointe Advisory Group)
UPDATE contacts SET
  address = '15 Kercheval Ave, Ste 365',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Branch Manager & Financial Advisor, leads "Grosse Pointe Advisory Group" (Raymond James, with RJ family since 1995, joined from Edward Jones 1993), Grosse Pointe Farms MI. Named to Barron''s Top 1,200 2025; Raymond James Chairman''s Council every year since 2007. CRM phone (800) 248-8863 is Raymond James'' generic corporate line; direct branch line (313) 885-9470.')), 512)
WHERE id = 1005;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1005, x.name, x.role FROM (
  SELECT 'Daniel P. Keller' AS name, 'Associate Vice President, Investments, Grosse Pointe Advisory Group' AS role
  UNION ALL SELECT 'John C. Napolitano, JD', 'Financial Advisor, Grosse Pointe Advisory Group'
  UNION ALL SELECT 'Mark J. Napolitano', 'Senior Vice President, Investments, Grosse Pointe Advisory Group'
  UNION ALL SELECT 'Robert M. Peabody', 'Senior Vice President, Investments, Grosse Pointe Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1005) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1005 AND name = x.name);

-- ===== GROUP 676: Hightower Signature Wealth (formerly RDM Financial Group), Westport, CT =====
-- 1007 Jeffrey Corliss
UPDATE contacts SET
  firm = 'Hightower Signature Wealth (formerly RDM Financial Group)',
  address = '10 Wright Street, 1st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: as of Jan 2026, Hightower folded "RDM Financial Group" into its national "Hightower Signature Wealth" brand; Westport CT office now operates under that name via Hightower Securities LLC. Managing Director and Partner, CFP ChFC CLU CASL MBA (~37 yrs experience, with RDM/successor since 2013, promoted Managing Director/Partner Jan 2020). Forbes Top Advisor Connecticut 6th consecutive year 2026; Barron''s 7th consecutive year 2026. Phone was previously unrecorded — found (203) 255-0222. COMPLIANCE FLAG (factual record): single historical Form U4 disclosure — a 1995 personal bankruptcy was not initially marked on a later Form U4; his then-employer terminated him upon discovery. He has stated he did not believe disclosure was required and did not intend to mislead, later acknowledging the answer should have been "Yes." No other disputes/actions found on record — decades-old, factual only.')), 512)
WHERE id = 1007;

-- ===== GROUP 677: Ruggie Wealth Management, Tavares, FL =====
-- 1008 Thomas Ruggie
UPDATE contacts SET
  address = '2100 Lake Eustis Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Member, Founder & CEO, Ruggie Wealth Management (operates under parent RIA Destiny Wealth Partners LLC, multi-office FL practice, ~$1-1.2B AUM; no longer broker-dealer registered, operates as fee-based RIA since 2016), Tavares FL. Barron''s Top 1,200/1,500 11+ consecutive years (13th-14th time); Forbes Best-in-State #2 North FL 2025 (9th consecutive year); InvestmentNews 2025 Advisor of the Year-Alternative Investments. Phone was previously unrecorded — found (352) 343-2700.')), 512)
WHERE id = 1008;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1008, x.name, x.role FROM (
  SELECT 'Jorge A. Romero, CFP' AS name, 'Managing Partner, Ruggie Wealth Management / Destiny Wealth Partners' AS role
  UNION ALL SELECT 'Morgan Hatfield', 'Senior Wealth Advisor & Partner, Ruggie Wealth Management / Destiny Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1008) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1008 AND name = x.name);

-- ===== GROUP 678: Northwestern Mutual, Atlanta, GA =====
-- 1010 Ryan Smith (Smith Capital Advisors)
UPDATE contacts SET
  address = '3438 Peachtree Rd NE, Phipps Tower, Ste 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP ChFC CLU MST, leads "Smith Capital Advisors" (NM Private Client Group, ~5 advisors, ~79 combined yrs, ~$1.3B team AUM, Top 20 NM investment office nationally), Atlanta GA. Named to Barron''s Top 1,200 8 consecutive years; ranked #6 Georgia/Atlanta, Forbes Best-in-State 2026. CRM phone (866) 950-4644 is NM''s generic corporate line; direct office line (404) 846-3004.')), 512)
WHERE id = 1010;

-- ===== GROUP 679: Saxe Pinkston Financial Group | Wells Fargo Advisors FiNet, Evansville, IN =====
-- 1013 Scott Saxe
UPDATE contacts SET
  firm = 'Saxe Pinkston Financial Group | Wells Fargo Advisors FiNet',
  address = '25 NW Riverside Drive, 3rd Floor, Suite 320',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President (majority principal, 33.33% ownership), leads "Saxe Pinkston Financial Group" (Wells Fargo Advisors Financial Network, ~38-40 yrs experience), Evansville IN. Wells Fargo Advisors Financial Network Platinum Council 2009-2023; ranked #5 Indiana, Forbes Best-in-State (recent); team ranked #6 Forbes Best-in-State Wealth Management Teams (Indiana) Jan 2024; named to Barron''s Top 1,200 2025. CRM phone (877) 879-2495 is Wells Fargo''s generic customer-service line; direct office line (812) 425-6251.')), 512)
WHERE id = 1013;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1013, x.name, x.role FROM (
  SELECT 'Cory Pinkston' AS name, 'Senior Vice President, PIM Portfolio Manager (co-owner), Saxe Pinkston Financial Group' AS role
  UNION ALL SELECT 'Tyler Saxe', 'Branch Manager & Senior Vice President-Investments, Saxe Pinkston Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1013) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1013 AND name = x.name);

-- ===== GROUP 680: Ameriprise Financial, Phoenix, AZ =====
-- 1015 Renee Hanson (Affinity Wealth Advisory Group)
UPDATE contacts SET
  address = '7010 E Chauncey Ln, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP ChFC CEP CDFA CFS BFA APMA, part of "Affinity Wealth Advisory Group" (Ameriprise, ~28-30 yrs experience), Phoenix AZ. Named to Barron''s Top 1,500 2026; ranked #41 Forbes Best-in-State Arizona 2026. Phone confirmed correct (602) 923-9800 (direct ext. x9806).')), 512)
WHERE id = 1015;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1015, x.name, x.role FROM (
  SELECT 'Matthew Hanna' AS name, 'Financial Advisor, Affinity Wealth Advisory Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1015) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1015 AND name = x.name);
