-- US Financial Advisor enrichment, batch 17 (24 contacts / 20 groups).
--
-- Firm-change correction: 516 Micah Scheinberg departed Alex. Brown, a
-- division of Raymond James (Century City) in April 2025, joining
-- Merrill Lynch as Managing Director in its Century City/LA office
-- (Mountain West Private Wealth market), bringing ~$1.9B in client
-- assets.
--
-- One phone-number data error confirmed as unrelated-business
-- contamination (not merely wrong-region): 500/501's CRM phone
-- (402) 397-8700 belongs to Peterson Bros Realty, an unrelated Omaha,
-- NE property-management company — the firm's real number is
-- (973) 826-8800.

-- ===== GROUP 321: Schaffer Private Wealth | Wells Fargo Advisors FiNet, Deerfield, IL =====
-- 491 Michael Schaffer (President & Managing Partner, founder)
UPDATE contacts SET
  address = '500 Lake Cook Road, Suite 125',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & Managing Partner, founder of Schaffer Private Wealth Group, Wells Fargo Advisors FiNet, Deerfield IL. Forbes Best-In-State 2026.')), 512)
WHERE id = 491;
INSERT INTO contact_people (contact_id, name, role)
SELECT 491, x.name, x.role FROM (
  SELECT 'Caroline Schaffer' AS name, 'Assistant Vice President (joined 2022), Schaffer Private Wealth Group' AS role
  UNION ALL SELECT 'Michael Schaffer II', 'Financial Advisor (likely son of founder), Schaffer Private Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 491) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 491 AND name = x.name);

-- ===== GROUP 322: Morgan Stanley Wealth Management, Mount Laurel, NJ =====
-- 493 Richard Udine (The Udine Group)
UPDATE contacts SET
  address = '330 Fellowship Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Rick" Udine, lead advisor of The Udine Group, Morgan Stanley Mount Laurel NJ. Forbes Best-In-State Wealth Advisor 2018-2026.')), 512)
WHERE id = 493;
INSERT INTO contact_people (contact_id, name, role)
SELECT 493, x.name, x.role FROM (
  SELECT 'Ryan Udine, CFP' AS name, 'Senior Portfolio Manager & Alternative Investments Director, The Udine Group' AS role
  UNION ALL SELECT 'Joseph Udine, CAIA', 'Team member (portfolio/risk analytics), The Udine Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 493) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 493 AND name = x.name);

-- ===== GROUP 323: RBC Wealth Management, Princeton, NJ =====
-- 495 Michael Gara (Princeton Financial Partners)
UPDATE contacts SET
  address = '90 Nassau Street, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Senior Portfolio Manager, Princeton Financial Partners, RBC Princeton NJ (moved from UBS May 2021). Barron''s Top 1,500 2026.')), 512)
WHERE id = 495;
INSERT INTO contact_people (contact_id, name, role)
SELECT 495, x.name, x.role FROM (
  SELECT 'Bruce Berman' AS name, 'Financial Advisor (39 yrs industry experience), Princeton Financial Partners' AS role
  UNION ALL SELECT 'Chad Goerner', 'Financial Advisor (former Princeton Township mayor), Princeton Financial Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 495) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 495 AND name = x.name);

-- ===== GROUP 324: Janney Montgomery Scott, Philadelphia, PA =====
-- 496 Edward Blumenthal, 497 Mark Eskin (Stedmark Partners)
UPDATE contacts SET
  address = '1717 Arch Street, 21st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management, Financial Advisor, Stedmark Partners, Janney Philadelphia (joined Janney 1996). Team on Forbes "America''s Top 100 Wealth Management Teams" 2022-2025, ~$3B AUM.')), 512)
WHERE id = 496;
UPDATE contacts SET
  address = '1717 Arch Street, 21st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management, Financial Advisor, Stedmark Partners, Janney Philadelphia (joined Janney 1999), alongside id 496 Edward Blumenthal.')), 512)
