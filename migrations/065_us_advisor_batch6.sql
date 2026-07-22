-- US Financial Advisor enrichment, batch 6 (47 contacts / 20 groups).
--
-- Key finding: the (212) 670-4000 "office" group turned out to span FOUR
-- distinct Manhattan buildings (225 Liberty St/Brookfield Place, One
-- Bryant Park, 717 Fifth Ave, and 200 Park Ave) rather than one office —
-- each contact below was addressed to its own confirmed building.
--
-- Cross-reference resolved: contact 216 (Craig Chiate) is a named team
-- member of "Wise River Advisors," the same UBS Century City team led by
-- contact 283 (Mark Binder) in a different CRM phone-group — both now
-- carry the confirmed 2000 Avenue of the Stars address.
--
-- One firm-change correction: 717 Derek Cherne departed UBS Wayzata
-- (~Dec 2025) with his 8-advisor team to found "Snow Pine Private
-- Wealth," an independent practice under Wells Fargo Advisors Financial
-- Network (FiNet); new office address not independently confirmed.
--
-- One CRM phone-number data error found: 158 Wen Nottebohm's CRM phone
-- (404) 443-2700 is the same number filed for the unrelated Rockefeller
-- Atlanta contacts (batch 5) — Cresset's actual Atlanta line is
-- (404) 480-1837 per an SEC-filed document; flagged, not overwritten.

-- ===== GROUP 101: RBC Wealth Management, Chevy Chase, MD =====
-- 144 Ann Marie Etergino (Etergino Group)
UPDATE contacts SET
  address = '5425 Wisconsin Ave., Suite 301',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, leads the Etergino Group, RBC Wealth Management, Chevy Chase MD. Barron''s Top 1,500 Financial Advisors 2026; Forbes Best-In-State Wealth Advisors 2026. Team roster (~7 professionals) not independently confirmed by name.')), 512)
WHERE id = 144;

-- ===== GROUP 102: UBS Private Wealth Management, Los Angeles (Century City), CA — 213-615-2000 =====
-- 145 Ryan McClellan, 283 Mark Binder, 307 Ryan Bristol, 308 Patrick Schaffer, 701 Jesse Amarillas
UPDATE contacts SET
  address = '2000 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Office Consultant/Private Wealth Advisor, leads Private Family Wealth Partners, UBS Century City, Los Angeles. Forbes Top Advisor ranking Apr 2026. Note: office phone found for this building is (310) 734-2400, not (213) 615-2000 on file.')), 512)
WHERE id = 145;
UPDATE contacts SET
  address = '2000 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, co-leads Wise River Advisors, UBS Century City, Los Angeles (team also includes id 216 Craig Chiate, cross-referenced from a separate CRM phone-group at this same address). Forbes Best-In-State #2 Southern California May 2025; serves on UBS Financial Advisor Advisory Council.')), 512)
WHERE id = 283;
UPDATE contacts SET
  address = '2000 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, UBS Century City, Los Angeles (joined 2021 from J.P. Morgan Private Bank), co-leads Legacy Multi-Family Group with id 308 Patrick Schaffer. #28 Forbes 2026 Best-In-State.')), 512)
WHERE id = 307;
UPDATE contacts SET
  address = '2000 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Manager/Family Office Consultant, UBS Century City, Los Angeles, co-leads Legacy Multi-Family Group with id 307 Ryan Bristol.')), 512)
WHERE id = 308;
UPDATE contacts SET
  address = '2000 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, UBS Century City, Los Angeles (joined 2009), leads Corporate Financial Group. #34 Forbes California-LA Private Wealth.')), 512)
