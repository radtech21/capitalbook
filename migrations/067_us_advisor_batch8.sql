-- US Financial Advisor enrichment, batch 8 (47 contacts / 20 groups).
--
-- Two large CRM phone-groups turned out to span multiple distinct teams
-- sharing one building/switchboard: Merrill Chicago (312-325-6000, 10
-- contacts / 7 separate teams at 110 N. Wacker Dr) and UBS Washington DC
-- (202-585-4000, 9 contacts spanning 3 DC buildings plus one Bethesda,
-- MD office for contact 456 Gregory Marcus).
--
-- Cross-reference resolved: contact 229 (Chris Watkins, filed under a
-- Minneapolis CRM phone-group) is confirmed to be the same person as the
-- "Chris Watkins" co-lead of the Major Close Watkins Wealth Management
-- Group named as contact 183's (Louis Close, batch 6/migration 065)
-- teammate — his FINRA-registered branch is the downtown Minneapolis
-- office even though the team operates client-facing out of Wayzata.
-- Both contacts' records now cross-reference each other.

-- ===== GROUP 141: TSG Wealth Management, Long Beach, CA =====
-- 211 Allen Schreiber
UPDATE contacts SET
  address = '6460 East Pacific Coast Hwy., Suite 223',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner, TSG Wealth Management, Long Beach CA. #15 California-LA (High Net Worth) Forbes Best-In-State 2025.')), 512)
WHERE id = 211;
INSERT INTO contact_people (contact_id, name, role)
SELECT 211, x.name, x.role FROM (
  SELECT 'Warren Schulten' AS name, 'Founder, TSG Wealth Management' AS role
  UNION ALL SELECT 'Mark Schulten', 'Managing Partner, TSG Wealth Management'
  UNION ALL SELECT 'Brian Borst', 'CEO, TSG Wealth Management'
  UNION ALL SELECT 'John Szymura', 'Senior Vice President, TSG Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 211) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 211 AND name = x.name);

-- ===== GROUP 142: Merrill Private Wealth Management, Chicago, IL — 312-325-6000 =====
-- 212,213,297,298,335,403,442,514,541,542 — this CRM phone number spans 7 separate
-- teams sharing 110 N. Wacker Dr; each contact addressed to its own confirmed team.
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, The CKWM Group, Merrill Chicago (110 N. Wacker Dr — one of 7 separate teams sharing this CRM phone-grouped building).')), 512)
WHERE id = 212;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, The CKWM Group, Merrill Chicago, alongside id 212 Thomas Kane.')), 512)
WHERE id = 213;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — co-founder/leader, Baldwin Marcovici Group, Merrill Chicago, alongside id 298 Patrick Baldwin.')), 512)
WHERE id = 297;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — co-founder/leader, Baldwin Marcovici Group, Merrill Chicago, alongside id 297 Michael Marcovici.')), 512)
WHERE id = 298;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads Wright Hudak Zabel Group, Merrill Chicago.')), 512)
WHERE id = 335;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Baldwin Tyndorf Group, Merrill Chicago.')), 512)
WHERE id = 403;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, The Bhatia Group, Merrill Chicago.')), 512)
WHERE id = 442;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The HLA Group – Lopez, Fister, Salazar, Vito, Merrill Chicago.')), 512)
WHERE id = 514;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Founding Partner, Paxinos, Lamberti & Associates, Merrill Chicago, alongside id 542 Joe Lamberti.')), 512)
WHERE id = 541;
UPDATE contacts SET
  address = '110 N. Wacker Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Co-founder, Paxinos, Lamberti & Associates, Merrill Chicago, alongside id 541 Ari Paxinos.')), 512)
