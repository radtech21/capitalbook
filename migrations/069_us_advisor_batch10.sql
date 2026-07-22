-- US Financial Advisor enrichment, batch 10 (33 contacts / 20 groups).
--
-- Firm-change correction: 285 Bruce Munster departed Merrill Lynch on
-- Nov 14, 2025, moving his entire "Munster Freeman Group" (~$3B AUM,
-- per AdvisorHub/InvestmentNews/Financial Planning/LA Business Journal)
-- to Wells Fargo Advisors, Manhattan Beach, CA. His CRM record shared a
-- phone number with contact 300 (Mark Varo, Merrill Beverly Hills) —
-- confirmed these are two unrelated offices ~1-2 miles apart, not one
-- shared location.
--
-- Cross-reference confirmed: the Merrill Bloomfield Hills, MI group
-- below (248-593-4500) is the same building (39577 Woodward Ave) as
-- batch 8's Locniskar/Ashcraft group — now confirmed to house at least
-- 4 more separate teams (Vanerian, Stulberg Group, Spickler Wealth
-- Management Group, Post & Associates).

-- ===== GROUP 181: Merrill Private Wealth Management, New Orleans, LA =====
-- 271 Curtis Eustis (The Eustis Group)
UPDATE contacts SET
  address = '601 Poydras Street, 25th Floor, Suite 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founding member, Managing Director, Private Wealth Advisor, leads The Eustis Group, Merrill New Orleans. #1 Advisor in Louisiana, Forbes Best-in-State 2025 and Barron''s Top 1,200 2025.')), 512)
WHERE id = 271;
INSERT INTO contact_people (contact_id, name, role)
SELECT 271, x.name, x.role FROM (
  SELECT 'Marcus Courtney, CKP, CPFA' AS name, 'First Vice President, Wealth Management Advisor, The Eustis Group' AS role
  UNION ALL SELECT 'Travis Bonifacic, CEPA, CPWA, CRPC', 'First Vice President, Senior Financial Advisor, The Eustis Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 271) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 271 AND name = x.name);

-- ===== GROUP 182: Wescott Financial Advisory Group, Philadelphia, PA =====
-- 273 Grant Rawdin (Founder & CEO)
UPDATE contacts SET
  address = '30 South 17th Street, Floor 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and CEO, Wescott Financial Advisory Group, Philadelphia (founded 1987; fee-only RIA, ~$3.5-4B AUM).')), 512)
WHERE id = 273;
INSERT INTO contact_people (contact_id, name, role)
SELECT 273, x.name, x.role FROM (
  SELECT 'Carrie Delgott' AS name, 'President, COO & Chief Compliance Officer, Wescott Financial Advisory Group' AS role
  UNION ALL SELECT 'Sandra Goodstein', 'Managing Director and Senior Financial Advisor, Wescott Financial Advisory Group'
  UNION ALL SELECT 'Lydia Sheckels', 'Partner and CIO Emeritus, Wescott Financial Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 273) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 273 AND name = x.name);

-- ===== GROUP 183: Morgan Stanley Wealth Management, Greenwich, CT =====
-- 274 Harold Trischman (The 720 Wealth Management Group), 558 Peter Chieco + 692 Vincent
-- Mancuso (The Sound Shore Wealth Management Group, co-founders) — two separate teams
-- sharing the same branch/switchboard.
UPDATE contacts SET
  address = 'One Fawcett Place',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Family Wealth Director, leads The 720 Wealth Management Group, Morgan Stanley Greenwich (also has a Westport, CT satellite office). Barron''s Top 250 Private Wealth Management Team 2025.')), 512)
WHERE id = 274;
UPDATE contacts SET
  address = 'One Fawcett Place',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, CFP/CIMA/CDFA, Family Wealth Director & Lending Specialist, co-founder of The Sound Shore Wealth Management Group, Morgan Stanley Greenwich, alongside id 692 Vincent Mancuso.')), 512)
WHERE id = 558;
UPDATE contacts SET
  address = 'One Fawcett Place',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, CRPS, Senior Portfolio Management Director, co-founder of The Sound Shore Wealth Management Group, Morgan Stanley Greenwich, alongside id 558 Peter Chieco. Team named Barron''s Top 250 Private Wealth Management Team 2024-2026.')), 512)
WHERE id = 692;
INSERT INTO contact_people (contact_id, name, role)
SELECT 274, x.name, x.role FROM (
  SELECT 'Robert A. Franchini, CFP, ChFC, CRPC, CDFA' AS name, 'Team member, The 720 Wealth Management Group' AS role
  UNION ALL SELECT 'Joyce Goldfarb, CFP', 'Portfolio Management Director, The 720 Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 274) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 274 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 558, x.name, x.role FROM (
  SELECT 'Richard Lybarger' AS name, 'Team member, The Sound Shore Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 558) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 558 AND name = x.name);

-- ===== GROUP 184: Merrill Wealth Management, Bloomfield Hills, MI — 248-593-4500 =====
-- 275 Marie Vanerian, 609 Philip Appel, 641 Melissa Spickler, 781 Abraham Post — confirmed
-- same building (39577 Woodward Ave) as batch 8's Locniskar/Ashcraft group (id 232/853).
UPDATE contacts SET
  address = '39577 Woodward Ave, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, Merrill Bloomfield Hills MI (joined 1977, ~48 yrs); institutional/family-office consulting practice, no branded team name. Barron''s Hall of Fame; #25 Forbes Best-In-State 2025.')), 512)
