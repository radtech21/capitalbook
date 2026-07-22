-- US Financial Advisor enrichment, batch 19 (26 contacts / 20 groups).
--
-- Multi-team shared-building pattern confirmed again: Merrill Chicago
-- (110 N Wacker Dr) houses 4 wholly separate teams under one CRM
-- switchboard number (Oberlander Timmerwilke Group, Scandariato Group,
-- Fries Wealth Management Group, Beckwith Group); Ameriprise Lancaster
-- PA's two advisors (602/806) turned out to be two distinct offices at
-- different street addresses, not colleagues, despite sharing a
-- generic toll-free CRM number.
--
-- Wells Fargo Philadelphia's CRM group (587/830/918) resolved to THREE
-- distinct teams at two different buildings (30 South 17th St vs. 100
-- North 18th St/Two Logan Square) — the shared (215) 585-6000 CRM
-- number does not correspond to any confirmed current Wells Fargo
-- Philadelphia location for any of the three.
--
-- Two negative cross-checks confirmed: Thomas Frame (Morgan Stanley
-- Private Wealth, Greenwich CT) and Chris Jewell (Wells Fargo,
-- Greenwich CT) are unrelated advisors at different firms/buildings;
-- likewise no real link found between Tom Bridges (CIBC Chicago) and a
-- same-surname colleague Robert C. Bridges at the same office.
--
-- Phone data error corrected in data_flags: 605 David Kudla's CRM
-- phone (301) 897-7514 carries a Maryland area code for a Grand Blanc,
-- MI firm — real number is (810) 953-5510.
--
-- Reputational flag noted (not a data error, but worth surfacing):
-- 593 Chris Jewell's Wells Fargo Greenwich team member Mary Hintz filed
-- a gender-discrimination/retaliation suit naming Jewell and Wells
-- Fargo, reported Dec 2025, following her termination effective
-- 12/31/2025.

-- ===== GROUP 361: Morgan Stanley Wealth Management, Deerfield, IL =====
-- 579 Kathleen Roeser (The Roeser Barbanente Group)
UPDATE contacts SET
  address = '111 S. Pfingsten Road, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, co-founder of "The Roeser Barbanente Group," Morgan Stanley Deerfield IL. Forbes Best-In-State Wealth Management Teams 2026; Barron''s Top 100 Women Financial Advisors through 2025.')), 512)
WHERE id = 579;
INSERT INTO contact_people (contact_id, name, role)
SELECT 579, x.name, x.role FROM (
  SELECT 'Roberto Barbanente' AS name, 'Financial Advisor/Founding Partner, Roeser Barbanente Group' AS role
  UNION ALL SELECT 'Matthew Roeser', 'Financial Advisor, Roeser Barbanente Group'
  UNION ALL SELECT 'Michael Roeser', 'Wealth Management Associate, Roeser Barbanente Group'
  UNION ALL SELECT 'Adam Fleishman', 'Financial Advisor, Roeser Barbanente Group'
  UNION ALL SELECT 'Charlie Manion', 'Group Director, Roeser Barbanente Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 579) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 579 AND name = x.name);

-- ===== GROUP 362: UBS Private Wealth Management, Walnut Creek, CA =====
-- 580 Gabriel Jay (Jay Family Partners)
UPDATE contacts SET
  address = '1255 Treat Blvd, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, UBS Financial Services since 2008, leads "Jay Family Partners" (Private Wealth Management), Walnut Creek CA. Forbes California-Northern (Private Wealth) rankings 2026.')), 512)
WHERE id = 580;
INSERT INTO contact_people (contact_id, name, role)
SELECT 580, x.name, x.role FROM (
  SELECT 'Kelly Jay' AS name, 'Co-Lead Advisor, Jay Family Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 580) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 580 AND name = x.name);

-- ===== GROUP 363: Morgan Stanley Private Wealth Management, Greenwich, CT =====
-- 581 Thomas Frame (Frame-Catlett-Rose)
UPDATE contacts SET
  address = 'One Fawcett Place, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, team "Frame-Catlett-Rose (FCR)," Morgan Stanley Private Wealth Management, Greenwich CT (42-yr veteran, Chairman''s Club since 2014). Barron''s Top 1,200 2025; Forbes Best-in-State #7 CT 2025. Confirmed unrelated to id 593 Chris Jewell (Wells Fargo, also Greenwich) — different firms/buildings, no shared history.')), 512)
