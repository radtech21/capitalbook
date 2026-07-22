-- US Financial Advisor enrichment, batch 3 (~85 contacts / 20 office groups).
--
-- Cross-reference finding: 284 Gerard Zell (Menlo Park, CA) appears to
-- belong to "The 173 Group," the same named team as 217 Ned Gibbons
-- (already enriched in migration 060, batch 1, under a different CRM
-- phone-group) — flagged for human review as a likely dedupe/merge
-- candidate rather than resolved unilaterally. Similarly 70 Dan McCormick
-- and 73 Andy Chase are co-managing directors of the same "Chase Group"
-- despite being filed under two different CRM phone numbers — the
-- confirmed team address was applied to both.
--
-- Same tooling-outage pattern as prior batches — most agents worked under
-- partial WebSearch budget; several addresses left unset where multiple
-- conflicting candidates could not be resolved to the CRM's exact phone
-- number, rather than guessing.

-- ===== GROUP 41: Morgan Stanley Wealth Management, Boca Raton, FL — two branches =====
-- 56 Scott Siegel, 792 Eric Applewhite: 595 S. Federal Highway
UPDATE contacts SET
  address = '595 S. Federal Highway, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, Group CEO of The Continuum Group, Morgan Stanley Boca Raton; ranked #2 in FL, Barron''s 2024/2025 Top 1,200.')), 512)
WHERE id = 56;
UPDATE contacts SET
  address = '595 S. Federal Highway, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, The Harbor Financial Group, Morgan Stanley Boca Raton; Forbes Best-in-State 2018-2026, Barron''s Top 1,500 2026.')), 512)
WHERE id = 792;
-- 543 Sean Fetterman: 1801 N. Military Trail (different branch)
UPDATE contacts SET
  address = '1801 N. Military Trail, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, co-founder of The Fetterman Wealth Management Group, Morgan Stanley Boca Raton (a different branch building from Siegel/Applewhite, ids 56/792, despite the shared CRM group); Forbes Best-In-State 2023-2025.')), 512)
WHERE id = 543;
INSERT INTO contact_people (contact_id, name, role)
SELECT 56, x.name, x.role FROM (SELECT 'Jaynie Siegel' AS name, 'First Vice President, Financial Advisor, The Continuum Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 56) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 56 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 792, x.name, x.role FROM (SELECT 'Julie Clairmont-Shide' AS name, 'Portfolio Management Director, Executive Director, Financial Advisor, The Harbor Financial Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 792) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 792 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 543, x.name, x.role FROM (
  SELECT 'Adam Fetterman' AS name, 'Managing Director, Senior Portfolio Management Director, co-founder, The Fetterman Wealth Management Group' AS role
  UNION ALL SELECT 'David Raphan', 'First Vice President, Financial Advisor, The Fetterman Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 543) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 543 AND name = x.name);

-- ===== GROUP 42: Morgan Stanley Private Wealth Management, Boston, MA — three sub-teams =====
UPDATE contacts SET
  address = '28 State Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, The Livingstone Condron Team, Morgan Stanley PWM Boston.')), 512)
WHERE id = 57;
UPDATE contacts SET
  address = '28 State Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-lead of The Livingstone Condron Team (with Livingstone, id 57), Morgan Stanley PWM Boston.')), 512)
WHERE id = 58;
UPDATE contacts SET
  address = '28 State Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — with the "Lechner Altieri McMahon" team (a distinct sub-team from Livingstone-Condron, same building), Morgan Stanley PWM Boston/New York.')), 512)
WHERE id = 104;
UPDATE contacts SET
  address = '28 State Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — lead advisor of the "Lechner Altieri McMahon" team (with McMahon, id 104), Morgan Stanley PWM Boston/New York.')), 512)
WHERE id = 105;
UPDATE contacts SET
  address = '28 State Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, head of The Strachan Group (a distinct sub-team, same building), Morgan Stanley PWM Boston / Naples FL; Barron''s Hall of Fame Advisor.')), 512)
WHERE id = 266;

-- ===== GROUP 43: Morgan Stanley Private Wealth Management, Washington, D.C. — six separate practices =====
UPDATE contacts SET
  address = '1747 Pennsylvania Ave NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Alternative Investments Director, Private Wealth Advisor, leads The Legg Wealth Management Group, Morgan Stanley PWM DC; Forbes #2 DC-Private Wealth (Apr 2026).')), 512)
