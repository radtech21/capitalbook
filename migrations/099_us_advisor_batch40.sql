-- US Financial Advisor enrichment, batch 40 (20 contacts / 20 groups).
--
-- Firm-acquisition/rebrand notes (advisor stayed, entity changed):
-- 1156 Shon Flaharty — "Flaharty Asset Management" acquired by Modern
-- Wealth Management (announced ~June 3, 2026, ~$1.1B AUM, Modern
-- Wealth's 22nd acquisition); he is now a Managing Director there.
-- 1163 Shad Ketcher — his prior firm, New Era Financial Advisors,
-- Inc., was acquired by Wealth Enhancement Group in 2023 (~$1.1B AUM
-- at acquisition); CRM firm field "Wealth Enhancement Group" already
-- correct, noted here for context.
-- 1153 Alan Kodama — moved his Pacstar Financial Group practice from
-- Ameriprise Financial Services (34-yr affiliation) to LPL Financial
-- in July 2021, amid a TRO dispute (Ameriprise Financial Services,
-- LLC v. Kodama, June 2021) alleging client-data misuse.
-- 1151 CJ Charlebois Melendy — practice rebranded from "Guided Wealth
-- Advisors" (Williston VT) to "GuideWorth Advisors" (South Burlington
-- VT); Ameriprise affiliation unchanged.
-- 1148 Joseph Small — practice rebranded from "Small & Associates
-- Financial" to "Small Wealth Management."
-- 1160 Michael Smith — practice rebranded from "Michael Smith &
-- Associates" to "Alacrity Wealth Advisors."
--
-- Compliance flags (factual record, not data errors):
-- 1147 Glen Clemans (CGC Financial Services, Lake Oswego OR) — 1
-- disclosed customer complaint (Dec 2005, breach of contract/
-- negligence allegation), settled 2006.
-- 1153 Alan Kodama — BrokerCheck-indexed record shows 3 customer
-- dispute disclosures; specific outcomes unconfirmed.
-- 1163 Shad Ketcher — FINRA arbitration (case #21-02645, filed Jan
-- 2022) alleging unsuitable non-traded REIT recommendations while at
-- a prior firm (J.W. Cole Financial); settled Nov 2022 for $35,000,
-- paid individually by Ketcher.
-- 1156 Shon Flaharty — one source (2018/2019 securities-law blog)
-- references a "$500K Dispute" while at Merrill/Bank of America era;
-- a separate source claims "no disclosures" — the discrepancy is
-- unresolved, flagged for manual BrokerCheck verification, not
-- treated as a confirmed fact.
-- 1168 John Larsen (RBC, Mequon WI) — BrokerCheck-indexed record
-- shows at least one disclosure; search summarized two distinct
-- possible items (a denied 2000 dispute re: bond-type explanation,
-- and a possible 2023-2025 allegation re: unauthorized trades) that
-- could not be reconciled with confidence and may reflect a search-
-- summarization artifact — flagged for direct manual BrokerCheck
-- confirmation before any compliance-sensitive use, not recorded as
-- a confirmed recent event.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings); phone column left untouched per convention.

-- ===== GROUP 781: Ameriprise Financial (GenFocus Wealth Advisors), Mount Laurel, NJ =====
-- 1146 George Pittaoulis
UPDATE contacts SET
  firm = 'GenFocus Wealth Advisors | Ameriprise Financial',
  address = '3000 Atrium Way, Ste 510',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP ChFC CLU APMA, part of "GenFocus Wealth Advisors" (Ameriprise practice, ~26 yrs experience), Mount Laurel NJ. Named to Barron''s Top 1,200 2025; team ranked #49 New Jersey-South, Forbes Best-in-State Wealth Management Teams Jan 2025. CRM phone (856) 273-9500 does not match found listings — number found (856) 669-2600, flagged for correction.')), 512)
