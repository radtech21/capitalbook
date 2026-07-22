-- US Financial Advisor enrichment, batch 30 (22 contacts / 20 groups).
--
-- Compliance flag (factual record, not a data error): 889 Timothy
-- Pagliara (CapWealth Advisors) is named alongside his firm in SEC
-- litigation release LR-24985 regarding mutual fund share-class
-- disclosure practices (2015-2018 period); does not affect his
-- current active status.
--
-- Name verified as correct (not a CRM typo): 893 "Brude Stoever" is
-- confirmed as his actual legal/registered name across FINRA
-- BrokerCheck, the firm's own site, and LinkedIn — not a misspelling
-- of "Bruce."
--
-- Firm-history confirmed (no correction needed): 902 Victor Levy's
-- firm (formerly Leon L. Levy and Associates, founded by his father
-- 1972) was acquired by Wealth Enhancement Group in 2024/2025 — the
-- CRM's current firm listing already reflects this correctly.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 884/1060 (Merrill Yardley PA), 887/1088 (Merrill Mount Laurel NJ).

-- ===== GROUP 581: Merrill Wealth Management, Hanover, NH =====
-- 882 Sheldon Stansfield (SWP Group)
UPDATE contacts SET
  address = '63 South Main Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President / Senior Financial Advisor, part of the "SWP Group" (multigenerational family office team, ~75 yrs combined experience), Merrill Hanover NH.')), 512)
WHERE id = 882;
INSERT INTO contact_people (contact_id, name, role)
SELECT 882, x.name, x.role FROM (
  SELECT 'Lucy Wagner' AS name, 'Financial Advisor, SWP Group' AS role
  UNION ALL SELECT 'Ryan Longfield, CFA', 'Financial Advisor, SWP Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 882) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 882 AND name = x.name);

-- ===== GROUP 582: Merrill Wealth Management, Minneapolis, MN =====
-- 883 Christopher Burque (Summers, Burque, Herrick, Merriman & Reiland Wealth Management Group)
UPDATE contacts SET
  address = '80 South 8th Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, part of "Summers, Burque, Herrick, Merriman & Reiland Wealth Management Group" (also cross-listed with a Madison WI office), Merrill Minneapolis MN. Barron''s Top 1,200 2025; Forbes Best-in-State 2021-2026.')), 512)
