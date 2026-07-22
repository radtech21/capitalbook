-- US Financial Advisor enrichment, batch 33 (23 contacts / 20 groups).
--
-- Firm-affiliation updates (advisor stayed, entity/ownership changed):
-- 958 Scott Pinkerton — "FourThought Private Wealth" (formerly Pinkerton
-- Private Wealth, independent RIA since Jan 2020) more recently joined
-- Focus Financial Partners as a new partner firm.
-- 985 Debra Brede — "D.K. Brede Investment Mgmt Co." persists as a
-- legacy/sub-brand; the operating entity chain is D.K. Brede -> GW &
-- Wade LLC (Dec 2019) -> The Colony Group LLC (Mar 2024) -> rebranded
-- Focus Partners Wealth (Jan 2025). CRM firm field already reflects
-- this correctly ("D.K. Brede Investment Mgmt Co. | Focus Partners
-- Wealth").
--
-- Compliance flags (factual record, not data errors):
-- 958 Scott Pinkerton (FourThought Private Wealth, Venice FL) —
-- search-indexed BrokerCheck content references a disclosed customer
-- arbitration alleging unsuitable investments 1993-2011, ~$500,000
-- claimed, naming Pinkerton/A.G. Edwards & Sons/a third party as
-- respondents; resolution outcome not independently confirmed —
-- recommend periodic re-check.
--
-- Name-collision cautions recorded this batch (different individuals,
-- same name, surfaced during research — not to be conflated):
-- 978 Kevin Murphy (Ameriprise, Shreveport LA, CRD 1072560) is
-- distinct from the Kevin Murphy at Stifel Casper WY (batch 31, id
-- 922) and from a separate "Kevin M. Murphy" barred by the SEC in
-- 2016 (unrelated CRD, Velox Securities).
-- 979 Tim Metcalf (Morgan Stanley, Scottsdale AZ, CRD 4880862) is
-- distinct from "Timothy Charles Metcalf" (CRD 1193396) at Stifel.
--
-- Recurring shared-building/unrelated-teams pattern confirmed again:
-- 961/993 (UBS Charlotte NC — The Andover Group vs. The Fairview
-- Group); 983/1024/1166 (Wealth Enhancement Group Charlotte NC —
-- three separate named teams: Carroll Team, Graves Team, Patterson
-- Team, sharing one branch office).
--
-- Multiple phone-data discrepancies flagged this batch, including one
-- notable case: 966 Robb Boland's on-file number (215) 557-3500
-- actually belongs to a different RBC Philadelphia advisor entirely
-- (Roy DeCaro). Phone column left untouched per convention.

-- ===== GROUP 641: mFORCE Capital, Fort Worth, TX =====
-- 955 Bradley Bruce
UPDATE contacts SET
  address = '1415 Ballinger St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, CEO, Private Wealth and Family Office Advisory, CIMA CPWA CEPA, mFORCE Capital (independent RIA/BD hybrid under Sanctuary Wealth, founded June 2021 after leaving Merrill), Fort Worth TX. Named to Barron''s Top 1,200 2014-2021/2023; Forbes Best-in-State 2021, ranked #25 Texas 2025. CRM phone (817) 731-0888 could not be verified — direct line found (817) 710-1840, flagged for correction.')), 512)
WHERE id = 955;
INSERT INTO contact_people (contact_id, name, role)
SELECT 955, x.name, x.role FROM (
  SELECT 'Grant Bruce' AS name, 'Client Relationship Manager, mFORCE Capital' AS role
  UNION ALL SELECT 'Lori Bruce', 'Chief Financial Officer, mFORCE Capital'
  UNION ALL SELECT 'Matt Magee', 'Director of Financial Planning and Wealth Management Advisor, mFORCE Capital'
  UNION ALL SELECT 'Joanna Horton', 'Managing Director, Arkansas Private Wealth Advisor, mFORCE Capital'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 955) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 955 AND name = x.name);

-- ===== GROUP 642: Morgan Stanley Wealth Management, Philadelphia, PA =====
-- 956 Eric Salmansohn (Liberty Wealth Management Group)
UPDATE contacts SET
  address = '1650 Market St, 42nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Wealth Director, leads "Liberty Wealth Management Group," Morgan Stanley Philadelphia PA (One Liberty Place). CIMA CEPA. Forbes Best-in-State every year 2018-2026, ranked #11 Pennsylvania 2026; Barron''s Top 1,200 16 years (2010-2019, 2021-2026); Financial Times Top 400 2013/2015-2018. CRM phone (215) 972-2600 could not be matched to any source — direct line found (215) 854-6272, flagged for correction.')), 512)
