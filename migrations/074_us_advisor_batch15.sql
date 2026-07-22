-- US Financial Advisor enrichment, batch 15 (30 contacts / 20 groups).
--
-- Two firm-change corrections applied: 549 Jason Stephens departed UBS
-- Naples (~April 2026) to co-found the independent RIA Evertern Wealth
-- (Dynasty-backed, ~$2.4B AUM); 459 Bret Glover and 688 Colin Grahl left
-- Ameriprise/WGG Wealth Partners (July 2025) when their ~$2.7B team
-- transitioned to NorthRock Partners, an independent RIA.
--
-- Investigated but ruled negative: 461/583/852 (McKnight, Gaither,
-- Corey) share the CRM's Washington DC phone number with contact 345's
-- Rietano Group (batch 13) but are confirmed to sit at a different
-- building entirely (1800 K St NW vs. 1152 15th St NW) — unrelated
-- teams, likely a shared legacy/generic switchboard number in the CRM.

-- ===== GROUP 281: UBS Private Wealth Management, Naples, FL =====
-- 433 Joseph Matina (The Matina Group), 549 Jason Stephens (DEPARTED to Evertern Wealth)
UPDATE contacts SET
  address = '801 Laurel Oak Drive, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor/Managing Director, leads The Matina Group, UBS Naples FL. Forbes 2026 recognition.')), 512)
WHERE id = 433;
UPDATE contacts SET
  firm = 'Evertern Wealth',
  title = 'Co-Founder/Managing Partner',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed UBS Naples ~April 1, 2026, co-founding Evertern Wealth, an independent multi-family office in Naples FL (Dynasty Financial Partners-backed, ~$2.4B AUM, custodies at Goldman Sachs), with Michael "Mic" Lundon.')), 512)
WHERE id = 549;
INSERT INTO contact_people (contact_id, name, role)
SELECT 433, x.name, x.role FROM (
  SELECT 'Amy West' AS name, 'Senior Wealth Strategy Associate & Executive Director, The Matina Group' AS role
  UNION ALL SELECT 'Michael Rubenstein', 'Vice President-Financial Advisor (joined ~Jan 2025), The Matina Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 433) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 433 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 549, x.name, x.role FROM (
  SELECT 'Michael "Mic" Lundon' AS name, 'Co-Founder/Managing Partner, Evertern Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 549) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 549 AND name = x.name);

-- ===== GROUP 282: UBS Private Wealth Management, Austin, TX =====
-- 436 Mark Moore, 943 Tim Oates (512 Wealth Partners)
UPDATE contacts SET
  address = '98 San Jacinto Boulevard, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Manager, Private Wealth Advisor, UBS Pinnacle Circle Advisor (top <1% of firm), part of 512 Wealth Partners, UBS Austin.')), 512)
WHERE id = 436;
UPDATE contacts SET
  address = '98 San Jacinto Boulevard, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP/CEPA, insurance coordinator, UBS Chairman''s Advisor (top <5% of firm), part of 512 Wealth Partners, UBS Austin, alongside id 436 Mark Moore.')), 512)
WHERE id = 943;
INSERT INTO contact_people (contact_id, name, role)
SELECT 436, x.name, x.role FROM (
  SELECT 'Jay Mechling, CIMA' AS name, 'Financial Advisor, 512 Wealth Partners' AS role
  UNION ALL SELECT 'Jordan Silverman, CEPA', 'Financial Advisor, 512 Wealth Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 436) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 436 AND name = x.name);

-- ===== GROUP 283: Merrill Private Wealth Management, Bellevue, WA =====
-- 439 James Ferguson (Ferguson, Lubner, Bumpus and Associates), 552 Jason Weese (Weese
-- Harris Hanover Group) — two separate teams sharing the same building.
UPDATE contacts SET
  address = '10400 NE 4th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, leads Ferguson, Lubner, Bumpus and Associates, Merrill Bellevue WA (~28 yrs industry experience; joined Merrill 2016). #26 Washington Private Wealth Forbes Apr 2025.')), 512)
WHERE id = 439;
UPDATE contacts SET
  address = '10400 NE 4th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, CFP, Private Wealth Advisor, co-founder of the Weese Harris Hanover Group, Merrill Bellevue WA (32 yrs industry experience; joined Merrill 2016; separate team from id 439 James Ferguson, sharing the same building).')), 512)
