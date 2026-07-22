-- US Financial Advisor enrichment, batch 37 (20 contacts / 20 groups).
--
-- Firm-change notes (advisor stayed, entity/affiliation changed):
-- 1073 Kevin Spahn — "Spahn Financial" (formerly Northwestern Mutual
-- affiliated) was acquired by OnePoint BFG Wealth Partners (deal
-- closed Oct 21, 2025, ~$2B AUM); his NM broker-dealer registration
-- ended Oct 2025. Firm field updated.
--
-- Name correction: 1091 Robert Daddario — correct spelling is "Robert
-- D'Addario" per firm records; CRM name field flagged, not changed
-- (name changes handled separately from this enrichment pass per
-- convention — noted in data_flags for follow-up).
--
-- Compliance flags (factual record, not data errors):
-- 1086 Stephen Engro (Beacon Financial Group, Dallas TX) — BrokerCheck
-- discloses a reprimand for violating the Texas Securities Act and
-- Texas State Securities Board Rules, stemming from a client
-- complaint alleging misrepresentation re: Cole Credit Property Trust
-- II (~2008). This is a regulatory reprimand, not merely a customer
-- dispute.
-- 1081 Kevin Ryan (UBS, Rocky River OH) — 1 disclosed customer dispute
-- alleging he pressured a client into a bond fund purchase; advisor
-- denies the allegations.
-- 1089 Andrew Sullivan (Sullivan & Schlieman Wealth Mgmt, Alpharetta
-- GA) — 1 disclosed customer complaint (while at SunTrust) re:
-- unsuitable municipal bond fund recommendations; resolved Closed -
-- No Action/Withdrawn/Dismissed/Denied in the advisor's favor.
-- 1090 Jeffrey Crosby (Ameriprise, Kirkland WA) — SIGNIFICANT: 5
-- disclosure events including a 2003-filed dispute re: investment
-- management/stock-option handling (settled by American Express
-- Financial Advisors, an Ameriprise predecessor, for $410,000) and an
-- associated allegation of forging client initials on account
-- documents and being improperly licensed (settled for $70,000); plus
-- a smaller 2012 REIT-related dispute ($11,000 requested). Materially
-- higher disclosure severity than typical for this list — recommend
-- direct BrokerCheck confirmation before any compliance-sensitive use.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings); phone column left untouched per convention.

-- ===== GROUP 721: MAI Capital Management, Madison, CT =====
-- 1071 Patrick Gingras
UPDATE contacts SET
  address = '90 Wall St, Unit 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director and Regional President (Connecticut region), MAI Capital Management LLC (co-founded Brenton Point Wealth Advisors 2017, acquired by MAI Jan 2022, ~$725M AUM at acquisition), Madison CT. Forbes Best-in-State Connecticut recurring 2025/2026; named to Barron''s state-by-state Top 1,500 (Connecticut) 2026. Phone was previously unrecorded — found office main line (203) 318-7160.')), 512)
WHERE id = 1071;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1071, x.name, x.role FROM (
  SELECT 'Cara Wardley' AS name, 'Manager, Business Operations & Director, MAI Capital Management (Madison CT)' AS role
  UNION ALL SELECT 'Matthew Wu', 'Wealth Advisor and Director, MAI Capital Management (Madison CT)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1071) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1071 AND name = x.name);

-- ===== GROUP 722: Spahn Financial | OnePoint BFG Wealth Partners (formerly Northwestern Mutual), Lombard, IL =====
-- 1073 Kevin Spahn
UPDATE contacts SET
  firm = 'Spahn Financial | OnePoint BFG Wealth Partners (formerly Northwestern Mutual)',
  address = '377 E Butterfield Rd, Suite 430',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Spahn Financial" was acquired by OnePoint BFG Wealth Partners (RIA backed by Rise Growth Partners), deal closed Oct 21, 2025 — OnePoint BFG''s largest deal to date; his Northwestern Mutual broker-dealer registration ended Oct 2025. Equity Partner, Spahn Financial, Lombard IL, CFP ChFC CLU (founded practice 1993/94, prior practicing attorney). Forbes Top Financial Security Professional; team ranked #16 Illinois, Forbes Best-in-State Wealth Management Teams 2025; Financial Times Top 400 Advisors. CRM phone (866) 950-4644 is the old NM national line, now stale — current number (630) 458-7024, flagged for correction.')), 512)
WHERE id = 1073;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1073, x.name, x.role FROM (
  SELECT 'Timothy Funke' AS name, 'Equity Partner, Spahn Financial' AS role
  UNION ALL SELECT 'Kyle DeRaedt', 'Equity Partner, Spahn Financial'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1073) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1073 AND name = x.name);