WHERE id = 542;
INSERT INTO contact_people (contact_id, name, role)
SELECT 212, x.name, x.role FROM (
  SELECT 'Mark Wiktor' AS name, 'Private Wealth Advisor, The CKWM Group' AS role
  UNION ALL SELECT 'Sean Kienzle', 'Financial Advisor, The CKWM Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 212) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 212 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 403, x.name, x.role FROM (
  SELECT 'Thomas Tyndorf' AS name, 'Private Wealth Advisor, The Baldwin Tyndorf Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 403) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 403 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 335, x.name, x.role FROM (
  SELECT 'Michael Hudak' AS name, 'Managing Director, Private Wealth Advisor, Wright Hudak Zabel Group' AS role
  UNION ALL SELECT 'Robert Zabel', 'Managing Director, Private Wealth Advisor, Wright Hudak Zabel Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 335) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 335 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 442, x.name, x.role FROM (
  SELECT 'Shen Li' AS name, 'Team member, The Bhatia Group' AS role
  UNION ALL SELECT 'Matthew Gebert', 'Team member, The Bhatia Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 442) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 442 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 514, x.name, x.role FROM (
  SELECT 'Justin Fister, CFP, CIMA' AS name, 'Financial Advisor, The HLA Group' AS role
  UNION ALL SELECT 'Anthony Salazar', 'Financial Advisor, The HLA Group'
  UNION ALL SELECT 'Anthony Vito', 'Financial Advisor, The HLA Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 514) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 514 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 541, x.name, x.role FROM (
  SELECT 'Christopher Bilton, CIMA' AS name, 'Managing Director, Private Wealth Advisor, Paxinos, Lamberti & Associates' AS role
  UNION ALL SELECT 'Margaret M. Palace, CRPC', 'Private Wealth Relationship Manager, Paxinos, Lamberti & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 541) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 541 AND name = x.name);

-- ===== GROUP 143: UBS Private Wealth Management, Hallandale Beach, FL =====
-- 218 Nick Sadowsky, 793 Worth Boyce (Constellation Wealth Management)
UPDATE contacts SET
  address = '1010 South Federal Highway, Suite 2601',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-leads Constellation Wealth Management, UBS Hallandale Beach. Team named to Barron''s Top 250 Private Wealth Management Teams 2025/2026.')), 512)
WHERE id = 218;
UPDATE contacts SET
  address = '1010 South Federal Highway, Suite 2601',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, co-leader, Constellation Wealth Management, UBS Hallandale Beach, alongside id 218 Nick Sadowsky.')), 512)
WHERE id = 793;
INSERT INTO contact_people (contact_id, name, role)
SELECT 218, x.name, x.role FROM (
  SELECT 'Hank Boyce, CFA' AS name, 'Managing Director, Private Wealth Advisor, co-founder, Constellation Wealth Management (father of id 793 Worth Boyce)' AS role
  UNION ALL SELECT 'Missy Fierman', 'Managing Director-Wealth Management, Financial Advisor, Constellation Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 218) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 218 AND name = x.name);

-- ===== GROUP 144: Syon Capital, San Francisco, CA =====
-- 219 Ash Chopra (founder)
UPDATE contacts SET
  address = '555 Montgomery Street, Suite 1250',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Syon Capital, San Francisco (RIA launched Oct 2023 after 18 years at Merrill Lynch Private Wealth Management, where he was Managing Director). Firm named to Forbes'' Top RIA Firms 2025 list.')), 512)
WHERE id = 219;
INSERT INTO contact_people (contact_id, name, role)
SELECT 219, x.name, x.role FROM (
  SELECT 'Ryan E. Murray' AS name, 'Chief Relationship Officer, Syon Capital' AS role
  UNION ALL SELECT 'Mel Chang', 'Chief Operating Officer, Syon Capital'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 219) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 219 AND name = x.name);

-- ===== GROUP 145: Wealthspire Advisors, Melville, NY =====
-- 222 Frank Marzano
UPDATE contacts SET
  address = '400 Broadhollow Road, Suite 301',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealthspire Advisors, Melville NY (founded GM Advisory Group in 2004, acquired by Wealthspire 2023). Inducted into Barron''s Advisor Hall of Fame 2024.')), 512)
WHERE id = 222;
INSERT INTO contact_people (contact_id, name, role)
SELECT 222, x.name, x.role FROM (
  SELECT 'Christopher Castellano' AS name, 'Managing Director, Wealthspire Advisors (Melville)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 222) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 222 AND name = x.name);

-- ===== GROUP 146: UBS Private Wealth Management, Washington, DC — 202-585-4000 =====
-- 223,330,331,456,595,596,1009,1099,1164 — this CRM phone number spans 3 DC buildings
-- plus one Bethesda, MD office (456); each contact addressed to its own confirmed team.
UPDATE contacts SET
  address = '1501 K Street NW, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, member of New Columbia Advisors (joined 2024), UBS Washington DC.')), 512)
WHERE id = 223;
UPDATE contacts SET
  address = '1501 K Street NW, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, founding partner/team lead, The Capital ESOP Group, UBS Washington DC, alongside id 331 Nick Francia.')), 512)
WHERE id = 330;
UPDATE contacts SET
  address = '1501 K Street NW, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management (promoted 2021), partner, The Capital ESOP Group, UBS Washington DC, alongside id 330 Keith Apton.')), 512)
