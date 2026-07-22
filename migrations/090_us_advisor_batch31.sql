-- US Financial Advisor enrichment, batch 31 (22 contacts / 20 groups).
--
-- Compliance flags (factual record, not data errors):
-- 912 Troy Nelson (Edward Jones, Bismarck ND) — FINRA arbitration panel
-- ruled against Edward Jones in Aug 2024 (Martire v. Nelson/Edward
-- Jones), awarding ~$513,715 total re: allegedly helping move/hide
-- joint-account assets during a client's divorce without her
-- authorization. Public record (InvestmentNews, AdvisorHub); does not
-- affect his current active status.
-- 917 Mike Absher (Absher Wealth Mgmt, Chapel Hill NC) — BrokerCheck
-- discloses a July 2007 customer arbitration alleging unsuitable
-- variable annuity recommendation, $270,000 claimed.
-- 922 Kevin Murphy (Stifel, Casper WY) — BrokerCheck-indexed record
-- shows 2 disclosure events: a 2010 dispute (settled $75,000 of
-- $600,000 claimed) and a 2001 unauthorized-purchase dispute; CRD
-- match is highly likely but not independently re-confirmed against
-- the live BrokerCheck PDF (site blocked automated fetch).
-- 923 Jon Newman (Ameriprise, Greenwich CT) — BrokerCheck-indexed
-- record shows 3 disclosure events re: unsuitable recommendation
-- disputes; not independently re-confirmed against the live PDF.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 914/1031 (UBS Honolulu HI — The Megorden Group vs. Hawaii Ascendant
-- Wealth Consultants); 921/929 (Morgan Stanley Portland ME —
-- Burns/Kolben Group vs. The Breakwater Group).
--
-- Firm/practice rebrand (same firm, new name): 916 Jeff Roberts &
-- Associates -> MavenCross Wealth Advisors (Ameriprise, Birmingham AL).
--
-- Multiple phone-data discrepancies flagged this batch (CRM numbers
-- appear to be generic toll-free/national lines rather than direct
-- branch numbers, or simply unmatched); phone column left untouched
-- per convention, discrepancies noted in data_flags only.

-- ===== GROUP 601: Fryar Private Wealth | Wells Fargo Advisors FiNet, West Des Moines, IA =====
-- 905 Matt Fryar
UPDATE contacts SET
  address = '5745 Raccoon River Drive, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President and Managing Director, CFP, leads "Fryar Private Wealth" (Wells Fargo Advisors FiNet, with firm since 1996), West Des Moines IA. Forbes Best-in-State #1 Iowa 2019-2026 (consecutive); Wells Fargo Advisors Financial Network Platinum Council Diamond level 2025. CRM phone (877) 879-2495 is a generic Wells Fargo national support line; direct local line (515) 809-3172.')), 512)
WHERE id = 905;
INSERT INTO contact_people (contact_id, name, role)
SELECT 905, x.name, x.role FROM (
  SELECT 'Chris Pedersen, CFP' AS name, 'Senior Financial Advisor, Fryar Private Wealth' AS role
  UNION ALL SELECT 'Andy Schreurs', 'Senior Financial Advisor, Fryar Private Wealth'
  UNION ALL SELECT 'Ted Nahas', 'Senior Financial Advisor, Fryar Private Wealth'
  UNION ALL SELECT 'Chris Kramer', 'Senior Financial Advisor, Fryar Private Wealth'
  UNION ALL SELECT 'Eric Raasch, CLU, ChFC', 'Senior Financial Advisor, Fryar Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 905) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 905 AND name = x.name);

-- ===== GROUP 602: Raymond James, Portland, ME =====
-- 906 Christopher Rogers (The Portland Harbor Group)
UPDATE contacts SET
  address = '2 Portland Square, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, SVP Investments (WMS), founding member/leader of "The Portland Harbor Group," Raymond James Portland ME (with firm since 2013, industry since 1983). Barron''s Top 1,200 2012-2024 (multiple years); Forbes Best-in-State ME 2019-2024. A separate, unrelated team — "Rogers Norton Wealth Management Group" (Matthew Rogers, Chris Norton) — also operates out of the same 2 Portland Square building; do not conflate. CRM phone (800) 248-8863 is a generic Raymond James national line; direct local line (207) 771-1800.')), 512)