-- ===== GROUP 723: UBS Private Wealth Management, Plano, TX =====
-- 1075 Ira Kravitz (The Kravitz Group)
UPDATE contacts SET
  address = '5400 Independence Parkway, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, leads "The Kravitz Group" (with UBS since 2008, prior 17 yrs Morgan Stanley SVP), UBS Plano TX. UBS Pinnacle Council; named to Barron''s Top 1,200 2015-2019; Financial Times Top 400 2015/2016; Forbes Best-in-State 2018/2019; team on Forbes Best-in-State Wealth Management Teams 2024-2026 (#11 Texas-North 2025). CRM phone (800) 354-9103 is UBS''s generic client-relations line; direct team line (972) 424-7547.')), 512)
WHERE id = 1075;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1075, x.name, x.role FROM (
  SELECT 'Jayme Kravitz (Burk)' AS name, 'Financial Advisor (daughter, joined 2018), The Kravitz Group' AS role
  UNION ALL SELECT 'Hannah Zogzas', 'Senior Wealth Strategy Associate (joined 2016), The Kravitz Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1075) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1075 AND name = x.name);

-- ===== GROUP 724: Merrill Wealth Management, East Lansing, MI =====
-- 1076 Marc Merritt (The BZEMS Group)
UPDATE contacts SET
  address = '2501 Coolidge Road, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, Portfolio Manager, CEPA CFP CPFA CRPC, co-founder of "The BZEMS Group" (with firm since 2003), Merrill East Lansing MI. Ranked #22 Michigan, Forbes Best-in-State 2024/2025; team on Forbes Best-in-State Wealth Management Teams 2024-2026. CRM phone (800) 637-7455 is Merrill''s generic customer-service line; direct team line (517) 324-4639.')), 512)
WHERE id = 1076;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1076, x.name, x.role FROM (
  SELECT 'Richard Sneary, CRPC' AS name, 'Senior Vice President, Senior Financial Advisor, The BZEMS Group' AS role
  UNION ALL SELECT 'Andrew Soontharotoke, CFP', 'Vice President, Wealth Planner, The BZEMS Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1076) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1076 AND name = x.name);

-- ===== GROUP 725: Merrill Wealth Management, St. Petersburg, FL =====
-- 1077 Joel Manings (The Manings Group)
UPDATE contacts SET
  address = '200 Central Ave, Suite 1400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Senior Portfolio Manager, CRPC ChFC, leads "The Manings Group" (with firm since 1991), Merrill St. Petersburg FL. Named to Barron''s Top 1,200 2025; team on Forbes Best-in-State Wealth Management Teams 2025/2026. Phone was previously unrecorded — found (727) 824-7398.')), 512)
