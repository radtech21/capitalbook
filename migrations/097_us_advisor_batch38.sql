-- US Financial Advisor enrichment, batch 38 (20 contacts / 20 groups).
--
-- Firm-acquisition/rebrand notes (advisor stayed, entity changed):
-- 1098 Mark Brown — "Brown & Company" (LPL Financial-affiliated, Denver
-- CO) acquired by Modern Wealth Management (RIA backed by Crestview
-- Partners) via asset purchase, announced ~April 22, 2026 (~$1B AUM
-- added, firm total AUM now >$13B). Firm field updated.
-- 1106 Jack Cooney — "Bleakley Financial Group" rebranded to "OnePoint
-- BFG Wealth Partners" in July 2025 (same underlying entity/RIA
-- registration). Firm field updated.
--
-- Compliance flags (factual record, not data errors):
-- 1103 Denise Roberts (Morgan Stanley, Newport RI) — 1 disclosed
-- customer dispute from a 1994-1999 period (while at Smith Barney)
-- alleging failure to investigate tax-avoidance strategies,
-- unsuitability, and churning; disposition not independently
-- confirmed.
-- 1104 Timothy Finucan (Edward Jones, Webster City IA) — a secondary
-- (non-primary-source) aggregator cites 2 historical customer
-- disputes (2008 unauthorized bond purchases, settled $8,445.39; 2012
-- dispute re: liquidation of inherited stock positions) — not
-- independently verified against the live BrokerCheck record,
-- flagged for manual confirmation before treating as fact.
-- 1100 Scot Benefiel (Merrill, Scottsdale AZ) — a secondary
-- (non-primary-source) aggregator references a 2003 customer dispute
-- alleging breach of fiduciary duty/misrepresentation, reportedly
-- settled for $275,000, and a separate "$1 million complaint"
-- mention. NOT independently verified against the official
-- BrokerCheck record (CRD 1968666) — recorded here as an unverified
-- lead requiring manual confirmation, not a confirmed compliance fact.
-- 1114 Stephen Spector (Steward Partners, Portsmouth NH) — a firm-
-- level item (Steward Partners Investment Solutions LLC, not Spector
-- individually) referencing a FINRA censure/fine (~$225,000);
-- underlying conduct unconfirmed, noted as firm-level context only.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings); phone column left untouched per convention.

-- ===== GROUP 741: Raymond James, Nashville, TN =====
-- 1096 Andrew Fowler (The Fowler Group)
UPDATE contacts SET
  address = '1033 Demonbreun Street, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Vice President, Investments, AWMA AIF, leads "The Fowler Group," Raymond James Nashville TN. Raymond James Chairman''s Council member; ranked #17 Tennessee, Forbes Best-in-State 2018; team ranked #13 Tennessee, Forbes Best-in-State Wealth Management Teams Jan 2026. Phone confirmed correct (615) 645-6700.')), 512)