WHERE id = 275;
UPDATE contacts SET
  address = '39577 Woodward Ave, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, part of The Stulberg Group, Merrill Bloomfield Hills MI; succeeded Robert Stulberg (retired 2016) as the team''s Barron''s-recognized advisor. #3 Best-In-State Wealth Management Team MI 2025, ~$3.9B AUM.')), 512)
WHERE id = 609;
UPDATE contacts SET
  address = '39577 Woodward Ave, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, founder of The Spickler Wealth Management Group, Merrill Bloomfield Hills MI (joined 1980, CRPC, ~$1.5B custodied assets). Barron''s 2024 Top 100 Women Advisors.')), 512)
WHERE id = 641;
UPDATE contacts SET
  address = '39577 Woodward Ave, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CRPC, leads Post & Associates, Merrill Bloomfield Hills MI (joined 1992); specializes in Retirement Benefit Consulting. Forbes Best-in-State 2025; Barron''s Top 1,200 2025.')), 512)
WHERE id = 781;
INSERT INTO contact_people (contact_id, name, role)
SELECT 641, x.name, x.role FROM (
  SELECT 'Matthew Spickler' AS name, 'Senior Financial Advisor/Partner (joined 2017), The Spickler Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 641) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 641 AND name = x.name);

-- ===== GROUP 185: Cooke Financial Group, Indianapolis, IN =====
-- 276 Chris Cooke, 277 Brian Cooke (Co-CEOs, cofounders of Sanctuary Wealth platform)
UPDATE contacts SET
  address = '9340 Priority Way West Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-CEO, Partner, Wealth Advisor, CIMA, Cooke Financial Group, Indianapolis; also cofounder of Sanctuary Wealth (an independent-advisor platform company). Forbes America''s Top 250 Wealth Advisors 2018-2026; Barron''s Top 1,500 Mar 2026.')), 512)
WHERE id = 276;
UPDATE contacts SET
  address = '9340 Priority Way West Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-CEO, Partner, Wealth Advisor, CIMA, Cooke Financial Group, Indianapolis, alongside id 276 Chris Cooke; also cofounder of Sanctuary Wealth. Same Forbes/Barron''s recognitions as id 276.')), 512)
WHERE id = 277;
INSERT INTO contact_people (contact_id, name, role)
SELECT 276, x.name, x.role FROM (
  SELECT 'Claire Cooke' AS name, 'Wealth Advisor, third-generation family member (joined Aug 2023), Cooke Financial Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 276) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 276 AND name = x.name);

-- ===== GROUP 186: Truist Investment Services, Winston-Salem, NC =====
-- 278 Brett Hoge (The Hoge-Barrett Group)
UPDATE contacts SET
  address = '110 South Stratford Rd., Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor / Senior Managing Director, Truist Investment Services, Winston-Salem; leads The Hoge-Barrett Group (with Truist/predecessor firm since 2008, 23+ years industry experience).')), 512)