WHERE id = 1077;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1077, x.name, x.role FROM (
  SELECT 'Amory Sanders' AS name, 'Wealth Management Advisor (with firm since 1996), The Manings Group' AS role
  UNION ALL SELECT 'Elizabeth Hazen, CRPC', 'Financial Advisor (joined Nov 2014), The Manings Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1077) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1077 AND name = x.name);

-- ===== GROUP 726: Merrill Wealth Management, Ridgefield, CT =====
-- 1078 Matthew Tackman
UPDATE contacts SET
  address = '63 Copps Hill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Managing Director, Managing Partner, CPWA CEPA CPFA (~17 yrs experience), Merrill Ridgefield CT. Team name unsettled across sources (found as "The Tackman Group," "The Nuland Chase Tackman Group," "The Tackman-Nuland-Chase Group") — likely mid-rebrand, recommend confirming current name directly. Forbes Best-in-State recurring 2021-2026; named to Barron''s Top 1,200 2025/Top 1,500 2026; team ranked #15 Connecticut, Forbes Best-in-State Wealth Management Teams 2024. Phone was previously unrecorded — candidate numbers (203) 894-7801 / (203) 894-7820 found, flagged for verification.')), 512)
WHERE id = 1078;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1078, x.name, x.role FROM (
  SELECT 'Timothy Nuland' AS name, 'Team member, Tackman team' AS role
  UNION ALL SELECT 'Jonathan Chase', 'Team member, Tackman team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1078) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1078 AND name = x.name);

-- ===== GROUP 727: Millennium Private Wealth, Tucson, AZ =====
-- 1079 Brian Crawford
UPDATE contacts SET
  address = '3573 E. Sunrise Dr, Suite 225',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Owner, CFP, co-founder of Millennium Private Wealth (Tucson office, operates under Wells Fargo Advisors Financial Network/FiNet, registered firm-of-record effective 1/20/2023), Tucson AZ. Ranked #14 Arizona, Forbes Best-in-State 2026; named to Barron''s Top 1,200 recurring years 2019-2024. CRM phone (520) 777-7000 does not match current listings — number found (520) 613-0350, flagged for correction. Note: unrelated "Bryan Crawford" is a Charles Schwab consultant in California — do not conflate.')), 512)
WHERE id = 1079;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1079, x.name, x.role FROM (
  SELECT 'Harlie Garcia' AS name, 'Managing Director/Owner, Millennium Private Wealth' AS role
  UNION ALL SELECT 'Will Giddens', 'Managing Director/Owner, Millennium Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1079) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1079 AND name = x.name);

-- ===== GROUP 728: Raymond James, Virginia Beach, VA =====
-- 1080 John Gill (Gill, Horner & Haggerty Wealth Partners)
UPDATE contacts SET
  address = '300 32nd St, Ste 520',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "Gill, Horner & Haggerty Wealth Partners" (team rebrand from "Gill & Horner Wealth Management Group," joined Raymond James 4/22/2021 from Truist after 35 yrs), Virginia Beach VA. Forbes Best-in-State 2021/2023; named to Barron''s Top 1,200 2021; team ranked #10 Virginia-South, Forbes Best-in-State Wealth Management Teams Jan 2026. CRM phone (800) 248-8863 is Raymond James'' generic national line; direct branch line (757) 417-1733.')), 512)
WHERE id = 1080;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1080, x.name, x.role FROM (
  SELECT 'Bryan Horner' AS name, 'Senior VP, Investments/Investment Management Consultant, Gill, Horner & Haggerty Wealth Partners' AS role
  UNION ALL SELECT 'Joshua Haggerty, CFA', 'Senior Investment/Portfolio Analyst, Gill, Horner & Haggerty Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1080) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1080 AND name = x.name);

-- ===== GROUP 729: UBS Wealth Management, Rocky River, OH =====
-- 1081 Kevin Ryan (The Ryan Wealth Management Group)
UPDATE contacts SET
  address = '18500 Lake Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, Branch Manager (18+ yrs), leads "The Ryan Wealth Management Group" (with UBS/predecessors 30+ yrs), UBS Rocky River OH. Ranked #6 Ohio, Forbes Best-in-State 2026; UBS Wealth Management Pinnacle Council 2025; ~$1.1B+ client assets; Crain''s Cleveland Business Notables in Finance 2022. CRM phone (800) 354-9103 is UBS''s generic client-relations line; direct branch line (440) 356-8064. COMPLIANCE FLAG (factual record): 1 disclosed customer dispute alleging he pressured a client into a bond fund purchase against her wishes (>$5,000 claimed) — advisor denies the allegations as without merit, resolution unconfirmed.')), 512)
