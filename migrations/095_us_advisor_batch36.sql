-- US Financial Advisor enrichment, batch 36 (22 contacts / 20 groups).
--
-- Firm-change corrections (advisor departed, updates firm/title/address,
-- leaves stale phone flagged not deleted):
-- 1062 Peter Jurasz — left Merrill for Raymond James & Associates
-- April 2025, took his whole 5-person team (~$740M AUM), now "JHV
-- Group of Raymond James," Juneau AK.
--
-- Firm-acquisition/merger notes (advisor stayed, entity changed):
-- 1051 Aaron Kowal — Kowal Investment Group, LLC acquired by Creative
-- Planning, deal closed Dec 21, 2024; he is now Partner and Managing
-- Director at Creative Planning.
-- 1055 Michael Joyce — founded and led "Agili" (Richmond VA RIA) for
-- ~30 yrs; Agili joined CW Advisors (Boston-based RIA) Aug 16, 2024,
-- adding $1.2B AUM; CRM firm field "CW Advisors" already correct.
-- 1056 Matthew MacLean — practice rebranded from "Harnden-MacLean
-- Wealth Advisors" to "Affirm Wealth Advisors" (same Ameriprise
-- practice); he took over practice leadership Oct 2023.
--
-- Compliance flags (factual record, not data errors):
-- 1046 Shawn Sladek (Merrill, Walnut Creek CA) — customer dispute
-- filed ~March 2016 (conduct alleged 2008-2016) re: unsuitable
-- concentration in oil/gas securities and triple-leveraged ETFs;
-- FINRA arbitration panel recommended expungement, finding he "was
-- not involved" in the alleged violation.
-- 1054 Vivek Thoppay (Merrill, San Jose CA) — 1 disclosure event
-- (12/8/2008) re: alleged misrepresentation, $750,000 claimed;
-- resolution/outcome unconfirmed.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings); phone column left untouched per convention.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 1046/1049/1143 (Merrill Walnut Creek CA — three separate teams:
-- The Sladek Group, The Dunn Group, The Gallo Group, sharing one
-- building and — notably — none of their three phone numbers matches
-- the CRM's shared listed number).
--
-- Name-collision caution: 1043 Robert Carmichael (RBC, Walnut Creek
-- CA, CRD 2360609) is distinct from an unrelated, more junior "Robert
-- Carmichael" (CRD 6679116) at the same firm/branch area.

-- ===== GROUP 701: Morgan Stanley Wealth Management, Sugar Land, TX =====
-- 1039 Kapil Mathur (The Math Group)
UPDATE contacts SET
  address = '16554 Creek Bend Drive, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director, Sugar Land Branch Manager, Senior Portfolio Management Director, Family Wealth Director, Chief Investment Officer, leads "The Math Group" (~16-person team, with firm since 2010), Morgan Stanley Sugar Land TX. Forbes Best-in-State recurring 2019-2026, ranked #13 Texas 2025; named to Barron''s Top 1,200 2020-2024/Top 1,500 2026; Morgan Stanley Chairman''s Club. CRM phone (800) 869-3326 is Morgan Stanley''s generic national line; direct line (281) 263-1615.')), 512)
WHERE id = 1039;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1039, x.name, x.role FROM (
  SELECT 'Ward Pendleton, CFP' AS name, 'Partner (with firm/predecessors since 1979), The Math Group' AS role
  UNION ALL SELECT 'Vivek Mehta', 'Senior Vice President, The Math Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1039) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1039 AND name = x.name);

-- ===== GROUP 702: UBS Private Wealth Management, La Jolla, CA =====
-- 1041 Braydon Hamilton (Paradigm Group)
UPDATE contacts SET
  address = '1200 Prospect Street, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Senior Vice President-Wealth Management, CFP CIMA, leads "Paradigm Group" (with firm since 2008), UBS La Jolla CA. Named to Barron''s Top 1,200/1,500 2023-2026; Forbes Best-in-State 5x 2020-2024; team ranked #5-6, Forbes Best-in-State Wealth Management Teams (recent years). Phone was previously unrecorded — found (858) 729-5241.')), 512)
