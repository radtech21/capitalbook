-- US Financial Advisor enrichment, batch 2 (77 contacts / 20 office groups).
--
-- Notable firm-change correction: 45 Kevin Higginbotham and 111 James
-- Kaufman left Merrill entirely in Sept 2025 along with Merrill's whole
-- Global Corporate & Institutional Advisory Services (GCIAS) unit
-- (~90 advisors, ~$129B AUM per Barron's) to co-found an independent RIA,
-- OpenArc Corporate Advisory — a Merrill breakaway significant enough to
-- draw trade-press coverage and litigation. Firm/title/address updated;
-- existing @ml.com emails are now stale (not touched, flagged instead).
--
-- Same tooling-outage pattern as batch 1 — most agents worked under
-- partial WebSearch budget, several found conflicting/unconfirmed
-- addresses across sources, and a few CRM "office groups" turned out to
-- span multiple physical buildings sharing a general-purpose switchboard
-- number (NY groups especially). Addresses withheld (not applied) where
-- the conflict could not be resolved this pass, rather than guessing.

-- ===== GROUP 21: Merrill Private Wealth Management, New York, NY — spans two buildings =====
-- 29 Noel Weil, 151 David Magrone, 152 Alyssa Moeder, 153 Richard Salvino, 167 Leigh Cohen: One Bryant Park, Fl 28
UPDATE contacts SET
  address = 'One Bryant Park, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner/Managing Director, The Weil Group, Merrill Private Wealth Management, NYC; Barron''s Top 100 Advisors 2025 (14th consecutive year).')), 512)
WHERE id = 29;
UPDATE contacts SET
  address = 'One Bryant Park, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Founder/Leader, The Magrone Group, Merrill Private Wealth Management, NYC; Forbes 2026 Best-In-State NY #34.')), 512)
WHERE id = 151;
UPDATE contacts SET
  address = 'One Bryant Park, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, CFP, principal of Moeder Salvino & Associates, Merrill Private Wealth Management, NYC; Forbes 2024 Top Women Advisors #96.')), 512)
WHERE id = 152;
UPDATE contacts SET
  address = 'One Bryant Park, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Moeder Salvino & Associates (with Moeder, id 152), Merrill Private Wealth Management, NYC.')), 512)
WHERE id = 153;
UPDATE contacts SET
  address = 'One Bryant Park, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Founder, team now branded "Cohen, Green, Allen & Associates" (formerly Cohen & Associates), Merrill Private Wealth Management, NYC; Barron''s Top 100 2016-2024.')), 512)
WHERE id = 167;
-- 31 Courtney Moore, 75 Andrew P. Kraus, 76 Robert McGinty: 225 Liberty St (Brookfield Place)
UPDATE contacts SET
  address = '225 Liberty St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor & Global Institutional Consultant, The Ryan Group, Merrill Private Wealth Management, NYC; Forbes 2025 Best-In-State NY #74.')), 512)
WHERE id = 31;
UPDATE contacts SET
  address = '225 Liberty St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Executive Services (PES) Team (helped form 1993), Merrill Private Wealth Management, NYC; 32 years at Merrill.')), 512)
WHERE id = 75;
UPDATE contacts SET
  address = '225 Liberty St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Executive Services (PES) Team (with Kraus, id 75), Merrill Private Wealth Management, NYC; Barron''s Top 100 PWM Teams (2020-2022).')), 512)
WHERE id = 76;
-- 409 Robert Dyer: NYC team, personally based Greenwich CT — address not applied, uncertain suite.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads The Dyer Team, Merrill Private Wealth Management NYC (personally based Greenwich, CT); Forbes 2023-2024 NYC #27. Office street address unconfirmed this pass.')), 512)
WHERE id = 409;
INSERT INTO contact_people (contact_id, name, role)
SELECT 31, x.name, x.role FROM (
  SELECT 'James Ryan' AS name, 'Senior Partner, The Ryan Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 31)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 31 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 167, x.name, x.role FROM (
  SELECT 'Daniel Green, CFP' AS name, 'Co-lead, Cohen, Green, Allen & Associates' AS role
  UNION ALL SELECT 'Sean Allen, CFP', 'Co-lead, Cohen, Green, Allen & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 167)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 167 AND name = x.name);

-- ===== GROUP 22: Merrill Private Wealth Management, San Francisco, CA =====
-- 30 Michael Breen (matches CRM phone); 71 John Cardente, 678 Tony daRoza (different teams/lines, address unconfirmed)
UPDATE contacts SET
  address = '555 California Street, Suite 1800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founder/leader of the Arbogast Breen Giles Olmo Group, Merrill Private Wealth Management, San Francisco; #14 nationally on 2025 Barron''s Top 100 Financial Advisors.')), 512)