WHERE id = 1096;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1096, x.name, x.role FROM (
  SELECT 'Nicole McLeod' AS name, 'Vice President, Investments/Financial Advisor, The Fowler Group' AS role
  UNION ALL SELECT 'Chris Boyd', 'Financial Advisor, CRPS, The Fowler Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1096) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1096 AND name = x.name);

-- ===== GROUP 742: Ameriprise Financial, Indianapolis, IN =====
-- 1097 Brian Austin (PVA Wealth Advisors)
UPDATE contacts SET
  address = '2900 E 96th Street, Suite A',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP RFC APMA CKA, part of "PVA Wealth Advisors" (Ameriprise practice), Indianapolis IN. Forbes Best-in-State individual 2022-2025; team on Forbes Best-in-State Wealth Management Teams 2023-2026; ranked #44 Indiana, Forbes Best-in-State 2024; named to Barron''s Top 1,200 2021-2025/Top 1,500 2026. CRM phone (317) 843-5678 does not match found listings — number found (317) 818-9365, flagged for correction.')), 512)
WHERE id = 1097;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1097, x.name, x.role FROM (
  SELECT 'Anthony Gerardot, CFP, APMA, CKA' AS name, 'Managing Partner, PVA Wealth Advisors' AS role
  UNION ALL SELECT 'Ed Rowell', 'Financial Advisor, PVA Wealth Advisors'
  UNION ALL SELECT 'Chuck Gemmer, CFP', 'Financial Advisor, PVA Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1097) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1097 AND name = x.name);

-- ===== GROUP 743: Modern Wealth Management (formerly Brown & Company), Denver, CO =====
-- 1098 Mark Brown
UPDATE contacts SET
  firm = 'Modern Wealth Management (formerly Brown & Company)',
  address = '250 Fillmore Street, Suite 475',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Brown & Company" (LPL Financial-affiliated, ~$1B AUM) was acquired by Modern Wealth Management (RIA backed by Crestview Partners) via asset purchase agreement announced ~April 22, 2026, Modern Wealth''s 21st acquisition, firm total AUM now >$13B. Managing Director, CFP, Modern Wealth Management, Denver CO (~42 yrs in industry). Named to Barron''s Top Financial Advisors every year 2008-2026 (18 consecutive years); ranked #9 Colorado, Forbes Best-in-State 2025. Phone was previously unrecorded — could not confirm complete number, recommend follow-up. Note: a "Mark Raymond Brown" (CRD 7128192, Empower Advisory Group, registered since 2024) surfaced in search but is almost certainly a different, unrelated individual — do not conflate.')), 512)
WHERE id = 1098;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1098, x.name, x.role FROM (
  SELECT 'Danielle Berz, CFP' AS name, 'Managing Director, Modern Wealth Management (Denver)' AS role
  UNION ALL SELECT 'Justin Cassida, MBA, CFP', 'Managing Director (leads Denver client service), Modern Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1098) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1098 AND name = x.name);

-- ===== GROUP 744: Merrill Wealth Management, Scottsdale, AZ =====
-- 1100 Scot Benefiel (The Benefiel Group)
UPDATE contacts SET
  address = '14636 N Scottsdale Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, Senior Vice President, leads "The Benefiel Group" (multi-generational team, prior CPA at Price Waterhouse Phoenix 1984-1988, with Merrill since 1988), Merrill Scottsdale AZ. Named to Barron''s Top 1,200 (source list). Phone confirmed correct (480) 624-0437. COMPLIANCE FLAG (UNVERIFIED — factual caveat, not a confirmed record): a secondary/non-primary-source aggregator (not FINRA BrokerCheck directly) references a 2003 customer dispute alleging breach of fiduciary duty/misrepresentation, reportedly settled for $275,000, plus a separate mention of a "$1 million complaint" — neither detail was independently verified against the official BrokerCheck record (CRD 1968666); recommend direct manual confirmation before treating as fact.')), 512)
WHERE id = 1100;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1100, x.name, x.role FROM (
  SELECT 'Matthew Benefiel' AS name, 'Financial Advisor (joined 2017), The Benefiel Group' AS role
  UNION ALL SELECT 'Madelaine Steiner, CRPC', 'Registered Wealth Management Client Associate (joined 2021), The Benefiel Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1100) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1100 AND name = x.name);

-- ===== GROUP 745: Merrill Wealth Management, Manchester, NH =====
-- 1102 Sean Doyle (The Doyle Group)
UPDATE contacts SET
  address = '900 Elm St, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, leads "The Doyle Group" (with firm since 1998), Merrill Manchester NH. Forbes Best-in-State New Hampshire annually 2018-2026 (#5 in 2026, #1 in 2018); named to Barron''s Top 1,200 2016-2025. CRM phone (603) 668-4000 does not match found listings — number found (603) 628-3200, flagged for correction.')), 512)