WHERE id = 906;
INSERT INTO contact_people (contact_id, name, role)
SELECT 906, x.name, x.role FROM (
  SELECT 'Dana A. Ricker, WMS' AS name, 'Managing Director, SVP Investments (founding member), The Portland Harbor Group' AS role
  UNION ALL SELECT 'Keegan R. Hyland, CFP, MBA', 'Managing Director, SVP Wealth Management, The Portland Harbor Group'
  UNION ALL SELECT 'Justin Rogers, AAMS', 'Investment Portfolio Associate, The Portland Harbor Group'
  UNION ALL SELECT 'Nicole L. Trottier-Rogers', 'Senior Registered Sales Associate, The Portland Harbor Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 906) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 906 AND name = x.name);

-- ===== GROUP 603: Citizens National Bank Wealth Mgmt | Raymond James, Meridian, MS =====
-- 907 John McRae
UPDATE contacts SET
  address = '512 22nd Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor / Branch Manager overseeing Raymond James offices housed within Citizens National Bank Wealth Management (Meridian and Hattiesburg MS), with firm since 1993. Ranked #1 financial advisor in Mississippi, Barron''s 2025 state rankings; named to Barron''s Top 1,500 2026; 13th consecutive year Raymond James Chairman''s Council.')), 512)
WHERE id = 907;

-- ===== GROUP 604: Gatewood Wealth Solutions, St. Louis, MO =====
-- 908 Aaron Tuttle
UPDATE contacts SET
  address = '1401 S Brentwood Blvd, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner and Chief Executive Officer (succeeded founder John Gatewood in the CEO role), CFA CFP CLU ChFC, Gatewood Wealth Solutions (now operating under LPL Financial), St. Louis MO. Firm named to Barron''s Top 1,200 2023/2025; ranked #6 Missouri, Forbes Best-in-State Wealth Management Teams 2026. CRM phone (919) 544-4910 is a North Carolina area code and does not match this office — correct direct line (314) 924-5100/5101.')), 512)
WHERE id = 908;
INSERT INTO contact_people (contact_id, name, role)
SELECT 908, x.name, x.role FROM (
  SELECT 'John Gatewood' AS name, 'Founder, Director of Advisor Development, Gatewood Wealth Solutions' AS role
  UNION ALL SELECT 'Brian McGeehon', 'Partner, Chief Financial Officer, Wealth Advisor, Gatewood Wealth Solutions'
  UNION ALL SELECT 'Daniel Goeddel', 'Lead Advisor/Partner, Gatewood Wealth Solutions'
  UNION ALL SELECT 'Christina Shockley', 'Lead Advisor/Partner, Gatewood Wealth Solutions'
  UNION ALL SELECT 'Chris Arends', 'Chief Investment Officer, Gatewood Wealth Solutions'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 908) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 908 AND name = x.name);

-- ===== GROUP 605: UBS Wealth Management, New Orleans, LA =====
-- 909 Jacque Kuchta (Kuchta Curole Riess Group)
UPDATE contacts SET
  address = '909 Poydras Street, Suite 2900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior VP-Wealth Management / Managing Director, CEPA, leads "Kuchta Curole Riess Group," UBS New Orleans LA (with Merrill 1988-2012, then UBS since 2012). Team named 2025 Forbes Best-in-State Wealth Management Teams. CRM phone (800) 354-9103 is UBS''s general national support line; direct branch line (504) 584-5659. COMPLIANCE FLAG (factual record): pending customer complaint received 4/11/2025 alleging unsuitable hedge fund investment recommendations and breach of fiduciary duty (period 3/26/2021-1/13/2025), alleged damages "in excess of $5,000" — unresolved as of research date, does not affect current active status.')), 512)