WHERE id = 1041;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1041, x.name, x.role FROM (
  SELECT 'Stephen M. LaFata, CEPA, CPWA' AS name, 'Senior Vice President-Wealth Management, Financial Advisor, Paradigm Group' AS role
  UNION ALL SELECT 'Colin Parker', 'Financial Advisor (heads investment platform), Paradigm Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1041) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1041 AND name = x.name);

-- ===== GROUP 703: Corda Investment Management, Houston, TX =====
-- 1042 Bonner Barnes
UPDATE contacts SET
  address = '8955 Katy Freeway, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & Chief Investment Officer, AIF, founded Corda Investment Management LLC (SEC-registered RIA, founded 1999, ~$1B AUM), Houston TX. Named to Barron''s Top 1,200 multiple years incl. 2020; ranked #2 Texas, Forbes Best-in-State 2025. CRM phone (713) 840-1000 does not match found listings — verified number (713) 439-0665, flagged for correction.')), 512)
WHERE id = 1042;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1042, x.name, x.role FROM (
  SELECT 'Duane C. Davis' AS name, 'Senior Financial Advisor & Head of Tax Services, Corda Investment Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1042) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1042 AND name = x.name);

-- ===== GROUP 704: RBC Wealth Management, Walnut Creek, CA =====
-- 1043 Robert Carmichael (The Carmichael Group)
UPDATE contacts SET
  address = '1331 North California Blvd., Suite 650',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Financial Advisor, Senior Portfolio Manager-Portfolio Focus, CFP, leads "The Carmichael Group" (with firm/predecessor Sutro & Co. since 1992), RBC Walnut Creek CA. Named to Barron''s Top 1,200 2024/Top 1,500 2026; ranked #7 Northern California, Forbes Best-in-State 2025; RBC President''s Council since 2006, Chairman''s Council since 2009, Executive Council since 2024. CRM phone (925) 746-5400 could not be verified — candidate numbers (925) 949-5200 / (925) 279-1700 found, flagged for correction. Name collision caution: distinct from an unrelated, more junior "Robert Carmichael" (CRD 6679116) at the same firm/branch area — confirmed this record is CRD 2360609.')), 512)
WHERE id = 1043;

-- ===== GROUP 705: Merrill Wealth Management, Walnut Creek, CA =====
-- 1046 Shawn Sladek (The Sladek Group), 1049 Michael Dunn (The Dunn Group), 1143 Matthew Gallo (The Gallo Group) — 3 separate teams
UPDATE contacts SET
  address = '1331 North California Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, leads "The Sladek Group" (with firm since 1997/98), Merrill Walnut Creek CA. Named to Forbes Best-in-State 2018-2022. Ids 1049 and 1143 lead separate, unrelated teams in the same building. CRM phone (925) 746-5400 does not match any of the three teams'' actual lines — team direct line found (925) 945-4864, flagged for correction. COMPLIANCE FLAG (factual record): customer dispute filed ~March 2016 (conduct alleged 2008-2016) re: unsuitable concentration in oil/gas securities and triple-leveraged ETFs — FINRA arbitration panel recommended expungement, finding he "was not involved" in the alleged violation. Name-collision caution: FINRA has multiple unrelated "Sladek" CRDs at Merrill (e.g. Richard Bruce Sladek, Coeur d''Alene ID) — confirmed this record is CRD 2995404.')), 512)
WHERE id = 1046;
UPDATE contacts SET
  address = '1331 North California Blvd, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Resident Director-Wealth Management Advisor (~30 yrs experience), leads "The Dunn Group" (team name possibly transitioning to "The Dunn Scott Group"/"The Jenkins Scott Dunn Team"), Merrill Walnut Creek CA. Named to Barron''s Top 1,200 2016-2018/2025; Forbes Best-in-State 2019-2025; team on Forbes Best-in-State Wealth Management Teams 2025. Ids 1046 and 1143 lead separate, unrelated teams in the same building. CRM phone (925) 746-5400 does not match this team''s actual line — direct line found (925) 945-4852, flagged for correction.')), 512)
