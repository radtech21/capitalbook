-- US Financial Advisor enrichment, batch 35 (20 contacts / 20 groups).
--
-- Firm-change corrections (advisor departed, updates firm/title/address,
-- leaves stale phone flagged not deleted):
-- 1025 Joseph Young — left Merrill Lynch, joined UBS Financial Services
-- late March 2026 (reported by AdvisorHub), took ~$956M-$1B AUM /
-- ~$8.6M trailing revenue. Working out of a UBS Memphis TN office
-- temporarily until UBS opens a Jonesboro AR office later in 2026.
-- 1027 Patrick McGrath — departed Morgan Stanley for RBC Wealth
-- Management Nov 12, 2025, took ~$705M AUM with his team.
--
-- Firm-affiliation notes (advisor stayed, no true departure):
-- 1018 Frederick Keator — Keator Group affiliated with Raymond James
-- Financial Services/Raymond James Financial Services Advisors since
-- Oct 16, 2019; CRM firm field left as "Keator Group" per existing
-- convention (team/practice name), affiliation noted in data_flags.
--
-- Compliance flags (factual record, not data errors):
-- 1032 Brian Pultman (Correct Capital Wealth Mgmt, Clayton MO) — 4
-- disclosure events on BrokerCheck incl. a 2005 dispute settled for
-- $195,000 and a 2008 industry-wide auction-rate-securities dispute
-- settled for $4.3M; two further disputes from 2011 and an unspecified
-- date. Does not affect current active status.
-- 1034 Jackson Rhoades (FSIS Group | Raymond James, Mountain Home AR)
-- — SIGNIFICANT: FINRA arbitration panel ruled Feb 2023 in Wells
-- Fargo Advisors v. Raymond James/Rhoades et al. (stemming from a
-- 2018 "coordinated raid" of 12 advisors from Wells Fargo''s Mountain
-- Home branch), awarding Wells Fargo ~$20M total (Raymond James and
-- Rhoades jointly/severally liable for $15.3M compensatory + $3.5M
-- attorneys'' fees + $847K costs against Rhoades; $1M punitive against
-- Raymond James separately). Raymond James/Rhoades petitioned federal
-- court (D. Del., Case 1:23-cv-01262) to vacate; a June 2024 ruling
-- reportedly vacated or substantially altered the award, but the
-- final disposition could not be independently confirmed — recommend
-- periodic re-check and manual court-record verification.
-- 1037 Alvaro Gonzalez (Merrill, McAllen TX) — BrokerCheck-indexed
-- record shows 5 disclosure events, all customer disputes; specific
-- outcomes not independently confirmed, recommend manual review.
-- 1017 Jay McGill's teammate Gregory Suzio (not McGill himself) has a
-- pending customer complaint filed 4/4/2024 alleging unsuitable
-- recommendations 2021-2023, $499,000 claimed — noted for context on
-- McGill's record since they share a team.
--
-- Geography/data-quality verification: 1033 Christopher Grennon —
-- confirmed CORRECTLY based in Portland, MAINE (not Oregon, despite
-- the CRM's 503-area-code phone number, which was the actual error —
-- 503 is a Portland OR area code). City/state field is correct;
-- phone flagged for correction.
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- are generic toll-free/national lines or simply unmatched to current
-- listings); phone column left untouched per convention.

-- ===== GROUP 681: Ameriprise Financial, Charlotte, NC =====
-- 1016 Mark Walker (Walker and Associates)
UPDATE contacts SET
  address = '3125 Springbank Ln, Ste H',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP ChFC, leads "Walker and Associates" (Ameriprise), Charlotte NC. Named to Barron''s Top 1,200/1,500 2025/2026; ranked #7 Forbes Best-in-State North Carolina 2025. CRM phone (704) 344-3900 does not match found listings — number found (704) 540-9996, flagged for correction.')), 512)