WHERE id = 331;
UPDATE contacts SET
  address = '7272 Wisconsin Avenue, 23rd Floor, Bethesda, MD 20814',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP, leads Marcus Partners. Note: this UBS practice is actually based in Bethesda, MD (not Washington DC as filed in the CRM), though it shares the (202) 585-4000 exchange with the DC-area UBS market.')), 512)
WHERE id = 456;
UPDATE contacts SET
  address = '1700 M Street NW, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP/CPWA, Atlas Wealth Management, UBS Washington DC.')), 512)
WHERE id = 595;
UPDATE contacts SET
  address = '1700 M Street NW, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, founder/Chief Investment Strategist, vL Associates (a.k.a. The von Lipsey Team), UBS Washington DC.')), 512)
WHERE id = 596;
UPDATE contacts SET
  address = '1700 M Street NW, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor (35+ yrs), leads Haffner Wealth Management Group, UBS Washington DC.')), 512)
WHERE id = 1009;
UPDATE contacts SET
  address = '1150 17th Street NW, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEPA/CIMA/CPWA, heads Finnerty Partners, UBS Washington DC.')), 512)
WHERE id = 1099;
UPDATE contacts SET
  address = '1501 K Street NW, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Group Managing Director-Wealth Management, CFP/CPWA, leads The Allred Wealth Consulting Group, UBS Washington DC.')), 512)
WHERE id = 1164;
INSERT INTO contact_people (contact_id, name, role)
SELECT 223, x.name, x.role FROM (
  SELECT 'James J. King' AS name, 'Team member, New Columbia Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 223) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 223 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1009, x.name, x.role FROM (
  SELECT 'Alex Haffner' AS name, 'Team member, Haffner Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1009) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1009 AND name = x.name);

-- ===== GROUP 147: Merrill Wealth Management, Newton, MA =====
-- 224 Carl Cafaro (The Cafaro Group)
UPDATE contacts SET
  address = '2221 Washington Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Managing Director, Merrill Newton MA; named Forbes America''s Top Wealth Advisors 2024/2025; team (The Cafaro Group) on Barron''s Top 250 Private Wealth Management Teams 2022-2025.')), 512)
WHERE id = 224;
INSERT INTO contact_people (contact_id, name, role)
SELECT 224, x.name, x.role FROM (
  SELECT 'Nicholas Cafaro' AS name, 'Senior Vice President, Senior Financial Advisor, The Cafaro Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 224) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 224 AND name = x.name);

-- ===== GROUP 148: UBS Private Wealth Management, Philadelphia, PA =====
-- 225 Bradford Bernstein (LongBernsteinGunderson — cross-references the Dallas team
-- led by Ryan Long, batch 6/id 175), 686 Michael Greenly (The Greenly Group, separate team)
UPDATE contacts SET
  address = '1735 Market Street, Mellon Bank Center',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP/CPWA/CIMA, UBS Philadelphia, leads LongBernsteinGunderson Wealth Management — same multi-city team led by Ryan Long (id 175, UBS Dallas, batch 6). #4 Forbes 2026 Best-In-State (PA); Barron''s Top 1,500 2026.')), 512)
WHERE id = 225;
UPDATE contacts SET
  address = '1735 Market Street, Mellon Bank Center',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, Private Wealth Advisor & Senior Portfolio Manager, leads The Greenly Group, UBS Philadelphia (separate team from id 225 Bradford Bernstein, sharing the same building).')), 512)
WHERE id = 686;

-- ===== GROUP 149: Wells Fargo Advisors, Beverly Hills, CA =====
-- 226 Philip Walters (individual), 288 Brian Firring (Firring Private Wealth Group)
UPDATE contacts SET
  address = '433 N. Camden Drive, 9th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Wells Fargo Advisors, Beverly Hills; operates individually with no listed team/associates.')), 512)
WHERE id = 226;
UPDATE contacts SET
  address = '433 N. Camden Drive, 12th Floor, Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Financial Advisor, Managing Director-Investments, leads the Firring Private Wealth Group, Wells Fargo Advisors, Beverly Hills (separate suite/floor from id 226 Philip Walters). #14 Forbes 2026 Best-In-State (CA); team manages ~$1.8B custodied assets.')), 512)