WHERE id = 30;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founder of "Team Cardente," Merrill Private Wealth Management, San Francisco (with co-members in Seattle/Portland); Forbes/Barron''s Best-In-State CA 2025. Appears to be a different team/suite than the CRM phone number''s match (id 30) despite same city — address not applied pending confirmation.')), 512)
WHERE id = 71;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads the daRoza Group / daRoza Waitrovich & Associates, Merrill Private Wealth Management, San Francisco; Barron''s Top 1,200 (2018, 2024). Appears to be a different team/suite than the CRM phone number''s match (id 30) despite same city — address not applied pending confirmation.')), 512)
WHERE id = 678;
INSERT INTO contact_people (contact_id, name, role)
SELECT 30, x.name, x.role FROM (
  SELECT 'Peter Arbogast' AS name, 'Managing Director, Private Wealth Advisor, Arbogast Breen Giles Olmo Group' AS role
  UNION ALL SELECT 'Hilary Giles', 'Managing Director, Private Wealth Advisor (co-founder), Arbogast Breen Giles Olmo Group'
  UNION ALL SELECT 'Brian Olmo', 'Managing Director, Private Wealth Advisor, Arbogast Breen Giles Olmo Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 30)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 30 AND name = x.name);

-- ===== GROUP 23: Morgan Stanley Private Wealth Management, Dallas, TX — two distinct teams/addresses =====
-- 32 Charles McKinney
UPDATE contacts SET
  address = '2121 North Pearl Street, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads the McKinney|Kelton|Godat|Pechenik team, Morgan Stanley PWM, Dallas; Forbes Best-In-State Texas-Dallas #6 (Apr 2025).')), 512)
WHERE id = 32;
-- 531 Kevin Dickey
UPDATE contacts SET
  address = '5001 Spring Valley Rd, Suite 900W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-founder of the Dickey Wright Sweeney Apple Group, Morgan Stanley PWM, Dallas (a distinct team/address from McKinney, id 32, despite the shared CRM phone number); Barron''s Top 1,200 (2010-2023).')), 512)
WHERE id = 531;
INSERT INTO contact_people (contact_id, name, role)
SELECT 32, x.name, x.role FROM (
  SELECT 'David Kelton, CFA' AS name, 'McKinney|Kelton|Godat|Pechenik team, Morgan Stanley PWM' AS role
  UNION ALL SELECT 'Hayden Godat, CFP', 'McKinney|Kelton|Godat|Pechenik team, Morgan Stanley PWM'
  UNION ALL SELECT 'Barry Pechenik', 'McKinney|Kelton|Godat|Pechenik team, Morgan Stanley PWM'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 32)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 32 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 531, x.name, x.role FROM (
  SELECT 'Larry K. Wright' AS name, 'Senior Vice President, co-founder, Dickey Wright Sweeney Apple Group' AS role
  UNION ALL SELECT 'Ben Sweeney', 'Senior Vice President, partner, Dickey Wright Sweeney Apple Group'
  UNION ALL SELECT 'Michael Apple', 'Senior Vice President, Private Wealth Advisor, partner, Dickey Wright Sweeney Apple Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 531)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 531 AND name = x.name);

-- ===== GROUP 24: Merrill Private Wealth Management, Los Angeles, CA =====
-- 33 Richard Jones (Jones Zafari Group)
UPDATE contacts SET
  address = '2049 Century Park East, Floor/Suite 11',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Co-Founder of the Jones Zafari Group, Merrill Private Wealth Management, Century City; Forbes 2026 Best-In-State #17. Address/phone corroborated across multiple independent aggregators.')), 512)
WHERE id = 33;
INSERT INTO contact_people (contact_id, name, role)
SELECT 33, x.name, x.role FROM (
  SELECT 'Derek Jancisin' AS name, 'Private Wealth Advisor, Managing Director, Jones Zafari Group' AS role
  UNION ALL SELECT 'Paul McCauley', 'Private Wealth Advisor, Managing Director, Jones Zafari Group'
  UNION ALL SELECT 'Garrett Burke', 'Private Wealth Advisor, Managing Director, Jones Zafari Group'
  UNION ALL SELECT 'Alberto Cosio', 'Private Wealth Advisor, Managing Director, Jones Zafari Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 33)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 33 AND name = x.name);

-- ===== GROUP 25: Treasury Partners, New York, NY =====
-- 34 Richard Saperstein
UPDATE contacts SET
  title = 'Founder, Chief Investment Officer, Managing Director/Principal',
  address = '505 Fifth Avenue, 14th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — ranked #5 on Barron''s 2026 Top 100 Financial Advisors (23rd consecutive year on the list). CRM phone (212) 755-2200 could not be corroborated — firm''s current listed main line is (917) 286-2770; recommend double-checking.')), 512)