WHERE id = 60;
UPDATE contacts SET
  address = '1747 Pennsylvania Ave NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Founding Partner of The Capitol Wealth Management Group, Morgan Stanley PWM DC; ranked #1 advisor in DC by both Barron''s and Forbes (2025).')), 512)
WHERE id = 66;
UPDATE contacts SET
  address = '1747 Pennsylvania Ave NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, with Morgan Stanley PWM since 1983 (42 years); leads/co-leads the O''Neill-Nee Group (~$3B+ AUM), DC; Barron''s Top 1,200 (2009-2025).')), 512)
WHERE id = 228;
UPDATE contacts SET
  address = '1747 Pennsylvania Ave NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Williams Group, Morgan Stanley PWM DC since Aug 2009; Forbes #24 DC-Private Wealth (Apr 2026).')), 512)
WHERE id = 264;
UPDATE contacts SET
  address = '1747 Pennsylvania Ave NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Wohlgemuth Group, Morgan Stanley PWM DC since 2009; Forbes #8 DC-Private Wealth (Apr 2026).')), 512)
WHERE id = 428;
UPDATE contacts SET
  address = '1747 Pennsylvania Ave NW, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, leads The Walker Group, Morgan Stanley PWM DC since 1998; Forbes Best-In-State DC #22 (2025).')), 512)
WHERE id = 434;
INSERT INTO contact_people (contact_id, name, role)
SELECT 66, x.name, x.role FROM (
  SELECT 'A.J. Fechter, CFA' AS name, 'The Capitol Wealth Management Group' AS role
  UNION ALL SELECT 'David Gray', 'The Capitol Wealth Management Group'
  UNION ALL SELECT 'Don G. Metzger', 'The Capitol Wealth Management Group'
  UNION ALL SELECT 'Steve Comiskey, CFP, CIMA', 'The Capitol Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 66) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 66 AND name = x.name);

-- ===== GROUP 44: UBS Private Wealth Management, Stamford, CT =====
-- 61 Matthew Lasko, 492 Teresa Jacobsen confirmed at this address; 260 Will Gourd possibly moved to Greenwich.
UPDATE contacts SET
  address = '600 Washington Blvd, 9th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, founding leader of Flagship Financial Partners, UBS Stamford.')), 512)
WHERE id = 61;
UPDATE contacts SET
  address = '600 Washington Blvd, 9th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, Senior Portfolio Manager, own named practice at UBS Stamford (distinct from Flagship Financial Partners, same building).')), 512)
WHERE id = 492;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LIKELY MOVED — current sources show him as Managing Director, Private Wealth Advisor with the "Polaris Wealth Management" UBS team in Greenwich, CT (100 West Putnam Ave, 2nd Floor), a different branch than Stamford; one aggregator still lists Stamford, possibly stale. Not confident enough to apply a new address — recommend verification.')), 512)
WHERE id = 260;
INSERT INTO contact_people (contact_id, name, role)
SELECT 61, x.name, x.role FROM (
  SELECT 'Dean Gaugler' AS name, 'Financial Advisor, Flagship Financial Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 61) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 61 AND name = x.name);

-- ===== GROUP 45: UBS Private Wealth Management, Denver, CO — three separate practices, address unresolved =====
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads Clarity Advisors, UBS Denver; Forbes #8 Best-In-State CO (2025). Office address unresolved this pass — multiple candidate UBS Denver buildings found, none matched to the CRM phone number.')), 512)
WHERE id = 62;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Manager, leads Montage Financial Group (multi-city team incl. Las Vegas, see contact 68), UBS Denver; Barron''s Top 1,200 10th consecutive year (2023). Office address unresolved this pass.')), 512)
WHERE id = 134;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads Corrado-Harrison and Associates, UBS Denver (with UBS since 2015); Barron''s Hall of Fame 2019, #1 Top Women Wealth Advisors CO (2025). Office address unresolved this pass.')), 512)
WHERE id = 451;

-- ===== GROUP 46: Alex. Brown | Raymond James, Greenwich, CT =====
-- 63 Bryan Stepanian
UPDATE contacts SET
  address = '3 Pickwick Plaza, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Client Advisor, leads The Stepanian Group, Alex. Brown (Raymond James), Greenwich; Forbes #9 Best-In-State CT (2026).')), 512)