WHERE id = 581;
INSERT INTO contact_people (contact_id, name, role)
SELECT 581, x.name, x.role FROM (
  SELECT 'Tom Catlett' AS name, 'Private Wealth Advisor, Frame-Catlett-Rose' AS role
  UNION ALL SELECT 'Charles Rose', 'Private Wealth Advisor, Frame-Catlett-Rose'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 581) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 581 AND name = x.name);

-- ===== GROUP 364: Merrill Wealth Management, Chicago, IL =====
-- 582 Sharon Oberlander, 712 Joseph Scandariato, 748 Daniel Fries, 980 Jason Beckwith — 4 separate teams, one building
UPDATE contacts SET
  address = '110 N Wacker Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, leads "Oberlander Timmerwilke Group" (co-led with Andy Timmerwilke), Merrill Chicago IL. Ids 712/748/980 are separate, unrelated Merrill teams in the same building — CRM''s shared (312) 325-6000 is a building switchboard number, not evidence of a shared team.')), 512)
WHERE id = 582;
UPDATE contacts SET
  address = '110 N Wacker Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads "The Scandariato Group," Merrill Chicago IL. Ids 582/748/980 are separate, unrelated Merrill teams in the same building.')), 512)
WHERE id = 712;
UPDATE contacts SET
  address = '110 N Wacker Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads "The Fries Wealth Management Group" (also seen as "Fries Bates Ford Wealth Management & Associates"), Merrill Chicago IL. Ids 582/712/980 are separate, unrelated Merrill teams in the same building.')), 512)
WHERE id = 748;
UPDATE contacts SET
  address = '110 N Wacker Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, leads "The Beckwith Group," Merrill Chicago IL. Ids 582/712/748 are separate, unrelated Merrill teams in the same building.')), 512)
WHERE id = 980;
INSERT INTO contact_people (contact_id, name, role)
SELECT 582, x.name, x.role FROM (
  SELECT 'Andy Timmerwilke' AS name, 'Managing Director (co-lead), Oberlander Timmerwilke Group' AS role
  UNION ALL SELECT 'Annette Seaberg', 'Team member, Oberlander Timmerwilke Group'
  UNION ALL SELECT 'Erica Khan', 'Team member, Oberlander Timmerwilke Group'
  UNION ALL SELECT 'Shanda McFadden', 'Team member, Oberlander Timmerwilke Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 582) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 582 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 712, x.name, x.role FROM (
  SELECT 'Dominic Altobelli' AS name, 'Managing Partner, Scandariato Group' AS role
  UNION ALL SELECT 'Chris Rossi', 'Partner, Scandariato Group'
  UNION ALL SELECT 'Rory Gallagher', 'VP, Senior Relationship Manager, Scandariato Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 712) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 712 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 980, x.name, x.role FROM (
  SELECT 'Alexander Beckwith' AS name, 'Financial Advisor, Beckwith Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 980) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 980 AND name = x.name);

-- ===== GROUP 365: Stifel, New York, NY =====
-- 585 Greg DelMonte (The DelMonte Group)
UPDATE contacts SET
  address = '3 Bryant Park, 1095 Avenue of the Americas, 3rd & 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Investments, leads "The DelMonte Group," Stifel New York NY (joined 2015 via Barclays acquisition, 31+ yrs experience). Forbes Best-In-State (NYC, HNW) #59 Apr 2025. Note: Stifel''s own corporate bio page tags him to a Miami Beach FL branch — likely a dual FL/NY registration or stale tag; his team site and BrokerCheck confirm NY-based leadership.')), 512)
