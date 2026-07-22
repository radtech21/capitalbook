-- US Financial Advisor enrichment, batch 27 (27 contacts / 20 groups).
--
-- Firm-change correction: 811 Keith Rowling and "The Rowling Group"
-- departed Merrill (Palm Beach, FL) for Morgan Stanley in April 2025,
-- bringing ~$1.9B in client assets (West Palm Beach, FL office).
--
-- Two firm/practice rebrands: 819 Adam Goldstein's practice renamed
-- "Goldstein & Associates" -> "Envisage Wealth" (multi-office
-- Ameriprise practice); 824 George Papadoyannis's practice renamed
-- "Papadoyannis & Associates" -> "Axios Private Wealth Advisors."
--
-- Confirmed colleague pairs (genuine teams, not just shared
-- building/phone): 804/805 (Merrill Heathrow FL, "BCG Private Wealth
-- Management"/"Burke Cox Group" — shared surname, likely family, not
-- explicitly confirmed); 820/821 (Morgan Stanley Scottsdale AZ,
-- "Viewpoint Wealth Management Group" — confirmed despite differing
-- CRM phone numbers); 831/832 (Merrill Houston TX Galleria, "Fenz
-- Abalos Group").
--
-- Confirmed multiple sets of unrelated advisors sharing a CRM
-- phone/building: 802/869/1129 (Morgan Stanley Dallas — three
-- separate teams, two buildings); 822/970/976 (Morgan Stanley Houston
-- — three separate teams, two buildings); 924/990/1072 (Merrill
-- Houston downtown — three separate teams, one building, distinct
-- from the Fenz/Abalos Galleria pair).
--
-- Compliance flag noted (not a data error, factual record): 820
-- Matthew Gimmelli has a pending customer arbitration complaint filed
-- March 2026 alleging Reg BI violations/fee misrepresentation
-- (~$1.035M claimed).

-- ===== GROUP 521: Morse, Towey, White & Hoffman | Hightower, New York, NY =====
-- 797 Justin Towey
UPDATE contacts SET
  address = '300 Madison Ave, 29th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Partner, Morse, Towey, White & Hoffman, Hightower New York NY. Barron''s Top 1,200 2025.')), 512)
WHERE id = 797;
INSERT INTO contact_people (contact_id, name, role)
SELECT 797, x.name, x.role FROM (
  SELECT 'Andy Morse' AS name, 'Managing Director & Partner, Morse, Towey, White & Hoffman' AS role
  UNION ALL SELECT 'Bob White', 'Managing Director & Partner (leads financial planning), Morse, Towey, White & Hoffman'
  UNION ALL SELECT 'Ken Hoffman', 'Managing Director & Partner (joined Hightower 2012, ex-Merrill), Morse, Towey, White & Hoffman'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 797) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 797 AND name = x.name);

-- ===== GROUP 522: Merrill Wealth Management, Palo Alto, CA =====
-- 798 Stephen Zanolli (The Zanolli Staubli Group)
UPDATE contacts SET
  address = '3075A Hansen Way',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, "The Zanolli Staubli Group," Merrill Palo Alto CA. Barron''s Top 1,200 2025; Forbes Best-in-State 2018-2025.')), 512)
WHERE id = 798;
INSERT INTO contact_people (contact_id, name, role)
SELECT 798, x.name, x.role FROM (
  SELECT 'Jolon Staubli' AS name, 'Senior Financial Advisor, Senior Vice President, The Zanolli Staubli Group' AS role
  UNION ALL SELECT 'Emily Dietrick, CFP', 'Financial Advisor, The Zanolli Staubli Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 798) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 798 AND name = x.name);

-- ===== GROUP 523: Bridgewater Advisors, New York, NY =====
-- 800 Leo Marzen
UPDATE contacts SET
  address = '600 Fifth Avenue, 26th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner and co-founder (1993, with Milton Stern), Bridgewater Advisors Inc., New York NY.')), 512)
