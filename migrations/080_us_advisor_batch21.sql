-- US Financial Advisor enrichment, batch 21 (21 contacts / 20 groups).
--
-- Two firm-change corrections: 648 Sandy Dalton and her entire team
-- departed UBS Private Wealth Management (Boise, ID) for RBC Wealth
-- Management on May 28, 2025, forming "Dalton Bahney Treinen Private
-- Wealth" in Eagle, ID (~$1.6B AUM, 8-person team). 655 Joseph Chornyak
-- and the full "Chornyak & Associates" team (14 people, ~$1.7B AUM)
-- left Janney Montgomery Scott for RIA Apollon Wealth Management in
-- June 2025 — Apollon's first Ohio office, same Columbus address.
--
-- Multiple phone data errors confirmed and corrected in data_flags
-- (phone column left untouched): 633 Slaggie Capital Group (216 area
-- code wrong, real is 507 — Winona MN); 651 Matthew Clark/William
-- Blair Baltimore (CRM number is a William Blair Funds SEC-filer line,
-- not Baltimore-specific; real is 410-612-3750); 656 Hall Financial
-- Advisors (CRM number unverifiable, real is 304-865-4442).
--
-- Confirmed family/colleague relationship: 637 Bryan Sadoff and 638
-- Michael Sadoff are brothers, sons of team founder Ron Sadoff, all
-- three core members of the "Sadoff Team" at Wealth Enhancement Group
-- (formed when their family RIA was acquired Sept 2022).
--
-- Confirmed two separate, unrelated teams sharing a building: 643
-- Charles "Chuck" Reardon (Compass Rose Group) and 903 Michael
-- Blackwell (Blackwell Carroll Group), both at 6565 Americas Pkwy NE,
-- Albuquerque NM — not colleagues.

-- ===== GROUP 401: Slaggie Capital Group, Winona, MN =====
-- 633 Michael Slaggie
UPDATE contacts SET
  address = '655 Franklin Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder (2010), Slaggie Capital Group, an independent Raymond James Financial Services office, Winona MN. Barron''s Top 1,200 2018-2025; Forbes Best-In-State #10 MN Private Wealth 2025. CORRECTION: CRM phone (216) 381-0900 carries a Cleveland OH area code and is incorrect — verified office number is (507) 474-3005.')), 512)
WHERE id = 633;
INSERT INTO contact_people (contact_id, name, role)
SELECT 633, x.name, x.role FROM (
  SELECT 'Matthew Slaggie' AS name, 'Director of Client Relations & Financial Advisor, Slaggie Capital Group' AS role
  UNION ALL SELECT 'Victoria Trouten', 'Director of Client Support, Slaggie Capital Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 633) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 633 AND name = x.name);

-- ===== GROUP 402: Ameriprise Financial, Exton, PA =====
-- 634 George Mastrogiorgos (Chester Springs Wealth Management Group)
UPDATE contacts SET
  address = '760 Constitution Drive, Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor with Ameriprise since 2003, practice "Chester Springs Wealth Management Group," Exton PA. Forbes Best-In-State #6 PA-East HNW Apr 2025; Ameriprise Circle of Success Chairman''s Advisory Council 2016-2024.')), 512)
