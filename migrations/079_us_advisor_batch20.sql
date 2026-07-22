-- US Financial Advisor enrichment, batch 20 (20 contacts / 20 groups).
--
-- Location-discrepancy resolved: 607 Glenn Arthurs' CRM city "Placida,
-- FL" is not a real UBS branch location — no UBS office exists there.
-- His confirmed working office is Buffalo, NY ("The Arthurs Malof
-- Group"); Placida likely reflects a Florida residence/registration
-- address captured in error as the office city. Applying the Buffalo
-- address with the discrepancy flagged rather than silently
-- overwriting the CRM city.
--
-- Firm-change correction: 618 Charles S. Bean III's firm, Heritage
-- Financial Services, was acquired by Savant Wealth Management
-- (deal closed Feb 27, 2026); he is now titled Managing Partner and
-- Financial Advisor at Savant, still in the same Westwood, MA office.
--
-- Negative cross-check confirmed: 622 Jana Shoulders (Mariner Tulsa)
-- and 608 Rob Thomas (Mariner State College, PA, batch 20) share CRM
-- phone (913) 647-9700 only because it is Mariner's Overland Park, KS
-- corporate HQ line — both offices are geographically/organizationally
-- distinct with their own real branch numbers.
--
-- Several CRM phone numbers flagged as unverifiable/stale against
-- current listings (phone column left untouched, only data_flags
-- annotated): 611 Sage Financial, 614 MS Omaha, 615 UBS Cincinnati,
-- 620 Bogart Wealth, 629 JNBA, 631 Key Financial.

-- ===== GROUP 381: UBS Wealth Management, Placida, FL (actual office: Buffalo, NY) =====
-- 607 Glenn Arthurs (The Arthurs Malof Group)
UPDATE contacts SET
  address = '250 Delaware Avenue, Suite 610, Buffalo, NY 14202',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LOCATION DISCREPANCY: CRM lists city as Placida, FL, but no UBS branch exists there — confirmed working office is Buffalo NY, leading "The Arthurs Malof Group" (moved from Morgan Stanley to UBS 2015, ~$4B AUM as of 9/30/2025). Placida likely reflects a FL residence/registration address, not an office. Forbes 2026 Best-in-State Wealth Management Teams; Barron''s Top 1,200.')), 512)
WHERE id = 607;
INSERT INTO contact_people (contact_id, name, role)
SELECT 607, x.name, x.role FROM (
  SELECT 'Wyatt Arthurs' AS name, 'Advisor (son of Glenn), The Arthurs Malof Group' AS role
  UNION ALL SELECT 'Chris Malof', 'Managing Director, CIMA, co-founder, The Arthurs Malof Group'
  UNION ALL SELECT 'Jay Blair', 'Advisor, The Arthurs Malof Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 607) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 607 AND name = x.name);

-- ===== GROUP 382: Mariner, State College, PA =====
-- 608 Rob Thomas
UPDATE contacts SET
  address = '1375 Martin St, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Senior Wealth Advisor, Mariner Wealth Advisors, State College PA (30+ yrs experience). Barron''s #1 PA 2021/2023-2025; Forbes Best-In-State #1-2 PA 2022/2024. CRM phone (913) 647-9700 is Mariner''s Overland Park KS corporate HQ line, not this branch''s direct number (814-867-2050); shared with id 622 Jana Shoulders (Tulsa OK) for the same reason — confirmed unrelated offices.')), 512)
WHERE id = 608;

-- ===== GROUP 383: Morgan Stanley Wealth Management, New Orleans, LA =====
-- 610 James Spiro (The Spiro Group)
UPDATE contacts SET
  address = '1100 Poydras St, Suite 1900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, heads "The Spiro Group," Morgan Stanley New Orleans LA (~$3B+ AUM). Barron''s Top 1,200 every year since 2014; Forbes Best-in-State Wealth Management Team 2022-2026, #2 Louisiana Apr 2026.')), 512)
