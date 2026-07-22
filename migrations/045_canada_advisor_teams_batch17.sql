-- Rest-of-Canada Financial Advisor enrichment, batch 17 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Two likely firm departures flagged and applied (moderate-high
-- confidence, not corroborated by a dated press announcement):
--   1404 James Van Vliet (Vancouver): NBF pages are stale; multiple
--     RBC-branded sources now show him as Portfolio Manager at RBC
--     Dominion Securities leading "Van Vliet Wealth Management Group."
--   1500 Drew Henderson (Saanich/Victoria): CONFIRMED (firm's own site)
--     departure from Manulife to Wellington-Altus — now practices as
--     "Henderson & Williams Wealth Management" with Richard Williams.
--
-- One likely dealer switch flagged (moderate confidence, single-year
-- sourcing, not verified against CIRO's official Advisor Report):
--   1489 Carla DosSantos (London): recent (2025-2026) sources describe
--     her as Worldsource Wealth Management, not Manulife — same office,
--     still President of her own practice, Point B Financial Inc.
--
-- Shared-specialist notes: 1735 Keith Angus McDonald and 1737 Stephen
-- Bennett (both Scotia London, same 255 Queens Ave tower) share
-- associate Brent Carrothers on both rosters — flagged rather than
-- treated as an error. 1439 Geoff Badger and 1469 Maglan Naidoo (CG
-- Edmonton, confirmed separate practices at the same office) both list
-- a Jeffrey Haggerty as Wealth & Estate Planning Specialist — likely one
-- shared specialist, flagged on both records.
--
-- Shared-building notes (independent teams): 1687 Jim Struthers and
-- 1707 Trixie Rowein share the Edmonton tower at 10060 Jasper Avenue
-- (Struthers with the Novus Pro team, Rowein's own PAX Portfolio
-- Advisory); 1582 Andrea Stack shares the CIBC St. John's branch (215
-- Water St) with Keith Butler; 1731 Teresa Pedersen shares the Scotia
-- West Vancouver branch (1555 Marine Drive) with the Mailey Rogers
-- Group — her practice is now co-branded "Pedersen Bloomfield."
--
-- Address-only entries (no team member met the strict full-name+title
-- bar): 1805 Drew Ferrie, 1602 Rochelle Wilson (confirmed solo
-- practitioner).

-- 1460 Martin Karcz, CG Wealth Management, Vancouver, BC
UPDATE contacts SET address = '1133 Melville St., Suite 1200' WHERE id = 1460;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1460, x.name, x.role FROM (
  SELECT 'Oleksandr Izmailov' AS name, 'Financial Planning Associate' AS role
  UNION ALL SELECT 'Sabrina Kolodziej', 'Business Development Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1460)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1460 AND name = x.name);

-- 1735 Keith Angus McDonald, ScotiaMcLeod (The McDonald Group), London, ON
UPDATE contacts SET
  address = '255 Queens Avenue, Suite 1700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Brent Carrothers appears on both this team and Stephen Bennett''s (1737) — likely one shared associate serving both London Scotia teams.')), 512)
WHERE id = 1735;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1735, x.name, x.role FROM (
  SELECT 'Brent Carrothers' AS name, 'Investment Associate' AS role
  UNION ALL SELECT 'Mitchell McGrath', 'Senior Total Wealth Planner'
  UNION ALL SELECT 'Colin McDonald', 'Intern'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1735)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1735 AND name = x.name);

-- 1404 James Van Vliet — LIKELY DEPARTURE to RBC Dominion Securities (firm/address updated, flagged).
UPDATE contacts SET
  firm = 'RBC Dominion Securities',
  title = 'Portfolio Manager',
  address = '1055 West Georgia Street, 32nd/33rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LIKELY MOVED from NBF Wealth Management to RBC Dominion Securities — multiple RBC-branded sources ("Van Vliet Wealth Management Group," @rbc.com email) show this, but no dated press announcement found and no team roster could be confirmed at either firm; verify before outreach.')), 512)