WHERE id = 34;
INSERT INTO contact_people (contact_id, name, role)
SELECT 34, x.name, x.role FROM (
  SELECT 'Jerry Klein' AS name, 'Managing Director & Partner, Head of Corporate Cash Management Group, Treasury Partners' AS role
  UNION ALL SELECT 'David Zoll', 'Managing Director & Partner, Treasury Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 34)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 34 AND name = x.name);

-- ===== GROUP 26: Morgan Stanley Wealth Management, New York, NY — three separate practices, address unresolved =====
-- 35 Nicholas Kavallieratos, 676 David Beyer, 791 John Vessa
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor & Executive Financial Services Director; Forbes 2025 Best-In-State #5. Office address unresolved this pass — sources conflict between 522 Fifth Avenue and 55 East 52nd Street for this phone number; not applied pending confirmation.')), 512)
WHERE id = 35;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founding partner of The Beyer Stein Halper Group, Morgan Stanley; Barron''s Top 1,200 annually since 2014. Office address unresolved this pass (same conflict as id 35) — not applied.')), 512)
WHERE id = 676;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founding partner of The Harbor Group, Morgan Stanley; Family Wealth Director, 2024 Chairman''s Club. Office address unresolved this pass (same conflict as id 35) — not applied. These three CRM contacts appear to be three separate practices, not one team.')), 512)
WHERE id = 791;

-- ===== GROUP 27: Morgan Stanley | Graystone Consulting, Boston, MA =====
-- 36 Peter Princi
UPDATE contacts SET
  address = '28 State Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founder of The Princi Group, Graystone Consulting (Morgan Stanley), Boston; Barron''s Top 250 Private Wealth Mgmt Teams #42 2025, Forbes Best-in-State MA #3 2025.')), 512)
WHERE id = 36;
INSERT INTO contact_people (contact_id, name, role)
SELECT 36, x.name, x.role FROM (
  SELECT 'Steven C. Gaziano' AS name, 'Senior Vice President, Institutional Consulting Director, The Princi Group' AS role
  UNION ALL SELECT 'Edward T. Moore Jr.', 'Senior Vice President, Institutional Consultant, Senior Portfolio Manager, The Princi Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 36)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 36 AND name = x.name);

-- ===== GROUP 28: William Blair, Atlanta, GA =====
-- 38 Craig Savage
UPDATE contacts SET
  address = 'One Buckhead Plaza, 3060 Peachtree Road NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner/Wealth Advisor, William Blair Private Wealth Management, Atlanta (team now branded "Impact Wealth Advisors," formerly "Savage Wealth Advisors"); Barron''s Top 100 Financial Advisors 2025.')), 512)
WHERE id = 38;
INSERT INTO contact_people (contact_id, name, role)
SELECT 38, x.name, x.role FROM (
  SELECT 'Joel Dobbs' AS name, 'Partner, Wealth Advisor, Impact Wealth Advisors' AS role
  UNION ALL SELECT 'Kim Tyson Chenevey', 'Partner, Wealth Advisor, Impact Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 38)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 38 AND name = x.name);

-- ===== GROUP 29: William Blair, Chicago, IL (HQ office, 13 advisors on file) =====
UPDATE contacts SET
  address = '150 North Riverside Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — William Blair Private Wealth Management, Chicago HQ. Spot-checked: Cam McKinney (Partner, co-leads GreenBridge team), John Cimaroli (Partner, co-leads GreenBridge team), Thomas Wilson (Partner, "1935 Wealth Management" team) — all active. Remaining names on file at this address were not individually re-verified this pass.')), 512)
WHERE id IN (39, 40, 133, 182, 431, 435, 723, 753, 809, 815, 817, 965, 992);