WHERE id = 701;
INSERT INTO contact_people (contact_id, name, role)
SELECT 145, x.name, x.role FROM (
  SELECT 'William Calvert' AS name, 'Financial Advisor, Private Family Wealth Partners' AS role
  UNION ALL SELECT 'Kirk Wendorf', 'Financial Advisor, Private Family Wealth Partners'
  UNION ALL SELECT 'Ryan Chase', 'Financial Advisor, Private Family Wealth Partners'
  UNION ALL SELECT 'Scott Harries', 'Financial Advisor, Private Family Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 145) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 145 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 283, x.name, x.role FROM (
  SELECT 'Craig Chiate' AS name, 'Financial Advisor, co-leads Wise River Advisors (CRM id 216)' AS role
  UNION ALL SELECT 'Barry Porter', 'Financial Advisor, Wise River Advisors'
  UNION ALL SELECT 'James Axelson', 'Financial Advisor, Wise River Advisors'
  UNION ALL SELECT 'Jeffery Hamilton', 'Financial Advisor, Wise River Advisors'
  UNION ALL SELECT 'Timothy Bremner', 'Financial Advisor, Wise River Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 283) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 283 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 307, x.name, x.role FROM (
  SELECT 'Barry Peterson' AS name, 'Financial Advisor, Legacy Multi-Family Group' AS role
  UNION ALL SELECT 'Corey Mazza', 'Financial Advisor, Legacy Multi-Family Group'
  UNION ALL SELECT 'Dhanesh Bharvani', 'Financial Advisor, Legacy Multi-Family Group'
  UNION ALL SELECT 'Basel Sbeini', 'Relationship Manager, Legacy Multi-Family Group'
  UNION ALL SELECT 'Shauna Kohanchi', 'Senior Wealth Strategy Associate, Legacy Multi-Family Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 307) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 307 AND name = x.name);

-- ===== GROUP 103: Cresset, Menlo Park, CA =====
-- 146 David Arizini
UPDATE contacts SET
  address = '2500 Sand Hill Road, Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director, Wealth Advisor, Cresset, Menlo Park CA. #20 Forbes 2026 Best-In-State Wealth Advisors.')), 512)
WHERE id = 146;
INSERT INTO contact_people (contact_id, name, role)
SELECT 146, x.name, x.role FROM (
  SELECT 'Joe Park' AS name, 'Managing Director, Chief Operating Officer, Cresset (Menlo Park & New York)' AS role
  UNION ALL SELECT 'Dean Jackson', 'Managing Director, Wealth Advisor, Cresset (Menlo Park & New York)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 146) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 146 AND name = x.name);

-- ===== GROUP 104: Merrill Private Wealth Management, Columbus, OH =====
-- 148 Peter Motta (The Cenname Team)
UPDATE contacts SET
  address = '65 E. State Street, Suite 2600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Managing Director, Private Wealth Advisor, The Cenname Team, Merrill Private Wealth Management, Columbus OH. #2 Forbes Best-In-State Ohio Private Wealth 2025.')), 512)
WHERE id = 148;
INSERT INTO contact_people (contact_id, name, role)
SELECT 148, x.name, x.role FROM (
  SELECT 'August A. Cenname' AS name, 'Private Wealth Advisor, The Cenname Team' AS role
  UNION ALL SELECT 'Audrey Tuckerman', 'Private Wealth Advisor/Manager, The Cenname Team'
  UNION ALL SELECT 'Lawrence Manierre', 'Private Wealth Advisor, The Cenname Team'
  UNION ALL SELECT 'Charles Jarrett', 'Private Wealth Advisor/Manager, The Cenname Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 148) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 148 AND name = x.name);

-- ===== GROUP 105: Merrill Wealth Management, New York, NY — 212-670-4000 =====
-- 154,159,176,177,238,412,458,527,546,672,675,935 — this CRM phone number spans FOUR
-- separate Manhattan buildings; each contact addressed to its own confirmed team/building.
UPDATE contacts SET
  address = 'One Bryant Park, Floor 46',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Kass/Freeman Group, Merrill Wealth Management, One Bryant Park (not the CRM-grouped 225 Liberty St building). Barron''s Top 100 15 consecutive years through 2025.')), 512)
WHERE id = 154;
UPDATE contacts SET
  address = '225 Liberty Street, 39th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Waldele Group, Merrill Wealth Management, 225 Liberty St/Brookfield Place. Current employment status not individually re-verified beyond directory listing.')), 512)