WHERE id = 634;
INSERT INTO contact_people (contact_id, name, role)
SELECT 634, x.name, x.role FROM (
  SELECT 'Brad Krajsa, CFP' AS name, 'Financial Advisor, Chester Springs Wealth Management Group' AS role
  UNION ALL SELECT 'Alejandro Butters, CFP, ChFC, CLU', 'Private Wealth Advisor (Gettysburg PA office, same team), Chester Springs Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 634) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 634 AND name = x.name);

-- ===== GROUP 403: Merrill Wealth Management, Wellesley, MA =====
-- 635 Eric Breemen (Breemen McCarthy McKenna & Associates)
UPDATE contacts SET
  address = '45 William Street, Suite 100, Wellesley Hills, MA 02481',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor/Managing Director, team "Breemen McCarthy McKenna & Associates," Merrill Wellesley Hills MA (~30 yrs at Merrill). Barron''s Top 1,200 2025; Forbes 2025 Top Wealth Management Teams (HNW).')), 512)
WHERE id = 635;
INSERT INTO contact_people (contact_id, name, role)
SELECT 635, x.name, x.role FROM (
  SELECT 'Ryan McKenna' AS name, 'Financial Advisor, Breemen McCarthy McKenna & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 635) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 635 AND name = x.name);

-- ===== GROUP 404: Wealth Enhancement Group, Milwaukee, WI =====
-- 637 Bryan Sadoff, 638 Michael Sadoff (brothers, "Sadoff Team")
UPDATE contacts SET
  address = '250 W. Coventry Court, Suite 109',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, "Sadoff Team," Wealth Enhancement Group, Milwaukee WI. Confirmed brother of id 638 Michael Sadoff, both sons of founder Ron Sadoff (family RIA acquired by Wealth Enhancement Sept 2022). Barron''s Top 1,200 2025 (10th consecutive year); Forbes Best-in-State 2023-2025. CRM phone (763) 417-1700 is Wealth Enhancement''s Plymouth MN corporate HQ line, not this branch — direct line (414) 352-8460.')), 512)
WHERE id = 637;
UPDATE contacts SET
  address = '250 W. Coventry Court, Suite 109',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, "Sadoff Team," Wealth Enhancement Group, Milwaukee WI. Confirmed brother of id 637 Bryan Sadoff, both sons of founder Ron Sadoff. Barron''s Top 1,200 2025; Forbes Best-in-State #2 Greater Milwaukee 2026. CRM phone (763) 417-1700 is Wealth Enhancement''s Plymouth MN corporate HQ line, not this branch — direct line (414) 352-8460.')), 512)
WHERE id = 638;
INSERT INTO contact_people (contact_id, name, role)
SELECT 637, x.name, x.role FROM (
  SELECT 'Ronald Sadoff' AS name, 'Senior Vice President, Financial Advisor / Founder (father of Bryan and Michael), Sadoff Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 637) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 637 AND name = x.name);

-- ===== GROUP 405: Baird, Bowling Green, KY =====
-- 639 Shannon Vitale (The Vitale Group)
UPDATE contacts SET
  address = '360 East 8th Avenue, Suite 211',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor & Branch Manager, leads "The Vitale Group," Baird Bowling Green KY. Forbes Best-In-State #2 Top Women Wealth Advisors KY, #15 Best-In-State overall, 2025.')), 512)
WHERE id = 639;
INSERT INTO contact_people (contact_id, name, role)
SELECT 639, x.name, x.role FROM (
  SELECT 'Matthew Garrett, CFP, QPFC, CPWA' AS name, 'Advisor (joined 2008), The Vitale Group' AS role
  UNION ALL SELECT 'Monica Taylor, CFP', 'Advisor (joined 2018), The Vitale Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 639) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 639 AND name = x.name);

-- ===== GROUP 406: Glassman Wealth Services, Vienna, VA =====
-- 640 Barry Glassman
UPDATE contacts SET
  address = '8000 Towers Crescent Dr, Suite 1450',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/Founder, Glassman Wealth Services, Vienna VA (firm also has a North Bethesda MD office). Forbes Best-In-State #5 2026. CRM phone (703) 891-9960 differs from the firm''s listed main line (703) 534-4444 — worth verifying which is current.')), 512)
WHERE id = 640;
INSERT INTO contact_people (contact_id, name, role)
SELECT 640, x.name, x.role FROM (
  SELECT 'Eric Dunner, JD, CFP' AS name, 'Principal, Glassman Wealth Services' AS role
  UNION ALL SELECT 'Travis Russell, CFP', 'Principal and Client Advisor, Glassman Wealth Services'
  UNION ALL SELECT 'Dana Sippel, CFP, CPA/PFS', 'Vice President and Client Advisor, Glassman Wealth Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 640) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 640 AND name = x.name);

-- ===== GROUP 407: RBC Wealth Management, Naples, FL =====
-- 642 Brad Wheelock (Wheelock Investment Group)
UPDATE contacts SET
  address = '800 Laurel Oak Dr, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Managing Director-Financial Advisor, "Wheelock Investment Group," RBC Naples FL (team also has a St. Cloud MN office). Barron''s Top 1,200 2025; Forbes Best-In-State #11 FL-South HNW 2025/2026.')), 512)
WHERE id = 642;

-- ===== GROUP 408: Morgan Stanley Wealth Management, Albuquerque, NM =====
-- 643 Charles Reardon (Compass Rose Group), 903 Michael Blackwell (Blackwell Carroll Group) — separate teams
UPDATE contacts SET
  address = '6565 Americas Pkwy NE, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Goes by "Chuck," Managing Director, Executive Director & Wealth Advisor, leads Long-Term Financial Planning practice of "The Compass Rose Group" (offices in Albuquerque, Santa Fe NM, Scottsdale AZ; ~$2.7B AUM), Morgan Stanley Albuquerque NM (37+ yrs at MS). Barron''s Top 1000/1200 2009-2025; Forbes Best-In-State NM #8 2025. Id 903 Michael Blackwell leads a separate, unrelated team ("Blackwell Carroll Group") at the same building.')), 512)
