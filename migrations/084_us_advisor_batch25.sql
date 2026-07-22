-- US Financial Advisor enrichment, batch 25 (21 contacts / 20 groups).
--
-- Firm-change correction: 767 Jack Broderick, his son John X.
-- Broderick, and Jason Mingelgreen departed Stifel (Park City, UT) for
-- Rockefeller Capital Management on Feb 14, 2025, taking a ~$1B
-- ultra-high-net-worth book. Team now "Broderick Mingelgreen Wealth
-- Partners," based primarily out of Rockefeller's New York office.
--
-- Location note: 757 Brian Doyle's CRM city "Hanover, NH" is his
-- personal residence — the actual Doyle & Loughman branch office is
-- in adjacent Lebanon, NH.
--
-- Confirmed two Morgan Stanley Tulsa advisors (764/1012) are separate,
-- unrelated teams ("Galvin Wolever Davis Wealth Management Group" vs.
-- "Carson Roberds Wealth Management") sharing one building's branch
-- line, consistent with the recurring shared-switchboard pattern.

-- ===== GROUP 481: Ascend Advisory Group, Dublin, OH =====
-- 747 Anthony Reilly
UPDATE contacts SET
  address = '6760 Perimeter Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO and 100% owner, Ascend Advisory Group (founded 2001, ~$2.5B AUM as of 12/31/25; affiliated with Wells Fargo Advisors Financial Network), Dublin OH. Barron''s Top 1,200 2026. CRM phone (614) 705-2888 unverified; public listings show (614) 784-6000 as the firm''s main line.')), 512)
WHERE id = 747;
INSERT INTO contact_people (contact_id, name, role)
SELECT 747, x.name, x.role FROM (
  SELECT 'Michael Aljancic, CPWA, CFP' AS name, 'Managing Director, Financial Advisor, Ascend Advisory Group' AS role
  UNION ALL SELECT 'David Thompson, CFP', 'Financial Advisor (joined 2010), Ascend Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 747) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 747 AND name = x.name);

-- ===== GROUP 482: UBS Private Wealth Management, Portland, OR =====
-- 749 Jonathan Levine (Lang-Vista Group)
UPDATE contacts SET
  address = '760 SW 9th Ave, Suite 2450',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, co-leads "Lang-Vista Group" (also "Vista Group"), UBS Portland OR (30+ yrs, only UBS Institutional Consultant in Oregon). Forbes Best-In-State #18 Oregon 2026.')), 512)
WHERE id = 749;
INSERT INTO contact_people (contact_id, name, role)
SELECT 749, x.name, x.role FROM (
  SELECT 'Edward Lang' AS name, 'Managing Director, Senior Portfolio Manager (co-lead), Lang-Vista Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 749) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 749 AND name = x.name);

-- ===== GROUP 483: Merrill Wealth Management, Phoenix, AZ =====
-- 750 Brian Friedman (The Friedman Group)
UPDATE contacts SET
  address = '2555 E Camelback Rd, #900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor, leads "The Friedman Group," Merrill Phoenix AZ. Forbes Best-in-State Wealth Management Teams 2025; individually #5 Arizona Private Wealth Apr 2025.')), 512)
WHERE id = 750;
INSERT INTO contact_people (contact_id, name, role)
SELECT 750, x.name, x.role FROM (
  SELECT 'Ken Grossnickle' AS name, 'First Vice President, Wealth Management Advisor, The Friedman Group' AS role
  UNION ALL SELECT 'Lisa Kubica', 'First Vice President, Senior Financial Advisor, The Friedman Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 750) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 750 AND name = x.name);

-- ===== GROUP 484: Janney Montgomery Scott, New Haven, CT =====
-- 752 Charles J. Noble III (Noble Wealth Advisors)
UPDATE contacts SET
  address = '321 Whitney Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Vice President/Wealth Management, Financial Advisor (Branch Office Manager), leads "Noble Wealth Advisors," Janney New Haven CT (in industry since 1980, team manages $1B+). Barron''s Top 1,200 annually since 2014; Forbes Top 250 since 2019.')), 512)
WHERE id = 752;
INSERT INTO contact_people (contact_id, name, role)
SELECT 752, x.name, x.role FROM (
  SELECT 'Charles J. Noble IV' AS name, 'Financial Advisor, Noble Wealth Advisors' AS role
  UNION ALL SELECT 'Melanie E. Kregling, CFP, AWMA', 'First Vice President/Wealth Management, Noble Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 752) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 752 AND name = x.name);

-- ===== GROUP 485: Wells Fargo Advisors, Alexandria, VA =====
-- 754 Ryan Sprowls (114 Private Wealth)
UPDATE contacts SET
  address = '1900 Duke Street, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/CEO and founding member of "114 Private Wealth" (Wells Fargo Advisors FiNet), Alexandria VA (27+ yrs, CFP/AAMS). Forbes Top 250 Wealth Advisor 2026; Barron''s Top 1,500.')), 512)
