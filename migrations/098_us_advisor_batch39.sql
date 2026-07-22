-- US Financial Advisor enrichment, batch 39 (20 contacts / 20 groups).
--
-- Firm-name/team updates (advisor stayed, practice name change):
-- 1122 Heather Robison — practices as "Fourstone Wealth Management,
-- LLC" (rebrand of "Susan Dick Financial Services, LLC" ~2007) under
-- Raymond James Financial Services. Firm field updated.
-- 1130 William Wheatley — team rebrand to "Wheatley McCutcheon Wealth
-- Management" (partner Nicholas McCutcheon added to team brand).
-- 1139 Gail Utter — team rebrand from "Utter Wealth Management Group"
-- to "Utter, Pike & Dobbs Private Wealth Management Group."
-- 1138 Thais Piotrowski — solo practice integrated into "Premier
-- Wealth Partners" (multi-office Ameriprise practice).
--
-- Compliance flags (factual record, not data errors):
-- 1138 Thais Piotrowski (Ameriprise, Boca Raton FL) — 3 disclosed
-- customer disputes: 2009 unauthorized-trading allegation (denied by
-- firm), 2013 unsuitable variable annuity allegation, and a 2022
-- allegation re: unsuitable/aggressive alternative investments (BDCs),
-- $150,000 sought — resolution status unconfirmed, recommend direct
-- BrokerCheck review.
-- 1131 Michael Kanner (Raymond James, Vero Beach FL) — 2 historical
-- customer disputes per secondary reporting: one closed without
-- action (customer withdrew), one settled for ~$5,000 re: unsuitable
-- bond investments (appears tied to his Edward Jones-era business,
-- pre-2009) — not independently re-confirmed against live BrokerCheck.
--
-- Several other advisors this batch (Christine Satterfield, Michael
-- Allard, Nazie Saffari-Moini, Randy Halfpop) surfaced unverified
-- negative allegations on non-regulatory "gripe" aggregator sites —
-- these are explicitly NOT treated as compliance facts and are
-- omitted from data_flags; only FINRA/SEC-sourced items are recorded.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings); phone column left untouched per convention.

-- ===== GROUP 761: The Compass Wealth Group, Cheyenne, WY =====
-- 1120 Randy Halfpop
UPDATE contacts SET
  address = '5920 Yellowstone Road, Suite 3',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Owner, CFP, co-founded The Compass Wealth Group LLC (2011, Raymond James Financial Services affiliate), Cheyenne WY (also CO satellite locations). Ranked #25 (listed under Colorado), Forbes Best-in-State 2025. CRM phone (307) 632-5071 does not match current published number — number found (307) 635-6644, flagged for correction.')), 512)
WHERE id = 1120;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1120, x.name, x.role FROM (
  SELECT 'Jess Ryan, CFP, CEPA, AIF' AS name, 'Advisor, The Compass Wealth Group' AS role
  UNION ALL SELECT 'Cherie Przymus', 'Financial Advisor, Registered Paraplanner, Client Service Manager (with firm since 2012), The Compass Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1120) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1120 AND name = x.name);

-- ===== GROUP 762: Edward Jones, Aberdeen, SD =====
-- 1121 Kelly Rae Haskell (Haskell Wealth Management)
UPDATE contacts SET
  address = '631 S Roosevelt St, Ste B',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP ChFC AFFP, leads "Haskell Wealth Management" (Edward Jones branded practice, career start 2001), Aberdeen SD. Ranked #3 South Dakota, Forbes Best-in-State 2025; #1 South Dakota, Forbes Top Women Wealth Advisors 2025; 9x Edward Jones Managing Partner''s Conference qualifier; 9x Barron''s Top Women Advisors Summit invitee. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (605) 225-2600.')), 512)
WHERE id = 1121;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1121, x.name, x.role FROM (
  SELECT 'Kylie Vogel' AS name, 'Associate Financial Advisor, Haskell Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1121) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1121 AND name = x.name);

-- ===== GROUP 763: Fourstone Wealth Management | Raymond James, Bartlesville, OK =====
-- 1122 Heather Robison
UPDATE contacts SET
  firm = 'Fourstone Wealth Management | Raymond James Financial Services',
  address = '330 S. Johnstone Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, co-founder/Investment Executive, "Fourstone Wealth Management, LLC" (rebrand of "Susan Dick Financial Services, LLC" ~2007), Raymond James Financial Services affiliate, Bartlesville OK. Ranked #1 Oklahoma, Forbes Best-in-State 2023/2024/2025 (#11 nationally 2026); #1 Oklahoma, Forbes Top Women Wealth Advisors; named to Barron''s Top 1,200 2025; Raymond James Chairman''s Council 2025. CRM phone (800) 248-8863 is Raymond James'' generic national line; direct branch line (918) 336-5400.')), 512)