WHERE id = 1404;

-- 1805 Drew Ferrie, Odlum Brown, Vancouver, BC (address only)
UPDATE contacts SET address = 'Suite 1100 - 250 Howe Street' WHERE id = 1805;

-- 1737 Stephen Bennett, ScotiaMcLeod (Bennett Investment Management), London, ON
UPDATE contacts SET
  address = '255 Queens Avenue, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Brent Carrothers appears on both this team and Keith Angus McDonald''s (1735) — likely one shared associate serving both London Scotia teams. Suite number moderately confident (some snippets suggested 1700, likely cross-contaminated from the unrelated Pillar Advisory Group in the same building).')), 512)
WHERE id = 1737;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1737, x.name, x.role FROM (
  SELECT 'Brent Carrothers' AS name, 'Investment Associate, Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Matt Kueneman', 'Senior Total Wealth Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1737)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1737 AND name = x.name);

-- 1439 Geoff Badger, CG Wealth Management (Badger Investment Group), Edmonton, AB
UPDATE contacts SET
  address = 'Manulife Place, 10180-101 Street NW, Suite 2800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Jeffrey Haggerty appears on both this team and Maglan Naidoo''s (1469) — likely one shared Wealth & Estate Planning Specialist serving both CG Edmonton practices, which are confirmed separate.')), 512)
WHERE id = 1439;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1439, x.name, x.role FROM (
  SELECT 'Jeffrey Haggerty' AS name, 'Wealth & Estate Planning Specialist' AS role
  UNION ALL SELECT 'Jeffrey Mathers', 'Certified Financial Planner'
  UNION ALL SELECT 'Heather Prato', 'Senior Associate, Client Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1439)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1439 AND name = x.name);

-- 1489 Carla DosSantos — LIKELY DEALER SWITCH to Worldsource Wealth Management (firm updated, flagged).
UPDATE contacts SET
  firm = 'Worldsource Wealth Management',
  address = '244 Pall Mall St., Suite 403',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LIKELY MOVED from Manulife Securities/Manulife Wealth to Worldsource Wealth Management Inc. (Worldsource Securities renamed effective July 4, 2025) — a 2025 FP Canada profile and 2026 Worldsource LinkedIn post both associate her with Worldsource; not verified against CIRO''s official Advisor Report. Still President of Point B Financial Inc. at the same office.')), 512)
WHERE id = 1489;

-- 1687 Jim Struthers, Raymond James, Edmonton, AB
UPDATE contacts SET address = 'Suite 2300, Scotia Place Tower 1, 10060 Jasper Avenue' WHERE id = 1687;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1687, x.name, x.role FROM (
  SELECT 'Cindy Rae Tanguay' AS name, 'Associate Wealth Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1687)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1687 AND name = x.name);

-- 1277 David Gilman, Harbourfront Wealth Management (Gilman Deters Private Wealth), West Vancouver, BC
UPDATE contacts SET address = '202-1868 Marine Drive' WHERE id = 1277;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1277, x.name, x.role FROM (
  SELECT 'Tom Gilman' AS name, 'Senior Wealth Advisor & Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Nicole Deters', 'Senior Investment Advisor (MTI)'
  UNION ALL SELECT 'John McCracken', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1277)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1277 AND name = x.name);

-- 1486 Jim Templeton, Manulife Wealth (Simplify Wealth), St. John's, NL
UPDATE contacts SET
  address = '84 Elizabeth Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice rebranded from "JBT Financial Team" to "Simplify Wealth" — still an associate office of Manulife Wealth Inc., not a departure.')), 512)
