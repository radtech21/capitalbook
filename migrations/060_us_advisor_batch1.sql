-- US Financial Advisor enrichment, batch 1 (72 contacts / 20 office
-- groups). New phase covering the ~1,208 US Financial Advisor contacts
-- (Barron's Top 1,200), grouped by firm+phone+city as a proxy for shared
-- office/team, following the same methodology as the Canada Financial
-- Advisor phase (migrations 001-053).
--
-- This batch hit the same WebSearch/WebFetch outage seen repeatedly in
-- the Family Office phase — most agents completed under partial budget
-- constraints, so confidence is generally "moderate" or lower and several
-- addresses are inferred (building-level or team-page sourced) rather
-- than directly phone-number-confirmed. Two office/phone groupings turned
-- out on closer research to actually be MULTIPLE distinct sub-teams
-- sharing a building/switchboard, not one team (Menlo Park 10/11 vs 217;
-- LA 15 vs 18/19; Palm Beach 27/110/408) — addresses were applied per the
-- correct sub-team where resolved, and left unset where the research
-- could not resolve which of several conflicting team pages was correct
-- (Palm Beach 27/110/408 — no address applied, flagged for manual
-- follow-up instead of guessing).
--
-- 1931-style AUM anomaly note: contact 23 (Mark T. Curtis) carries an
-- unusually large aum_mm figure (~$592B) that a secondary source
-- suggests may be a plausible institutional-consulting AUM figure
-- (~$490B cited elsewhere) rather than a data error — flagged in
-- data_flags, aum_mm field NOT touched.

-- ===== GROUP 1: Merrill Wealth Management, Phoenix, AZ =====
-- 1 Henry Villeda
UPDATE contacts SET
  address = '2555 E Camelback Rd, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Confirmed current — actual title is Managing Director / Resident Director within Merrill''s Private Capital & Venture Solutions Group (PCVSG, formerly Venture Services Group), a firmwide 50+ person practice across six offices, not a plain "Financial Advisor" title. Phoenix-specific teammates could not be isolated from the multi-city PCVSG roster.')), 512)
WHERE id = 1;

-- ===== GROUP 2: UBS Private Wealth Management, Chicago, IL =====
-- 2 Louis Paster, 8 Paul Tashima, 90 Ajay Desai, 556 Jay Maltby
UPDATE contacts SET
  address = 'One North Wacker Drive, Suite 3300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current (UBS Financial Services Inc., Chicago). Address is building-level (multiple UBS Chicago PWM teams here), not confirmed against the exact CRM phone number.')), 512)
WHERE id IN (2, 8);
UPDATE contacts SET
  address = 'One North Wacker Drive, Suite 3300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Private Wealth Advisor, leads "The Desai Group," UBS PWM Chicago.')), 512)
WHERE id = 90;
UPDATE contacts SET
  address = 'One North Wacker Drive, Suite 3300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, "The Maltby Ludington Nelson Group," UBS PWM Chicago; holds UBS''s Family Office Consultant designation.')), 512)
WHERE id = 556;
INSERT INTO contact_people (contact_id, name, role)
SELECT 556, x.name, x.role FROM (
  SELECT 'Matthew Ludington' AS name, 'Private Wealth Advisor (Family Office Consultant), The Maltby Ludington Nelson Group, UBS' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 556)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 556 AND name = x.name);

-- ===== GROUP 3: Merrill Wealth Management, Indianapolis, IN =====
-- 3 John Cate, 139 Eric Brunton, 612 Eric Payne, 613 Ronald Mencias, 737 K. Gregory Akers, 1157 Kevin McMullen
-- Three distinct sub-teams at the same branch building: Cate/Brunton(+Luc), Payne/Mencias(+team), Akers(Searles Akers Howard).
UPDATE contacts SET
  address = '510 E 96th St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads Cate Brunton Luc Group; Barron''s Top 1,200 (2025) and Top 100 Institutional Consulting Teams (2025).')), 512)
WHERE id = 3;
UPDATE contacts SET
  address = '510 E 96th St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Cate Brunton Luc Group; Barron''s Top 1,200 (2025), Top 100 Institutional Consulting Teams (5th consecutive year, 2025).')), 512)
