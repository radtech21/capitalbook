-- US Financial Advisor enrichment, batch 5 (~46 contacts / 18 groups).
--
-- This batch opened with a total tooling outage (WebSearch budget was
-- already 0/200 before any agent could run) and was fully retried after
-- confirming the budget had refreshed — no unverified/recalled data was
-- applied from the failed pass.
--
-- Key cross-check resolved: contacts 124/317/353/437 (Kelly Westmoreland,
-- Jay Jowers, Buck Wiley III, Bert Ponder) share the exact CRM phone
-- number (404) 607-4600 with the confirmed OpenArc Corporate Advisory
-- breakaway (contacts 45/111, migration 061) — this pass confirmed all
-- four remain at Merrill, unconnected to the breakaway or its lawsuit;
-- the shared phone number is most likely a legacy front-desk/reception
-- line for the Merrill Atlanta Private Wealth building.
--
-- One firm-change correction: 939 Andrew Plum departed UBS (Sept 19,
-- 2025) to co-found Loxahatchee Capital, backed by Elevation Point —
-- UBS subsequently sued the departing team for breach of non-solicit.
--
-- Two Alabama-firm contacts (120/121) were filed under out-of-state area
-- codes ((501) Arkansas, (480) Arizona) — corrected to the firm's actual
-- Birmingham, AL number/address this pass.

-- ===== GROUP 81: Morgan Stanley Private Wealth Management, Coral Gables, FL =====
-- 119 Adam Carlin (Carlin Wealth Management at Morgan Stanley)
UPDATE contacts SET
  address = '220 Alhambra Circle, 10th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, leads Carlin Wealth Management, Morgan Stanley Coral Gables; ~$7.2-7.85B team AUM, Barron''s Top 100 Private Wealth Teams since 2019.')), 512)
WHERE id = 119;
INSERT INTO contact_people (contact_id, name, role)
SELECT 119, x.name, x.role FROM (
  SELECT 'Jason Goldstrich' AS name, 'Managing Director, Senior Portfolio Management Director, Carlin Wealth Management' AS role
  UNION ALL SELECT 'Charles Schifano', 'Portfolio Manager / Investment Consultant, Carlin Wealth Management'
  UNION ALL SELECT 'Luisa Arias Baker', 'Director of Wealth Planning, Carlin Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 119) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 119 AND name = x.name);

-- ===== GROUPS 82-83: Stonegate Investment Group, Birmingham, AL =====
-- 120 Tony Smith, 121 Christopher Compton — both had out-of-state (data-error) area codes on file.
UPDATE contacts SET
  title = 'CEO, Managing Partner & Chief Investment Officer',
  address = '2005 Stonegate Trail, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (501) 221-5101 is an Arkansas area code — a data error; correct number is (205) 963-0840. Founded Stonegate in 2021 after leaving UBS. Firm is now affiliated with NewEdge Advisors (2024-2025) but continues operating under the Stonegate brand at this address.')), 512)
WHERE id = 120;
UPDATE contacts SET
  title = 'Partner',
  address = '2005 Stonegate Trail, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (480) 624-5714 is an Arizona area code — a data error; correct number is (205) 963-0840. Confirmed current — Partner, sits on the Investment Committee with Tony Smith (id 120), joint firm owner since July 2021.')), 512)