WHERE id = 643;
UPDATE contacts SET
  address = '6565 Americas Pkwy NE, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, CFP, leads "The Blackwell Carroll Group," Morgan Stanley Albuquerque NM (joined MS 2007, Chairman''s Club since 2022). Barron''s Top 1,200 2017-2025 (#1 NM); Forbes Best-In-State #1 NM 2022-2024. Id 643 Charles Reardon leads a separate, unrelated team ("The Compass Rose Group") at the same building.')), 512)
WHERE id = 903;
INSERT INTO contact_people (contact_id, name, role)
SELECT 643, x.name, x.role FROM (
  SELECT 'Will Reardon' AS name, 'Senior VP, Alternative Investments Director, Portfolio Management Director & Financial Advisor, The Compass Rose Group' AS role
  UNION ALL SELECT 'Julien Hall', 'AVP, Investment Consultant & Team COO, The Compass Rose Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 643) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 643 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 903, x.name, x.role FROM (
  SELECT 'Charlie Carroll, CFP' AS name, 'Financial Advisor (joined MS 2001), Blackwell Carroll Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 903) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 903 AND name = x.name);

-- ===== GROUP 409: The Wealth Alliance, Boca Raton, FL =====
-- 644 Eric Diton
UPDATE contacts SET
  address = '6501 Congress Avenue, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & Managing Director, The Wealth Alliance (RIA founded Aug 2019 by Diton and Robert Conzo; HQ Melville NY, with Boca Raton office). Forbes/SHOOK Best-in-State (South Florida) 2026; Barron''s Top 1,200 Mar 2024/2025.')), 512)
WHERE id = 644;
INSERT INTO contact_people (contact_id, name, role)
SELECT 644, x.name, x.role FROM (
  SELECT 'Robert Conzo' AS name, 'Co-Founder/CEO (Melville NY HQ), The Wealth Alliance' AS role
  UNION ALL SELECT 'Paul Camhi, CFP, CIMA', 'Vice President & Senior Financial Advisor, The Wealth Alliance'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 644) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 644 AND name = x.name);

-- ===== GROUP 410: Gryphon Financial Partners, Columbus, OH =====
-- 645 Joel Guth
UPDATE contacts SET
  address = '325 John H. McConnell Blvd., Suite 425',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO & Founder, Gryphon Financial Partners (founded May 2014, now also has Cincinnati and Toledo offices), Columbus OH. Columbus Business First Ohio Top Advisor List; Columbus C.E.O. Magazine Superstar List. CRM phone (614) 586-7600 differs from a publicly listed number (614) 929-2880 for this address — worth verifying.')), 512)
WHERE id = 645;
INSERT INTO contact_people (contact_id, name, role)
SELECT 645, x.name, x.role FROM (
  SELECT 'Robert Swansboro, CFP' AS name, 'Portfolio Manager/wealth planning, Gryphon Financial Partners' AS role
  UNION ALL SELECT 'Johnny DiOrio', 'Investment Solutions team (asset allocation/alternatives), Gryphon Financial Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 645) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 645 AND name = x.name);

-- ===== GROUP 411: RBC Wealth Management, Bel Air, MD =====
-- 646 Bryon Epple (The Shaeffer Wealth Advisory Group)
UPDATE contacts SET
  address = '108 South Bond Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Financial Advisor, lead advisor of "The Shaeffer Wealth Advisory Group," RBC Bel Air MD (started as an intern 1997, team founded by Charles "Pete" Shaeffer Jr.). Barron''s Top 1,500 2026; Forbes Best-In-State 2026.')), 512)