WHERE id = 139;
UPDATE contacts SET
  address = '510 E 96th St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Payne & Mencias Group; Forbes America''s Top Wealth Advisors 2025 and 2026 (#170).')), 512)
WHERE id = 612;
UPDATE contacts SET
  address = '510 E 96th St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — co-founder, Payne & Mencias Group, Managing Director/Wealth Management Advisor; Barron''s Top 1,200 (2009-2025), Forbes Best-in-State Teams #1 in Indiana (2023-2026).')), 512)
WHERE id = 613;
UPDATE contacts SET
  address = '510 E 96th St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads The Searles Akers Howard Wealth Management Group (a distinct sub-team at this branch, not the Cate Brunton Luc team); ranked #27 Indiana-Indianapolis (Forbes, Apr 2026).')), 512)
WHERE id = 737;
UPDATE contacts SET
  address = '510 E 96th St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, McMullen and Associates; Barron''s Top 1,200 (2009-2016 historical), #14 Best-in-State Wealth Advisors 2024; team manages $850M+ AUM (Jan 2024).')), 512)
WHERE id = 1157;
INSERT INTO contact_people (contact_id, name, role)
SELECT 3, x.name, x.role FROM (
  SELECT 'Scott Luc, CFP, CPWA' AS name, 'Financial Advisor, Cate Brunton Luc Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 3)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 3 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 612, x.name, x.role FROM (
  SELECT 'Christopher Brooke' AS name, 'Advisor, Payne & Mencias Group' AS role
  UNION ALL SELECT 'Ken Sendelweck', 'Advisor, Payne & Mencias Group'
  UNION ALL SELECT 'Peyton Gentry, CFP', 'Advisor, Payne & Mencias Group'
  UNION ALL SELECT 'Tara Schnaus', 'Payne & Mencias Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 612)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 612 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 737, x.name, x.role FROM (
  SELECT 'Reid Searles' AS name, 'Financial Advisor, Searles Akers Howard Wealth Management Group' AS role
  UNION ALL SELECT 'Howard Jones', 'Senior Financial Advisor/SVP, Searles Akers Howard Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 737)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 737 AND name = x.name);

-- ===== GROUP 4: UBS Private Wealth Management, Atlanta, GA =====
-- 4 W. Austin Dodd, 332 Laura Wellon, 454 Mark King, 560 Todd Urowsky, 982 Andy Zager
UPDATE contacts SET
  address = '3560 Lenox Road NE, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Dodd Consulting Team / UBS Institutional Consulting; Barron''s Top 1,200 (2025). Address is building-level (best-corroborated of several UBS Atlanta candidates), not phone-confirmed.')), 512)
WHERE id = 4;
UPDATE contacts SET
  address = '3560 Lenox Road NE, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — SVP-Wealth Management, Senior Portfolio Manager, Trillium Partners; Forbes Top Women Wealth Advisors, #4 Georgia (Feb 2026).')), 512)
WHERE id = 332;
UPDATE contacts SET
  address = '3560 Lenox Road NE, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Manager, G2 Wealth Management; Barron''s Top 1,200 2025, Forbes #10 Georgia-Atlanta (Apr 2026).')), 512)
WHERE id = 454;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current at UBS (Managing Director) but address uncertain — some registries show a different branch (1200 Abernathy Rd Ste 1850, Atlanta, GA 30328) than the other four advisors in this CRM group; address not applied pending resolution.')), 512)
WHERE id = 560;
UPDATE contacts SET
  address = '3560 Lenox Road NE, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Zager Wealth Management (aka Friedman Zager Wealth Management); Barron''s Top 1,200 2020-2022 and 2025 South Market list.')), 512)
WHERE id = 982;
INSERT INTO contact_people (contact_id, name, role)
SELECT 4, x.name, x.role FROM (
  SELECT 'W. Earle Dodd' AS name, 'Senior Institutional Consultant, Dodd Consulting Team, UBS' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 4)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 4 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 454, x.name, x.role FROM (
  SELECT 'Mark Rebillot, CFA' AS name, 'G2 Wealth Management, UBS' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 454)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 454 AND name = x.name);