WHERE id = 754;
INSERT INTO contact_people (contact_id, name, role)
SELECT 754, x.name, x.role FROM (
  SELECT 'Ryan Bortner' AS name, 'Managing Principal & COO, 114 Private Wealth' AS role
  UNION ALL SELECT 'Charles "Chuck" Markson', 'EVP, Wealth Advisor, 114 Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 754) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 754 AND name = x.name);

-- ===== GROUP 486: Ameriprise Financial, Crestview Hills, KY =====
-- 755 Douglas Kisker (Fidant Wealth Partners)
UPDATE contacts SET
  address = '740 Centre View Blvd, Fl 5',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor and CEO of "Fidant Wealth Partners," Ameriprise Crestview Hills KY (CRPC, APMA).')), 512)
WHERE id = 755;
INSERT INTO contact_people (contact_id, name, role)
SELECT 755, x.name, x.role FROM (
  SELECT 'David Girmann' AS name, 'Private Wealth Advisor / Business Financial Advisor, Fidant Wealth Partners' AS role
  UNION ALL SELECT 'F. Pat Cunnane, APMA', 'Financial Advisor, Fidant Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 755) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 755 AND name = x.name);

-- ===== GROUP 487: Merrill Wealth Management, Lexington, KY =====
-- 756 Travis Musgrave (Musgrave Dunn & Associates)
UPDATE contacts SET
  address = '300 W Vine St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor (33+ yrs with Merrill), leads "Musgrave Dunn & Associates," Merrill Lexington KY. Forbes #1 Best-In-State Wealth Management Team Kentucky 2025; individually #2 Best-In-State Kentucky.')), 512)
WHERE id = 756;
INSERT INTO contact_people (contact_id, name, role)
SELECT 756, x.name, x.role FROM (
  SELECT 'Timothy Dunn' AS name, 'Senior Financial Advisor, Musgrave Dunn & Associates' AS role
  UNION ALL SELECT 'Valerie Marshall', 'Financial Advisor, Musgrave Dunn & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 756) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 756 AND name = x.name);

-- ===== GROUP 488: Doyle & Loughman Wealth Mgmt | Wells Fargo Advisors FiNet, Hanover, NH (actual office: Lebanon, NH) =====
-- 757 Brian Doyle
UPDATE contacts SET
  address = '35 Centerra Parkway, Suite 201, Lebanon, NH 03766',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LOCATION NOTE: CRM lists city as Hanover, NH — that is Doyle''s personal residence; the branch office itself is in adjacent Lebanon, NH. Confirmed current — Executive Managing Partner & Senior Wealth Manager, Wells Fargo Advisors FiNet, co-leads "Doyle and Loughman Wealth Management Group" with Stephen Loughman. Platinum Council Advisor 2014-2025; Forbes Best-In-State #9 NH 2026.')), 512)
WHERE id = 757;
INSERT INTO contact_people (contact_id, name, role)
SELECT 757, x.name, x.role FROM (
  SELECT 'Stephen Loughman' AS name, 'Executive Managing Partner & Senior Wealth Manager (co-lead), Doyle and Loughman Wealth Management Group' AS role
  UNION ALL SELECT 'Kristen Laundry, AAMS', 'Financial Advisor, Doyle and Loughman Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 757) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 757 AND name = x.name);

-- ===== GROUP 489: Baird, Murfreesboro, TN =====
-- 758 Yaz Hassan (The Hassan Oldham Group)
UPDATE contacts SET
  address = '1639 Medical Center Parkway, Suite 305',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, "The Hassan Oldham Group," Baird Murfreesboro TN. Barron''s Top 1,200 10 consecutive years; Forbes Best-In-State 2026.')), 512)
WHERE id = 758;
INSERT INTO contact_people (contact_id, name, role)
SELECT 758, x.name, x.role FROM (
  SELECT 'Justin Oldham, CPWA' AS name, 'Managing Director / Co-founder, The Hassan Oldham Group' AS role
  UNION ALL SELECT 'Karley Rouse, CFP, EA', 'Financial Planner, The Hassan Oldham Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 758) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 758 AND name = x.name);

-- ===== GROUP 490: Wells Fargo Advisors, Suffolk, VA =====
-- 759 Scott Carr (Carr Investment Group)
UPDATE contacts SET
  address = '400 N Main Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, leads "Carr Investment Group" (offices in Suffolk and Franklin VA), Wells Fargo Advisors Suffolk VA. Barron''s Top 1,200 2025; Forbes Best-In-State 2018-2025.')), 512)