WHERE id = 800;
INSERT INTO contact_people (contact_id, name, role)
SELECT 800, x.name, x.role FROM (
  SELECT 'Milton Stern' AS name, 'Managing Partner / co-founder, Bridgewater Advisors' AS role
  UNION ALL SELECT 'Gabe Derek Bryan', 'Partner (since 2015), Bridgewater Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 800) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 800 AND name = x.name);

-- ===== GROUP 524: Morgan Stanley Wealth Management, Dallas, TX =====
-- 802 Richard Fielder (365 Wealth Management Group), 869 R. Scot Smith (The Smith Group), 1129 Anupam Johri (The JLD Group) — 3 separate teams
UPDATE contacts SET
  address = '5001 Spring Valley Rd, Ste 900W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director, Family Wealth Director, leads "365 Wealth Management Group" (formerly Hogue-Fielder Group), Morgan Stanley Dallas TX. Ids 869/1129 are separate, unrelated teams — 869 in a different building entirely, 1129 in the same building but a distinct team.')), 512)
WHERE id = 802;
UPDATE contacts SET
  address = '8383 Preston Center Plaza Dr, Ste 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director (since 2012), leads "The Smith Group," Morgan Stanley Dallas TX (Preston Center, different building from ids 802/1129).')), 512)
WHERE id = 869;
UPDATE contacts SET
  address = '5001 Spring Valley Rd, Ste 900W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Goes by "AJ," Financial Advisor, Managing Director, Wealth Advisor (with firm since 1993), leads "The JLD Group," Morgan Stanley Dallas TX. Id 802 is a separate, unrelated team in the same building; id 869 is in a different building entirely.')), 512)
WHERE id = 1129;
INSERT INTO contact_people (contact_id, name, role)
SELECT 802, x.name, x.role FROM (
  SELECT 'Janna R. Birkner' AS name, 'Business Development Associate, VP, 365 Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 802) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 802 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 869, x.name, x.role FROM (
  SELECT 'Lisa Ferdinand Meagher' AS name, 'Director of Business Strategy, The Smith Group' AS role
  UNION ALL SELECT 'David Hackett', 'Portfolio Management Associate, The Smith Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 869) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 869 AND name = x.name);

-- ===== GROUP 525: UBS Private Wealth Management, Century City, CA =====
-- 803 John Acker (Bel-Air Wealth Management)
UPDATE contacts SET
  address = '2000 Avenue of the Stars, 12th Floor South',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Financial Advisor & Senior Portfolio Manager, leads "Bel-Air Wealth Management," UBS Century City CA (joined UBS 2006, formed team 2009). Forbes Best-in-State Wealth Management Teams 2026.')), 512)
WHERE id = 803;
INSERT INTO contact_people (contact_id, name, role)
SELECT 803, x.name, x.role FROM (
  SELECT 'David Selig' AS name, 'Financial Advisor, Bel-Air Wealth Management' AS role
  UNION ALL SELECT 'Todd Feiereisen', 'Financial Advisor, Bel-Air Wealth Management'
  UNION ALL SELECT 'Mark Tunney', 'Financial Advisor, Bel-Air Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 803) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 803 AND name = x.name);

-- ===== GROUP 526: Merrill Private Wealth Management, Heathrow, FL =====
-- 804 Brendan Burke, 805 Garrett Burke (confirmed colleagues, BCG Private Wealth Management / Burke Cox Group)
UPDATE contacts SET
  address = '250 International Pkwy, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Private Wealth Advisor, member of "BCG Private Wealth Management" (Burke Cox Group), Merrill Heathrow FL. Confirmed colleague of id 805 Garrett Burke, same team (shared surname suggests family relationship, not explicitly confirmed).')), 512)
WHERE id = 804;
UPDATE contacts SET
  address = '250 International Pkwy, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, member of "BCG Private Wealth Management" (Burke Cox Group), Merrill Heathrow FL. Confirmed colleague of id 804 Brendan Burke, same team. Forbes #7 Best-In-State FL-North Apr 2026.')), 512)