WHERE id = 1122;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1122, x.name, x.role FROM (
  SELECT 'Susan Dick, CPA' AS name, 'Investment Executive (co-founder/mother), Fourstone Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1122) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1122 AND name = x.name);

-- ===== GROUP 764: Vincent Financial Services, Riverton, WY =====
-- 1123 Jeffrey Vincent
UPDATE contacts SET
  address = '308 East Main St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/President, CFP, Vincent Financial Services (LPL Financial affiliate, founded 1991, also offices Lander WY/Dubois WY), Riverton WY. Ranked #1 Wyoming, Barron''s Top 1,000/1,200 (2011-2013, again per 2026 LPL announcement); ranked #1 Wyoming, Forbes Best-in-State Apr 2026. CRM phone (307) 856-3737 does not match current published number — number found (307) 856-9788, flagged for correction. Note: unrelated "307 Financial Services" (founded by Mike Zirbel) also operates in Riverton — do not conflate.')), 512)
WHERE id = 1123;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1123, x.name, x.role FROM (
  SELECT 'Liam Vincent' AS name, 'Financial Advisor (likely relative), Vincent Financial Services' AS role
  UNION ALL SELECT 'Robert Olson', 'Advisor, Vincent Financial Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1123) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1123 AND name = x.name);

-- ===== GROUP 765: Raymond James, Eagle, ID =====
-- 1124 Christine Satterfield (Satterfield Wealth Strategies)
UPDATE contacts SET
  address = '729 S. Bridgeway Place',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor & Managing Director, CRPC CPWA, leads "Satterfield Wealth Strategies" (with Raymond James since 2021, prior Wells Fargo Advisors/Merrill), Eagle ID. Ranked #18 Idaho, Forbes Best-in-State 2024; #4 Idaho, Forbes Best-in-State Women Advisors 2023. CRM phone (800) 248-8863 is Raymond James'' generic national line; direct office line (208) 515-3540.')), 512)
WHERE id = 1124;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1124, x.name, x.role FROM (
  SELECT 'Sharon Kaylor, CRPC' AS name, 'Practice Business Manager, Satterfield Wealth Strategies' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1124) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1124 AND name = x.name);

-- ===== GROUP 766: Edward Jones, Lander, WY =====
-- 1125 Lonnie Bull (Bull Wealth Management Group)
UPDATE contacts SET
  address = '115 Valley View Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP ChFC CIMA AAMS CRPS, leads "Bull Wealth Management Group" (with firm ~19 yrs), Edward Jones Lander WY (office recently relocated within Lander). Ranked #5 Wyoming, Forbes Best-in-State 2025. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (307) 332-3800.')), 512)
WHERE id = 1125;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1125, x.name, x.role FROM (
  SELECT 'Alex Kentner, AAMS' AS name, 'Associate Financial Advisor, Bull Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1125) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1125 AND name = x.name);

-- ===== GROUP 767: Edward Jones, Cody, WY =====
-- 1126 Dan Stevens
UPDATE contacts SET
  address = '1121 13th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFA CEPA (with firm since 2004), Edward Jones Cody WY. Named to Barron''s Top 1,200 2025; ranked #6 Wyoming, Forbes Best-in-State 2025. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (307) 587-1000. Note: a second, separate Edward Jones office (advisor Kelby Q Scott) also operates in Cody 82414 — do not conflate branch staff.')), 512)
WHERE id = 1126;

-- ===== GROUP 768: Ameriprise Financial (TruSpire Wealth Advisors), Plymouth Meeting, PA =====
-- 1127 Kimberly St. Pierre
UPDATE contacts SET
  firm = 'TruSpire Wealth Advisors | Ameriprise Financial',
  address = '1000 Germantown Pike, Ste A1',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor and CEO, CFP APMA, leads "TruSpire Wealth Advisors" (Ameriprise practice, with firm since 2003), Plymouth Meeting PA. Ranked #5 Forbes Best-in-State 2026; named to Forbes Top Women Wealth Advisors Best-in-State 2025/2026; Barron''s Top 100 Women Financial Advisors 2025. CRM phone (800) 297-7378 is Ameriprise''s generic line; direct office line (610) 277-7500.')), 512)