WHERE id = 1016;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1016, x.name, x.role FROM (
  SELECT 'Gary T. Moss Jr., CFP' AS name, 'Advisor, Walker and Associates' AS role
  UNION ALL SELECT 'Bradford J. Sabol', 'Advisor, Walker and Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1016) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1016 AND name = x.name);

-- ===== GROUP 682: Merrill Wealth Management, Auburn Hills, MI =====
-- 1017 Jay McGill (McGill Suzio Group)
UPDATE contacts SET
  address = '3030 Cross Creek Parkway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP CIMA, leads "McGill Suzio Group" (with firm since 1996), Merrill Auburn Hills MI. Ranked #13 Forbes Best-in-State Michigan 2025; team on Forbes Best-in-State Wealth Management Teams 2023-2024. CRM phone (800) 637-7455 is Merrill''s generic toll-free line; direct branch line (248) 475-1000. COMPLIANCE NOTE (factual record, applies to teammate not McGill himself): teammate Gregory Suzio has a pending customer complaint filed 4/4/2024 alleging unsuitable recommendations 2021-2023, $499,000 claimed — outcome unconfirmed.')), 512)
WHERE id = 1017;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1017, x.name, x.role FROM (
  SELECT 'Gregory Suzio, CFP, CRPC' AS name, 'Financial Advisor (joined 2007), McGill Suzio Group' AS role
  UNION ALL SELECT 'Krystal Burns, CFP', 'Senior Business Manager/Client Associate, McGill Suzio Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1017) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1017 AND name = x.name);

-- ===== GROUP 683: Keator Group, Lenox, MA =====
-- 1018 Frederick Keator
UPDATE contacts SET
  address = '218 Main Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Branch Manager, Keator Group LLC (affiliated with Raymond James Financial Services/Raymond James Financial Services Advisors since 10/16/2019), Lenox MA. Forbes Best-in-State Massachusetts 2018/2022/2024 (#4 in 2024); team on Forbes Best-in-State Wealth Management Teams 2025; Barron''s Top 1,000 2010-2012.')), 512)
WHERE id = 1018;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1018, x.name, x.role FROM (
  SELECT 'David P.G. Keator' AS name, 'Managing Director (brother), Keator Group' AS role
  UNION ALL SELECT 'Matthew D.M. Keator', 'Managing Director/Senior Partner (brother), Keator Group'
  UNION ALL SELECT 'Sheila N. Keator', 'Founder, Wealth Advisor emerita, Keator Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1018) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1018 AND name = x.name);

-- ===== GROUP 684: Merrill Wealth Management, Paramus, NJ =====
-- 1019 August Zenzius (Aiello, Zenzius and Associates)
UPDATE contacts SET
  address = '115 West Century Road, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor & Managing Director, CRPC CPFA, part of "Aiello, Zenzius and Associates" (with firm since 1998), Merrill Paramus NJ. Forbes Best-in-State New Jersey 2019-2023; Barron''s Top 1,200 2021-2024; team ranked #7 NJ-North (High Net Worth), Forbes team ranking. CRM phone (201) 986-4000 does not match found listings — direct number (201) 967-3751, flagged for correction.')), 512)
WHERE id = 1019;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1019, x.name, x.role FROM (
  SELECT 'Frank Aiello' AS name, 'Financial Advisor, Aiello, Zenzius and Associates' AS role
  UNION ALL SELECT 'John Hofman, CFA', 'Senior Business Manager, Aiello, Zenzius and Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1019) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1019 AND name = x.name);

-- ===== GROUP 685: Ameriprise Financial, Gilbert, AZ =====
-- 1020 Steve Rabin (Academy Advisors Wealth Management)
UPDATE contacts SET
  address = '161 E Rivulon Blvd, Ste 108',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director, CFP ChFC CRPC BFA APMA CDFA CEPA, leads "Academy Advisors Wealth Management" (Ameriprise, ~32 yrs experience), Gilbert AZ (also office Scottsdale AZ). Ranked #4 Forbes Best-in-State Arizona 2026; team on Forbes Best-in-State Wealth Management Teams 2026. CRM phone (480) 545-8390 does not match current published number — correct number (480) 396-6040, flagged for correction.')), 512)
WHERE id = 1020;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1020, x.name, x.role FROM (
  SELECT 'Louis Schuster III, APMA, CRPC' AS name, 'Associate Advisor, Academy Advisors Wealth Management' AS role
  UNION ALL SELECT 'Travis Carlisle, APMA, CRPC', 'Associate Advisor, Academy Advisors Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1020) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1020 AND name = x.name);

-- ===== GROUP 686: Fitzgerald Financial Group | Northwestern Mutual, Richmond, VA =====
-- 1021 Jim Fitzgerald
UPDATE contacts SET
  address = '3901 Westerre Parkway, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner, Private Wealth Advisor, Estate and Business Planning Specialist, Fitzgerald Financial Group (Northwestern Mutual, with firm since 1985), Richmond VA. Forbes Best-in-State Virginia 2022, ranked ~#5 2025; team on Forbes Best-in-State Wealth Management Teams 2026; named to Financial Times Top 400 and Barron''s Top 1,200 2019. CRM phone (866) 950-4644 is NM''s generic national line; direct office line (804) 762-7032.')), 512)