WHERE id = 585;
INSERT INTO contact_people (contact_id, name, role)
SELECT 585, x.name, x.role FROM (
  SELECT 'Carolyn Murillo' AS name, 'Client Service Associate (joined 2016), The DelMonte Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 585) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 585 AND name = x.name);

-- ===== GROUP 366: Morgan Stanley Wealth Management, Mountain View, CA =====
-- 586 Jack Wong (The Mountain View Group)
UPDATE contacts SET
  address = '650 Castro Street, Suite 105',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads "The Mountain View Group" (opened 2011), Morgan Stanley Mountain View CA. Barron''s Top 1,500 2026, Top 1,200 2015-2023; Forbes Best-In-State 2018-2022. CRM phone (650) 526-2600 could not be independently matched — should be re-verified.')), 512)
WHERE id = 586;
INSERT INTO contact_people (contact_id, name, role)
SELECT 586, x.name, x.role FROM (
  SELECT 'Darryl H. Ng' AS name, 'Financial Advisor (followed Wong from Wells Fargo 2011), The Mountain View Group' AS role
  UNION ALL SELECT 'Marlina Kartawinata', 'Team member, The Mountain View Group'
  UNION ALL SELECT 'Lin Wu', 'Team member, The Mountain View Group'
  UNION ALL SELECT 'Tommy Liu', 'Team member, The Mountain View Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 586) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 586 AND name = x.name);

-- ===== GROUP 367: Wells Fargo Advisors, Philadelphia, PA =====
-- 587 John J. Parker Sr., 830 David Kron, 918 Craig Schwartz — 3 separate teams, 2 buildings
UPDATE contacts SET
  address = '30 South 17th Street, 20th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & Founding Partner, "Parker Private Wealth Management Group," Wells Fargo Advisors Financial Network, Philadelphia PA. Ids 830/918 are separate, unrelated Wells Fargo teams at a different building; CRM''s shared (215) 585-6000 does not match any confirmed current number for this office.')), 512)
WHERE id = 587;
UPDATE contacts SET
  address = '100 North 18th Street, 22nd Floor (Two Logan Square)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, Private Wealth Financial Advisor, PIM Portfolio Manager, "Kron & Polis Financial Group," Wells Fargo Advisors, Philadelphia PA (Two Logan Square). Id 918 Craig Schwartz''s team is at the same building/floor but is a separate, unrelated team; id 587 is a separate team at a different building.')), 512)
WHERE id = 830;
UPDATE contacts SET
  address = '100 North 18th Street, 22nd Floor (Two Logan Square)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, founding team member, "Signature Capital Wealth Management Group," Wells Fargo Advisors, Philadelphia PA (Two Logan Square; possibly relocated from an older 30 South 17th Street listing). Id 830 David Kron''s team is at the same building/floor but is a separate, unrelated team; id 587 is a separate team at a different building.')), 512)
WHERE id = 918;
INSERT INTO contact_people (contact_id, name, role)
SELECT 587, x.name, x.role FROM (
  SELECT 'Theodore E. Mack, CFP' AS name, 'Managing Director, Parker Private Wealth Management Group' AS role
  UNION ALL SELECT 'Benjamin D. Spalter, CRPC, CRPS', 'Managing Director, Parker Private Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 587) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 587 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 830, x.name, x.role FROM (
  SELECT 'Andrew M. Polis' AS name, 'Founding member, Managing Director, Kron & Polis Financial Group' AS role
  UNION ALL SELECT 'Matt Cass', 'Planning (joined 2012), Kron & Polis Financial Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 830) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 830 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 918, x.name, x.role FROM (
  SELECT 'Sidney Geller' AS name, 'Team member, Signature Capital Wealth Management Group' AS role
  UNION ALL SELECT 'Earl Maitland', 'Team member, Signature Capital Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 918) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 918 AND name = x.name);

-- ===== GROUP 368: RBC Wealth Management, Boca Raton, FL =====
-- 588 Eric Glasband (Glasband Stempel Wealth Management Group)
UPDATE contacts SET
  address = '5355 Town Center Road, Suite 801',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, "Glasband Stempel Wealth Management Group," RBC Wealth Management, Boca Raton FL (moved from Merrill Lynch Sept 2020, ~$1.4B AUM at the time). Forbes Best-In-State Wealth Advisors 2025.')), 512)
WHERE id = 588;
INSERT INTO contact_people (contact_id, name, role)
SELECT 588, x.name, x.role FROM (
  SELECT 'Jonathan Stempel' AS name, 'Managing Director, Financial Advisor, Glasband Stempel Wealth Management Group' AS role
  UNION ALL SELECT 'Justin Hanlon', 'Senior VP, Financial Advisor, Senior Portfolio Manager, Glasband Stempel Wealth Management Group'
  UNION ALL SELECT 'Matthew Kutner', 'Senior VP, Financial Advisor, Senior Portfolio Manager, Glasband Stempel Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 588) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 588 AND name = x.name);

-- ===== GROUP 369: LBMC Investment Advisors, Brentwood, TN =====
-- 592 Gregory Herman
UPDATE contacts SET
  address = '201 Franklin Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President/Managing Partner, LBMC Investment Advisors, LLC, Brentwood TN (with firm since 1999). Firm named Barron''s Top 1,200 2024/2025.')), 512)