WHERE id = 610;
INSERT INTO contact_people (contact_id, name, role)
SELECT 610, x.name, x.role FROM (
  SELECT 'David K. Butscher' AS name, 'Financial Advisor, Managing Director & Portfolio Manager, The Spiro Group' AS role
  UNION ALL SELECT 'Romi Gonzalez III', 'Family Wealth Director, Senior Vice President, The Spiro Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 610) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 610 AND name = x.name);

-- ===== GROUP 384: Sage Financial Group, Conshohocken, PA =====
-- 611 Alan Cohn
UPDATE contacts SET
  address = 'Five Tower Bridge, 300 Bar Harbor Drive, Suite 200, West Conshohocken, PA 19428',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder and Co-President, Sage Financial Group (founded 1989 with brothers David and Stephen Cohn), Conshohocken PA. Firm ~$3.6B AUM, ranked #25 CNBC FA 100 2025. CRM phone (610) 878-1900 unverified; some current listings show (484) 342-4400 for the same address instead.')), 512)
WHERE id = 611;
INSERT INTO contact_people (contact_id, name, role)
SELECT 611, x.name, x.role FROM (
  SELECT 'Stephen Cohn' AS name, 'Co-Founder & Co-President, Sage Financial Group' AS role
  UNION ALL SELECT 'David Cohn', 'Co-Founder, Sage Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 611) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 611 AND name = x.name);

-- ===== GROUP 385: Morgan Stanley Wealth Management, Omaha, NE =====
-- 614 Andrew Robinson (The Robinson/Epstein Group)
UPDATE contacts SET
  address = '13625 California St, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, leads "The Robinson/Epstein Group," Morgan Stanley Omaha NE. Forbes Best-In-State #3 Nebraska 2026. CRM phone (402) 342-2600 could not be verified against current listings (402-397-0900 / 402-399-1500 found instead) — likely stale.')), 512)
WHERE id = 614;
INSERT INTO contact_people (contact_id, name, role)
SELECT 614, x.name, x.role FROM (
  SELECT 'Cory Epstein' AS name, 'Financial Advisor, Senior Vice President, Senior Portfolio Manager, The Robinson/Epstein Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 614) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 614 AND name = x.name);

-- ===== GROUP 386: UBS Private Wealth Management, Cincinnati, OH =====
-- 615 David Ellis (The Ellis Group)
UPDATE contacts SET
  address = '8044 Montgomery Road, The Towers at Kenwood',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — David W. Ellis III, Private Wealth Advisor, Managing Director, non-practicing CPA, leads "The Ellis Group," UBS Cincinnati OH (~$2.5B+ AUM). Barron''s Top 250 Private Wealth Management Teams 2024/2025; Forbes America''s Top 250 Wealth Advisors 2022. CRM phone (513) 629-5000 could not be verified against current listings (513-792-2100 / 513-792-2441 found instead) — likely stale.')), 512)
WHERE id = 615;
INSERT INTO contact_people (contact_id, name, role)
SELECT 615, x.name, x.role FROM (
  SELECT 'R. Adam Cannon' AS name, 'Private Wealth Advisor (joined 1997), The Ellis Group' AS role
  UNION ALL SELECT 'Keith Lum', 'Financial planning specialist (joined 2006), The Ellis Group'
  UNION ALL SELECT 'Tony Bollin, CFP, CDFA', 'Advisor (joined 2005), The Ellis Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 615) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 615 AND name = x.name);

-- ===== GROUP 387: Morgan Stanley Wealth Management, Shrewsbury, NJ =====
-- 616 Anthony Valente (The SVS Wealth Management Team)
UPDATE contacts SET
  address = '1030 Broad St, Fl 3',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Portfolio Management Director, "The SVS Wealth Management Team," Managing Director-Wealth Management, Senior Portfolio Management Director, Family Wealth Director, Morgan Stanley Shrewsbury NJ. Forbes Best-In-State #5 NJ 2026.')), 512)
WHERE id = 616;
INSERT INTO contact_people (contact_id, name, role)
SELECT 616, x.name, x.role FROM (
  SELECT 'Stephen J. Scanapicco' AS name, 'Co-Founder/Advisor, The SVS Wealth Management Team' AS role
  UNION ALL SELECT 'D. Tyler Gilmour', 'First Vice President, The SVS Wealth Management Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 616) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 616 AND name = x.name);

-- ===== GROUP 388: Burney Company, Reston, VA =====
-- 617 Lowell Pratt
UPDATE contacts SET
  address = '1800 Alexander Bell Dr., Suite 510',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Lowell Pratt Jr., CFA, President and Chairman of The Burney Company / Burney Wealth Management (fee-only RIA, founded 1974), Reston VA (joined 1986, President since 2003). Barron''s Top 1,200/1,500 #3 Virginia 2026 (13th consecutive year).')), 512)
WHERE id = 617;
INSERT INTO contact_people (contact_id, name, role)
SELECT 617, x.name, x.role FROM (
  SELECT 'Andy Pratt' AS name, 'Partner, Director of Investment Strategy/Portfolio Manager, The Burney Company' AS role
  UNION ALL SELECT 'William Stewart', 'Director of Analysis, The Burney Company'
  UNION ALL SELECT 'Adam Newman', 'Managing Partner, Wealth Management, The Burney Company'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 617) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 617 AND name = x.name);

-- ===== GROUP 389: Heritage Financial Services, Westwood, MA =====
-- 618 Charles S. Bean III
UPDATE contacts SET
  firm = 'Heritage Financial Services (now part of Savant Wealth Management)',
  title = 'Managing Partner and Financial Advisor',
  address = '100 Lowder Brook Drive, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Heritage Financial Services was acquired by Savant Wealth Management (deal closed Feb 27, 2026). Bean stepped down as Heritage CEO in 2023 (remained Founder/Chairman); now titled Managing Partner and Financial Advisor at Savant, still based in the Westwood MA office. Heritage ranked #8 Massachusetts/#43 nationally on Barron''s 2025 lists.')), 512)