WHERE id = 909;
INSERT INTO contact_people (contact_id, name, role)
SELECT 909, x.name, x.role FROM (
  SELECT 'Scott M. Curole' AS name, 'Advisor, Kuchta Curole Riess Group' AS role
  UNION ALL SELECT 'Christopher M. Riess', 'Vice President-Wealth Management, Kuchta Curole Riess Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 909) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 909 AND name = x.name);

-- ===== GROUP 606: Merrill Wealth Management, Mobile, AL =====
-- 910 Palmer Whiting (Whiting Bradford Wealth Management Group)
UPDATE contacts SET
  address = '3674 Dauphin Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP CPWA CPFA, leads "Whiting Bradford Wealth Management Group" (rebrand of "The Whiting Group"), Merrill Mobile AL (with firm since 1996, family legacy practice). Ranked #3 Alabama, Forbes Best-in-State 2026.')), 512)
WHERE id = 910;
INSERT INTO contact_people (contact_id, name, role)
SELECT 910, x.name, x.role FROM (
  SELECT 'D. Austin Bradford' AS name, 'Senior Vice President, Senior Resident Director, Whiting Bradford Wealth Management Group' AS role
  UNION ALL SELECT 'Ben Lilly', 'Assistant Vice President, Senior Financial Advisor, Whiting Bradford Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 910) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 910 AND name = x.name);

-- ===== GROUP 607: Edward Jones, Bismarck, ND =====
-- 912 Troy Nelson (Nelson Wealth Management)
UPDATE contacts SET
  address = '2000 Schafer Street, 3rd Floor, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor and Principal, leads "Nelson Wealth Management" (branch principal of one of the largest Edward Jones branches nationally), Bismarck ND. Forbes #1 Best-in-State North Dakota 2026; Forbes SHOOK Top 250 Wealth Advisors nationally 5 consecutive years (2021-2025). CRM phone (800) 441-2357 is Edward Jones'' generic national line; direct branch line (701) 255-1196. COMPLIANCE FLAG (factual record): FINRA arbitration panel ruled against Edward Jones in Aug 2024 (Martire v. Nelson/Edward Jones), awarding ~$513,715 total (compensatory damages, attorneys'' fees, hearing costs) re: allegations he helped move/hide joint-account assets during a client''s divorce without her authorization (claim filed 2015, refiled 2017) — public record via InvestmentNews/AdvisorHub, does not affect current active status.')), 512)
WHERE id = 912;
INSERT INTO contact_people (contact_id, name, role)
SELECT 912, x.name, x.role FROM (
  SELECT 'Renee Brady' AS name, 'Senior Branch Office Administrator, Nelson Wealth Management' AS role
  UNION ALL SELECT 'Sharon Dorner', 'Senior Branch Office Administrator, Nelson Wealth Management'
  UNION ALL SELECT 'Logan Verner', 'Registered Branch Associate, Nelson Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 912) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 912 AND name = x.name);

-- ===== GROUP 608: Baron Silver Stevens Financial Advisors, Boca Raton, FL =====
-- 913 Michael Silver
UPDATE contacts SET
  address = '4800 N. Federal Highway, Suite 210A',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Chief Executive Officer, CFP AEP, Baron Silver Stevens Financial Advisors LLC (independent SEC-registered RIA, ~$733M-$1.2B AUM, ~30 yrs experience), Boca Raton FL. Named to Barron''s Top 1,200/1,500 8 consecutive years through 2026; ranked #12 Florida, Forbes Best-in-State 2026. Phone was previously unrecorded — confirmed current number (561) 447-1997.')), 512)
WHERE id = 913;
INSERT INTO contact_people (contact_id, name, role)
SELECT 913, x.name, x.role FROM (
  SELECT 'Kristopher Moody, CFP' AS name, 'Wealth Advisor, Baron Silver Stevens Financial Advisors' AS role
  UNION ALL SELECT 'Joseph Noto, CFP', 'Financial Advisor, Baron Silver Stevens Financial Advisors'
  UNION ALL SELECT 'Michael Curt Edelman, CFP', 'Investment Adviser Representative, Baron Silver Stevens Financial Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 913) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 913 AND name = x.name);

-- ===== GROUP 609: UBS Wealth Management, Honolulu, HI =====
-- 914 Matthew Megorden (The Megorden Group), 1031 Daniel Shiu (Hawaii Ascendant Wealth Consultants) — 2 separate teams
UPDATE contacts SET
  address = '733 Bishop Street, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP CIMA (with UBS since 2009), leads "The Megorden Group," UBS Honolulu HI. Barron''s Top 1,500/1,200 2021-2026 (6 consecutive years), ranked #2 Hawaii; team ranked #3 Forbes Best-in-State Wealth Management Teams 2026. Id 1031 leads a separate, unrelated team in the same building. CRM phone (808) 545-7800 does not match the team''s published direct line (808) 526-6922 — flagged for verification.')), 512)