WHERE id = 592;

-- ===== GROUP 370: Wells Fargo Advisors, Greenwich, CT =====
-- 593 Chris Jewell
UPDATE contacts SET
  address = '1 Lafayette Place, 1st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, Private Wealth Financial Advisor, Wells Fargo Advisors, Greenwich CT (41-yr veteran, ~$2B AUM team). Forbes Best-In-State #27 2026. Confirmed unrelated to id 581 Thomas Frame (Morgan Stanley, also Greenwich) — different firms/buildings. Note: team member Mary Hintz filed a gender-discrimination/retaliation suit naming Jewell and Wells Fargo, reported Dec 2025, following her termination effective 12/31/2025 — her current status on this team is uncertain.')), 512)
WHERE id = 593;
INSERT INTO contact_people (contact_id, name, role)
SELECT 593, x.name, x.role FROM (
  SELECT 'Bill Zeltner' AS name, 'Senior Registered Client Associate, Chris Jewell team' AS role
  UNION ALL SELECT 'Michael Tutino', 'Senior Registered Client Associate, Chris Jewell team'
  UNION ALL SELECT 'Matthew Barreto, CFP', 'Senior Financial Advisor, Chris Jewell team'
  UNION ALL SELECT 'Christopher Bardwell, CFP, CIMA, AIF', 'Financial Advisor, Chris Jewell team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 593) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 593 AND name = x.name);

-- ===== GROUP 371: UBS Private Wealth Management, Lincoln, NE =====
-- 594 Jason Dworak (The Dworak Group)
UPDATE contacts SET
  address = '8415 Maddox Drive, Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor, Senior Portfolio Manager, leads "The Dworak Group," UBS Lincoln NE (joined UBS 2008, with firm since 1993). Forbes #1 Best-In-State (NE) and #123 America''s Top Wealth Advisors 2025.')), 512)
WHERE id = 594;
INSERT INTO contact_people (contact_id, name, role)
SELECT 594, x.name, x.role FROM (
  SELECT 'Micah Dworak, CPWA' AS name, 'Financial Advisor (financial/retirement planning), The Dworak Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 594) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 594 AND name = x.name);

-- ===== GROUP 372: Merrill Private Wealth Management, Salt Lake City, UT =====
-- 597 John Van Wagoner (The Van Wagoner Group)
UPDATE contacts SET
  address = '60 East South Temple Street, Suite 200-61',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Manager, founder of "The Van Wagoner Group," Merrill Salt Lake City UT (with Merrill since 1986). Barron''s Top 1,200 2017-2023/2025; Forbes Best-in-State 2019-2023. Team manages $1.6B+ AUM.')), 512)
WHERE id = 597;
INSERT INTO contact_people (contact_id, name, role)
SELECT 597, x.name, x.role FROM (
  SELECT 'Danny Van Wagoner, CFA, CAIA' AS name, 'Private Wealth Advisor (likely son of John), The Van Wagoner Group' AS role
  UNION ALL SELECT 'Lynn Brandenburg', 'Senior Vice President, Senior Financial Advisor, The Van Wagoner Group'
  UNION ALL SELECT 'Douglas Howard', 'Senior Vice President, Senior Financial Advisor, The Van Wagoner Group'
  UNION ALL SELECT 'Morgan Daines', 'Senior Vice President, Wealth Management Advisor, The Van Wagoner Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 597) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 597 AND name = x.name);

-- ===== GROUP 373: Wells Fargo Advisors, Incline Village, NV =====
-- 598 Steve Russell (Russell Private Wealth Management)
UPDATE contacts SET
  address = '938 Tahoe Blvd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads "Russell Private Wealth Management" (Wells Fargo Advisors Financial Network), Incline Village NV. Forbes #7 Nevada Best-in-State 2025.')), 512)