WHERE id = 121;
INSERT INTO contact_people (contact_id, name, role)
SELECT 120, x.name, x.role FROM (
  SELECT 'Matthew C. Brown' AS name, 'Partner, Managing Director, Investment Committee, Stonegate Investment Group' AS role
  UNION ALL SELECT 'James W. Allen', 'Partner, Chief Wealth Strategist, Stonegate Investment Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 120) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 120 AND name = x.name);

-- ===== GROUP 84: Morgan Stanley Private Wealth Management, Tuscaloosa, AL =====
-- 122 Michael Warr (The Warr Group) — CRM phone was also an out-of-state (AR) area code.
UPDATE contacts SET
  address = '1470 Northbank Pkwy, Suite 280',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (501) 975-7968 is an Arkansas area code — a data error; correct number is (205) 344-8443. Confirmed current — Managing Director, Financial Advisor, Resident Manager, founder/leader of The Warr Group, Morgan Stanley Tuscaloosa; #1 Financial Advisor in Alabama (Barron''s/Forbes), Chairman''s Club member.')), 512)
WHERE id = 122;
INSERT INTO contact_people (contact_id, name, role)
SELECT 122, x.name, x.role FROM (
  SELECT 'Katie Hancock, CIMA' AS name, 'Financial Advisor / Executive Director, The Warr Group' AS role
  UNION ALL SELECT 'Stacie Kirkland', 'Vice President, Financial Advisor, Alternative Investments Director, The Warr Group'
  UNION ALL SELECT 'Jacob Nannen', 'Financial Advisor, Financial Planning Specialist, The Warr Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 122) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 122 AND name = x.name);

-- ===== GROUPS 85-86: Merrill Private Wealth Management, Atlanta, GA — confirmed NOT part of OpenArc breakaway =====
-- 123 Rod Westmoreland, 124 Kelly Westmoreland, 317 Jay Jowers, 353 Buck Wiley III, 437 Bert Ponder
UPDATE contacts SET
  address = '3455 Peachtree Rd NE',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Confirmed still at Merrill (not part of the OpenArc Corporate Advisory breakaway, despite sharing a phone number with departed contacts 45/111 — see migration 061). Managing Director, Private Wealth Advisor, leads The Westmoreland Group, Merrill Atlanta.')), 512)
WHERE id = 123;
UPDATE contacts SET
  address = '3455 Peachtree Rd NE',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CROSS-CHECK RESOLVED: shares the exact CRM phone (404) 607-4600 with the confirmed OpenArc Corporate Advisory breakaway (contacts 45/111, migration 061) — investigated specifically and confirmed she remains at Merrill, absent from OpenArc''s public team roster and the Merrill v. OpenArc lawsuit defendant list. Private Wealth Advisor, The Westmoreland Group (with Rod Westmoreland, id 123), Merrill Atlanta; Forbes 2026 #59 Top Wealth Advisors.')), 512)
WHERE id = 124;
UPDATE contacts SET
  address = '3455 Peachtree Rd NE',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CROSS-CHECK RESOLVED: shares the (404) 607-4600 phone with the OpenArc breakaway (contacts 45/111) — confirmed still at Merrill, not part of that departure. Managing Director, Private Wealth Advisor, Ponder Jowers & Associates, Merrill Atlanta.')), 512)
WHERE id = 317;
UPDATE contacts SET
  address = '3455 Peachtree Rd NE',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CROSS-CHECK RESOLVED: shares the (404) 607-4600 phone with the OpenArc breakaway (contacts 45/111) — confirmed still at Merrill. Managing Director, Private Wealth Advisor, leads The Wiley Group, Merrill Atlanta; Barron''s Top 1,500 2026.')), 512)
WHERE id = 353;
UPDATE contacts SET
  address = '3455 Peachtree Rd NE',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CROSS-CHECK RESOLVED: shares the (404) 607-4600 phone with the OpenArc breakaway (contacts 45/111) — confirmed still at Merrill. Managing Director, Ponder Jowers & Associates (with Jay Jowers, id 317), Merrill Atlanta.')), 512)
WHERE id = 437;

-- ===== GROUP 87: Merrill Private Wealth Management, New Canaan, CT =====
-- 125 Brian Hetherington (The Hetherington Group)
UPDATE contacts SET
  address = '2 Pine Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Resident Director & Private Wealth Advisor, The Hetherington Group, Merrill New Canaan.')), 512)