WHERE id = 278;
INSERT INTO contact_people (contact_id, name, role)
SELECT 278, x.name, x.role FROM (
  SELECT 'Alex Barrett' AS name, 'Financial Advisor, The Hoge-Barrett Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 278) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 278 AND name = x.name);

-- ===== GROUP 187: RBC Wealth Management, Florham Park, NJ =====
-- 280 John Micera (The Micera-Kay Investment Group)
UPDATE contacts SET
  address = '200 Park Avenue, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name John P. Micera, Managing Director, Wealth Management Advisor, RBC Florham Park NJ (with firm since 2002); leads The Micera-Kay Investment Group.')), 512)
WHERE id = 280;
INSERT INTO contact_people (contact_id, name, role)
SELECT 280, x.name, x.role FROM (
  SELECT 'Joseph Kay' AS name, 'Co-lead, Managing Director, The Micera-Kay Investment Group' AS role
  UNION ALL SELECT 'Christian Friday, CFP, CIMA', 'Associate Financial Advisor, The Micera-Kay Investment Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 280) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 280 AND name = x.name);

-- ===== GROUP 188: Merrill Private Wealth Management, Louisville, KY — 502-585-4300 =====
-- 281 Lawrence Nagel (Kelly Nagel Group)
UPDATE contacts SET
  address = '101 Bullitt Lane, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Lawrence J. Nagel, Managing Director, Private Wealth Advisor, Merrill Louisville KY (joined 2001); part of the Kelly Nagel Group.')), 512)
WHERE id = 281;
INSERT INTO contact_people (contact_id, name, role)
SELECT 281, x.name, x.role FROM (
  SELECT 'Scott A. Kelly' AS name, 'Managing Director, Private Wealth Advisor, co-lead, Kelly Nagel Group' AS role
  UNION ALL SELECT 'Josh Nagel, CIMA', 'Financial Advisor/Institutional Consultant, Kelly Nagel Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 281) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 281 AND name = x.name);

-- ===== GROUP 189: Merrill Private Wealth Management, LA/Beverly Hills, CA — 310-407-3930 =====
-- 285 Bruce Munster (DEPARTED to Wells Fargo), 300 Mark Varo (The RVR Group) — this exact
-- CRM phone number/two-city record turned out to be two unrelated offices ~1-2 miles apart.
UPDATE contacts SET
  firm = 'Wells Fargo Advisors',
  title = 'Managing Director/Principal',
  city = 'Manhattan Beach',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed Merrill Lynch/Merrill Private Wealth Management on Nov 14, 2025, moving his entire team (the Munster Freeman Group — Bruce Munster, son Samuel Munster, and David Freeman) to Wells Fargo Advisors, now based in Manhattan Beach, CA (with satellite offices in Scottsdale, AZ and Cherry Creek, CO). ~$3B AUM team; move corroborated by AdvisorHub, InvestmentNews, Financial Planning, and LA Business Journal (all Nov 2025). CRM previously listed him at Merrill''s Century City office (2049 Century Park East, 11th Floor) sharing a phone number with an unrelated Beverly Hills contact (id 300 Mark Varo) — confirmed these were two different offices, not one shared location.')), 512)
WHERE id = 285;
UPDATE contacts SET
  address = '9595 Wilshire Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, part of The RVR Group (led by Rebecca Rothstein), Merrill Beverly Hills. Note: this office is distinct from id 285 Bruce Munster''s former Century City office, despite sharing the same CRM phone number — id 285 has since departed Merrill entirely.')), 512)
WHERE id = 300;
INSERT INTO contact_people (contact_id, name, role)
SELECT 285, x.name, x.role FROM (
  SELECT 'Samuel Munster' AS name, 'Advisor (Bruce''s son), Munster Freeman Group, Wells Fargo Advisors' AS role
  UNION ALL SELECT 'David Freeman', 'Principal, Munster Freeman Group, Wells Fargo Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 285) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 285 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 300, x.name, x.role FROM (
  SELECT 'Rebecca Rothstein' AS name, 'Private Wealth Advisor, team lead, The RVR Group' AS role
  UNION ALL SELECT 'Evan Rothstein', 'Senior Financial Advisor, The RVR Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 300) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 300 AND name = x.name);

-- ===== GROUP 190: Morgan Stanley Wealth Management, Colchester, VT =====
-- 286 Tim Stotz, 653 Christopher Dubie, 878 Brian Pelkey — three separate teams sharing
-- the same branch/switchboard.
UPDATE contacts SET
  address = '105 West View Rd, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director, Senior Portfolio Management Director, leads The Stotz Broscious Group, Morgan Stanley Colchester VT. #1 in Vermont, Forbes Apr 2025.')), 512)
