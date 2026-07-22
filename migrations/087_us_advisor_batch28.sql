-- US Financial Advisor enrichment, batch 28 (25 contacts / 20 groups).
--
-- Confirmed a speculative cross-reference from batch 27: 834 Bill
-- Smith IS the same "Bill Smith" who co-leads "Raleigh PWM" alongside
-- id 833 Michael Lappin (formed Sept 2023) — not a coincidental
-- namesake.
--
-- Branch consolidation: 841 Mark Tobias's CRM office (New Brunswick,
-- NJ) has been consolidated into Morgan Stanley's Morristown, NJ
-- branch — Morgan Stanley's own site now redirects the "new-brunswick
-- -branch" URL slug to the Morristown location.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again
-- across five groups this batch: 839/1011/1142 (Merrill Dallas, 3
-- teams/2 buildings), 842/896 (Merrill Cincinnati, 2 teams/2
-- buildings), 844/1074 (Merrill Northbrook, 2 teams/1 building),
-- 851/967 (Merrill Norfolk, 2 teams/1 building), 857/1006 (Merrill
-- Wayzata, 2 teams/1 building).

-- ===== GROUP 541: UBS Wealth Management, Raleigh, NC =====
-- 834 Bill Smith (Raleigh PWM, confirmed colleague of id 833 Michael Lappin)
UPDATE contacts SET
  address = '3700 Glenwood Avenue, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor, co-leads "Raleigh PWM" (formed Sept 1, 2023) with id 833 Michael Lappin (CONFIRMED same colleague referenced in batch 27''s Lappin research), UBS Raleigh NC. Barron''s Top 1,200 2021-2025, Top 1,500 2026; Forbes Best-in-State 2020-2026.')), 512)
WHERE id = 834;
INSERT INTO contact_people (contact_id, name, role)
SELECT 834, x.name, x.role FROM (
  SELECT 'Michael Lappin' AS name, 'Co-Lead Private Wealth Advisor (also id 833 in this CRM), Raleigh PWM' AS role
  UNION ALL SELECT 'Tim Lappin', 'Team member, Raleigh PWM'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 834) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 834 AND name = x.name);

-- ===== GROUP 542: RZH Advisors, Stamford, CT =====
-- 835 Carl Zuckerberg
UPDATE contacts SET
  address = 'One Landmark Square, 11th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Principal / Chief Investment Strategist, RZH Advisors (founded 2000, ~$2.1-2.4B AUM), Stamford CT (31+ yrs in finance). 2024 InvestmentNews Top Financial Advisors; firm #46 2021 CNBC FA 100.')), 512)
WHERE id = 835;
INSERT INTO contact_people (contact_id, name, role)
SELECT 835, x.name, x.role FROM (
  SELECT 'Dana Hanson' AS name, 'Principal, Chief Planning Strategist, RZH Advisors' AS role
  UNION ALL SELECT 'Jean Atallah', 'Principal, Chief Operating Officer & Chief Compliance Officer, RZH Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 835) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 835 AND name = x.name);

-- ===== GROUP 543: UBS Wealth Management, Everett, WA =====
-- 837 Jason Therrell (Pacific Summit Group)
UPDATE contacts SET
  address = '1604 Hewitt Ave, 6th Floor, Suite 601',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Part of "Pacific Summit Group" (joined UBS April 2015), UBS Everett WA. Barron''s Top 1,500 2026; Forbes Best-in-State 2025/2026.')), 512)
WHERE id = 837;
INSERT INTO contact_people (contact_id, name, role)
SELECT 837, x.name, x.role FROM (
  SELECT 'Scott J. Kirkpatrick' AS name, 'Team member, Pacific Summit Group' AS role
  UNION ALL SELECT 'Steven R. Josephsen', 'Team member, Pacific Summit Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 837) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 837 AND name = x.name);

-- ===== GROUP 544: Small World Wealth Mgmt | Northwestern Mutual, Fort Myers, FL =====
-- 838 Joseph Small
UPDATE contacts SET
  address = '10070 Daniels Interstate Ct, Suite 2',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Wealth Management Advisor, Small World Wealth Management (founded 1992, ~30-yr Northwestern Mutual affiliation, now 3 offices/~24 professionals), Fort Myers FL. Forbes #12 Best-In-State FL-Southwest Apr 2026.')), 512)
WHERE id = 838;
INSERT INTO contact_people (contact_id, name, role)
SELECT 838, x.name, x.role FROM (
  SELECT 'Glenn E. Black' AS name, 'Wealth Management Advisor, Partner (retired as Managing Director Dec 2022), Small World Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 838) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 838 AND name = x.name);

-- ===== GROUP 545: Merrill Wealth Management, Dallas, TX =====
-- 839 Tommy McBride (McBride & Associates), 1011 Stephen Tosha (The Tosha Miller Group), 1142 Todd Dahlin (Leonard Dahlin Wealth Management) — 3 separate teams
UPDATE contacts SET
  address = '5910 N. Central Expressway, Suite 2000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Management Advisor, leads "McBride & Associates," Merrill Dallas TX. Ids 1011/1142 are separate, unrelated teams at a different building.')), 512)