WHERE id = 552;
INSERT INTO contact_people (contact_id, name, role)
SELECT 439, x.name, x.role FROM (
  SELECT 'Alan Lubner' AS name, 'Financial Advisor/Private Wealth Advisor, Ferguson, Lubner, Bumpus and Associates' AS role
  UNION ALL SELECT 'Traci Bumpus', 'Financial Advisor, Ferguson, Lubner, Bumpus and Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 439) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 439 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 552, x.name, x.role FROM (
  SELECT 'Mark Harris' AS name, 'Managing Director, Private Wealth Senior Consultant, Weese Harris Hanover Group' AS role
  UNION ALL SELECT 'Colby Hanover', 'Senior VP, Private Wealth Senior Relationship Manager, Weese Harris Hanover Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 552) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 552 AND name = x.name);

-- ===== GROUP 284: Morgan Stanley Private Wealth Management, San Diego, CA =====
-- 440 Darren Pfefferman (The Pfefferman/Daluiso Group)
UPDATE contacts SET
  address = '4350 La Jolla Village Drive, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, Private Wealth Advisor/Family Wealth Director, The Pfefferman/Daluiso Group, Morgan Stanley San Diego (~$3.16B AUM). Forbes 2026 Best-In-State; Barron''s Top 1,200 2017-2025.')), 512)
WHERE id = 440;
INSERT INTO contact_people (contact_id, name, role)
SELECT 440, x.name, x.role FROM (
  SELECT 'Brad Daluiso' AS name, 'Senior VP, Private Wealth Advisor & Corporate Retirement Director, The Pfefferman/Daluiso Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 440) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 440 AND name = x.name);

-- ===== GROUP 285: UBS Wealth Management, Denver, CO =====
-- 441 Gary Cooper
UPDATE contacts SET
  address = '370 17th Street, Suite 4100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management & Private Wealth Advisor, UBS Denver. Barron''s Top 1,500 2026; #5 Forbes 2026 Best-In-State CO. No named team members found.')), 512)
WHERE id = 441;

-- ===== GROUP 286: CIBC Private Wealth, West Palm Beach, FL =====
-- 449 Eric Propper
UPDATE contacts SET
  address = '525 Okeechobee Boulevard, Suite 1630',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Vice Chairman, CIBC Private Wealth US, senior relationship manager (45 years industry experience), West Palm Beach FL; also serves on CIBC Private Wealth U.S. Operating Committee. Barron''s Top Advisor Rankings by State 2024-2026.')), 512)
WHERE id = 449;

-- ===== GROUP 287: Merrill Wealth Management, Boston, MA — 617-946-4000 =====
-- 443 Andrew Zimmerman (Boston Harbor Team), 959 Mary Mullin (Mullin & Associates) — two
-- more separate teams at the shared 100 Federal Street building (see batch 9's group 168).
UPDATE contacts SET
  address = '100 Federal Street, Floor 17',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Boston Harbor Team, Merrill Boston (rejoined Merrill 2016 after a Morgan Stanley stint); shares the 100 Federal St building with several other Merrill teams (see batch 9 group).')), 512)
WHERE id = 443;
UPDATE contacts SET
  address = '100 Federal Street, Floor 17',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, leads Mullin & Associates, Merrill Boston. #1 Forbes 2026 Top Women Wealth Advisors Best-In-State.')), 512)
WHERE id = 959;
INSERT INTO contact_people (contact_id, name, role)
SELECT 959, x.name, x.role FROM (
  SELECT 'Patrick Mullin' AS name, 'Team member (son), Mullin & Associates' AS role
  UNION ALL SELECT 'Jaclyn Rossiter', 'Team member, Mullin & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 959) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 959 AND name = x.name);

-- ===== GROUP 288: RBC Wealth Management, Raleigh, NC =====
-- 444 Bob McCarthy (The McCarthy Wealth Group)
UPDATE contacts SET
  address = '3800 Glenwood Ave, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor & Senior Portfolio Manager, leads The McCarthy Wealth Group, RBC Raleigh NC. #29 Forbes 2026 Best-In-State NC-East.')), 512)