WHERE id = 497;
INSERT INTO contact_people (contact_id, name, role)
SELECT 496, x.name, x.role FROM (
  SELECT 'Chris Borden' AS name, 'Team member, Stedmark Partners' AS role
  UNION ALL SELECT 'Julie Maxwell', 'Team member, Stedmark Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 496) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 496 AND name = x.name);

-- ===== GROUP 325: Morgan Stanley Wealth Management, Farmington Hills, MI =====
-- 498 Mark Rogers (Jbara and Rogers Financial Management Group)
UPDATE contacts SET
  address = '35055 W. 12 Mile Rd., Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Director/Financial Advisor, CIMA, co-leads Jbara and Rogers Financial Management Group, Morgan Stanley Farmington Hills MI (with Gary Jbara). 2026 Michigan''s highest-ranked Morgan Stanley wealth management team, Forbes 2026 Best-In-State.')), 512)
WHERE id = 498;
INSERT INTO contact_people (contact_id, name, role)
SELECT 498, x.name, x.role FROM (
  SELECT 'Gary W. Jbara, CIMA, CRPS' AS name, 'Managing Director/Executive Director, Financial Advisor, co-lead, Jbara and Rogers Financial Management Group' AS role
  UNION ALL SELECT 'John Rogers', 'Financial Advisor, Jbara and Rogers Financial Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 498) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 498 AND name = x.name);

-- ===== GROUP 326: J.P. Morgan Wealth Management, Portland, OR =====
-- 499 Jeffrey Yandle, 630 Rebecca DeCesaro (The HDYG Team)
UPDATE contacts SET
  address = '805 SW Broadway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, J.P. Morgan Portland OR, part of The HDYG Team (moved from First Republic Investment Management in 2023). Barron''s Top 1,500 (#6 in state).')), 512)
WHERE id = 499;
UPDATE contacts SET
  address = '805 SW Broadway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, J.P. Morgan Portland OR, part of The HDYG Team (moved from First Republic Investment Management in 2023), alongside id 499 Jeffrey Yandle. Barron''s Top 1,500 (#3 in state); #89 nationally Forbes top women advisors.')), 512)
WHERE id = 630;
INSERT INTO contact_people (contact_id, name, role)
SELECT 499, x.name, x.role FROM (
  SELECT 'Jeffrey Greene' AS name, 'Managing Director & Wealth Partner, co-lead, The HDYG Team' AS role
  UNION ALL SELECT 'Hannah Forney', 'Wealth Partner/advisor (planning, estate/concentrated stock), The HDYG Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 499) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 499 AND name = x.name);

-- ===== GROUP 327: CFS Investment Advisory Services, Totowa, NJ =====
-- 500 Greg Makowski, 501 Harris Nydick (Founding Partners)
UPDATE contacts SET
  address = '97 Lackawanna Ave., Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (402) 397-8700 belongs to Peterson Bros Realty, an unrelated Omaha, NE property-management company — a clear data error; correct number is (973) 826-8800. Confirmed current — Founding Partner & Managing Member, CFP/AIF, CFS Investment Advisory Services, Totowa NJ.')), 512)
WHERE id = 500;
UPDATE contacts SET
  address = '97 Lackawanna Ave., Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (402) 397-8700 belongs to Peterson Bros Realty, an unrelated Omaha, NE property-management company — a clear data error; correct number is (973) 826-8800. Confirmed current — Founding Partner & Managing Member, CFP/AIFA, CFS Investment Advisory Services, Totowa NJ, alongside id 500 Greg Makowski.')), 512)