WHERE id = 159;
UPDATE contacts SET
  address = 'Fifth Avenue Financial Center, 717 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Mellert, DiScala & Associates, Merrill Wealth Management, Fifth Avenue Financial Center (not the CRM-grouped 225 Liberty St building). Forbes Best-In-State 2025 (#209). Note: some third-party aggregators show a stale prior address near 225 Liberty/250 Vesey St.')), 512)
WHERE id = 176;
UPDATE contacts SET
  address = 'Fifth Avenue Financial Center, 717 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Mellert, DiScala & Associates, Merrill Wealth Management, Fifth Avenue Financial Center, co-leads team with id 176 Doug Mellert.')), 512)
WHERE id = 177;
UPDATE contacts SET
  address = '225 Liberty Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | The Barrett Group, Merrill Wealth Management, 225 Liberty St/Brookfield Place. Listed on Forbes 2026 Best-In-State Team roster; current employment status not individually re-verified beyond that listing.')), 512)
WHERE id = 238;
UPDATE contacts SET
  address = 'Fifth Avenue Financial Center, 717 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Katz Wealth Advisors, Merrill Wealth Management, Fifth Avenue Financial Center (not the CRM-grouped 225 Liberty St building). Listed on Forbes "Top 250" 2024-2026; current employment status not individually re-verified beyond that listing.')), 512)
WHERE id = 412;
UPDATE contacts SET
  address = '225 Liberty Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founding partner, Corporate Executive Services (CES) Group, Merrill Wealth Management, 225 Liberty St/Brookfield Place. Forbes 2025 Best-In-State (#145).')), 512)
WHERE id = 458;
UPDATE contacts SET
  address = '200 Park Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Snyder/Balducci Group, Merrill Wealth Management, 200 Park Ave/MetLife Building (not the CRM-grouped 225 Liberty St building). Listed on Forbes 2026 #6 Best-In-State; current employment status not individually re-verified beyond that listing.')), 512)
WHERE id = 527;
UPDATE contacts SET
  address = 'Fifth Avenue Financial Center, 717 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Svarre Group, Merrill Wealth Management, Fifth Avenue Financial Center (not the CRM-grouped 225 Liberty St building). Barron''s Top 1,200 historically (2009-2016); current employment status not individually re-verified beyond directory listing.')), 512)
WHERE id = 546;
UPDATE contacts SET
  address = '200 Park Avenue, Suite 34',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Snyder/Balducci Group, Merrill Wealth Management, 200 Park Ave/MetLife Building, co-leads team with id 527 Charles Balducci. Forbes 2026 #6 Best-In-State.')), 512)
WHERE id = 672;
UPDATE contacts SET
  address = '225 Liberty Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | The Patel Team, Merrill Wealth Management, Brookfield Place complex — sources give the address variably as 225 Liberty St or the adjacent 250 Vesey St tower, treat as approximate. Senior Resident Director, Merrill NY.')), 512)
WHERE id = 675;
UPDATE contacts SET
  address = 'Fifth Avenue Financial Center, 717 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Liebers Group, Merrill Wealth Management, Fifth Avenue Financial Center (one source instead lists 75 Rockefeller Plaza, likely a nearby/alternate suite in the same zip). Barron''s Top 1,200, 12th consecutive year through 2024.')), 512)
WHERE id = 935;

-- ===== GROUP 106: UBS Private Wealth Management, Los Angeles (Century City), CA — 310-734-2400 =====
-- 155 Michael Kanigher, 216 Craig Chiate (cross-referenced into group 102's Wise River Advisors, id 283)
UPDATE contacts SET
  address = '2000 Avenue of the Stars, 12th Floor South',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor & Senior Portfolio Manager, UBS Century City, Los Angeles, leads Mainsail Wealth Partners (~$8B+ AUM, #7 nationally Nov 2025). Barron''s Top 1,200 2025; Forbes #73 nationally 2025.')), 512)
WHERE id = 155;
UPDATE contacts SET
  address = '2000 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, co-leads Wise River Advisors, UBS Century City, Los Angeles, alongside id 283 Mark Binder (cross-referenced: same team, different CRM phone-group).')), 512)
