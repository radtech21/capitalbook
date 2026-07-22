-- US Financial Advisor enrichment, batch 18 (29 contacts / 20 groups).
--
-- Cross-reference resolved (positive → data error, not a real link): 535
-- Thomas Van Dyck's CRM phone (415) 445-8300 does not match any verified
-- RBC number; it appears to be a data-entry mismatch with the unrelated
-- CIBC Private Wealth SF office (different building) rather than
-- evidence Van Dyck moved firms — he remains confirmed active at RBC
-- Wealth Management (SRI Wealth Management Group), not CIBC.
--
-- Cross-reference resolved (negative): 569/591 confirmed a third,
-- unrelated team ("The Atlanta Group" / "Vantage Wealth Management")
-- sharing 3280 Peachtree Rd NE, Atlanta with the previously documented
-- Parker Pulliam Walls Team / Premier Group (batch 11, contacts 321,
-- 338) — same multi-tenant building, no relationship between teams.
--
-- Cross-reference resolved (negative): 570 Ira Rapaport (New England
-- Private Wealth Advisors) and 562 David Javaheri (Morgan Stanley) are
-- both Wellesley, MA-based but at unrelated firms with no shared
-- history — coincidental shared city, not a shared team.
--
-- Several CRM phone numbers confirmed as generic/stale vs. direct
-- lines (not corrected in the phone column, only flagged): 525/526
-- Park Avenue Capital, 537/538 HLM Capital, 551 JPM Philadelphia, 553
-- MS Pasadena (matches), 563/564 Raymond James Reston.
--
-- Multi-team shared-building pattern confirmed again: UBS Midland TX
-- (Liberty Group vs. 1945 Wealth Advisors), Wells Fargo Radnor
-- (Beaulieu Tracy Wealth Management Group vs. Solis-Cohen Rubin
-- Financial Strategies — two distinct teams, same address).
--
-- Firm-detail correction: 577 Van Pearcy's team is registered through
-- Raymond James Financial Services (the independent RJ channel), not
-- the CRM's generic "Van Pearcy's Wealth Services Team" firm label.

-- ===== GROUP 341: Park Avenue Capital, New York, NY =====
-- 525 Benjamin Feldman, 526 Ernest Peter Tiboris
UPDATE contacts SET
  address = '300 Madison Avenue, Floor 25',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder/Founding Partner, Park Avenue Capital (Northwestern Mutual), New York NY. 2x Barron''s Top 1,200; Forbes 2026 Best-In-State (NY) #10. CRM phone (212) 755-5858 appears stale — firm''s currently published number is (646) 459-1001.')), 512)
WHERE id = 525;
UPDATE contacts SET
  address = '300 Madison Avenue, Floor 25',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founding Partner & CEO, Park Avenue Capital (Northwestern Mutual), New York NY, alongside id 525 Benjamin Feldman. With Northwestern Mutual since 2002. CRM phone (212) 755-5858 appears stale — firm''s currently published number is (646) 459-1001.')), 512)
WHERE id = 526;
INSERT INTO contact_people (contact_id, name, role)
SELECT 525, x.name, x.role FROM (
  SELECT 'Matthew Wunder, CLU, CFP' AS name, 'Advisor (joined via 2023 acquisition of Wunder Financial), Park Avenue Capital' AS role
  UNION ALL SELECT 'Richard A. Goldman', 'Advisor, Park Avenue Capital'
  UNION ALL SELECT 'David J. Hachey', 'Advisor, Park Avenue Capital'
  UNION ALL SELECT 'Seth Andrew Rivers', 'Advisor, Park Avenue Capital'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 525) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 525 AND name = x.name);

-- ===== GROUP 342: UBS Private Wealth Management, Boca Raton, FL =====
-- 528 Ed Ventrice, 529 Michael Bober ("BV Group")
UPDATE contacts SET
  address = '1800 N. Military Trail, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CFP/CIMA/CEPA, "BV Group," UBS Boca Raton FL, alongside id 529 Michael Bober.')), 512)
