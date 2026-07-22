-- US Financial Advisor enrichment, batch 29 (27 contacts / 20 groups).
--
-- STATUS CHANGE: 866 Thomas Rice (Merrill Wilmington, DE, "The HART
-- Group") passed away November 16, 2024, per his funeral home
-- obituary and FINRA BrokerCheck record (CRD 3184797) — a 25-year
-- Merrill Lynch career ending with his death. Some third-party
-- aggregator listings still show him as an active team member; this
-- is stale directory data. Flagged for removal from active outreach.
--
-- Confirmed phone data error: 860 James B. Stack's CRM number carries
-- a New Jersey area code for a Montana firm — real number is
-- (406) 862-8000.
--
-- Rebrand: 862 Charles Jones's practice renamed from "Jones, Cannon
-- and Scofield" to "Luminate" (Ameriprise, Dallas TX).
--
-- Compliance flag (factual record, not a data error): 867 Justin
-- Parker has a Dec 2025 FINRA disciplinary action (censure, $2,500
-- fine, 30-day all-capacities suspension for unauthorized trading);
-- suspension has since been served and ended, no departure from firm.
--
-- Unresolved location discrepancy flagged (not silently corrected):
-- 859 Jared Hendler's CRM office (South Burlington, VT) does not match
-- his UBS-branded team page ("Hendler Stern," Washington DC) — could
-- not be reconciled with available sources; both possibilities noted.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 866/1149 (Wilmington DE), 876/1165 (Raleigh NC); and a striking
-- five-way case at 864/1045/1063/1194/1197 (Ameriprise Houston — four
-- entirely separate practices across three buildings, three of them
-- coincidentally sharing one suite).

-- ===== GROUP 561: UBS Private Wealth Management, South Burlington, VT =====
-- 859 Jared Hendler
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LOCATION DISCREPANCY (unresolved): CRM lists South Burlington, VT, but Hendler''s UBS-branded team page ("Hendler Stern") is headquartered in Washington, DC (with a Paramus, NJ address also associated); he personally resides in Stowe, VT. Could not reconcile which is his primary desk — possibly dual-registered. Confirmed active — SVP-Wealth Management, Private Wealth Advisor, UBS. Barron''s Top 1,200 2022-2025, Top 1,500 2026; Forbes #1 Best-In-State Vermont 2024.')), 512)
WHERE id = 859;
INSERT INTO contact_people (contact_id, name, role)
SELECT 859, x.name, x.role FROM (
  SELECT 'David Stern' AS name, 'Fixed Income Portfolio Manager / Head of Family Office, Hendler Stern' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 859) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 859 AND name = x.name);

-- ===== GROUP 562: Stack Financial Management, Whitefish, MT =====
-- 860 James B. Stack
UPDATE contacts SET
  address = '625 Wisconsin Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: CRM phone (973) 509-1900 carries a New Jersey area code, incorrect for this Montana firm — real number is (406) 862-8000. Confirmed current — Founder, President & CEO, Stack Financial Management, Whitefish MT. Barron''s Top 100 Independent Financial Advisors 2025 (#63, 18th consecutive year), #1 Montana on Barron''s Top 1,200 by State 2025.')), 512)
WHERE id = 860;
INSERT INTO contact_people (contact_id, name, role)
SELECT 860, x.name, x.role FROM (
  SELECT 'Zachary L. Jonson, CFA' AS name, 'Chief Investment Officer, Stack Financial Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 860) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 860 AND name = x.name);

-- ===== GROUP 563: Merrill Wealth Management, Missoula, MT =====
-- 861 Daniel Kiely (The KLO Group)
UPDATE contacts SET
  address = '330 N Higgins Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Senior VP-Wealth Management Advisor (joined Merrill June 2000), part of "The KLO Group," Merrill Missoula MT. Barron''s Top 1,200 2025.')), 512)