WHERE id = 216;
INSERT INTO contact_people (contact_id, name, role)
SELECT 155, x.name, x.role FROM (
  SELECT 'Drew Freides' AS name, 'Managing Director, Private Wealth Advisor, Mainsail Wealth Partners' AS role
  UNION ALL SELECT 'Steven Westerman', 'Private Wealth Advisor, Mainsail Wealth Partners'
  UNION ALL SELECT 'Brendan Carroll', 'Financial Advisor, Mainsail Wealth Partners'
  UNION ALL SELECT 'Kate Freeman', 'Financial Advisor, Mainsail Wealth Partners'
  UNION ALL SELECT 'Melanie Desma', 'Financial Advisor, Mainsail Wealth Partners'
  UNION ALL SELECT 'Langdon Froomer', 'Financial Advisor, Mainsail Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 155) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 155 AND name = x.name);

-- ===== GROUP 107: Morgan Stanley Private Wealth Management, San Francisco, CA =====
-- 156 Shane Brisbin (Team 581)
UPDATE contacts SET
  address = '555 California Street, 14th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Team 581, Morgan Stanley PWM San Francisco (address/phone match CRM exactly). #89 Forbes America''s Top Wealth Advisors 2025; #3 Best-In-State SF Private Wealth 2025; team on Barron''s Top 50 PWM Teams 2019-2026.')), 512)
WHERE id = 156;
INSERT INTO contact_people (contact_id, name, role)
SELECT 156, x.name, x.role FROM (
  SELECT 'Michael Baumer' AS name, 'Managing Director, Private Wealth Advisor, Team 581' AS role
  UNION ALL SELECT 'Spencer Larson', 'Executive Director, Private Wealth Advisor, Team 581'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 156) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 156 AND name = x.name);

-- ===== GROUP 108: Cresset, Atlanta, GA =====
-- 158 Wen Nottebohm — CRM phone (404) 443-2700 is shared with unrelated batch-5 Rockefeller Atlanta contacts (data error)
UPDATE contacts SET
  address = '3445 Peachtree Road NE, Suite 1400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (404) 443-2700 is a data error — it is shared in this CRM with unrelated Rockefeller Capital Management Atlanta contacts (batch 5, ids 119-124). Cresset''s own Atlanta line is (404) 480-1837 per an SEC-filed document. Confirmed current — Managing Director/Market Managing Director, Wealth Advisor, Cresset, Atlanta (Buckhead).')), 512)
WHERE id = 158;
INSERT INTO contact_people (contact_id, name, role)
SELECT 158, x.name, x.role FROM (
  SELECT 'Beth Kytle Chandler' AS name, 'Managing Director, Wealth Advisor, Cresset Atlanta' AS role
  UNION ALL SELECT 'Michael Mohr, CFA', 'Managing Director, Wealth Advisor, Cresset Atlanta'
  UNION ALL SELECT 'Todd Tautfest', 'Managing Director, Wealth Advisor, Cresset Atlanta'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 158) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 158 AND name = x.name);

-- ===== GROUP 109: Morgan Stanley Private Wealth Management, Seattle, WA =====
-- 160 David Midgley, 166 Dean Braun, 315 Lowry West, 319 Jack Almo — four separate
-- sub-teams sharing the same PWM floor, not one combined team.
UPDATE contacts SET
  address = '601 Union Street, Two Union Square, Suite 5200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Private Wealth Advisor, Morgan Stanley PWM Seattle. #22 Forbes Best-In-State Wealth Advisors 2026. Note: shares office floor with three other separately-led teams (ids 166, 315, 319) also in this CRM group — not one combined team.')), 512)
WHERE id = 160;
UPDATE contacts SET
  address = '601 Union Street, Two Union Square, Suite 5200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Braun Elwell Group, Morgan Stanley PWM Seattle. Chairman''s Club member, Forbes Top Wealth Advisor 2004-2026; team on Barron''s Top 250 PWM Teams 2021-2026.')), 512)