-- ===== GROUP 30: Morgan Stanley | Graystone Consulting, Charleston, WV =====
-- 41 John Dawson
UPDATE contacts SET
  address = '500 Lee Street East, Laidley Tower, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founding partner and Institutional Consultant, Graystone Consulting Charleston WV (Morgan Stanley); full name John E. Dawson II; Barron''s Top 1,200 2020-2022, 2025; Forbes Best-In-State #5 WV 2025.')), 512)
WHERE id = 41;
INSERT INTO contact_people (contact_id, name, role)
SELECT 41, x.name, x.role FROM (
  SELECT 'Kelly L. Castleberry III, CIMA' AS name, 'Managing Director, Founding Partner, Graystone Consulting Charleston' AS role
  UNION ALL SELECT 'James Michael Goodwin', 'Managing Director, Founding Partner, COO/Investment Committee Chair, Graystone Consulting Charleston'
  UNION ALL SELECT 'Michael D. Hill', 'Senior Vice President, Institutional Consultant, Graystone Consulting Charleston'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 41)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 41 AND name = x.name);

-- ===== GROUP 31: Morgan Stanley | Graystone Consulting, Atlanta, GA =====
-- 42 Andrew Harbour
UPDATE contacts SET
  address = '3280 Peachtree Rd NE, Suite 1900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, co-founder of Graystone Consulting Atlanta / The Peachtree Group (Morgan Stanley); Barron''s Top 100 Financial Advisors 2022-2025, Forbes Top 250 Wealth Advisors 2025.')), 512)
WHERE id = 42;
INSERT INTO contact_people (contact_id, name, role)
SELECT 42, x.name, x.role FROM (
  SELECT 'Scott E. Novellas, CFP' AS name, 'Senior Vice President, Investment Management Consultant, Financial Advisor, The Peachtree Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 42)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 42 AND name = x.name);

-- ===== GROUP 32: FIRM CHANGE — 45 Kevin Higginbotham & 111 James Kaufman left Merrill for OpenArc Corporate Advisory =====
UPDATE contacts SET
  firm = 'OpenArc Corporate Advisory',
  title = 'Managing Partner, Senior Wealth Management Advisor',
  address = '3550 Peachtree Rd NE, Floor 7',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: no longer at Merrill — in Sept 2025 resigned along with Merrill''s entire Global Corporate & Institutional Advisory Services (GCIAS) unit (~90 advisors) to co-found independent RIA OpenArc Corporate Advisory. Barron''s-reported team AUM ~$129B (12/31/2024), materially different from and more current than the CRM''s stale $168,309.7mm Merrill-affiliated figure (not touching aum_mm field). Existing @ml.com email is now stale.')), 512)
WHERE id = 45;
UPDATE contacts SET
  firm = 'OpenArc Corporate Advisory',
  title = 'Managing Partner',
  address = '3550 Peachtree Rd NE, Floor 7',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: no longer at Merrill — same Sept 2025 GCIAS breakaway as Higginbotham (id 45), co-founded OpenArc Corporate Advisory. Existing @ml.com email is now stale.')), 512)
WHERE id = 111;
INSERT INTO contact_people (contact_id, name, role)
SELECT 45, x.name, x.role FROM (
  SELECT 'Emily Fletcher' AS name, 'Managing Partner, OpenArc Corporate Advisory' AS role
  UNION ALL SELECT 'Erik Bjerke', 'Managing Partner, OpenArc Corporate Advisory'
  UNION ALL SELECT 'Jeffrey Crowell', 'Managing Partner, OpenArc Corporate Advisory'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 45)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 45 AND name = x.name);

-- ===== GROUP 33: Merrill Private Wealth Management, Los Angeles, CA (Jones Zafari Group, same team as id 33) =====
-- 46 Reza Zafari
UPDATE contacts SET
  address = '2049 Century Park East',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Co-Founder of the Jones Zafari Group (with Richard Jones, id 33), Merrill Private Wealth Management, Century City; Forbes #2 California-Los Angeles (Private Wealth), Apr 2026.')), 512)
WHERE id = 46;

-- ===== GROUP 34: Morgan Stanley | Graystone Consulting, New York, NY =====
-- 47 John Longo
UPDATE contacts SET
  address = '522 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Institutional Consulting Director, leads Graystone Consulting - The Longo Group, Morgan Stanley, NYC; 30+ years with the firm. Address moderate confidence (one lower-confidence source suggested 55 East 52nd Street instead).')), 512)