WHERE id = 1127;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1127, x.name, x.role FROM (
  SELECT 'Ivelis Valles, CFP' AS name, 'Advisor, TruSpire Wealth Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1127) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1127 AND name = x.name);

-- ===== GROUP 769: Morgan Stanley Wealth Management, Glens Falls, NY =====
-- 1128 Kathleen Grasmeder (The Table Rock Group)
UPDATE contacts SET
  address = '86 Glen Street, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Portfolio Management Director, leads "The Table Rock Group" (formed 2016 via merger of the Grasmeder Team and Morgan McReynolds Group, ~$1.8B AUM), Morgan Stanley Glens Falls NY. Forbes Best-in-State New York recurring 2017-2026; Forbes Top Women Wealth Advisors 2017-2025; team on Forbes Best-in-State Wealth Management Teams 2024/2025; Morgan Stanley President''s Club/Chairman''s Club. CRM phone (800) 869-3326 is Morgan Stanley''s generic customer-service line; direct branch line (518) 793-4181.')), 512)
WHERE id = 1128;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1128, x.name, x.role FROM (
  SELECT 'Daniel Grasmeder' AS name, 'Team member, The Table Rock Group' AS role
  UNION ALL SELECT 'Amy Cesarano', 'Team member, The Table Rock Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1128) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1128 AND name = x.name);

-- ===== GROUP 770: Merrill Wealth Management, Newport Beach, CA =====
-- 1130 William Wheatley (Wheatley McCutcheon Wealth Management)
UPDATE contacts SET
  address = '520 Newport Center Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, founded practice 1983, team rebranded "Wheatley McCutcheon Wealth Management" (adding named partner Nicholas McCutcheon), Merrill Newport Beach CA (~75+ combined yrs team experience). Ranked #2 Southern California, Forbes Best-in-State Apr 2026; named to Barron''s Top 1,200 2022-2024. CRM phone (949) 719-1900 could not be verified — numbers found (949) 721-7249 / (949) 721-6100, flagged for correction.')), 512)
WHERE id = 1130;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1130, x.name, x.role FROM (
  SELECT 'Nicholas McCutcheon' AS name, 'Senior Vice President, Senior Financial Advisor, Wheatley McCutcheon Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1130) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1130 AND name = x.name);

-- ===== GROUP 771: Raymond James, Vero Beach, FL =====
-- 1131 Michael Kanner (The Kanner Group)
UPDATE contacts SET
  address = '625 Beachland Blvd, Suite 2',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President, leads "The Kanner Group" (Raymond James Financial Services, affiliated with Concurrent Advisors, formed 2019 after moving from Morgan Stanley/prior Edward Jones), Vero Beach FL. Ranked #14 Florida-South (High Net Worth), Forbes Best-in-State Apr 2026; named to Barron''s Top 1,200 2025. Phone was previously unrecorded — found (772) 205-2141. COMPLIANCE FLAG (factual record, per secondary reporting not independently re-confirmed against live BrokerCheck): 2 historical customer disputes — one closed without action (customer withdrew complaint), one settled for ~$5,000 re: unsuitable bond investments, appears tied to his Edward Jones-era business (pre-2009) — recommend direct BrokerCheck confirmation.')), 512)
WHERE id = 1131;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1131, x.name, x.role FROM (
  SELECT 'Garrick Cashatt' AS name, 'Financial Advisor, The Kanner Group' AS role
  UNION ALL SELECT 'Keith Lambert', 'Financial Advisor, The Kanner Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1131) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1131 AND name = x.name);

-- ===== GROUP 772: Weatherly Asset Management, Del Mar, CA =====
-- 1134 Carolyn Taylor
UPDATE contacts SET
  address = '832 Camino Del Mar, Suite 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President, Founding Partner, Weatherly Asset Management (independent RIA, founded 1994, ~$1.5-1.7B AUM), Del Mar CA (~39+ yrs experience). Ranked #25 California, Forbes Best-in-State 2025; ranked #68 California, Barron''s Top 1,200 2025 (also 2023/2024); Barron''s Top 1,500 2026 and Top 100 Women Financial Advisors 2025; 2025 Five Star Wealth Manager; 2025 InvestmentNews Top Financial Advisors. Phone confirmed correct (858) 259-4507.')), 512)