WHERE id = 1081;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1081, x.name, x.role FROM (
  SELECT 'John Ryan' AS name, 'Financial Advisor (joined 2015), The Ryan Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1081) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1081 AND name = x.name);

-- ===== GROUP 730: Raymond James, Beaver, PA =====
-- 1082 Samuel Spanos (Spanos Group)
UPDATE contacts SET
  address = '1069 3rd Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Investments, Managing Director, Branch Manager, CRPC, leads "Spanos Group" (moved team to Raymond James Dec 2014 from Merrill Lynch, ~$1B+ team AUM as of Apr 2025), Beaver PA. Named to Barron''s Top 1,200 2019-2025 (7 consecutive yrs); Forbes Best-in-State 2018-2025 (#25 Pennsylvania-West Jan 2026); Financial Times Top 400 2017-2020. CRM phone (800) 248-8863 is Raymond James'' generic corporate line; direct branch line (724) 371-2001.')), 512)
WHERE id = 1082;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1082, x.name, x.role FROM (
  SELECT 'Todd C. Todorich, CRPC' AS name, 'SVP, Investments, Spanos Group' AS role
  UNION ALL SELECT 'Robert M. Lewis, CRPC', 'SVP, Investments, Spanos Group'
  UNION ALL SELECT 'Gennaro A. Marsico, JD, CFP, CIMA', 'SVP, Investments, Spanos Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1082) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1082 AND name = x.name);

-- ===== GROUP 731: UBS Wealth Management, Paramus, NJ =====
-- 1083 Karl Kreshpane (Kreshpane Wealth Management)
UPDATE contacts SET
  address = '61 South Paramus Road, Mack Center IV, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Portfolio Manager, leads "Kreshpane Wealth Management" (with UBS since 2016, prior 22 yrs Morgan Stanley/Smith Barney), UBS Paramus NJ. Team named to Forbes Best-in-State Wealth Management Teams 2023-2026 (#34 New Jersey-North Jan 2025). CRM phone (201) 986-4200 could not be confirmed — direct line found (201) 678-2302, flagged for correction.')), 512)
WHERE id = 1083;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1083, x.name, x.role FROM (
  SELECT 'Karl Kreshpane Jr., CFP' AS name, 'Vice President (son), Kreshpane Wealth Management' AS role
  UNION ALL SELECT 'Steven Syslo', 'Team member (with Karl since 2016, prior Morgan Stanley), Kreshpane Wealth Management'
  UNION ALL SELECT 'Joseph Haynes', 'Team member (with Karl since 1992), Kreshpane Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1083) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1083 AND name = x.name);

-- ===== GROUP 732: Janney Montgomery Scott, Yardley, PA =====
-- 1084 Peter Sargent (Sargent Wealth Management)
UPDATE contacts SET
  address = '1010 Stony Hill Road, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management, CFA CFP (~30 yrs experience), leads "Sargent Wealth Management" (name shows recent transition from "Sargent Private Wealth"; also offices Raleigh NC and Mount Laurel NJ), Janney Montgomery Scott Yardley PA. Named to Barron''s Top 1,200 2009/2010/2012/2017-2025; Forbes Best-in-State every year since 2018; team on Forbes Best-in-State Wealth Management Teams 2025 (~$1B team AUM). CRM phone (800) 526-6397 is Janney''s generic national line; direct office line (267) 685-4205.')), 512)