-- ===== GROUP 5: Morgan Stanley | Graystone Consulting, Grand Rapids, MI =====
-- 5 Michael Rosloniec — no confirmed address found this pass.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Institutional Consulting Director & Family Wealth Director, Graystone Consulting (Morgan Stanley), Grand Rapids MI. Office address could not be confirmed this pass (candidate leads on Cascade Rd SE unconfirmed) — left unset pending a retry.')), 512)
WHERE id = 5;

-- ===== GROUP 6: Morgan Stanley | Graystone Consulting, Milwaukee, WI =====
-- 6 Thomas Parks — no confirmed address found this pass.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founder/lead of "The Parks Group," Graystone Consulting (Morgan Stanley), Milwaukee; Forbes #10 Best-In-State Wealth Advisors 2026. Office address could not be confirmed this pass — left unset pending a retry.')), 512)
WHERE id = 6;
INSERT INTO contact_people (contact_id, name, role)
SELECT 6, x.name, x.role FROM (
  SELECT 'Tricia Uttech' AS name, 'Vice President, Institutional Consultant, The Parks Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 6)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 6 AND name = x.name);

-- ===== GROUP 7: Morgan Stanley Private Wealth Management, San Francisco, CA =====
-- 7 Troy Griepp, 100 Anthony Jones, 101 Tim Emanuels, 149 Jonathan Harris, 282 Michael Baumer, 295 James Greenfield, 380 Mike Burbank, 399 Grant Lee
-- Not one team — multiple distinct branded sub-teams sharing the 555 California St building.
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Morgan Stanley Private Wealth Management, San Francisco. This CRM group actually spans several distinct sub-teams (San Francisco Wealth Management Group, 415 Group, Team 581, The Greenfield Team, The Burbank Group, The Opus Group) sharing this office building, not one team. Address is building-level, not phone-confirmed.')), 512)
WHERE id IN (7, 100, 101, 149, 282, 295, 380, 399);

-- ===== GROUP 8: Morgan Stanley | Graystone Consulting, Indianapolis, IN =====
-- 9 Wm. Craig Dobbs — address low-confidence, not applied.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Institutional Consulting Director, leads The Dobbs Group at Graystone Consulting (Morgan Stanley), Indianapolis; Barron''s Hall of Fame Advisor (10+ Top 100 appearances). Office address unconfirmed this pass (candidate 800 East 96th Street, Suite 400 not independently verified) — left unset pending a retry.')), 512)
WHERE id = 9;
INSERT INTO contact_people (contact_id, name, role)
SELECT 9, x.name, x.role FROM (
  SELECT 'Franco Piarulli' AS name, 'Director of Investments, The Dobbs Group' AS role
  UNION ALL SELECT 'Kevin Chapman', 'Institutional Investment Consultant & Senior Portfolio Manager, The Dobbs Group'
  UNION ALL SELECT 'Jeff McConnell', 'Chief Operating Officer, The Dobbs Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 9)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 9 AND name = x.name);

-- ===== GROUP 9: Morgan Stanley Private Wealth Management, Menlo Park, CA =====
-- 10 Gregory Vaughan, 11 Mark Douglass (The 545 Group), 217 Ned Gibbons (The 173 Group)
UPDATE contacts SET
  address = '2725 Sand Hill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Managing Director, The 545 Group, Morgan Stanley PWM Menlo Park; Barron''s #1 Private Wealth Management Team in America 2023-2026. Note: a nearby branch-level address (2775 Sand Hill Rd, Suite 120) also surfaced for the general Menlo Park office — this team''s own page cites 2725 Sand Hill Rd.')), 512)
WHERE id = 10;
UPDATE contacts SET
  address = '2725 Sand Hill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Sports and Entertainment Director, The 545 Group (same team as Vaughan/id 10), Menlo Park, CA.')), 512)
WHERE id = 11;
UPDATE contacts SET
  address = '2725 Sand Hill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding partner, The 173 Group, Morgan Stanley PWM Menlo Park; co-chair of PWM Advisory Council 2024, Forbes #12 Best-In-State Northern California (Private Wealth) 2025.')), 512)