WHERE id = 805;
INSERT INTO contact_people (contact_id, name, role)
SELECT 804, x.name, x.role FROM (
  SELECT 'Brian Cox' AS name, 'Private Wealth Advisor, BCG Private Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 804) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 804 AND name = x.name);

-- ===== GROUP 527: Rockefeller Capital Management, The Woodlands, TX =====
-- 807 Kyle Maxwell (The Maxwell Group)
UPDATE contacts SET
  address = '9950 Woodloch Forest Tower, Suite 2100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Private Advisor, leads "The Maxwell Group" (moved from Merrill Lynch to Rockefeller Nov 2022), The Woodlands TX. Forbes #8 Best-In-State TX-South 2025. CRM phone (212) 549-5100 is a NY corporate number, not this office''s direct line ((713) 832-8926).')), 512)
WHERE id = 807;
INSERT INTO contact_people (contact_id, name, role)
SELECT 807, x.name, x.role FROM (
  SELECT 'Adam James Loveless' AS name, 'Senior VP, Private Advisor, The Maxwell Group' AS role
  UNION ALL SELECT 'Barry Johnson', 'Senior VP, Private Advisor, The Maxwell Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 807) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 807 AND name = x.name);

-- ===== GROUP 528: Ameriprise Financial, Wellesley, MA =====
-- 808 Richard Miller (R. Miller & Associates)
UPDATE contacts SET
  address = '36 Washington Street, Suite 140',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO/Private Wealth Advisor, "R. Miller & Associates," Ameriprise Wellesley MA (team also has a Shelton CT office). Barron''s Top 1,200 2015-2025, Top 100 Independent 2020/2024/2025.')), 512)
WHERE id = 808;
INSERT INTO contact_people (contact_id, name, role)
SELECT 808, x.name, x.role FROM (
  SELECT 'Amanda Willey' AS name, 'Advisor, R. Miller & Associates' AS role
  UNION ALL SELECT 'Thomas Pelley', 'Advisor, R. Miller & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 808) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 808 AND name = x.name);

-- ===== GROUP 529: Merrill Wealth Management, Palm Beach, FL (actual firm: Morgan Stanley) =====
-- 811 Keith Rowling
UPDATE contacts SET
  firm = 'Morgan Stanley Wealth Management (The Rowling Group)',
  title = 'Managing Director',
  address = '777 S Flagler Drive, Suite 700E, West Palm Beach, FL 33401',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Keith Rowling and "The Rowling Group" rejoined Morgan Stanley in April 2025 after ~8 years at Merrill Lynch, bringing ~$1.9B in client assets (team also has a San Antonio TX office). Forbes #21 FL-South Private Wealth 2025.')), 512)
WHERE id = 811;
INSERT INTO contact_people (contact_id, name, role)
SELECT 811, x.name, x.role FROM (
  SELECT 'Colton M. Creamer' AS name, 'Financial Advisor (San Antonio TX office, partnered with Rowling since 2017), The Rowling Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 811) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 811 AND name = x.name);

-- ===== GROUP 530: Wells Fargo Advisors, The Woodlands, TX =====
-- 816 Will Murphy (Murphy Private Wealth Group)
UPDATE contacts SET
  address = '1800 Hughes Landing Blvd, Suite 325',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Financial Advisor, Managing Director-Investments, leads "Murphy Private Wealth Group of Wells Fargo Advisors," The Woodlands TX. Barron''s Top 1,200 2025; Forbes Best-In-State #7 2025.')), 512)
WHERE id = 816;
INSERT INTO contact_people (contact_id, name, role)
SELECT 816, x.name, x.role FROM (
  SELECT 'Russell Kent' AS name, 'Senior Private Wealth Portfolio Manager (Wells Fargo Bank), Murphy Private Wealth Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 816) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 816 AND name = x.name);

-- ===== GROUP 531: Pence Wealth Management, Newport Beach, CA =====
-- 818 Laila Pence
UPDATE contacts SET
  address = '5000 Birch St, West Tower, Suite 8000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & Co-Founder, Pence Wealth Management (independent RIA, LPL affiliated, ~$2.8B AUM mid-2026), Newport Beach CA. Barron''s Hall of Fame since 2019; Forbes #1 Best-in-State (SoCal)/#8 nationally Top Women Wealth Advisors 2026.')), 512)
WHERE id = 818;
INSERT INTO contact_people (contact_id, name, role)
SELECT 818, x.name, x.role FROM (
  SELECT 'Dryden Pence (Eldon Dryden Pence III)' AS name, 'Chief Investment Officer & Co-Founder (husband of Laila), Pence Wealth Management' AS role
  UNION ALL SELECT 'Andrew A. Odish, CFP', 'Vice President, Regional Branch Manager, Pence Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 818) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 818 AND name = x.name);

-- ===== GROUP 532: Ameriprise Financial, Calabasas, CA =====
-- 819 Adam S. Goldstein (now Envisage Wealth)
UPDATE contacts SET
  firm = 'Envisage Wealth (formerly Goldstein & Associates)',
  address = '24025 Park Sorrento, Ste 320',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Practice rebranded from "Goldstein & Associates" to "Envisage Wealth" (multi-office Ameriprise practice HQ''d in Columbus OH; Calabasas location retained), still led locally by Adam Goldstein as Private Wealth Advisor. Forbes #6 Best-In-State CA 2026.')), 512)
WHERE id = 819;
INSERT INTO contact_people (contact_id, name, role)
SELECT 819, x.name, x.role FROM (
  SELECT 'Jeff Chaddock' AS name, 'CEO, Envisage Wealth' AS role
  UNION ALL SELECT 'Jonathan Rowsey', 'COO, Envisage Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 819) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 819 AND name = x.name);

-- ===== GROUP 533/534: Morgan Stanley Wealth Management, Scottsdale, AZ =====
-- 820 Matthew Gimmelli, 821 Teri Kelley (confirmed colleagues, Viewpoint Wealth Management Group)
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, CFA, "Viewpoint Wealth Management Group," Morgan Stanley Scottsdale AZ (~$1.8B AUM). Confirmed colleague of id 821 Teri Kelley, same team, despite differing CRM phone numbers (separate direct-dial lines). Forbes Best-In-State AZ 2026; Barron''s Top 1,500 2026. COMPLIANCE FLAG: a pending customer arbitration complaint was filed March 2026 alleging Reg BI violations/fee misrepresentation (~$1.035M claimed) — factual record, not a data error.')), 512)
WHERE id = 820;
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Wealth Director, Chartered Advisor in Philanthropy, leads wealth planning for "Viewpoint Wealth Management Group," Morgan Stanley Scottsdale AZ. Confirmed colleague of id 820 Matthew Gimmelli, same team. Forbes Best-In-State AZ 2026; Barron''s Top 1,500 2026.')), 512)
WHERE id = 821;
INSERT INTO contact_people (contact_id, name, role)
SELECT 820, x.name, x.role FROM (
  SELECT 'Megan Osbrink, CFP' AS name, 'VP, Portfolio Manager, Viewpoint Wealth Management Group' AS role
  UNION ALL SELECT 'Monika Kotowski, CFP', 'Client relationship management, Viewpoint Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 820) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 820 AND name = x.name);

-- ===== GROUP 535: Morgan Stanley Wealth Management, Houston, TX =====
-- 822 Lewis Metzger (The Metzger Group), 970 James Woldert (The Woldert Group), 976 William Gouldin (The Pathways Wealth Management Group) — 3 separate teams
UPDATE contacts SET
  address = '1330 Post Oak Blvd, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Family Wealth Director, leads "The Metzger Group," Morgan Stanley Houston TX. Ids 970/976 are separate, unrelated teams in a different building.')), 512)
WHERE id = 822;
UPDATE contacts SET
  address = '2800 Post Oak Blvd, 18th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, CIMA, CAIA, leads "The Woldert Group," Morgan Stanley Houston TX. Id 976 is a separate, unrelated team in the same building; id 822 is in a different building.')), 512)