WHERE id = 1084;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1084, x.name, x.role FROM (
  SELECT 'Ryan Hamilton' AS name, 'Financial Advisor (Forbes Best-in-State Next-Gen Wealth Advisor), Sargent Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1084) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1084 AND name = x.name);

-- ===== GROUP 733: Beacon Financial Group, Dallas, TX =====
-- 1086 Stephen Engro
UPDATE contacts SET
  address = '17300 Preston Rd, Suite 120',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & Founder, Beacon Financial Group (founded 1995, ~$1.1B AUM, 16 employees, operates via Kestra Investment Services/Kestra Advisory Services), Dallas TX. Ranked #7 Dallas-Fort Worth, Forbes Best-in-State 2026. CRM phone (972) 931-0250 does not match found listings — number found (972) 726-9888, flagged for correction. COMPLIANCE FLAG (factual record): BrokerCheck discloses a reprimand for violating the Texas Securities Act and Texas State Securities Board Rules, stemming from a client complaint alleging misrepresentation re: Cole Credit Property Trust II (~2008) — exact order date/status unconfirmed, recommend manual review.')), 512)
WHERE id = 1086;

-- ===== GROUP 734: Sullivan & Schlieman Wealth Management, Alpharetta, GA =====
-- 1089 Andrew Sullivan
UPDATE contacts SET
  address = '5755 North Point Parkway, Suite 207',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner & Wealth Advisor, CFP, co-founded Sullivan & Schlieman Wealth Management LLC (2008, ~$1B firm AUM, LPL Financial-affiliated; legal first name Shannon, goes by Andrew), Alpharetta GA (also office Gainesville GA). Ranked #2 Georgia, Forbes/SHOOK Best-in-State 2025 (annually since 2021). CRM phone (770) 619-3614 could not be found in public listings — firm main line (678) 867-0500, flagged for verification (770 number may still be a valid direct/mobile line). COMPLIANCE FLAG (factual record): 1 disclosed customer complaint (while at SunTrust) re: unsuitable municipal bond fund recommendations — resolved Closed-No Action/Withdrawn/Dismissed/Denied in the advisor''s favor.')), 512)
WHERE id = 1089;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1089, x.name, x.role FROM (
  SELECT 'Josh Schlieman, CFP' AS name, 'Co-founder/Partner, Wealth Advisor (oversees Gainesville office), Sullivan & Schlieman Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1089) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1089 AND name = x.name);

-- ===== GROUP 735: Ameriprise Financial, Kirkland, WA =====
-- 1090 Jeffrey Crosby (Crosby Wealth Advisors)
UPDATE contacts SET
  address = '4055 Lake Washington Blvd NE, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CLU, leads "Crosby Wealth Advisors" (with Ameriprise/predecessors since ~1994, career start 1983), Kirkland WA. Named to Barron''s Top 1,200 annually 2014-2025/Top 1,500 2026; ranked #36 Washington, Forbes Best-in-State 2023. CRM phone (800) 297-7378 is Ameriprise''s generic line; direct office line (425) 869-7100. COMPLIANCE FLAG (factual record, SIGNIFICANT — materially higher severity than typical): BrokerCheck-indexed record shows 5 disclosure events including a 2003-filed dispute re: investment management/stock-option handling (settled by American Express Financial Advisors, an Ameriprise predecessor, for $410,000) and an associated allegation of forging client initials on account documents and being improperly licensed (settled for $70,000), plus a smaller 2012 REIT-related dispute ($11,000 requested) — recommend direct BrokerCheck confirmation before any compliance-sensitive use.')), 512)
WHERE id = 1090;

-- ===== GROUP 736: Merrill Wealth Management, Summit, NJ =====
-- 1091 Robert Daddario (The D'Addario Group)
UPDATE contacts SET
  address = '1 DeForest Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CPM CPWA CRPC CPFA (with firm 30+ yrs), leads "The D''Addario Group," Merrill Summit NJ. Named to Barron''s Top 1,200 2022/2025; Forbes Best-in-State 2018-2024 (7 consecutive yrs). CRM phone (800) 637-7455 is Merrill''s generic toll-free line; direct team line (908) 203-3712. NAME SPELLING FLAG: correct spelling per firm records is "Robert D''Addario" — CRM name field shows "Daddario," recommend correcting.')), 512)
