-- US Financial Advisor enrichment, batch 41 (FINAL BATCH — 26 contacts / 25 groups).
--
-- This completes the full 1,208-contact / 825-group US Financial
-- Advisor (Barron's Top 1,200) enrichment segment.
--
-- Firm-change notes (advisor stayed, entity/affiliation changed):
-- 1190 Jacob Duffy — moved "Duffy Mathias Private Wealth" (formerly
-- "The Duffy Mathias Group" at Robert W. Baird & Co.) to Xcelsior
-- Advisor Partners LLC, a newly formed independent RIA in Scottsdale
-- AZ led by ex-Baird Private Wealth leaders (~$770M AUM, ~$4.6M
-- annual revenue reported).
--
-- Compliance flags (factual record, not data errors):
-- 1199 Robert Siracusano (Wells Fargo Advisors FiNet, Naperville IL)
-- — a reported customer complaint (per plaintiff-attorney marketing
-- site summarizing BrokerCheck) alleging unsuitable annuity/mutual
-- fund recommendations, seeking $1,000,000+; also a 2011 complaint
-- (breach of fiduciary duty, negligence, misrepresentation) that
-- resulted in an $8,500 arbitration award (vs. $641,379 sought).
-- Disclosed outside business activity: Siracusano Aviation Services
-- LLC. Neither item independently re-confirmed against live
-- BrokerCheck, recommend manual review before compliance-sensitive
-- use.
--
-- Compliance non-findings explicitly excluded: research for Julia
-- Carlson (1178) surfaced a disclosure claim that used male pronouns
-- ("he") inconsistent with her identity — flagged by the research
-- agent as a likely data-conflation error and NOT recorded here as a
-- fact, per this project's standing policy of only recording
-- independently-plausible, well-sourced compliance items.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 1187/1188 (UBS Red Bank NJ — The Olsen Feder Group vs. The Rothman
-- Group, confirmed separate rosters despite a shared branch phone
-- number in the CRM).
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings, including one confirmed wrong-region area code for James
-- Kruzan); phone column left untouched per convention.

-- ===== GROUP 801: Merrill Wealth Management, Beaumont, TX =====
-- 1171 Laurie Mathews (The Mathews Group)
UPDATE contacts SET
  address = '7675 Folsom Dr, Building #200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, Portfolio Manager, leads "The Mathews Group" (with firm since 2000), Merrill Beaumont TX. Named to Barron''s Top 1,200 2025; ranked #15 Texas-South, Forbes Best-in-State 2025; #3 Texas-South, Forbes Top Women Wealth Advisors 2025; team on Forbes Best-in-State Wealth Management Teams 2025. CRM phone (800) 637-7455 is Merrill''s generic customer-service line; direct office line (409) 899-0176.')), 512)
WHERE id = 1171;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1171, x.name, x.role FROM (
  SELECT 'John Mathews' AS name, 'Financial Advisor, The Mathews Group' AS role
  UNION ALL SELECT 'Russell C. Smith', 'Financial Advisor, The Mathews Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1171) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1171 AND name = x.name);

-- ===== GROUP 802: Falcon Wealth Planning, Ontario, CA =====
-- 1173 Gabriel Shahin
UPDATE contacts SET
  address = '3400 Inland Empire Blvd, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Principal, Falcon Wealth Planning Inc. (fee-only/fiduciary RIA, founded 2015, ~$1.3-1.6B AUM, multi-state), Ontario CA. Named to Barron''s Top 1,200 2025; Wealth Management CEO of the Year finalist 2024/2025; Investopedia Top 100 Most Influential; FA Magazine Top 50 Fastest-Growing Firms 2024; published author (Forbes Books, "How the Rich Get Richer," 2025). Phone confirmed correct (855) 963-2526.')), 512)
WHERE id = 1173;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1173, x.name, x.role FROM (
  SELECT 'Michael Jensen, CFP' AS name, 'Managing Partner, Falcon Wealth Planning' AS role
  UNION ALL SELECT 'Zackary Royce, CFP', 'Regional Director, Falcon Wealth Planning'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1173) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1173 AND name = x.name);

