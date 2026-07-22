-- US Financial Advisor enrichment, batch 22 (22 contacts / 20 groups).
--
-- Confirmed a prior-batch speculative connection: 658 Edythe De Marco
-- IS the "De Marco" in the "De Marco-McCarthy Group" referenced in
-- batch 19's research on David Javaheri (MS Wellesley) — the team has
-- since expanded and renamed to "The De Marco-McCarthy-Florio Group,"
-- ranked #1 wealth management team in Rhode Island 2023-2026.
--
-- Firm rebrand: 665 Dan Pinkerton's firm renamed from "Pinkerton
-- Retirement Specialists" to "Pinkerton Wealth, LLC" in 2024. Team
-- rename/relocation: 667 Mitch Settle's team renamed from "The Settle
-- Group" to "The Settle Raines Group" and moved to a new Owensboro KY
-- address, effective July 2026 (Shannon Raines promoted co-lead).
--
-- Confirmed two Janney Greenville DE advisors (660/900) are genuine
-- colleagues on the same "Chesapeake Wealth Advisors" team. Confirmed
-- two Morgan Stanley San Francisco advisors (682/694) are NOT
-- colleagues — different named teams at two entirely different
-- buildings (555 California St vs. 101 California St), despite
-- sharing a CRM phone number.

-- ===== GROUP 421: Merrill Wealth Management, Providence, RI =====
-- 658 Edythe De Marco (The De Marco-McCarthy-Florio Group)
UPDATE contacts SET
  address = 'One Financial Plaza, Suite 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Wealth Management Advisor, Merrill Providence RI (with Merrill since 1981), leads "The De Marco-McCarthy-Florio Group" (formerly "The De Marco-McCarthy Group," expanded with Anthony Florio ~2023-24; also offices in Hingham MA and St. Petersburg FL). Forbes Best-in-State #1 Rhode Island 2023-2026. Confirmed same team referenced in batch 19 research (David Javaheri, MS Wellesley) as coincidentally sharing "Wellesley" city context.')), 512)