WHERE id = 288;
INSERT INTO contact_people (contact_id, name, role)
SELECT 288, x.name, x.role FROM (
  SELECT 'Linda Rasheed' AS name, 'Wealth Advisor, Managing Director, Firring Private Wealth Group' AS role
  UNION ALL SELECT 'Monika A. Orozco', 'Private Wealth Senior Registered Client Associate, VP, Firring Private Wealth Group'
  UNION ALL SELECT 'Tondalay N. George, CRPC', 'Private Wealth Senior Registered Client Associate, AVP, Firring Private Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 288) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 288 AND name = x.name);

-- ===== GROUP 150: UBS Private Wealth Management, Minneapolis, MN =====
-- 229 Chris Watkins — cross-referenced: same individual as the "Chris Watkins" named as a
-- teammate of contact 183 (Louis Close, batch 6/migration 065) on the Wayzata-based
-- Major Close Watkins Wealth Management Group; FINRA-registered branch is downtown Minneapolis.
UPDATE contacts SET
  address = '80 South 8th Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Christopher Ryan Watkins, co-lead, Major Close Watkins Wealth Management Group (client-facing presence in Wayzata, MN; FINRA-registered branch is this downtown Minneapolis UBS office). Cross-referenced with id 183 Louis Close (batch 6), the team''s other co-lead.')), 512)
WHERE id = 229;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Cross-reference update (batch 8): co-lead Chris Watkins is himself a separate CRM contact, id 229, FINRA-registered at UBS''s downtown Minneapolis branch (80 South 8th Street) rather than this Wayzata address.')), 512)
WHERE id = 183;

-- ===== GROUP 151: J.P. Morgan Wealth Management, Bellevue, WA =====
-- 231 Phil Scott (The Phil Scott Group), 715 Michael Hershey (The HHH Group) — two
-- distinct J.P. Morgan buildings, not one shared office.
UPDATE contacts SET
  address = '10885 NE 4th Street, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, leads The Phil Scott Group (~18 professionals), J.P. Morgan Wealth Management, Bellevue (Summit) WA. Prior career: 35 years at Merrill Lynch, then First Republic Private Wealth.')), 512)
WHERE id = 231;
UPDATE contacts SET
  address = '10500 NE 8th Street, Suite 825',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, leads The HHH Group, J.P. Morgan Wealth Management, Bellevue (Bellevue Place) WA (separate building from id 231 Phil Scott). Opened the Bellevue office in 2003 for a JPM predecessor firm; ~40 years in industry.')), 512)
WHERE id = 715;
INSERT INTO contact_people (contact_id, name, role)
SELECT 231, x.name, x.role FROM (
  SELECT 'John Schork' AS name, 'VP, Investment Associate, The Phil Scott Group' AS role
  UNION ALL SELECT 'Kimberly Scharff', 'Senior Client Associate, The Phil Scott Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 231) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 231 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 715, x.name, x.role FROM (
  SELECT 'Kent Huang' AS name, 'Executive Director, Wealth Advisor, The HHH Group' AS role
  UNION ALL SELECT 'Adam Handaly', 'Wealth Advisor, The HHH Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 715) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 715 AND name = x.name);

-- ===== GROUP 152: Merrill Private Wealth Management, Bloomfield Hills, MI =====
-- 232 Dana Locniskar (LPBNR Group), 853 Derek Ashcraft (AMDG Wealth Management) —
-- two separate teams sharing the same building.
UPDATE contacts SET
  address = '39577 Woodward Ave, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Locniskar Pursel Biddinger Nienberg Rochow Group, Merrill Bloomfield Hills MI. Forbes 2025 Top 250 Wealth Advisors.')), 512)
WHERE id = 232;
UPDATE contacts SET
  address = '39577 Woodward Ave, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, CIMA/CRPC, leads AMDG Wealth Management, Merrill Bloomfield Hills MI (separate team from id 232 Dana Locniskar, sharing the same building). #4 Michigan-Detroit Area (Private Wealth) Forbes Apr 2026.')), 512)