-- ===== GROUP 803: Harris Financial Group, Richmond, VA =====
-- 1174 Jamie Cox
UPDATE contacts SET
  address = '9100 Arboretum Pkwy, Suite 255',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, Harris Financial Group (LPL Financial affiliated, joint management since 2006), Richmond VA. Ranked #122 Virginia, Forbes Best-in-State 2026; frequent national media commentator (CNBC, Fox Business, WSJ, Bloomberg). CRM phone (804) 644-4766 could not be corroborated — number found (804) 526-0544, flagged for correction. Name-collision caution: unrelated "James Keith Cox" (CRD 2365633, suspended) and "James Henry Cox" (CRD 2957150) surfaced in search — different individuals, do not conflate.')), 512)
WHERE id = 1174;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1174, x.name, x.role FROM (
  SELECT 'Carl E. Beck III' AS name, 'Advisor (former labor/employment attorney), Harris Financial Group' AS role
  UNION ALL SELECT 'Stephen M. Harrison', 'Advisor, Harris Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1174) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1174 AND name = x.name);

-- ===== GROUP 804: Erpelding Wealth Management | Northwestern Mutual, St. Petersburg, FL =====
-- 1175 Michael Erpelding
UPDATE contacts SET
  address = '700 Central Avenue, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Private Wealth Advisor/Managing Director, leads "Erpelding Wealth Management" (Northwestern Mutual, ~$2B AUM, career since 1984, operates offices in both St. Petersburg FL and Golden Valley/Edina MN), St. Petersburg FL. Ranked #9 Florida, Forbes Best-in-State 2026. Phone was previously unrecorded — found (727) 823-3187.')), 512)
WHERE id = 1175;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1175, x.name, x.role FROM (
  SELECT 'Eric Benson' AS name, 'Advisor (joined 2005), Erpelding Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1175) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1175 AND name = x.name);

-- ===== GROUP 805: Wealth Enhancement Group, Clinton, WI =====
-- 1176 Vince Cimino (Cimino Team)
UPDATE contacts SET
  address = '308A Ogden Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, CFP CRPC, leads "Cimino Team" (joined Wealth Enhancement Group via 2018 acquisition of Cimino Wealth Advisors, career since 1992), Clinton WI. Named to Barron''s Top 1,200 since 2013; ranked #7 Wisconsin, Forbes Best-in-State 2026. CRM phone (763) 417-1700 is Wealth Enhancement Group''s Plymouth MN corporate line; direct branch line (608) 676-2236.')), 512)
WHERE id = 1176;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1176, x.name, x.role FROM (
  SELECT 'Peter Cimino' AS name, 'Vice President, Financial Advisor (son), Cimino Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1176) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1176 AND name = x.name);

-- ===== GROUP 806: Edward Jones, Wilson, NC =====
-- 1177 Kim Hoffman (Hoffman Wealth Management)
UPDATE contacts SET
  address = '3305-A Nash Street NW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, General Partner, CFP ChFC CPWA CEPA AAMS (with firm ~26 yrs, prior CPA at PwC), leads "Hoffman Wealth Management" (~100+ combined yrs team experience), Edward Jones Wilson NC. Ranked #11 North Carolina, Forbes Best-in-State 2026; Forbes Top Women Wealth Advisors 6 consecutive years 2021-2026; ranked #26 North Carolina, Barron''s Top 1,500 2026. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (252) 291-7714.')), 512)
WHERE id = 1177;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1177, x.name, x.role FROM (
  SELECT 'Tyler Johns' AS name, 'Financial Advisor, Hoffman Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1177) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1177 AND name = x.name);

-- ===== GROUP 807: Financial Freedom Wealth Mgmt Group, Newport, OR =====
-- 1178 Julia Carlson
UPDATE contacts SET
  address = '1007 SW Bayley St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Financial Freedom Wealth Management Group LLC (LPL Financial hybrid RIA, ~9 employees, multi-state offices OR/WA/MA), Newport OR. Named to Barron''s Top 1,200 2024/Top 1,500 2026 (#11 state-level); ranked #2 Oregon, Forbes Top Women Wealth Advisors 2026. CRM phone (541) 265-2908 could not be confirmed — numbers found (458) 777-4458 / (541) 574-6464, flagged for correction. Note: a disclosure claim referencing male pronouns surfaced in research does not match her identity and is very likely a data-conflation error from an unrelated individual — NOT recorded as a compliance fact, recommend independent manual BrokerCheck confirmation if needed.')), 512)