WHERE id = 861;
INSERT INTO contact_people (contact_id, name, role)
SELECT 861, x.name, x.role FROM (
  SELECT 'Solon Linton' AS name, 'Co-founder/Advisor, The KLO Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 861) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 861 AND name = x.name);

-- ===== GROUP 564: Ameriprise Financial, Dallas, TX (now "Luminate") =====
-- 862 Charles Jones
UPDATE contacts SET
  firm = 'Luminate (formerly Jones, Cannon and Scofield)',
  address = '5910 N Central Expy, Suite 1040',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Practice rebranded from "Jones, Cannon and Scofield" to "Luminate," Ameriprise Dallas TX. Confirmed current — CEO/Managing Partner, CFP. Barron''s Top 1,200 2025; Forbes Best-in-State Wealth Advisors/Teams 2025/2026.')), 512)
WHERE id = 862;
INSERT INTO contact_people (contact_id, name, role)
SELECT 862, x.name, x.role FROM (
  SELECT 'Mark Cannon' AS name, 'Managing Partner, Luminate' AS role
  UNION ALL SELECT 'Dale R. Scofield', 'Managing Partner/Private Wealth Advisor, Luminate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 862) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 862 AND name = x.name);

-- ===== GROUP 565: UBS Wealth Management, Miamisburg, OH =====
-- 863 Blair Cornell (The Radius Group)
UPDATE contacts SET
  address = '3601 Rigby Road, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior VP-Wealth Management, CFP (24 yrs at UBS), practice "The Radius Group," Miamisburg OH (~$1.6B AUM). Forbes #3 Ohio 2025; #1 Ohio Forbes/SHOOK Next-Gen 2020.')), 512)
WHERE id = 863;
INSERT INTO contact_people (contact_id, name, role)
SELECT 863, x.name, x.role FROM (
  SELECT 'Tiffany Kellner' AS name, 'Team member/advisor, The Radius Group' AS role
  UNION ALL SELECT 'John W. Reagan Jr.', 'Team member/advisor, The Radius Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 863) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 863 AND name = x.name);

-- ===== GROUP 566: Ameriprise Financial, Houston, TX =====
-- 864 Scott Tiras (Tiras Wealth Management), 1045 Darrell Pennington (Pennington Wealth Management), 1063 Audree Begay (Begay & Associates), 1194 Matthew Kardesch (Kardesch & Associates), 1197 Richard Dvorak (Discovery Point Wealth Advisors) — 5 fully separate practices
UPDATE contacts SET
  address = '11 Greenway Plaza, Suite 3000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Tiras Wealth Management, Ameriprise Houston TX (CPA, MBA, CFP, 38 yrs experience). Ids 1045/1194 are separate, unrelated practices in the same building/suite; ids 1063/1197 are in entirely different buildings. CRM''s shared (713) 781-8900 does not match any confirmed direct line — a legacy/generic switchboard entry.')), 512)
WHERE id = 864;
UPDATE contacts SET
  address = '11 Greenway Plaza, Suite 3000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, Pennington Wealth Management, Ameriprise Houston TX (MBA, CFP, 31 yrs experience). Forbes #3 Best-In-State TX 2026. Id 864 and id 1194 are separate, unrelated practices in the same building/suite.')), 512)
WHERE id = 1045;
UPDATE contacts SET
  address = '3200 Southwest Fwy',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Leads "Begay & Associates," Ameriprise Houston TX (CFP, ~30 yrs experience). Separate building from ids 864/1045/1194.')), 512)
WHERE id = 1063;
UPDATE contacts SET
  address = '11 Greenway Plaza, Suite 3000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Leads "Kardesch & Associates," Ameriprise Houston TX (CFP, MBA, 30 yrs experience). Ids 864/1045 are separate, unrelated practices in the same building/suite.')), 512)
WHERE id = 1194;
UPDATE contacts SET
  address = '1300 Hercules Ave, Ste 205',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/Managing Director, "Discovery Point Wealth Advisors," Ameriprise Houston TX (Bay Area/Clear Lake; CFP, CLU, CEPA, 19 yrs experience). Barron''s Top 1,500 2026; Forbes Best-in-State Wealth Management Teams 2025. Separate building from all other advisors in this group.')), 512)
WHERE id = 1197;
INSERT INTO contact_people (contact_id, name, role)
SELECT 864, x.name, x.role FROM (
  SELECT 'Crystal Garrett' AS name, 'President, Tiras Wealth Management' AS role
  UNION ALL SELECT 'Tres Rouquette', 'CEO, Tiras Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 864) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 864 AND name = x.name);

-- ===== GROUP 567: Merrill Wealth Management, East Brunswick, NJ =====
-- 865 Joshua Wisotsky (TWN Wealth Management Group)
UPDATE contacts SET
  address = '2 Tower Center Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Financial Advisor (joined Merrill 2006), part of "TWN Wealth Management Group" (Nigro, Wisotsky, White, Johnson), Merrill East Brunswick NJ (~$2.2B AUM/liabilities Jan 2026). Forbes #9 Best-in-State NJ Wealth Management Teams 2026 (4th consecutive year).')), 512)