WHERE id = 528;
UPDATE contacts SET
  address = '1800 N. Military Trail, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor, CFP/CIMA/CEPA, "BV Group," UBS Boca Raton FL, alongside id 528 Ed Ventrice.')), 512)
WHERE id = 529;
INSERT INTO contact_people (contact_id, name, role)
SELECT 528, x.name, x.role FROM (
  SELECT 'Michael MacDonald, CFP' AS name, 'Team member, BV Group' AS role
  UNION ALL SELECT 'Alex Santos, CFP, CEPA', 'Team member, BV Group'
  UNION ALL SELECT 'William Marino, CFP, AWMA', 'Team member, BV Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 528) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 528 AND name = x.name);

-- ===== GROUP 343: RBC Wealth Management, San Francisco, CA =====
-- 535 Thomas Van Dyck
UPDATE contacts SET
  address = '345 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Financial Advisor, SRI Wealth Management Group, RBC Wealth Management, San Francisco CA. Named 2026 Barron''s Top 1,500 and 2026 AdvisorHub Advisors to Watch. CRM phone (415) 445-8300 does not match any verified RBC number and appears to be a data error coinciding with the unrelated CIBC Private Wealth SF office (different building) — no evidence of any move to CIBC.')), 512)
WHERE id = 535;
INSERT INTO contact_people (contact_id, name, role)
SELECT 535, x.name, x.role FROM (
  SELECT 'Catherine R. Chen' AS name, 'Team member, SRI Wealth Management Group' AS role
  UNION ALL SELECT 'Michelle Schiro', 'Team member, SRI Wealth Management Group'
  UNION ALL SELECT 'Farralon Udom', 'Team member, SRI Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 535) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 535 AND name = x.name);

-- ===== GROUP 344: HLM Capital Management Group, Highland Park, IL =====
-- 537 Benjamin Leshem, 538 Steven Hefter
UPDATE contacts SET
  address = '1849 Green Bay Road, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner, HLM Capital Management Group, Highland Park IL (joined 1996), alongside id 538 Steven Hefter. Phone discrepancy noted: search found (847) 563-3400 vs. CRM''s (847) 831-0200; current number not independently verified.')), 512)
WHERE id = 537;
UPDATE contacts SET
  address = '1849 Green Bay Road, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner, HLM Capital Management Group, Highland Park IL (founded team 1983, lead investment strategist), alongside id 537 Benjamin Leshem. Phone discrepancy noted: search found (847) 563-3400 vs. CRM''s (847) 831-0200; current number not independently verified.')), 512)
WHERE id = 538;
INSERT INTO contact_people (contact_id, name, role)
SELECT 537, x.name, x.role FROM (
  SELECT 'Charlie Margolis' AS name, 'Partner, Managing Principal, HLM Capital Management Group' AS role
  UNION ALL SELECT 'Heide Murray', 'Operations Supervisor, HLM Capital Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 537) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 537 AND name = x.name);

-- ===== GROUP 345: UBS Private Wealth Management, Midland, TX =====
-- 550 Dan Michel (The Liberty Group), 724 Greg McDonald (1945 Wealth Advisors — separate team, same address)
UPDATE contacts SET
  address = '1700 West Wall Street, Suite 220',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor, leads "The Liberty Group," UBS Midland TX. Id 724 Greg McDonald is a separate team ("1945 Wealth Advisors") at the same branch address, not a colleague.')), 512)
WHERE id = 550;
UPDATE contacts SET
  address = '1700 West Wall Street, Suite 220',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Private Wealth Advisor, leads "1945 Wealth Advisors," UBS Midland TX. Id 550 Dan Michel is a separate team ("The Liberty Group") at the same branch address, not a colleague.')), 512)
WHERE id = 724;
INSERT INTO contact_people (contact_id, name, role)
SELECT 550, x.name, x.role FROM (
  SELECT 'Alan Jones' AS name, 'Team member, The Liberty Group' AS role
  UNION ALL SELECT 'Jim Bob McNeil', 'Team member, The Liberty Group'
  UNION ALL SELECT 'Preston Michel', 'Portfolio construction/fund due diligence/trading/financial planning, The Liberty Group'
  UNION ALL SELECT 'Joseph Michel', 'Team member (joined 2024), The Liberty Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 550) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 550 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 724, x.name, x.role FROM (
  SELECT 'Andrea' AS name, 'Client Service Associate, 1945 Wealth Advisors' AS role
  UNION ALL SELECT 'Lydia', 'Client Service Associate/operations, 1945 Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 724) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 724 AND name = x.name);

-- ===== GROUP 346: J.P. Morgan Wealth Management, Philadelphia, PA =====
-- 551 Jack Hafner (The Hafner Group)
UPDATE contacts SET
  address = '1735 Market Street, Suite 3110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, leads "The Hafner Group," J.P. Morgan Wealth Management, Philadelphia PA (joined 2018). 2025 Barron''s Top 1,200 honoree. CRM phone (800) 392-5749 is a generic toll-free line; direct line (215) 864-5715.')), 512)