WHERE id = 658;
INSERT INTO contact_people (contact_id, name, role)
SELECT 658, x.name, x.role FROM (
  SELECT 'Brendan McCarthy, CFP' AS name, 'Managing Director, Wealth Management Advisor, De Marco-McCarthy-Florio Group' AS role
  UNION ALL SELECT 'Anthony M. Florio, CFP, CPWA, CRPC', 'Senior Vice President, Wealth Management Advisor (Hingham MA office), De Marco-McCarthy-Florio Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 658) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 658 AND name = x.name);

-- ===== GROUP 422: Ameriprise Financial, Boise, ID =====
-- 659 Justin Samples (Fulcrum Wealth Management Group)
UPDATE contacts SET
  address = '3295 W Elder St, Ste 205',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CRPC, AWMA, Private Wealth Advisor and CEO of "Fulcrum Wealth Management Group," Ameriprise Boise ID (firm founded 2013, ~20 people, 5 Northwest offices). Forbes Best-In-State #2 Idaho 2025. CRM phone (208) 377-0555 could not be matched to this address; search-indexed number is (208) 938-4416 — worth verifying.')), 512)
WHERE id = 659;
INSERT INTO contact_people (contact_id, name, role)
SELECT 659, x.name, x.role FROM (
  SELECT 'Devlin Carothers' AS name, 'Certified Private Wealth Advisor, Fulcrum Wealth Management Group' AS role
  UNION ALL SELECT 'Vieng Bounnam, CFP', 'Financial Planner, Fulcrum Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 659) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 659 AND name = x.name);

-- ===== GROUP 423: Janney Montgomery Scott, Greenville, DE =====
-- 660 Michael Porter, 900 Jeremy Lambert (Chesapeake Wealth Advisors — confirmed colleagues)
UPDATE contacts SET
  address = '20 Montchanin Road, Suite 120',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Branch Manager & Managing Director, Financial Advisor, "Chesapeake Wealth Advisors," Janney Delaware Complex, Greenville DE, alongside id 900 Jeremy Lambert (co-Branch Manager, confirmed colleague, both jointly named 2021 Janney Financial Advisor of the Year). Barron''s Top 1,200 2025 (#5 Delaware).')), 512)
WHERE id = 660;
UPDATE contacts SET
  address = '20 Montchanin Road, Suite 120',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Branch Manager & Managing Director, Financial Advisor, "Chesapeake Wealth Advisors," Janney Delaware Complex, Greenville DE, alongside id 660 Michael Porter (co-Branch Manager, confirmed colleague). Barron''s Top 1,200 2025 (#6 Delaware).')), 512)
WHERE id = 900;
INSERT INTO contact_people (contact_id, name, role)
SELECT 660, x.name, x.role FROM (
  SELECT 'Heidi Jones' AS name, 'Team staff, Chesapeake Wealth Advisors' AS role
  UNION ALL SELECT 'Jason Bentley', 'Team staff, Chesapeake Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 660) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 660 AND name = x.name);

-- ===== GROUP 424: Raymond James, Anchorage, AK =====
-- 661 Jeff Leonard (Leonard & Martens, LLC)
UPDATE contacts SET
  address = '3401 Denali Street, Suite 103',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding member/Financial Advisor, registered principal, independent RJFS branch "Leonard & Martens, LLC," Anchorage AK. Forbes #1 Alaska 2024; Barron''s Top 1,200 (annually since 2014).')), 512)
WHERE id = 661;
INSERT INTO contact_people (contact_id, name, role)
SELECT 661, x.name, x.role FROM (
  SELECT 'Kurt Martens' AS name, 'Vice President & Partner, Financial Advisor (co-founded firm 2005), Leonard & Martens' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 661) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 661 AND name = x.name);

-- ===== GROUP 425: Ameriprise Financial, Honolulu, HI =====
-- 662 Eric Fujimoto (Ho'ea - Wealth Advisory Group)
UPDATE contacts SET
  address = '555 South St, Ste 106',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP/CFS/BFA/MBA, part of "Ho''ea - Wealth Advisory Group" (formerly his own practice, now ~15 people, ~$993M-$1B AUM, led by Managing Director Vaughn Victorino), Ameriprise Honolulu HI. Forbes #1 Hawaii individually and team 2024-2026.')), 512)
WHERE id = 662;
INSERT INTO contact_people (contact_id, name, role)
SELECT 662, x.name, x.role FROM (
  SELECT 'Vaughn Victorino, CFP' AS name, 'Managing Director, Ho''ea - Wealth Advisory Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 662) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 662 AND name = x.name);

-- ===== GROUP 426: Morgan Stanley Wealth Management, Colorado Springs, CO =====
-- 663 Jeff Jensen (Jensen Group Wealth Management)
UPDATE contacts SET
  address = '121 South Tejon St, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Wealth Director, founder/leader of "Jensen Group Wealth Management," Morgan Stanley Colorado Springs CO (24-25+ yrs experience, CIMA 2005).')), 512)
WHERE id = 663;
INSERT INTO contact_people (contact_id, name, role)
SELECT 663, x.name, x.role FROM (
  SELECT 'Donny Butler, CFA' AS name, 'Financial Advisor, Jensen Group Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 663) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 663 AND name = x.name);

-- ===== GROUP 427: Merrill Private Wealth Management, Miami, FL =====
-- 664 Adam Rosenfeld (The Rosenfeld Group)
UPDATE contacts SET
  address = '200 S. Biscayne Blvd, Suite 4500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Manager, leads "The Rosenfeld Group" (six-member team), Merrill Miami FL (joined Merrill 2011, prior 10 yrs at Morgan Stanley).')), 512)
WHERE id = 664;

-- ===== GROUP 428: Pinkerton Retirement Specialists, Coeur d'Alene, ID (now "Pinkerton Wealth, LLC") =====
-- 665 Dan Pinkerton
UPDATE contacts SET
  firm = 'Pinkerton Wealth, LLC',
  address = '2000 W. John Loop',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Firm rebranded from "Pinkerton Retirement Specialists, LLC" to "Pinkerton Wealth, LLC" in 2024 (encompassing Pinkerton Wealth Management and Pinkerton Wealth Partners); Dan Pinkerton remains Founder & CEO, Coeur d''Alene ID. CRM phone (208) 667-2225 could not be independently confirmed — search results show (208) 667-8998 main / (800) 634-2008 toll-free instead.')), 512)
WHERE id = 665;
INSERT INTO contact_people (contact_id, name, role)
SELECT 665, x.name, x.role FROM (
  SELECT 'Nathan Collier, PhD, CFP, AIF' AS name, 'Wealth Advisor (corporate retirement plans), Pinkerton Wealth' AS role
  UNION ALL SELECT 'Paul Gannett, RFA', 'Wealth Advisor, Pinkerton Wealth'
  UNION ALL SELECT 'Ron Glendening', 'COO, Office Principal & Wealth Advisor, Pinkerton Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 665) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 665 AND name = x.name);

-- ===== GROUP 429: Baird, Glasgow, KY =====
-- 666 Dan Foutch (The Foutch Metzger Group)
UPDATE contacts SET
  address = '102 East Wayne Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Branch Manager, leads "The Foutch Metzger Group," Baird Glasgow KY (~40+ yrs in the business since 1989 at Hilliard Lyons). Forbes Best-in-State #18 KY 2023.')), 512)