WHERE id = 1146;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1146, x.name, x.role FROM (
  SELECT 'Brian Altmann' AS name, 'Managing Partner, GenFocus Wealth Advisors' AS role
  UNION ALL SELECT 'Robert Esterman, CFP, ChFC, JD', 'Advisor, GenFocus Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1146) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1146 AND name = x.name);

-- ===== GROUP 782: CGC Financial Services, Lake Oswego, OR =====
-- 1147 Glen Clemans
UPDATE contacts SET
  address = '5 Centerpointe Dr, Suite 550',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner & Financial Advisor, CGC Financial Services LLC (independent RIA, founded 2006, ~$664.7M-$737M AUM, broker-dealer Osaic Wealth Inc., formerly Royal Alliance/Advisor Group before 2023 rebrand), Lake Oswego OR (~35-39 yrs experience). Portland Business Journal Top 10 Financial Advisors 2008; Financial Times Top 400 2015; Barron''s Top 10 Financial Advisors Oregon 2019. CRM phone (503) 635-1031 does not match current listings — number found (503) 670-1958, flagged for correction. COMPLIANCE FLAG (factual record): 1 disclosed customer complaint received Dec 2005 alleging breach of contract and negligence (while at Royal Alliance Associates), settled 2006.')), 512)
WHERE id = 1147;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1147, x.name, x.role FROM (
  SELECT 'Davena Yee' AS name, 'Behavioral Financial Advisor, CGC Financial Services' AS role
  UNION ALL SELECT 'Shane Hunt, CFP', 'Advisor, CGC Financial Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1147) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1147 AND name = x.name);

-- ===== GROUP 783: Ameriprise Financial (Small Wealth Management), Little Rock, AR =====
-- 1148 Joseph Small
UPDATE contacts SET
  firm = 'Small Wealth Management | Ameriprise Financial',
  address = '36 Rahling Cir, Ste 2',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice rebrand: "Small & Associates Financial" renamed "Small Wealth Management" (Ameriprise unchanged). President/Private Wealth Advisor, Little Rock AR (also satellite offices Hot Springs Village AR/Tulsa OK). Forbes Best-in-State recurring 2018/2020-2026, ranked #24 Arkansas 2026; team on Forbes Best-in-State Wealth Management Teams 2026; ranked #1 Arkansas by Barron''s 2011-2013, named to Barron''s Top 1,200/1,500; Ameriprise Circle of Success/Chairman''s Advisory Council 2006-2026. Phone confirmed correct (501) 975-7968.')), 512)
WHERE id = 1148;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1148, x.name, x.role FROM (
  SELECT 'Ryan Bartholomew, CFP, CRPC, APMA' AS name, 'Vice President, Small Wealth Management' AS role
  UNION ALL SELECT 'Madeline Orbin', 'Financial Advisor, Small Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1148) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1148 AND name = x.name);

-- ===== GROUP 784: Cornerstone Financial Solutions, Sioux Falls, SD =====
-- 1150 Gordon Wollman
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and CEO, Wealth Advisor, Cornerstone Financial Solutions Inc. (independent RIA, securities via Raymond James Financial Services, offices Sioux Falls/Huron SD), Sioux Falls SD. Named to Barron''s Top 1,200; team on Forbes Best-in-State Wealth Management Teams 2026 (team-member listing); "top 1%" of advisors 11 consecutive years, published author. CRM phone (605) 271-0469 could not be verified — numbers found (605) 357-8553 (Sioux Falls) / (605) 352-9490 (Huron), flagged for correction.')), 512)
WHERE id = 1150;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1150, x.name, x.role FROM (
  SELECT 'Andrew Ulvestad' AS name, 'Wealth Associate (Huron office), Cornerstone Financial Solutions' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1150) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1150 AND name = x.name);

-- ===== GROUP 785: Ameriprise Financial (GuideWorth Advisors), South Burlington, VT =====
-- 1151 CJ Charlebois Melendy
UPDATE contacts SET
  firm = 'GuideWorth Advisors | Ameriprise Financial',
  address = '120 Kimball Ave, Ste 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice rebrand: "Guided Wealth Advisors" (Williston VT) renamed "GuideWorth Advisors" and relocated to South Burlington VT (Ameriprise unchanged). Private Wealth Advisor, CFP ChFC CLU CRPC APMA. Named to Barron''s Top 1,200 2025; ranked #1 Vermont, Forbes Best-in-State Women Wealth Advisors; team on Forbes Best-in-State Wealth Management Teams 2026. CRM phone (800) 297-7378 unverified — direct office line found (802) 657-3800, flagged for correction.')), 512)
