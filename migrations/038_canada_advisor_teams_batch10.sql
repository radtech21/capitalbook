-- Rest-of-Canada Financial Advisor enrichment, batch 10 of ~24 (18 contacts).
-- Address + team-roster research, same methodology as prior batches. All
-- web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- TWO CONFIRMED DEATHS this batch, both handled per the established
-- precedent (reachable=0 + data_flags note, deliberately NO address/team
-- applied, never silently reassigned — successor disposition is a human
-- decision):
--   1362 René Gagnon (Desjardins Securities, Rimouski) — died Feb 20,
--     2026, age 58. His practice had been renamed "Groupe Gagnon
--     Arsenault" in Feb 2025 when longtime colleague Benoît Arsenault was
--     made partner; Arsenault appears positioned to lead the surviving
--     team at 100 rue Julien-Réhel, Bureau 301, Rimouski.
--   1480 Steve Barban (Manulife Securities / Gentry Capital, Ottawa) —
--     died Oct 30, 2024, age 59. Surviving colleague Russell Hope
--     (Financial Advisor) continues at Gentry Capital, 1900 City Park
--     Drive, Suite 508, Ottawa.
--
-- Shared-building notes (independent teams, recurring pattern):
--   1461 Neil McIver is the 5th independent Canaccord Genuity team at
--     1133 Melville St, Suite 1200, Vancouver (with Stanley, Switzer,
--     Currie, Crowe).
--   1808 Kim Dewar, 1814 Bill Weaver, and 1806 Ian Robertson are three
--     independent Odlum Brown teams at the firm's shared Vancouver HQ
--     (250 Howe St, Suite 1100).
--   1726 Tyler Taylor and 1725 Terry Heavisides are separate ScotiaMcLeod
--     teams sharing 3303 Hillsdale St, Regina.
--   1436 Kathy McMillan shares the Richardson Wealth Calgary office
--     (525 8th Ave SW, Suite 4700) with 1358 Tim Conlin (batch 7).
--   1794 Chris Carter shares the Vancouver Centre building (650 West
--     Georgia St, Suite 1100) with 1787 Shay Keil (batch 8).
--
-- D-Nay Stockbrugger (Director, Scotia Wealth Insurance Services) appears
-- on multiple Scotia teams and is treated as a shared specialist, not an
-- exclusive team member (same as Stephanie Tsui and Cindy David earlier).

-- 1362 René Gagnon — DECEASED. Deliberately no address/team applied.
UPDATE contacts SET
  reachable = 0,
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'DECEASED (Feb 20, 2026, age 58). Practice had been renamed "Groupe Gagnon Arsenault" (Feb 2025) when Benoît Arsenault was made partner; surviving team continues at Desjardins Securities, 100 rue Julien-Réhel, Bureau 301, Rimouski (Arsenault, Mélanie Tapp, Pier-Luc Perreault) — needs human decision on whether/how to add a successor contact.'))
WHERE id = 1362;

-- 1480 Steve Barban — DECEASED. Deliberately no address/team applied.
UPDATE contacts SET
  reachable = 0,
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'DECEASED (Oct 30, 2024, age 59). Surviving colleague Russell Hope (Financial Advisor) continues the Gentry Capital practice under Manulife Securities at 1900 City Park Drive, Suite 508, Ottawa — needs human decision on whether/how to add a successor contact.'))
WHERE id = 1480;

