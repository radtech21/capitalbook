-- US Financial Advisor enrichment, batch 14 (21 contacts / 20 groups).
--
-- One phone-number data error corrected: 396 Camper O'Neal's CRM phone
-- (480) is a Phoenix/Scottsdale, AZ area code with no connection to his
-- Birmingham, AL office — same pattern as prior out-of-region errors.
--
-- Cross-reference confirmed: 425 Michael Hudak (Merrill Phoenix) is the
-- same person named as a team member of the Wright Hudak Zabel Group in
-- contact 335's record (David Wright, Merrill Chicago, batch 8) — he is
-- himself a separate CRM contact who splits time between the group's
-- Chicago HQ and this Phoenix office.

-- ===== GROUP 261: Merrill Wealth Management, Birmingham, AL — 480-368-6565 =====
-- 396 Camper O'Neal (O'Neal Wealth Management Group)
UPDATE contacts SET
  address = '569 Brookwood Village',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (480) 368-6565 is a Phoenix/Scottsdale, AZ area code with no connection to this Birmingham, AL office; correct number is (205) 326-9574. Confirmed current — Wealth Management Advisor/Managing Director, leads the O''Neal (O''Neal-Collier) Wealth Management Group. #4 Forbes 2026 Best-In-State Alabama.')), 512)
WHERE id = 396;
INSERT INTO contact_people (contact_id, name, role)
SELECT 396, x.name, x.role FROM (
  SELECT 'Mary (Lindy) Goldschmidt Wheeler' AS name, 'Financial Advisor, O''Neal Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 396) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 396 AND name = x.name);

-- ===== GROUP 262: UBS Wealth Management, Anchorage, AK =====
-- 397 Tammy Head (The Frontier Group)
UPDATE contacts SET
  address = '3000 A Street, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Manager/Senior Institutional Consultant, CIMA/ChFC/CLU/CRPS, UBS Anchorage, member of UBS Wealth Management Director''s Council; team known as The Frontier Group. Barron''s Top 1,500 2026; Forbes Best-in-State 2024-2026.')), 512)
WHERE id = 397;
INSERT INTO contact_people (contact_id, name, role)
SELECT 397, x.name, x.role FROM (
  SELECT 'Jeffrey Head' AS name, 'Branch Manager/Financial Advisor, The Frontier Group' AS role
  UNION ALL SELECT 'Kyle Head', 'Team member, The Frontier Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 397) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 397 AND name = x.name);

-- ===== GROUP 263: Pathstone, Austin, TX =====
-- 404 Eric Price (Executive Managing Director, following Price Wealth LLC acquisition)
UPDATE contacts SET
  address = '500 West 5th Street, Suite 1105',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Managing Director, Pathstone Austin, following Pathstone''s acquisition of his firm Price Wealth LLC ($1.4B AUM, founded 2004). No named colleagues confirmed for the Austin office.')), 512)
WHERE id = 404;

-- ===== GROUP 264: Cresset, Chicago, IL =====
-- 405 W Janet Dougherty, 536 Christopher DeMonte
UPDATE contacts SET
  address = '444 West Lake Street, Suite 4700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Partner, Wealth Advisor, CFA, Cresset Chicago. Named to 2025 Barron''s Top Women Financial Advisors and Barron''s Top 1,200.')), 512)
WHERE id = 405;
UPDATE contacts SET
  address = '444 West Lake Street, Suite 4700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner, Managing Director, Wealth Advisor, CFA, Cresset Chicago, member of Cresset''s executive committee. #29 Illinois, Barron''s Top 100 Independent Financial Advisors 2026.')), 512)
WHERE id = 536;
INSERT INTO contact_people (contact_id, name, role)
SELECT 405, x.name, x.role FROM (
  SELECT 'Kimberly DuBord' AS name, 'Wealth Advisor, Partner & Managing Director, Cresset Chicago' AS role
  UNION ALL SELECT 'Douglas P. Regan', 'Founding Partner & Co-Chairman, Cresset'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 405) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 405 AND name = x.name);

-- ===== GROUP 265: Merrill Private Wealth Management, Newport Beach, CA =====
-- 410 Justin Vaicek (Blanchfield Vaicek Group)
UPDATE contacts SET
  address = '520 Newport Center Dr, PBIG - Fashion Island',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Manager, Merrill Newport Beach, part of the Blanchfield Vaicek Group. Forbes Best-in-State Wealth Management Team 2025; #10 Forbes Best-In-State CA-Southern 2025.')), 512)