WHERE id = 970;
UPDATE contacts SET
  address = '2800 Post Oak Blvd, 18th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, CIMA, Family Wealth Director, part of "The Pathways Wealth Management Group," Morgan Stanley Houston TX. Id 970 is a separate, unrelated team in the same building; id 822 is in a different building.')), 512)
WHERE id = 976;
INSERT INTO contact_people (contact_id, name, role)
SELECT 822, x.name, x.role FROM (
  SELECT 'Austin Stewart' AS name, 'First VP, Portfolio Manager, FA, The Metzger Group' AS role
  UNION ALL SELECT 'Dominic Cellitti, CFP', 'Wealth Advisor, First VP, Senior Portfolio Manager, The Metzger Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 822) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 822 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 976, x.name, x.role FROM (
  SELECT 'Richmond Talbert' AS name, 'Team member, The Pathways Wealth Management Group' AS role
  UNION ALL SELECT 'Donald W. Coon, CFA', 'Team member, The Pathways Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 976) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 976 AND name = x.name);

-- ===== GROUP 536: Ameriprise Financial, San Mateo, CA =====
-- 824 George Papadoyannis (now Axios Private Wealth Advisors)
UPDATE contacts SET
  firm = 'Axios Private Wealth Advisors (formerly Papadoyannis & Associates)',
  address = '1900 O''Farrell St, Ste 180',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Practice renamed "Papadoyannis & Associates" to "Axios Private Wealth Advisors," San Mateo CA (team also has a San Jose CA office). Barron''s Top 1,500 2026; Forbes Best-in-State 2018-2026.')), 512)
WHERE id = 824;
INSERT INTO contact_people (contact_id, name, role)
SELECT 824, x.name, x.role FROM (
  SELECT 'Emmanuel Huereca' AS name, 'Financial Advisor (formerly Paraplanner 2006-2020), Axios Private Wealth Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 824) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 824 AND name = x.name);

-- ===== GROUP 537: Baird, Houston, TX =====
-- 825 Richard Ashcroft (The Ashcroft Pesek Bartosh Group)
UPDATE contacts SET
  address = '945 Bunker Hill Road, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, CFP/CPWA/RMA (joined Baird 2013 from A.G. Edwards, career start 1983), leads "The Ashcroft Pesek Bartosh Group" (Baird Retirement Management, ExxonMobil retiree focus), Houston TX.')), 512)