WHERE id = 1151;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1151, x.name, x.role FROM (
  SELECT 'Kyle Pembroke' AS name, 'Associate Financial Advisor, GuideWorth Advisors' AS role
  UNION ALL SELECT 'Amy M. Boland', 'Associate Financial Advisor, GuideWorth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1151) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1151 AND name = x.name);

-- ===== GROUP 786: Edward Jones (Zenker Wealth Management), Fargo, ND =====
-- 1152 Paul Zenker
UPDATE contacts SET
  address = '4809 38th St S, Suite 102',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CEPA AAMS, leads "Zenker Wealth Management" (with firm since 2008), Edward Jones Fargo ND. Ranked #6 North Dakota, Forbes Best-in-State 2025. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (701) 997-0062.')), 512)
WHERE id = 1152;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1152, x.name, x.role FROM (
  SELECT 'Taylor Pinks' AS name, 'Associate Financial Advisor, Zenker Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1152) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1152 AND name = x.name);

-- ===== GROUP 787: Pacstar Financial Group (formerly Ameriprise, now LPL Financial), Honolulu, HI =====
-- 1153 Alan Kodama
UPDATE contacts SET
  firm = 'Pacstar Financial Group | LPL Financial (formerly Ameriprise)',
  address = '1585 Kapiolani Blvd, Suite 1775',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: moved Pacstar Financial Group from Ameriprise Financial Services (34-yr affiliation, through June 2021) to LPL Financial, July 2021. CEO & President, CLU CFS, Honolulu HI (founded practice 1987, ~$420-425M AUM at 2021 transition). Forbes Best-in-State Hawaii #17 (2020, later-year listing unconfirmed post-move); named to Barron''s Top 1,200. CRM phone (808) 522-0100 could not be confirmed — legacy number (808) 792-7411 found, flagged for verification (may itself be stale). COMPLIANCE FLAG (factual record): BrokerCheck-indexed record shows 3 customer dispute disclosures, outcomes unconfirmed. Separately, Ameriprise Financial Services LLC sought a temporary restraining order against Kodama in June 2021 (Ameriprise Financial Services, LLC v. Kodama) alleging he took client data in violation of his departure agreement — a notable legal dispute, not a FINRA disclosure per se.')), 512)
WHERE id = 1153;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1153, x.name, x.role FROM (
  SELECT 'Thomas Lodico' AS name, 'Advisor, Pacstar Financial Group' AS role
  UNION ALL SELECT 'John Araki', 'Advisor, Pacstar Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1153) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1153 AND name = x.name);

-- ===== GROUP 788: Edward Jones (Scott Wealth Management), Rock Springs, WY =====
-- 1154 Ryan Scott
UPDATE contacts SET
  address = '1575 Dewar Dr, Suite 420',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP CEPA AAMS, leads "Scott Wealth Management" (with firm 25 yrs), Edward Jones Rock Springs WY. Named to Barron''s Top 1,200 (5th consecutive year); ranked #4 Wyoming, Forbes Best-in-State 2026. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (307) 382-3278.')), 512)
WHERE id = 1154;

-- ===== GROUP 789: RBC Wealth Management (EagleView Wealth Management Group), Stillwater, MN =====
-- 1155 Rhett Neuman
UPDATE contacts SET
  address = '350 Main St N, Unit 106',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Financial Advisor, Senior Portfolio Manager (Portfolio Focus program), CFP, leads "EagleView Wealth Management Group" (rebrand from "Neuman Wealth Management Group," with RBC since 2009), Stillwater MN. Named to Barron''s Top 1,200 2021/2023/Top 1,500 2026; Forbes Best-in-State 2022/2025/2026. CRM phone (800) 933-6830 does not match found listings — direct office line (651) 430-5545, flagged for correction.')), 512)
WHERE id = 1155;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1155, x.name, x.role FROM (
  SELECT 'Eric St. Martin' AS name, 'Senior Vice President, Financial Advisor, EagleView Wealth Management Group' AS role
  UNION ALL SELECT 'Ryan Heroff', 'Associate Vice President & Financial Advisor (joined 2016), EagleView Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1155) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1155 AND name = x.name);

-- ===== GROUP 790: Modern Wealth Management (formerly Flaharty Asset Management), Clearwater, FL =====
-- 1156 Shon Flaharty
UPDATE contacts SET
  firm = 'Modern Wealth Management (formerly Flaharty Asset Management)',
  address = '311 Park Place Blvd, Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: "Flaharty Asset Management" (founded 2007) acquired by Modern Wealth Management, announced ~June 3, 2026, ~$1.1B AUM, Modern Wealth''s 22nd acquisition. Managing Director (formerly CEO & President), CFP AIF (~30 yrs experience, prior Merrill Lynch/Bank of America Private Bank), Clearwater FL/Tampa Bay office (also Punta Gorda FL). Ranked #5 Florida-North, Forbes Best-in-State 2022. Phone was previously unrecorded — found (727) 252-1050. COMPLIANCE DISCREPANCY (unresolved, factual caveat): one 2018/2019 securities-law source references a "$500K Dispute" (likely Merrill/BofA era); a separate source states "no disclosures" — conflicting, not independently reconciled, recommend direct BrokerCheck (CRD 2666498) confirmation before any compliance-sensitive use.')), 512)
WHERE id = 1156;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1156, x.name, x.role FROM (
  SELECT 'Hunter Orr, CFA' AS name, 'Managing Director (co-lead, formerly CIO of Flaharty Asset Management), Modern Wealth Management' AS role
  UNION ALL SELECT 'Fallon Flaharty', 'Financial Advisor (promoted Jan 2026, likely relative), Modern Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1156) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1156 AND name = x.name);

-- ===== GROUP 791: RBC Wealth Management (Rosenwald Private Wealth), Baltimore, MD =====
-- 1158 Beth Rosenwald
UPDATE contacts SET
  address = '2800 Quarry Lake Drive, Suite 260',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Financial Advisor, leads "Rosenwald Private Wealth" (with firm since 2008, career start 1989), RBC Baltimore MD. Ranked #1 Maryland, Forbes Top Women Wealth Advisors 2025; ranked #4 Maryland-Baltimore, Forbes Best-in-State 2025; Daily Record Maryland''s Top 100 Women; Financial Times Top 400. CRM phone (410) 837-2400 could not be verified — direct line found (410) 318-5074, flagged for correction.')), 512)
WHERE id = 1158;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1158, x.name, x.role FROM (
  SELECT 'Matthew D. Kunkel, CFP' AS name, 'Managing Director, Branch Director, Financial Advisor, Rosenwald Private Wealth' AS role
  UNION ALL SELECT 'Leksi Kovalerchik, CDFA, RICP', 'Financial Advisor, Rosenwald Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1158) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1158 AND name = x.name);

-- ===== GROUP 792: Gentian Financial, Mequon, WI =====
-- 1159 Chris Doughty
UPDATE contacts SET
  address = '12740 North River Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President, CFP CRPC, Gentian Financial Inc. (independent practice, securities via Raymond James Financial Services, President since 2015), Mequon WI. Forbes Best-in-State Wisconsin 7 consecutive years through 2024; Raymond James Chairman''s Council member since 2018. CRM phone (262) 241-1000 could not be verified — number found (262) 518-7575, flagged for correction.')), 512)