WHERE id = 666;
INSERT INTO contact_people (contact_id, name, role)
SELECT 666, x.name, x.role FROM (
  SELECT 'Barrett Metzger' AS name, 'Senior Vice President, Financial Advisor, The Foutch Metzger Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 666) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 666 AND name = x.name);

-- ===== GROUP 430: Baird, Owensboro, KY =====
-- 667 Mitch Settle (now "The Settle Raines Group")
UPDATE contacts SET
  address = '1925 Frederica Street, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Team relocated to a new Owensboro KY office (ribbon cutting July 2026) and renamed from "The Settle Group" to "The Settle Raines Group" effective July 1, 2026, reflecting Shannon Raines'' promotion to Branch Manager/co-lead. Mitch Settle continues as senior/managing advisor, Baird (with firm since 1986). Forbes Best-In-State 2026.')), 512)
WHERE id = 667;
INSERT INTO contact_people (contact_id, name, role)
SELECT 667, x.name, x.role FROM (
  SELECT 'Shannon Raines, CFP' AS name, 'Financial Advisor & Branch Manager (co-lead), The Settle Raines Group' AS role
  UNION ALL SELECT 'Weston Jacob, CFP', 'PWM Financial Planner, The Settle Raines Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 667) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 667 AND name = x.name);

-- ===== GROUP 431: Merrill Wealth Management, Fairhope, AL =====
-- 668 S. Wesley Carpenter (The Harty Carpenter Group)
UPDATE contacts SET
  address = '601 North Section Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Resident Director/Managing Director, co-founder of "The Harty Carpenter Group," Merrill Fairhope AL. Forbes Best-in-State #5 Alabama Apr 2025; Barron''s Top 1,200 2023.')), 512)