WHERE id = 1021;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1021, x.name, x.role FROM (
  SELECT 'Meghan Fitzgerald' AS name, 'Advisor (joined 2012, daughter), Fitzgerald Financial Group' AS role
  UNION ALL SELECT 'William G. Finch', 'Operations Associate (joined 2018), Fitzgerald Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1021) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1021 AND name = x.name);

-- ===== GROUP 687: UBS Wealth Management, Richmond, VA =====
-- 1022 Scott Garnett (The Garnett Group)
UPDATE contacts SET
  address = '951 East Byrd Street, Riverfront Plaza East, Suite 520',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Senior Vice President-Wealth Management, CFP CPM, leads "The Garnett Group" (with firm/predecessors since 1998), UBS Richmond VA. Forbes Best-in-State Virginia every year 2018-2026; Barron''s Top 1,200 2022-2025/Top 1,500 2026; team on Forbes Best-in-State Wealth Management Teams 2025. CRM phone (804) 788-5000 could not be verified — direct line found (804) 775-1514, flagged for correction.')), 512)
WHERE id = 1022;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1022, x.name, x.role FROM (
  SELECT 'Frederick Dunning' AS name, 'Financial Advisor (with team since 1997), The Garnett Group' AS role
  UNION ALL SELECT 'Ashley Costanzo', 'Team member, Wealth Management, The Garnett Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1022) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1022 AND name = x.name);

-- ===== GROUP 688: RBC Wealth Management, Rockville, MD =====
-- 1023 Michael Riley (The Linn Group)
UPDATE contacts SET
  address = '111 Rockville Pike, Suite 825',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Financial Advisor, CFP, part of "The Linn Group" (led by Robert Linn, with firm since 2003), RBC Rockville MD. Ranked #12 Forbes Best-in-State Maryland 2025/2026; team on Forbes Best-in-State Wealth Management Teams 2026. CRM phone (800) 933-6830 could not be verified — direct branch line (301) 309-2622, flagged for correction.')), 512)
WHERE id = 1023;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1023, x.name, x.role FROM (
  SELECT 'Robert Linn, AWM' AS name, 'Managing Director, Financial Advisor (team lead), The Linn Group' AS role
  UNION ALL SELECT 'Linda Lang', 'Senior Registered Client Associate, The Linn Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1023) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1023 AND name = x.name);

-- ===== GROUP 689: UBS Financial Services (formerly Merrill), Memphis/Jonesboro area =====
-- 1025 Joseph Young
UPDATE contacts SET
  firm = 'UBS Financial Services (formerly Merrill Wealth Management)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: left Merrill Lynch, joined UBS Financial Services late March 2026 (reported by AdvisorHub), moving ~$956M-$1B AUM / ~$8.6M trailing-12-month revenue. Team branded "Young Wealth Management." Working temporarily out of a UBS Memphis TN office until UBS opens a Jonesboro AR office later in 2026; exact new address not yet confirmed. Managing Director, Private Wealth Advisor. Ranked #1 Arkansas, Forbes Best-in-State 2025. Stale prior address/phone (Jonesboro AR, (870) 933-1339) left on file for reference only — no longer current, flagged for follow-up once the new office opens.')), 512)