WHERE id = 47;
INSERT INTO contact_people (contact_id, name, role)
SELECT 47, x.name, x.role FROM (
  SELECT 'Linda J. Rhodes, CFP, CIMA' AS name, 'Senior VP, Financial Advisor & Director, The Longo Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 47)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 47 AND name = x.name);

-- ===== GROUP 35: UBS Private Wealth Management, Charlotte, NC =====
-- 48 Greg Cash, 49 Mitchell Wickham (Wickham Cash Partners)
UPDATE contacts SET
  address = '6100 Fairview Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, co-founder of Wickham Cash Partners, UBS Charlotte; Barron''s Top 250 Private Wealth Management Teams 2024/2025/2026.')), 512)
WHERE id = 48;
UPDATE contacts SET
  address = '6100 Fairview Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, team lead/co-founder of Wickham Cash Partners (with Cash, id 48), UBS Charlotte; ~21-person team, ~$16.7B AUM.')), 512)
WHERE id = 49;
INSERT INTO contact_people (contact_id, name, role)
SELECT 49, x.name, x.role FROM (
  SELECT 'Trevor Hoke' AS name, 'Private Wealth Advisor, Wickham Cash Partners' AS role
  UNION ALL SELECT 'Ronald E. Bryson', 'Private Wealth Advisor, Wickham Cash Partners'
  UNION ALL SELECT 'John North Moore', 'Private Wealth Advisor & Portfolio Manager, Wickham Cash Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 49)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 49 AND name = x.name);

-- ===== GROUP 36: Merrill Private Wealth Management, Greenwich, CT =====
-- 50 Jeff Erdmann, 77 Rob Giannetti (The Erdmann Group)
UPDATE contacts SET
  address = '2 Pickwick Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Founding Partner, The Erdmann Group, Merrill Private Wealth Management, Greenwich; #1 Forbes 2026 Best-In-State Wealth Advisors; team $19.8B AUM (Dec 2025).')), 512)
WHERE id = 50;
UPDATE contacts SET
  address = '2 Pickwick Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, The Erdmann Group (with Erdmann, id 50), Merrill Private Wealth Management, Greenwich.')), 512)
WHERE id = 77;
INSERT INTO contact_people (contact_id, name, role)
SELECT 50, x.name, x.role FROM (
  SELECT 'Mark Brookfield, CFP' AS name, 'Managing Director, Private Wealth Advisor, The Erdmann Group' AS role
  UNION ALL SELECT 'Anthony Carpentieri', 'Managing Director, Private Wealth Advisor, The Erdmann Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 50)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 50 AND name = x.name);

-- ===== GROUP 37: Morgan Stanley Private Wealth Management, Denver, CO =====
-- 51 Shawn Fowler, 52 Maxwell Bull (The Fowler Bull Group)
UPDATE contacts SET
  address = '1550 Market St, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, co-lead of The Fowler Bull Group, Morgan Stanley PWM Denver; joined MS 2001.')), 512)
WHERE id = 51;
UPDATE contacts SET
  address = '1550 Market St, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director (promoted 2020), co-lead of The Fowler Bull Group (with Fowler, id 51), Morgan Stanley PWM Denver.')), 512)
WHERE id = 52;

-- ===== GROUP 38: Cresset, Reston, VA =====
-- 53 David Karp
UPDATE contacts SET
  address = '1900 Reston Metro Plaza, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Confirmed current — Co-Founder and Senior Managing Director at Cresset, based in Reston VA (the CRM''s 312 phone reflects Cresset''s Chicago HQ switchboard, not his actual office). 2026 Forbes Best-in-State #1 Virginia. Formerly co-founded PagnatoKarp (with Paul Pagnato); Cresset acquired that firm in 2020/2021.')), 512)
WHERE id = 53;

-- ===== GROUP 39: CIBC Private Wealth, Atlanta, GA =====
-- 54 Scott Thompson
UPDATE contacts SET
  title = 'Managing Director & President, CIBC Family Office; Southeast Regional Team Executive',
  address = '3290 Northside Parkway NW, 7th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current, full name W. Scott Thompson III, CTFA — title has evolved from a line advisor role to Managing Director & President of CIBC Family Office, also overseeing the Southeast region (Atlanta, TX, FL offices).')), 512)
WHERE id = 54;

-- ===== GROUP 40: Freestone Capital Management, Seattle, WA =====
-- 55 Erik Morgan
UPDATE contacts SET
  address = '701 Fifth Avenue, Suite 7400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/Senior Partner/Managing Partner & Client Advisor, Freestone Capital Management, Seattle; ranked #6 nationally on Barron''s Top 100 Independent Advisors 2025.')), 512)
WHERE id = 55;