WHERE id = 883;
INSERT INTO contact_people (contact_id, name, role)
SELECT 883, x.name, x.role FROM (
  SELECT 'Frank A. Summers' AS name, 'Advisor, Summers, Burque, Herrick, Merriman & Reiland Wealth Management Group' AS role
  UNION ALL SELECT 'Emily C. Herrick de Cruz', 'Advisor/team member, Summers, Burque, Herrick, Merriman & Reiland Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 883) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 883 AND name = x.name);

-- ===== GROUP 583: Merrill Wealth Management, Yardley, PA =====
-- 884 Gregory Hayes (Hayes & Associates), 1060 Jeffrey Martinides (The Martinides Group) — 2 separate teams
UPDATE contacts SET
  address = '1040 Stony Hill Rd, Floor 2',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Senior Financial Advisor (37+ yrs), leads "Hayes & Associates" (dual offices Yardley PA/Princeton NJ), Merrill Yardley PA. Barron''s Top 1,200 2015-2025; Forbes Best-in-State #16 PA-East Apr 2025. Id 1060 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 884;
UPDATE contacts SET
  address = '1040 Stony Hill Rd, Floor 2',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — 39 yrs experience, leads "The Martinides Group — Martinides, Kinley, Doyle, & Denham" (offices Yardley PA/Philadelphia PA/Princeton NJ), Merrill Yardley PA. Forbes Best-in-State #12 PA-East 2024. Id 884 leads a separate, unrelated team in the same building. CRM phone (800) 637-7455 is generic toll-free; direct line (267) 757-1409.')), 512)
WHERE id = 1060;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1060, x.name, x.role FROM (
  SELECT 'Timothy Kinley, CRPC' AS name, 'Financial Advisor, The Martinides Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1060) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1060 AND name = x.name);

-- ===== GROUP 584: Northwestern Mutual, Middleton, WI =====
-- 885 Matthew Heckmann (Heckmann Financial)
UPDATE contacts SET
  address = '8215 Greenway Blvd., Suite 520',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/CEO, "Heckmann Financial" (Northwestern Mutual, joined 1995), Middleton WI. Forbes #2 Best-in-State Wisconsin Apr 2026; Barron''s Top 1,200/1,500 2024.')), 512)
WHERE id = 885;
INSERT INTO contact_people (contact_id, name, role)
SELECT 885, x.name, x.role FROM (
  SELECT 'Isaac Heckmann' AS name, 'Private Wealth Service Advisor / Associate Private Wealth Manager, Heckmann Financial' AS role
  UNION ALL SELECT 'Tyler Knowles, ChFC, CFP, RICP, CEPA', 'Private Wealth Advisor (joined 2015), Heckmann Financial'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 885) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 885 AND name = x.name);

-- ===== GROUP 585: Morgan Stanley Wealth Management, Scottsdale, AZ =====
-- 886 Michael Butt (The Joshua Tree Group)
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor (with firm since 2004), leads "The Joshua Tree Group" (#3 Best-In-State AZ 2025), Morgan Stanley Scottsdale AZ. Barron''s Top 1,200 2024; Forbes Best-In-State Wealth Management Teams 2025/2026.')), 512)
WHERE id = 886;
INSERT INTO contact_people (contact_id, name, role)
SELECT 886, x.name, x.role FROM (
  SELECT 'Timothy D. Bryan, CRPC' AS name, 'Financial Advisor, The Joshua Tree Group' AS role
  UNION ALL SELECT 'Jeremy Christopher Horton', 'Wealth Management Associate, The Joshua Tree Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 886) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 886 AND name = x.name);

-- ===== GROUP 586: Merrill Wealth Management, Mount Laurel, NJ =====
-- 887 Jeffrey George (George Bernstein Mulholland), 1088 Jeffrey Browne (The Browne Dugary Group) — 2 separate teams
UPDATE contacts SET
  address = '1200 Howard Blvd, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Bank of America Retirement Benefits Consultant specializing in defined-contribution plans, part of "George Bernstein Mulholland Wealth Management Group," Merrill Mount Laurel NJ. Forbes #7 Best-In-State Wealth Management Teams NJ-South 2025. Id 1088 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 887;
UPDATE contacts SET
  address = '1200 Howard Blvd, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, Portfolio Manager, leads "The Browne Dugary Group," Merrill Mount Laurel NJ. Forbes #6 Best-In-State NJ-South Apr 2026; team on 2026 Forbes Best-in-State Wealth Management Teams list. Id 887 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 1088;
INSERT INTO contact_people (contact_id, name, role)
SELECT 887, x.name, x.role FROM (
  SELECT 'Stephen C. Bernstein' AS name, 'Team member, George Bernstein Mulholland Wealth Management Group' AS role
  UNION ALL SELECT 'Corey Mulholland', 'Bank of America Retirement Benefits Consultant, George Bernstein Mulholland Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 887) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 887 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1088, x.name, x.role FROM (
  SELECT 'Joseph Dugary' AS name, 'Team member, The Browne Dugary Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1088) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1088 AND name = x.name);

-- ===== GROUP 587: Ameriprise Financial, Portage, MI =====
-- 888 Jason Klein (OsborneKlein)
UPDATE contacts SET
  address = '7130 S Westnedge Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, "OsborneKlein" (Ameriprise), Portage MI. Forbes Best-in-State #5 Michigan Apr 2026 (2019-2025 recognition run). CRM phone (800) 297-7378 is generic toll-free; direct line (269) 321-5002.')), 512)
WHERE id = 888;
INSERT INTO contact_people (contact_id, name, role)
SELECT 888, x.name, x.role FROM (
  SELECT 'Shaun Osborne' AS name, 'Managing Partner & Private Wealth Advisor (Petoskey MI), OsborneKlein' AS role
  UNION ALL SELECT 'Jeff Wynder, CRPC', 'Financial Advisor (Petoskey MI), OsborneKlein'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 888) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 888 AND name = x.name);