WHERE id = 618;
INSERT INTO contact_people (contact_id, name, role)
SELECT 618, x.name, x.role FROM (
  SELECT 'Sammy Azzouz, JD, CFP' AS name, 'President & CEO, Savant Wealth Management (ex-Heritage)' AS role
  UNION ALL SELECT 'Paul J. Higgins', 'Financial Advisor, Savant Wealth Management (Westwood)'
  UNION ALL SELECT 'Michael R. Waldron', 'Senior Investment Strategist & Client Advisor, Savant Wealth Management (Westwood)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 618) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 618 AND name = x.name);

-- ===== GROUP 390: Wells Fargo Advisors, Linwood, NJ =====
-- 619 Mark Lippman (Linwood Wealth Management Group)
UPDATE contacts SET
  address = '1201 New Road, Cornerstone Commerce Center, Suite 207',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, leads "Linwood Wealth Management Group," Wells Fargo Advisors, Linwood NJ (ranked #1 NJ-South Jan 2026, manages $1.9B+). Barron''s Top 1,200 every year 2009-2025.')), 512)
WHERE id = 619;
INSERT INTO contact_people (contact_id, name, role)
SELECT 619, x.name, x.role FROM (
  SELECT 'Christopher Cobb' AS name, 'Managing Director-Investments, Linwood Wealth Management Group' AS role
  UNION ALL SELECT 'Rob Freed', 'Managing Director-Investments, Linwood Wealth Management Group'
  UNION ALL SELECT 'Steve Sinderbrand', 'Managing Director-Investments, Linwood Wealth Management Group'
  UNION ALL SELECT 'Donna Perez', 'Managing Director-Investment Officer, Linwood Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 619) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 619 AND name = x.name);

-- ===== GROUP 391: Bogart Wealth, McLean, VA =====
-- 620 James Bogart
UPDATE contacts SET
  address = '2010 Corporate Ridge',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO & Founder, Bogart Wealth (founded 2016, ~$3B AUM/AUA as of Jan 2025, ~55 employees), McLean VA. CRM phone (703) 506-4800 could not be corroborated; search-verified number is (703) 570-8651.')), 512)
WHERE id = 620;
INSERT INTO contact_people (contact_id, name, role)
SELECT 620, x.name, x.role FROM (
  SELECT 'Jeff Fuhrman' AS name, 'President, Bogart Wealth' AS role
  UNION ALL SELECT 'Allen Eickelberg', 'COO, Bogart Wealth'
  UNION ALL SELECT 'Aleksandr Spencer', 'Chief Investment Officer, Bogart Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 620) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 620 AND name = x.name);

-- ===== GROUP 392: Morgan Stanley Wealth Management, Fort Lauderdale, FL =====
-- 621 Trevor Fried (The Las Olas Group)
UPDATE contacts SET
  address = '350 East Las Olas Blvd, Suite 1500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Portfolio Management Director, founder of "The Las Olas Group," Morgan Stanley Fort Lauderdale FL. Barron''s Top 250 Private Wealth Management Teams (national) 2024 & 2025.')), 512)
WHERE id = 621;

-- ===== GROUP 393: Mariner, Tulsa, OK =====
-- 622 Jana Shoulders
UPDATE contacts SET
  address = '4200 E. Skelly Dr., Suite 950',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Principal & Senior Wealth Advisor, Mariner leadership Council, leads Mariner''s Tulsa/Oklahoma City/Amarillo offices (joined 2012 via Adams Hall Wealth Advisors merger). Barron''s Top 100 Women Advisors 2018-2025 (#53 in 2025); Forbes Best-In-State #2 Oklahoma 2025. CRM phone (913) 647-9700 is Mariner''s Overland Park KS corporate HQ line, not this branch''s direct number (918-991-6900); confirmed unrelated to id 608 Rob Thomas (State College PA) despite sharing this HQ number.')), 512)
WHERE id = 622;
INSERT INTO contact_people (contact_id, name, role)
SELECT 622, x.name, x.role FROM (
  SELECT 'Brodie Hinkle, CFP' AS name, 'Senior Wealth Advisor, Tulsa office' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 622) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 622 AND name = x.name);

-- ===== GROUP 394: Merrill Wealth Management, Bridgewater, NJ =====
-- 623 David Briegs (The Kugel Briegs Group)
UPDATE contacts SET
  address = '100 Somerset Corporate Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Partner, "The Kugel Briegs Group," Merrill Wealth Management, Bridgewater NJ (advisor since 1989). Barron''s Top 1,500 #1 NJ 2023-2026.')), 512)