WHERE id = 1049;
UPDATE contacts SET
  address = '1331 North California Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Financial Advisor, Senior Vice President, CPWA (joined 2014), member of "The Gallo Group" (led by Robert Gallo, 40-yr Merrill veteran, likely a relative), Merrill Walnut Creek CA. Forbes Top Next-Generation Wealth Advisors 2017; team on Forbes Best-in-State Wealth Management Teams 2024. Ids 1046 and 1049 lead separate, unrelated teams in the same building. CRM phone (925) 746-5400 does not match this team''s actual line — direct line found (925) 945-4804, flagged for correction.')), 512)
WHERE id = 1143;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1049, x.name, x.role FROM (
  SELECT 'Delaney Dunn' AS name, 'Financial Advisor (likely relative, career start 2023), The Dunn Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1049) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1049 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1143, x.name, x.role FROM (
  SELECT 'Robert Gallo' AS name, 'Managing Director, Wealth Management Advisor (team lead, 40-yr veteran, likely relative), The Gallo Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1143) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1143 AND name = x.name);

-- ===== GROUP 706: Spring Ridge Financial Group, Wyomissing, PA =====
-- 1048 Virgil Kahl
UPDATE contacts SET
  address = '2610 Westview Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CEO, CPA CFP, Spring Ridge Financial Group LLC (Commonwealth Financial Network affiliate, ~13 staff), Wyomissing PA. Barron''s Top 100 Women Advisors 2023; named to Barron''s Top 1,200 2025; Forbes Best-in-State/Top Women Wealth Advisors/Top 250 Wealth Advisors 2025. CRM phone (610) 898-9700 does not match current listings — number found (610) 743-3484, flagged for correction.')), 512)
WHERE id = 1048;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1048, x.name, x.role FROM (
  SELECT 'Gregory Frank, CPA, CFP' AS name, 'Director of Financial Analytics/Investment Advisor, Spring Ridge Financial Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1048) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1048 AND name = x.name);

-- ===== GROUP 707: Creative Planning (formerly Kowal Investment Group), Brookfield, WI =====
-- 1051 Aaron Kowal
UPDATE contacts SET
  firm = 'Creative Planning (formerly Kowal Investment Group)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: Kowal Investment Group LLC (~$1.1-1.3B AUM, ~20 employees/11 advisors) was acquired by Creative Planning, deal closed Dec 21, 2024. Aaron Kowal is now Partner and Managing Director, Creative Planning (formerly President, Kowal Investment Group), Brookfield WI area (prior HQ 17775 W. Bluemound Rd). Ranked #26 Wisconsin, Forbes Best-in-State 2025; father Jeff Kowal a Barron''s Top Financial Advisor 7 consecutive years. CRM phone (262) 785-3200 could not be confirmed — candidate numbers (262) 522-4040 / (262) 785-1377 found, flagged for correction. Exact current suite address under Creative Planning not independently confirmed, recommend follow-up.')), 512)
WHERE id = 1051;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1051, x.name, x.role FROM (
  SELECT 'Jeff Kowal, ChFC, CLU, AEP' AS name, 'Founder (father), Creative Planning (formerly Kowal Investment Group)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1051) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1051 AND name = x.name);

-- ===== GROUP 708: Neuberger Berman, Los Angeles, CA =====
-- 1052 Lisa Reed
UPDATE contacts SET
  address = '10100 Santa Monica Boulevard, Suite 975',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Wealth Advisor (with firm since 1998), Neuberger Berman Los Angeles CA. Ranked #8 California, Forbes/SHOOK Top Women Wealth Advisors 2026; #48 nationally, Barron''s Top 100 Women Financial Advisors 2025 (8th consecutive year); #73 California, Barron''s Top 1,500 2026. CRM phone (310) 772-5000 could not be verified — number found (310) 595-9100, flagged for correction. Note: some sources indicate a possible office relocation to 10250 Constellation Blvd (Century City) — address not fully confirmed, recommend follow-up.')), 512)
WHERE id = 1052;

-- ===== GROUP 709: Ameriprise Financial, Apple Valley, MN =====
-- 1053 Royal Jaros (Royal Private Wealth)
UPDATE contacts SET
  address = '14985 Glazier Ave, Suite 501',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP, leads "Royal Private Wealth" (Ameriprise, with firm since 2006, 33+ yrs experience), Apple Valley MN. Forbes Best-in-State named 2018/2019, ranked #90 Minnesota 2025; named to Barron''s Top 1,200 2016-2019. CRM phone (800) 297-7378 is Ameriprise''s generic national line; direct office line (952) 431-6410.')), 512)
WHERE id = 1053;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1053, x.name, x.role FROM (
  SELECT 'Morgan P. Jaros' AS name, 'Business Development Director (likely relative), Royal Private Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1053) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1053 AND name = x.name);

-- ===== GROUP 710: Merrill Wealth Management, San Jose, CA =====
-- 1054 Vivek Thoppay (The Thoppay Team)
UPDATE contacts SET
  address = '50 W San Fernando St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP CIMA CPWA CRPC CEPA CPFA, leads "The Thoppay Team" (with firm since 2002), Merrill San Jose CA. Forbes Best-in-State California 2018/2020-2024/2026; named to Barron''s Top 1,200 recurring years incl. 2019/2020/2022-2024. Phone was previously unrecorded — found (408) 283-3139. COMPLIANCE FLAG (factual record): 1 disclosure event dated 12/8/2008, customer alleged misrepresentation, $750,000 claimed — resolution unconfirmed, recommend periodic re-check.')), 512)