-- ===== GROUP 588: CapWealth Advisors, Franklin, TN =====
-- 889 Timothy Pagliara
UPDATE contacts SET
  address = '4031 Aspen Grove Dr, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Chairman & Chief Investment Officer, CapWealth (~$2B RIA, founded 2000), Franklin TN. Forbes #1 Tennessee/Nashville, #243 nationally 2026. COMPLIANCE FLAG (factual record): SEC litigation release LR-24985 names CapWealth Advisors LLC, Timothy J. Pagliara, and Timothy R. Murphy re: mutual fund share-class disclosure practices (2015-2018 period) — does not affect current active status.')), 512)
WHERE id = 889;
INSERT INTO contact_people (contact_id, name, role)
SELECT 889, x.name, x.role FROM (
  SELECT 'Phoebe Venable' AS name, 'President & CEO, CapWealth' AS role
  UNION ALL SELECT 'Caleb Alexander, CPA', 'Chief Financial Officer, CapWealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 889) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 889 AND name = x.name);

-- ===== GROUP 589: Raymond James, Jackson, MS =====
-- 890 Bill Geary (Meadowbrook Wealth Advisors)
UPDATE contacts SET
  address = '4266 I-55 N, Ste 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Investments, Managing Director, senior advisor/Branch Manager for "Meadowbrook Wealth Advisors" of Raymond James, Jackson MS.')), 512)
WHERE id = 890;
INSERT INTO contact_people (contact_id, name, role)
SELECT 890, x.name, x.role FROM (
  SELECT 'Chris Correro' AS name, 'Senior Vice President, Investments, Meadowbrook Wealth Advisors' AS role
  UNION ALL SELECT 'Logan Phillips', 'Senior Vice President, Investments, Meadowbrook Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 890) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 890 AND name = x.name);

-- ===== GROUP 590: Merrill Wealth Management, Doylestown, PA =====
-- 891 Christian Aguirre (Aguirre-Jankowski Group)
UPDATE contacts SET
  address = '600 Hyde Park, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Wealth Management Advisor (advising since 2004), Founding Partner of "Aguirre-Jankowski Group," Merrill Doylestown PA. Forbes Best-In-State Wealth Advisors 2021-2023, team #23 Best-In-State Wealth Management Teams PA-East 2024.')), 512)
WHERE id = 891;
INSERT INTO contact_people (contact_id, name, role)
SELECT 891, x.name, x.role FROM (
  SELECT 'Matt Jankowski, CFP' AS name, 'Financial Advisor (co-founder, joined Merrill 2001), Aguirre-Jankowski Group' AS role
  UNION ALL SELECT 'Jorge Arrisueno', 'Financial Advisor, Aguirre-Jankowski Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 891) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 891 AND name = x.name);

-- ===== GROUP 591: RBC Wealth Management, Huntington, WV =====
-- 892 David Miller (The Miller Investment Group)
UPDATE contacts SET
  address = '704 Fourth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Financial Advisor / Senior Portfolio Manager (30+ yrs, since 1991), team "The Miller Investment Group," RBC Huntington WV. Forbes #6 Best-In-State West Virginia Apr 2025.')), 512)
WHERE id = 892;

-- ===== GROUP 592: Stoever & Palmore Investment Group, Richmond, VA =====
-- 893 Brude Stoever (name confirmed correct, not a typo)
UPDATE contacts SET
  address = '5800 Patterson Ave, Suite 103',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Investments / Managing Partner, Stoever & Palmore Investment Group (Wells Fargo Advisors), Richmond VA (60% owner since 9/1/2021). CRM name "Brude Stoever" is confirmed correct (his actual legal/registered name per FINRA BrokerCheck), not a typo for "Bruce." Firm ranked #16 Virginia-South on Forbes.')), 512)
