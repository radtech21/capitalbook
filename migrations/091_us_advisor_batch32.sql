-- US Financial Advisor enrichment, batch 32 (21 contacts / 20 groups).
--
-- Firm-change corrections (updates firm field, not a departure but a
-- merger — advisor stayed, entity name changed):
-- 932 Nick Loring — "Loring Advisory Group" merged with 5 other former
-- Commonwealth Financial Network practices in 2025/2026 to form
-- "Kintra Wealth, LLC" (~$4B combined AUM); Loring is a co-founder.
-- Broker-dealer affiliation shifted Commonwealth Financial Network ->
-- Mutual Securities, Inc.
-- 942 Geri Eisenman Pell — "Pell Wealth Partners" merged with fellow
-- Ameriprise practice Rise Private Wealth Management (2024/2025); the
-- combined practice now operates under the "Rise Private Wealth
-- Management" name (~$4B AUM, 14 offices). Rye Brook NY remains her
-- primary office.
--
-- Compliance flags (factual record, not data errors):
-- 946 Erick Ellsweig (Merrill, West Palm Beach FL) — one disclosed
-- customer dispute alleging sales-practice violations; closed
-- without action/withdrawn per available BrokerCheck summary.
-- 1132 Daryn Pingleton (Merrill, West Palm Beach FL) — BrokerCheck
-- shows 8 disclosure events spanning 2001-2017, including a 2003
-- arbitration award (~$72,492) and a 2017 NC Dept. of Insurance
-- regulatory action re: failure to disclose a prior arbitration on a
-- license application. Does not affect current active status but is
-- a materially higher disclosure count than typical for this list.
-- 947 Michael Bromberg (UBS, New York NY) — BrokerCheck record
-- (CRD 2586900) indexed as showing 4 public disclosures; specific
-- text/dates/outcomes not independently confirmed (BrokerCheck PDF
-- blocked from automated fetch).
-- 922-adjacent research from batch 31 pattern continues: all
-- compliance items here are sourced from BrokerCheck-indexed search
-- snippets, not directly re-verified against the live filing —
-- flagged accordingly in each note.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 946/1132 (Merrill West Palm Beach FL — KM & Associates vs. The
-- Pingleton Group).
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines, or simply unverified against
-- current listings); phone column left untouched per convention.

-- ===== GROUP 621: Baird, Mequon, WI =====
-- 928 Greg Sommersberger (The Sommersberger Group)
UPDATE contacts SET
  address = '12075 N. Corporate Parkway, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director / Senior Investment Consultant, QPFC, leads "The Sommersberger Group," Baird Mequon WI (with firm since 2003). Named to Barron''s Top 1,200 (WI); Forbes Best-in-State Wisconsin 2023/2026; team on Forbes Best-in-State Wealth Management Teams 2026. Building houses multiple independent Baird teams — do not assume shared building implies shared team. CRM phone (800) 792-2473 is Baird''s national HQ toll-free line; direct team line (262) 240-3577.')), 512)
WHERE id = 928;
INSERT INTO contact_people (contact_id, name, role)
SELECT 928, x.name, x.role FROM (
  SELECT 'Thomas J. Lane, CFP' AS name, 'Associate Financial Advisor, VP, The Sommersberger Group' AS role
  UNION ALL SELECT 'Gil Cervelli, CFP', 'Director, The Sommersberger Group'
  UNION ALL SELECT 'Kelley Kochendorfer, QPFC', 'Team member, The Sommersberger Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 928) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 928 AND name = x.name);

-- ===== GROUP 622: G3 Wealth Advisors | Northwestern Mutual, Columbia, SC =====
-- 930 George Starnes
UPDATE contacts SET
  address = '1901 Bull St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner, Private Wealth Advisor, ChFC CLU AEP MSFS, "G3 Wealth Advisors" (Northwestern Mutual practice formed 2018, ~39 yrs with NM prior), Columbia SC. Named to Barron''s Top 1,200 (SC). CRM phone (866) 950-4644 is NM''s national customer-service line; direct office line (803) 254-1802. Note: unrelated "Robert Starnes" (Wauwatosa WI, CRD 1429794) was permanently barred by FINRA in 2023 — different individual, not to be confused with George R. Starnes III.')), 512)