WHERE id = 125;
INSERT INTO contact_people (contact_id, name, role)
SELECT 125, x.name, x.role FROM (
  SELECT 'Peter J. Luppino' AS name, 'The Hetherington Group' AS role
  UNION ALL SELECT 'Carissa B. Marz', 'The Hetherington Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 125) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 125 AND name = x.name);

-- ===== GROUP 88: Morgan Stanley Private Wealth Management, Oklahoma City, OK =====
-- 126 James Johnson (The Johnson Group)
UPDATE contacts SET
  address = '6305 Waterford Blvd, Suite 240',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, team lead, The Johnson Group, Morgan Stanley Oklahoma City; 31 years industry experience, #3 Forbes 2026 Best-In-State OK.')), 512)
WHERE id = 126;
INSERT INTO contact_people (contact_id, name, role)
SELECT 126, x.name, x.role FROM (SELECT 'Grayson Johnson' AS name, 'Financial Advisor, The Johnson Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 126) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 126 AND name = x.name);

-- ===== GROUP 89: CIBC Private Wealth, Boston, MA =====
-- 127 Eric Riak
UPDATE contacts SET
  title = 'Managing Director, Senior Relationship Manager',
  address = '100 Federal Street, 30th & 31st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Title corrected from plain "Financial Advisor" per firm''s own team page. Confirmed current, CIBC Private Wealth Boston.')), 512)
WHERE id = 127;
INSERT INTO contact_people (contact_id, name, role)
SELECT 127, x.name, x.role FROM (
  SELECT 'Justin Amico' AS name, 'Senior Relationship Manager, CIBC Private Wealth Boston' AS role
  UNION ALL SELECT 'Joseph Beauchaine', 'Senior Relationship Manager, CIBC Private Wealth Boston'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 127) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 127 AND name = x.name);

-- ===== GROUP 90: Rockefeller Capital Management, Atlanta, GA — four distinct practices =====
-- 128 Justin Ryan, 164 David Higgins, 221 Thomas Epperson, 357 Michael Merlin
UPDATE contacts SET
  address = '3060 Peachtree Road NW, Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-leads Ryan Epperson Wealth Partners, Rockefeller Atlanta.')), 512)
WHERE id = 128;
UPDATE contacts SET
  address = '3060 Peachtree Road NW, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Advisor, leads Higgins Wealth Partners (formerly Higgins Hall Group), Rockefeller Atlanta; Forbes #5 GA-Atlanta Private Wealth.')), 512)
WHERE id = 164;
UPDATE contacts SET
  address = '3060 Peachtree Road NW, Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-leads Ryan Epperson Wealth Partners (with Ryan, id 128), Rockefeller Atlanta; Forbes #11 GA-Atlanta Private Wealth (Apr 2025).')), 512)
WHERE id = 221;
UPDATE contacts SET
  address = '3060 Peachtree Road NW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Merlin Wealth Management (MWM Family Office), Rockefeller Atlanta.')), 512)
WHERE id = 357;
INSERT INTO contact_people (contact_id, name, role)
SELECT 164, x.name, x.role FROM (SELECT 'Michael P. Hall' AS name, 'Managing Director, Private Wealth Advisor, Higgins Wealth Partners (co-lead status unconfirmed under current branding)' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 164) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 164 AND name = x.name);

-- ===== GROUP 91: UBS Private Wealth Management, Memphis, TN =====
-- 129 Jay Williams (The Family Office Group)
UPDATE contacts SET
  address = '6070 Poplar Avenue, Triad Center III',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Managing Director, Private Wealth Advisor, The Family Office Group, UBS Memphis; joined UBS 2008, holds Family Office Consultant designation.')), 512)
WHERE id = 129;
INSERT INTO contact_people (contact_id, name, role)
SELECT 129, x.name, x.role FROM (SELECT 'Aaron G. Fuller, CIMA' AS name, 'Lead Investment Consultant / Private Wealth Advisor, The Family Office Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 129) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 129 AND name = x.name);

-- ===== GROUP 92: UBS Private Wealth Management, West Palm Beach, FL =====
-- 130 Douglas Braff confirmed current; 939 Andrew Plum departed to Loxahatchee Capital.
UPDATE contacts SET
  address = '525 Okeechobee Blvd, Suite 1500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/SVP-Wealth Management, Private Wealth Advisor, leads The Braff Group, UBS West Palm Beach; Barron''s Top 100 (2015-2026), UBS Chairman''s Council 2025.')), 512)