WHERE id = 1159;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1159, x.name, x.role FROM (
  SELECT 'Kenneth Flannery' AS name, 'Financial Advisor (retirement planning), Gentian Financial' AS role
  UNION ALL SELECT 'Lisa Sheridan', 'Director, Client Operations, Gentian Financial'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1159) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1159 AND name = x.name);

-- ===== GROUP 793: Ameriprise Financial (Alacrity Wealth Advisors), Stevens Point, WI =====
-- 1160 Michael Smith
UPDATE contacts SET
  firm = 'Alacrity Wealth Advisors | Ameriprise Financial',
  address = '3241A Business Park Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice rebrand: "Michael Smith & Associates" renamed "Alacrity Wealth Advisors" (Ameriprise unchanged, ~10-member team). Private Wealth Advisor, Founder & President, CFP MSFS CIMA (~42+ yrs experience), Stevens Point WI. Named to Barron''s Top 1,200 2018/2019/2020/2024; Forbes Best-in-State 2018-2020; team ranked #53 Wisconsin, Forbes Best-in-State Wealth Management Teams 2025. CRM phone (800) 297-7378 is Ameriprise''s generic line; direct office line (715) 341-6657.')), 512)
WHERE id = 1160;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1160, x.name, x.role FROM (
  SELECT 'Kim R. Angell, CFP, ChFC, APMA' AS name, 'Financial Advisor, Alacrity Wealth Advisors' AS role
  UNION ALL SELECT 'Michael B. Nerdahl, CRPC, APMA', 'Private Wealth Advisor, Alacrity Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1160) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1160 AND name = x.name);

-- ===== GROUP 794: Cerity Partners (formerly Janiczek Wealth Management), Denver, CO =====
-- 1161 Joseph Janiczek
UPDATE contacts SET
  address = '6900 E Layton Ave., Ste. 1150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner & Practice Leader, Denver office, founded and led "Janiczek Wealth Management" (1990-2024) as CEO before it merged into Cerity Partners Oct 2024 (~$1.4B AUM added) — CRM firm field "Cerity Partners" already correct. Author of "Absolute Financial Freedom," "Investing from a Position of Strength," co-author "Family Wealth." Named to Barron''s Top 1,200 12 consecutive years through 2025; ranked #13 Colorado, Forbes Best-in-State 2025. Phone was previously unrecorded — could not confirm a current direct Denver number, recommend follow-up via firm contact page.')), 512)