WHERE id = 1102;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1102, x.name, x.role FROM (
  SELECT 'Rachael Doyle' AS name, 'Financial Advisor (co-advisor on team), The Doyle Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1102) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1102 AND name = x.name);

-- ===== GROUP 746: Morgan Stanley Wealth Management, Newport, RI =====
-- 1103 Denise Roberts (The Roberts Mouligné Group)
UPDATE contacts SET
  address = '284 Bellevue Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Portfolio Management Director, Family Wealth Advisor, CFP CRPS CDFA, co-leads "The Roberts Mouligné Group" (~32+ yrs experience, prior Citigroup Global Markets/Smith Barney), Morgan Stanley Newport RI. Ranked #7 Rhode Island, Forbes Best-in-State 2025; ranked #2 Forbes Top Women Wealth Advisors Rhode Island 2025. CRM phone (800) 869-3326 is Morgan Stanley''s generic customer-service line; direct office line (401) 845-3504. COMPLIANCE FLAG (factual record): 1 disclosed customer dispute from a 1994-1999 period (while at Smith Barney) alleging failure to investigate tax-avoidance strategies, unsuitability, and churning — disposition not independently confirmed, recommend direct BrokerCheck review.')), 512)
WHERE id = 1103;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1103, x.name, x.role FROM (
  SELECT 'Colin Roberts' AS name, 'VP, Financial Advisor, Senior Portfolio Manager (joined 2015), The Roberts Mouligné Group' AS role
  UNION ALL SELECT 'Tristan Mouligné', 'Financial Advisor, The Roberts Mouligné Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1103) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1103 AND name = x.name);

-- ===== GROUP 747: Edward Jones, Webster City, IA =====
-- 1104 Timothy Finucan (Finucan Wealth Management)
UPDATE contacts SET
  address = '508 2nd Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor (with firm 39 yrs), leads "Finucan Wealth Management," Edward Jones Webster City IA. Forbes Best-in-State Iowa 2021-2026 (#2 in Iowa 2023); named to Barron''s Top 1,200 2012-2013/2015-2025; named to Forbes/SHOOK America''s Top Wealth Advisors (national, first time) 2026. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct office line (515) 832-4155. COMPLIANCE FLAG (UNVERIFIED — factual caveat, not a confirmed record): a secondary/non-primary-source aggregator (not FINRA BrokerCheck directly) cites 2 historical customer disputes (2008 unauthorized bond purchases, reportedly settled $8,445.39; 2012 dispute re: liquidation of inherited stock positions) — not independently verified against the live BrokerCheck record (CRD 1586731), recommend direct manual confirmation before treating as fact.')), 512)
WHERE id = 1104;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1104, x.name, x.role FROM (
  SELECT 'Sean D. Finucan, CFP' AS name, 'Financial Advisor (family member), Finucan Wealth Management' AS role
  UNION ALL SELECT 'Addison Folcher', 'Associate Financial Advisor, Finucan Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1104) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1104 AND name = x.name);

-- ===== GROUP 748: UBS Wealth Management, Knoxville, TN =====
-- 1105 Stan Jacobs (Jacobs Wealth Management)
UPDATE contacts SET
  address = '608 Mabry Hood Road, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, leads "Jacobs Wealth Management" (with UBS since 2009, prior Dean Witter since 1991), UBS Knoxville TN. Ranked #3 Tennessee, Forbes Best-in-State 2025 (recognized 2019-2026); team part of 32 UBS South Wealth Management Market teams on Forbes Best-in-State Wealth Management Teams (Feb 2025 announcement). CRM phone (800) 354-9103 is UBS''s generic client-relations line; direct office line (865) 483-5636.')), 512)