WHERE id = 956;

-- ===== GROUP 643: Professional Planning Group, Westerly, RI =====
-- 957 Malcolm Makin
UPDATE contacts SET
  address = '9 Granite Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/CEO/Founder, CFP, Professional Planning Group (independent RIA, also a Raymond James Financial Services branch since 1989, founded 1975), Westerly RI. Barron''s Financial Advisor Hall of Fame; ranked #1 Rhode Island by Barron''s 11+ consecutive years incl. Top 1,500 2026 list ($1.2B+ AUM); Forbes Top Wealth Advisors #1 RI 2018. CRM phone (401) 596-5200 could not be verified — published number is (401) 596-2800, flagged for correction.')), 512)
WHERE id = 957;
INSERT INTO contact_people (contact_id, name, role)
SELECT 957, x.name, x.role FROM (
  SELECT 'Daniel Makin' AS name, 'Financial Advisor, Associate Compliance Officer, Operations Manager (son), Professional Planning Group' AS role
  UNION ALL SELECT 'Peter Wallace', 'Financial Advisor, Professional Planning Group'
  UNION ALL SELECT 'Eric Wilson', 'Financial Advisor, Professional Planning Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 957) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 957 AND name = x.name);

-- ===== GROUP 644: FourThought Private Wealth, Venice, FL =====
-- 958 Scott Pinkerton
UPDATE contacts SET
  address = '310 West Venice Avenue, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Planner & Managing Partner, CFP CIMA CPWA AIF, FourThought Private Wealth (founded 1968 as Pinkerton Private Wealth, became independent RIA "FourThought Financial Partners LLC" Jan 2020, recently joined Focus Financial Partners as a new partner firm), Venice FL. Forbes Best-in-State #19 Florida 2026; named to Barron''s Top 1,200/1,500 repeatedly, most recently 2026. Phone was previously unrecorded — found (941) 408-8557. COMPLIANCE FLAG (factual record, not independently re-confirmed against live BrokerCheck): search-indexed content references a disclosed customer arbitration alleging unsuitable investments made 1993-2011, ~$500,000 claimed, naming Pinkerton/A.G. Edwards & Sons/a third party as respondents — resolution outcome unconfirmed, recommend periodic re-check.')), 512)
WHERE id = 958;
INSERT INTO contact_people (contact_id, name, role)
SELECT 958, x.name, x.role FROM (
  SELECT 'Larry Cuervo Jr., CFP' AS name, 'Wealth Advisor, FourThought Private Wealth' AS role
  UNION ALL SELECT 'Jake MacFarlane, CFA, CFP', 'Investment Committee lead, FourThought Private Wealth'
  UNION ALL SELECT 'Alex Herrington', 'Advisor, FourThought Private Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 958) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 958 AND name = x.name);

-- ===== GROUP 645: Raymond James, Dallas, TX =====
-- 960 J. Dow Crocker (CPB Capital Group)
UPDATE contacts SET
  address = '200 Crescent Court, Suite 1030',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, leads "CPB Capital Group" (Raymond James, formerly "Crocker, Prince & Blackford Group," career start 1979), Dallas TX. Team AUM $1B+; Forbes Best-in-State 2013-2026, ranked #9 Dallas-Fort Worth 2026; Barron''s Top 1,200 2013-2024. CRM phone (800) 248-8863 is Raymond James'' generic corporate line; direct team line (214) 965-7611.')), 512)
WHERE id = 960;
INSERT INTO contact_people (contact_id, name, role)
SELECT 960, x.name, x.role FROM (
  SELECT 'J. Jarrell Prince' AS name, 'Partner, fixed income/asset allocation specialist, CPB Capital Group' AS role
  UNION ALL SELECT 'Robert D. Blackford', 'Partner, CPB Capital Group'
  UNION ALL SELECT 'J. Reid Prince, CFP', 'Partner and Officer-Secretary, CPB Capital Group LLC'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 960) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 960 AND name = x.name);