WHERE id = 930;
INSERT INTO contact_people (contact_id, name, role)
SELECT 930, x.name, x.role FROM (
  SELECT 'Chad Dowdy, CFP' AS name, 'Founding Partner, Private Wealth Advisor, G3 Wealth Advisors' AS role
  UNION ALL SELECT 'Jarrod Stokes, CFP, ChFC, CLU', 'Private Wealth Advisor, G3 Wealth Advisors'
  UNION ALL SELECT 'Drew Stevens, CFP, CLU, RICP', 'Private Wealth Advisor, G3 Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 930) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 930 AND name = x.name);

-- ===== GROUP 623: RBC Wealth Management, Phoenix, AZ =====
-- 931 Joe Di Vito (The Di Vito Consulting Group)
UPDATE contacts SET
  address = '2398 E. Camelback Rd., Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Financial Advisor, Senior Portfolio Director, CFP CIMA CEPA CRPS AIF, leads "The Di Vito Consulting Group," RBC Phoenix AZ (with firm since 2009). Named to Barron''s Top 1,200 (2021/2022); ranked #3 Arizona High Net Worth advisors Apr 2025; team on Forbes Best-in-State Wealth Management Teams 2026.')), 512)
WHERE id = 931;
INSERT INTO contact_people (contact_id, name, role)
SELECT 931, x.name, x.role FROM (
  SELECT 'Rachelle Turner' AS name, 'Registered Client Associate, The Di Vito Consulting Group' AS role
  UNION ALL SELECT 'Chelsea Watkins', 'Investment Associate, The Di Vito Consulting Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 931) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 931 AND name = x.name);

-- ===== GROUP 624: Kintra Wealth, LLC (formerly Loring Advisory Group), Greenville, RI =====
-- 932 Nick Loring
UPDATE contacts SET
  firm = 'Kintra Wealth, LLC',
  address = '600 Putnam Pike, Suite 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Loring Advisory Group" merged with 5 other former Commonwealth Financial Network practices in 2025/2026 to form "Kintra Wealth, LLC" (~$4B combined AUM, 8 states); Nick Loring is a co-founder. Broker-dealer affiliation shifted from Commonwealth Financial Network to Mutual Securities, Inc. Still Greenville RI, CFP CPWA CIMA MBA CRPC CRPS. Ranked #3 Rhode Island, Forbes Best-in-State 2026. CRM phone (401) 654-4300 could not be verified against any source — flagged for correction.')), 512)
WHERE id = 932;
INSERT INTO contact_people (contact_id, name, role)
SELECT 932, x.name, x.role FROM (
  SELECT 'Michael Primiani, CFP, CPWA, AIF, CLTC' AS name, 'Financial Advisor, Kintra Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 932) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 932 AND name = x.name);

-- ===== GROUP 625: RBC Wealth Management, Providence, RI =====
-- 933 Robert Bourgault (The DiChiaro Bourgault Group)
UPDATE contacts SET
  address = '10 Weybosset St, Ste 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, part of "The DiChiaro Bourgault Group" (RBC, with firm since 2013, moved from JPMorgan Securities), Providence RI. Forbes Best-in-State Rhode Island 2022-2026 (5 consecutive years); Barron''s Top 1,200 2025/Top 1,500 2026.')), 512)
WHERE id = 933;
INSERT INTO contact_people (contact_id, name, role)
SELECT 933, x.name, x.role FROM (
  SELECT 'Richard DiChiaro' AS name, 'Financial Advisor, The DiChiaro Bourgault Group' AS role
  UNION ALL SELECT 'Sarah Paiva', 'Registered Client Associate, The DiChiaro Bourgault Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 933) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 933 AND name = x.name);

-- ===== GROUP 626: Morgan Stanley Wealth Management, Long Beach, CA =====
-- 934 Karl Wolfslau (The Wolfslau Group)
UPDATE contacts SET
  address = '3840 Kilroy Airport Way, Ste 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, founder/lead of "The Wolfslau Group" (~34-person team, ~$3B AUM), Morgan Stanley Long Beach CA. Forbes Best-in-State California recognition (rank varies by list/year — individual vs. team). CRM phone (562) 983-8100 does not match currently listed team number (562) 799-2247 — flagged for correction. Two low-credibility third-party "scam alert" sites surfaced negative allegations not corroborated by any regulatory record found — treated as non-factual noise, not a compliance flag.')), 512)