WHERE id = 668;
INSERT INTO contact_people (contact_id, name, role)
SELECT 668, x.name, x.role FROM (
  SELECT 'C. Hodges Harty' AS name, 'Co-founder/Financial Advisor, The Harty Carpenter Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 668) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 668 AND name = x.name);

-- ===== GROUP 432: Wagener Lee Wealth Advisors, Columbia, MD =====
-- 669 Richard Wagener
UPDATE contacts SET
  address = '5950 Symphony Woods Road, Suite 412',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner/Founder, Wagener Lee Wealth Advisors, Columbia MD (40+ yrs experience, CFP since 1981, registered with Raymond James Financial Services). Firm named to Barron''s Top 1,200. CRM phone (301) 596-4100 differs from firm''s current published number (443) 276-9595 — worth verifying.')), 512)
WHERE id = 669;
INSERT INTO contact_people (contact_id, name, role)
SELECT 669, x.name, x.role FROM (
  SELECT 'Stephen J. Lee, JD, CFP' AS name, 'Owner/Partner, Wagener Lee Wealth Advisors' AS role
  UNION ALL SELECT 'Amanda Piper, CFA, CEP, MBA', 'Financial Advisor, Wagener Lee Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 669) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 669 AND name = x.name);

-- ===== GROUP 433: Ameriprise Financial, Portland, OR =====
-- 670 Daniel Ruediger (AIM Wealth Advisory Group)
UPDATE contacts SET
  address = '5550 SW Macadam Ave, Ste 102',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO, "AIM Wealth Advisory Group," Ameriprise Portland OR. Forbes #1 Oregon Apr 2025; team on 2025 Forbes Best-in-State Wealth Management Teams. CRM phone (503) 620-3800 differs from a listed number (503) 595-9020 — possible old/alternate number.')), 512)
WHERE id = 670;
INSERT INTO contact_people (contact_id, name, role)
SELECT 670, x.name, x.role FROM (
  SELECT 'Casey Norton, CFP' AS name, 'Managing Partner, AIM Wealth Advisory Group' AS role
  UNION ALL SELECT 'Ryan Price, CFP', 'Managing Partner / Senior VP, AIM Wealth Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 670) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 670 AND name = x.name);

-- ===== GROUP 434: Baird, Evansville, IN =====
-- 671 John Schutz (The Schutz Perigo Group)
UPDATE contacts SET
  address = '110 Main Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "The Schutz Perigo Group" (formed 2019 when David Perigo joined), Baird Evansville IN (Chairman''s Club, top 5% of advisors). Barron''s Top 1,200 Indiana 2021-2026 (#10 in 2025); Forbes #1 Best-In-State Indiana 2025/2026. CRM phone (800) 792-2473 is a generic Baird toll-free line; direct office number (812) 426-1481.')), 512)
WHERE id = 671;
INSERT INTO contact_people (contact_id, name, role)
SELECT 671, x.name, x.role FROM (
  SELECT 'David Perigo' AS name, 'Senior Vice President / Financial Advisor, The Schutz Perigo Group' AS role
  UNION ALL SELECT 'Felicia Hostettler', 'Vice President, The Schutz Perigo Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 671) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 671 AND name = x.name);

-- ===== GROUP 435: Morgan Stanley Wealth Management, Jericho, NY =====
-- 673 Ira Mark (The Preserve Group)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor, founder/leader of "The Preserve Group" (~19-advisor team, joined Morgan Stanley 2020, formerly "The Mark/Berger Group"), Morgan Stanley Jericho NY (North Shore Branch). Barron''s Top 1,200 2022-2025, Top 1,500 2026; Forbes Best-In-State #7 NY 2025-2026. Exact street address not independently confirmed — CRM city/office retained.')), 512)
WHERE id = 673;
INSERT INTO contact_people (contact_id, name, role)
SELECT 673, x.name, x.role FROM (
  SELECT 'Michael Berger' AS name, 'Managing Director, co-founder (formerly "The Mark/Berger Group"), The Preserve Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 673) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 673 AND name = x.name);

-- ===== GROUP 436: Alex. Brown | Raymond James, Chicago, IL =====
-- 677 Mark Birringer (The Ferconio Group)
UPDATE contacts SET
  address = '222 S Riverside Plaza, Suite 2680',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Broker/advisor, part of "The Ferconio Group," Alex. Brown (a division of Raymond James), Chicago IL. Moved from Morgan Stanley (~$1.7B AUM) to Alex. Brown/Raymond James Sept/Dec 2020 alongside longtime partner John C. Joyce; registered/licensed in 25 states.')), 512)
WHERE id = 677;
INSERT INTO contact_people (contact_id, name, role)
SELECT 677, x.name, x.role FROM (
  SELECT 'Michael Ferconio' AS name, 'Director, team lead, The Ferconio Group' AS role
  UNION ALL SELECT 'John C. Joyce', 'Managing Director (longtime partner, moved from Morgan Stanley together), The Ferconio Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 677) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 677 AND name = x.name);

-- ===== GROUP 437: UBS Private Wealth Management, Beverly Hills, CA =====
-- 679 Aric Zamel (Ascend Wealth Partners)
UPDATE contacts SET
  address = '131 South Rodeo Drive, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, UBS Beverly Hills CA, team "Ascend Wealth Partners" (formed 2022 combining Bob Levin''s team with Zamel; also listed as "Zamel Wealth Management Group"). Forbes Best-in-State (LA Private Wealth) #24 Apr 2026; Barron''s Top 1,200 2021-2024.')), 512)