-- ===== GROUP 646: UBS Wealth Management, Charlotte, NC =====
-- 961 Kevin Moran (The Andover Group), 993 Juan Sandoval (The Fairview Group) — 2 separate teams
UPDATE contacts SET
  address = '6100 Fairview Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Managing Partner, leads "The Andover Group," UBS Charlotte NC. Team ranked #1 Forbes Best-in-State Wealth Management Teams 2026 (Charlotte); member of UBS Financial Advisor Advisory Council (10 members firmwide) and UBS Wealth Management President''s Council 2026. Id 993 leads a separate, unrelated team in the same building. CRM phone (704) 338-6000 does not match numbers found for this team — direct line (704) 362-8271, flagged for correction.')), 512)
WHERE id = 961;
UPDATE contacts SET
  address = '6100 Fairview Road, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Managing Director-Wealth Management, leads "The Fairview Group," UBS Charlotte NC (with firm/predecessors since 1992). Ranked #3 Forbes Best-in-State Wealth Advisors 2026; named to Barron''s Top 1,200 2 years running. Id 961 leads a separate, unrelated team in the same building. CRM phone (704) 338-6000 does not match numbers found for this team — direct line (704) 362-8223, flagged for correction.')), 512)
WHERE id = 993;
INSERT INTO contact_people (contact_id, name, role)
SELECT 961, x.name, x.role FROM (
  SELECT 'William B. Lovett III, CFA' AS name, 'Client-facing/operations, financial planning support, The Andover Group' AS role
  UNION ALL SELECT 'Kyle Blumenstock', 'Financial planning, liability management, insurance/Social Security strategies, The Andover Group'
  UNION ALL SELECT 'Jason Mayer', 'Managing Director, investment planning, The Andover Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 961) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 961 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 993, x.name, x.role FROM (
  SELECT 'Mac Mayer' AS name, 'Senior Vice President-Wealth Management, The Fairview Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 993) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 993 AND name = x.name);

-- ===== GROUP 647: Ameriprise Financial, Anchorage, AK =====
-- 963 Ryan Callaway (North Harbor Wealth Management)
UPDATE contacts SET
  address = '3601 Minnesota Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP, CEO of "North Harbor Wealth Management" (Ameriprise), Anchorage AK. Ranked #1 Alaska, Forbes Best-in-State 2026; Ameriprise Client Experience Award 2020-2022. Phone confirmed correct (907) 276-1911.')), 512)
WHERE id = 963;
INSERT INTO contact_people (contact_id, name, role)
SELECT 963, x.name, x.role FROM (
  SELECT 'Gena Moxey, CFP, APMA' AS name, 'Financial Advisor, North Harbor Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 963) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 963 AND name = x.name);

-- ===== GROUP 648: Merrill Wealth Management, Sarasota, FL =====
-- 964 David Barcomb (Barcomb, Tanguay & Associates)
UPDATE contacts SET
  address = '1819 Main St, Suite 12',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor, Managing Director, leads "Barcomb, Tanguay & Associates" (~14 members, ~$1.6B team AUM, with firm since 2008), Merrill Sarasota FL. Named to Barron''s Top 1,200 2025; team on Forbes Best-in-State Wealth Management Teams 2024/2025 (#17 FL); individually ranked #5 Forbes Best-in-State 2026. Phone was previously unrecorded — found (941) 364-5602.')), 512)
WHERE id = 964;
INSERT INTO contact_people (contact_id, name, role)
SELECT 964, x.name, x.role FROM (
  SELECT 'Alex Tanguay, CFP, CPFA' AS name, 'Financial Advisor/partner, Barcomb, Tanguay & Associates' AS role
  UNION ALL SELECT 'Stephen Melz', 'Financial Advisor, Barcomb, Tanguay & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 964) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 964 AND name = x.name);

-- ===== GROUP 649: RBC Wealth Management, Philadelphia, PA =====
-- 966 Robb Boland (The Boland Investment Group)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Financial Advisor, AWM, leads "The Boland Investment Group," RBC (based Malvern PA, part of RBC''s Philadelphia complex). Named to Barron''s Top 1,200 (8th consecutive year) and Barron''s Top 1,500 2026, ranked #39 Pennsylvania; Forbes Best-in-State #14 Pennsylvania 2026. IMPORTANT PHONE FLAG: CRM number (215) 557-3500 actually belongs to a different RBC Philadelphia advisor (Roy DeCaro/DeCaro Eisenberg Group) — this is a data error, not just a discrepancy. Correct direct line appears to be (215) 557-1702. Exact street address for the Malvern office not independently confirmed — recommend manual verification.')), 512)
WHERE id = 966;
INSERT INTO contact_people (contact_id, name, role)
SELECT 966, x.name, x.role FROM (
  SELECT 'Bradford Bolletino' AS name, 'Team member, The Boland Investment Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 966) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 966 AND name = x.name);

-- ===== GROUP 650: RBC Wealth Management, Dallas, TX =====
-- 968 Gregory Glosser (The Glosser Group)
UPDATE contacts SET
  address = '100 Crescent Court, Suite 1500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor (~38-39 yrs experience), leads "The Glosser Group," RBC Dallas TX. Ranked #25 Texas, Forbes Best-in-State 2025. CRM phone (214) 880-4100 does not match any number found for this office — direct line (214) 775-6464, flagged for correction.')), 512)
WHERE id = 968;
INSERT INTO contact_people (contact_id, name, role)
SELECT 968, x.name, x.role FROM (
  SELECT 'Graham Glosser' AS name, 'Financial Advisor/Portfolio Manager (possible relative), The Glosser Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 968) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 968 AND name = x.name);

-- ===== GROUP 651: Merrill Wealth Management, Darien, CT =====
-- 969 Daniel Anderson
UPDATE contacts SET
  address = '1020 Post Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Resident Director & Managing Director (branch head since 1999, with firm since 1992), part of a team variously listed as "The Anderson Dornan Group"/"The KAD Group" (naming appears to be mid-rebrand across Merrill''s own directory), Merrill Darien CT. Forbes Best-in-State named 2018/2019, ranked #33 Connecticut 2026. Phone was previously unrecorded — found (203) 662-5505.')), 512)