WHERE id = 893;
INSERT INTO contact_people (contact_id, name, role)
SELECT 893, x.name, x.role FROM (
  SELECT 'Michael Palmore' AS name, 'Financial Advisor/Managing Director (co-founder), Stoever & Palmore Investment Group' AS role
  UNION ALL SELECT 'Kate Zijerdi', 'Partner, Registered Associate, Stoever & Palmore Investment Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 893) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 893 AND name = x.name);

-- ===== GROUP 593: Salomon & Ludwin, Richmond, VA =====
-- 894 Dalal Salomon
UPDATE contacts SET
  address = '1401 Gaskins Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO and Founding Partner, Salomon & Ludwin, LLC (independent SEC-registered RIA, ~$1.3B AUM, founded 2009), Richmond VA (since Nov 2009).')), 512)
WHERE id = 894;
INSERT INTO contact_people (contact_id, name, role)
SELECT 894, x.name, x.role FROM (
  SELECT 'Dan Ludwin' AS name, 'President, Founding Partner, Salomon & Ludwin' AS role
  UNION ALL SELECT 'Jacob Salomon', 'Managing Partner, Chief Compliance Officer, Financial Advisor, Salomon & Ludwin'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 894) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 894 AND name = x.name);

-- ===== GROUP 594: Merrill Wealth Management, Wyandotte, MI =====
-- 895 Leo Stevenson (Wyandotte Group)
UPDATE contacts SET
  address = '2912 Biddle Avenue, Floor 1',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor (with Merrill since 1996, ~$550M AUM), part of "Wyandotte Group," Merrill Wyandotte MI. Barron''s Top 1,200 2014-2024; Forbes Top 250 Wealth Advisors 2017-2024.')), 512)
WHERE id = 895;
INSERT INTO contact_people (contact_id, name, role)
SELECT 895, x.name, x.role FROM (
  SELECT 'Craig Hammond' AS name, 'Financial Advisor, Wyandotte Group' AS role
  UNION ALL SELECT 'Neil Sawicki', 'Vice President, Resident Director-Wealth Management Advisor, Wyandotte Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 895) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 895 AND name = x.name);

-- ===== GROUP 595: Ameriprise Financial, Fort Wayne, IN =====
-- 897 Christopher Moore (Moore Wealth Management)
UPDATE contacts SET
  address = '6226 Covington Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President of Moore & Associates, Private Wealth Advisor leading "Moore Wealth Management" (Ameriprise, ~19+ yrs, practicing since 1989), Fort Wayne IN. Forbes #4 Best-In-State Indiana 2026.')), 512)