WHERE id = 130;
UPDATE contacts SET
  firm = 'Loxahatchee Capital',
  title = 'Managing Partner',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed UBS (Sept 19, 2025) — led the separate "440 Group" at the same building; co-founded Loxahatchee Capital in Tequesta, FL, backed by Elevation Point. UBS subsequently sued the departing team for breach of non-solicit agreements. Address not applied — new Loxahatchee Capital office not confirmed this pass.')), 512)
WHERE id = 939;
INSERT INTO contact_people (contact_id, name, role)
SELECT 130, x.name, x.role FROM (
  SELECT 'Douglas Coughlin, CFP' AS name, 'Financial Advisor / Investment Management Consultant, The Braff Group' AS role
  UNION ALL SELECT 'Kelly Ganz, CFP, CIMA', 'Financial Advisor, The Braff Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 130) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 130 AND name = x.name);

-- ===== GROUP 93: Merrill Wealth Management, Charlotte, NC — two distinct addresses/practices =====
-- 131 John McCardell, 1189 R. Neil Stikeleather
UPDATE contacts SET
  address = '620 S Tryon St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor/Managing Director, Merrill Charlotte; Forbes 2026 #2 NC state / #172 nationally. Address moderate confidence, not phone-confirmed; a different building than Stikeleather (id 1189) despite the shared CRM phone.')), 512)
WHERE id = 131;
UPDATE contacts SET
  address = '6000 Fairview Road, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor & Managing Director, leads Stikeleather & Associates, Merrill Charlotte; Barron''s Top 1,200 2025 (NC #30). Different building than McCardell (id 131) despite the shared CRM phone.')), 512)
WHERE id = 1189;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1189, x.name, x.role FROM (SELECT 'Melissa R. J. Thor' AS name, 'AVP, Wealth Management Associate, Stikeleather & Associates' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1189) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1189 AND name = x.name);

-- ===== GROUP 94: J.P. Morgan Wealth Management, Dallas, TX =====
-- 132 Maxwell Pearl (The BPS Group, formerly Burns Troop Pearl)
UPDATE contacts SET
  address = '100 Crescent Court, Suite 1300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, The BPS Group (formerly Burns Troop Pearl Team — co-founder Evan Troop departed Feb 2025 for an independent firm), JPM Dallas; Forbes 2026 Best-In-State.')), 512)
WHERE id = 132;
INSERT INTO contact_people (contact_id, name, role)
SELECT 132, x.name, x.role FROM (
  SELECT 'Justin Burns' AS name, 'Managing Director & Wealth Partner, The BPS Group' AS role
  UNION ALL SELECT 'Lauren DeVries Shields', 'Vice President & Wealth Advisor, The BPS Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 132) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 132 AND name = x.name);

-- ===== GROUP 95: Raymond James, Bethesda, MD =====
-- 135 Jason Goldstein (The Goldstein Group)
UPDATE contacts SET
  address = '4550 Montgomery Ave, Suite 410',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director / Private Wealth Advisor, leads The Goldstein Group, Raymond James Bethesda; Barron''s Top 1,200 2022-2026, Chairman''s Council.')), 512)
WHERE id = 135;

-- ===== GROUP 96: Merrill Wealth Management, Seattle, WA — three distinct practices =====
-- 136 Jens Pascucci, 143 Matthew Van Beek, 1003 Corina Davis
UPDATE contacts SET
  address = '401 Union St, Suite 2600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior VP/Managing Director, Wealth Management Advisor, leads the Pascucci Group, Merrill Seattle; #229 Forbes America''s Top Wealth Advisors 2026.')), 512)
WHERE id = 136;
UPDATE contacts SET
  address = '401 Union St, Suite 2600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, co-founder of The MCNW Group, Merrill Seattle; #195 Forbes America''s Top Wealth Advisors 2026.')), 512)