WHERE id = 969;
INSERT INTO contact_people (contact_id, name, role)
SELECT 969, x.name, x.role FROM (
  SELECT 'Tom Dornan, CFP, CRPC' AS name, 'Partner (with firm since 2008), The Anderson Dornan Group' AS role
  UNION ALL SELECT 'Sarah M. Kennedy', 'Senior Financial Advisor, The Anderson Dornan Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 969) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 969 AND name = x.name);

-- ===== GROUP 652: Ameriprise Financial, Peoria, AZ =====
-- 971 Kevin Ehlers (Polaris Wealth Group)
UPDATE contacts SET
  address = '15396 N 83rd Ave, Bldg G-101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Partner, ChFC CRPC APMA, leads "Polaris Wealth Group" (Ameriprise, also known by legacy name "Ehlers, Sulzer, Landers," with satellite offices in IL/AZ), Peoria AZ. Cited as a Barron''s top 1000/1200 advisor recent years; team on Forbes Best-in-State Wealth Management Teams. CRM phone (623) 933-6100 does not match found listings — direct line (623) 486-8440, flagged for correction.')), 512)
WHERE id = 971;
INSERT INTO contact_people (contact_id, name, role)
SELECT 971, x.name, x.role FROM (
  SELECT 'Todd J. Sulzer, MBA, APMA' AS name, 'Managing Partner, Polaris Wealth Group' AS role
  UNION ALL SELECT 'Craig S. Landers', 'Managing Partner, Polaris Wealth Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 971) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 971 AND name = x.name);

-- ===== GROUP 653: Fisher Wealth Management, Burlington, NC =====
-- 972 Rick Fisher
UPDATE contacts SET
  address = '3120 South Church St., Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, Fisher Wealth Management (firm founded 1981, securities/advisory via LPL Financial), Burlington NC. Barron''s Top Financial Advisor 2011-2020/2023; Financial Times 400 Top Financial Advisers 2016; team on Forbes Best-in-State Wealth Management Teams 2026. CRM phone (336) 226-0607 does not match found listings — number found (336) 532-4396, flagged for correction.')), 512)