WHERE id = 646;
INSERT INTO contact_people (contact_id, name, role)
SELECT 646, x.name, x.role FROM (
  SELECT 'John Sutton' AS name, 'Lead Advisor (joined as intern 1996), The Shaeffer Wealth Advisory Group' AS role
  UNION ALL SELECT 'Daniel A. Petro, CFP, CPFA', 'Advisor, The Shaeffer Wealth Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 646) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 646 AND name = x.name);

-- ===== GROUP 412: UBS Private Wealth Management, Boise, ID (actual firm: RBC Wealth Management, Eagle, ID) =====
-- 648 Sandy Dalton
UPDATE contacts SET
  firm = 'RBC Wealth Management',
  title = 'Senior Vice President - Financial Advisor',
  address = '661 South Rivershore Lane, Suite 200, Eagle, ID 83616',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Sandra "Sandy" Dalton and her full team departed UBS Private Wealth Management (Boise ID) for RBC Wealth Management on May 28, 2025, forming "Dalton Bahney Treinen Private Wealth" in Eagle ID (8-person team, ~$1.6B AUM). Team retained the "Powers" name in some listings, but 30-yr veteran Charles Powers III stayed at UBS and did not move.')), 512)
WHERE id = 648;
INSERT INTO contact_people (contact_id, name, role)
SELECT 648, x.name, x.role FROM (
  SELECT 'William "Bill" Bahney' AS name, 'Senior VP - Financial Advisor (50-yr veteran), Dalton Bahney Treinen Private Wealth' AS role
  UNION ALL SELECT 'Michael S. Treinen', 'SVP - Financial Advisor, Dalton Bahney Treinen Private Wealth'
  UNION ALL SELECT 'Benjamin G. Dalton', 'SVP - Financial Advisor (son of Sandra), Dalton Bahney Treinen Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 648) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 648 AND name = x.name);

-- ===== GROUP 413: RBC Wealth Management, Richmond, VA =====
-- 649 Brian Ford (The Ford Group)
UPDATE contacts SET
  address = '919 East Main Street, Suite 2000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, Senior Portfolio Manager, leads "The Ford Group," RBC Richmond VA. Forbes Best-In-State #5 VA-South 2025/2026. CRM phone (804) 359-3900 may be an older/general branch line vs. current direct number (804) 225-1422 — same building.')), 512)
WHERE id = 649;

-- ===== GROUP 414: Morgan Stanley Wealth Management, Rochester, MN =====
-- 650 David A. Olson (The BlackRidge Group)
UPDATE contacts SET
  address = '14 Second Street SW, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founding partner of "The BlackRidge Group" (team also in Bloomington MN), Morgan Stanley Rochester MN (with firm/predecessors since 1985; branch manager 2000-2022). Barron''s Top 1,500 Mar 2026; Forbes Best-in-State 2025.')), 512)
WHERE id = 650;
INSERT INTO contact_people (contact_id, name, role)
SELECT 650, x.name, x.role FROM (
  SELECT 'Jana L. Holst' AS name, 'Group Director, Financial Planning Specialist, The BlackRidge Group' AS role
  UNION ALL SELECT 'Andrea Mackay', 'Wealth Management Associate, Financial Planning Specialist, The BlackRidge Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 650) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 650 AND name = x.name);

-- ===== GROUP 415: William Blair, Baltimore, MD =====
-- 651 Matthew Clark (Lighthouse Wealth Management)
UPDATE contacts SET
  address = '100 International Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner/Wealth Advisor, team "Lighthouse Wealth Management" (William Blair''s first Private Wealth Management office in the Mid-Atlantic), Baltimore MD (previously partner/portfolio manager at Brown Advisory). Barron''s top-in-state 2024/2026; Forbes best-in-state 2025. CORRECTION: CRM phone (312) 364-8000 is a William Blair Funds SEC-filer registrant number (150 N Riverside Plaza, Chicago), not a Baltimore-specific line — correct branch number is (410) 612-3750.')), 512)