WHERE id = 63;
INSERT INTO contact_people (contact_id, name, role)
SELECT 63, x.name, x.role FROM (SELECT 'Jennifer M. Race' AS name, 'Senior Registered Client Service Associate, The Stepanian Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 63) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 63 AND name = x.name);

-- ===== GROUP 47: Morgan Stanley Wealth Management, Newport Beach, CA =====
-- 64 Chad Evans, 171 Scott McEwan
UPDATE contacts SET
  address = '800 Newport Center Dr, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor/Managing Director, leads The Evans Group, Morgan Stanley Newport Beach; Forbes #4 Best-In-State CA-Southern (Private Wealth, 2025).')), 512)
WHERE id = 64;
UPDATE contacts SET
  address = '800 Newport Center Dr, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder of The McEwan Group (distinct sub-team from Evans, same building), Morgan Stanley Newport Beach; team manages $11B+ AUM; Barron''s Top 1200 (2022-2024).')), 512)
WHERE id = 171;

-- ===== GROUP 48: Balentine, Atlanta, GA =====
-- 65 Adrian Cronje
UPDATE contacts SET
  title = 'Chief Executive Officer & Founding Partner',
  address = '3344 Peachtree Road NE, Suite 2200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current, title corrected — formerly Chief Investment Officer, now CEO & Founding Partner, Balentine.')), 512)
WHERE id = 65;
INSERT INTO contact_people (contact_id, name, role)
SELECT 65, x.name, x.role FROM (
  SELECT 'Robert Balentine' AS name, 'Chairman & Co-Founder, Balentine' AS role
  UNION ALL SELECT 'David Damiani, CFA', 'Chief Investment Officer & Chief Financial Officer, Balentine'
  UNION ALL SELECT 'Emily Balentine Barbour, CFP', 'Head of Client Engagement and Family Legacy, Balentine'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 65) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 65 AND name = x.name);

-- ===== GROUP 49: Merrill Wealth Management, Henderson, NV =====
-- 67 Keith Tanabe
UPDATE contacts SET
  address = '450 N Stephanie St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor, Merrill Wealth Management Henderson NV (25 years with firm); Barron''s Top 1,200 State-by-State annually 2016-2025. His broader team page (Tanabe, Tanimoto, Farmer & Holcher Group) lists a Los Angeles office, not Henderson-specific teammates.')), 512)
WHERE id = 67;

-- ===== GROUP 50: UBS Wealth Management, Las Vegas, NV =====
-- 68 Michael Chudd
UPDATE contacts SET
  address = '10801 W Charleston Boulevard, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Manager, Private Wealth Advisor, founder/leader of Montage Financial Group, UBS Las Vegas; Forbes/SHOOK #2 Best-in-State NV (2025). Montage Financial Group is a multi-city team also including Jonathan Beukelman (contact 134, Denver).')), 512)
WHERE id = 68;

-- ===== GROUP 51: Morgan Stanley Private Wealth Management, Menlo Park, CA (650-233-2000) — four separate practices, address unresolved =====
-- 284 Gerard Zell — likely dedupe candidate with contact 217 (The 173 Group, migration 060 batch 1).
UPDATE contacts SET
  address = '2882 Sand Hill Rd, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-managing director of The Chase Group (with Andy Chase, contact 73), Morgan Stanley Menlo Park; Forbes #28 Best-In-State 2026. Address applied from Chase''s confirmed team-page address (same team, different CRM phone group).')), 512)
WHERE id = 70;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, with "The 650 Team" (dual office San Francisco/Menlo Park), Morgan Stanley; Barron''s Top 1,200 2024, Forbes Best-in-State CA. Office address unresolved this pass.')), 512)
WHERE id = 102;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'STRUCTURAL FLAG: appears to be a member of "The 173 Group," Morgan Stanley Menlo Park — the SAME named team as contact 217 (Ned Gibbons), already enriched in migration 060 (batch 1) under a different CRM phone-group ((650) 926-7600 vs. this record''s (650) 233-2000). Recommend human review for a possible merge/dedupe of these two CRM groupings, since they may represent the same underlying team recorded twice. Confirmed current — CFP, Managing Director, Private Wealth Advisor; Forbes #19 Best-In-State Northern CA (Private Wealth, 2025).')), 512)
WHERE id = 284;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, leads The Traum Vaughan Group, Morgan Stanley Menlo Park (40+ years with the firm); Forbes #12 Best-In-State Northern CA (Private Wealth, Apr 2026). Office address unresolved this pass.')), 512)
WHERE id = 303;