WHERE id = 972;
INSERT INTO contact_people (contact_id, name, role)
SELECT 972, x.name, x.role FROM (
  SELECT 'Willy Fisher, CFP' AS name, 'Partner, Fisher Wealth Management' AS role
  UNION ALL SELECT 'Reid Bolinger, CFP', 'Financial Advisor, Fisher Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 972) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 972 AND name = x.name);

-- ===== GROUP 654: Citi Personal Wealth Management, Chicago, IL =====
-- 974 Alex Marks (The Marks Group)
UPDATE contacts SET
  address = '69 West Washington Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Wealth Advisor, leads "The Marks Group Wealth Advisors," Citi Personal Wealth Management Chicago IL (~20+ yrs experience). Ranked #7 Illinois/Chicago, Forbes Best-in-State 2026; named to Barron''s Top 1,200 2025; Five Star Wealth Manager 2014/2015. CRM phone (312) 384-3000 could not be confirmed as his direct line — likely a general branch number, flagged for verification.')), 512)
WHERE id = 974;

-- ===== GROUP 655: Ameriprise Financial, Shreveport, LA =====
-- 978 Kevin Murphy (Laveer Wealth Management)
UPDATE contacts SET
  address = '738 N Ashley Ridge Loop',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & Managing Partner, CFP, leads "Laveer Wealth Management" (Ameriprise, founded 1982, serves 34 states, ~$947M AUM as of 6/30/2024), Shreveport LA. Forbes Best-in-State Louisiana recognition (top rank cited variously); team on Forbes Best-in-State Wealth Management Teams. CRM phone (800) 297-7378 is Ameriprise''s generic line; direct office line (318) 861-3521. NAME COLLISION CAUTION: distinct from the Kevin Murphy at Stifel Casper WY (batch 31, id 922) and from an unrelated "Kevin M. Murphy" (CRD different) barred by the SEC in 2016 re: Velox Securities — confirmed this record is CRD 1072560, an actively-practicing advisor, not connected to that bar.')), 512)
WHERE id = 978;
INSERT INTO contact_people (contact_id, name, role)
SELECT 978, x.name, x.role FROM (
  SELECT 'Timothy Bruce Crain' AS name, 'Managing Partner, Laveer Wealth Management' AS role
  UNION ALL SELECT 'Jake Burnette, CFP', 'Advisor, Laveer Wealth Management'
  UNION ALL SELECT 'John Sulhoff, CFP', 'Advisor, Laveer Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 978) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 978 AND name = x.name);

-- ===== GROUP 656: Morgan Stanley Wealth Management, Scottsdale, AZ =====
-- 979 Tim Metcalf (Pinnacle View Wealth Management Group)
UPDATE contacts SET
  address = '14850 N Scottsdale Rd, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, Founding Partner, leads "Pinnacle View Wealth Management Group" (formerly "the Gesten Metcalf Group," ~15+ yrs, prior J.P. Morgan), Morgan Stanley Scottsdale AZ. Ranked #13 Forbes Best-in-State Arizona 2026; named to Barron''s Top 1,200; team on Forbes Best-in-State Wealth Management Teams 2024 (#43 AZ). Phone confirmed correct (480) 922-7847. NAME COLLISION CAUTION: distinct from "Timothy Charles Metcalf" (CRD 1193396) at Stifel — confirmed this record is CRD 4880862.')), 512)
WHERE id = 979;
INSERT INTO contact_people (contact_id, name, role)
SELECT 979, x.name, x.role FROM (
  SELECT 'Edward Gesten' AS name, 'Partner, Pinnacle View Wealth Management Group' AS role
  UNION ALL SELECT 'Jack Regier, CFP, CEPA', 'Advisor, Pinnacle View Wealth Management Group'
  UNION ALL SELECT 'Maddie Alcorn, CFP, QPFC', 'Advisor, Pinnacle View Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 979) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 979 AND name = x.name);

-- ===== GROUP 657: Condor Capital Wealth Management, Martinsville, NJ =====
-- 981 Ken Schapiro
UPDATE contacts SET
  address = '1973 Washington Valley Road, Suite 1',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, CFA, Condor Capital Wealth Management (fee-only fiduciary RIA, founded 1988, employee-owned), Martinsville NJ. Named to Barron''s Top 1,200 every year since 2017 (~#27 NJ 2024); Forbes Best-in-State 2022/2024; InvestmentNews Top Financial Advisors 2025/Hot List 2024. Also founder/publisher of "The Robo Report." CRM phone (973) 525-1000 does not match published number (732) 356-7323, flagged for correction.')), 512)
WHERE id = 981;

-- ===== GROUP 658: Wealth Enhancement Group, Charlotte, NC =====
-- 983 Kristopher Carroll (Carroll Team), 1024 Kelly Graves (Graves Team), 1166 John Patterson (Patterson Team) — 3 separate teams
UPDATE contacts SET
  address = '4521 Sharon Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Carolinas, CFA CFP, leads the "Carroll Team," Wealth Enhancement Group Charlotte NC (joined Dec 2021 when Carroll Financial Associates, $4.7B AUM independent RIA, was acquired). Forbes Best-in-State 2022/2023, ranked #6 NC 2026; Five Star Wealth Manager 2016/2018-2023. Ids 1024 and 1166 lead separate, unrelated teams in the same building. CRM phone (763) 417-1700 is WEG''s Minneapolis corporate number; branch direct line (704) 553-8006.')), 512)