WHERE id = 1134;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1134, x.name, x.role FROM (
  SELECT 'Brent Armstrong' AS name, 'Wealth Management Advisor, Partner, Weatherly Asset Management' AS role
  UNION ALL SELECT 'Lindsey Fiske Thompson', 'Director of Strategy & Resources, Partner, Weatherly Asset Management'
  UNION ALL SELECT 'Kelli Ruby', 'Wealth Management Advisor, Partner, Weatherly Asset Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1134) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1134 AND name = x.name);

-- ===== GROUP 773: UBS Private Wealth Management, Northbrook, IL =====
-- 1136 Rod Loewenthal (The Loewenthal Group)
UPDATE contacts SET
  address = 'One Northbrook Place, 5 Revere Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — UBS Private Wealth Advisor, Senior Vice President-Wealth Management, CFP CIMA CRPC (UBS Private Wealth Advisor since 2021, with UBS since Nov 2017, prior Merrill since 1995), leads "The Loewenthal Group," UBS Northbrook IL. Ranked #13 Illinois/Chicago Suburbs, Forbes Best-in-State Apr 2026. CRM phone (847) 559-2000 does not match found listings — direct line found (847) 498-7802, flagged for correction.')), 512)
WHERE id = 1136;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1136, x.name, x.role FROM (
  SELECT 'Kevin Kamholz, CFP' AS name, 'Advisor, The Loewenthal Group' AS role
  UNION ALL SELECT 'Ben Drescher, CFP', 'Advisor, The Loewenthal Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1136) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1136 AND name = x.name);

-- ===== GROUP 774: Merrill Wealth Management, Winter Park, FL =====
-- 1137 Daryl Emerson
UPDATE contacts SET
  address = '400 S Park Ave, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, Merrill Winter Park FL (prior Bank of America). No individual Forbes/Barron''s recognition could be independently corroborated in this research despite CRM sourcing him from a Barron''s Top 1,200 list — recommend double-checking the original source entry. Phone was previously unrecorded — found (407) 646-6705.')), 512)
WHERE id = 1137;

-- ===== GROUP 775: Ameriprise Financial (Premier Wealth Partners), Boca Raton, FL =====
-- 1138 Thais Piotrowski
UPDATE contacts SET
  firm = 'Premier Wealth Partners | Ameriprise Financial',
  address = '1875 NW Corporate Blvd, Suite 210',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice integration: her former solo practice "Thais D. Piotrowski & Associates" merged into "Premier Wealth Partners" (multi-location Ameriprise practice, offices also in Pittsburgh PA/Sewickley PA/Charleston WV), Ameriprise firm unchanged. Private Wealth Advisor, CFP CRPC APMA FPQP, Boca Raton FL (with firm since 2004). Named to Barron''s Top 1,200 annually 2015-2024; Forbes Top Women Wealth Advisors; #124 Forbes America''s Top Women Advisors 2021; AdvisorHub 2025 Women Advisors to Watch. Phone was previously unrecorded — found (561) 952-0664. COMPLIANCE FLAG (factual record): 3 disclosed customer disputes — 2009 unauthorized-trading allegation ($7,319 sought, denied by firm), 2013 unsuitable variable annuity allegation, and a 2022 allegation re: unsuitable/aggressive alternative investments (BDCs), $150,000 sought — resolution status unconfirmed, recommend direct BrokerCheck review before compliance-sensitive use.')), 512)
WHERE id = 1138;

-- ===== GROUP 776: Wells Fargo Advisors (Utter, Pike & Dobbs), Sherman, TX =====
-- 1139 Gail Utter
UPDATE contacts SET
  firm = 'Utter, Pike & Dobbs Private Wealth Management Group | Wells Fargo Advisors',
  address = '600 E. Taylor St., Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team rebrand: "Utter Wealth Management Group" (founded by Gail 2001) renamed "Utter, Pike & Dobbs Private Wealth Management Group," Wells Fargo Advisors unchanged (with firm since 2008). Managing Director-Investments, Financial Advisor, MBA CPWA CRPC, Sherman TX (~$1.2B AUM per aggregator, not independently confirmed). Named to Barron''s Top 1,200 2012/2014-2020/2025; ranked #11 Texas-North, Forbes Best-in-State 2025; #1 Texas-North, Forbes Top Women Wealth Advisors 2025; team on Forbes Best-in-State Wealth Management Teams Jan 2026. CRM phone (877) 879-2495 is Wells Fargo''s generic customer-service line; direct office line (903) 893-6227.')), 512)