WHERE id = 1105;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1105, x.name, x.role FROM (
  SELECT 'Brianna Henderson' AS name, 'Client Service Associate, Jacobs Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1105) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1105 AND name = x.name);

-- ===== GROUP 749: OnePoint BFG Wealth Partners (formerly Bleakley Financial Group), Fairfield, NJ =====
-- 1106 Jack Cooney (The Cooney Team)
UPDATE contacts SET
  firm = 'OnePoint BFG Wealth Partners (formerly Bleakley Financial Group)',
  address = '100 Passaic Avenue, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Bleakley Financial Group" rebranded to "OnePoint BFG Wealth Partners" July 2025 (same underlying RIA registration, HQ Parsippany NJ). Managing Partner, Wealth Management Advisor, CPA CLU, leads "The Cooney Team," Fairfield NJ office (~40 yrs experience). Forbes Best-in-State 2019-2025 (#16 North New Jersey 2025); named to Barron''s Top 1,200 2020/2022/2024/2025; Financial Times Top 400 2019. CRM phone (914) 949-8888 could not be verified as belonging to the firm — firm main line found (973) 575-4180, flagged for correction.')), 512)
WHERE id = 1106;

-- ===== GROUP 750: UBS Wealth Management, Omaha, NE =====
-- 1108 Chris Toth (Toth Wealth Management Group)
UPDATE contacts SET
  address = '13815 FNB Parkway, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, CFP CEPA, leads "Toth Wealth Management Group" (with UBS since 2014, prior ~23 yrs Wells Fargo/First Investors), UBS Omaha NE. Ranked #6 Nebraska, Forbes Best-in-State 2026; named to Barron''s Top 1,500 2026; team ranked #7 Nebraska, Forbes Best-in-State Wealth Management Teams 2025 (also 2024/2026). CRM phone (800) 354-9103 is UBS''s generic client-support line; direct team line (402) 963-2990.')), 512)
WHERE id = 1108;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1108, x.name, x.role FROM (
  SELECT 'Stephanie C. Holmgren, CDFA, CFP' AS name, 'Team member (joined 2012), Toth Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1108) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1108 AND name = x.name);

-- ===== GROUP 751: Merrill Wealth Management, Sioux Falls, SD =====
-- 1110 William Lindquist (The Lindquist Group)
UPDATE contacts SET
  address = '110 South Phillips Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Senior Financial Advisor, CRPC, leads "The Lindquist Group," Merrill Sioux Falls SD. Named to Barron''s Top 1,200 2013-2015/2017-2021/2025; Forbes Best-in-State 2019-2025; team ranked #4 South Dakota, Forbes Best-in-State Wealth Management Teams Jan 2026. Phone confirmed correct (800) 637-7455 (matches published number for this office).')), 512)
WHERE id = 1110;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1110, x.name, x.role FROM (
  SELECT 'Steven Lindquist, CFP, CPFA, CPWA, CRPC' AS name, 'Senior Vice President, Wealth Management Advisor, The Lindquist Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1110) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1110 AND name = x.name);

-- ===== GROUP 752: Wells Fargo Advisors, Albuquerque, NM =====
-- 1111 Quentin Heffron (Heffron Marlowe Investment Team)
UPDATE contacts SET
  address = '6501 Americas Parkway NE, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, leads "Heffron Marlowe Investment Team" (rebrand from "Heffron Wealth Management Group," with firm since 2009, prior A.G. Edwards since 1998), Wells Fargo Advisors Albuquerque NM. Named to Barron''s Top 1,200 2023/2025; ranked #3 New Mexico, Forbes Best-in-State 2026 (7 consecutive years); Wells Fargo Platinum Council 2012-2024 (13 consecutive years). CRM phone (877) 879-2495 is Wells Fargo''s generic customer-service line; direct office line (505) 881-5404.')), 512)
WHERE id = 1111;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1111, x.name, x.role FROM (
  SELECT 'Jessica Marlowe, CEPA' AS name, 'Financial Advisor (team co-name partner), Heffron Marlowe Investment Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1111) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1111 AND name = x.name);

-- ===== GROUP 753: Mariner, Louisville, KY =====
-- 1112 Pamela Thompson
UPDATE contacts SET
  address = '4801 Olympia Park Plaza, Suite 3500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Director & Senior Wealth Advisor, Managing Director of the combined Louisville-New Albany office (14 professionals, ~$503M AUM), Mariner Louisville KY. Forbes Top Women Wealth Advisors Best-in-State Kentucky #11 2025 (#1 in 2022); Forbes Best-in-State Wealth Advisors Kentucky #7 2024; named to Barron''s Top 1,200 (#10 Kentucky 2025). CRM phone (913) 647-9700 is Mariner''s Overland Park KS corporate HQ line; direct Louisville office line (502) 233-1970.')), 512)