WHERE id = 444;
INSERT INTO contact_people (contact_id, name, role)
SELECT 444, x.name, x.role FROM (
  SELECT 'Grant Chaney' AS name, 'Financial Advisor, The McCarthy Wealth Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 444) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 444 AND name = x.name);

-- ===== GROUP 289: UBS Wealth Management, Hartford, CT =====
-- 445 Chad Czerwinski (ARCH Group), 827 Andrew Worthington (Long River Wealth Management)
-- — two separate teams co-located at the same UBS branch.
UPDATE contacts SET
  address = 'One State Street, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, co-founder of ARCH Group (founded 2013 with Sam Acquaviva), UBS Hartford CT. Barron''s Top 1,200 2019-2025, Top 1,500 2026; Forbes Best-in-State 2019-2026.')), 512)
WHERE id = 445;
UPDATE contacts SET
  address = 'One State Street, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President-Wealth Management, CPWA/CFP, part of Long River Wealth Management (nine-person team), UBS Hartford CT (separate team from id 445 Chad Czerwinski, co-located at the same branch). #18 CT High Net Worth Forbes Apr 2025.')), 512)
WHERE id = 827;
INSERT INTO contact_people (contact_id, name, role)
SELECT 445, x.name, x.role FROM (
  SELECT 'Sam Acquaviva' AS name, 'Advisor/co-founder, ARCH Group' AS role
  UNION ALL SELECT 'Thomas Humphreys', 'Team member, ARCH Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 445) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 445 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 827, x.name, x.role FROM (
  SELECT 'Ashley Martella' AS name, 'Team member, Long River Wealth Management' AS role
  UNION ALL SELECT 'Paula Rose', 'Team member, Long River Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 827) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 827 AND name = x.name);

-- ===== GROUP 290: LVW Advisors, Pittsford, NY =====
-- 447 Lori Van Dusen (Founder and CEO)
UPDATE contacts SET
  address = '67 Monroe Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and CEO, LVW Advisors, Pittsford NY. #1 New York, Forbes 2026; Barron''s Top 1,500 2026.')), 512)
WHERE id = 447;
INSERT INTO contact_people (contact_id, name, role)
SELECT 447, x.name, x.role FROM (
  SELECT 'Joseph P. Zappia, CIMA' AS name, 'Principal, Co-Chief Investment Officer, LVW Advisors' AS role
  UNION ALL SELECT 'Jonathan Thomas, CFP', 'Private Wealth Advisor, LVW Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 447) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 447 AND name = x.name);

-- ===== GROUP 291: Morgan Stanley Wealth Management, Columbus, OH =====
-- 448 Brian Edwards (The Edwards Group), 474 Michael Beers (The Fortis Wealth Management
-- Group) — two separate teams sharing the same building.
UPDATE contacts SET
  address = '4449 Easton Way, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, leads The Edwards Group, Morgan Stanley Columbus OH (with firm/predecessors since 1989). Barron''s Top 1,200 through 2023.')), 512)
WHERE id = 448;
UPDATE contacts SET
  address = '4449 Easton Way, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Managing Director, Financial Advisor, founder of The Fortis Wealth Management Group, Morgan Stanley Columbus OH (also serves Cincinnati OH; joined 1999; separate team from id 448 Brian Edwards, sharing the same building). Barron''s Top 1,200 2023.')), 512)