WHERE id = 623;
INSERT INTO contact_people (contact_id, name, role)
SELECT 623, x.name, x.role FROM (
  SELECT 'Elliott Kugel' AS name, 'Advisor/co-founder, The Kugel Briegs Group' AS role
  UNION ALL SELECT 'Kyle Kost', 'Senior Financial Advisor, The Kugel Briegs Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 623) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 623 AND name = x.name);

-- ===== GROUP 395: UBS Wealth Management, Pittsburgh, PA =====
-- 624 James Rimmel (Rimmel Mehaffey Pessy Wealth Consulting Group)
UPDATE contacts SET
  address = '600 Grant Street, Suite 4650',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor at UBS since 1997, co-leads "Rimmel Mehaffey Pessy Wealth Consulting Group," Pittsburgh PA. Barron''s Top 1,200 2014-2025; Forbes #1 Best-In-State (PA) 2026; team #1 Forbes Best-In-State PA-West 2023/2024.')), 512)
WHERE id = 624;
INSERT INTO contact_people (contact_id, name, role)
SELECT 624, x.name, x.role FROM (
  SELECT 'Daniel Pessy' AS name, 'Financial Advisor/co-leader (joined team 2000), Rimmel Mehaffey Pessy Wealth Consulting Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 624) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 624 AND name = x.name);

-- ===== GROUP 396: Merrill Wealth Management, Red Bank, NJ =====
-- 626 Charles Belluardo (The Beacon Group)
UPDATE contacts SET
  address = '77 Broad Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, member/co-leader of "The Beacon Group," Merrill Red Bank NJ (~29+ yrs experience). Barron''s Top 1,200 2022/2025; Forbes Best-In-State 2018-2025.')), 512)