WHERE id = 1112;

-- ===== GROUP 754: Merrill Wealth Management, Fargo, ND =====
-- 1113 Tom Heilman (Nomeland Heilman Group)
UPDATE contacts SET
  address = '51 Broadway N',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, leads "Nomeland Heilman Group" (commonly branded "The Heilman Group," with firm since 2011), Merrill Fargo ND. Team ranked #2 North Dakota, Forbes Best-in-State Wealth Management Teams Jan 2026; individually ranked #10 North Dakota, Forbes Best-in-State 2026. CRM phone (800) 637-7455 is Merrill''s generic customer-service line; direct office line (701) 241-1234.')), 512)
WHERE id = 1113;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1113, x.name, x.role FROM (
  SELECT 'Joe Heilman, CFP' AS name, 'Wealth Management Advisor (ex-ND House majority caucus chairman), Nomeland Heilman Group' AS role
  UNION ALL SELECT 'Ronald Nomeland', 'Financial Advisor (name-partner, ~22 yrs experience), Nomeland Heilman Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1113) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1113 AND name = x.name);

-- ===== GROUP 755: Steward Partners, Portsmouth, NH =====
-- 1114 Stephen Spector (Spector, Frisch & Reed Private Wealth Management)
UPDATE contacts SET
  address = '145 Maplewood Avenue, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner, Executive Managing Director & Wealth Manager, leads "Spector, Frisch & Reed Private Wealth Management" (~42 yrs experience, prior Wells Fargo Advisors/Raymond James Financial Services), Steward Partners Portsmouth NH. Ranked #5 New Hampshire on a 2024 Barron''s Top 1,200 release; named to Barron''s Top 1,500 2026; ranked #20 New Hampshire, Forbes Best-in-State 2025; team on Forbes Best-in-State Wealth Management Teams 2026. Phone confirmed correct (866) 694-7769 (firm-wide main line). COMPLIANCE NOTE (firm-level, not tied to Spector individually): a law-firm blog post references a FINRA censure/fine (~$225,000) against Steward Partners Investment Solutions LLC (the firm) — underlying conduct unconfirmed, noted for context only.')), 512)
WHERE id = 1114;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1114, x.name, x.role FROM (
  SELECT 'Peter Frisch' AS name, 'Team member, Spector, Frisch & Reed Private Wealth Management' AS role
  UNION ALL SELECT 'Tobe Reed', 'Team member, Spector, Frisch & Reed Private Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1114) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1114 AND name = x.name);

-- ===== GROUP 756: Raymond James, Ridgeland, MS =====
-- 1115 Arthur Finkelberg (Finkelberg Investments)
UPDATE contacts SET
  address = '1062 Highland Colony Parkway, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Investments and Managing Director, Investments, CFA CFP AIF, leads "Finkelberg Investments" (4 professionals, 75+ combined yrs, ~$800M+ client assets, ~40 yrs experience), Raymond James Ridgeland MS. Named to Barron''s Top 1,200 annually 2014-2025; ranked #2 Mississippi, Forbes Best-in-State 2025. CRM phone (800) 248-8863 is Raymond James'' generic national line; direct branch line (601) 607-7206.')), 512)
WHERE id = 1115;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1115, x.name, x.role FROM (
  SELECT 'Davis Bourne, CFA' AS name, 'Senior Investment Portfolio Analyst, Finkelberg Investments' AS role
  UNION ALL SELECT 'Sally Steen Avalon, CFP', 'Senior Registered Client Service Associate, Finkelberg Investments'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1115) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1115 AND name = x.name);