WHERE id = 1178;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1178, x.name, x.role FROM (
  SELECT 'Jason H. Harris, MBA, CFP' AS name, 'President, Financial Freedom Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1178) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1178 AND name = x.name);

-- ===== GROUP 808: Gilman Hill Asset Management, New Canaan, CT =====
-- 1179 Jenny Harrington
UPDATE contacts SET
  address = '220 Elm Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Chief Executive Officer & Portfolio Manager (manages the firm''s flagship Equity Income strategy, joined as Managing Director 2006, CEO since 2009), Gilman Hill Asset Management LLC (~10 employees, ~$782.9M AUM), New Canaan CT. Ranked #34 Forbes Best-in-State 2026; frequent Barron''s panelist/CNBC commentator; published author; MBA Columbia, BA Hollins University. Phone was previously unrecorded — found firm main line (203) 571-0225.')), 512)
WHERE id = 1179;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1179, x.name, x.role FROM (
  SELECT 'John Harrington' AS name, 'Chief Operating Officer & Chief Compliance Officer (joined 2009), Gilman Hill Asset Management' AS role
  UNION ALL SELECT 'Jacob Friar, CFA', 'Senior Analyst (joined 2021), Gilman Hill Asset Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1179) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1179 AND name = x.name);

-- ===== GROUP 809: UBS Wealth Management, Cleveland, OH =====
-- 1180 Gary Young (The Personal Wealth Management Group)
UPDATE contacts SET
  address = '600 Superior Avenue East, 27th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Head of "The Personal Wealth Management Group" (~26-27 yrs experience), UBS Cleveland OH. Ranked #5 Ohio, Forbes Best-in-State 2026 (recurring 2020-2026); UBS Chairman''s Circle member; named to Barron''s Top 1,500 2026. CRM phone (216) 689-5000 could not be verified — numbers found (216) 696-5900 / (216) 736-2859, flagged for correction.')), 512)
WHERE id = 1180;

-- ===== GROUP 810: Ameriprise Financial (Munn & Associates), Paramus, NJ =====
-- 1181 Seth Courtwright
UPDATE contacts SET
  firm = 'Munn & Associates | Ameriprise Financial',
  address = 'The Atrium, Suite 390, 80 E Route 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP APMA, member of "Munn & Associates" (Ameriprise, led by William Munn), Paramus NJ (~16 yrs experience). Named to Barron''s Top 1,500 2026 (part of Ameriprise''s 84-advisor 2026 cohort). CRM phone (201) 967-7100 could not be verified — number found (201) 226-1780, flagged for correction. Note: multiple unrelated advisors named "Courtwright" (Ethan CRD 7963097, William David CRD 2619811) share the same building — do not conflate, confirmed this record is CRD 2534520.')), 512)
WHERE id = 1181;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1181, x.name, x.role FROM (
  SELECT 'William Munn, CFP, ChFC, APMA' AS name, 'Lead Advisor, Munn & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1181) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1181 AND name = x.name);

-- ===== GROUP 811: UBS Private Wealth Management, San Antonio, TX =====
-- 1182 William Hrynyshyn (Concierge Wealth Consulting Group)
UPDATE contacts SET
  address = '200 Concord Plaza Drive, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director, CFP CRPC (with UBS since 2009, prior Morgan Stanley, ~36+ yrs experience), member of "Concierge Wealth Consulting Group," UBS San Antonio TX. Ranked #3 Texas-South, Forbes Best-in-State 2025 (recurring 2021-2025); UBS Wealth Management Pinnacle Council 2025; team ranked #6 Texas-South, Forbes Best-in-State Wealth Management Teams 2025. Phone confirmed clean per BrokerCheck (0 disclosures, CRD 1916561). CRM phone (210) 225-5000 could not be verified — number found (210) 805-1064, flagged for correction.')), 512)