WHERE id = 1139;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1139, x.name, x.role FROM (
  SELECT 'Nate Pike, AWMA' AS name, 'Managing Director-Investments, Partner/Financial Advisor, Utter, Pike & Dobbs Private Wealth Management Group' AS role
  UNION ALL SELECT 'Juston J. Dobbs, MBA, CDFA, CFP', 'Financial Advisor (25 yrs with firm), Utter, Pike & Dobbs Private Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1139) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1139 AND name = x.name);

-- ===== GROUP 777: CalBay Investments, Danville, CA =====
-- 1140 Michael Allard
UPDATE contacts SET
  address = '500 La Gonda Way, Suite 280',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Principal, CalBay Investments Inc. (LPL Financial affiliate, practicing since ~1990), Danville CA. Named to Barron''s Top 1,200 2018-2024; Financial Times FT400 2019; ranked #8 Northern California, Forbes Best-in-State 2025; LPL Executive Council member (top ~15 of 28,000+ LPL advisors since 2016); Five Star Wealth Manager Oct 2025. Phone confirmed correct (925) 743-3360.')), 512)
WHERE id = 1140;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1140, x.name, x.role FROM (
  SELECT 'Clark J. Geranen' AS name, 'Chief Market Strategist & Chief Operating Officer, CalBay Investments' AS role
  UNION ALL SELECT 'Dylan Bell', 'Chief Investment Officer, CalBay Investments'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1140) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1140 AND name = x.name);

-- ===== GROUP 778: Merrill Wealth Management, Beverly Hills, CA =====
-- 1141 Nazie Saffari-Moini (The Saffari Group)
UPDATE contacts SET
  address = '9560 Wilshire Blvd, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, Managing Director, leads "The Saffari Group" (all-female mother-daughter team, ~35+ combined yrs experience, career start 1992), Merrill Beverly Hills CA. Forbes Best-in-State 7 consecutive years 2019-2025; Forbes/SHOOK Top Wealth Advisor Moms 2020. CRM phone (310) 285-6200 does not match found listings — direct line found (310) 858-3409, flagged as likely incorrect/data error.')), 512)
WHERE id = 1141;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1141, x.name, x.role FROM (
  SELECT 'Natasha Moini' AS name, 'Financial Advisor (daughter, joined 2024), The Saffari Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1141) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1141 AND name = x.name);

-- ===== GROUP 779: Riverwalk Wealth Advisors | Northwestern Mutual, Tampa, FL =====
-- 1144 Matthew Lytell
UPDATE contacts SET
  address = '1511 N West Shore Blvd, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Founder, CFP CIMA RICP CLU, founded "Riverwalk Wealth Advisors" (2018, ~12 members, with NM since 2005), Tampa FL. Named to Barron''s Top 1,200 4 consecutive years through 2023; ranked #12 Florida, Forbes Best-in-State 2026; Financial Times Top 400 Advisors 2019/2020; NM Private Client Group member. Phone was previously unrecorded — found (813) 426-1058.')), 512)
WHERE id = 1144;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1144, x.name, x.role FROM (
  SELECT 'Walter F. Putnam' AS name, 'Advisor (with NM since 1979), Riverwalk Wealth Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1144) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1144 AND name = x.name);

-- ===== GROUP 780: Merrill Wealth Management, Fort Worth, TX =====
-- 1145 Ted Smith (Smith Wealth Management Group)
UPDATE contacts SET
  address = '301 Commerce Street, Suite 2100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor (professionally goes by "Kelly Smith," career start 1987, with Merrill since 1988), leads "Smith Wealth Management Group," Merrill Fort Worth TX. Named to Barron''s Top 1,200 2023; team ranked #15 Texas-North, Forbes Best-in-State Wealth Management Teams 2025. CRM phone (817) 390-4000 does not match found listings — number found (817) 877-9756, flagged for correction. Note: a separate, similarly-located "Smith & Associates" team at the same building uses a different number — do not conflate.')), 512)
WHERE id = 1145;