WHERE id = 551;
INSERT INTO contact_people (contact_id, name, role)
SELECT 551, x.name, x.role FROM (
  SELECT 'Adam Mace' AS name, 'Vice President & Wealth Advisor, The Hafner Group' AS role
  UNION ALL SELECT 'Cary Ann Murphy', 'Vice President & Relationship Manager (client service operations), The Hafner Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 551) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 551 AND name = x.name);

-- ===== GROUP 347: Morgan Stanley Wealth Management, Pasadena, CA =====
-- 553 Alan Whitman (The Whitman Group)
UPDATE contacts SET
  address = '55 South Lake Avenue, Suite 700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "The Whitman Group" (7-person office), Morgan Stanley Pasadena CA. 2025 Barron''s Top 1,200 and Top 250 Private Wealth Management Team; repeat Barron''s Top 100 honoree.')), 512)
WHERE id = 553;
INSERT INTO contact_people (contact_id, name, role)
SELECT 553, x.name, x.role FROM (
  SELECT 'Katy Zhao' AS name, 'Partner (Forbes/SHOOK Top Woman Advisor), The Whitman Group' AS role
  UNION ALL SELECT 'Erin', 'Group Director, operations/insurance specialist, Notary Public, The Whitman Group'
  UNION ALL SELECT 'Jason', 'Investment & Trading Support, The Whitman Group'
  UNION ALL SELECT 'Julie Nhan', 'Senior Registered Client Service Associate, The Whitman Group'
  UNION ALL SELECT 'Steve Winchell', 'Client Service Associate, The Whitman Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 553) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 553 AND name = x.name);

-- ===== GROUP 348: Clarity Wealth | Wells Fargo Advisors FiNet, Naples, FL =====
-- 554 Michael McCain, 794 Keith Jacoby
UPDATE contacts SET
  address = '8625 Tamiami Trail North, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor & Partner, Clarity Wealth (Wells Fargo Advisors FiNet), Naples FL, alongside id 794 Keith Jacoby. Legacy team branding "Jacoby Nealon & McCain Wealth Management Group" now operates under the Clarity Wealth name.')), 512)
WHERE id = 554;
UPDATE contacts SET
  address = '8625 Tamiami Trail North, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO & Partner, Clarity Wealth (Wells Fargo Advisors FiNet), Naples FL, alongside id 554 Michael McCain. Legacy team branding "Jacoby Nealon & McCain Wealth Management Group" now operates under the Clarity Wealth name.')), 512)
WHERE id = 794;
INSERT INTO contact_people (contact_id, name, role)
SELECT 554, x.name, x.role FROM (
  SELECT 'Don Nealon' AS name, 'Managing Director, Wealth Advisor & Partner, Clarity Wealth' AS role
  UNION ALL SELECT 'Paul LoPresti', 'Managing Director, Wealth Advisor, Clarity Wealth'
  UNION ALL SELECT 'Laura Ross', 'Managing Director, Wealth Advisor, Clarity Wealth'
  UNION ALL SELECT 'Alex McCain', 'Senior Vice President, Wealth Advisor, Clarity Wealth'
  UNION ALL SELECT 'Kevin Quinn', 'Senior Vice President, Wealth Advisor, Clarity Wealth'
  UNION ALL SELECT 'Ashley Kelly', 'Vice President, Wealth Advisor, Clarity Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 554) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 554 AND name = x.name);

-- ===== GROUP 349: Merrill Wealth Management, Bainbridge Island, WA =====
-- 557 Michael Maroni (MFHK Wealth Management Group)
UPDATE contacts SET
  address = '187 Parfitt Way SW, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor/Managing Director, leads "MFHK Wealth Management Group," Merrill Lynch Wealth Management, Bainbridge Island WA (advisor since 1990).')), 512)