WHERE id = 914;
UPDATE contacts SET
  address = '733 Bishop Street, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management and Market Director (UBS Hawaii), CFP ChFC CRPS CEPA (~31-32 yrs, with firm since 1994), leads "Hawaii Ascendant Wealth Consultants," UBS Honolulu HI. Forbes Best-in-State Hawaii #4 2025; Barron''s Top 1,200 2025. Id 914 leads a separate, unrelated team in the same building. CRM phone (808) 545-7800 does not match the team''s published direct line (808) 526-6968 — flagged for verification.')), 512)
WHERE id = 1031;
INSERT INTO contact_people (contact_id, name, role)
SELECT 914, x.name, x.role FROM (
  SELECT 'Todd Iacovelli' AS name, 'Financial Advisor, The Megorden Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 914) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 914 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1031, x.name, x.role FROM (
  SELECT 'John Miyamasu' AS name, 'Investment Committee, Hawaii Ascendant Wealth Consultants' AS role
  UNION ALL SELECT 'Jenny Do', 'Certified Private Wealth Advisor, Hawaii Ascendant Wealth Consultants'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1031) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1031 AND name = x.name);

-- ===== GROUP 610: Ameriprise Financial, Henderson, NV =====
-- 915 Geoffrey Lee (Lee, Langlois & Associates Wealth Advisors)
UPDATE contacts SET
  address = '2495 Village View Dr, Ste 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP APMA, leads "Lee, Langlois & Associates Wealth Advisors" (Ameriprise), Henderson NV. Forbes #3 Best-in-State Nevada 2026; Barron''s Top 1,200 (2018, 2021-2024); Ameriprise Chairman''s Advisory Council 2012-2024. CRM phone (800) 297-7378 is a generic Ameriprise toll-free line; direct office line (702) 360-0400.')), 512)