WHERE id = 1182;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1182, x.name, x.role FROM (
  SELECT 'Lauren Hrynyshyn, CFP, AAMS' AS name, 'Financial Advisor (likely relative), Concierge Wealth Consulting Group' AS role
  UNION ALL SELECT 'Jennifer Owen Wnuk', 'Senior VP, Portfolio Manager, Financial Advisor, Concierge Wealth Consulting Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1182) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1182 AND name = x.name);

-- ===== GROUP 812: Morgan Stanley Wealth Management, Red Bank, NJ =====
-- 1183 Francis Bitterly (The Bitterly Wealth Management Group)
UPDATE contacts SET
  address = '20 Linden Place',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, Family Wealth Director, CFP (~41 yrs experience), leads "The Bitterly Wealth Management Group," Morgan Stanley Red Bank NJ. Named to Barron''s Top 1,500 2026 (recurring 2019-2026); Forbes Best-in-State recurring 2019-2026; team ranked #22 New Jersey-South, Forbes Best-in-State Wealth Management Teams 2025. CRM phone (732) 530-2600 could not be verified — numbers found (732) 935-2097 / (732) 224-3754, flagged for correction. Note: a separate, related Morgan Stanley Red Bank team, "The Shore Bitterly Group" (Tara/Dana/Gary Bitterly), is a distinct family practice — do not conflate rosters.')), 512)
WHERE id = 1183;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1183, x.name, x.role FROM (
  SELECT 'Catherine Mannes (Bitterly), CFP' AS name, 'Financial Advisor, The Bitterly Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1183) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1183 AND name = x.name);

-- ===== GROUP 813: Hudock Capital Group, Williamsport, PA =====
-- 1184 Barbara Hudock
UPDATE contacts SET
  address = '400 Market Street, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO & Founding Partner, CIMA CPM, Hudock Capital Group LLC (independent RIA, ~$747M-$1B AUM, broker of record via APW Capital Inc.), Williamsport PA. Barron''s Advisor Hall of Fame inductee; Barron''s Top 100 Women Financial Advisors; Barron''s Top 50 Financial Advisors Pennsylvania; Barron''s Top 100 Independent Financial Advisors; Forbes/SHOOK America''s Top Women Wealth Advisors. CRM phone (570) 326-4351 was not found in current listings — number found (570) 326-9500, flagged for correction.')), 512)
WHERE id = 1184;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1184, x.name, x.role FROM (
  SELECT 'David Brian Hudock' AS name, 'Advisor (likely family member), Hudock Capital Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1184) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1184 AND name = x.name);

-- ===== GROUP 814: Merrill Wealth Management, Dearborn, MI =====
-- 1185 John Mizzi (The John Mizzi Group)
UPDATE contacts SET
  address = '290 Town Center Drive, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor (with firm since 1983, ~41+ yrs), leads "The John Mizzi Group," Merrill Dearborn MI. Named to Barron''s Top 1,200 2023-2024; individually named Forbes Best-in-State 2021-2024; team on Forbes Best-in-State Wealth Management Teams (Michigan). CRM phone (800) 637-7455 is Merrill''s generic customer-service line; direct office line (313) 594-9253. Note: a separate, distinct Dearborn Merrill team, "Mizzi Becker Collins Grose Group" (Christopher Mizzi et al.), shares the branch/surname — do not conflate rosters.')), 512)
WHERE id = 1185;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1185, x.name, x.role FROM (
  SELECT 'Brett C. Mizzi' AS name, 'Financial Advisor (joined 2021), The John Mizzi Group' AS role
  UNION ALL SELECT 'Jenna Mizzi Peth, CFP', 'Vice President, Senior Wealth Planner, The John Mizzi Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1185) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1185 AND name = x.name);

-- ===== GROUP 815: Merrill Wealth Management, Leesburg, VA =====
-- 1186 Jeffrey Eveland (The Eveland Group)
UPDATE contacts SET
  address = '3 S King St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Managing Director, CFP CRPC (with firm since 2002), leads "The Eveland Group" (>$1B client balances as of Oct 2024), Merrill Leesburg VA. Team on Forbes Best-in-State Wealth Management Teams 2023-2026; named to Barron''s Top 1,200 2023-2025. CRM phone (800) 637-7455 is Merrill''s generic customer-service line; direct office line (703) 779-2130.')), 512)
WHERE id = 1186;

-- ===== GROUP 816: UBS Wealth Management, Red Bank, NJ =====
-- 1187 Jason Feder (The Olsen Feder Group), 1188 Steven Rothman (The Rothman Group) — 2 separate teams
UPDATE contacts SET
  address = '331 Newman Springs Road, Building 1, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor (with UBS since 2008, ~17-18 yrs), member of "The Olsen Feder Group" (led by senior advisor Art Olsen, 35+ yrs at UBS), UBS Red Bank NJ. Ranked #19 New Jersey-South, Forbes Best-in-State 2025; named to Barron''s Top 1,500 2026; UBS Wealth Management Chairman''s Council 2024/2026. Id 1188 leads a separate, unrelated team in the same branch — confirmed no roster overlap. CRM phone (732) 933-5000 does not match found listings for either team — direct line found (732) 219-7254, flagged for correction.')), 512)