WHERE id = 1054;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1054, x.name, x.role FROM (
  SELECT 'Alka N Madinur' AS name, 'Officer, Wealth Management Client Associate, The Thoppay Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1054) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1054 AND name = x.name);

-- ===== GROUP 711: CW Advisors (formerly Agili), Richmond, VA =====
-- 1055 Michael Joyce
UPDATE contacts SET
  address = '1806 Summit Avenue, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Managing Director, Mid-Atlantic Leader, CFA CFP. Founded and led "Agili" (Richmond VA fee-only RIA) as President for ~30 yrs; Agili joined CW Advisors (Boston-based RIA) Aug 16, 2024, adding $1.2B AUM — CRM firm field "CW Advisors" already reflects this correctly. Named to Barron''s Top 1,200 ~10 consecutive years; Financial Times Top 300; Forbes Best-in-State; appointed by four Virginia Governors to the Virginia Small Business Financing Authority Board. CRM phone (804) 780-0941 could not be independently confirmed — published number is (804) 358-2702, flagged for correction.')), 512)
WHERE id = 1055;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1055, x.name, x.role FROM (
  SELECT 'Jamie Malone' AS name, 'Wealth Manager, Principal, CW Advisors (Richmond)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1055) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1055 AND name = x.name);

-- ===== GROUP 712: Ameriprise Financial (Affirm Wealth Advisors), Peoria, AZ =====
-- 1056 Matthew MacLean
UPDATE contacts SET
  firm = 'Affirm Wealth Advisors | Ameriprise Financial',
  address = '7992 W Thunderbird Rd, Ste 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice rebrand: "Harnden-MacLean Wealth Advisors" renamed to "Affirm Wealth Advisors" (same Ameriprise practice); Matthew MacLean became CEO/Private Wealth Advisor Oct 2023, succeeding founder Steve Harnden. CFP ChFC CRPC CKA CEPA, Peoria AZ (~$1.1B AUM per Forbes). Named to Barron''s Top 1,200 2025; Forbes Best-in-State 2026; firm ranked #8 Arizona Private Wealth, Forbes Jan 2026. CRM phone (623) 972-3133 could not be verified — published number (623) 388-6465, flagged for correction. Note: a same-named "Matthew David MacLean" (CRD 5515068) found in Glastonbury CT is an unrelated individual — do not conflate.')), 512)
WHERE id = 1056;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1056, x.name, x.role FROM (
  SELECT 'Stephen Harnden, CFP, CPA' AS name, 'Private Wealth Advisor (founder, now advisory role), Affirm Wealth Advisors' AS role
  UNION ALL SELECT 'Michael Gombrich', 'Financial Advisor, Affirm Wealth Advisors'
  UNION ALL SELECT 'Garrett Smith', 'Financial Advisor, Affirm Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1056) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1056 AND name = x.name);

-- ===== GROUP 713: Elkhorn Private Wealth Advisors | Raymond James, Palm Beach Gardens, FL =====
-- 1058 Douglas Simon
UPDATE contacts SET
  firm = 'Elkhorn Private Wealth Advisors | Raymond James',
  address = '3399 PGA Blvd, Ste 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, M.D. (former board-certified anesthesiologist), leads "Elkhorn Private Wealth Advisors of Raymond James" (~$1.2B, 6-person team, joined RJ Jan 2021 from Alex. Brown), Palm Beach Gardens FL. Named to Barron''s Top 1,200 2025; ranked #43 Florida-South, Forbes Best-in-State 2025. Phone was previously unrecorded — found (561) 630-7370.')), 512)