WHERE id = 474;
INSERT INTO contact_people (contact_id, name, role)
SELECT 448, x.name, x.role FROM (
  SELECT 'Nicole Edwards' AS name, 'Senior VP, Financial Advisor (Brian''s sister), The Edwards Group' AS role
  UNION ALL SELECT 'Heather Powell', 'Financial Advisor, The Edwards Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 448) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 448 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 474, x.name, x.role FROM (
  SELECT 'Lewis Assaley' AS name, 'Team member, The Fortis Wealth Management Group' AS role
  UNION ALL SELECT 'Howard Burnett', 'Team member, The Fortis Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 474) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 474 AND name = x.name);

-- ===== GROUP 292: Morgan Stanley Private Wealth Management, Provo, UT =====
-- 452 Dane Runia (The Runia Group, moved from Merrill in 2021)
UPDATE contacts SET
  address = '5255 North Edgewood Drive, Suite 275',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/Private Wealth Advisor, leads The Runia Group, Morgan Stanley Provo UT (team moved from Merrill Lynch in 2021, ~$10.7M revenue team). Forbes Best-in-State Wealth Advisors 2025-2026; Barron''s Top 1500 2023-2026.')), 512)
WHERE id = 452;
INSERT INTO contact_people (contact_id, name, role)
SELECT 452, x.name, x.role FROM (
  SELECT 'Scott Runia' AS name, 'Founder/Advisor (~37 yrs experience), The Runia Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 452) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 452 AND name = x.name);

-- ===== GROUP 293: Neuberger Berman, San Francisco, CA =====
-- 453 Tripp Taylor
UPDATE contacts SET
  address = '655 Montgomery Street, 17th Floor, Suite 1710',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Likely current — Managing Director/Senior Wealth Advisor, CFA, Neuberger Berman San Francisco (with firm since 2003). Barron''s Top 1,200 (California) recognition. Note: a BrokerCheck search snippet showed an ambiguous registration end-date that could not be independently confirmed (direct fetch blocked) — flag for manual verification. No named colleagues found.')), 512)
WHERE id = 453;

-- ===== GROUP 294: UBS Private Wealth Management, Clayton, MO =====
-- 455 Mark Wilkins (Impact Wealth Consultants / The Wilkins Group)
UPDATE contacts SET
  address = '8027 Forsyth Blvd, 10th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, heads Impact Wealth Consultants (aka The Wilkins Group), UBS Clayton MO (joined UBS 2015 after 21 years at Merrill Lynch; former U.S. Army officer). #2 Missouri-St. Louis Forbes Best-in-State Apr 2025. Team member full surnames not confirmed (7-person team, ~$730M AUM).')), 512)
WHERE id = 455;

-- ===== GROUP 295: UBS Private Wealth Management, Birmingham, MI =====
-- 457 Jon Vigi (Vigi Private Wealth Management)
UPDATE contacts SET
  address = '325 N. Old Woodward Ave, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, leads Vigi Private Wealth Management, UBS Birmingham MI. Barron''s Top 1,200 2015-2025, Top 1,500 2026; Forbes Best-in-State through 2026. Team member full surnames not confirmed.')), 512)
WHERE id = 457;

-- ===== GROUP 296: Ameriprise Financial, Roseville, CA =====
-- 459 Bret Glover, 688 Colin Grahl — DEPARTED Ameriprise/WGG Wealth Partners for NorthRock
-- Partners (independent RIA) July 10, 2025.
UPDATE contacts SET
  firm = 'NorthRock Partners',
  title = 'Personal Office Advisor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: left Ameriprise/WGG Wealth Partners on July 10, 2025 when the team (~$2.7B AUM, 15 advisors) transitioned to NorthRock Partners, an independent RIA. Now a Personal Office Advisor at NorthRock Partners, Roseville CA. Exact current street address not independently confirmed beyond the legacy Ameriprise/WGG address (3741 Douglas Blvd, Suite 290, Roseville CA 95661).')), 512)
WHERE id = 459;
UPDATE contacts SET
  firm = 'NorthRock Partners',
  title = 'Personal Office Advisor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: left Ameriprise/WGG Wealth Partners on July 10, 2025 alongside id 459 Bret Glover, when the team (~$2.7B AUM, 15 advisors) transitioned to NorthRock Partners, an independent RIA. Now a Personal Office Advisor/Private Wealth Advisor at NorthRock Partners, Roseville CA.')), 512)
WHERE id = 688;
INSERT INTO contact_people (contact_id, name, role)
SELECT 459, x.name, x.role FROM (
  SELECT 'Stephen Westlake' AS name, 'Personal Office Advisor (WGG Wealth Partners co-founder, transitioned with team), NorthRock Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 459) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 459 AND name = x.name);

-- ===== GROUP 297: Morgan Stanley Wealth Management, Oak Brook, IL =====
-- 460 Scott Magnesen (The MPW Group, founder)
UPDATE contacts SET
  address = '2211 York Rd, Suite 100 (The Drake Oak Brook Plaza)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, founded The MPW Group in 1982, Morgan Stanley Oak Brook IL (43+ years with firm). #1 Forbes Best-In-State IL 2025; Barron''s Top 1,200 2013-2025.')), 512)