WHERE id = 286;
UPDATE contacts SET
  address = '105 West View Rd, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Corporate Retirement Director, leads a retirement-plan-focused team, currently branded The Braun-Dubie Group (formerly The Dubie Group), Morgan Stanley Colchester VT. Barron''s Top 1,200 (VT) 2024-2025.')), 512)
WHERE id = 653;
UPDATE contacts SET
  address = '105 West View Rd, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Senior Investment Management Consultant, leads The Pelkey Dannies Group, Morgan Stanley Colchester VT (40+ years experience). #5 Forbes 2026 Best-In-State VT; Barron''s Top VT advisor 10+ consecutive years.')), 512)
WHERE id = 878;
INSERT INTO contact_people (contact_id, name, role)
SELECT 286, x.name, x.role FROM (
  SELECT 'John Broscious' AS name, 'Financial Advisor, Senior Portfolio Management Director, The Stotz Broscious Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 286) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 286 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 653, x.name, x.role FROM (
  SELECT 'Julie Braun' AS name, 'Senior VP, Financial Advisor, Corporate Retirement Director, The Braun-Dubie Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 653) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 653 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 878, x.name, x.role FROM (
  SELECT 'Jeff Dannies' AS name, 'Financial Advisor, The Pelkey Dannies Group' AS role
  UNION ALL SELECT 'Meg Pelkey', 'Financial Advisor, The Pelkey Dannies Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 878) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 878 AND name = x.name);

-- ===== GROUP 191: Morgan Stanley Wealth Management, Honolulu, HI =====
-- 289 Wang Kar Lee, 632 James Bennett (The Ehrman Lee Bennett Ching Group)
UPDATE contacts SET
  address = '733 Bishop Street, Suite 2800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Director, Financial Advisor, part of The Ehrman Lee Bennett Ching Group, Morgan Stanley Honolulu. Barron''s Top 1,200 2022-2024; Forbes Best-in-State since 2019.')), 512)
WHERE id = 289;
UPDATE contacts SET
  address = '733 Bishop Street, Suite 2800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Jimmy Bennett," Financial Advisor, CFP, The Ehrman Lee Bennett Ching Group, Morgan Stanley Honolulu, alongside id 289 Wang Kar Lee. #10 Forbes 2026 Best-In-State.')), 512)
WHERE id = 632;
INSERT INTO contact_people (contact_id, name, role)
SELECT 289, x.name, x.role FROM (
  SELECT 'Peter Ehrman' AS name, 'Financial Advisor, The Ehrman Lee Bennett Ching Group' AS role
  UNION ALL SELECT 'David Ching, CFP', 'Financial Advisor, The Ehrman Lee Bennett Ching Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 289) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 289 AND name = x.name);

-- ===== GROUP 192: McPeak Wealth Mgmt | Wells Fargo Advisors FiNet, Linwood, NJ =====
-- 290 Neil McPeak (President and Founding Partner)
UPDATE contacts SET
  address = '1201 New Road, Suite 207',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Neil (Cornelius) McPeak Sr., President and Founding Partner, Managing Director of Investments, McPeak Wealth Management, Wells Fargo Advisors Financial Network, Linwood NJ (joined 2002, 40+ yrs industry). #4 Barron''s Top 1200 NJ 2025; ~$900M+ AUM.')), 512)
WHERE id = 290;
INSERT INTO contact_people (contact_id, name, role)
SELECT 290, x.name, x.role FROM (
  SELECT 'Neil (Cornelius) McPeak Jr., CFP' AS name, 'Managing Partner/Financial Advisor (joined 2010), McPeak Wealth Management' AS role
  UNION ALL SELECT 'Kyle Roffina, CFP, CEPA', 'Financial Advisor, McPeak Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 290) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 290 AND name = x.name);

-- ===== GROUP 193: Gottfried & Somberg Wealth Management, Glastonbury, CT =====
-- 291 Matthew Somberg (Co-Founder and Principal)
UPDATE contacts SET
  address = '340 Hebron Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder and Principal, AIF, Gottfried & Somberg Wealth Management, Glastonbury CT. #2 Forbes 2026 Best-In-State CT.')), 512)