WHERE id = 934;
INSERT INTO contact_people (contact_id, name, role)
SELECT 934, x.name, x.role FROM (
  SELECT 'Steven Long' AS name, 'Managing Director, Senior Portfolio Manager, The Wolfslau Group' AS role
  UNION ALL SELECT 'Curtis Wolfslau', 'Financial Advisor & Portfolio Manager (joined 2012), The Wolfslau Group'
  UNION ALL SELECT 'Kathryn Simmons', 'Director of Business Strategy, The Wolfslau Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 934) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 934 AND name = x.name);

-- ===== GROUP 627: Morgan Stanley Private Wealth Management, Miami Beach, FL =====
-- 936 Andrew Schultz (The Schultz Group)
UPDATE contacts SET
  address = '1691 Michigan Ave, Suite 550',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Senior Portfolio Management Director, Alternative Investments Director, founder of "The Schultz Group," Morgan Stanley Miami Beach FL (with firm since 1991/2009). Forbes Best-in-State individual 2018-2025; team on Forbes Best-in-State Wealth Management Teams 2024-2026; Morgan Stanley Chairman''s Club since 2002. Phone was previously unrecorded — found (305) 695-6116, moderate confidence, recommend verification.')), 512)
WHERE id = 936;
INSERT INTO contact_people (contact_id, name, role)
SELECT 936, x.name, x.role FROM (
  SELECT 'Jonathan Faber' AS name, 'First VP, Financial Advisor, Senior Portfolio Manager, The Schultz Group' AS role
  UNION ALL SELECT 'Kemar Bennett', 'Assistant VP, Group Director, The Schultz Group'
  UNION ALL SELECT 'Peter Collazzo', 'VP, Investment Consultant, The Schultz Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 936) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 936 AND name = x.name);

-- ===== GROUP 628: Rose Advisors | Hightower, New York, NY =====
-- 937 Patrick Fruzzetti
UPDATE contacts SET
  address = '300 Madison Ave, 29th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner & Managing Director, Portfolio Manager, Rose Advisors (a practice within Hightower Advisors LLC), New York NY. Office relocated ~2022 from 505 Fifth Ave to 300 Madison Ave. Named to Barron''s Top 100 Independent Advisors 2023-2025, ranked top advisor in NY state on Barron''s Top 1,200 2023-2025; Forbes Best-in-State NY 2023-2025; manages $1.5-1.8B in team/client assets. CRM phone (212) 891-9000 could not be confirmed — current published main line is (917) 286-2720, flagged for correction.')), 512)
WHERE id = 937;
INSERT INTO contact_people (contact_id, name, role)
SELECT 937, x.name, x.role FROM (
  SELECT 'Nick Rogers, CFP' AS name, 'Managing Director (leads financial planning), Rose Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 937) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 937 AND name = x.name);

-- ===== GROUP 629: Wells Fargo Advisors, Encino, CA =====
-- 938 Jennifer Garcia (Garcia Private Wealth Group)
UPDATE contacts SET
  address = '15760 Ventura Blvd, Suite 1250',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, Private Wealth Financial Advisor, CFP SE-AWMA ADPA, leads "Garcia Private Wealth Group," Wells Fargo Advisors Encino CA (~30 yrs experience, ~$1.4B AUM). Forbes Best-in-State Wealth Advisors + Top Women Wealth Advisors 2025/2026; Barron''s Top 100 Women Advisors 2024. Phone was previously unrecorded — found (818) 380-3334. Note: BrokerCheck record for her CRD (2266576) is indexed under the name "Jennifer L Meneshian" — likely a maiden/married name discrepancy, flagged for verification, not treated as a compliance issue.')), 512)
WHERE id = 938;
INSERT INTO contact_people (contact_id, name, role)
SELECT 938, x.name, x.role FROM (
  SELECT 'Valerie' AS name, 'Private Wealth Financial Consultant (~15 yrs with team, surname unconfirmed), Garcia Private Wealth Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 938) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 938 AND name = x.name);

-- ===== GROUP 630: Merrill Private Wealth Management, Palm Beach Gardens, FL =====
-- 940 Gregory O'Hare (The O'Hare Group)
UPDATE contacts SET
  address = '3507 Kyoto Gardens Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads "The O''Hare Group" (Merrill Private Banking and Investment Group, with firm since 1989), Palm Beach Gardens FL. Ranked #19 Florida-South, Forbes Best-in-State 2026; named to Barron''s Top 1,200. Phone was previously unrecorded — found (800) 216-1568, may be a general Merrill routing number rather than a direct line, flagged for verification.')), 512)