WHERE id = 410;
INSERT INTO contact_people (contact_id, name, role)
SELECT 410, x.name, x.role FROM (
  SELECT 'Tom Blanchfield' AS name, 'Managing Director, co-lead, Blanchfield Vaicek Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 410) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 410 AND name = x.name);

-- ===== GROUP 266: Morgan Stanley Private Wealth Management, West Conshohocken, PA =====
-- 411 Richard Corcoran (The Corcoran Ciarelli Group)
UPDATE contacts SET
  address = '100 Front Street, Suite 600 (One Tower Bridge)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, cofounder of The Corcoran Ciarelli Group, Morgan Stanley West Conshohocken PA. #3 Forbes Best-in-State PA-East Private Wealth teams Jan 2026; individually #11 PA-Philadelphia Area Apr 2026.')), 512)
WHERE id = 411;
INSERT INTO contact_people (contact_id, name, role)
SELECT 411, x.name, x.role FROM (
  SELECT 'Brett J. Ciarelli' AS name, 'Executive Director, cofounder, The Corcoran Ciarelli Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 411) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 411 AND name = x.name);

-- ===== GROUP 267: Morgan Stanley Private Wealth Management, Naples, FL =====
-- 413 Kevin Johnson (Naples PWM Group, founding partner)
UPDATE contacts SET
  address = '8889 Pelican Bay Blvd, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Executive Director, Private Wealth Advisor, founding partner of Naples PWM Group, Morgan Stanley Naples FL. Barron''s Top 1,200 2017-2025; Forbes Best-In-State 2022-2025; Financial Times Top Advisor 2016.')), 512)
WHERE id = 413;
INSERT INTO contact_people (contact_id, name, role)
SELECT 413, x.name, x.role FROM (
  SELECT 'Tate Haire' AS name, 'Senior VP, Family Wealth Director, Naples PWM Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 413) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 413 AND name = x.name);

-- ===== GROUP 268: Merrill Wealth Management, Philadelphia, PA =====
-- 414 David Ebner
UPDATE contacts SET
  address = '1600 John F. Kennedy Blvd, 7th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, Merrill Philadelphia. No named team members found.')), 512)
WHERE id = 414;

-- ===== GROUP 269: UBS Private Wealth Management, Ponte Vedra Beach, FL =====
-- 415 Christopher Aitken (Aitken & Associates / Aitken Private Wealth)
UPDATE contacts SET
  address = '816 Highway A1A North, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, UBS Ponte Vedra Beach FL, leads Aitken & Associates (branded Aitken Private Wealth); joined UBS May 2017 from Merrill Lynch Private Bank & Investments Group. #1 Florida Forbes Best-In-State Apr 2025; ~$1.5B AUM.')), 512)
WHERE id = 415;
INSERT INTO contact_people (contact_id, name, role)
SELECT 415, x.name, x.role FROM (
  SELECT 'Shelby Tensfeldt' AS name, 'Team Business Manager, Aitken & Associates' AS role
  UNION ALL SELECT 'David Ly', 'Senior Financial Analyst (joined 2013), Aitken & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 415) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 415 AND name = x.name);

-- ===== GROUP 270: Merrill Private Wealth Management, Virginia Beach, VA =====
-- 416 James Somers (The Somers Group)
UPDATE contacts SET
  address = '208 Golden Oak Court, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CPWA, leads The Somers Group, Merrill Virginia Beach. #7 Virginia-South Forbes Jan 2026; named 2026 Virginia Business Forty Under 40.')), 512)
WHERE id = 416;
INSERT INTO contact_people (contact_id, name, role)
SELECT 416, x.name, x.role FROM (
  SELECT 'John Noonan, CFP, CPFA, CPWA, CRPC, SE-AWMA' AS name, 'Senior Vice President, Private Wealth Advisor, The Somers Group' AS role
  UNION ALL SELECT 'Travis Jones, CFP', 'Senior Vice President, Wealth Management Advisor, The Somers Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 416) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 416 AND name = x.name);

-- ===== GROUP 271: Ameriprise Financial, Bismarck, ND =====
-- 417 Joel Bird (Legacy Financial Partners, CEO)
UPDATE contacts SET
  address = '125 Buckskin Ave, Ste 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO/Private Wealth Advisor, CEO of Legacy Financial Partners, Ameriprise Bismarck ND. #210 Forbes America''s Top Wealth Advisors 2025; #2 Best-In-State ND 2025.')), 512)