WHERE id = 759;
INSERT INTO contact_people (contact_id, name, role)
SELECT 759, x.name, x.role FROM (
  SELECT 'Elaine Fenters' AS name, 'Senior VP-Investment Officer / Financial Advisor, Carr Investment Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 759) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 759 AND name = x.name);

-- ===== GROUP 491: Morgan Stanley Wealth Management, Providence, RI =====
-- 760 John Zitzmann (The Zitzmann Group)
UPDATE contacts SET
  address = 'One Financial Plaza, 19th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Advisor, leads "The Zitzmann Group," Morgan Stanley Providence RI. Barron''s Top 1,200 RI (#3 in 2021, continued recognition through 2026).')), 512)
WHERE id = 760;
INSERT INTO contact_people (contact_id, name, role)
SELECT 760, x.name, x.role FROM (
  SELECT 'Aaron Osei' AS name, 'Wealth Management Associate, The Zitzmann Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 760) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 760 AND name = x.name);

-- ===== GROUP 492: Pinnacle Asset Management | Raymond James, Nashville, TN =====
-- 761 Brock Kidd (Kidd Private Wealth Group)
UPDATE contacts SET
  address = '2300 West End Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner/Senior VP, Pinnacle Asset Management, and Private Wealth Manager, Raymond James Financial Services, leads "Kidd Private Wealth Group" (~$1.3-1.6B AUM), Nashville TN. Barron''s Top 1,200 #2 TN 2025; Forbes #4 Best-In-State 2026.')), 512)
WHERE id = 761;
INSERT INTO contact_people (contact_id, name, role)
SELECT 761, x.name, x.role FROM (
  SELECT 'James Hundley, CFP' AS name, 'Partner (financial planning), Kidd Private Wealth Group' AS role
  UNION ALL SELECT 'Jeannine Nalley', 'Practice Manager, Kidd Private Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 761) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 761 AND name = x.name);

-- ===== GROUP 493: RBC Wealth Management, Wayzata, MN =====
-- 762 Aaron Howe (Big Water Group)
UPDATE contacts SET
  address = '641 E. Lake Street, Suite 230',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, leads "Big Water Group," RBC Wayzata MN. Forbes Best-In-State #7 MN 2026; Big Water Group ranked #4 MN High Net Worth Jan 2026.')), 512)
WHERE id = 762;

-- ===== GROUP 494: Merrill Wealth Management, Reno, NV =====
-- 763 Phillip Scott (The Scott Group)
UPDATE contacts SET
  address = '5370 Kietzke Lane',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor/Senior Portfolio Manager, leads "The Scott Group," Merrill Reno NV (~41 yrs in industry since 1985).')), 512)
WHERE id = 763;
INSERT INTO contact_people (contact_id, name, role)
SELECT 763, x.name, x.role FROM (
  SELECT 'Edgar Manjarrez, CPFA, CRPS' AS name, 'Financial Advisor, The Scott Group' AS role
  UNION ALL SELECT 'Jeffrey N. Jenkins', 'Vice President, Financial Advisor, The Scott Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 763) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 763 AND name = x.name);

-- ===== GROUP 495: Morgan Stanley Wealth Management, Tulsa, OK =====
-- 764 Jeff Galvin (Galvin Wolever Davis), 1012 Elizabeth Carson (Carson Roberds) — confirmed separate teams
UPDATE contacts SET
  address = '2200 S Utica Place, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Family Wealth Director, member of "Galvin Wolever Davis Wealth Management Group," Morgan Stanley Tulsa OK. Barron''s Top 1,200 2021-2025; Forbes Best-in-State #7 Oklahoma. Id 1012 Elizabeth Carson leads a separate, unrelated team ("Carson Roberds Wealth Management") in the same building.')), 512)
WHERE id = 764;
UPDATE contacts SET
  address = '2200 S Utica Place, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Director, Family Wealth Director, Financial Advisor, leads "Carson Roberds Wealth Management" (with Sanford J. Roberds), Morgan Stanley Tulsa OK. Forbes Best-in-State 2020/2021. Id 764 Jeff Galvin leads a separate, unrelated team in the same building.')), 512)