WHERE id = 501;
INSERT INTO contact_people (contact_id, name, role)
SELECT 500, x.name, x.role FROM (
  SELECT 'Edward Swikart III, CFP' AS name, 'Director, Financial Planning, CFS Investment Advisory Services' AS role
  UNION ALL SELECT 'John Bartlett, CFP, AIF', 'Director, Retirement Services, CFS Investment Advisory Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 500) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 500 AND name = x.name);

-- ===== GROUP 328: Hayes Nystrom Sarrett Wealth Management Group, Richmond, VA =====
-- 502 Brett Hayes (Managing Principal; firm now branded "HNS Advisors")
UPDATE contacts SET
  address = '4211 Dover Road, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name William "Brett" Hayes, Managing Principal, Wells Fargo Advisors Financial Network (firm now branded "HNS Advisors"), Richmond VA (advisor since 1992, co-founded the practice 2008/2009). #6 Forbes 2025 Best-In-State VA.')), 512)
WHERE id = 502;
INSERT INTO contact_people (contact_id, name, role)
SELECT 502, x.name, x.role FROM (
  SELECT 'Scott Nystrom' AS name, 'Financial Advisor/co-founder (since 1999), HNS Advisors' AS role
  UNION ALL SELECT 'Mark Sarrett', 'Senior Financial Advisor, HNS Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 502) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 502 AND name = x.name);

-- ===== GROUP 329: The Investment Counsel Company of Nevada, Las Vegas, NV =====
-- 503 Randy Garcia (Founder & CEO)
UPDATE contacts SET
  address = '10000 W Charleston Blvd, Suite 280',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, The Investment Counsel Company of Nevada, Las Vegas (founded 1987). Forbes Top Wealth Advisor 2025.')), 512)
WHERE id = 503;
INSERT INTO contact_people (contact_id, name, role)
SELECT 503, x.name, x.role FROM (
  SELECT 'Michelle Konstantarakis, CFP, CIMA, AIFA' AS name, 'Advisor (joined 2003), The Investment Counsel Company of Nevada' AS role
  UNION ALL SELECT 'Nick Fowler, CFP, AIFA, CIMA, JD', 'Financial Advisor, The Investment Counsel Company of Nevada'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 503) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 503 AND name = x.name);

-- ===== GROUP 330: Morgan Stanley Wealth Management, Charlotte, NC =====
-- 504 Andy Young (The Young Group, co-founder)
UPDATE contacts SET
  address = '6805 Morrison Blvd, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Andrew Young, Managing Director, Wealth Advisor, co-founder of The Young Group, Morgan Stanley Charlotte NC. #28 North Carolina-West Forbes 2026.')), 512)
WHERE id = 504;
INSERT INTO contact_people (contact_id, name, role)
SELECT 504, x.name, x.role FROM (
  SELECT 'Nora Buscema, CFP, CIMA, CRPS, QPFC, CPWA' AS name, 'Family Wealth Director, Corporate Retirement Director, co-founder, The Young Group' AS role
  UNION ALL SELECT 'Keith Kepley', 'Team member, The Young Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 504) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 504 AND name = x.name);

-- ===== GROUP 331: Morgan Stanley Wealth Management, Bethesda, MD =====
-- 505 Adam Rorrer (The Potomac Group), 576 David Giulieri (The Chesapeake Capitol Group)
-- — two separate teams sharing the same building.
UPDATE contacts SET
  address = '7500 Old Georgetown Rd, 10th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor/Corporate Retirement Director, member of The Potomac Group, Morgan Stanley Bethesda MD.')), 512)
WHERE id = 505;
UPDATE contacts SET
  address = '7500 Old Georgetown Rd, 10th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Senior Portfolio Management Director, CFP, member of The Chesapeake Capitol Group, Morgan Stanley Bethesda MD (separate team from id 505 Adam Rorrer, sharing the same building).')), 512)