WHERE id = 1187;
UPDATE contacts SET
  address = '140 Broad Street, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP (~45 yrs experience, since 1981), leads "The Rothman Group," UBS Red Bank NJ. Named to Barron''s Top 1,200 2019-2025/Top 1,500 2026; Forbes Best-in-State 2018-2026. Id 1187 leads a separate, unrelated team in the same branch — confirmed no roster overlap. CRM phone (732) 933-5000 does not match found listings for either team — direct line found (732) 219-7228, flagged for correction. BrokerCheck-confirmed: no public disclosures (CRD 715391).')), 512)
WHERE id = 1188;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1187, x.name, x.role FROM (
  SELECT 'Art Olsen' AS name, 'Senior Advisor (35+ yrs at UBS), The Olsen Feder Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1187) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1187 AND name = x.name);

-- ===== GROUP 817: Xcelsior Advisor Partners (formerly Baird), Scottsdale, AZ =====
-- 1190 Jacob Duffy
UPDATE contacts SET
  firm = 'Xcelsior Advisor Partners (formerly Robert W. Baird & Co.)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Duffy Mathias Private Wealth" (formerly "The Duffy Mathias Group" at Robert W. Baird & Co.) moved to Xcelsior Advisor Partners LLC, a newly formed independent RIA in Scottsdale AZ led by ex-Baird Private Wealth leaders (co-CEOs Mark Peterson and Matt Curley), ~$770M AUM / ~$4.6M annual revenue reported. Co-leads the team with David Mathias, Scottsdale AZ. Ranked #27 Arizona, Forbes Best-in-State Apr 2025. CRM phone (480) 624-2382 (prior Baird-era number) is now stale — new Xcelsior contact info not yet confirmed, recommend follow-up.')), 512)
WHERE id = 1190;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1190, x.name, x.role FROM (
  SELECT 'David Mathias' AS name, 'Co-lead, Financial Advisor/Partner, Duffy Mathias Private Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1190) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1190 AND name = x.name);

-- ===== GROUP 818: Edward Jones (Fortier Wealth Management Team), Raleigh, NC =====
-- 1191 Mark Fortier
UPDATE contacts SET
  address = '806 N Arendell Ave, Suite C, Zebulon, NC 27597',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP, Edward Jones Regional Leader (Raleigh Region), leads "Fortier Wealth Management Team" (with firm since 1994, ~31-32 yrs), physical branch located in Zebulon NC (Raleigh-metro/Triangle region — office is in Zebulon, not downtown Raleigh, CRM city updated for accuracy of branch location). Ranked #13 North Carolina, Forbes Best-in-State 2025 (not independently re-confirmed). CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (919) 269-7714.')), 512)
WHERE id = 1191;

-- ===== GROUP 819: Kaydan Wealth Management, Fenton, MI =====
-- 1192 James Kruzan
UPDATE contacts SET
  address = '329 West Silver Lake Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Senior Wealth Advisor, CFP CRPC, Kaydan Wealth Management Inc. (independent RIA, prior Branch Manager/Registered Principal at Raymond James), Fenton MI. Ranked #10 Michigan, Forbes Best-in-State 2025 (also 2021). CRM phone (516) 277-1430 is a Long Island NY area code with no found connection to this advisor — confirmed data error; correct number (810) 593-1624.')), 512)
WHERE id = 1192;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1192, x.name, x.role FROM (
  SELECT 'Mathew Britt' AS name, 'Advisor/IAR, Kaydan Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1192) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1192 AND name = x.name);

-- ===== GROUP 820: All Seasons Wealth, Tampa, FL =====
-- 1193 Jeff Hausinger
UPDATE contacts SET
  address = '100 N. Tampa St., Suite 3750',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CEO, CFP CIMA, founded All Seasons Wealth (2010, independent practice via Raymond James Financial Services, multi-office FL/OK/MD/FL), Tampa FL. Ranked #8 Tampa FL area, Forbes Best-in-State 2025 (recurring, incl. 2022); named to Barron''s Top 1,500 2026 (list-name transition from "Top 1,200"); board member, First Tee of Tampa Bay. Phone was previously unrecorded — found (813) 490-6610.')), 512)
WHERE id = 1193;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1193, x.name, x.role FROM (
  SELECT 'Mary Jo' AS name, 'Advisor (named Raymond James Global Top Advisors 2025, surname unconfirmed), All Seasons Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1193) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1193 AND name = x.name);

-- ===== GROUP 821: Merrill Wealth Management, Boca Raton, FL =====
-- 1195 William LaPato (The LaPato Wealth Management Group)
UPDATE contacts SET
  address = '1 Town Center Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, leads "The LaPato Wealth Management Group," Merrill Boca Raton FL. Team named to Forbes Best-in-State Wealth Management Teams 2025. Phone was previously unrecorded — candidate number (561) 393-4546 found, not independently corroborated, recommend verification.')), 512)