WHERE id = 1025;

-- ===== GROUP 690: Merrill Wealth Management, Lake Oswego, OR =====
-- 1026 William Kiefel (The Kiefel Group)
UPDATE contacts SET
  address = '4004 Kruse Way Pl, Ste 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CPWA CRPC (39-yr Merrill veteran), leads "The Kiefel Group," Merrill Lake Oswego OR. Named to Barron''s Top 1,200 2014-2016/2019-2023; ranked #21 Forbes Best-in-State Oregon 2025; team member Kyle Rugg on Forbes Best-in-State Wealth Management Teams 2023/2024. CRM phone (503) 635-4000 does not match found listings — number found (503) 221-4646, flagged for correction.')), 512)
WHERE id = 1026;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1026, x.name, x.role FROM (
  SELECT 'Kyle Rugg' AS name, 'First Vice President, Financial Advisor, The Kiefel Group' AS role
  UNION ALL SELECT 'Ginger M. Cline', 'Officer, Registered Senior Wealth Management Client Associate, The Kiefel Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1026) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1026 AND name = x.name);

-- ===== GROUP 691: RBC Wealth Management (formerly Morgan Stanley), Fargo, ND =====
-- 1027 Patrick McGrath (The McGrath Group)
UPDATE contacts SET
  firm = 'RBC Wealth Management (formerly Morgan Stanley Wealth Management)',
  address = '4207 28th Avenue South, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM CHANGE: departed Morgan Stanley for RBC Wealth Management Nov 12, 2025, taking ~$705M AUM with his team, "The McGrath Group." Managing Director-Financial Advisor, Senior Portfolio Manager, RBC Fargo ND. Ranked #5 Forbes Best-in-State North Dakota 2025 (earned while at Morgan Stanley, re-verify under RBC for 2026 list). Focus: ESOP company advisory. CRM phone (701) 237-2600 is the old Morgan Stanley number, now stale — new direct RBC line (701) 298-4027, flagged for correction.')), 512)
WHERE id = 1027;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1027, x.name, x.role FROM (
  SELECT 'Dylan J. Droegemueller' AS name, 'Associate (joined 2023), The McGrath Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1027) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1027 AND name = x.name);

-- ===== GROUP 692: UBS Private Wealth Management, Greenville, SC =====
-- 1028 W. Clark Gallivan (The Gallivan Group)
UPDATE contacts SET
  address = '17 West McBee Avenue, Poinsett Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, CFP CIMA, leads "The Gallivan Group" (founded by his father, with firm since 2001), UBS Greenville SC. Ranked #13 Forbes Best-in-State South Carolina 2026; named to Barron''s Top 1,500 2026. CRM phone (800) 354-9103 is UBS''s generic client-support line; direct team line (864) 370-4920.')), 512)
WHERE id = 1028;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1028, x.name, x.role FROM (
  SELECT 'Maura Maness' AS name, 'Wealth Management Associate, The Gallivan Group' AS role
  UNION ALL SELECT 'Sandra McAvoy', 'Wealth Strategy Associate, The Gallivan Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1028) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1028 AND name = x.name);

-- ===== GROUP 693: F.L.Putnam Investment Management, Portland, ME =====
-- 1029 Robertson Breed
UPDATE contacts SET
  address = '5 Widgery Wharf, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Principal, Managing Director of Investment Advisory Services, Portfolio Manager, co-chairs firm-wide Asset Allocation Committee (with firm since 1991), F.L.Putnam Investment Management Portland ME. Named to Barron''s Top 1,200 7 consecutive years through 2025, ranked #2 Maine 2024; firm named to Barron''s Top 100 RIA Firms 2025. CRM phone (617) 267-1155 does not match any F.L.Putnam number found (Portland office is (207) 775-3197) — flagged as likely incorrect.')), 512)
WHERE id = 1029;