WHERE id = 417;
INSERT INTO contact_people (contact_id, name, role)
SELECT 417, x.name, x.role FROM (
  SELECT 'Jason Bedford, CFP' AS name, 'Team member, Legacy Financial Partners' AS role
  UNION ALL SELECT 'Pattie J. Wilber, CFP', 'Team member, Legacy Financial Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 417) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 417 AND name = x.name);

-- ===== GROUP 272: Ameriprise Financial, Auburndale, MA =====
-- 420 Daniel Wilson (Skyeburst Wealth Management)
UPDATE contacts SET
  address = '275 Grove St, Ste 1W-305',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Daniel T. Wilson, CFP/ChFC/CLU, Private Wealth Advisor, Skyeburst Wealth Management (Ameriprise), Auburndale MA (in industry since 1997; also has a Westborough, MA office). Barron''s Top 1,200.')), 512)
WHERE id = 420;
INSERT INTO contact_people (contact_id, name, role)
SELECT 420, x.name, x.role FROM (
  SELECT 'Jacqueline Blau' AS name, 'Private Wealth Advisor, Skyeburst Wealth Management' AS role
  UNION ALL SELECT 'Andrew Enright', 'Financial Advisor, Skyeburst Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 420) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 420 AND name = x.name);

-- ===== GROUP 273: Westmount Partners, Los Angeles, CA =====
-- 421 Jim Berliner (Co-Founder and Chairman)
UPDATE contacts SET
  address = '2049 Century Park East, Suite 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder and Chairman, Westmount Partners, Los Angeles (founded 1990 with his father Bob Berliner). Barron''s and Worth Top 100 Advisors; LA Business Journal Leaders of Influence: Wealth Managers 2025.')), 512)
WHERE id = 421;
INSERT INTO contact_people (contact_id, name, role)
SELECT 421, x.name, x.role FROM (
  SELECT 'Mike Amash' AS name, 'President, Westmount Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 421) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 421 AND name = x.name);

-- ===== GROUP 274: Morgan Stanley Private Wealth Management, Menlo Park, CA =====
-- 423 Dana Jackson (Jackson Capital Group)
UPDATE contacts SET
  address = '2725 Sand Hill Road, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads Jackson Capital Group, Morgan Stanley Menlo Park. 2026 Forbes Best-In-State Wealth Management Team; Barron''s Top 1,200 2025.')), 512)
WHERE id = 423;
INSERT INTO contact_people (contact_id, name, role)
SELECT 423, x.name, x.role FROM (
  SELECT 'Deke Jackson' AS name, 'First Vice President, Private Wealth Advisor & Family Wealth Director, Jackson Capital Group' AS role
  UNION ALL SELECT 'Andy Lee, CFA', 'Team member, Jackson Capital Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 423) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 423 AND name = x.name);

-- ===== GROUP 275: J.P. Morgan Wealth Management, Los Angeles, CA =====
-- 424 Tracey Gluck (The Gluck Group, founder)
UPDATE contacts SET
  address = '2029 Century Park East, Suite 3700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Wealth Partner, founder of The Gluck Group, J.P. Morgan Los Angeles (Century City). #19 Forbes 2026 top women wealth advisors list.')), 512)
WHERE id = 424;
INSERT INTO contact_people (contact_id, name, role)
SELECT 424, x.name, x.role FROM (
  SELECT 'Lisa Masters' AS name, 'Vice President, Investment Associate, The Gluck Group' AS role
  UNION ALL SELECT 'Sarah Wieczorek', 'Client Associate, The Gluck Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 424) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 424 AND name = x.name);

-- ===== GROUP 276: Merrill Private Wealth Management, Phoenix, AZ =====
-- 425 Michael Hudak — cross-referenced with contact 335 (David Wright, batch 8), the same
-- Wright Hudak Zabel Group; Hudak splits time between the group's Chicago HQ and Phoenix.
UPDATE contacts SET
  address = '2555 E Camelback Rd, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Michael J. Hudak, Managing Director, Private Wealth Advisor, Wright Hudak Zabel Group, Merrill (splits time between the group''s Chicago HQ and this Phoenix office). Cross-referenced: same team as id 335 David Wright (batch 8, Merrill Chicago). #39 Forbes 2026 Arizona-Phoenix Best-In-State; Barron''s Top 1,200 2009-2025.')), 512)