WHERE id = 576;
INSERT INTO contact_people (contact_id, name, role)
SELECT 505, x.name, x.role FROM (
  SELECT 'Gabe Aronson' AS name, 'Team member, The Potomac Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 505) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 505 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 576, x.name, x.role FROM (
  SELECT 'Brian Neeley' AS name, 'Team member, The Chesapeake Capitol Group' AS role
  UNION ALL SELECT 'Henry Lynch', 'Team member, The Chesapeake Capitol Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 576) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 576 AND name = x.name);

-- ===== GROUP 332: UBS Wealth Management, Greenville, SC =====
-- 506 Bert Arrowood (The Parham, Arrowood, Bragdon Institutional Consulting Group)
UPDATE contacts SET
  address = '17 West McBee Avenue, Poinsett Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director of Wealth Management, part of The Parham, Arrowood, Bragdon Institutional Consulting Group, UBS Greenville SC. Barron''s Top 1,500 2026; #4 Forbes 2026 Best-In-State SC.')), 512)
WHERE id = 506;
INSERT INTO contact_people (contact_id, name, role)
SELECT 506, x.name, x.role FROM (
  SELECT 'Kenneth Parham, CIMA' AS name, 'Managing Director, Wealth Management, The Parham, Arrowood, Bragdon Institutional Consulting Group' AS role
  UNION ALL SELECT 'Will Bragdon', 'Managing Director, Wealth Management, The Parham, Arrowood, Bragdon Institutional Consulting Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 506) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 506 AND name = x.name);

-- ===== GROUP 333: McGill Junge Wealth Management | Northwestern Mutual, Clive, IA =====
-- 507 Ed McGill (Co-Founder and Partner)
UPDATE contacts SET
  address = '12289 Stratford Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder and Partner, Private Wealth Advisor, McGill Junge Wealth Management, Northwestern Mutual, Clive IA (founded ~2013 with Ross Junge). #1 Iowa Forbes Best-in-State 2025.')), 512)
WHERE id = 507;
INSERT INTO contact_people (contact_id, name, role)
SELECT 507, x.name, x.role FROM (
  SELECT 'Ross Junge' AS name, 'Co-Founder and Partner, Private Wealth Advisor, McGill Junge Wealth Management' AS role
  UNION ALL SELECT 'Gina Cunningham', 'Partner and Chief Operating Officer, McGill Junge Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 507) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 507 AND name = x.name);

-- ===== GROUP 334: Invictus Private Wealth, Denver, CO =====
-- 508 Michael Caplan (Managing Partner/founder)
UPDATE contacts SET
  address = '255 Clayton Street, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner/founder, Invictus Private Wealth, Denver (RIA launched 2020, formerly at UBS). Forbes Best-In-State Wealth Advisors (Colorado, 2025).')), 512)
WHERE id = 508;
INSERT INTO contact_people (contact_id, name, role)
SELECT 508, x.name, x.role FROM (
  SELECT 'Sydney V. Levy, CFP' AS name, 'Head of Wealth Planning, Invictus Private Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 508) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 508 AND name = x.name);

-- ===== GROUP 335: Alex. Brown | Raymond James, Century City, CA =====
-- 516 Micah Scheinberg — DEPARTED for Merrill Lynch, April 2025
UPDATE contacts SET
  firm = 'Merrill Lynch (Bank of America)',
  title = 'Managing Director',
  address = 'Century City, Los Angeles, CA 90067',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed Alex. Brown, a division of Raymond James, in April 2025, joining Merrill Lynch as Managing Director in its Century City/Los Angeles office (Mountain West Private Wealth market, under regional managing director Jeff Wood), bringing ~$1.9B in client assets. No longer with Alex. Brown/Raymond James.')), 512)
WHERE id = 516;

-- ===== GROUP 336: Morgan Stanley Wealth Management, Montgomery, AL =====
-- 518 Robert Runkle (The Runkle Group, founder)
UPDATE contacts SET
  address = '7515 Halcyon Summit Dr, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Management Director, founder of The Runkle Group, Morgan Stanley Montgomery AL (moved from Merrill Lynch Feb 2021; team also has satellite offices in Atlanta, GA and Destin, FL). Barron''s Top 1,200/1,500 through 2025-2026; Forbes Best-in-State Teams 2023-2026.')), 512)