WHERE id = 626;
INSERT INTO contact_people (contact_id, name, role)
SELECT 626, x.name, x.role FROM (
  SELECT 'John Lembeck, C(k)P, CPFA' AS name, 'Managing Director, Senior Financial Advisor, The Beacon Group' AS role
  UNION ALL SELECT 'Sabrina Wiesel-Crammer, CPFA', 'Senior VP, Senior Financial Advisor, The Beacon Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 626) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 626 AND name = x.name);

-- ===== GROUP 397: UBS Wealth Management, Jackson, MS =====
-- 627 Bill "Rush" Mosby (Capitol Wealth Management)
UPDATE contacts SET
  address = '100 Vision Drive, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, Portfolio Manager, UBS Jackson MS (36+ yr UBS/PaineWebber career), leads "Capitol Wealth Management" (~$1.8B AUM). Forbes #1 Mississippi team 2025/2026.')), 512)
WHERE id = 627;
INSERT INTO contact_people (contact_id, name, role)
SELECT 627, x.name, x.role FROM (
  SELECT 'William R. "Will" Mosby' AS name, 'Financial Advisor (son of Rush), Capitol Wealth Management' AS role
  UNION ALL SELECT 'James Harmon Bays', 'Senior Vice President-Wealth Management, Capitol Wealth Management'
  UNION ALL SELECT 'J. Russell Morrison, Sr., CFP', 'Financial Advisor (joined Nov 2023 from Merrill Lynch), Capitol Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 627) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 627 AND name = x.name);

-- ===== GROUP 398: Ameriprise Financial, Mystic, CT =====
-- 628 Jason Cerniglia (Coastal Wealth Management)
UPDATE contacts SET
  address = '56 Williams Ave, 1st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO/Private Wealth Advisor, Ameriprise Financial Services, leads "Coastal Wealth Management," Mystic CT. Forbes Best-in-State Wealth Management Teams 2025; AdvisorHub "Advisors to Watch, over $1Bil" 2024/2025.')), 512)
WHERE id = 628;
INSERT INTO contact_people (contact_id, name, role)
SELECT 628, x.name, x.role FROM (
  SELECT 'Michael Kelley' AS name, 'Managing Director, Coastal Wealth Management' AS role
  UNION ALL SELECT 'Bryan Lauriat', 'Advisor (Forbes Top Next-Gen Wealth Advisor 2019), Coastal Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 628) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 628 AND name = x.name);

-- ===== GROUP 399: JNBA Financial Advisors, Bloomington, MN =====
-- 629 Richard S. Brown
UPDATE contacts SET
  address = '8500 Normandale Lake Blvd, Suite 450',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Chairman & CEO, JNBA Financial Advisors, leads the firm''s "Family Office Services" specialty group, Bloomington MN. Barron''s Top 1,500 for the 17th consecutive year (as of Apr 2026). CRM phone (952) 746-2003 differs from a firm number found in search (952.844.0995) — worth verifying which is the direct/team line.')), 512)
WHERE id = 629;
INSERT INTO contact_people (contact_id, name, role)
SELECT 629, x.name, x.role FROM (
  SELECT 'Kim Brown' AS name, 'President (wife of Richard, joined 2006), JNBA Financial Advisors' AS role
  UNION ALL SELECT 'Judith Brown', 'Founder (mother of Richard, founded JNBA 1978)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 629) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 629 AND name = x.name);

-- ===== GROUP 400: Key Financial, West Chester, PA =====
-- 631 Patti Brennan
UPDATE contacts SET
  address = '1045 Andrew Drive, Suite A',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President, CEO, and Chief Compliance Officer, Key Financial, Inc. (founded firm 1990/1997), West Chester PA. Barron''s #37 Top 100 Independent Advisors 2025, #16 Top 100 Women Financial Advisors 2025, Hall of Fame 2019; Forbes #1 PA/#14 nationally among women advisors 2025. CRM phone (610) 429-9050 differs from a number found in search ((610) 429-9279) — likely direct-line vs. main-line discrepancy.')), 512)
WHERE id = 631;
INSERT INTO contact_people (contact_id, name, role)
SELECT 631, x.name, x.role FROM (
  SELECT 'Michael Brennan, CFP' AS name, 'Planning & Portfolio Consultant, Key Financial' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 631) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 631 AND name = x.name);