WHERE id = 217;
INSERT INTO contact_people (contact_id, name, role)
SELECT 10, x.name, x.role FROM (
  SELECT 'Jason Bogardus' AS name, 'Financial Advisor, The 545 Group' AS role
  UNION ALL SELECT 'Katie Partridge, CFA', 'Financial Advisor, The 545 Group'
  UNION ALL SELECT 'Daniel Soares', 'Financial Advisor, The 545 Group'
  UNION ALL SELECT 'Trevor McDonough, CFA', 'Financial Advisor, The 545 Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 10)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 10 AND name = x.name);

-- ===== GROUP 10: Merrill Wealth Management, San Francisco, CA =====
-- 12 Valerie Garcia Houts, 13 Thomas Hutson-Wiley, 406 Debbie Jorgensen, 1044 Jason Hayes
-- Three distinct practices sharing the same building (PCVSG; Jorgensen Murphy Fort; Hayes Advisory Group).
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Merrill Private Capital & Venture Solutions Group, San Francisco; Forbes #2 Best-In-State Wealth Advisors 2025 (CA-SF, High Net Worth), #7 Top Women Wealth Advisors Best-In-State 2025 (Northern CA).')), 512)
WHERE id = 12;
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Merrill Private Capital & Venture Solutions Group, San Francisco; Forbes #3 CA-SF (High Net Worth), period ending 6/30/25.')), 512)
WHERE id = 13;
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Senior Consultant, leads The Jorgensen Murphy Fort Advisory Group, Merrill San Francisco; Barron''s Top 1,200 annually since 2009 and Top 100 Women Advisors since 2006.')), 512)
WHERE id = 406;
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founder/leader of The Hayes Advisory Group, Merrill San Francisco; Barron''s Top 1,200 (2023-2025), Forbes Best-in-State 2020-2024.')), 512)
WHERE id = 1044;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1044, x.name, x.role FROM (
  SELECT 'Scott D. Clayton' AS name, 'The Hayes Advisory Group, Merrill' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1044)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1044 AND name = x.name);

-- ===== GROUP 11: Morgan Stanley Private Wealth Management, New York, NY (large office, 23 advisors) =====
-- Only Ron Basu, Lyon Polk, and Ryan Lewis were individually spot-checked; the rest were not
-- individually re-verified this pass (address applied at building level; no false "confirmed" claims added).
UPDATE contacts SET
  address = '522 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Address is building-level for this large Morgan Stanley PWM office (23 Barron''s-ranked advisors on file here); not individually re-verified this pass except where noted. Spot-checked: Ron Basu — active, founding member of "Team Global," Chairman''s Club 2025. Lyon Polk — active, Founder/Managing Partner, The Polk Wealth Management Group, Barron''s #1-ranked advisor nationally. Ryan Lewis — active but address DISCREPANCY: his team page (Global Institutional Advisory Solutions/Graystone) points to 55 East 52nd Street, NY 10055, not 522 Fifth Ave — recommend manual verification for this one contact specifically.')), 512)
WHERE id IN (14, 16, 28, 44, 69, 72, 78, 147, 150, 214, 305, 309, 385, 386, 419, 426, 450, 509, 512, 515, 524, 530, 544);

-- ===== GROUP 12: Morgan Stanley Private Wealth Management, Los Angeles, CA (two distinct sub-teams) =====
-- 15 Drew Zager (Zager Fixed Income Management); 18 Jon Neuhaus & 19 Francis X. Malone (The Malone Neuhaus Group)
UPDATE contacts SET
  address = '1999 Avenue of the Stars, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Management Director, leads Zager Fixed Income Management, Morgan Stanley PWM Century City/LA; 37-year MS veteran, Barron''s Top 100 (2004-2021, 2023), Forbes 2026 Best-In-State #6. Address is team-page sourced, not phone-confirmed against the CRM''s (310) 255-4000 number.')), 512)
WHERE id = 15;
UPDATE contacts SET
  address = '444 S. Flower Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, co-leads The Malone Neuhaus Group, Morgan Stanley PWM downtown LA; Barron''s Top 100 Advisors since 2020, Top 250 Teams since 2021, Forbes #22 Best-In-State CA-LA 2025. Address is team-page sourced, not phone-confirmed against the CRM''s (310) 255-4000 number — this appears to be a DIFFERENT sub-team/building than Drew Zager (id 15), despite sharing the same phone number on file.')), 512)