WHERE id = 557;
INSERT INTO contact_people (contact_id, name, role)
SELECT 557, x.name, x.role FROM (
  SELECT 'Tyler Mooney' AS name, 'Financial Advisor, MFHK Wealth Management Group' AS role
  UNION ALL SELECT 'David Holt, ChFC, CRPC', 'Vice President, Wealth Management Advisor, MFHK Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 557) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 557 AND name = x.name);

-- ===== GROUP 350: Wells Fargo Advisors, Radnor, PA =====
-- 559 Jay Beaulieu (Beaulieu Tracy Wealth Management Group), 1087 John Solis-Cohen (Solis-Cohen Rubin Financial Strategies — separate team, same address)
UPDATE contacts SET
  address = '150 N. Radnor-Chester Rd., Suite A-100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, Senior Financial Advisor, founder/lead of Beaulieu Tracy Wealth Management Group, Wells Fargo Advisors Radnor PA (joined 2016, ex-Credit Suisse/DLJ). Id 1087 John Solis-Cohen leads a separate team at the same address, not a colleague.')), 512)
WHERE id = 559;
UPDATE contacts SET
  address = '150 N. Radnor-Chester Rd., Suite A-100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, leads "Solis-Cohen Rubin Financial Strategies," Wells Fargo Advisors Radnor PA. Forbes Best-In-State Wealth Advisor 2024 (PA-East). Id 559 Jay Beaulieu leads a separate team at the same address, not a colleague.')), 512)
WHERE id = 1087;
INSERT INTO contact_people (contact_id, name, role)
SELECT 559, x.name, x.role FROM (
  SELECT 'David Tracy' AS name, 'Advisor, Beaulieu Tracy Wealth Management Group' AS role
  UNION ALL SELECT 'H. Kelly Priess', 'Team member, Beaulieu Tracy Wealth Management Group'
  UNION ALL SELECT 'Jennifer Guarino', 'Team member, Beaulieu Tracy Wealth Management Group'
  UNION ALL SELECT 'Christopher Adams', 'Team member, Beaulieu Tracy Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 559) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 559 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1087, x.name, x.role FROM (
  SELECT 'Joseph Rubin' AS name, 'Financial Advisor (co-lead), Solis-Cohen Rubin Financial Strategies' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1087) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1087 AND name = x.name);

-- ===== GROUP 351: Rockefeller Capital Management, Los Gatos, CA =====
-- 561 Cheryl L. Young (Young & Associates)
UPDATE contacts SET
  address = '750 University Ave, Suite 240',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Rockefeller Capital Management (Rockefeller Global Family Office), Los Gatos CA. Leads "Young & Associates" (~$2B practice, moved from Morgan Stanley/First Republic in 2022). Barron''s Advisor 2026 Top 100 and Hall of Fame; #1/#2 nationally in Forbes Top Women Wealth Advisors for over a decade.')), 512)