WHERE id = 291;
INSERT INTO contact_people (contact_id, name, role)
SELECT 291, x.name, x.role FROM (
  SELECT 'Josh Gottfried' AS name, 'Co-Founder/Principal, Gottfried & Somberg Wealth Management' AS role
  UNION ALL SELECT 'Barbara Taylor', 'Advisor/Principal, Gottfried & Somberg Wealth Management'
  UNION ALL SELECT 'Terran Titus', 'Advisor/Principal, Gottfried & Somberg Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 291) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 291 AND name = x.name);

-- ===== GROUP 194: Morgan Stanley Wealth Management, Louisville, KY — 502-562-2600 =====
-- 292 Thomas Perrone (Perrone Wealth Management Group, founder)
UPDATE contacts SET
  address = '4969 US Highway 42, Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor, founder of the Perrone Wealth Management Group, Morgan Stanley Louisville KY. Barron''s Top 1,500 2026; #7 Forbes Kentucky Apr 2026.')), 512)
WHERE id = 292;
INSERT INTO contact_people (contact_id, name, role)
SELECT 292, x.name, x.role FROM (
  SELECT 'Heather Thompson' AS name, 'First Vice President, Group Director, Perrone Wealth Management Group' AS role
  UNION ALL SELECT 'Todd Twyman, CFP', 'Financial Advisor, Perrone Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 292) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 292 AND name = x.name);

-- ===== GROUP 195: J.P. Morgan Wealth Management, Atlanta, GA =====
-- 302 Brian Jenkins (Jenkins | Podkulski | Alison ESOP Advisory Group)
UPDATE contacts SET
  address = '3424 Peachtree Road NE, Suite 1700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Brian G. Jenkins, Managing Director / Wealth Partner, J.P. Morgan Atlanta (joined 2011); part of The Jenkins | Podkulski | Alison ESOP Advisory Group. Barron''s Top 1,200 Financial Advisors 2025.')), 512)
WHERE id = 302;
INSERT INTO contact_people (contact_id, name, role)
SELECT 302, x.name, x.role FROM (
  SELECT 'Michael G. Podkulski' AS name, 'Managing Director / Wealth Partner, Jenkins | Podkulski | Alison ESOP Advisory Group' AS role
  UNION ALL SELECT 'Brett T. Alison', 'Wealth Advisor, Jenkins | Podkulski | Alison ESOP Advisory Group'
  UNION ALL SELECT 'Jim Hilderbrandt', 'Executive Director / Wealth Advisor, Jenkins | Podkulski | Alison ESOP Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 302) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 302 AND name = x.name);

-- ===== GROUP 196: Summit Trail Advisors, San Francisco, CA =====
-- 304 Tom Palecek (Founding/Co-Founding Partner)
UPDATE contacts SET
  address = '44 Montgomery Street, Suite 3060',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding/Co-Founding Partner and Advisor, Summit Trail Advisors, San Francisco. Barron''s Top 1,500 Financial Advisors by State (#16); active San Francisco Estate Planning Council member. No SF-based colleagues confirmed.')), 512)
WHERE id = 304;

-- ===== GROUP 197: UBS Private Wealth Management, Houston, TX — 713-650-5000 =====
-- 306 Langston Turner, 532 Barry Young, 533 Brian Sauer, 547 Mark Elias, 812 William
-- Huthnance — this CRM phone number is a shared/legacy building line spanning 4 separate
-- teams at 4400 Post Oak Parkway (same pattern as UBS Dallas).
UPDATE contacts SET
  address = '4400 Post Oak Parkway, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Chief Investment Officer, leads Turner, Hogan, Allen Wealth Management, UBS Houston. Barron''s Top 1,200 2019-2025; team on Barron''s Top 250 Teams 2025.')), 512)
WHERE id = 306;
UPDATE contacts SET
  address = '4400 Post Oak Parkway, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Young Lockwood Sauer Wealth Management, UBS Houston, alongside id 533 Brian Sauer. Barron''s Top 250 Teams 2025/2026; Forbes Best-In-State Teams 2026.')), 512)