WHERE id = 1012;
INSERT INTO contact_people (contact_id, name, role)
SELECT 764, x.name, x.role FROM (
  SELECT 'Tad Davis' AS name, 'Financial Advisor, Galvin Wolever Davis Wealth Management Group' AS role
  UNION ALL SELECT 'Kent Wolever', 'Financial Advisor, Galvin Wolever Davis Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 764) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 764 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1012, x.name, x.role FROM (
  SELECT 'Sanford J. Roberds' AS name, 'Executive Director, Portfolio Management Director, Financial Advisor, Carson Roberds Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1012) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1012 AND name = x.name);

-- ===== GROUP 496: CD Wealth Management, Dallas, TX =====
-- 765 Scott Cohen
UPDATE contacts SET
  address = '16400 Dallas Pkwy, Suite 310',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and Executive Chairman, CD Wealth Management (founded June 30, 2014), Dallas TX. Barron''s Top 1,200 #34 TX 2025; Forbes Best-in-State #7 2025 (5th consecutive year). CRM phone (214) 459-4850 could not be corroborated; current listed phone is (972) 499-6280.')), 512)
WHERE id = 765;
INSERT INTO contact_people (contact_id, name, role)
SELECT 765, x.name, x.role FROM (
  SELECT 'Ilona Friedman' AS name, 'Chief Executive Officer, CD Wealth Management' AS role
  UNION ALL SELECT 'Andy Dropkin', 'Chief Investment Officer, CD Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 765) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 765 AND name = x.name);

-- ===== GROUP 497: Merrill Wealth Management, Boise, ID =====
-- 766 Uwe Ruttke (RCF Group)
UPDATE contacts SET
  address = '225 N. 9th Street, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, member of the "RCF Group" (also operates out of Pleasanton CA), Merrill Boise ID. Barron''s Top 1,200 Mar 2025; RCF Group Forbes Best-in-State Wealth Management Teams Jan 2026.')), 512)
WHERE id = 766;
INSERT INTO contact_people (contact_id, name, role)
SELECT 766, x.name, x.role FROM (
  SELECT 'Gareth Lansing Crossley' AS name, 'VP, Wealth Management Advisor, RCF Group' AS role
  UNION ALL SELECT 'Ted Joseph Fichter', 'VP, Senior Financial Advisor, RCF Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 766) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 766 AND name = x.name);

-- ===== GROUP 498: Stifel, Park City, UT (actual firm: Rockefeller Capital Management) =====
-- 767 Jack Broderick
UPDATE contacts SET
  firm = 'Rockefeller Capital Management (Broderick Mingelgreen Wealth Partners)',
  title = 'Private Advisor & Managing Director',
  address = '45 Rockefeller Plaza, New York, NY 10111',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Jack C. Broderick, his son John X. Broderick, and Jason R. Mingelgreen departed Stifel (Park City, UT) for Rockefeller Capital Management on Feb 14, 2025, taking a ~$1B ultra-high-net-worth book. Team now branded "Broderick Mingelgreen Wealth Partners," based primarily out of Rockefeller''s New York office; Broderick reportedly still splits time between NY and Park City UT, but no distinct Rockefeller Park City office address was found.')), 512)
WHERE id = 767;
INSERT INTO contact_people (contact_id, name, role)
SELECT 767, x.name, x.role FROM (
  SELECT 'John X. Broderick, CFA' AS name, 'Team member (son, ex-Credit Suisse), Broderick Mingelgreen Wealth Partners' AS role
  UNION ALL SELECT 'Jason R. Mingelgreen, CFA', 'Team co-lead, Broderick Mingelgreen Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 767) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 767 AND name = x.name);

-- ===== GROUP 499: Harrison Financial | Northwestern Mutual, Omaha, NE =====
-- 768 Tim Harrison
UPDATE contacts SET
  address = '13609 California Street, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Harrison Financial Services, a Private Client Group practice within Northwestern Mutual (~25-30 team members, $1.4B+ AUM), Omaha NE (relocated to new HQ Sept 2025). Barron''s Top 1,200 2025; Forbes Best-In-State 2025.')), 512)
WHERE id = 768;
INSERT INTO contact_people (contact_id, name, role)
SELECT 768, x.name, x.role FROM (
  SELECT 'Nikki Irish' AS name, 'Director of Operations, Harrison Financial Services' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 768) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 768 AND name = x.name);

-- ===== GROUP 500: Wells Fargo Advisors, Oklahoma City, OK =====
-- 769 Jeffrey Blumenthal (Blumenthal-Harlin Financial Group)
UPDATE contacts SET
  address = '211 North Robinson, One Leadership Square, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, lead advisor of "The Blumenthal-Harlin Financial Group of Wells Fargo Advisors" (group has served clients 60+ years), Oklahoma City OK. Platinum Council Advisor 1997-2024; Barron''s Top 1,200 every year 2014-2025; Forbes Best-In-State 2021-2024.')), 512)
WHERE id = 769;
INSERT INTO contact_people (contact_id, name, role)
SELECT 769, x.name, x.role FROM (
  SELECT 'Peter Harlin' AS name, 'Financial Advisor (ex-J.P. Morgan Private Bank), Blumenthal-Harlin Financial Group' AS role
  UNION ALL SELECT 'Robin Rush', 'Financial Advisor, Blumenthal-Harlin Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 769) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 769 AND name = x.name);