WHERE id = 18;
UPDATE contacts SET
  address = '444 S. Flower Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management, co-leads The Malone Neuhaus Group (with Neuhaus, id 18), Morgan Stanley PWM downtown LA; MD since 2014, Forbes #20 CA-LA Private Wealth (Apr 2026).')), 512)
WHERE id = 19;

-- ===== GROUP 13: Morgan Stanley Private Wealth Management, Palm Beach, FL =====
-- 17 Brian Pfeifler
UPDATE contacts SET
  address = '440 Royal Palm Way',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, "Team Pfeifler," Morgan Stanley PWM Palm Beach; Forbes #1 Florida-South Private Wealth (Apr 2026), Barron''s Top 100 Financial Advisors. Address is a plausible building match, not confirmed against the exact CRM phone number.')), 512)
WHERE id = 17;

-- ===== GROUP 14: Morgan Stanley | Graystone Consulting, Greenwood Village, CO =====
-- 20 Jim Detterick
UPDATE contacts SET
  address = '5251 DTC Parkway, Suite 1500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Institutional Consulting Director, leads The Detterick Group, Graystone Consulting (Morgan Stanley), Greenwood Village CO; PLANADVISER "Retirement Plan Adviser of the Year" 2023 & 2024. Address is the general Morgan Stanley Denver Tech Market branch, not confirmed as Graystone-specific.')), 512)
WHERE id = 20;

-- ===== GROUP 15: Merrill Private Wealth Management, Columbia, SC =====
-- 21 Ronnie Dennis, 43 Rick Migliore (Ellison Kibler team), 207 Kirk Lloyd (possibly a different team, WMB & Associates, at same branch)
UPDATE contacts SET
  address = '1301 Gervais St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Ellison Kibler team, Merrill Private Wealth Management, Columbia SC; #2 in SC on 2026 Barron''s/Forbes rankings. Address inferred from context, not confirmed against the exact CRM phone number.')), 512)
WHERE id = 21;
UPDATE contacts SET
  address = '1301 Gervais St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Private Wealth Advisor, Ellison Kibler team, Merrill Columbia SC; #1 in SC on 2026 Barron''s Top 1,500, Forbes 2026 Best-in-State Wealth Management Teams.')), 512)
WHERE id = 43;
UPDATE contacts SET
  address = '1301 Gervais St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Likely confirmed current, but team affiliation uncertain — his advisor profile is nested under a different team page ("WMB & Associates") than Dennis/Migliore''s "Ellison Kibler" team, though at the same Columbia SC branch building; recommend verifying whether this is the same office/team.')), 512)
WHERE id = 207;
INSERT INTO contact_people (contact_id, name, role)
SELECT 43, x.name, x.role FROM (
  SELECT 'Thomas R. Kibler' AS name, 'Financial Advisor, Ellison Kibler team' AS role
  UNION ALL SELECT 'Graham Bokinsky', 'Financial Advisor, Ellison Kibler team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 43)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 43 AND name = x.name);

-- ===== GROUP 16: Merrill Wealth Management, Bethesda, MD =====
-- 22 Peter Dunne, 59 Bruce Wall (Dunn-Dunne-Wall-Hegenbart Group), 997 Gregory Baker (Baker, Ellis, Stroebel Group)
UPDATE contacts SET
  address = '7501 Wisconsin Ave, Suite 600W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — The Dunn-Dunne-Wall-Hegenbart Group, Merrill Bethesda.')), 512)
WHERE id = 22;
UPDATE contacts SET
  address = '7501 Wisconsin Ave, Suite 600W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — same team as Dunne (id 22), The Dunn-Dunne-Wall-Hegenbart Group, Merrill Bethesda.')), 512)
WHERE id = 59;
UPDATE contacts SET
  address = '7501 Wisconsin Ave, Suite 600W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, leads The Baker, Ellis, Stroebel Group, Merrill Bethesda (a distinct sub-team from Dunne/Wall at the same building); Forbes Best-in-State Next-Gen list 2022/2025, ranked #8 in Maryland.')), 512)