WHERE id = 679;
INSERT INTO contact_people (contact_id, name, role)
SELECT 679, x.name, x.role FROM (
  SELECT 'Bob Levin, CFP, CEPA' AS name, 'Senior Partner, Ascend Wealth Partners' AS role
  UNION ALL SELECT 'Michelle Rosenberg', 'Client Service Associate, Ascend Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 679) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 679 AND name = x.name);

-- ===== GROUP 438: Morgan Stanley Wealth Management, San Francisco, CA =====
-- 682 Inna Kelly, 694 Jesse Bromberg — confirmed separate teams, different buildings
UPDATE contacts SET
  address = '555 California St, 35th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Wealth Director, Morgan Stanley San Francisco CA. No branded team name found — practices under her own name. Barron''s Top 1,200 2018-2022/2024-2025 (Hall of Fame); Forbes Best-in-State 2018-2025. Confirmed NOT a colleague of id 694 Jesse Bromberg — different building (101 California St) despite sharing a CRM phone number.')), 512)
WHERE id = 682;
UPDATE contacts SET
  address = '101 California St, 23rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding partner/Managing Director, leads "The Bromberg Group," Morgan Stanley San Francisco CA. Barron''s Top 100 2024, Top 1,200 top-75 tier since 2012; Chairman''s Club since 2000. Confirmed NOT a colleague of id 682 Inna Kelly — different building (555 California St) despite sharing a CRM phone number.')), 512)
WHERE id = 694;
INSERT INTO contact_people (contact_id, name, role)
SELECT 694, x.name, x.role FROM (
  SELECT 'Nelly Berkovskaya' AS name, 'Team member, The Bromberg Group' AS role
  UNION ALL SELECT 'Ivan Yang', 'Registered Client Service Associate, The Bromberg Group'
  UNION ALL SELECT 'William McKee', 'Registered Client Service Associate, The Bromberg Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 694) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 694 AND name = x.name);

-- ===== GROUP 439: Raymond James, Newtown, PA =====
-- 684 Thomas Seiler (The Seiler Group of Raymond James)
UPDATE contacts SET
  address = '5 Caufield Place, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Vice President, Investments, founding member of "The Seiler Group of Raymond James," Newtown PA (with Raymond James since 2011; specializes in professional athletes/NFLPA-affiliated clients). Barron''s Top 1,200 honoree 2018-2022/2025.')), 512)
WHERE id = 684;
INSERT INTO contact_people (contact_id, name, role)
SELECT 684, x.name, x.role FROM (
  SELECT 'Patrick M. Seiler, CFP, CIMA, CEPA' AS name, 'Private Wealth Advisor, SVP Investments, The Seiler Group' AS role
  UNION ALL SELECT 'Ross P. Hart, WMS', 'Team member, The Seiler Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 684) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 684 AND name = x.name);

-- ===== GROUP 440: Validus Capital, El Segundo, CA =====
-- 685 John Krambeer
UPDATE contacts SET
  address = '2221 Rosecrans Avenue, Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, Validus Capital (founded 2022, ~$2.18-2.5B AUM as of YE2024), El Segundo CA (previously founded Camden Capital 2004; 16 yrs at Merrill Lynch before that). Barron''s Top 100 Independent Wealth Advisor (4x); Barron''s Top 1,200 honoree.')), 512)
WHERE id = 685;
INSERT INTO contact_people (contact_id, name, role)
SELECT 685, x.name, x.role FROM (
  SELECT 'Sean Chen' AS name, 'COO & CCO, Validus Capital' AS role
  UNION ALL SELECT 'Gino Sasso', 'Strategic Advisor (former EY LA senior tax partner), Validus Capital'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 685) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 685 AND name = x.name);