WHERE id = 897;
INSERT INTO contact_people (contact_id, name, role)
SELECT 897, x.name, x.role FROM (
  SELECT 'Tonja Rutsey, CFP, AAMS' AS name, 'Financial Planner, Moore Wealth Management' AS role
  UNION ALL SELECT 'Mark Etter, CFP, APMA', 'Advisor, Moore Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 897) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 897 AND name = x.name);

-- ===== GROUP 596: Lee, Sipe & Associates, Rockville, MD =====
-- 898 Thomas Lee
UPDATE contacts SET
  address = '15245 Shady Grove Rd, Ste 240',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding partner, Lee, Sipe & Associates (Raymond James, RJFS branch), Rockville MD. Forbes #1 Best-In-State Maryland Apr 2026 (8th consecutive year); Barron''s Top 1,500 2021-2026.')), 512)
WHERE id = 898;
INSERT INTO contact_people (contact_id, name, role)
SELECT 898, x.name, x.role FROM (
  SELECT 'Daniel J. Sipe, ChFEBC' AS name, 'Partner, Lee, Sipe & Associates' AS role
  UNION ALL SELECT 'Kent W. Showler', 'VP of Operations, LSA Branch Principal (RJFS), Lee, Sipe & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 898) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 898 AND name = x.name);

-- ===== GROUP 597: Morgan Stanley Wealth Management, Mandeville, LA =====
-- 899 TC Ford (The TC Ford Group)
UPDATE contacts SET
  address = '1261 W Causeway Approach',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Leads "The TC Ford Group" (~7 advisors/4 support staff), Morgan Stanley Mandeville LA. Barron''s Top 1,500 Mar 2026; Forbes Best-In-State Wealth Management Teams 2025/2026.')), 512)
WHERE id = 899;
INSERT INTO contact_people (contact_id, name, role)
SELECT 899, x.name, x.role FROM (
  SELECT 'Michael Plasko' AS name, 'Financial Advisor, The TC Ford Group' AS role
  UNION ALL SELECT 'E. Mason Rudolph Jr.', 'Financial Advisor, The TC Ford Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 899) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 899 AND name = x.name);

-- ===== GROUP 598: Goetzman Nau Financial | Raymond James, Alexandria, VA =====
-- 901 Neil Goetzman
UPDATE contacts SET
  address = '1800 Diagonal Rd, Suite 555',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, Goetzman Nau Financial Partners, Raymond James Financial Services (joined 2020, previously Merrill Lynch since 1987), Alexandria VA. Barron''s Top 1,500 2022-2026; Forbes Best-in-State Wealth Advisors.')), 512)
WHERE id = 901;
INSERT INTO contact_people (contact_id, name, role)
SELECT 901, x.name, x.role FROM (
  SELECT 'Jeffrey A. Nau, CFP, ChFC, CRPC' AS name, 'Senior Partner, Goetzman Nau Financial Partners' AS role
  UNION ALL SELECT 'James Hempstead, CFP', 'Financial Advisor, Goetzman Nau Financial Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 901) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 901 AND name = x.name);

-- ===== GROUP 599: Wealth Enhancement Group, Philadelphia, PA =====
-- 902 Victor Levy (Levy-Clatterbuck-Robostello Team)
UPDATE contacts SET
  address = '1818 Market St, #3232',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/SVP, Financial Advisor, leads the "Levy-Clatterbuck-Robostello Team," Wealth Enhancement Group Philadelphia PA. His firm (formerly Leon L. Levy and Associates, founded by his father 1972, ~$1.3B AUM) was acquired by Wealth Enhancement Group 2024/2025 — CRM firm listing already reflects this correctly. Barron''s #31 Top 1,200 2025, #36 Top 1,500 2026.')), 512)
WHERE id = 902;
INSERT INTO contact_people (contact_id, name, role)
SELECT 902, x.name, x.role FROM (
  SELECT 'Michael Clatterbuck, CFP, ChFC' AS name, 'Chief Operating Officer & Wealth Advisor, Levy-Clatterbuck-Robostello Team' AS role
  UNION ALL SELECT 'Joseph Robostello, CFP, ChSNC', 'Wealth Advisor, Levy-Clatterbuck-Robostello Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 902) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 902 AND name = x.name);

-- ===== GROUP 600: Wells Fargo Advisors, Waco, TX =====
-- 904 Charles Lewis (Lewis Wealth Management)
UPDATE contacts SET
  address = '1105 Wooded Acres Drive, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments / Senior Financial Advisor, leads "Lewis Wealth Management," Wells Fargo Waco TX (~28+ yrs with firm). Barron''s Top 1,200 2016-2025; Forbes Best-In-State TX-North #17 2024.')), 512)
WHERE id = 904;
INSERT INTO contact_people (contact_id, name, role)
SELECT 904, x.name, x.role FROM (
  SELECT 'Brad Smith' AS name, 'Financial Advisor, Lewis Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 904) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 904 AND name = x.name);