WHERE id = 166;
UPDATE contacts SET
  address = '601 Union Street, Two Union Square, Suite 5200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, CFP, part of West Henderson Romano Group, Morgan Stanley PWM Seattle. Barron''s Top 1,200 2024; Forbes Best-in-State 2025.')), 512)
WHERE id = 315;
UPDATE contacts SET
  address = '601 Union Street, Two Union Square, Suite 5200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, Alternative Investments Director, Private Wealth Advisor, leads The Almo Lipman Drew Group, Morgan Stanley PWM Seattle (~$3.0B AUM Dec 2025). Barron''s Top 1,200 2022-2026; Forbes Best-In-State 2020-2026.')), 512)
WHERE id = 319;
INSERT INTO contact_people (contact_id, name, role)
SELECT 160, x.name, x.role FROM (
  SELECT 'Sarem Mukhtar' AS name, 'Senior Vice President, Seattle PWM team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 160) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 160 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 315, x.name, x.role FROM (
  SELECT 'Timothy Henderson' AS name, 'Financial Advisor, West Henderson Romano Group' AS role
  UNION ALL SELECT 'Stephen J. Romano', 'Financial Advisor, West Henderson Romano Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 315) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 315 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 319, x.name, x.role FROM (
  SELECT 'Robert Lipman' AS name, 'Co-lead, The Almo Lipman Drew Group' AS role
  UNION ALL SELECT 'Alyssa Drew', 'Co-lead, The Almo Lipman Drew Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 319) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 319 AND name = x.name);

-- ===== GROUP 110: UBS Private Wealth Management, Wayzata, MN =====
-- 161 Robert Metcalf, 162 Judy Fredrickson, 183 Louis Close, 359 Jesse Bull, 717 Derek Cherne (departed)
UPDATE contacts SET
  address = '681 East Lake Street, Suite 354',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor/Family Office Consultant, UBS Wayzata, team now branded Panava Partners (formerly Metcalf Fredrickson Group). Forbes 2026 Top Wealth Advisors.')), 512)
WHERE id = 161;
UPDATE contacts SET
  address = '681 East Lake Street, Suite 354',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Office Consultant, CEPA, UBS Wayzata, same Panava Partners/Metcalf Fredrickson team as id 161 Robert Metcalf. #142 America''s Top Wealth Advisors 2025; #1 Best-in-State MN Private Wealth 2025.')), 512)
WHERE id = 162;
UPDATE contacts SET
  address = '681 East Lake Street, Suite 354',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Manager/Private Wealth Advisor, UBS Wayzata, now on Major Close Watkins Wealth Management Group (with Chris Watkins, Dave Gannon).')), 512)
WHERE id = 183;
UPDATE contacts SET
  address = '681 East Lake Street, Suite 354',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director-Wealth Management, CFP, UBS Wayzata, on The Bull-Wiebler Group (with Troy Wiebler). #5 Best-in-State MN 2025.')), 512)
WHERE id = 359;
UPDATE contacts SET
  firm = 'Snow Pine Private Wealth (Wells Fargo Advisors Financial Network)',
  title = 'Managing Partner & CEO',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed UBS Wayzata ~Dec 2025, taking his 8-advisor team to found Snow Pine Private Wealth, an independent practice under Wells Fargo Advisors Financial Network (FiNet); reported ~$1.7B AUM. Still Wayzata-area based; exact new office address not independently confirmed, so address left as-is on file.')), 512)
WHERE id = 717;
INSERT INTO contact_people (contact_id, name, role)
SELECT 161, x.name, x.role FROM (
  SELECT 'Erica Asada' AS name, 'Team Business Manager, Panava Partners' AS role
  UNION ALL SELECT 'Darryl Rodgers, CPWA, CEPA', 'Team member, Panava Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 161) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 161 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 183, x.name, x.role FROM (
  SELECT 'Chris Watkins' AS name, 'Financial Advisor, Major Close Watkins Wealth Management Group' AS role
  UNION ALL SELECT 'Dave Gannon', 'Financial Advisor, Major Close Watkins Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 183) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 183 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 359, x.name, x.role FROM (
  SELECT 'Troy Wiebler' AS name, 'Co-founder, The Bull-Wiebler Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 359) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 359 AND name = x.name);

-- ===== GROUP 111: Merrill Private Wealth Management, Naples, FL =====
-- 163 Michelle Mayer (MBA Private Wealth / MayerBrodnik Group)
UPDATE contacts SET
  address = '9128 Strada Place, Suite 301',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, founder/co-leader of MBA Private Wealth (MayerBrodnik Group), Merrill Naples. #1 Forbes 2026 Best-In-State FL-Southwest; #48 Forbes 2026 America''s Top Wealth Advisors.')), 512)
WHERE id = 163;
INSERT INTO contact_people (contact_id, name, role)
SELECT 163, x.name, x.role FROM (
  SELECT 'Michael Brodnik' AS name, 'Co-Leader/Founder, Managing Director, Private Wealth Advisor, MayerBrodnik Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 163) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 163 AND name = x.name);

-- ===== GROUP 112: UBS Private Wealth Management, Nashville, TN =====
-- 165 Charles Kirby (goes by "Kent Kirby" professionally; Family Office Partners)
UPDATE contacts SET
  address = '3102 West End Ave, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full legal name Charles Kenton Kirby, goes professionally by "Kent Kirby," Managing Director-Wealth Management, Managing Partner of Family Office Partners team, UBS Nashville. Named #1 Financial Advisor in Tennessee, Barron''s Top 1,200 2025.')), 512)