-- ===== GROUP 694: Merrill Wealth Management, New Orleans, LA =====
-- 1030 Scott Hardie (Hardie and Johnson Wealth Management)
UPDATE contacts SET
  address = '601 Poydras St, 25th Floor, Suite 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CPFA CRPC, leads "Hardie and Johnson Wealth Management" (with firm since 1996), Merrill New Orleans LA. Named to Forbes Best-in-State Louisiana (recent list). CRM phone (504) 585-4100 does not match found listings — direct team line (504) 586-7792, flagged for correction. COMPLIANCE NOTE (factual record, not independently re-confirmed against live BrokerCheck): CRD 2788646 indexed as showing 2 customer disputes (2001 — instructions-not-followed, firm denied; 2009 — unsuitable recommendations, $50,462 claimed, firm denied) — resolution details unconfirmed, recommend periodic re-check.')), 512)
WHERE id = 1030;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1030, x.name, x.role FROM (
  SELECT 'Maria B. Johnson' AS name, 'Senior Financial Advisor, Hardie and Johnson Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1030) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1030 AND name = x.name);

-- ===== GROUP 695: Correct Capital Wealth Management, St. Louis (Clayton), MO =====
-- 1032 Brian Pultman
UPDATE contacts SET
  address = '130 S Bemiston Ave, Suite 602',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Chief Executive Officer, CFP, Correct Capital Wealth Management LLC (independent RIA, est. 2018, prior A.G. Edwards/Wells Fargo Advisors), located in Clayton MO (part of Greater St. Louis metro, CRM city "St. Louis" is metro-area-correct). Named to Barron''s Top 1,200 2024 (national); Small Business Monthly Best Wealth Managers in St. Louis 2024. CRM phone (314) 260-0260 could not be verified — firm''s published number is (314) 930-4015, flagged for correction. COMPLIANCE FLAG (factual record): BrokerCheck shows 4 disclosure events including a 2005 dispute settled for $195,000 and a 2008 industry-wide auction-rate-securities dispute settled for $4.3M, plus a 2011 dispute ($68,255 claimed) and one further item — does not affect current active status.')), 512)
WHERE id = 1032;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1032, x.name, x.role FROM (
  SELECT 'Colin Day, CFP' AS name, 'Financial Advisor, Correct Capital Wealth Management' AS role
  UNION ALL SELECT 'Cherry Ohms', 'Financial Advisor, Correct Capital Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1032) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1032 AND name = x.name);

-- ===== GROUP 696: UBS Wealth Management, Portland, ME =====
-- 1033 Christopher Grennon (The Grennon Group)
UPDATE contacts SET
  address = 'One City Center, 10th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, leads "The Grennon Group" (~35+ yrs serving New England clients), UBS Portland MAINE (city/state confirmed correct — do not change to Oregon). Named to Forbes Best-in-State 2024-2026 and Forbes America''s Top Wealth Advisors 2026; Barron''s Top 1,500 2026. CRM phone (503) 276-5000 is a Portland, OREGON area code and does not belong to this Maine office — this is a confirmed data error; correct number (207) 791-5120.')), 512)