-- 1794 Chris Carter, ScotiaMcLeod (The Cook Team), Vancouver, BC
UPDATE contacts SET address = '650 West Georgia Street, Suite 1100' WHERE id = 1794;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1794, x.name, x.role FROM (
  SELECT 'Andrew Cook' AS name, 'Portfolio Manager (Team Lead)' AS role
  UNION ALL SELECT 'David Matousek', 'Investment Associate'
  UNION ALL SELECT 'Jacqueline Knowles', 'CFP / Senior Total Wealth Planner'
  UNION ALL SELECT 'Martha Angulo', 'Senior Associate'
  UNION ALL SELECT 'Darren Wallace', 'Senior Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1794)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1794 AND name = x.name);

-- 1432 Jeremy Dahms, NBF Wealth Management (Dahms & Leaver Wealth Management), Calgary, AB
UPDATE contacts SET address = '10655 Southport Road SW, Southland Tower, Suite 1100' WHERE id = 1432;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1432, x.name, x.role FROM (
  SELECT 'Daniel Garrett Russell' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Ariel Leaver', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1432)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1432 AND name = x.name);

-- 1372 Jean-Francois Boivin, NBF Wealth Management, Chicoutimi, QC
UPDATE contacts SET address = '1180 boulevard Talbot, Bureau 201' WHERE id = 1372;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1372, x.name, x.role FROM (
  SELECT 'Marc-Antoine Ouellet' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Florence Masse', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Daniel Gilbert, CPA, CA', 'Associate Investment Advisor'
  UNION ALL SELECT 'Nathalie Hamel', 'Leader of Assistants / Client Service & Portfolio Operations'
  UNION ALL SELECT 'Guylaine Camiot', 'Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1372)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1372 AND name = x.name);

-- 1726 Tyler Taylor, ScotiaMcLeod (Taylor Portfolio Management), Regina, SK
UPDATE contacts SET address = '3303 Hillsdale Street, Suite 100' WHERE id = 1726;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1726, x.name, x.role FROM (
  SELECT 'Joël Beaudin-Dobson' AS name, 'Senior Associate' AS role
  UNION ALL SELECT 'Mark Hoshowsky', 'Investment Associate and Associate Portfolio Manager'
  UNION ALL SELECT 'Kammie Moggey', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1726)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1726 AND name = x.name);

-- 1436 Kathy McMillan, Richardson Wealth Ltd, Calgary, AB
UPDATE contacts SET address = 'Suite 4700, 525 8th Avenue SW' WHERE id = 1436;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1436, 'Dasha Atkins', 'Wealth Advisor, Associate Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1436)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1436 AND name = 'Dasha Atkins');

-- 1816 Paul Donaldson, Odlum Brown, Chilliwack, BC
UPDATE contacts SET address = 'Suite 400 – 45890 Hocking Avenue' WHERE id = 1816;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1816, x.name, x.role FROM (
  SELECT 'David Lanphear' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Sarah Mouritzen', 'Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1816)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1816 AND name = x.name);

-- 1461 Neil McIver, CG Wealth Management (McIver Capital Management), Vancouver, BC
UPDATE contacts SET address = 'Suite 1200, 1133 Melville Street' WHERE id = 1461;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1461, x.name, x.role FROM (
  SELECT 'Warren Goldblum' AS name, 'Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Devina Sinh', 'Marketing Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1461)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1461 AND name = x.name);

-- 1808 Kim Dewar, Odlum Brown (Dewar Wealth Management Group), Vancouver, BC
UPDATE contacts SET address = '250 Howe St., Suite 1100' WHERE id = 1808;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1808, x.name, x.role FROM (
  SELECT 'Michelle Sullivan' AS name, 'Financial Planning (CFP®, CIM®), Dewar Wealth Management Group' AS role
  UNION ALL SELECT 'Dylan Ross', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1808)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1808 AND name = x.name);

-- 1725 Terry Heavisides, ScotiaMcLeod (Prairieview Group), Regina, SK
UPDATE contacts SET address = '3303 Hillsdale Street, Suite 100' WHERE id = 1725;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1725, x.name, x.role FROM (
  SELECT 'Cameron Gilbey' AS name, 'Wealth Advisor and Portfolio Manager' AS role
  UNION ALL SELECT 'Mitch Amies', 'Wealth Advisor'
  UNION ALL SELECT 'Matt Ullenboom', 'Senior Total Wealth Planner'
  UNION ALL SELECT 'Wanda Matravolgyi', 'Investment Associate'
  UNION ALL SELECT 'Wenta Ghebrezgiabiher', 'Administrative Associate'
  UNION ALL SELECT 'Ryan Wiebe', 'Business and Wealth Transition Specialist'
  UNION ALL SELECT 'Megan Kintzle', 'Private Banker and Mutual Funds Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1725)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1725 AND name = x.name);

-- 1814 Bill Weaver, Odlum Brown, Vancouver, BC
UPDATE contacts SET address = 'Suite 1100 - 250 Howe Street' WHERE id = 1814;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1814, x.name, x.role FROM (
  SELECT 'Max Hager' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Jared Fedosoff', 'Associate Portfolio Manager / Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1814)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1814 AND name = x.name);

-- 1387 Iain MacDougall, NBF Wealth Management (MacDougall Wealth Management Group), Red Deer, AB
UPDATE contacts SET address = '4719 48th Avenue, Suite 200' WHERE id = 1387;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1387, x.name, x.role FROM (
  SELECT 'Samantha Jones' AS name, 'Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Christopher "Kit" Richmond', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Kellsey Leckie', 'Wealth Associate'
  UNION ALL SELECT 'Deanna Eng', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1387)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1387 AND name = x.name);

-- 1425 David Bluteau, NBF Wealth Management (Bluteau Caseley Wealth Management Group), Halifax, NS
UPDATE contacts SET address = '5657 Spring Garden Road, Parklane Terraces, Suite 400' WHERE id = 1425;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1425, 'Darren Caseley, CIM', 'Wealth Advisor and Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1425)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1425 AND name = 'Darren Caseley, CIM');

-- 1232 Michael Leach, TD Wealth Private Investment Advice, Waterloo, ON
UPDATE contacts SET address = '412 Albert Street' WHERE id = 1232;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1232, 'Niko (Nikola) McKinnon, CIM', 'Associate Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1232)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1232 AND name = 'Niko (Nikola) McKinnon, CIM');

-- 1392 Todd MacKenzie, NBF Wealth Management (Legacy Tree Wealth), Waterloo, ON
UPDATE contacts SET address = '85 Willis Way, Suite 116' WHERE id = 1392;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1392, x.name, x.role FROM (
  SELECT 'Steve Tarasko' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Mark MacKenzie', 'Wealth Advisor'
  UNION ALL SELECT 'Simon Binder', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1392)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1392 AND name = x.name);

-- 1429 Andrew Lorriman, NBF Wealth Management (Lorriman Sturgeon Wealth Management Group), Barrie, ON
UPDATE contacts SET address = '126 Collier Street' WHERE id = 1429;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1429, 'Timothy Sturgeon', 'Wealth Advisor & Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1429)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1429 AND name = 'Timothy Sturgeon');

-- 1806 Ian Robertson, Odlum Brown (Robertson Investment Group), Vancouver, BC
UPDATE contacts SET address = 'Suite 1100 – 250 Howe Street' WHERE id = 1806;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1806, x.name, x.role FROM (
  SELECT 'Karim Allibhai' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Paul Sahota', 'Associate Portfolio Manager & Financial Planner'
  UNION ALL SELECT 'Chris Ballance', 'Investment Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1806)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1806 AND name = x.name);