WHERE id = 915;
INSERT INTO contact_people (contact_id, name, role)
SELECT 915, x.name, x.role FROM (
  SELECT 'Renee Langlois' AS name, 'Financial/Private Wealth Advisor (co-lead), Lee, Langlois & Associates Wealth Advisors' AS role
  UNION ALL SELECT 'Tyler R. Whittier, CFP, APMA, CRPC', 'Financial Advisor, Lee, Langlois & Associates Wealth Advisors'
  UNION ALL SELECT 'Nicholas Scorza', 'Registered Practice Associate, Lee, Langlois & Associates Wealth Advisors'
  UNION ALL SELECT 'Alejandro Gil, CRPC, APMA', 'Team member, Lee, Langlois & Associates Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 915) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 915 AND name = x.name);

-- ===== GROUP 611: Ameriprise Financial, Birmingham, AL =====
-- 916 Jeff Roberts (MavenCross Wealth Advisors)
UPDATE contacts SET
  address = '31 Inverness Center Pkwy, Ste 550',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor & Founder, ChFC CRPC CFS CKA BFA APMA AEP, leads "MavenCross Wealth Advisors" (rebrand of "Jeff Roberts & Associates," ~150 combined yrs experience), Ameriprise Birmingham AL (also office in Tuscaloosa AL). Forbes #40 Best-in-State Alabama 2026; AdvisorHub Advisors to Watch 2025-2026.')), 512)
WHERE id = 916;
INSERT INTO contact_people (contact_id, name, role)
SELECT 916, x.name, x.role FROM (
  SELECT 'Clay Cochran' AS name, 'Private Wealth Advisor, MavenCross Wealth Advisors' AS role
  UNION ALL SELECT 'Vaughn Sparks', 'Advisor, MavenCross Wealth Advisors'
  UNION ALL SELECT 'Tom Hammett', 'Advisor, MavenCross Wealth Advisors'
  UNION ALL SELECT 'Jacob Hulsey', 'Advisor, MavenCross Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 916) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 916 AND name = x.name);

-- ===== GROUP 612: Absher Wealth Management, Chapel Hill, NC =====
-- 917 Mike Absher
UPDATE contacts SET
  address = '1450 Raleigh Road, Suite 105',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Chief Investment Officer, CIMA CPWA, Absher Wealth Management LLC (independent fee-only RIA, ~$1.3B AUM, broke away from Wells Fargo Advisors Nov 2019), Chapel Hill NC (also offices Raleigh NC + a third NC location). Forbes #3 Best-in-State North Carolina-East 2026. CRM phone (919) 929-4468 does not match firm''s number (919) 283-2340 — flagged for correction. COMPLIANCE FLAG (factual record): BrokerCheck discloses a July 2007 customer arbitration alleging unsuitable recommendation to purchase a variable annuity, $270,000 claimed — resolution/outcome not independently confirmed, does not affect current active status.')), 512)
WHERE id = 917;
INSERT INTO contact_people (contact_id, name, role)
SELECT 917, x.name, x.role FROM (
  SELECT 'Lee Roland, MBA, JD, CFP, CPWA' AS name, 'Wealth Planner & Investment Advisor Representative, Absher Wealth Management' AS role
  UNION ALL SELECT 'Kevin Mishoe', 'Chief Compliance Officer & Director of Operations, Absher Wealth Management'
  UNION ALL SELECT 'Will Bost', 'Equity Research Analyst, Absher Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 917) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 917 AND name = x.name);

-- ===== GROUP 613: UBS Wealth Management, St. Cloud, MN =====
-- 919 Matthew Nikodym (Karl Nikodym Wealth Management Group)
UPDATE contacts SET
  address = '4150 S Second Street, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor / Senior Vice President Wealth Management, AAMS CRPS (with UBS since 2003), part of "Karl Nikodym Wealth Management Group," UBS St. Cloud MN. Forbes Best-in-State individual recognition 2019-2025; team Forbes Best-in-State Wealth Management Teams 2023-2026; Barron''s Top 1,500 2026. CRM phone (800) 354-9103 is a generic UBS line; direct office line (320) 203-6579.')), 512)