WHERE id = 561;
INSERT INTO contact_people (contact_id, name, role)
SELECT 561, x.name, x.role FROM (
  SELECT 'Boaz Chan' AS name, 'VP & Client Relationship Director, Young & Associates' AS role
  UNION ALL SELECT 'Jennifer Seacrist', 'VP & Client Relationship Director, Young & Associates'
  UNION ALL SELECT 'Wey Lim', 'VP & Client Relationship Director, Young & Associates'
  UNION ALL SELECT 'Nicholas Peterson', 'VP & Client Relationship Director, Young & Associates'
  UNION ALL SELECT 'Sarah Mijts', 'VP & Business Practice Manager, Young & Associates'
  UNION ALL SELECT 'Jenny Young', 'Financial Planning Analyst, Young & Associates'
  UNION ALL SELECT 'Cassidy Liu', 'Senior Client Associate, Young & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 561) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 561 AND name = x.name);

-- ===== GROUP 352: Morgan Stanley Wealth Management, Wellesley, MA =====
-- 562 David Javaheri (The Javaheri Group)
UPDATE contacts SET
  address = '112 Worcester Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founder of "The Javaheri Group" (founded 1995, at Morgan Stanley since 2009), Wellesley MA. FWD/CIMA designations; #10 Forbes 2026 Best-In-State (MA). Team manages ~$1.9B in Government Entity/Corporate Cash AUM. Confirmed unrelated to id 570 Ira Rapaport (New England Private Wealth Advisors), a different firm at the same Wellesley address city.')), 512)
WHERE id = 562;
INSERT INTO contact_people (contact_id, name, role)
SELECT 562, x.name, x.role FROM (
  SELECT 'Kirk McCaw, CFA' AS name, 'Portfolio Manager, The Javaheri Group' AS role
  UNION ALL SELECT 'Marni Friedman', 'Team Operations/Administration, The Javaheri Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 562) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 562 AND name = x.name);

-- ===== GROUP 353: Raymond James, Reston, VA =====
-- 563 Gregory Smith, 564 Simon Hamilton (The Wise Investor Group)
UPDATE contacts SET
  address = '1950 Opportunity Way, Suite 950',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & founding/managing partner, "The Wise Investor Group," Raymond James Reston VA (joined from Baird Sept 2022, ~$2.5-2.9B AUM team). Barron''s Top 1,200 2025. CRM phone (800) 248-8863 is Raymond James'' generic national toll-free line; direct branch line (571) 430-7200.')), 512)
WHERE id = 563;
UPDATE contacts SET
  address = '1950 Opportunity Way, Suite 950',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, "The Wise Investor Group," Raymond James Reston VA, alongside id 563 Gregory Smith. Hosts "The Wise Investor" radio show. Forbes Best-In-State (VA-North) #11 2025; Barron''s Top 1,200 2025. CRM phone (800) 248-8863 is Raymond James'' generic national toll-free line; direct branch line (571) 430-7200.')), 512)
WHERE id = 564;
INSERT INTO contact_people (contact_id, name, role)
SELECT 563, x.name, x.role FROM (
  SELECT 'Christopher A. Aime, CFP' AS name, 'Managing Director, Wise Investor Group' AS role
  UNION ALL SELECT 'David Mount', 'Financial Advisor, Wise Investor Group'
  UNION ALL SELECT 'Ann Summerson', 'Financial Advisor, Wise Investor Group'
  UNION ALL SELECT 'Chase Hinderstein', 'Financial Advisor, Wise Investor Group'
  UNION ALL SELECT 'Matthew Anderson', 'Financial Advisor, Wise Investor Group'
  UNION ALL SELECT 'Nicholas Sorden', 'Financial Advisor, Wise Investor Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 563) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 563 AND name = x.name);

-- ===== GROUP 354: Merrill Wealth Management, Naples, FL =====
-- 565 Mark Thorndyke (Thorndyke Sheppard Group)
UPDATE contacts SET
  address = '9128 Strada Place, Suite 301',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, team now branded "Thorndyke Sheppard Group" (co-led with David Sheppard, ~25-27 professionals), Merrill Lynch Naples FL (Mercato). Ranked #2 on 2026 Forbes Best-In-State (FL); team on Forbes Best-in-State Wealth Management Teams 2023-2026. CRM phone was blank; office phone (239) 261-4900.')), 512)
WHERE id = 565;
INSERT INTO contact_people (contact_id, name, role)
SELECT 565, x.name, x.role FROM (
  SELECT 'David Sheppard, CPWA, CIMA' AS name, 'Managing Director, Wealth Management Advisor, Senior Portfolio Manager, co-lead, Thorndyke Sheppard Group' AS role
  UNION ALL SELECT 'Alex Siedow, CFP', 'Financial Advisor, Thorndyke Sheppard Group'
  UNION ALL SELECT 'Matthew Thorndyke, CEPA', 'Team Financial Advisor (likely relative), Thorndyke Sheppard Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 565) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 565 AND name = x.name);

-- ===== GROUP 355: Morgan Stanley Wealth Management, Atlanta, GA =====
-- 569 Saul Levy (The Atlanta Group), 591 David Skid (Vantage Wealth Management)
UPDATE contacts SET
  address = '3280 Peachtree Rd NE, Suite 1900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Financial Advisor, founder/leader of "The Atlanta Group," Morgan Stanley Atlanta GA (team of 13, ~$4B AUM). Barron''s Top 1,500 2026, Top 1,200 2016-2024. This building also houses two unrelated MS teams previously documented: Parker Pulliam Walls Team (Suite 2000, id 321) and Premier Group (Suite 1600, id 338), plus id 591 David Skid''s Vantage Wealth Management (Suite 1900) — a fourth distinct team, not a colleague.')), 512)