WHERE id = 651;
INSERT INTO contact_people (contact_id, name, role)
SELECT 651, x.name, x.role FROM (
  SELECT 'Mitchell D. Whiteman' AS name, 'Managing Director, Wealth Advisor, Lighthouse Wealth Management' AS role
  UNION ALL SELECT 'David Dreifuss', 'Wealth Advisor (Financial Planning Top 40 Under 40), Lighthouse Wealth Management'
  UNION ALL SELECT 'Andrew Feichter', 'Wealth Advisor (Financial Planning Top 40 Under 40), Lighthouse Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 651) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 651 AND name = x.name);

-- ===== GROUP 416: RBC Wealth Management, Farmington, CT =====
-- 652 Dennis Stanek Jr. (The Standard Group)
UPDATE contacts SET
  address = '30 Batterson Park Road, Suite 350',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, leads "The Standard Group," RBC Farmington CT (33+ yrs in industry). Forbes Best-In-State #17 CT 2025/2026; Barron''s Top 1,500 2026.')), 512)
WHERE id = 652;

-- ===== GROUP 417: Eagleton Brown Investment Group | Wells Fargo Advisors FiNet, Tulsa, OK =====
-- 654 Jim Eagleton
UPDATE contacts SET
  address = '4940 S Columbia Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding/Senior Financial Advisor, Eagleton Brown Investment Group, Wells Fargo Advisors FiNet, Tulsa OK (family-based, 7-person team formed 2011). Forbes Best-In-State #66 Oklahoma 2026.')), 512)
WHERE id = 654;
INSERT INTO contact_people (contact_id, name, role)
SELECT 654, x.name, x.role FROM (
  SELECT 'T. Paul Eagleton' AS name, 'Senior Financial Advisor, Eagleton Brown Investment Group' AS role
  UNION ALL SELECT 'Kent Brown, CFP', 'Financial Advisor, Eagleton Brown Investment Group'
  UNION ALL SELECT 'Mindy Brown', 'Senior Registered Associate, Eagleton Brown Investment Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 654) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 654 AND name = x.name);

-- ===== GROUP 418: Janney Montgomery Scott, Columbus, OH (actual firm: Apollon Wealth Management) =====
-- 655 Joseph Chornyak
UPDATE contacts SET
  firm = 'Apollon Wealth Management (Chornyak & Associates)',
  title = 'Managing Partner',
  address = '716 Mt. Airyshire Blvd, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Joseph A. Chornyak Sr. and the full "Chornyak & Associates" team (14 people, ~$1.7B AUM) departed Janney Montgomery Scott for RIA Apollon Wealth Management in June 2025 — Apollon''s first Ohio office, same Columbus address.')), 512)
WHERE id = 655;
INSERT INTO contact_people (contact_id, name, role)
SELECT 655, x.name, x.role FROM (
  SELECT 'Joseph A. Chornyak Jr., CFP' AS name, 'Advisor (with practice since 1993, oversees internal ops/marketing), Chornyak & Associates' AS role
  UNION ALL SELECT 'Susan Bickel', 'Advisor (15+ yrs wealth mgmt), Chornyak & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 655) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 655 AND name = x.name);

-- ===== GROUP 419: Hall Financial Advisors, Parkersburg, WV =====
-- 656 Christopher Hall
UPDATE contacts SET
  address = '1101 Rosemar Rd, Suite A',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner & CEO, Hall Financial Advisors, Senior Financial Advisor with Raymond James Financial Services, Parkersburg WV (firm also has a Marietta OH office). Barron''s Top 1,200 2025, state-by-state list 13 of last 14 years. CORRECTION: CRM phone (304) 424-7000 could not be verified anywhere — correct numbers are (304) 865-4442 local / (866) 865-4442 toll-free.')), 512)
WHERE id = 656;
INSERT INTO contact_people (contact_id, name, role)
SELECT 656, x.name, x.role FROM (
  SELECT 'Zane Eschbaugh' AS name, 'Financial Advisor (joined 2019), Hall Financial Advisors' AS role
  UNION ALL SELECT 'Kevin Knab', 'Financial Advisor (joined 2017), Hall Financial Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 656) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 656 AND name = x.name);

-- ===== GROUP 420: Truist Investment Services, Charleston, WV =====
-- 657 David Houchins (The Houchins Group)
UPDATE contacts SET
  address = '300 Summers St, Suite 620',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Managing Director and Financial Advisor, leads "The Houchins Group," Truist Investment Services, Charleston WV (with firm/predecessors since 1988). Barron''s Top 1,500 2026 (#2 WV); Forbes/SHOOK Best-in-State Wealth Management Team #2 WV 2025.')), 512)
WHERE id = 657;
INSERT INTO contact_people (contact_id, name, role)
SELECT 657, x.name, x.role FROM (
  SELECT 'Andy Ginther' AS name, 'Vice President & Financial Advisor (joined 2004), The Houchins Group' AS role
  UNION ALL SELECT 'Gordon Savage, CFP, ChFC', 'Managing Director & Financial Advisor (joined 2005), The Houchins Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 657) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 657 AND name = x.name);