WHERE id = 865;
INSERT INTO contact_people (contact_id, name, role)
SELECT 865, x.name, x.role FROM (
  SELECT 'Daniel M. Nigro' AS name, 'Financial Advisor, TWN Wealth Management Group' AS role
  UNION ALL SELECT 'Brian White', 'Financial Advisor, TWN Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 865) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 865 AND name = x.name);

-- ===== GROUP 568: Merrill Wealth Management, Wilmington, DE =====
-- 866 Thomas Rice (deceased), 1149 Thomas Weisenfels (TWJ Wealth Management Team) — separate teams
UPDATE contacts SET
  address = '2951 Centerville Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | STATUS CHANGE: Thomas Brendan Rice passed away November 16, 2024, in Wilmington DE (per funeral home obituary and FINRA BrokerCheck CRD 3184797) after a 25-year Merrill Lynch career on "The HART Group" team. Some aggregator listings still show him as an active team member — this is stale directory data. Recommend removing from active outreach.')), 512)
WHERE id = 866;
UPDATE contacts SET
  address = '2951 Centerville Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, CFP/CRPC (30+ yr career, West Point grad, Army veteran), leads "TWJ Wealth Management Team," Merrill Wilmington DE. Barron''s Top 1,200 eight times; Forbes #1 Delaware 2018-2020/2022. Separate, unrelated team from id 866 (The HART Group) despite sharing this building.')), 512)
WHERE id = 1149;
INSERT INTO contact_people (contact_id, name, role)
SELECT 866, x.name, x.role FROM (
  SELECT 'Donald Truesdell Jr.' AS name, 'Financial Advisor, The HART Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 866) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 866 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1149, x.name, x.role FROM (
  SELECT 'Ryan Meade' AS name, 'Financial Advisor, TWJ Wealth Management Team' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1149) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1149 AND name = x.name);

-- ===== GROUP 569: Ameriprise Financial, Itasca, IL =====
-- 867 Justin Parker (Alliant Financial Strategies Group)
UPDATE contacts SET
  address = '2 Pierce Place, Suite 1700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, "Alliant Financial Strategies Group," Ameriprise Itasca IL. COMPLIANCE FLAG (factual record): FINRA AWC (Dec 31, 2025) found he instructed 310 unauthorized transactions across 277 non-discretionary accounts tied to a Dutch-auction REIT self-tender; resulted in censure, $2,500 fine, and a 30-day all-capacities suspension served Jan 20-Feb 18, 2026 (now completed). No indication of departure from the firm.')), 512)