WHERE id = 143;
UPDATE contacts SET
  address = '401 Union St, Suite 2600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, leads The Davis Group, Merrill Seattle; CFP/CPWA/CEPA/CPFA.')), 512)
WHERE id = 1003;
INSERT INTO contact_people (contact_id, name, role)
SELECT 143, x.name, x.role FROM (SELECT 'Nate Skow' AS name, 'Senior Vice President, Wealth Management Advisor & Sports & Entertainment Advisor, The MCNW Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 143) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 143 AND name = x.name);

-- ===== GROUP 97: Summit Trail Advisors, Chicago, IL =====
-- 137 Peter Lee
UPDATE contacts SET
  address = '167 N Green Street, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner, Summit Trail Advisors, Chicago; Barron''s Top 1,500 by State #7 IL. Address moderate confidence — a second candidate address (353 N Clark St) also surfaced; neither''s phone matched the CRM record exactly.')), 512)
WHERE id = 137;
INSERT INTO contact_people (contact_id, name, role)
SELECT 137, x.name, x.role FROM (
  SELECT 'Jonathan Nickow, CFA, CFP' AS name, 'Vice President / Principal, Investment Committee Member, Summit Trail Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 137) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 137 AND name = x.name);

-- ===== GROUP 98: Merrill Wealth Management, Iselin, NJ =====
-- 138 Goran Bojovski (The Gsell Group), 829 James Maltese (The Maltese Group)
UPDATE contacts SET
  address = '194 Wood Ave S',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, The Gsell Group, Merrill Iselin/Metro Park; Barron''s Top 1,200 2016-2025, Forbes Best-In-State 2026.')), 512)
WHERE id = 138;
UPDATE contacts SET
  address = '194 Wood Ave S',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads The Maltese Group, Merrill Iselin/Metro Park; Forbes Best-In-State 2026 (#23 NJ-North), FT400.')), 512)
WHERE id = 829;
INSERT INTO contact_people (contact_id, name, role)
SELECT 138, x.name, x.role FROM (SELECT 'Bruce E. Gsell, CRPC' AS name, 'Financial Advisor, The Gsell Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 138) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 138 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 829, x.name, x.role FROM (SELECT 'Ian P. Lynch' AS name, 'Senior Vice President, Wealth Management Advisor & Portfolio Manager, The Maltese Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 829) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 829 AND name = x.name);

-- ===== GROUP 99: Morgan Stanley | Graystone Consulting, Columbus, OH =====
-- 140 Thomas Robertson (The Robertson Group / Graystone Mid America)
UPDATE contacts SET
  address = '41 South High St, Suite 2700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Institutional Consulting Director / Corporate Retirement Director, leads The Robertson Group (now branded Graystone Mid America — multi-city team spanning Columbus, Chicago, Milwaukee), Morgan Stanley; Forbes 2026 Best-In-State team #3 OH.')), 512)
WHERE id = 140;
INSERT INTO contact_people (contact_id, name, role)
SELECT 140, x.name, x.role FROM (SELECT 'Jeremy R. Ohlinger' AS name, 'Investment Consultant, Graystone Mid America (joined 2008)' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 140) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 140 AND name = x.name);

-- ===== GROUP 100: Alex. Brown | Raymond James, Washington, D.C. =====
-- 142 Richard Harris (The HKW Group)
UPDATE contacts SET
  address = '801 17th St NW, Suite 310',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founding partner of The HKW Group, Alex. Brown | Raymond James, Washington DC; Barron''s Top 1,200 (2010-present), FT400 2019.')), 512)
WHERE id = 142;
INSERT INTO contact_people (contact_id, name, role)
SELECT 142, x.name, x.role FROM (
  SELECT 'Todd Kingsley' AS name, 'Managing Director, The HKW Group' AS role
  UNION ALL SELECT 'Seth Wernick', 'Managing Director, The HKW Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 142) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 142 AND name = x.name);