WHERE id = 1058;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1058, x.name, x.role FROM (
  SELECT 'Jordan Funt' AS name, 'Financial Advisor, Elkhorn Private Wealth Advisors' AS role
  UNION ALL SELECT 'Larry Gonnello', 'Financial Advisor, Elkhorn Private Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1058) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1058 AND name = x.name);

-- ===== GROUP 714: Raymond James (formerly Merrill), Juneau, AK =====
-- 1062 Peter Jurasz
UPDATE contacts SET
  firm = 'Raymond James & Associates (formerly Merrill Wealth Management)',
  address = '8390 Airport Blvd, Ste 102',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: left Merrill for Raymond James & Associates April 2025, took his entire 5-person team (~$740M AUM), now branded "JHV Group of Raymond James," Juneau AK. Managing Director of the JHV Group, CPFA, ~34 yrs experience. Named to Barron''s Top 1,200 2018-2022/2024. Stale prior Merrill phone (907) 586-4103 left on file for reference; current numbers office (907) 621-6930, toll-free (833) 379-8355.')), 512)
WHERE id = 1062;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1062, x.name, x.role FROM (
  SELECT 'Rebecca Hall, CPWA' AS name, 'Financial Advisor, JHV Group of Raymond James' AS role
  UNION ALL SELECT 'Harold Heidersdorf, CFP', 'Financial Advisor, JHV Group of Raymond James'
  UNION ALL SELECT 'Christian Veliz, ChFC', 'Financial Advisor, JHV Group of Raymond James'
  UNION ALL SELECT 'Rylan Jurasz', 'Financial Advisor (daughter), JHV Group of Raymond James'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1062) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1062 AND name = x.name);

-- ===== GROUP 715: Raymond James (Agility Wealth Management), Orlando, FL =====
-- 1064 Paul Wood
UPDATE contacts SET
  firm = 'Agility Wealth Management | Raymond James',
  address = '720 Rugby St, Ste 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, leads "Agility Wealth Management" (multi-office FL practice, 30+ advisors firm-wide, with Raymond James since 2006/2009), Orlando FL. Raymond James Chairman''s Council 6 consecutive years; named to Barron''s Top 1,200 2022/2023; Forbes Best-in-State 4 consecutive years starting 2020, ranked #1 Florida 2023. Phone was previously unrecorded — found (407) 246-4977. Note: an older secondary address (301 E. Pine Street) also appears in some listings — flagged for verification.')), 512)
WHERE id = 1064;

-- ===== GROUP 716: Altfest Personal Wealth Management, New York, NY =====
-- 1066 Lewis Altfest
UPDATE contacts SET
  address = '445 Park Avenue, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO & Chief Investment Officer, founded Altfest Personal Wealth Management (formerly L.J. Altfest & Co., 1983, ~$1.6B AUM, ~40-50 employees), New York NY. Named to Barron''s Top 1,200 11+ consecutive years through 2024; Barron''s Top 100 Independent Wealth Advisors 2024. Phone confirmed correct (212) 406-0850.')), 512)
WHERE id = 1066;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1066, x.name, x.role FROM (
  SELECT 'Andrew Altfest' AS name, 'President & Principal Advisor (son), Altfest Personal Wealth Management' AS role
  UNION ALL SELECT 'Karen Altfest, Ph.D., CFP', 'Executive VP & Principal Advisor (wife), Altfest Personal Wealth Management'
  UNION ALL SELECT 'John Valentini, MBA', 'COO & Chief Compliance Officer, Altfest Personal Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1066) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1066 AND name = x.name);

-- ===== GROUP 717: Index Fund Advisors, Irvine, CA =====
-- 1067 Mark Hebner
UPDATE contacts SET
  address = '19200 Von Karman Ave., Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Index Fund Advisors Inc. (founded 1999, ~$4.9-5.9B AUM, ~50 employees), Irvine CA. Named to Barron''s Top Financial Advisors 2025/2026; Forbes Best-in-State #34 2019; firm on CNBC FA 100 list 2024/2025. Phone was previously unrecorded — found (949) 502-0050.')), 512)