WHERE id = 825;
INSERT INTO contact_people (contact_id, name, role)
SELECT 825, x.name, x.role FROM (
  SELECT 'Darrell Pesek' AS name, 'Director/financial planning, The Ashcroft Pesek Bartosh Group' AS role
  UNION ALL SELECT 'Scott Bartosh', 'Financial Advisor-in-Training, The Ashcroft Pesek Bartosh Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 825) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 825 AND name = x.name);

-- ===== GROUP 538: Merrill Wealth Management, Palm Beach Gardens, FL =====
-- 828 Chris Sebastian (Sebastian, Awner, Houlding, Spagnolo Group)
UPDATE contacts SET
  address = '3507 Kyoto Gardens Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor (with Merrill since 1991), managing partner of "Sebastian, Awner, Houlding, Spagnolo Group" (dual-sited Palm Beach Gardens FL and Buffalo NY), Merrill Palm Beach Gardens FL.')), 512)
WHERE id = 828;
INSERT INTO contact_people (contact_id, name, role)
SELECT 828, x.name, x.role FROM (
  SELECT 'Steven Awner' AS name, 'Advisor/partner, Sebastian, Awner, Houlding, Spagnolo Group' AS role
  UNION ALL SELECT 'Austin Houlding', 'Advisor/partner, Sebastian, Awner, Houlding, Spagnolo Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 828) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 828 AND name = x.name);

-- ===== GROUP 539: Merrill Wealth Management, Houston, TX =====
-- 831 Darren Fenz, 832 Joni Abalos (confirmed colleagues, Fenz Abalos Group); 924 Mark Gladstein (GLRS Group); 990 Jared Holden (H Wealth Management); 1072 J. Michael Fox (The Fox Group) — 3 separate teams total
UPDATE contacts SET
  address = '2800 Post Oak Blvd, Suite 2200, Williams Tower',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, leads "Fenz Abalos Group" with id 832 Joni Abalos (confirmed colleague), Merrill Houston TX (Galleria/Williams Tower). Barron''s Top 1,200 2014-2019/2025. Ids 924/990/1072 are three separate, unrelated teams in a different downtown building.')), 512)
WHERE id = 831;
UPDATE contacts SET
  address = '2800 Post Oak Blvd, Suite 2200, Williams Tower',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, Wealth Management Advisor/Managing Director, leads "Fenz Abalos Group" with id 831 Darren Fenz (confirmed colleague), Merrill Houston TX (Galleria/Williams Tower). #1 Best-in-State Women Advisors TX-South 2025; Barron''s Top 1,200 through 2024 (9th consecutive year).')), 512)
WHERE id = 832;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, leads "The Gladstein Levitt Rozelle Spence Group" (formerly Reichek Gladstein Group), Merrill Houston TX (downtown). Barron''s Top 1,200 2010-2011/2013-2025. Separate, unrelated team from ids 990/1072 despite sharing this building, and from ids 831/832 (different building).')), 512)
WHERE id = 924;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Senior Financial Advisor, leads "H Wealth Management," Merrill Houston TX (downtown). Forbes Best-in-State 2025; Barron''s Top 1,200 2025. Separate, unrelated team from ids 924/1072 despite sharing this building.')), 512)
WHERE id = 990;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial advisor (~28 yrs experience), leads "The Fox Group" (founded by father Jim Fox 1981), Merrill Houston TX (downtown). Barron''s Top 1,500 2016-2026; Forbes #6 Best-in-State 2026. Separate, unrelated team from ids 924/990 despite sharing this building.')), 512)
WHERE id = 1072;
INSERT INTO contact_people (contact_id, name, role)
SELECT 924, x.name, x.role FROM (
  SELECT 'Mallory (Gladstein) Spence' AS name, 'VP, Wealth Management Advisor (daughter of Mark Gladstein), The Gladstein Levitt Rozelle Spence Group' AS role
  UNION ALL SELECT 'Daniel A. Levitt', 'Team member, The Gladstein Levitt Rozelle Spence Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 924) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 924 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 990, x.name, x.role FROM (
  SELECT 'Angela R. Langolf-Seeley, CFP' AS name, 'AVP, Wealth Planner, H Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 990) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 990 AND name = x.name);

-- ===== GROUP 540: UBS Wealth Management, Raleigh, NC =====
-- 833 Michael Lappin (Raleigh PWM)
UPDATE contacts SET
  address = '3700 Glenwood Avenue, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, CPWA, Managing Director-Wealth Management, Private Wealth Advisor (31+ yrs experience, joined UBS 2012), combined with Bill Smith to form "Raleigh PWM" Sept 1, 2023, UBS Raleigh NC. Forbes #8 Best-in-State NC 2026; Barron''s Top 1,200 2023 (#6 NC).')), 512)
WHERE id = 833;
INSERT INTO contact_people (contact_id, name, role)
SELECT 833, x.name, x.role FROM (
  SELECT 'Bill Smith' AS name, 'Managing Director, Private Wealth Advisor (co-lead), Raleigh PWM' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 833) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 833 AND name = x.name);