WHERE id = 983;
UPDATE contacts SET
  address = '4521 Sharon Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, CFP since 1985, leads the "Graves Team" (working together 25+ yrs), Wealth Enhancement Group Charlotte NC. Barron''s Top Financial Advisor multiyear (2009-2024); Forbes Best-in-State 2018-2023, ranked #6 NC 2024; past President, Carolinas Chapter FPA. Ids 983 and 1166 lead separate, unrelated teams in the same building. CRM phone (763) 417-1700 is WEG''s Minneapolis corporate number; branch direct line (704) 553-8006.')), 512)
WHERE id = 1024;
UPDATE contacts SET
  address = '4521 Sharon Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Financial Advisor, CFP, leads the "Patterson Team" (formerly EVP at Carroll Financial Associates 30+ yrs before WEG acquisition), Wealth Enhancement Group Charlotte NC. Named to Barron''s Top 1,200 8-9 times since 2014 (most recently 2025); Forbes Best-in-State #12 NC 2024. Ids 983 and 1024 lead separate, unrelated teams in the same building. CRM phone (763) 417-1700 is WEG''s Minneapolis corporate number; branch direct line (704) 553-8006.')), 512)
WHERE id = 1166;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1166, x.name, x.role FROM (
  SELECT 'Jay Patterson' AS name, 'Vice President, Financial Advisor, Patterson Team' AS role
  UNION ALL SELECT 'Patrick Bobbins, CFA, CIMA', 'Vice President, Financial Advisor, Patterson Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1166) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1166 AND name = x.name);

-- ===== GROUP 659: Merrill Wealth Management, Southlake, TX =====
-- 984 Jeffery Price (Price & Associates)
UPDATE contacts SET
  address = '601 State St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CPFA, leads "Price & Associates" (with firm since 1995), Merrill Southlake TX. Note: office relocated Oct 2024 from 286 Grand Ave to a new Southlake location; exact new suite number not independently confirmed. Team on Forbes Best-in-State Wealth Management Teams 2023-2026 and Forbes America''s Top Wealth Management Teams-High Net Worth 2022-2025; named to Barron''s Top 1,200 2013-2025. CRM phone (800) 637-7455 is Merrill''s generic toll-free line; direct line (817) 410-4940.')), 512)
WHERE id = 984;
INSERT INTO contact_people (contact_id, name, role)
SELECT 984, x.name, x.role FROM (
  SELECT 'Connor D. Price' AS name, 'Advisor (son, joined part-time 2017, full-time since 2020), Price & Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 984) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 984 AND name = x.name);

-- ===== GROUP 660: D.K. Brede Investment Mgmt Co. | Focus Partners Wealth, Needham, MA =====
-- 985 Debra Brede
UPDATE contacts SET
  address = '140 Kendrick St, Suite B300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Wealth Advisor/Founder, D.K. Brede Investment Management Company (founded 1989/1990; merger chain: -> GW & Wade LLC Dec 2019 -> The Colony Group LLC Mar 2024 -> rebranded Focus Partners Wealth Jan 2025 — CRM firm field already reflects this correctly), Needham MA (~39 yrs experience, ~$2B AUM). Forbes Best-in-State every year 2018-2026, ranked #2 Massachusetts 2025; Barron''s Top 100 Women Financial Advisors annually since 2006; Barron''s Top 1,200/1,500 2017/2021/2022/2024/2025. CRM phone (781) 444-3480 does not match found listings — number found (781) 444-9367, flagged for correction.')), 512)
WHERE id = 985;