WHERE id = 1486;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1486, x.name, x.role FROM (
  SELECT 'Bruce Templeton' AS name, 'Investment Advisor, Manulife Securities Inc. (co-founder, father)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1486)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1486 AND name = x.name);

-- 1500 Drew Henderson — CONFIRMED DEPARTURE to Wellington-Altus (firm/address/title updated).
UPDATE contacts SET
  firm = 'Wellington-Altus Private Wealth',
  title = 'Senior Wealth Advisor',
  address = '3550 Saanich Road, Suite 102A, Munro Centre',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Left Manulife Securities/Manulife Wealth for Wellington-Altus, Victoria (Munro Centre) — now "Henderson & Williams Wealth Management" with Richard Williams. Old Manulife profile (financialadvisorsvictoria.com) is stale — verify before outreach.')), 512)
WHERE id = 1500;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1500, x.name, x.role FROM (
  SELECT 'Richard Williams' AS name, 'Senior Investment Advisor, Henderson & Williams Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1500)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1500 AND name = x.name);

-- 1582 Andrea Stack, CIBC Wood Gundy (The Stack Team), St. John's, NL
UPDATE contacts SET address = '215 Water Street, 8th Floor' WHERE id = 1582;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1582, x.name, x.role FROM (
  SELECT 'Emily Bland' AS name, 'Wealth Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1582)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1582 AND name = x.name);

-- 1731 Teresa Pedersen, ScotiaMcLeod (Pedersen Bloomfield Portfolio Management), West Vancouver, BC
UPDATE contacts SET
  address = '1555 Marine Drive, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Practice now co-branded "Pedersen Bloomfield Portfolio Management" alongside Christine Bloomfield — an elevated partnership, not a departure.')), 512)
WHERE id = 1731;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1731, x.name, x.role FROM (
  SELECT 'Christine Bloomfield' AS name, 'Wealth Advisor, Associate Portfolio Manager (CFP, CIM)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1731)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1731 AND name = x.name);

-- 1707 Trixie Rowein, Raymond James (PAX Portfolio Advisory), Edmonton, AB
UPDATE contacts SET address = 'Suite 2300, Scotia Place Tower 1, 10060 Jasper Avenue' WHERE id = 1707;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1707, x.name, x.role FROM (
  SELECT 'Taylor Cooper' AS name, 'Associate Portfolio Manager & Associate Financial Advisor (CIM, TEP)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1707)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1707 AND name = x.name);

-- 1524 Christine Fortin, BMO Nesbitt Burns (Fortin Wealth Advisory Group), White Rock, BC
UPDATE contacts SET address = '1959 152 Street, Suite 270' WHERE id = 1524;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1524, x.name, x.role FROM (
  SELECT 'Kimiko (McCarthy) Comeau' AS name, 'Director, Business Advisory and Succession Planning (BMO extended team — may be shared)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1524)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1524 AND name = x.name);

-- 1602 Rochelle Wilson, CIBC Wood Gundy, Hamilton, ON (address only — solo practitioner)
UPDATE contacts SET address = '21 King Street West, Suite 600' WHERE id = 1602;

-- 1769 David Ritcey, ScotiaMcLeod (The Ritcey Team), Kentville, NS
UPDATE contacts SET address = '1 Webster Street' WHERE id = 1769;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1769, x.name, x.role FROM (
  SELECT 'Stephen Woodworth' AS name, 'Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Kelsey Keddy', 'Administrative Support Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1769)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1769 AND name = x.name);

-- 1469 Maglan Naidoo, CG Wealth Management (Naidoo Private Wealth), Edmonton, AB
UPDATE contacts SET
  address = 'Manulife Place, 10180 101 Street NW, Suite 2800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Jeffrey Haggerty appears on both this team and Geoff Badger''s (1439) — likely one shared Wealth & Estate Planning Specialist serving both CG Edmonton practices, which are confirmed separate.')), 512)
WHERE id = 1469;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1469, x.name, x.role FROM (
  SELECT 'Jeff Haggerty' AS name, 'Strategic Partner, Wealth and Estate Planning Specialist' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1469)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1469 AND name = x.name);