WHERE id = 165;
INSERT INTO contact_people (contact_id, name, role)
SELECT 165, x.name, x.role FROM (
  SELECT 'Dominic Calvani' AS name, 'Managing Director, Family Office Partners' AS role
  UNION ALL SELECT 'Benjamin Walker', 'Senior Vice President, Wealth Management, Family Office Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 165) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 165 AND name = x.name);

-- ===== GROUP 113: Merrill Private Wealth Management, Cincinnati, OH =====
-- 168 David Singer, 169 Kevin Bruegge (The Evelo|Singer|Sullivan|Bruegge Group)
UPDATE contacts SET
  address = '312 Walnut Street, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, International Private Wealth Advisor & Principal Partner, The Evelo|Singer|Sullivan|Bruegge Group, Merrill Cincinnati. #1 Forbes 2026 Best-In-State Ohio Wealth Advisors.')), 512)
WHERE id = 168;
UPDATE contacts SET
  address = '312 Walnut Street, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor & Principal Partner, The Evelo|Singer|Sullivan|Bruegge Group, Merrill Cincinnati (joined 2002). #4 Forbes 2026 Best-In-State Ohio Wealth Advisors.')), 512)
WHERE id = 169;
INSERT INTO contact_people (contact_id, name, role)
SELECT 168, x.name, x.role FROM (
  SELECT 'Joseph H. Evelo' AS name, 'Founder / Senior Relationship Manager, Evelo|Singer|Sullivan|Bruegge Group' AS role
  UNION ALL SELECT 'Linnell R. Sullivan', 'Private Wealth Advisor & Principal Partner, Evelo|Singer|Sullivan|Bruegge Group'
  UNION ALL SELECT 'Thomas E. Hurley, CFP', 'Managing Director, Private Wealth Advisor, Evelo|Singer|Sullivan|Bruegge Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 168) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 168 AND name = x.name);

-- ===== GROUP 114: Raymond James, Boca Raton, FL =====
-- 172 Don d'Adesky (The Americas Group)
UPDATE contacts SET
  address = '2255 Glades Road, Suite 120A',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Partner/Managing Director, Wealth Management & Fixed Income Capital Markets, founding member (2013) of The Americas Group, Raymond James, Boca Raton. Note: BrokerCheck also shows a branch record at 1 Town Center Rd, 10th Fl, Boca Raton FL 33486 — possibly a prior/alternate suite.')), 512)
WHERE id = 172;
INSERT INTO contact_people (contact_id, name, role)
SELECT 172, x.name, x.role FROM (
  SELECT 'Zac Hersman' AS name, 'Senior Financial Planning Consultant, The Americas Group' AS role
  UNION ALL SELECT 'Pablo Ramon Heredia', 'Practice Business Manager, The Americas Group'
  UNION ALL SELECT 'Allie Woolery', 'Senior Investment Portfolio Analyst, The Americas Group'
  UNION ALL SELECT 'Monique Estrada', 'Senior Client Service Associate, The Americas Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 172) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 172 AND name = x.name);

-- ===== GROUP 115: Merrill Private Wealth Management, Dallas, TX =====
-- 173 William Corbellini, 174 Dwight Emanuelson (Corbellini, Emanuelson, Kalyandurg & Associates)
UPDATE contacts SET
  address = '300 Crescent Court, Suite 1300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, founding/lead member of Corbellini, Emanuelson, Kalyandurg & Associates ($4.7B AUM team), Merrill Dallas. #1 Texas-Dallas Forbes Apr 2025.')), 512)