-- ===== GROUP 52: Morgan Stanley Private Wealth Management, Menlo Park, CA (650-234-5100) =====
-- 73 Andy Chase, 517 Catherine Fang (The Chase Group)
UPDATE contacts SET
  address = '2882 Sand Hill Rd, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Chase Group (with Dan McCormick, contact 70), Morgan Stanley Menlo Park; Forbes #5 Best-In-State Northern CA (Private Wealth, 2026).')), 512)
WHERE id = 73;
UPDATE contacts SET
  address = '2882 Sand Hill Rd, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, The Chase Group, Morgan Stanley Menlo Park (joined MS 2004; focuses on stock plan/corporate services for Silicon Valley clients).')), 512)
WHERE id = 517;

-- ===== GROUP 53: Morgan Stanley Private Wealth Management, Miami, FL =====
-- 74 Michael Sawyer, 190 Steve Levine
UPDATE contacts SET
  address = '200 South Biscayne Boulevard, 51st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Institutional Consultant, leads The Sawyer Group, Morgan Stanley PWM Miami.')), 512)
WHERE id = 74;
UPDATE contacts SET
  address = '200 South Biscayne Boulevard, 51st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Morgan Stanley PWM Miami; joined April 2023 from First Republic Private Wealth Management (previously UBS, Credit Suisse); also splits time with Los Angeles.')), 512)
WHERE id = 190;
INSERT INTO contact_people (contact_id, name, role)
SELECT 74, x.name, x.role FROM (SELECT 'Andrew Sawyer' AS name, 'Financial Advisor, Morgan Stanley PWM Miami (likely family member of The Sawyer Group, unconfirmed)' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 74) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 74 AND name = x.name);

-- ===== GROUP 54: UBS Private Wealth Management, New York, NY (flagship office, 30 advisors) =====
UPDATE contacts SET
  address = '299 Park Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | High-confidence address (phone matches this UBS flagship branch). Spot-checked: Scott Stackman (Managing Director, Stackman|Casriel Group) and Lyle Casriel (same team) — both active, Barron''s Top 1,200 2023-2025. Jason Katz — active, leads Katz Wealth Management, Forbes Best-In-State NY #2 (2026). Linda Modico — active, Forbes Best-In-State 2026 #112. Remaining names on file at this address were not individually re-verified this pass.')), 512)
WHERE id IN (79, 80, 85, 118, 170, 204, 230, 262, 293, 296, 301, 322, 398, 513, 523, 539, 540, 590, 680, 681, 683, 687, 695, 729, 814, 941, 950, 1047, 1050, 1065);

-- ===== GROUP 55: Merrill Private Wealth Management, Philadelphia, PA =====
-- 81 Peter Rohr — address not confirmed to street level (candidates conflict), not applied.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Rohr Group, Merrill Philadelphia (joined 1987); Forbes 2026 Best-in-State Wealth Management Teams #1 PA-East (4th consecutive year), #41 America''s Top Wealth Advisors 2025. Office street address unresolved this pass (candidates: 1650 Market St Fl 26 vs. Four Penn Center/1600 JFK Blvd) — not applied.')), 512)
WHERE id = 81;

-- ===== GROUP 56: Kayne Anderson Rudnick Investment Management, Los Angeles, CA =====
-- 82 Spuds Powell
UPDATE contacts SET
  address = '2000 Avenue of the Stars, Suite 1110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Confirmed current — Managing Director/Senior Wealth Advisor, Kayne Anderson Rudnick Wealth Advisors, LA; serves on the firm''s Wealth Advisory Investment Committee, ~33 years in industry (joined 2004); Barron''s Hall of Fame (Oct 2022), ranked #3-4 on Barron''s Top 100 Independent Advisors 2025. "Spuds" appears to be a longtime nickname; formal legal first name not independently confirmed. AUM check: could not find a more precise published figure for his book specifically to refine the CRM''s $90.8B figure.')), 512)