WHERE id = 569;
UPDATE contacts SET
  address = '3280 Peachtree Rd NE, Suite 1900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Family Wealth Director, Financial Advisor, CFA/CFP, part of "Vantage Wealth Management" team, Morgan Stanley Atlanta GA. Barron''s Top 1,200 by State 2025; Forbes Top Wealth Advisors #209 2025. Shares this multi-tenant building/suite with id 569 Saul Levy''s unrelated "The Atlanta Group" team, and (per batch 11) with Parker Pulliam Walls Team and Premier Group in other suites — not a colleague of any of them.')), 512)
WHERE id = 591;
INSERT INTO contact_people (contact_id, name, role)
SELECT 569, x.name, x.role FROM (
  SELECT 'Tina-Marie Bryant' AS name, 'Team member (35+ yr industry veteran), The Atlanta Group' AS role
  UNION ALL SELECT 'Jessica Keene McKenna', 'Investor Relations (alternative investments), The Atlanta Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 569) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 569 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 591, x.name, x.role FROM (
  SELECT 'Ben' AS name, 'Senior VP & Financial Advisor, Vantage Wealth Management' AS role
  UNION ALL SELECT 'Zak', 'VP & Financial Advisor, Vantage Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 591) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 591 AND name = x.name);

-- ===== GROUP 356: New England Private Wealth Advisors, Wellesley, MA =====
-- 570 Ira Rapaport
UPDATE contacts SET
  address = '36 Washington Street, Suite 280',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder & CEO, New England Private Wealth Advisors (NEPWA), Wellesley MA (founded 2004/2005). Firm now backed by Aspen Standard Wealth (~$2.9B AUM as of 12/31/2024); acquired DHK Financial Advisors (Portsmouth NH) Sept 2025, bringing combined AUM to ~$5B/440+ clients as of 12/31/2025. Confirmed no relationship to id 562 David Javaheri (Morgan Stanley) — coincidentally both Wellesley-based but unrelated firms.')), 512)
WHERE id = 570;
INSERT INTO contact_people (contact_id, name, role)
SELECT 570, x.name, x.role FROM (
  SELECT 'Tim Dempsey' AS name, 'President & CIO, DHK Financial Advisors (joined NEPWA via Sept 2025 acquisition)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 570) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 570 AND name = x.name);

-- ===== GROUP 357: Wells Fargo Advisors, North Wilkesboro, NC =====
-- 574 Brook Biddy
UPDATE contacts SET
  address = '315 Main Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Wells Fargo Advisors, North Wilkesboro NC, jointly listed with Evan Q. Handy. Ranked #36 Forbes Best-In-State (NC-West) 2025. CRM phone (877) 879-2495 is generic toll-free; direct line (336) 651-7886.')), 512)
WHERE id = 574;
INSERT INTO contact_people (contact_id, name, role)
SELECT 574, x.name, x.role FROM (
  SELECT 'Evan Q. Handy, CFP' AS name, 'Senior Financial Advisor, same office/practice' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 574) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 574 AND name = x.name);