WHERE id = 173;
UPDATE contacts SET
  address = '300 Crescent Court, Suite 1300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-founder, equity strategist, Corbellini, Emanuelson, Kalyandurg & Associates, Merrill Dallas.')), 512)
WHERE id = 174;
INSERT INTO contact_people (contact_id, name, role)
SELECT 173, x.name, x.role FROM (
  SELECT 'Raj Kalyandurg, CPWA' AS name, 'Managing Director, Private Wealth Advisor, Corbellini-Emanuelson-Kalyandurg team' AS role
  UNION ALL SELECT 'Sami A. Abboud, AAMS', 'VP, Private Wealth Senior Business Manager, Corbellini-Emanuelson-Kalyandurg team'
  UNION ALL SELECT 'Tara T. Walters, AAMS', 'VP, Private Wealth Senior Relationship Manager, Corbellini-Emanuelson-Kalyandurg team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 173) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 173 AND name = x.name);

-- ===== GROUP 116: UBS Private Wealth Management, Dallas, TX =====
-- 175 Ryan Long, 1036 Rob Bertino
UPDATE contacts SET
  address = '100 Crescent Court, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, UBS Dallas, now leads/co-leads LongBernsteinGunderson Wealth Management (multi-city team). Barron''s Top 1,500 2026; Forbes Best-in-State Dallas-Fort Worth Apr 2026.')), 512)
WHERE id = 175;
UPDATE contacts SET
  address = '100 Crescent Court, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, UBS Dallas, leads Bertino Investment Consulting Group. #17 Best-in-State Texas-Dallas 2025; Barron''s Top 1,200 multiple years 2014-2025.')), 512)
WHERE id = 1036;
INSERT INTO contact_people (contact_id, name, role)
SELECT 175, x.name, x.role FROM (
  SELECT 'Brad Bernstein' AS name, 'Private Wealth Advisor, LongBernsteinGunderson Wealth Management' AS role
  UNION ALL SELECT 'Louise Gunderson', 'Private Wealth Advisor, LongBernsteinGunderson Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 175) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 175 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1036, x.name, x.role FROM (
  SELECT 'Cameron Lail' AS name, 'Team member, Bertino Investment Consulting Group' AS role
  UNION ALL SELECT 'Anna Vargas', 'Team member, Bertino Investment Consulting Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1036) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1036 AND name = x.name);

-- ===== GROUP 117: Miracle Mile Advisors, Los Angeles, CA =====
-- 178 Duncan Rolph — phone matches CRM exactly, high confidence
UPDATE contacts SET
  address = '11300 W Olympic Blvd, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner/Owner and Co-Founder, Miracle Mile Advisors, Los Angeles (address/phone match CRM exactly). Barron''s #37 California Top Advisors 2024.')), 512)