WHERE id = 82;
INSERT INTO contact_people (contact_id, name, role)
SELECT 82, x.name, x.role FROM (
  SELECT 'Darnel Bentz' AS name, 'Senior Wealth Advisor, Kayne Anderson Rudnick' AS role
  UNION ALL SELECT 'Brian Chang', 'Senior Wealth Advisor, Kayne Anderson Rudnick'
  UNION ALL SELECT 'Tom Connaghan', 'Wealth Advisor, Kayne Anderson Rudnick'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 82) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 82 AND name = x.name);

-- ===== GROUP 57: Morgan Stanley Private Wealth Management, Garden City, NY =====
-- 83 Bruce Burrows
UPDATE contacts SET
  address = '1200 Franklin Avenue, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Bruce A. Burrows, CFP, CIMA, Managing Director, Family Wealth Director and Stock Plan Director, co-heads The Burrows Strzelecki Group, Morgan Stanley PWM Garden City (with the firm/predecessors since 1992); Chairman''s Council member. Address is the best-matched of several conflicting Garden City candidates (this one specifically named for his team), not fully confirmed against the exact CRM phone number.')), 512)
WHERE id = 83;
INSERT INTO contact_people (contact_id, name, role)
SELECT 83, x.name, x.role FROM (
  SELECT 'Steven Strzelecki' AS name, 'Managing Director, Corporate Client Group Director, co-head, The Burrows Strzelecki Group' AS role
  UNION ALL SELECT 'Jonathan Brooks', 'Senior Vice President, Investment Consultant, The Burrows Strzelecki Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 83) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 83 AND name = x.name);

-- ===== GROUP 58: Morgan Stanley Wealth Management, Raleigh, NC =====
-- 84 Lee Morris — address not found, not applied.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — A. Lee Morris, Managing Director-Wealth Management, Institutional Consulting Director, Graystone Consulting (Morgan Stanley), Raleigh; Barron''s Top 1,200 (2010-2025), Forbes Best-In-State (2018-2025). Office street address could not be confirmed this pass.')), 512)
WHERE id = 84;

-- ===== GROUP 59: RBC Wealth Management, Midland, TX =====
-- 86 Kevin Blonkvist, 215 Michael Blonkvist Jr. (Blonkvist-Teller Legacy Wealth)
UPDATE contacts SET
  address = '550 West Texas Ave, Suite 120',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Branch Director & Senior Portfolio Director, RBC Wealth Management Midland (43+ years, joined predecessor firm 1993); leads team now branded Blonkvist-Teller Legacy Wealth (#2 Texas-North Private Wealth, Jan 2026).')), 512)
WHERE id = 86;
UPDATE contacts SET
  address = '550 West Texas Ave, Suite 120',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor (AWM), RBC Wealth Management Midland, son of Kevin Blonkvist (id 86), same team; Forbes #44 Best-In-State Texas-North (2025).')), 512)
WHERE id = 215;
INSERT INTO contact_people (contact_id, name, role)
SELECT 86, x.name, x.role FROM (
  SELECT 'Andrew Teller Jr.' AS name, 'Co-named partner, Blonkvist-Teller Legacy Wealth' AS role
  UNION ALL SELECT 'Philip Beal', 'Financial Advisor, Blonkvist-Teller Legacy Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 86) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 86 AND name = x.name);

-- ===== GROUP 60: UBS Wealth Management, Princeton, NJ =====
-- 87 L. Marc Shegoski
UPDATE contacts SET
  address = '100 Overlook Center, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Institutional Consultant/Financial Advisor, founding partner of Princeton Investment Consulting, UBS Princeton; Forbes #8 Best-In-State (2026).')), 512)
WHERE id = 87;
INSERT INTO contact_people (contact_id, name, role)
SELECT 87, x.name, x.role FROM (
  SELECT 'Craig Leiderman' AS name, 'Team member, Princeton Investment Consulting' AS role
  UNION ALL SELECT 'David Sears', 'Team member, Princeton Investment Consulting'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 87) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 87 AND name = x.name);