WHERE id = 598;
INSERT INTO contact_people (contact_id, name, role)
SELECT 598, x.name, x.role FROM (
  SELECT 'Eric Bickenbach' AS name, 'Financial Advisor, Russell Private Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 598) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 598 AND name = x.name);

-- ===== GROUP 374: Merrill Private Wealth Management, Charlotte, NC =====
-- 599 Ian McDade (The McDade Group)
UPDATE contacts SET
  address = '6000 Fairview Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Private Wealth Advisor, managing partner of "The McDade Group," Merrill Private Wealth Management, Charlotte NC (joined Merrill March 2003). Barron''s Top 1,200 2019-2021/2024-2025; Forbes #10 NC-West 2026.')), 512)
WHERE id = 599;

-- ===== GROUP 375: CIBC Private Wealth, Chicago, IL =====
-- 600 Tom Bridges
UPDATE contacts SET
  address = '181 West Madison Street, 36th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director and Co-Head of High-Net-Worth Sales, CIBC Private Wealth, Chicago IL (founding member of Geneva Advisors, acquired by CIBC 2017). Barron''s Top 100 2024-2025, Top Advisor by State (#3 IL) through March 2026. Colleague Robert C. Bridges shares a surname at the same office — relationship not confirmed, could be coincidental.')), 512)
WHERE id = 600;
INSERT INTO contact_people (contact_id, name, role)
SELECT 600, x.name, x.role FROM (
  SELECT 'Sean Dobbins' AS name, 'Managing Director, CIBC Private Wealth (same Chicago office)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 600) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 600 AND name = x.name);

-- ===== GROUP 376: Creative Planning, Bloomington, MN =====
-- 601 Travis Bezella
UPDATE contacts SET
  address = '3800 American Boulevard West',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Partner and Managing Director, Creative Planning, oversees the Bloomington/Twin Cities regional office (with firm since 2014). Barron''s Top Advisor Rankings by State 2024/2025.')), 512)
WHERE id = 601;
INSERT INTO contact_people (contact_id, name, role)
SELECT 601, x.name, x.role FROM (
  SELECT 'Michael Giefer, JD, MBA, CFP' AS name, 'Managing Director and Partner, Twin Cities office' AS role
  UNION ALL SELECT 'Dan Stewart', 'Managing Director and Partner, Twin Cities office'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 601) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 601 AND name = x.name);

-- ===== GROUP 377: Ameriprise Financial, Lancaster, PA =====
-- 602 Dane Burkholder, 806 Lon Jury — confirmed two separate offices/teams
UPDATE contacts SET
  address = '30A E Roseville Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Ameriprise Private Wealth Advisor, Managing Partner of "Roseville Wealth Management Group" (20 yrs with Ameriprise, ~$2B AUM, 33 team members). Barron''s Top 100 Independent Advisors 2025. Id 806 Lon Jury is a separate, unrelated Ameriprise practice at a different Lancaster PA address — CRM''s shared (800) 297-7378 is Ameriprise''s generic toll-free line.')), 512)