WHERE id = 839;
UPDATE contacts SET
  address = '13355 Noel Road, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor/Portfolio Manager, leads "The Tosha Miller Group," Merrill Dallas TX (Galleria). Id 1142 is a separate, unrelated team in the same building; id 839 is at a different building.')), 512)
WHERE id = 1011;
UPDATE contacts SET
  address = '13355 Noel Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Management Advisor (28+ yrs), leads "Leonard Dahlin Wealth Management," Merrill Dallas TX (Galleria). Id 1011 is a separate, unrelated team in the same building; id 839 is at a different building.')), 512)
WHERE id = 1142;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1011, x.name, x.role FROM (
  SELECT 'Christopher R. Miller, CPWA' AS name, 'Financial Advisor, The Tosha Miller Group' AS role
  UNION ALL SELECT 'Cherrie Moussaid, CRPC', 'Team member, The Tosha Miller Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1011) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1011 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1142, x.name, x.role FROM (
  SELECT 'James Curtis Leonard' AS name, 'Managing Director & Senior Consultant, Leonard Dahlin Wealth Management' AS role
  UNION ALL SELECT 'Hayden Bowring', 'Financial Advisor, Leonard Dahlin Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1142) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1142 AND name = x.name);

-- ===== GROUP 546: UBS Private Wealth Management, Boston, MA =====
-- 840 Christopher Dillon (The Dillon Group)
UPDATE contacts SET
  address = 'One Post Office Square, 35th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management and CEO of "The Dillon Group" (~$1.7B, 10-person team founded by father Sean Dillon in 1986; joined UBS 2012), Boston MA (also splits time in Newport Beach CA). Barron''s Top 1,200 2023-2025; Forbes Best-In-State 2026.')), 512)
WHERE id = 840;
INSERT INTO contact_people (contact_id, name, role)
SELECT 840, x.name, x.role FROM (
  SELECT 'Sean Dillon' AS name, 'Managing Director-Wealth Management, Team Founder (father), The Dillon Group' AS role
  UNION ALL SELECT 'Kevin Dillon', 'Financial Advisor / partner (brother), The Dillon Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 840) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 840 AND name = x.name);

-- ===== GROUP 547: Morgan Stanley Wealth Management, New Brunswick, NJ (branch consolidated into Morristown, NJ) =====
-- 841 Mark Tobias (The Tobias Group)
UPDATE contacts SET
  address = '10 Madison Avenue, Morristown, NJ 07960',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LOCATION UPDATE: Morgan Stanley''s New Brunswick, NJ branch has been consolidated into the Morristown, NJ office (MS''s own site now redirects the "new-brunswick-branch" URL to Morristown). Confirmed current — Managing Director-Wealth Management, Senior Portfolio Management Director, Investment Management Consultant (with firm since 1983), leads "The Tobias Group." Forbes #3 Best-In-State North NJ HNW 2026; Barron''s Top 1,200 2010-2020/2025.')), 512)
WHERE id = 841;
INSERT INTO contact_people (contact_id, name, role)
SELECT 841, x.name, x.role FROM (
  SELECT 'Andrew Mercuri' AS name, 'Financial Advisor (joined 2017), The Tobias Group' AS role
  UNION ALL SELECT 'Jordan Krantz', 'Senior Vice President, Financial Advisor (third-generation advisor), The Tobias Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 841) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 841 AND name = x.name);

-- ===== GROUP 548: Merrill Wealth Management, Cincinnati, OH =====
-- 842 Sean O'Reilly (O'Reilly Bouley Group), 896 Elizabeth Armitage (Knowles Armitage Lucas Group) — 2 separate teams
UPDATE contacts SET
  address = '5905 E. Galbraith Rd., Suite 7000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding member of "The O''Reilly Bouley Group" (also "The OHB Group"), Merrill Cincinnati OH. Forbes #9 Best-In-State Ohio 2025; Barron''s Top 1,200 2022-2026. Id 896 leads a separate, unrelated team at a different Cincinnati address.')), 512)