WHERE id = 940;
INSERT INTO contact_people (contact_id, name, role)
SELECT 940, x.name, x.role FROM (
  SELECT 'Kellie O''Hare' AS name, 'Vice President, Senior Financial Advisor, The O''Hare Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 940) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 940 AND name = x.name);

-- ===== GROUP 631: Ameriprise Financial, Rye Brook, NY =====
-- 942 Geri Eisenman Pell
UPDATE contacts SET
  firm = 'Rise Private Wealth Management | Ameriprise Financial',
  address = '800 Westchester Ave, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Pell Wealth Partners" merged with fellow Ameriprise practice Rise Private Wealth Management (2024/2025); combined entity operates as "Rise Private Wealth Management" (~$4B AUM, 14 offices, 41 advisors). She remains CEO/Private Wealth Advisor at the Rye Brook NY office, CFP MBA CDFA. Named to Barron''s Top 1,200 and Barron''s Top 100 Women Financial Advisors (multiyear); Forbes Best-in-State NY (~#4, 2026). CRM phone (800) 297-7378 is Ameriprise''s generic line; direct branch line (914) 253-8800.')), 512)
WHERE id = 942;
INSERT INTO contact_people (contact_id, name, role)
SELECT 942, x.name, x.role FROM (
  SELECT 'Robert Bonfiglio' AS name, 'Co-founder/Private Wealth Advisor, Rise Private Wealth Management' AS role
  UNION ALL SELECT 'Brent Kiley', 'Co-founder/Private Wealth Advisor, Rise Private Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 942) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 942 AND name = x.name);

-- ===== GROUP 632: Merrill Wealth Management, Clifton Park, NY =====
-- 944 Todd Silaika (The SiRiCa Wealth Management Group)
UPDATE contacts SET
  address = '449 Route 146',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, CFP CPWA CAIA, leads "The SiRiCa Wealth Management Group" (grown from solo practice 1997 to 17-member team, ~1,000 households, ~$3.3B team assets), Merrill Clifton Park NY. Ranked #1 New York State High Net Worth, Forbes Best-in-State Wealth Management Teams 2026; individually named Forbes America''s Top Wealth Advisors 2025. CRM phone (800) 637-7455 is Merrill''s generic line; direct branch line (518) 373-7440.')), 512)
WHERE id = 944;
INSERT INTO contact_people (contact_id, name, role)
SELECT 944, x.name, x.role FROM (
  SELECT 'Erick Richardson' AS name, 'Senior team member, The SiRiCa Wealth Management Group' AS role
  UNION ALL SELECT 'Scott Calhoun, CRPC', 'Senior team member, The SiRiCa Wealth Management Group'
  UNION ALL SELECT 'Lee Wilson', 'Senior team member, The SiRiCa Wealth Management Group'
  UNION ALL SELECT 'James E. Coker, CFP, CIMA', 'Senior team member, The SiRiCa Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 944) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 944 AND name = x.name);

-- ===== GROUP 633: Cyndeo Wealth Partners, St. Petersburg, FL =====
-- 945 Matt Kilgroe
UPDATE contacts SET
  address = '200 Central Ave, 23rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CEO, Cyndeo Wealth Partners (independent RIA founded June 2020 via Dynasty Financial Partners after 20 yrs at Merrill + 8 yrs at UBS, ~$1.2B book at breakaway), St. Petersburg FL. Named to Barron''s Top 1,000/1,200 annually since 2009; Forbes Best-in-State Florida (named 2020, ~#14 2025). Phone was previously unrecorded — found (727) 472-3700.')), 512)