WHERE id = 1195;

-- ===== GROUP 822: RBC Wealth Management, San Antonio, TX =====
-- 1196 Steven Ogle (Charter Private Wealth)
UPDATE contacts SET
  address = '303 Pearl Parkway, Suite 380',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Financial Advisor, CIMA AIF (~30 yrs experience), leads "Charter Private Wealth," RBC San Antonio TX. Ranked #14 Texas, Forbes Best-in-State 2026 (recurring 2022-2026); named to Barron''s Top 1,500 2026 (per RBC newsroom release). CRM phone (800) 933-6830 is RBC''s generic toll-free line; direct office line (210) 805-1106.')), 512)
WHERE id = 1196;

-- ===== GROUP 823: Edward Jones, Victoria, TX =====
-- 1198 Kenny French Sr. (French Wealth Management)
UPDATE contacts SET
  address = '4800 N Navarro St, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CEPA (~31 yrs experience), leads "French Wealth Management," Edward Jones Victoria TX. Forbes Best-in-State recurring incl. 2025/2026; named to Barron''s Top 1,200 6 years (2019-2021/2023-2025). CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (361) 576-0178.')), 512)
WHERE id = 1198;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1198, x.name, x.role FROM (
  SELECT 'Rhonda Meek' AS name, 'Registered Branch Associate, French Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1198) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1198 AND name = x.name);

-- ===== GROUP 824: Wells Fargo Advisors FiNet, Naperville, IL =====
-- 1199 Robert Siracusano (Siracusano Sleezer Group)
UPDATE contacts SET
  address = '400 E Diehl Rd, Suite 330',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Branch Manager, Senior Financial Advisor, MBA (Northwestern Kellogg 2024, with firm since 2003), leads "Siracusano Sleezer Group Wealth Management," Wells Fargo Advisors Financial Network Naperville IL. Ranked #5 Illinois, Forbes Best-in-State 2024. CRM phone (877) 879-2495 is Wells Fargo''s generic FiNet customer-service line; direct branch line (630) 544-3434. COMPLIANCE FLAG (factual record, per secondary reporting not independently re-confirmed against live BrokerCheck): a reported customer complaint alleging unsuitable annuity/mutual fund recommendations, seeking $1,000,000+; also a 2011 complaint (breach of fiduciary duty, negligence, misrepresentation, $641,379 sought) resulting in an $8,500 arbitration award. Disclosed outside business activity: Siracusano Aviation Services LLC (100% owner, since 2024). Recommend direct BrokerCheck review before any compliance-sensitive use.')), 512)
WHERE id = 1199;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1199, x.name, x.role FROM (
  SELECT 'Anthony Sleezer' AS name, 'Financial Advisor (co-name partner), Siracusano Sleezer Group' AS role
  UNION ALL SELECT 'Gabriel Siracusano', 'Financial Advisor, Siracusano Sleezer Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1199) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1199 AND name = x.name);

-- ===== GROUP 825: TLWM Financial, San Antonio, TX =====
-- 1200 Enzo Pellegrino
UPDATE contacts SET
  address = '40 N.E. Loop 410, Suite 644',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, CEO & Wealth Advisor, CFP, TLWM Financial (rebrand of Texas Legacy Wealth Management, independent RIA since 2011, securities via LPL Financial since 2005, ~$333.3M AUM, ~11 employees), San Antonio TX. Forbes Top Next-Generation Wealth Advisors 2017/2018; Forbes Best-in-State 2018/2019/2021-2025. CRM phone (210) 231-7500 not found in current listings — correct number (210) 541-8600, flagged for correction. Clean BrokerCheck record confirmed (CRD 4392184) — no customer complaints/regulatory actions found; disclosed outside business activities TLWM LLC and TLREM LLC dba Pellegrino Ranch, both non-adverse.')), 512)
WHERE id = 1200;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1200, x.name, x.role FROM (
  SELECT 'Simon Thompson' AS name, 'Senior VP & Wealth Advisor, TLWM Financial' AS role
  UNION ALL SELECT 'Brian Tobin', 'Wealth Advisor, TLWM Financial'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1200) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1200 AND name = x.name);