WHERE id = 842;
UPDATE contacts SET
  address = '7796 Montgomery Rd.',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, with the "Knowles Armitage Lucas Group" (KAL Group), Merrill Cincinnati OH (joined Merrill 1983, ~40+ yrs). Forbes #4 Top Women Wealth Advisors Best-In-State Ohio 2026. Id 842 leads a separate, unrelated team at a different Cincinnati address.')), 512)
WHERE id = 896;
INSERT INTO contact_people (contact_id, name, role)
SELECT 842, x.name, x.role FROM (
  SELECT 'Peter Bouley, CPFA' AS name, 'Senior Financial Advisor, Senior VP, senior partner, O''Reilly Bouley Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 842) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 842 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 896, x.name, x.role FROM (
  SELECT 'Andrew Lucas' AS name, 'Financial Advisor, Knowles Armitage Lucas Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 896) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 896 AND name = x.name);

-- ===== GROUP 549: Prosperion Financial Advisors, Greenwood Village, CO =====
-- 843 Steve Booren (The Booren Group)
UPDATE contacts SET
  address = '8400 E. Prentice Ave., Suite 1125',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Owner, Prosperion Financial Advisors (founded 1996, independent LPL advisor), leads "The Booren Group," Greenwood Village CO (~40+ yrs experience). Barron''s Top 1,200 2025/2026 (#10 Colorado); Forbes Best-In-State 2025.')), 512)
WHERE id = 843;
INSERT INTO contact_people (contact_id, name, role)
SELECT 843, x.name, x.role FROM (
  SELECT 'John Booren' AS name, 'Partner, LPL Financial Advisor (son of Steve), The Booren Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 843) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 843 AND name = x.name);

-- ===== GROUP 550: Merrill Wealth Management, Northbrook, IL =====
-- 844 Benjamin Klein (The Klein Wealth Management Group), 1074 Tom Kilborn (Kilborn Phillips & Associates) — 2 separate teams
UPDATE contacts SET
  address = '1033 Skokie Blvd, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor (since 2002), leads "The Klein Wealth Management Group" (~12-person practice, $2B+ AUM), Merrill Northbrook IL. Id 1074 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 844;
UPDATE contacts SET
  address = '1033 Skokie Blvd, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor (advising since 1983), lead partner of "Kilborn Phillips & Associates" (~8-person team, 125 combined years at Merrill), Merrill Northbrook IL. Id 844 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 1074;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1074, x.name, x.role FROM (
  SELECT 'F.J. Phillips, CFP' AS name, 'Senior VP, Wealth Management Advisor, Kilborn Phillips & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1074) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1074 AND name = x.name);

-- ===== GROUP 551: Morgan Stanley Wealth Management, Huntsville, AL =====
-- 845 Mark Mantooth (The Mantooth Pols Keene Group)
UPDATE contacts SET
  address = '305 Church Street SW, Suite 715',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Leads "The Mantooth Pols Keene Group" (~37-38 yrs experience), Morgan Stanley Huntsville AL. Forbes #8 Best-In-State Alabama 2025, team Best-In-State Wealth Management Teams 2025; Barron''s Top 1,500 State-by-State 2026.')), 512)
WHERE id = 845;
INSERT INTO contact_people (contact_id, name, role)
SELECT 845, x.name, x.role FROM (
  SELECT 'Alex Pols' AS name, 'Team member, The Mantooth Pols Keene Group' AS role
  UNION ALL SELECT 'Pennie Keene', 'Team member, The Mantooth Pols Keene Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 845) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 845 AND name = x.name);

-- ===== GROUP 552: Morgan Stanley Wealth Management, Paramus, NJ =====
-- 846 Yash Dalal (The Dalal Group)
UPDATE contacts SET
  address = '61 South Paramus Road, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Leads "The Dalal Group," Morgan Stanley Paramus NJ. Barron''s Top 1,200 2025; Forbes #5 Best-In-State NJ-North HNW Apr 2025; team #16 Best-In-State Wealth Management Teams NJ-North 2025.')), 512)
WHERE id = 846;
INSERT INTO contact_people (contact_id, name, role)
SELECT 846, x.name, x.role FROM (
  SELECT 'Michael Jackson' AS name, 'Private Banker/team member (joined 2021), The Dalal Group' AS role
  UNION ALL SELECT 'Nancy Legg', 'Senior team member (joined 2013), The Dalal Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 846) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 846 AND name = x.name);

-- ===== GROUP 553: Morgan Stanley Wealth Management, Toledo, OH =====
-- 847 David Himich (The Himich Group)
UPDATE contacts SET
  address = '7311 Crossleigh Court, Suite 106',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "The Himich Group" (Toledo OH / Ann Arbor MI), Morgan Stanley Toledo OH. Barron''s Top 1,500 2024-2026; Forbes State-by-State 2018-2026. CRM phone (800) 869-3326 is generic toll-free; direct branch line (419) 842-6500.')), 512)
WHERE id = 847;
INSERT INTO contact_people (contact_id, name, role)
SELECT 847, x.name, x.role FROM (
  SELECT 'Karen Owens' AS name, 'Financial Advisor, The Himich Group' AS role
  UNION ALL SELECT 'Jackie Riley', 'Senior Registered Associate, The Himich Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 847) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 847 AND name = x.name);

-- ===== GROUP 554: Northwestern Mutual, Fairfax, VA =====
-- 848 Nolan Stokes (Two Lights Private Wealth)
UPDATE contacts SET
  address = '10306 Eaton Pl, Ste 420',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Practices under the marketing name "Two Lights Private Wealth" (Northwestern Mutual), Fairfax VA. Barron''s Top 1,200 honoree; Forbes #13 Best-In-State Virginia 2024.')), 512)
WHERE id = 848;
INSERT INTO contact_people (contact_id, name, role)
SELECT 848, x.name, x.role FROM (
  SELECT 'Lauren Barnak (Shively), CFP' AS name, 'Partner & Private Wealth Advisor, Two Lights Private Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 848) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 848 AND name = x.name);

-- ===== GROUP 555: Merrill Wealth Management, Hartford, CT =====
-- 849 David Goodwin (The Goodwin Group)
UPDATE contacts SET
  address = '185 Asylum Street, Floor 14',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, Managing Director & Portfolio Manager, leads "The Goodwin Group," Merrill Hartford CT. Forbes #3 Best-In-State Connecticut 2026; Barron''s Top 1,200 honoree 18 consecutive years.')), 512)
WHERE id = 849;
INSERT INTO contact_people (contact_id, name, role)
SELECT 849, x.name, x.role FROM (
  SELECT 'Rick Goodwin' AS name, 'Team member/advisor, The Goodwin Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 849) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 849 AND name = x.name);

-- ===== GROUP 556: Morgan Stanley Wealth Management, Bloomington, MN =====
-- 850 Thomas Drees (Drees Marrujo Group)
UPDATE contacts SET
  address = '8300 Norman Center Dr, Suite 1150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, "Drees Marrujo Group" (aka "8300 Group"), Morgan Stanley Bloomington MN. Barron''s Top 1,200/1,500 2021-2023/2025/2026 (Top 10 MN); Forbes Best-In-State Wealth Management Team 2024-2026.')), 512)
WHERE id = 850;
INSERT INTO contact_people (contact_id, name, role)
SELECT 850, x.name, x.role FROM (
  SELECT 'Jose Marrujo' AS name, 'Sports & Entertainment Director / International Wealth Specialist, Drees Marrujo Group' AS role
  UNION ALL SELECT 'Derek Drees', 'Financial Advisor (likely relative), Drees Marrujo Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 850) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 850 AND name = x.name);

-- ===== GROUP 557: Merrill Wealth Management, Norfolk, VA =====
-- 851 Aashish Matani (AHM Wealth Management Group), 967 Philip Campbell (Campbell, Johnson & Earl) — 2 separate teams
UPDATE contacts SET
  address = '999 Waterside Dr, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, leads "The AHM Wealth Management Group – Matani Paschold" (~$1.5B AUM, ~10-person team), Merrill Norfolk VA. Barron''s Top 1,200 2020-2023/2025; Forbes Best-in-State 2018-2026. Id 967 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 851;
UPDATE contacts SET
  address = '999 Waterside Dr, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding partner, "Campbell, Johnson & Earl Wealth Management Group" (~37 yrs in business), Merrill Norfolk VA. Forbes Best-in-State Wealth Management Teams 2024/2026. Id 851 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 967;
INSERT INTO contact_people (contact_id, name, role)
SELECT 851, x.name, x.role FROM (
  SELECT 'Amy Paschold' AS name, 'Advisor, AHM Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 851) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 851 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 967, x.name, x.role FROM (
  SELECT 'Nate Johnson, CFP, CIMA, CPFA' AS name, 'Wealth Management Advisor, Senior VP (joined Merrill 2011), Campbell, Johnson & Earl' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 967) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 967 AND name = x.name);

-- ===== GROUP 558: J.P. Morgan Wealth Management, La Jolla, CA =====
-- 854 Justin Tipp (The Tipp Bruno Team)
UPDATE contacts SET
  address = '7777 Girard Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner (joined 2023 from First Republic), founder/leader of "The Tipp Bruno Team," J.P. Morgan La Jolla CA.')), 512)