WHERE id = 1067;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1067, x.name, x.role FROM (
  SELECT 'Wes Long' AS name, 'President, Index Fund Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1067) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1067 AND name = x.name);

-- ===== GROUP 718: Ameriprise Financial (Opus: Advice First), Oxford, CT =====
-- 1068 Nancy Daoud
UPDATE contacts SET
  firm = 'Opus: Advice First | Ameriprise Financial',
  address = '90 Oxford Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor and CEO, ChFC APMA, leads "Opus: Advice First" (Ameriprise, offices also in Harrison NY and Palo Alto CA, ~34+ yrs experience, ~$715M AUM), Oxford CT. Ranked #2 Connecticut, Forbes Top Women Wealth Advisors 2025 (#3 2026). Phone was previously unrecorded — found (203) 881-5504. COMPLIANCE FLAG (factual record, SIGNIFICANT — materially higher than typical): CRD 1073514 shows 8 disclosures including 6 customer complaints re: alleged unsuitable investments (e.g. a 2008 non-traded REIT purchase, a 2013 BDC/REIT complaint seeking $241,035.32, and an insurance-premium-misrepresentation complaint) plus a NY insurance-law violation described as an administrative error — exact dates/resolutions not independently confirmed against the live BrokerCheck record, recommend manual review before compliance-sensitive use.')), 512)
WHERE id = 1068;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1068, x.name, x.role FROM (
  SELECT 'Nina Daoud' AS name, 'President (likely daughter), Opus: Advice First' AS role
  UNION ALL SELECT 'Philip Bensley, CIMA', 'Chief Investment Officer, Opus: Advice First'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1068) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1068 AND name = x.name);

-- ===== GROUP 719: Merrill Wealth Management, Vienna, VA =====
-- 1069 Christopher MacNamara
UPDATE contacts SET
  address = '8075 Leesburg Pike, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, Senior Portfolio Manager, CIMA CPWA (with firm since 1995), Merrill Vienna (Tysons Corner) VA. Ranked #17 Virginia-North, Forbes Best-in-State 2026; team ranked #11 Virginia-North, Forbes Best-in-State Wealth Management Teams 2025. CRM phone (800) 637-7455 is Merrill''s generic toll-free line; direct office line (703) 734-8000. Note: team name/roster shows signs of recent churn across sources — recommend verifying current name directly before further updates.')), 512)
WHERE id = 1069;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1069, x.name, x.role FROM (
  SELECT 'Ban Tran' AS name, 'Senior partner, Financial Advisor, MacNamara team' AS role
  UNION ALL SELECT 'Elizabeth Burnette', 'Financial Advisor, MacNamara team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1069) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1069 AND name = x.name);

-- ===== GROUP 720: Merrill Wealth Management, Short Hills, NJ =====
-- 1070 Bruce Barth (Barth Cole Gonzalez Group)
UPDATE contacts SET
  address = '51 JFK Parkway, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP CRPC (with firm since 1973, 51+ yrs tenure), leads "Barth Cole Gonzalez Group" (~180 combined yrs team experience), Merrill Short Hills NJ. Named to Barron''s Top 1,200/1,500 2009-2011/2014-2026; ranked #35 New Jersey, Forbes Best-in-State 2025; team on Forbes Best-in-State Wealth Management Teams 2024/2025. CRM phone (973) 467-8000 does not match found listings — direct line (973) 564-7740, flagged for correction.')), 512)
WHERE id = 1070;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1070, x.name, x.role FROM (
  SELECT 'Jim Cole, CFP' AS name, 'Financial Advisor, Barth Cole Gonzalez Group' AS role
  UNION ALL SELECT 'Evelyn Gonzalez, CFP, CRPC', 'Financial Advisor, Barth Cole Gonzalez Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1070) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1070 AND name = x.name);