WHERE id = 853;
INSERT INTO contact_people (contact_id, name, role)
SELECT 232, x.name, x.role FROM (
  SELECT 'Thomas Pursel' AS name, 'Managing Director, LPBNR Group' AS role
  UNION ALL SELECT 'Matthew Biddinger', 'Senior VP, Private Wealth Advisor, LPBNR Group'
  UNION ALL SELECT 'Griffin Nienberg', 'Managing Director/Senior VP, Senior Financial Advisor, LPBNR Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 232) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 232 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 853, x.name, x.role FROM (
  SELECT 'Patrick Moran, CPWA' AS name, 'Senior VP, Wealth Management Advisor, AMDG Wealth Management' AS role
  UNION ALL SELECT 'David Geraghty', 'Senior VP, Senior Financial Advisor, AMDG Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 853) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 853 AND name = x.name);

-- ===== GROUP 153: Morgan Stanley Private Wealth Management, Scottsdale, AZ — 480-922-7818 =====
-- 233 Max Sanel, 234 Paul Groves (The One North Group)
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, The One North Group, Morgan Stanley PWM Scottsdale.')), 512)
WHERE id = 233;
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding partner, The One North Group, Morgan Stanley PWM Scottsdale. Barron''s Top 1,500 2016-2026; team #1 in Arizona on 2026 Forbes Best-In-State Wealth Management Teams.')), 512)
WHERE id = 234;
INSERT INTO contact_people (contact_id, name, role)
SELECT 234, x.name, x.role FROM (
  SELECT 'Eric Olson' AS name, 'Private Wealth Advisor, The One North Group' AS role
  UNION ALL SELECT 'Adam Degiorgio', 'PWM Group Director, The One North Group'
  UNION ALL SELECT 'Jeffrey Newman', 'Private Wealth Advisor, The One North Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 234) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 234 AND name = x.name);

-- ===== GROUP 154: Morgan Stanley Private Wealth Management, Palm Beach Gardens, FL =====
-- 235 Joseph Karas (The Karas Advisory Team), 696 Frank Seminara (The Seminara Group) —
-- registered addresses do not clearly match; treated as two distinct teams/offices.
UPDATE contacts SET
  address = '3801 PGA Boulevard, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Institutional Consulting Director, leads The Karas Advisory Team, Morgan Stanley PWM Palm Beach Gardens/New York NY. Forbes Best-In-State Wealth Advisor annually since 2018.')), 512)
WHERE id = 235;
UPDATE contacts SET
  address = '777 South Flagler Drive, Suite 700E, West Palm Beach, FL 33401',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Managing Director, Financial Advisor, leads The Seminara Group, Morgan Stanley PWM. Note: firm''s own team page lists "Morristown, NJ | Palm Beach Gardens, FL" but FINRA BrokerCheck registers this West Palm Beach address, distinct from id 235 Joseph Karas''s Palm Beach Gardens office.')), 512)
WHERE id = 696;
INSERT INTO contact_people (contact_id, name, role)
SELECT 235, x.name, x.role FROM (
  SELECT 'Andrew Karas' AS name, 'Vice President, Private Wealth Advisor, The Karas Advisory Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 235) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 235 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 696, x.name, x.role FROM (
  SELECT 'Jarett Greben' AS name, 'Registered Client Relationship Analyst, The Seminara Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 696) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 696 AND name = x.name);

-- ===== GROUP 155: Morgan Stanley | Graystone Consulting, Naples, FL =====
-- 236 Marc Fischer (The Fischer Group at Graystone Consulting — multi-office: Rochester
-- NY, Latham NY, Naples FL; team members below span all three, not Naples-exclusive)
UPDATE contacts SET
  address = '8889 Pelican Bay Blvd, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Institutional Consulting Director, Alternative Investments Director, founder/leader of The Fischer Group at Graystone Consulting (multi-office: Rochester NY, Latham NY, Naples FL). #20 Forbes 2025 Best-In-State; Barron''s Top 100 Institutional Consulting Teams 2025.')), 512)
WHERE id = 236;
INSERT INTO contact_people (contact_id, name, role)
SELECT 236, x.name, x.role FROM (
  SELECT 'Mark Caropreso' AS name, 'Team member, The Fischer Group (spans Rochester/Latham/Naples offices)' AS role
  UNION ALL SELECT 'Adam Brady', 'Team member, The Fischer Group (spans Rochester/Latham/Naples offices)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 236) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 236 AND name = x.name);

-- ===== GROUP 156: Creative Planning, Overland Park, KS (headquarters) =====
-- 237 Brenna Saunders, 240 Jessica Culpepper, 483 Jay Beebe, 751 Timothy Sutton —
-- four separate individual Wealth Managers/Partners at the firm's HQ, not one team.
UPDATE contacts SET
  address = '5454 W 110th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Manager, MBA, CFP, Creative Planning HQ, Overland Park KS. Barron''s Top 100 Women Advisors 2019-2025; #1 in Kansas (Barron''s Top 1200) 2023-2025.')), 512)
WHERE id = 237;
UPDATE contacts SET
  address = '5454 W 110th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner & Wealth Manager, Creative Planning family office team (UHNW clients), MBA/CPA/CFP, Overland Park KS HQ.')), 512)