WHERE id = 1033;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1033, x.name, x.role FROM (
  SELECT 'Drew Grennon' AS name, 'Account Vice President-Wealth Management, Financial Advisor, The Grennon Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1033) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1033 AND name = x.name);

-- ===== GROUP 697: FSIS Group | Raymond James, Mountain Home, AR =====
-- 1034 Jackson Rhoades
UPDATE contacts SET
  address = '1216 Highway 62 East',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CEO, Registered Principal, MS CFP CDFA AEP CLU CAP, leads "Financial Services & Investment Strategies Group" (FSIS Group, Raymond James, with firm since Oct 2018), Mountain Home AR. Phone confirmed correct (870) 701-5160. COMPLIANCE FLAG (factual record, SIGNIFICANT): in Oct 2018 Rhoades and 11 colleagues resigned from Wells Fargo Advisors'' Mountain Home branch and moved to Raymond James, which Wells Fargo characterized as a "coordinated raid"; FINRA arbitration panel ruled Feb 2023 awarding Wells Fargo ~$20M total (Raymond James and Rhoades jointly/severally liable for $15.3M compensatory + $3.5M attorneys'' fees + $847K costs against Rhoades; $1M punitive against Raymond James separately). Raymond James/Rhoades petitioned federal court (D. Del., Case 1:23-cv-01262) to vacate; a June 2024 ruling reportedly vacated or substantially altered the award, but final disposition could not be independently confirmed. Recommend periodic re-check and manual court-record verification before any compliance-sensitive use.')), 512)
WHERE id = 1034;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1034, x.name, x.role FROM (
  SELECT 'Logan Stone, CFP, AIF' AS name, 'RJFS Registered Principal & Financial Advisor, FSIS Group' AS role
  UNION ALL SELECT 'Kim Pace, CFP, AEP, CDFA', 'RJFS Registered Principal & Financial Advisor, FSIS Group'
  UNION ALL SELECT 'Jeffrey Speight, CFP', 'RJFS Financial Advisor, FSIS Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1034) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1034 AND name = x.name);

-- ===== GROUP 698: Edward Jones, Minot, ND =====
-- 1035 Greg Tschetter
UPDATE contacts SET
  address = '1000 31st Avenue SW, Suite B',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, AAMS (with firm since 2007), Edward Jones Minot ND. Ranked #7 Forbes Best-in-State North Dakota 2025 (also 2022-2024); named to Barron''s Top 1,200 multiple years 2015-2024. CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (701) 838-5879.')), 512)
WHERE id = 1035;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1035, x.name, x.role FROM (
  SELECT 'Letta Nathan Sr.' AS name, 'Branch Office Administrator, Edward Jones (Minot ND)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1035) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1035 AND name = x.name);

-- ===== GROUP 699: Merrill Wealth Management, McAllen, TX =====
-- 1037 Alvaro Gonzalez (The Alvaro Gonzalez Group)
UPDATE contacts SET
  address = '200 S 10th St, Suite 1002',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, International Wealth Management Advisor, CIMA CPFA CRPC, founded "The Alvaro Gonzalez Group" (1985, offices McAllen and Dallas TX, international/multi-jurisdictional wealth focus, with firm since 1986), Merrill McAllen TX. Ranked #17 Forbes Best-in-State Texas-South 2025; team ranked #20 Texas-South, Forbes Best-in-State Wealth Management Teams 2025/2026 (also 2023). CRM phone (800) 637-7455 is Merrill''s generic toll-free line; direct office line (956) 618-8201. COMPLIANCE FLAG (factual record, not independently re-confirmed against live BrokerCheck): CRD 1462035 indexed as showing 5 disclosure events, all customer disputes — specific outcomes unconfirmed, recommend periodic re-check.')), 512)
WHERE id = 1037;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1037, x.name, x.role FROM (
  SELECT 'Aaron Gonzalez' AS name, 'First Vice President, International Wealth Advisor (son, joined 2015), The Alvaro Gonzalez Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1037) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1037 AND name = x.name);

-- ===== GROUP 700: Ameriprise Financial, Valhalla, NY =====
-- 1038 Robert Feighan (Feighan & Associates)
UPDATE contacts SET
  address = '100 Summit Lake Dr, Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP, leads "Feighan & Associates" (Ameriprise, multi-generation family practice, ~34 yrs experience), Valhalla NY. Named to Barron''s Top 1,500 2026; Forbes Best-in-State 2023-2025; team on Forbes Best-in-State Wealth Management Teams 2026; Ameriprise Circle of Success Hall of Fame 2007. CRM phone (800) 297-7378 is Ameriprise''s generic line; direct office line (914) 747-0200.')), 512)
WHERE id = 1038;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1038, x.name, x.role FROM (
  SELECT 'Gregory Feighan, CFP, CLU' AS name, 'Financial Advisor, Feighan & Associates' AS role
  UNION ALL SELECT 'Vaughn Feighan, APMA, CDFA, AWMA', 'Financial Advisor, Feighan & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1038) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1038 AND name = x.name);