-- ===== GROUP 358: Merrill Private Wealth Management, Frisco, TX =====
-- 575 Steve Nagel (Nagel Pierce Group)
UPDATE contacts SET
  address = '1 Cowboys Way, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Wealth Management Advisor (since 1996), team now branded "Nagel Pierce Group" (formerly O''Neill, Nagel, Pierce and Associates), Merrill Private Wealth Management, Frisco TX (The Star), with a satellite Dallas TX office. Ranked #1 Best-In-State Wealth Management Teams 2025 (TX-North); Nagel individually #7 Best-In-State (TX-North) 2025. CRM phone (800) 637-7455 is generic toll-free; direct line (940) 297-6980.')), 512)
WHERE id = 575;
INSERT INTO contact_people (contact_id, name, role)
SELECT 575, x.name, x.role FROM (
  SELECT 'Tom Pierce' AS name, 'Financial Advisor (co-name of team, ~13 yrs at Merrill), Nagel Pierce Group' AS role
  UNION ALL SELECT 'Adam Noll', 'Financial Advisor, Nagel Pierce Group'
  UNION ALL SELECT 'Kim M. Pearson', 'AVP, Private Wealth Associate, Nagel Pierce Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 575) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 575 AND name = x.name);

-- ===== GROUP 359: Van Pearcy's Wealth Services Team, Midland, TX =====
-- 577 Van Pearcy
UPDATE contacts SET
  firm = 'Van Pearcy''s Wealth Services Team | Raymond James Financial Services',
  address = '2020 W Cuthbert Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Van Mark Pearcy, President/Branch Manager/Registered Principal/Financial Advisor, registered through Raymond James Financial Services (the independent RJ channel), Midland TX. Team ranked #1 Texas-North on Forbes.com Apr 2026.')), 512)
WHERE id = 577;
INSERT INTO contact_people (contact_id, name, role)
SELECT 577, x.name, x.role FROM (
  SELECT 'Vance Pearcy' AS name, 'Branch Associate/Client Service (son of Van Pearcy, joined team 2016)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 577) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 577 AND name = x.name);

-- ===== GROUP 360: UBS Wealth Management, Mount Laurel, NJ =====
-- 578 Mark Fendrick (FLO Wealth Management), 975 Christine McGinley (Generational Wealth Consultants / Gendelman McGinley Group)
UPDATE contacts SET
  address = '501 Fellowship Road, Suite 302',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, CFP, UBS Mount Laurel NJ (joined 2008). Team rebranded from "The Fendrick Group" to "FLO Wealth Management" (Fendrick, Licausi, Ostrum/Zegarra). Barron''s Top 1,200 every year 2014-2025; Forbes Best-in-State Wealth Advisor and Team 2023-2026. Id 975 Christine McGinley leads a separate team at the same address, not a colleague.')), 512)
WHERE id = 578;
UPDATE contacts SET
  address = '501 Fellowship Road, Suite 302',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP/CPM, Managing Director/Senior Portfolio Manager/Executive Director/Market Director, UBS Mount Laurel NJ (joined 2008). Team currently branded "Generational Wealth Consultants," also referenced as "Gendelman McGinley Group" (likely the same team, rebrand not independently confirmed). Barron''s Top 1,200 2023; Forbes Best-in-State Wealth Advisor 2022-2026. Id 578 Mark Fendrick leads a separate team at the same address, not a colleague.')), 512)
WHERE id = 975;
INSERT INTO contact_people (contact_id, name, role)
SELECT 578, x.name, x.role FROM (
  SELECT 'Jamison A. Licausi, CFP' AS name, 'Advisor, FLO Wealth Management' AS role
  UNION ALL SELECT 'David A. Ostrum, CFP', 'Advisor, FLO Wealth Management'
  UNION ALL SELECT 'Felipe Zegarra, CFP, CTFA', 'Advisor, FLO Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 578) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 578 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 975, x.name, x.role FROM (
  SELECT 'Richard "Rich" Gendelman' AS name, 'Founder/Advisor (35+ yrs, moved from Smith Barney to UBS 2008), Generational Wealth Consultants' AS role
  UNION ALL SELECT 'Buddy Buzzerd III', 'Advisor, Generational Wealth Consultants'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 975) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 975 AND name = x.name);