WHERE id = 945;
INSERT INTO contact_people (contact_id, name, role)
SELECT 945, x.name, x.role FROM (
  SELECT 'Pete Frantzis' AS name, 'Director of Business Development, Cyndeo Wealth Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 945) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 945 AND name = x.name);

-- ===== GROUP 634: Merrill Wealth Management, West Palm Beach, FL =====
-- 946 Erick Ellsweig (KM & Associates), 1132 Daryn Pingleton (The Pingleton Group) — 2 separate teams
UPDATE contacts SET
  address = '222 Lakeview Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CIMA, Merrill-designated Sports & Entertainment Advisor, part of "KM & Associates" (co-led with James F. Kirkpatrick and Justin Moore), Merrill West Palm Beach FL. Forbes Best-in-State 2018-2026 (8 consecutive yrs); Barron''s Top 1,200 2014-2026 (12 consecutive yrs). Id 1132 leads a separate, unrelated team in the same building. COMPLIANCE FLAG (factual record): one disclosed customer dispute alleging sales-practice violations, reported closed without action — does not affect current active status.')), 512)
WHERE id = 946;
UPDATE contacts SET
  address = '222 Lakeview Ave, Suite 1300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Resident Director & Managing Director (dual role as West Palm Beach branch Resident Director and team leader), founding member of "The Pingleton Group," Merrill West Palm Beach FL (with firm since Oct 1987). Named to Barron''s Top 1,000/1,200 Advisors (9 consecutive years per recent coverage); Forbes Best-in-State #19 FL 2023. Id 946 leads a separate, unrelated team in the same building. COMPLIANCE FLAG (factual record): BrokerCheck-indexed record shows 8 disclosure events (2001-2017), including a 2003 arbitration award of ~$72,492 and a Nov 2017 NC Dept. of Insurance regulatory action re: failure to disclose a prior FINRA arbitration on a 2014 license application — materially higher disclosure count than typical for this list; does not by itself confirm current standing issues but warrants periodic re-check.')), 512)
WHERE id = 1132;
INSERT INTO contact_people (contact_id, name, role)
SELECT 946, x.name, x.role FROM (
  SELECT 'James F. Kirkpatrick' AS name, 'Co-lead, KM & Associates' AS role
  UNION ALL SELECT 'Justin Moore', 'Co-lead, KM & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 946) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 946 AND name = x.name);

-- ===== GROUP 635: UBS Wealth Management, New York, NY =====
-- 947 Michael Bromberg (The BG Group)
UPDATE contacts SET
  address = '1285 Avenue of the Americas',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, leads "The BG Group" (~$2.5B+ client assets, moved with team from Merrill to UBS June 2023, prior Morgan Stanley), UBS New York NY. Ranked #14 New York, Forbes Best-in-State 2026; named to Barron''s Top 1,500 2026. COMPLIANCE FLAG (factual record, not independently re-confirmed against live BrokerCheck): CRD 2586900 indexed as showing 4 public disclosures — specific text/dates/outcomes unconfirmed, recommend periodic re-check. Note: unrelated "Jesse Bromberg"/"The Bromberg Group" at Morgan Stanley San Francisco is a different, unrelated advisor — do not conflate.')), 512)
WHERE id = 947;
INSERT INTO contact_people (contact_id, name, role)
SELECT 947, x.name, x.role FROM (
  SELECT 'Daniel A. Gerschel' AS name, 'Financial Advisor, The BG Group' AS role
  UNION ALL SELECT 'Joshua Ellner', 'Financial Advisor, The BG Group'
  UNION ALL SELECT 'Rob Mancino', 'Financial Advisor, The BG Group'
  UNION ALL SELECT 'Craig Weinstein', 'Financial Advisor, The BG Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 947) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 947 AND name = x.name);

-- ===== GROUP 636: EP Wealth Advisors, Torrance, CA =====
-- 948 Brian Parker
UPDATE contacts SET
  address = '21535 Hawthorne Boulevard, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder and Managing Director, CFP, EP Wealth Advisors (firm founded 1999 as Premier Financial Management, renamed EP Wealth Advisors, now $42.5B+ AUM across 65+ national offices), Torrance CA. Forbes Best-in-State recognition 2019/2021/2022; LA Business Journal Influential Wealth Manager 2018-2020, LA500 2026. Phone confirmed correct (310) 543-4559. Note: several unrelated "Brian Parker" advisors exist at other firms (different CRDs) — do not conflate compliance histories.')), 512)
WHERE id = 948;