WHERE id = 1161;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1161, x.name, x.role FROM (
  SELECT 'R. Brady Siegrist' AS name, 'Partner, Denver office, Cerity Partners' AS role
  UNION ALL SELECT 'Kyle Kersting', 'Partner (former Managing Partner & CIO of Janiczek Wealth Management), Cerity Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1161) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1161 AND name = x.name);

-- ===== GROUP 795: Ameriprise Financial (Silver Lining Wealth Advisors), Scottsdale, AZ =====
-- 1162 Nayan Ranchhod
UPDATE contacts SET
  firm = 'Silver Lining Wealth Advisors | Ameriprise Financial',
  address = '16220 N Scottsdale Rd, Ste 250',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Private Wealth Advisor, CFP CRPC AAMS APMA, leads "Silver Lining Wealth Advisors" (Ameriprise, with firm 17+ yrs, practice since 2010, ~$807M AUM), Scottsdale AZ. Named to Barron''s Top 1,500 2026; ranked #10 Arizona, Forbes Best-in-State 2025; team on Forbes Best-in-State Wealth Management Teams 2026. Phone confirmed correct (480) 922-4234.')), 512)
WHERE id = 1162;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1162, x.name, x.role FROM (
  SELECT 'Bryce Cook' AS name, 'Financial Advisor, Silver Lining Wealth Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1162) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1162 AND name = x.name);

-- ===== GROUP 796: Wealth Enhancement Group, Plymouth, MN =====
-- 1163 Shad Ketcher (New Era-Hutchinson Team)
UPDATE contacts SET
  address = '756 Century Ave SW, Hutchinson, MN 55350',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, part of "New Era-Hutchinson Team" (formerly New Era Financial Advisors Inc., founded 1982, acquired by Wealth Enhancement Group 2023, ~$1.1B AUM at acquisition, with firm since 1995), works primarily out of Hutchinson MN (CRM listed Plymouth MN, WEG''s corporate HQ — actual working office confirmed as Hutchinson, flagged for address correction). CRM phone (763) 417-1700 is WEG''s Plymouth corporate line, not his branch — Hutchinson office number (320) 587-0459/0460. COMPLIANCE FLAG (factual record): FINRA arbitration case #21-02645, filed Jan 6 2022, alleging unsuitable recommendation of two non-traded REITs while registered with prior firm J.W. Cole Financial Inc. — settled Nov 2022 for $35,000, paid individually by Ketcher.')), 512)
WHERE id = 1163;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1163, x.name, x.role FROM (
  SELECT 'Donald Warner' AS name, 'Financial Advisor, New Era-Hutchinson Team' AS role
  UNION ALL SELECT 'Grant Lindaman', 'Financial Advisor, New Era-Hutchinson Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1163) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1163 AND name = x.name);

-- ===== GROUP 797: Edward Jones (Swanson Wealth Management), Joplin, MO =====
-- 1167 Don Swanson
UPDATE contacts SET
  address = '2205 Connecticut Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, AAMS, leads "Swanson Wealth Management" (serving Joplin since 1979, ~43 yrs experience), Edward Jones Joplin MO. Ranked #14 Missouri, Barron''s Top 1,200 2023; ranked #3 Missouri, Forbes Best-in-State 2023. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (417) 781-2711. Note: unrelated "Donald John Swanson" (CRD 1608400, MML Investors Services, IL) is a different individual — do not conflate.')), 512)