WHERE id = 919;
INSERT INTO contact_people (contact_id, name, role)
SELECT 919, x.name, x.role FROM (
  SELECT 'Michael K. Karl, CFP, CIMA, CEPA' AS name, 'Financial Advisor / Senior Retirement Plan Consultant (founding advisor, ~40+ yrs), Karl Nikodym Wealth Management Group' AS role
  UNION ALL SELECT 'Veronica Villeneuve', 'Senior Wealth Strategy Associate, Karl Nikodym Wealth Management Group'
  UNION ALL SELECT 'Michelle Beeman', 'Client Service Associate, Karl Nikodym Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 919) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 919 AND name = x.name);

-- ===== GROUP 614: Adams Wealth Partners | Raymond James, Nashville, TN =====
-- 920 David Adams
UPDATE contacts SET
  address = '2905 12th Ave South, #108',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/President, CPA CFP CEPA CDFA, Adams Wealth Partners LLC (independent RIA, securities via Raymond James Financial Services, ~$1.85B AUM), Nashville TN. Forbes Best-in-State Tennessee 7th consecutive year 2024; Barron''s Top 1,200 2024 (2nd consecutive year); Raymond James Chairman''s Council 12th consecutive year. CRM phone (615) 645-6700 resolves to a different, unrelated Raymond James Nashville branch — firm''s own published number is (615) 435-3644, flagged for correction.')), 512)
WHERE id = 920;

-- ===== GROUP 615: Morgan Stanley Wealth Management, Portland, ME =====
-- 921 Jeremiah Burns (Burns/Kolben Group), 929 Gary Bergeron (The Breakwater Group) — 2 separate teams
UPDATE contacts SET
  address = '100 Middle Street, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Director, Financial Advisor, Family Wealth Director (Northern New England), ~43 yrs experience, leads "Burns/Kolben Group," Morgan Stanley Portland ME. Forbes #4 Best-in-State Maine 2022. Id 929 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 921;
UPDATE contacts SET
  address = '100 Middle Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management, Financial Advisor, CPWA, Founder & Managing Partner of "The Breakwater Group," Morgan Stanley Portland ME. Forbes Best-in-State Maine every year 2019-2025; team Forbes Best-in-State Wealth Management Teams 2023-2026; Barron''s Top 1,200 2024/2025; Morgan Stanley President''s Club (top 5% of firm advisors). Id 921 leads a separate, unrelated team in the same building.')), 512)
WHERE id = 929;
INSERT INTO contact_people (contact_id, name, role)
SELECT 921, x.name, x.role FROM (
  SELECT 'Eric Kolben, CFP, CEPA' AS name, 'Financial Advisor, Burns/Kolben Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 921) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 921 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 929, x.name, x.role FROM (
  SELECT 'Cameron Shorey' AS name, 'Team member, The Breakwater Group' AS role
  UNION ALL SELECT 'Tanner Howard', 'Team member, The Breakwater Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 929) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 929 AND name = x.name);

-- ===== GROUP 616: Stifel, Casper, WY =====
-- 922 Kevin Murphy (Murphy Henriksen Wealth Management Group)
UPDATE contacts SET
  address = '123 W 1st St, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Investments, Co-Branch Manager, leads "Murphy Henriksen Wealth Management Group" (Stifel, with firm since 2009, industry since 1981), Casper WY. Barron''s Top 1,200 (2019-2021 confirmed); Stifel Chairman''s Council every year since 2009. CRM phone (800) 679-5446 does not match any confirmed number for this office — local direct line (307) 232-9450, flagged for correction. COMPLIANCE FLAG (factual record, CRD match likely but not independently re-confirmed): BrokerCheck-indexed record shows 2 disclosure events — a 2010 customer dispute (breach of fiduciary duty/unsuitable recommendations re: a UBS account, $600,000 requested, settled for $75,000, broker denied all allegations) and a 2001 dispute alleging unauthorized stock purchases — does not affect current active status.')), 512)
WHERE id = 922;
INSERT INTO contact_people (contact_id, name, role)
SELECT 922, x.name, x.role FROM (
  SELECT 'Kyle Henriksen' AS name, 'Senior Vice President/Investments, Murphy Henriksen Wealth Management Group' AS role
  UNION ALL SELECT 'Grant Murphy, CFP', 'Financial Advisor (son of Kevin Murphy), Murphy Henriksen Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 922) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 922 AND name = x.name);

-- ===== GROUP 617: Ameriprise Financial, Greenwich, CT =====
-- 923 Jon Newman (Newman & Associates)
UPDATE contacts SET
  address = '51 Church St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP, Managing Director, leads "Newman & Associates" (Ameriprise, ~4 advisors + 4 support staff, with firm since 2000), Greenwich CT. Phone was previously unrecorded — confirmed current number (203) 861-1700. COMPLIANCE FLAG (factual record, not independently re-confirmed against live BrokerCheck PDF): BrokerCheck-indexed record (CRD 2419509) shows 3 disclosure events re: disputed unsuitable-recommendation claims (incl. a $222,000 claim the firm asserted was fully risk-disclosed, and a 2003 claim of $5,000 the advisor denied) — does not affect current active status.')), 512)