-- ===== GROUP 637: UBS Private Wealth Management, Winter Park, FL =====
-- 949 Manish Mehta (The Summit Group)
UPDATE contacts SET
  address = '201 North New York Ave, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, CFA CFP, leads "The Summit Group" (with UBS since 2008, prior Merrill Lynch/Morgan Stanley), UBS Winter Park FL. Named to Barron''s Top 1,200 (6x) and Top 1,500 2026; Forbes Best-in-State 2018-2026; team ranked #1 Florida-North, Forbes Best-in-State Wealth Management Teams 2025. Phone was previously unrecorded — found (919) 918-2330, non-Florida area code, flagged for verification.')), 512)
WHERE id = 949;
INSERT INTO contact_people (contact_id, name, role)
SELECT 949, x.name, x.role FROM (
  SELECT 'Paul Higgins' AS name, 'Wealth Advisor, The Summit Group' AS role
  UNION ALL SELECT 'Pranjal Mehta', 'Wealth Management Associate, The Summit Group'
  UNION ALL SELECT 'Richard G. Berardo', 'Team member, The Summit Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 949) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 949 AND name = x.name);

-- ===== GROUP 638: Morgan Stanley Private Wealth Management, Bellevue, WA =====
-- 951 Paul Jackson (The Paclantic Group)
UPDATE contacts SET
  address = '500 108th Ave NE, Suite 1900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Family Wealth Director, leads "The Paclantic Group" (~28 yrs experience, U.S. Navy background), Morgan Stanley Bellevue WA. Ranked #9 Washington High Net Worth Jan 2025, ranked #13 Forbes Best-in-State Seattle Area 2026; named to Barron''s Top 1,200 2017-2025; Financial Times Top 400 US Advisors 2018. CRM phone (425) 709-2600 could not be corroborated — direct line found (425) 453-5746, flagged for correction.')), 512)
WHERE id = 951;
INSERT INTO contact_people (contact_id, name, role)
SELECT 951, x.name, x.role FROM (
  SELECT 'Kerry L. Zimm' AS name, 'Financial Planning Specialist, The Paclantic Group' AS role
  UNION ALL SELECT 'Bill Brooking, MBA, CFP', 'Managing Director, Wealth Management, The Paclantic Group'
  UNION ALL SELECT 'Leonard Hill, CFP', 'Partner, The Paclantic Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 951) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 951 AND name = x.name);

-- ===== GROUP 639: Merrill Wealth Management, Greenwich, CT =====
-- 952 Elizabeth Angelone (The Angelone & Berkman Group)
UPDATE contacts SET
  address = '2 Pickwick Plaza, Floor 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, leads "The Angelone & Berkman Group" (formed 2002), Merrill Greenwich CT (with firm since 1991). Holds Retirement Benefits Consultant designation (one of 200+ Merrill-wide). Named to Barron''s Top 1,200 2023-2025; Forbes Best-in-State Top Women Wealth Advisors (CT) 2022-2025, Forbes 2026 Top Women Wealth Advisors #88 (~$2.1B AUM). CRM phone (203) 863-3000 may be a general branch switchboard; team direct line found (203) 863-7641, flagged for verification.')), 512)
WHERE id = 952;
INSERT INTO contact_people (contact_id, name, role)
SELECT 952, x.name, x.role FROM (
  SELECT 'Brett Berkman' AS name, 'Financial Advisor, The Angelone & Berkman Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 952) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 952 AND name = x.name);

-- ===== GROUP 640: Jacques Financial, Rockville, MD =====
-- 954 Joseph Jacques
UPDATE contacts SET
  address = '1700 E. Gude Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Registered Principal, CPA CFP PFS ChFC CLU RFC, Jacques Financial LLC (multi-generational family firm; related entities Jacques Advisors LLC and Jacques & Associates CPAs LLC), Rockville MD (founded firm''s tax/investment practice 1978-1979). Ranked #1 Maryland, Forbes Best-in-State 2024; #99 Forbes America''s Top Wealth Advisors 2024. CRM phone (301) 294-7500 does not match firm''s current published number (301) 738-1303 — flagged for correction.')), 512)
WHERE id = 954;
INSERT INTO contact_people (contact_id, name, role)
SELECT 954, x.name, x.role FROM (
  SELECT 'Jeremy Jacques' AS name, 'Principal/Partner, CPA (son, 50% owner Jacques Advisors LLC), Jacques Financial' AS role
  UNION ALL SELECT 'William Jacques', 'CPA, CMA, JD (cousin, leads legal/estate-planning arm), Jacques Financial'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 954) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 954 AND name = x.name);