-- ===== GROUP 757: Edward Jones, Dakota Dunes, SD =====
-- 1116 Jon Hauger (Hauger Wealth Management Group)
UPDATE contacts SET
  address = '400 Gold Circle, Suite 210',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP AAMS, Edward Jones Limited Partner (since 2003), formalized "Hauger Wealth Management Group" May 2025 (with firm since 2000), Dakota Dunes SD. Named to Barron''s Top 1,200 2022-2025/Top 1,500 2026. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (605) 232-8841.')), 512)
WHERE id = 1116;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1116, x.name, x.role FROM (
  SELECT 'Eric Peters' AS name, 'Financial Advisor, Hauger Wealth Management Group' AS role
  UNION ALL SELECT 'Jackson Glodowski', 'Financial Advisor, Hauger Wealth Management Group'
  UNION ALL SELECT 'Colton Irlbeck', 'Financial Advisor, Hauger Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1116) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1116 AND name = x.name);

-- ===== GROUP 758: North Point Wealth Management, Tigard, OR =====
-- 1117 Mitchell Rask
UPDATE contacts SET
  address = '7185 SW Sandburg Street, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner (title upgrade from generic "Financial Advisor"), North Point Wealth Management (fee-based/fiduciary RIA, LPL Financial-affiliated, founded 2001), Tigard OR (~20+ yrs experience). No Barron''s/Forbes recognition independently corroborated in this research despite CRM sourcing him from a Barron''s Top 1,200 list — recommend double-checking the original source entry. CRM phone (503) 639-5100 could not be confirmed — number found (971) 371-4414, flagged for correction.')), 512)
WHERE id = 1117;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1117, x.name, x.role FROM (
  SELECT 'Christopher Rask' AS name, 'Partner, Wealth Advisor (likely family relation), North Point Wealth Management' AS role
  UNION ALL SELECT 'Jane Miller', 'Wealth Advisor/Partner, North Point Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1117) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1117 AND name = x.name);

-- ===== GROUP 759: UBS Wealth Management, South Burlington, VT =====
-- 1118 Timothy O'Brien
UPDATE contacts SET
  address = '38 Eastwood Drive, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, Wealth Advisor (with UBS/predecessor PaineWebber since 1990, branch manager 1995-2001), UBS South Burlington VT. Named to Barron''s Top 1,200 every year since 2010 (also Barron''s Top 1,000 2011-2013); Forbes Best-in-State 2024/2025. CRM phone (800) 354-9103 is UBS''s generic national client-support line; direct branch line (802) 860-5728.')), 512)
WHERE id = 1118;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1118, x.name, x.role FROM (
  SELECT 'Stefanie C. Gretkowski, CFP, CDFA' AS name, 'Co-Financial Advisor (joined 1998), team of Timothy O''Brien' AS role
  UNION ALL SELECT 'Jennifer Christoffel McGrath', 'Senior Registered Client Associate (with firm since 1994), team of Timothy O''Brien'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1118) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1118 AND name = x.name);

-- ===== GROUP 760: UBS Wealth Management, Tulsa, OK =====
-- 1119 Donald Jackson (The Jackson Group)
UPDATE contacts SET
  address = '6120 South Yale Avenue, Suite 1800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Portfolio Manager, CFP CIMA CEPA (with UBS since 1994), leads "The Jackson Group," UBS Tulsa OK. UBS Wealth Management Chairman''s Council 2026; named to Barron''s Top 1,200 2014-2025/Top 1,500 2026; Forbes Best-in-State 2018-2025; team named Forbes Best-in-State Wealth Management Team 2024. CRM phone (800) 354-9103 is UBS''s generic national client-support line (also shared, likely a data-entry artifact, with id 1118 in the same batch) — direct branch line (918) 712-3162.')), 512)
WHERE id = 1119;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1119, x.name, x.role FROM (
  SELECT 'Spencer Carlin' AS name, 'Primary client-inquiry/service contact, The Jackson Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1119) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1119 AND name = x.name);