WHERE id = 425;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Cross-reference update (batch 14): teammate Michael Hudak is himself a separate CRM contact, id 425, filed under Merrill Phoenix (2555 E Camelback Rd, Suite 900), though the Wright Hudak Zabel Group is headquartered in Chicago.')), 512)
WHERE id = 335;
INSERT INTO contact_people (contact_id, name, role)
SELECT 425, x.name, x.role FROM (
  SELECT 'David Wright' AS name, 'Private Wealth Advisor, Wright Hudak Zabel Group (Chicago-based, cross-referenced as CRM id 335)' AS role
  UNION ALL SELECT 'Robert P. "Bob" Zabel', 'Managing Director, Private Wealth Advisor, Wright Hudak Zabel Group (Chicago-based)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 425) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 425 AND name = x.name);

-- ===== GROUP 277: UBS Wealth Management, Buffalo, NY =====
-- 427 Christopher Malof (The Arthurs Malof Group)
UPDATE contacts SET
  address = '250 Delaware Avenue, Suite 610',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, senior advisor, The Arthurs Malof Group, UBS Buffalo (team formed 1996). #2 New York State Private Wealth, Barron''s/Forbes Apr 2026; UBS Wealth Management Pinnacle Council 2024. Team consults on $4B+ in client assets.')), 512)
WHERE id = 427;
INSERT INTO contact_people (contact_id, name, role)
SELECT 427, x.name, x.role FROM (
  SELECT 'Glenn Arthurs' AS name, 'Managing Director/co-founder, The Arthurs Malof Group' AS role
  UNION ALL SELECT 'Wyatt Arthurs, CFP, CPWA, CRPS, CEPA', 'Retirement Plan Consultant, The Arthurs Malof Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 427) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 427 AND name = x.name);

-- ===== GROUP 278: Morgan Stanley Wealth Management, Miami, FL =====
-- 429 John Elwaw (The Elwaw/Cavalieri Group, founding partner)
UPDATE contacts SET
  address = '1111 Brickell Avenue, Suite 1400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFA, founding partner of The Elwaw/Cavalieri Group, Morgan Stanley Miami (30-year career; Chairman''s Club since 1999). Barron''s Top 1,200 2015-2024; Forbes Best-in-State FL 2019-2023.')), 512)
WHERE id = 429;
INSERT INTO contact_people (contact_id, name, role)
SELECT 429, x.name, x.role FROM (
  SELECT 'Matias Cavalieri' AS name, 'Co-lead (joined 1999), The Elwaw/Cavalieri Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 429) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 429 AND name = x.name);

-- ===== GROUP 279: J.P. Morgan Wealth Management, Washington, DC =====
-- 430 Rick Schultz (The Washingtonian Group, moved from UBS in 2019)
UPDATE contacts SET
  address = '875 15th Street NW, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Frederick "Rick" Schultz, Managing Director and Wealth Partner, leads The Washingtonian Group, J.P. Morgan Washington DC (team moved from UBS in 2019). Certified Private Wealth Advisor, CIMA, CEPA. #9 in state, Barron''s Top 1,500.')), 512)
WHERE id = 430;
INSERT INTO contact_people (contact_id, name, role)
SELECT 430, x.name, x.role FROM (
  SELECT 'Eric Teichberg' AS name, 'Wealth Partner/Managing Director, Financial Advisor, The Washingtonian Group' AS role
  UNION ALL SELECT 'Kennan Low', 'Wealth Partner, The Washingtonian Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 430) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 430 AND name = x.name);

-- ===== GROUP 280: UBS Wealth Management, Rochester, NY =====
-- 432 William Schoff (The Schoff Group, senior member/founder)
UPDATE contacts SET
  address = '400 Linden Oaks, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Bill" Schoff, senior member/founder of The Schoff Group, UBS Rochester (24+ years in financial services; 12-person team, ~$3B AUM). Barron''s Top 1,200 and Forbes Best-in-State 2018-2024.')), 512)
WHERE id = 432;
INSERT INTO contact_people (contact_id, name, role)
SELECT 432, x.name, x.role FROM (
  SELECT 'Kathleen "Katie" Titus' AS name, 'Senior Vice President, Equity Plan Advisory Services, The Schoff Group' AS role
  UNION ALL SELECT 'Bryan Schoff', 'Portfolio Manager, The Schoff Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 432) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 432 AND name = x.name);