WHERE id = 532;
UPDATE contacts SET
  address = '4400 Post Oak Parkway, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, Family Office Consultant, Financial Advisor, Young Lockwood Sauer Wealth Management, UBS Houston, alongside id 532 Barry Young. Barron''s Top 1,200 2022.')), 512)
WHERE id = 533;
UPDATE contacts SET
  address = '4400 Post Oak Parkway, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, leads Elias, Charles, Sharpe Private Wealth (formerly "Elias/Charles Wealth Management"), UBS Houston. Barron''s Top 1,200 annually 2014-2025; Forbes Best-in-State Teams 2026.')), 512)
WHERE id = 547;
UPDATE contacts SET
  address = '4400 Post Oak Parkway, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name William Huthnance, Founding Partner, Black Huthnance Team, UBS Houston. #8 Forbes Best-In-State Wealth Advisors 2026.')), 512)
WHERE id = 812;
INSERT INTO contact_people (contact_id, name, role)
SELECT 306, x.name, x.role FROM (
  SELECT 'Frank Hogan' AS name, 'Managing Director, Turner, Hogan, Allen Wealth Management' AS role
  UNION ALL SELECT 'Daryl Allen', 'Managing Director, Turner, Hogan, Allen Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 306) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 306 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 532, x.name, x.role FROM (
  SELECT 'Liz Lockwood' AS name, 'Advisor/Partner, Young Lockwood Sauer Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 532) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 532 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 547, x.name, x.role FROM (
  SELECT 'Bryan L. Charles, CPWA, CEPA' AS name, 'Senior Advisor, Elias, Charles, Sharpe Private Wealth' AS role
  UNION ALL SELECT 'B. Wynne Sharpe, CEPA', 'Advisor, Elias, Charles, Sharpe Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 547) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 547 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 812, x.name, x.role FROM (
  SELECT 'Chris Black' AS name, 'Founding Partner, Black Huthnance Team' AS role
  UNION ALL SELECT 'Rachel Nolan', 'Investment Analysis/Client Relations, Black Huthnance Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 812) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 812 AND name = x.name);

-- ===== GROUP 198: Merrill Private Wealth Management, Coral Gables, FL =====
-- 310 Michael Beckerman (Chiavacci Beckerman Group)
UPDATE contacts SET
  address = '355 Alhambra Circle, Floor 16',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President / Private Wealth Manager, Chiavacci Beckerman Group, Merrill Coral Gables (with firm since 1999). #174 Forbes 2026 America''s Top Wealth Advisors.')), 512)
WHERE id = 310;
INSERT INTO contact_people (contact_id, name, role)
SELECT 310, x.name, x.role FROM (
  SELECT 'Louis J. Chiavacci' AS name, 'Managing Director, International Private Wealth Advisor, co-lead, Chiavacci Beckerman Group' AS role
  UNION ALL SELECT 'David Chiavacci', 'Senior Vice President, Private Wealth Advisor, Chiavacci Beckerman Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 310) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 310 AND name = x.name);

-- ===== GROUP 199: Morgan Stanley Private Wealth Management, Stamford, CT =====
-- 312 John Goodwin (Goodwin Wall Tung O'Bradaigh Garzarella Group)
UPDATE contacts SET
  address = '4 Landmark Square, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director / Private Wealth Advisor, Morgan Stanley (joined 1998); part of the Goodwin Wall Tung O''Bradaigh Garzarella Group. #18 Forbes 2026 Connecticut Best-In-State. Note: team''s own marketing page lists New York, NY as its public hub, though his individual FINRA registration is this Stamford address.')), 512)
WHERE id = 312;
INSERT INTO contact_people (contact_id, name, role)
SELECT 312, x.name, x.role FROM (
  SELECT 'Patrick Wall' AS name, 'Managing Director, Private Wealth Advisor/International Client Advisor, Goodwin Wall Tung O''Bradaigh Garzarella Group' AS role
  UNION ALL SELECT 'Steve Tung', 'Family Wealth Director, Goodwin Wall Tung O''Bradaigh Garzarella Group'
  UNION ALL SELECT 'Sascha Garzarella, ChFC', 'Wealth Planning / Team COO, Goodwin Wall Tung O''Bradaigh Garzarella Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 312) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 312 AND name = x.name);