WHERE id = 867;
INSERT INTO contact_people (contact_id, name, role)
SELECT 867, x.name, x.role FROM (
  SELECT 'Paul Ambrosini' AS name, 'Financial Advisor, Alliant Financial Strategies Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 867) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 867 AND name = x.name);

-- ===== GROUP 570: Ameriprise Financial, West Des Moines, IA =====
-- 868 Jeffrey Brandt (Ascendant Wealth Management Group)
UPDATE contacts SET
  address = '1080 Jordan Creek Pkwy, Suite 140N',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO, "Ascendant Wealth Management Group" (team HQ Fort Dodge IA, this a branch office; ~35 yrs with Ameriprise, Hall of Fame 2022), West Des Moines IA. Barron''s Top 1,500 2026; Forbes #6 Best-in-State Iowa 2025.')), 512)
WHERE id = 868;
INSERT INTO contact_people (contact_id, name, role)
SELECT 868, x.name, x.role FROM (
  SELECT 'Courtney J. Brandt, CFP, APMA' AS name, 'Private Wealth Advisor, Ascendant Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 868) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 868 AND name = x.name);

-- ===== GROUP 571: Brandywine Oak Private Wealth, Kennett Square, PA =====
-- 870 Michael Henley
UPDATE contacts SET
  address = '500 Old Forge Lane, Suite 501',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Brandywine Oak Private Wealth (founded 2018, ~$1.5B+ AUM), Kennett Square PA.')), 512)
WHERE id = 870;
INSERT INTO contact_people (contact_id, name, role)
SELECT 870, x.name, x.role FROM (
  SELECT 'Alison Dorsman' AS name, 'Co-Founder & Co-CEO, Brandywine Oak Private Wealth' AS role
  UNION ALL SELECT 'Mark Jackson', 'Partner, Brandywine Oak Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 870) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 870 AND name = x.name);

-- ===== GROUP 572: Ameriprise Financial, Missoula, MT =====
-- 871 Jared Losing (Granite Peak Wealth Advisors)
UPDATE contacts SET
  address = '2615 Connery Way',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP/CMFC, practicing as "Granite Peak Wealth Advisors" (also Kalispell/Livingston/Bozeman MT and Casper WY), Ameriprise Missoula MT. Forbes Best-in-State Wealth Advisors and Wealth Management Teams 2026.')), 512)
WHERE id = 871;
INSERT INTO contact_people (contact_id, name, role)
SELECT 871, x.name, x.role FROM (
  SELECT 'Greg Shadow' AS name, 'Financial Advisor, Granite Peak Wealth Advisors' AS role
  UNION ALL SELECT 'Bradley Nordberg', 'Financial Advisor, Granite Peak Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 871) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 871 AND name = x.name);

-- ===== GROUP 573: Merrill Wealth Management, Phoenix, AZ =====
-- 872 James Marten (The Marten Group)
UPDATE contacts SET
  address = '2555 E Camelback Rd, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Wealth Management Advisor, CIMA (35+ yrs with Merrill), leads "The Marten Group," Merrill Phoenix AZ. Barron''s Top 1,200; Forbes Best-in-State.')), 512)
WHERE id = 872;
INSERT INTO contact_people (contact_id, name, role)
SELECT 872, x.name, x.role FROM (
  SELECT 'Jacob Marten' AS name, 'Financial Advisor (son of James), The Marten Group' AS role
  UNION ALL SELECT 'James A. Barasha', 'Financial Advisor, The Marten Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 872) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 872 AND name = x.name);

-- ===== GROUP 574: Merrill Wealth Management, Albuquerque, NM =====
-- 873 Michael Stevens, 874 Kathryn Thompson (confirmed colleagues, The STN Group & Associates)
UPDATE contacts SET
  address = '2125 Louisiana Blvd NE, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, founding partner of "The STN Group & Associates" (formerly "Stevens, Thompson & Sweers Group," with Merrill since 1994), Albuquerque NM. Confirmed colleague of id 874 Kathryn Thompson, same team. Barron''s Top 1,200 2010-2025; Forbes Best-in-State 2018-2026.')), 512)
WHERE id = 873;
UPDATE contacts SET
  address = '2125 Louisiana Blvd NE, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Goes by "Katie," Managing Director, Wealth Management Advisor, managing partner of "The STN Group & Associates" (since 2008, career start 2006), Albuquerque NM. Confirmed colleague of id 873 Michael Stevens, same team. Forbes Best-in-State Wealth Management Teams 2026.')), 512)