WHERE id = 178;
INSERT INTO contact_people (contact_id, name, role)
SELECT 178, x.name, x.role FROM (
  SELECT 'Brock Moseley' AS name, 'Founder & Managing Partner, Miracle Mile Advisors' AS role
  UNION ALL SELECT 'Matt Dmytryszyn', 'Chief Investment Officer, Miracle Mile Advisors'
  UNION ALL SELECT 'Bruce Milam', 'Senior Strategic Advisor, Miracle Mile Advisors'
  UNION ALL SELECT 'Sara Rajo-Miller Wendt', 'Advisor, Miracle Mile Advisors — Forbes Best-In-State Top Women Wealth Advisors #47 nationally 2024'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 178) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 178 AND name = x.name);

-- ===== GROUP 118: Morgan Stanley Private Wealth Management, Long Beach, CA =====
-- 179 John Shadden (The Shadden Group / Graystone Consulting)
UPDATE contacts SET
  address = '3840 Kilroy Airport Way, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor / Institutional Consulting Director, leads The Shadden Group, Morgan Stanley PWM Long Beach (also branded via Graystone Consulting). Barron''s Top 250 Private Wealth Management Teams 2026; Best-In-State CA-LA Private Wealth #28 2025. CIMA.')), 512)
WHERE id = 179;
INSERT INTO contact_people (contact_id, name, role)
SELECT 179, x.name, x.role FROM (
  SELECT 'Mike Van Dyke, CIMA, CFP' AS name, 'Family Wealth Director / Institutional Consultant, The Shadden Group' AS role
  UNION ALL SELECT 'Gary R. Velek, CIMA, CFP, QPFC', 'Senior Portfolio Manager, The Shadden Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 179) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 179 AND name = x.name);

-- ===== GROUP 119: Morgan Stanley | Graystone Consulting, San Antonio, TX =====
-- 180 Ron Kern, 181 William Sammons
UPDATE contacts SET
  address = '7600 Broadway, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Ronald Alan Kern, Managing Director, Wealth Management, Institutional Consulting Director, Graystone Consulting San Antonio. 2025 Barron''s Top 1,200 honoree; team on 2026 Barron''s Top 100.')), 512)
WHERE id = 180;
UPDATE contacts SET
  address = '7600 Broadway, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name William Joseph "Joe" Sammons, CIMA, Senior Vice President, Institutional Consulting Director, Graystone Consulting San Antonio. Forbes 2026 Best-In-State Wealth Management Teams list.')), 512)
WHERE id = 181;
INSERT INTO contact_people (contact_id, name, role)
SELECT 180, x.name, x.role FROM (
  SELECT 'Jason W. Black' AS name, 'Managing Director, Wealth Management, Institutional Consultant, Graystone Consulting San Antonio' AS role
  UNION ALL SELECT 'Rollins Schultz Rubsamen', 'Senior Vice President, Institutional Consultant, Portfolio Manager, Graystone Consulting San Antonio'
  UNION ALL SELECT 'Logan Sammons', 'Financial Advisor / Financial Planning Specialist, Graystone Consulting San Antonio'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 180) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 180 AND name = x.name);

-- ===== GROUP 120: Moran Wealth Management, Naples, FL =====
-- 184 Thomas Moran (founder)
UPDATE contacts SET
  address = '5801 Pelican Bay Blvd, Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Chairman, CEO and CIO, Moran Wealth Management, Naples (independent RIA, ~$5B AUM), co-founded ~30 years ago with Earl Sistrunk. Barron''s Hall of Fame 2019.')), 512)
WHERE id = 184;
INSERT INTO contact_people (contact_id, name, role)
SELECT 184, x.name, x.role FROM (
  SELECT 'Earl Sistrunk' AS name, 'Co-Founder, Moran Wealth Management' AS role
  UNION ALL SELECT 'Donald Drury', 'President, Moran Wealth Management'
  UNION ALL SELECT 'Charles Chesebrough Jr.', 'Managing Director, Head of Quantitative Strategies, Moran Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 184) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 184 AND name = x.name);