WHERE id = 1091;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1091, x.name, x.role FROM (
  SELECT 'John D''Addario' AS name, 'Team member (likely relative), The D''Addario Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1091) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1091 AND name = x.name);

-- ===== GROUP 737: Merrill Wealth Management, Wayne, NJ =====
-- 1092 Paul Renfro (Vivino, Renfro & Miller)
UPDATE contacts SET
  address = '1700 Route 23, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, CFP CIMA, part of "Vivino, Renfro & Miller," Merrill Wayne NJ. Ranked #28 New Jersey, Forbes Best-in-State 2026; team ranked #78 Forbes Best-in-State Wealth Management Teams (New Jersey-North) 2025. CRM phone (800) 637-7455 is Merrill''s generic customer-service line; branch direct line (973) 305-3800.')), 512)
WHERE id = 1092;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1092, x.name, x.role FROM (
  SELECT 'Bruce Vivino' AS name, 'Financial Advisor, Vivino, Renfro & Miller' AS role
  UNION ALL SELECT 'Michael E. Miller', 'Financial Advisor, Vivino, Renfro & Miller'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1092) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1092 AND name = x.name);

-- ===== GROUP 738: Merrill Wealth Management, Huntersville, NC =====
-- 1093 Charles Utz (Utz Keller Wealth Management Group)
UPDATE contacts SET
  address = '8015 Kenton Circle, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Resident Director-Wealth Management Advisor, Managing Director (with firm since 2000), leads "Utz Keller Wealth Management Group," Merrill Huntersville NC. Named to Barron''s Top 1,200 2021/2025; Forbes Best-in-State 2022-2025; team ranked #19 North Carolina-West, Forbes Best-in-State Wealth Management Teams 2025/2026. CRM phone (800) 637-7455 is Merrill''s generic customer-service line; branch numbers in the (704) 987-41xx range.')), 512)
WHERE id = 1093;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1093, x.name, x.role FROM (
  SELECT 'Robert Keller, CFP, CPFA' AS name, 'Financial Advisor/partner, Utz Keller Wealth Management Group' AS role
  UNION ALL SELECT 'Zoran Smiljanic', 'Vice President, Senior Financial Advisor, Utz Keller Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1093) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1093 AND name = x.name);

-- ===== GROUP 739: Truist Investment Services, Allentown, PA =====
-- 1094 Doug Leonzi (The Leonzi Group)
UPDATE contacts SET
  address = '645 Hamilton Street, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director, Financial Advisor, leads "The Leonzi Group" (~23 yrs experience), Truist Investment Services/Truist Wealth Allentown PA. Team on Forbes Best-in-State Wealth Management Teams 2023-2026; named to Barron''s Top 1,500 2026; Truist Sterling Performer Award 5 consecutive years; team featured in Entrepreneur, Fortune, Bloomberg Businessweek 2024. CRM phone (800) 274-5263 does not match Truist''s known lines — direct team line (610) 882-5376, flagged for correction.')), 512)
WHERE id = 1094;

-- ===== GROUP 740: Merrill Private Wealth Management, Memphis, TN =====
-- 1095 Stephen Weatherly (Weatherly & Associates)
UPDATE contacts SET
  address = '6060 Poplar Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director, CPWA CRPC (~28-32 yrs experience), leads "Weatherly & Associates," Merrill Private Wealth Management Memphis TN. Ranked #2 Tennessee, Forbes Best-in-State 2025. CRM phone (901) 537-4000 does not match found listings — number found (901) 756-2177, flagged for correction. Note: unrelated "Weatherly Asset Management" (California firm) surfaces in searches — do not conflate.')), 512)
WHERE id = 1095;