WHERE id = 460;
INSERT INTO contact_people (contact_id, name, role)
SELECT 460, x.name, x.role FROM (
  SELECT 'Malcolm W. Proudfoot, CFP' AS name, 'Managing Director-Wealth Management, Senior Portfolio Management Director (Scott''s brother-in-law), The MPW Group' AS role
  UNION ALL SELECT 'Jennifer R. Magnesen, CFP', 'Financial Advisor / Portfolio Management Director, First VP, The MPW Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 460) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 460 AND name = x.name);

-- ===== GROUP 298: Merrill Wealth Management, Washington, DC — 202-778-8000 =====
-- 461 John McKnight (Evolve Wealth Management Group), 583 Justin Gaither (The Group AG),
-- 852 Ronya Corey (The Corey Group) — confirmed a DIFFERENT building (1800 K St NW) from
-- id 345's Rietano Group (1152 15th St NW, batch 13), despite sharing this CRM phone number.
UPDATE contacts SET
  address = '1800 K St NW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "J.C." McKnight, Managing Director, Wealth Advisor, Merrill Washington DC (28+ yrs with firm), leads Evolve Wealth Management Group. Confirmed at 1800 K St NW — a different building from id 345 Tom Rietano''s Rietano Group (1152 15th St NW, batch 13) despite sharing the CRM''s (202) 778-8000 number.')), 512)
WHERE id = 461;
UPDATE contacts SET
  address = '1800 K St NW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Managing Director, Wealth Management Advisor, CFP/CRPC, Senior Partner of The Group AG (Gaither, Arrison, Knotts, Benton, Rice & Montgomery), Merrill Washington DC (with firm since 2005; same 1800 K St NW building as id 461 McKnight and id 852 Corey, but a separate team).')), 512)
WHERE id = 583;
UPDATE contacts SET
  address = '1800 K St NW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP/CRPC/ChFC/CPFA, founding partner of The Corey Group, Merrill Washington DC (with firm since 1993; same 1800 K St NW building as id 461 McKnight and id 583 Gaither, but a separate team).')), 512)
WHERE id = 852;
INSERT INTO contact_people (contact_id, name, role)
SELECT 461, x.name, x.role FROM (
  SELECT 'Peter Kenny' AS name, 'Wealth Advisor, Evolve Wealth Management Group' AS role
  UNION ALL SELECT 'George Bassett', 'Team member, Evolve Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 461) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 461 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 583, x.name, x.role FROM (
  SELECT 'James Arrison, CFP, CPWA, CRPC' AS name, 'Managing Director, Wealth Management Advisor, The Group AG' AS role
  UNION ALL SELECT 'Jeffrey Knotts, CFP, CRPC', 'Senior Vice President, Wealth Management Advisor, The Group AG'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 583) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 583 AND name = x.name);

-- ===== GROUP 299: Mariner, Overland Park, KS =====
-- 462 Trey Barnes, 603 Jake Kern
UPDATE contacts SET
  address = '5700 W. 112th St., Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Wealth Advisor, CFP, Mariner Overland Park KS (33 years'' experience). Barron''s Top 1,500 #3 Kansas 2025-2026; Forbes Best-In-State #8 KS 2024.')), 512)
WHERE id = 462;
UPDATE contacts SET
  address = '5700 W. 112th St., Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Market Managing Director / Managing Partner, Mariner Overland Park KS. Barron''s Top 1,200 #6 Kansas 2025; Forbes Best-In-State #7 KS 2024.')), 512)
WHERE id = 603;

-- ===== GROUP 300: Chicago Capital, Chicago, IL =====
-- 463 David Mabie (co-founder/Partner)
UPDATE contacts SET
  address = '135 S. LaSalle Street, Suite 4200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Co-Founder and Partner, Chicago Capital LLC (founded 2018; prior roles at William Blair, Stein Roe & Farnham), CFA. Barron''s Top Financial Advisor; Forbes Best-In-State Wealth Advisor.')), 512)
WHERE id = 463;
INSERT INTO contact_people (contact_id, name, role)
SELECT 463, x.name, x.role FROM (
  SELECT 'Eric Maddix' AS name, 'Co-Founder/Partner (in industry since 1987), Chicago Capital' AS role
  UNION ALL SELECT 'Whitney Nessner', 'Co-Founder (in industry since 2006), Chicago Capital'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 463) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 463 AND name = x.name);