WHERE id = 1167;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1167, x.name, x.role FROM (
  SELECT 'Michael D. Swanson, CFP, CKA' AS name, 'Financial Advisor (likely relative/succession partner), Swanson Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1167) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1167 AND name = x.name);

-- ===== GROUP 798: RBC Wealth Management (The Larsen Group), Mequon, WI =====
-- 1168 John Larsen
UPDATE contacts SET
  address = 'Newport Square Building, 10528 N. Port Washington Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Branch Director, Financial Advisor, Senior Portfolio Manager-Portfolio Focus, CFP, leads "The Larsen Group" (~35+ yrs experience), RBC Mequon WI. RBC Chairman''s Council every year since 1999 (top 5% of RBC advisors firm-wide); named to Barron''s Top 1,200 (firm-wide list participation confirmed 2020-2023); ranked Forbes Best-in-State Wisconsin 2025. CRM phone (800) 933-6830 does not match found listings — direct line found (262) 241-2335, flagged for correction. COMPLIANCE FLAG (UNVERIFIED — factual caveat, not a confirmed record): BrokerCheck-indexed record shows at least one disclosure; search results referenced two distinct possible items (a denied 2000 dispute re: bond-type explanation, and a possible 2023-2025 allegation re: unauthorized trades) that could not be reconciled with confidence and may reflect a search-summarization artifact — recommend direct BrokerCheck (CRD 1179526) confirmation before any compliance-sensitive use.')), 512)
WHERE id = 1168;

-- ===== GROUP 799: Raymond James (Adams Wealth Management), St. Louis, MO =====
-- 1169 Neil Adams
UPDATE contacts SET
  address = '9900 Clayton Road, Ladue, MO 63124',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Private Wealth Advisor, CFP AIF, leads "Adams Wealth Management of Raymond James" (~20 yrs experience), St. Louis (Ladue) MO. Forbes Best-in-State 2026; named to Barron''s Top 1,500; Raymond James Retirement Plan & Institutional Advisory Council member, Chairman''s Council 2018-2023. CRM phone (800) 248-8863 is Raymond James'' generic national line; direct office line (314) 214-2163. Note: a same-named "Neil Adams" (CRD 4183126, Raymond James Financial Services) is a different individual — confirmed this record is CRD 4542673.')), 512)
WHERE id = 1169;

-- ===== GROUP 800: Ameriprise Financial (Kandas Private Wealth Advisors), Phoenix, AZ =====
-- 1170 Wayne Kandas
UPDATE contacts SET
  firm = 'Kandas Private Wealth Advisors | Ameriprise Financial',
  address = '2398 E Camelback Rd, Ste 550',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP APMA, founding/lead advisor of "Kandas Private Wealth Advisors" (also seen as "Kandas Financial Group," likely rebrand in progress; Ameriprise unchanged), Phoenix AZ. Succession dynamic in progress — son Chris Kandas increasingly co-leading, worth a follow-up enrichment pass. Ranked #22 Arizona-Phoenix, Forbes Best-in-State Apr 2026; team on Forbes Best-in-State Wealth Management Teams 2025. Phone confirmed correct (480) 922-4215.')), 512)
WHERE id = 1170;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1170, x.name, x.role FROM (
  SELECT 'Christopher Kandas, CFP, APMA, CEPA' AS name, 'Financial Advisor (son and successor), Kandas Private Wealth Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1170) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1170 AND name = x.name);