WHERE id = 240;
UPDATE contacts SET
  address = '5454 W 110th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner and Wealth Manager, CFP, Creative Planning HQ, Overland Park KS (9 years with firm). Barron''s 2025 Top 100 Independent Advisors; #21 Forbes Best-In-State (KS) 2025.')), 512)
WHERE id = 483;
UPDATE contacts SET
  address = '5454 W 110th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Principal and Wealth Manager, CFP/AAMS, Creative Planning HQ, Overland Park KS (14 years with firm). Barron''s #1 Financial Advisor in Kansas 2019-2025.')), 512)
WHERE id = 751;

-- ===== GROUP 157: Morgan Stanley Private Wealth Management, Baltimore, MD =====
-- 239 Ted Smith (The CWS Group)
UPDATE contacts SET
  address = '650 South Exeter Street, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Edward W. "Ted" Smith, Managing Director, Private Wealth Management, Portfolio Manager, leads The CWS Group, Morgan Stanley PWM Baltimore (joined MS 2021, prior UBS/Deutsche Bank Alex. Brown). Barron''s Top 1,200/1,500 2019-2026; Forbes Best-In-State 2020/2023-2026.')), 512)
WHERE id = 239;
INSERT INTO contact_people (contact_id, name, role)
SELECT 239, x.name, x.role FROM (
  SELECT 'Ted Waters, CIMA' AS name, 'Private Wealth Advisor, The CWS Group' AS role
  UNION ALL SELECT 'Tim Schere', 'Private Wealth Advisor, The CWS Group'
  UNION ALL SELECT 'Kristin Carter', 'Portfolio Associate, The CWS Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 239) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 239 AND name = x.name);

-- ===== GROUP 158: Morgan Stanley Private Wealth Management, Scottsdale, AZ — 480-624-5714 =====
-- 241 Robert Bancroft (Bancroft Bleimeyer Sonder Group — same building as group 153, different phone)
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director, part of the Bancroft Bleimeyer Sonder Group, Morgan Stanley PWM Scottsdale (same building as ids 233/234''s One North Group, different CRM phone-group). Family Wealth Director certified, Chairman''s Club member.')), 512)
WHERE id = 241;
INSERT INTO contact_people (contact_id, name, role)
SELECT 241, x.name, x.role FROM (
  SELECT 'Jason Bleimeyer, CIMC, CIMA' AS name, 'Co-lead, Bancroft Bleimeyer Sonder Group' AS role
  UNION ALL SELECT 'Matthew Sonder, CFA', 'Co-lead, Bancroft Bleimeyer Sonder Group'
  UNION ALL SELECT 'Douglas Hodges, CIMA', 'Team member, Bancroft Bleimeyer Sonder Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 241) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 241 AND name = x.name);

-- ===== GROUP 159: Parcion Private Wealth, Bellevue, WA =====
-- 242 Terry Cook (founder)
UPDATE contacts SET
  address = '11980 NE 24th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Managing Principal, Parcion Private Wealth, Bellevue WA. #1 Washington (Forbes Best-In-State) and #3 Washington-Seattle Area (Private Wealth) Apr 2026.')), 512)
WHERE id = 242;
INSERT INTO contact_people (contact_id, name, role)
SELECT 242, x.name, x.role FROM (
  SELECT 'Dan McCollum' AS name, 'Chief Investment Officer, Parcion Private Wealth' AS role
  UNION ALL SELECT 'Kathleen Boyle, CFP', 'Principal and Director of Advisory, Parcion Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 242) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 242 AND name = x.name);

-- ===== GROUP 160: Merrill Private Wealth Management, Indianapolis, IN =====
-- 243 Martin Gregor (Gregor Private Wealth Group, founding partner)
UPDATE contacts SET
  address = '510 E. 96th Street, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founding partner, Gregor Private Wealth Group, Merrill Indianapolis. #1 Indianapolis financial advisor, Barron''s 2026 Top Financial Advisors.')), 512)
WHERE id = 243;
INSERT INTO contact_people (contact_id, name, role)
SELECT 243, x.name, x.role FROM (
  SELECT 'Conrad Gregor, CPFA' AS name, 'Private Wealth Advisor, Gregor Private Wealth Group' AS role
  UNION ALL SELECT 'Brian Schuman, CFP, CRPC', 'Senior VP, Wealth Management Advisor, Gregor Private Wealth Group'
  UNION ALL SELECT 'Ryan McCormack, CFP', 'Senior Financial Advisor, Gregor Private Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 243) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 243 AND name = x.name);