WHERE id = 854;
INSERT INTO contact_people (contact_id, name, role)
SELECT 854, x.name, x.role FROM (
  SELECT 'Dominic Bruno, CFA' AS name, 'Vice President, Wealth Advisor, Partner, The Tipp Bruno Team' AS role
  UNION ALL SELECT 'Austin Tipp', 'Wealth Advisor/Partner, The Tipp Bruno Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 854) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 854 AND name = x.name);

-- ===== GROUP 559: UBS Wealth Management, Bellevue, WA =====
-- 855 Stacy Oster (Oster Wealth Management)
UPDATE contacts SET
  address = '225 108th Ave NE, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, 26 yrs at UBS, leads "Oster Wealth Management," Bellevue WA. Barron''s Top Financial Advisors 2023-2026.')), 512)
WHERE id = 855;

-- ===== GROUP 560: Merrill Wealth Management, Wayzata, MN =====
-- 857 Christina Boyd (Boyd Wealth Management Group), 1006 Krystal Julius (Julius Wealth Management Group) — 2 separate teams
UPDATE contacts SET
  address = '315 Lake St E, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Financial Advisor (with Merrill since 1995), leads "Boyd, Bencini, Gibbons and Associates" (aka Boyd Wealth Management Group), Merrill Wayzata MN. Forbes #3 Best-In-State MN 2025, #2 Top Women Wealth Advisors MN 2025. Id 1006 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 857;
UPDATE contacts SET
  address = '315 Lake St E, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, ChFC/CRPC (also known as Krystal Stautz Julius, ~14 yrs experience), leads "Julius Wealth Management Group," Merrill Wayzata MN. Forbes #3 Top Women Wealth Advisors Best-In-State MN, awarded Feb 2026. Id 857 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 1006;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1006, x.name, x.role FROM (
  SELECT 'Madeline R. Thun' AS name, 'Assistant Vice President, Senior Relationship Manager, Julius Wealth Management Group' AS role
  UNION ALL SELECT 'Britta J. Sorensen', 'Assistant Vice President, Relationship Manager, Julius Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1006) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1006 AND name = x.name);