WHERE id = 602;
UPDATE contacts SET
  address = '1717 Lititz Pike',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Ameriprise Private Wealth Advisor, practice named "Sylvan Capital Advisors" (39 yrs with Ameriprise), Lancaster PA. Barron''s Top 1,200 Ameriprise honoree list 2024/2025. Id 602 Dane Burkholder is a separate, unrelated Ameriprise practice at a different Lancaster PA address — CRM''s shared (800) 297-7378 is Ameriprise''s generic toll-free line.')), 512)
WHERE id = 806;
INSERT INTO contact_people (contact_id, name, role)
SELECT 602, x.name, x.role FROM (
  SELECT 'David Weidman' AS name, 'Managing Director, Roseville Wealth Management Group' AS role
  UNION ALL SELECT 'Matthew J. Wilson', 'Managing Director, Roseville Wealth Management Group'
  UNION ALL SELECT 'Alec Jones', 'Financial Advisor, Roseville Wealth Management Group'
  UNION ALL SELECT 'Jacob Mendoza', 'Financial Advisor, Roseville Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 602) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 602 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 806, x.name, x.role FROM (
  SELECT 'Trish' AS name, 'Office/Team Manager, Sylvan Capital Advisors' AS role
  UNION ALL SELECT 'Jenn', 'Client Meeting Prep / Digital & Communications Lead, Sylvan Capital Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 806) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 806 AND name = x.name);

-- ===== GROUP 378: Wilde Wealth Management Group, Scottsdale, AZ =====
-- 604 Trevor Wilde
UPDATE contacts SET
  address = '7025 N Scottsdale Rd, Suite 115',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO / Investment Advisor Representative, Wilde Wealth Management Group, Scottsdale AZ. Barron''s Top Advisor every year 2009-2025 (17 consecutive years), #3 Arizona 2025.')), 512)
WHERE id = 604;
INSERT INTO contact_people (contact_id, name, role)
SELECT 604, x.name, x.role FROM (
  SELECT 'Jeffrey D. Anthony, CFP' AS name, 'Chief Growth Officer, Wilde Wealth Management Group' AS role
  UNION ALL SELECT 'Nicholas Bair, CFP, ChFC', 'Managing Partner, Surprise office, Wilde Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 604) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 604 AND name = x.name);

-- ===== GROUP 379: Mainstay Capital Management, Grand Blanc, MI =====
-- 605 David Kudla
UPDATE contacts SET
  address = '10775 South Saginaw St., Bldg. C, Suite F',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, CEO & Chief Investment Strategist, Mainstay Capital Management, Grand Blanc MI. Barron''s Top 1,200 2025; CNBC FA 100 2025. CORRECTION: CRM phone (301) 897-7514 carries a Maryland area code and does not match this Michigan firm — correct direct line is (810) 953-5510.')), 512)
WHERE id = 605;
INSERT INTO contact_people (contact_id, name, role)
SELECT 605, x.name, x.role FROM (
  SELECT 'Jeremiah Ludington' AS name, 'Chief Compliance Officer, Mainstay Capital Management' AS role
  UNION ALL SELECT 'Michael Wallen', 'Director, Wealth Management, Mainstay Capital Management'
  UNION ALL SELECT 'Terry Bennett', 'Senior Wealth Advisor, Mainstay Capital Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 605) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 605 AND name = x.name);

-- ===== GROUP 380: Ameriprise Financial, Columbus, OH =====
-- 606 Jeffery Chaddock (Envisage Wealth)
UPDATE contacts SET
  address = '571 S 3rd St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO, "Envisage Wealth," a private wealth advisory practice of Ameriprise Financial Services, Columbus OH. Forbes #1 Ohio Best-in-State 2026.')), 512)
WHERE id = 606;
INSERT INTO contact_people (contact_id, name, role)
SELECT 606, x.name, x.role FROM (
  SELECT 'Andrew Brate' AS name, 'Managing Partner, Envisage Wealth' AS role
  UNION ALL SELECT 'Kevin Gegorski', 'Managing Partner, Envisage Wealth'
  UNION ALL SELECT 'Kerry Thompson', 'Managing Partner, Envisage Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 606) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 606 AND name = x.name);