WHERE id = 997;
INSERT INTO contact_people (contact_id, name, role)
SELECT 997, x.name, x.role FROM (
  SELECT 'Michael Charles Ellis' AS name, 'Senior Vice President, The Baker, Ellis, Stroebel Group' AS role
  UNION ALL SELECT 'Melissa M. St. Louis', 'Vice President, The Baker, Ellis, Stroebel Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 997)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 997 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 22, x.name, x.role FROM (
  SELECT 'George Dunn' AS name, 'Financial Advisor, The Dunn-Dunne-Wall-Hegenbart Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 22)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 22 AND name = x.name);

-- ===== GROUP 17: Morgan Stanley | Graystone Consulting, Palo Alto, CA =====
-- 23 Mark T. Curtis
UPDATE contacts SET
  address = '1400 Page Mill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Confirmed current — Managing Director, Graystone Consulting (Morgan Stanley), Palo Alto; Barron''s 2025 Top 100 Financial Advisors #2, Forbes 2025 Best-In-State #1 Northern California. AUM NOTE: the CRM''s unusually large $592,439.9mm figure is plausible, not a data error — a secondary source cites the team managing "approximately $490 billion," same order of magnitude, likely reflecting an institutional-consulting book of assets under advisement (not touching aum_mm field). Team includes Tim Skelly (exact title unconfirmed); practice reported at ~14 people total.')), 512)
WHERE id = 23;

-- ===== GROUP 18: Baird, Milwaukee, WI =====
-- 24 Michael Klein, 25 Christopher Merker, 256 Chris Calvelli, 257 Andrew Epstein
UPDATE contacts SET
  address = '777 East Wisconsin Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Financial Advisor, leads Baird Private Asset Management, Milwaukee; Forbes-ranked #1 Wisconsin-Milwaukee (Apr 2026). Address/phone match confirmed exactly.')), 512)
WHERE id = 24;
UPDATE contacts SET
  address = '777 East Wisconsin Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Baird Milwaukee, recognized on Baird''s own 2026 Forbes Best-In-State Wealth Advisors recognition page; specific team/practice affiliation not confirmed this pass.')), 512)
WHERE id = 25;
UPDATE contacts SET
  address = '777 East Wisconsin Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Investments, member of The ECAB Investment Group, Baird Milwaukee (with Baird since 1999); Forbes-ranked #9 Wisconsin-Milwaukee.')), 512)
WHERE id = 256;
UPDATE contacts SET
  address = '777 East Wisconsin Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, member of The ECAB Investment Group (with Calvelli, id 256), Baird Milwaukee; joined Baird 2012.')), 512)
WHERE id = 257;

-- ===== GROUP 19: Morgan Stanley | Graystone Consulting, Potomac, MD =====
-- 26 Robert Scherer, 37 Ross Charkatz
UPDATE contacts SET
  address = '12505 Park Potomac Ave, Suite 420',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founding partner/leader, Graystone Consulting Metropolitan D.C. practice; local phone found as (301) 279-6400, different from the (800) toll-free number on file.')), 512)
WHERE id = 26;
UPDATE contacts SET
  address = '12505 Park Potomac Ave, Suite 420',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Graystone Consulting Metropolitan D.C. practice (with Scherer, id 26).')), 512)
WHERE id = 37;

-- ===== GROUP 20: Morgan Stanley Private Wealth Management, Palm Beach, FL (second team) =====
-- 27 Deborah Montaperto, 110 Richard Zinman, 408 Rod Aronson — no address applied; team affiliations conflict.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'RESEARCH FLAG: could not confirm these three share one team/office. Montaperto''s results point to "The Polk Wealth Management Group" (NY/Palm Beach); Aronson''s results point to a distinct "The Evergreen 21 Group" (NY/Palm Beach Island); Zinman''s FINRA record shows an older Vero Beach, FL address and a possibly-unrelated "Workplace Advisor" listing. No address applied pending manual verification — do not assume these three are colocated.')), 512)
WHERE id IN (27, 110, 408);