WHERE id = 874;
INSERT INTO contact_people (contact_id, name, role)
SELECT 873, x.name, x.role FROM (
  SELECT 'Vasilios "Billy" Ninopoulos' AS name, 'Financial Advisor, The STN Group & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 873) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 873 AND name = x.name);

-- ===== GROUP 575: Merrill Wealth Management, Charleston, SC =====
-- 875 Paul Vannatta (Saad Vannatta & Associates)
UPDATE contacts SET
  address = '75 Port City Landing, Mount Pleasant, SC 29464',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, team "Saad Vannatta & Associates" (11-person team), Merrill Charleston/Mount Pleasant SC. Barron''s Top 1,200 2020-2022/2024-2025; Forbes Best-in-State Wealth Management Teams 2023-2024.')), 512)
WHERE id = 875;
INSERT INTO contact_people (contact_id, name, role)
SELECT 875, x.name, x.role FROM (
  SELECT 'Scott Saad' AS name, 'Wealth Management Advisor, Senior Vice President (founding partner, with firm since 1992), Saad Vannatta & Associates' AS role
  UNION ALL SELECT 'Penn Saad', 'Financial Advisor, Saad Vannatta & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 875) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 875 AND name = x.name);

-- ===== GROUP 576: Merrill Wealth Management, Raleigh, NC =====
-- 876 George Seamen (Seamen & Associates), 1165 Thorne James (The James Group) — separate teams
UPDATE contacts SET
  address = '4242 Six Forks Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor, leads "Seamen & Associates," Merrill Raleigh NC. Id 1165 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 876;
UPDATE contacts SET
  address = '4242 Six Forks Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor (with Merrill Raleigh since 1977), leads "The James Group." Forbes Best-in-State 2018-2021 (#16 NC-East, Jan 2026); Barron''s Top 1,200 2014-2021. Id 876 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 1165;
INSERT INTO contact_people (contact_id, name, role)
SELECT 876, x.name, x.role FROM (
  SELECT 'Evan M. Jones' AS name, 'Senior Relationship Manager, Seamen & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 876) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 876 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1165, x.name, x.role FROM (
  SELECT 'Brandon Cousanca' AS name, 'Senior Vice President, Wealth Management Advisor, The James Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1165) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1165 AND name = x.name);

-- ===== GROUP 577: Prescient Financial Solutions, Milwaukee, WI =====
-- 877 Jerry David
UPDATE contacts SET
  address = '330 E. Kilbourn Ave, Ste 1275',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, CEO & Private Wealth Advisor, Prescient Financial Solutions | Northwestern Mutual, Milwaukee WI. Forbes #11 Best-In-State Wisconsin Apr 2026.')), 512)
WHERE id = 877;
INSERT INTO contact_people (contact_id, name, role)
SELECT 877, x.name, x.role FROM (
  SELECT 'Tino Arvanetes' AS name, 'Director of Growth and Engagement, Prescient Financial Solutions' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 877) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 877 AND name = x.name);

-- ===== GROUP 578: Ameriprise Financial, Edina, MN =====
-- 879 Michelle Young (Confetti Wealth)
UPDATE contacts SET
  address = '7601 France Ave S, Ste 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor and President of "Confetti Wealth," Ameriprise Edina MN (secondary office in Minneapolis). Forbes #4 Minnesota/#12 Minneapolis Area HNW 2026; Barron''s Top 100 Independent Financial Advisors 2025.')), 512)
WHERE id = 879;
INSERT INTO contact_people (contact_id, name, role)
SELECT 879, x.name, x.role FROM (
  SELECT 'Christopher Root, CFP, CRPC, ChFC, CLTC, APMA' AS name, 'Advisor, Confetti Wealth' AS role
  UNION ALL SELECT 'Amanda Petri, CFP, CRPC, APMA', 'Advisor, Confetti Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 879) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 879 AND name = x.name);

-- ===== GROUP 579: Merrill Wealth Management, Jacksonville, FL =====
-- 880 William Merriam (The Merriam Team)
UPDATE contacts SET
  address = '9000 Southside Blvd, Building 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Resident Director & Wealth Management Advisor, leads "The Merriam Team" (Merrill "South Point" office), Jacksonville FL. Forbes #1 Best-In-State Florida 2026; Barron''s Top 1,200 for 14+ consecutive years.')), 512)
WHERE id = 880;
INSERT INTO contact_people (contact_id, name, role)
SELECT 880, x.name, x.role FROM (
  SELECT 'John Worsowicz, CFP, CPA' AS name, 'Senior Vice President, Senior Resident Director, Wealth Management Advisor, The Merriam Team' AS role
  UNION ALL SELECT 'Scott Perry', 'Vice President, Wealth Management Advisor, The Merriam Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 880) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 880 AND name = x.name);

-- ===== GROUP 580: RBC Wealth Management, Albuquerque, NM =====
-- 881 Christopher Cates (The Cates-Romero Team)
UPDATE contacts SET
  address = '6301 Uptown Blvd NE, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — First Vice President-Financial Consultant, CFP/CRPS/CDFA, member of "The Cates-Romero Team," RBC Albuquerque NM. Forbes #7 Best-In-State New Mexico 2026; team also Forbes Best-In-State Wealth Management Teams 2026.')), 512)
WHERE id = 881;
INSERT INTO contact_people (contact_id, name, role)
SELECT 881, x.name, x.role FROM (
  SELECT 'William "Bill" Cates' AS name, 'Senior Vice President-Financial Consultant, The Cates-Romero Team' AS role
  UNION ALL SELECT 'Brad Cates', 'First Vice President-Financial Consultant, The Cates-Romero Team'
  UNION ALL SELECT 'Joseph Romero', 'Senior Financial Associate, The Cates-Romero Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 881) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 881 AND name = x.name);