WHERE id = 518;
INSERT INTO contact_people (contact_id, name, role)
SELECT 518, x.name, x.role FROM (
  SELECT 'Robert Runkle Jr.' AS name, 'Financial Advisor (son, joined 2011, Atlanta GA office), The Runkle Group' AS role
  UNION ALL SELECT 'Mary Runkle Smith', 'Financial Advisor (daughter, former securities/med-mal attorney), The Runkle Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 518) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 518 AND name = x.name);

-- ===== GROUP 337: Morgan Stanley Wealth Management, Ridgeland, MS =====
-- 519 Melanie Dowell (The Dowell Group, founding partner)
UPDATE contacts SET
  address = '1018 Highland Colony Parkway, Suite 105',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Director, founding partner of The Dowell Group, Morgan Stanley Ridgeland MS (financial advisor since 1980, with Morgan Stanley since 1988). #1 Best-In-State Wealth Management Team Mississippi, Forbes 2025.')), 512)
WHERE id = 519;
INSERT INTO contact_people (contact_id, name, role)
SELECT 519, x.name, x.role FROM (
  SELECT 'Preston Dowell' AS name, 'Financial Advisor / Senior VP, Government Entity Specialist (son, joined 2011), The Dowell Group' AS role
  UNION ALL SELECT 'Walker Dowell', 'Financial Advisor (son, joined 2017), The Dowell Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 519) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 519 AND name = x.name);

-- ===== GROUP 338: RBC Wealth Management, Omaha, NE =====
-- 520 John Garlock (The Garlock Jacobitz Group)
UPDATE contacts SET
  address = '12910 Pierce Street, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Buzz" Garlock, Senior VP/Managing Director-Financial Advisor-Senior Portfolio Manager, RBC Omaha NE (with firm since 1995); team now branded The Garlock Jacobitz Group. Barron''s Top 1,200 2022-2025, Top 1,500 2026.')), 512)
WHERE id = 520;
INSERT INTO contact_people (contact_id, name, role)
SELECT 520, x.name, x.role FROM (
  SELECT 'Andrew "Andy" Jacobitz, CFA' AS name, 'First Vice President, Financial Advisor, Portfolio Manager, co-lead, The Garlock Jacobitz Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 520) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 520 AND name = x.name);

-- ===== GROUP 339: UBS Wealth Management, Billings, MT =====
-- 521 William Royer (Montana Wealth Advisors)
UPDATE contacts SET
  address = '401 North 31st Street, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Bill" Royer, CRPS, Managing Director-Wealth Management, leads Montana Wealth Advisors, UBS Billings MT. Barron''s Top 1,200 2014-2025, Top 1,500 2026; #3 Forbes Best-in-State Montana 2025.')), 512)
WHERE id = 521;
INSERT INTO contact_people (contact_id, name, role)
SELECT 521, x.name, x.role FROM (
  SELECT 'Todd Vralsted, CRPS, CPWA, EFC' AS name, 'Financial Advisor, Montana Wealth Advisors' AS role
  UNION ALL SELECT 'Scott Hatler, CFP', 'Financial Advisor, Montana Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 521) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 521 AND name = x.name);

-- ===== GROUP 340: Baird, Scottsdale, AZ =====
-- 522 Todd Reeg (The Reeg Group)
UPDATE contacts SET
  address = '14648 North Scottsdale Road, Suite 175',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, leads The Reeg Group (multi-generational family team), Baird Scottsdale AZ (joined 2014, 26 yrs industry experience). #16 Forbes Best-in-State AZ 2022; team #5 Arizona High-Net-Worth Jan 2026.')), 512)
WHERE id = 522;
INSERT INTO contact_people (contact_id, name, role)
SELECT 522, x.name, x.role FROM (
  SELECT 'Stanley Reeg' AS name, 'Team member, The Reeg Group' AS role
  UNION ALL SELECT 'Nathan Gunderson, CFP, CPWA', 'Wealth Advisor (with the group since 2018), The Reeg Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 522) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 522 AND name = x.name);