WHERE id = 923;
INSERT INTO contact_people (contact_id, name, role)
SELECT 923, x.name, x.role FROM (
  SELECT 'John N. Mirabile, MBA' AS name, 'Financial Advisor, Newman & Associates' AS role
  UNION ALL SELECT 'Tyler Bruno', 'Team member, Newman & Associates'
  UNION ALL SELECT 'Jennifer Lucido', 'Team member, Newman & Associates'
  UNION ALL SELECT 'Scott Papkin', 'Team member, Newman & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 923) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 923 AND name = x.name);

-- ===== GROUP 618: UBS Wealth Management, Little Rock, AR =====
-- 925 Hardy Winburn (Winburn Wealth Management)
UPDATE contacts SET
  address = '10800 Financial Center Parkway, Suite 400, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Portfolio Manager, Retirement Plan Consultant, CFP CIMA CLU ChFC CFS RICP CEPA, leads "Winburn Wealth Management" (UBS, with firm since 2002), Little Rock AR. Ranked #2 Arkansas, Forbes Best-in-State 2018-2025.')), 512)
WHERE id = 925;
INSERT INTO contact_people (contact_id, name, role)
SELECT 925, x.name, x.role FROM (
  SELECT 'Lori Payne, CFS' AS name, 'Team member (joined 2011), Winburn Wealth Management' AS role
  UNION ALL SELECT 'Carissa Holder, CRPC', 'Team member (joined 2009), Winburn Wealth Management'
  UNION ALL SELECT 'Brandy Springer', 'Client service (joined 2013), Winburn Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 925) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 925 AND name = x.name);

-- ===== GROUP 619: RBC Wealth Management, Portland, ME =====
-- 926 Brian Clement (Clement Investment Group)
UPDATE contacts SET
  address = 'Two Portland Square, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Financial Advisor, leads "Clement Investment Group" (RBC, with predecessor firm Tucker Anthony since 1991), Portland ME. Named to Barron''s Top 1,200 2021-2025; RBC Chairman''s Council member for the past 20 years. CRM phone (800) 933-6830 does not match this office — local branch line (207) 756-6100, flagged for correction.')), 512)
WHERE id = 926;
INSERT INTO contact_people (contact_id, name, role)
SELECT 926, x.name, x.role FROM (
  SELECT 'Allie Clement' AS name, 'Financial Advisor (daughter of Brian Clement), Clement Investment Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 926) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 926 AND name = x.name);

-- ===== GROUP 620: Morgan Stanley Wealth Management, Charleston, WV =====
-- 927 Jason Thompson (The New River Group)
UPDATE contacts SET
  address = '500 Lee Street East, Laidley Tower, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor (with firm since 1987, industry since 1986), part of "The New River Group," Morgan Stanley Charleston WV. Team named Forbes Best-in-State Wealth Management Teams 2026. CRM phone (304) 340-2600 does not match confirmed numbers for this office (304-353-90xx range) — flagged for correction, exact extension unconfirmed.')), 512)
WHERE id = 927;
INSERT INTO contact_people (contact_id, name, role)
SELECT 927, x.name, x.role FROM (
  SELECT 'Lee Edmondson' AS name, 'Vice President, Financial Advisor, The New River Group' AS role
  UNION ALL SELECT 'David Quisenberry, CPWA, CRPC', 'Financial Advisor, The New River Group'
  UNION ALL SELECT 'Joel McDavid, CFP, CRPC', 'Financial Advisor, The New River Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 927) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 927 AND name = x.name);
