-- Rest-of-Canada Financial Advisor enrichment, batch 19 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected. Several agents this batch hit the session's
-- web-search budget mid-research (1672, 1667, 1320) — those three
-- entries carry an explicit lower-confidence note; findings are still
-- applied but should be treated as less reliable than the rest.
--
-- One confirmed firm departure applied:
--   1294 Amrit Lalli (Victoria): merged practice with Dan Greco ~2023
--     and moved from IG Private Wealth to Richardson Wealth, forming
--     "Lalli Greco Wealth Management" — old IG-branded site is stale.
--
-- One likely dealer switch flagged (moderate confidence, circumstantial
-- — inferred from an @ipcc.org email domain on a related team member's
-- listing rather than a direct announcement):
--   1672 Ross Campbell (Calgary): family firm Camaco Financial Group,
--     now branded "Camaco Capital Management," appears to have moved
--     from IPC Securities to a Q Wealth/Quintessence Wealth partnership.
--
-- Manulife Securities -> Manulife Wealth rebrand only (not a departure)
-- applies to 1487 Robert Hyde and 1490 Nathan Leibowitz, consistent with
-- prior batches. Note: 1490's address (200-9800 Boul Cavendish,
-- St-Laurent) is the same shared Manulife branch building as batch 18's
-- 1492 Jonathan Rosenberg — independent teams, same office. A same-named
-- "iA Private Wealth" LinkedIn listing surfaced for 1490 but could not be
-- verified as the same person, so it was NOT applied as a firm change.
--
-- Practice rebrand notes (not departures): 1708 Pedro Ribeiro's team
-- renamed "The Fountain Group" to "Marnoa Private Wealth Counsel,"
-- still Raymond James.
--
-- Shared-specialist exclusion (per established precedent): 1468 Penni
-- Johnston-Gill's team page lists Jeffrey Haggerty, who this batch is
-- confirmed to appear on numerous CG Wealth Management team sites
-- firm-wide (not just the two CG Edmonton teams flagged in batch 17) —
-- excluded here as a genuinely firm-wide shared specialist.
--
-- No address found (left unset): 1320 Jeanette Boleantu — a possible
-- link to a different Assante-affiliated address ("Alexandria Wealth
-- Management Group") could not be confirmed as hers.

-- 1248 Rob Hunter, NBF Wealth Management (R Hunter Wealth Management Group), Victoria, BC
UPDATE contacts SET address = '737 Yates Street, Suite/Office 700' WHERE id = 1248;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1248, x.name, x.role FROM (
  SELECT 'Campbell Hunter' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Khanh Vu', 'Wealth Associate'
  UNION ALL SELECT 'Comet Tang', 'Wealth Associate'
  UNION ALL SELECT 'Stephanie Hunter', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1248)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1248 AND name = x.name);

-- 1293 Lindsey Kilgour, IG Private Wealth Management (Kilgour Group), Sudbury, ON
UPDATE contacts SET address = '144 Pine St, Suite 101' WHERE id = 1293;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1293, x.name, x.role FROM (
  SELECT 'Jacob Johnston' AS name, 'Consultant' AS role
  UNION ALL SELECT 'Erin Kitchen', 'Executive Assistant'
  UNION ALL SELECT 'Chandra Paquette', 'Associate Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1293)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1293 AND name = x.name);

-- 1468 Penni Johnston-Gill, CG Wealth Management, Calgary, AB (address only)
UPDATE contacts SET address = '2400 - 520 3rd Ave SW' WHERE id = 1468;

-- 1255 Darren Pastro, Wellington-Altus Private Wealth (MP Wealth Advisory), Trail, BC
UPDATE contacts SET address = '1277 Cedar Ave.' WHERE id = 1255;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1255, x.name, x.role FROM (
  SELECT 'Scott Marshall' AS name, 'Portfolio Manager (co-founding principal)' AS role
  UNION ALL SELECT 'Craig Adams', 'Portfolio Manager (CIM)'
  UNION ALL SELECT 'Debbie Baines', 'Branch Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1255)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1255 AND name = x.name);

-- 1708 Pedro Ribeiro, Raymond James (Marnoa Private Wealth Counsel), Waterloo, ON
UPDATE contacts SET
  address = '20 Erb Street West, Suite 1001',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team rebranded from "The Fountain Group" to "Marnoa Private Wealth Counsel" — still Raymond James, not a departure.')), 512)
WHERE id = 1708;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1708, x.name, x.role FROM (
  SELECT 'Christopher De Sousa' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Tracy Andrade', 'Associate Wealth Advisor / CFP, CIM'
  UNION ALL SELECT 'Suzanne Ribeiro', 'Client Service Coordinator'
  UNION ALL SELECT 'Marci Paquete', 'Client Service Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1708)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1708 AND name = x.name);

-- 1281 Vicki Chatterley, Raymond James (Inspire Wealth Management), Delta, BC
UPDATE contacts SET address = '103A - 5405 Ladner Trunk Road' WHERE id = 1281;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1281, x.name, x.role FROM (
  SELECT 'Deanna Carette' AS name, 'Senior Wealth Associate' AS role
  UNION ALL SELECT 'Brock Chatterley, CFP', 'Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1281)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1281 AND name = x.name);

-- 1272 Kevin Hannay, Wellington-Altus Private Wealth (Hannay Group), Moncton, NB
UPDATE contacts SET address = '77 Vaughan Harvey Blvd., Suite 301' WHERE id = 1272;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1272, x.name, x.role FROM (
  SELECT 'Emilie Hebert' AS name, 'Investment Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1272)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1272 AND name = x.name);

-- 1532 Megan Sutherland, BMO Nesbitt Burns, Calgary, AB (address only)
UPDATE contacts SET address = 'Eighth Avenue Place (East Tower), 525 8th Avenue SW, Suite 1100' WHERE id = 1532;

-- 1487 Robert Hyde, Manulife Securities (Hyde Wealth Management), Winnipeg, MB
UPDATE contacts SET address = '#200-584 Pembina Hwy' WHERE id = 1487;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1487, x.name, x.role FROM (
  SELECT 'Alison Miller' AS name, 'Administrative and Sales Support' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1487)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1487 AND name = x.name);

-- 1672 Ross Campbell — LIKELY DEALER SWITCH to Q Wealth partnership (firm/address updated, flagged).
UPDATE contacts SET
  firm = 'Q Wealth (Quintessence Wealth) — Camaco Capital Management',
  address = '4105 - 230 Eversyde Blvd SW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LIKELY MOVED from IPC Securities Corporation to a Q Wealth/Quintessence Wealth partnership, now operating as Camaco Capital Management — inferred circumstantially from a related team member''s @ipcc.org email domain rather than a direct announcement; web search budget was exhausted mid-research, verify before outreach.')), 512)
WHERE id = 1672;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1672, x.name, x.role FROM (
  SELECT 'Ben Campbell' AS name, 'Wealth Advisor and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1672)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1672 AND name = x.name);

-- 1688 Brett Graham, Raymond James (Graham Wealth Advisory), Saskatoon, SK (address only)
UPDATE contacts SET address = '122 - 1st Avenue South, Suite 600' WHERE id = 1688;

-- 1669 Mike Waller, IPC Securities (Lakeside Financial Planning), Kelowna, BC (address only)
UPDATE contacts SET address = '540 Cawston Ave, 1st Floor' WHERE id = 1669;

-- 1294 Amrit Lalli — CONFIRMED DEPARTURE from IG to Richardson Wealth (firm/address updated).
UPDATE contacts SET
  firm = 'Richardson Wealth',
  address = '2950 Jutland Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Merged practice with Dan Greco (~2023) and moved from IG Private Wealth Management to Richardson Wealth, forming "Lalli Greco Wealth Management" — old IG-branded site is stale.')), 512)
WHERE id = 1294;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1294, x.name, x.role FROM (
  SELECT 'Dan Greco' AS name, 'Co-Lead / Investment Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1294)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1294 AND name = x.name);

-- 1314 Scott Masters, Assante Wealth Management (Hein Financial Group), Calgary, AB
UPDATE contacts SET address = 'Suite 204, 221 10 Avenue SE' WHERE id = 1314;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1314, x.name, x.role FROM (
  SELECT 'Allan Chapman' AS name, 'Financial Advisor' AS role
  UNION ALL SELECT 'Clinton Graham', 'Wealth Management Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1314)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1314 AND name = x.name);

-- 1667 Midori Hillis, IPC Securities, Victoria/View Royal, BC
UPDATE contacts SET
  address = '#108 - 284 Helmcken Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Office relocated Jan 2023 from Royal Oak Shopping Centre to View Royal; web search budget was exhausted mid-research, team roster is lower confidence.')), 512)
WHERE id = 1667;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1667, x.name, x.role FROM (
  SELECT 'Tracey Rompain' AS name, 'Certified Financial Planner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1667)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1667 AND name = x.name);

-- 1668 Marie Phillips, IPC Securities (Next Steps Planning / Bick Advisors), Ancaster, ON
UPDATE contacts SET address = '128 Wilson St. West' WHERE id = 1668;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1668, x.name, x.role FROM (
  SELECT 'Warren Faloney' AS name, 'Associate Portfolio Manager and Senior Investment Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1668)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1668 AND name = x.name);

-- 1320 Jeanette Boleantu, Assante Wealth Management (Marda Loop Financial Group), Calgary, AB (no address found; team only)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | No confirmed street address found; web search budget was exhausted mid-research.')), 512)
WHERE id = 1320;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1320, x.name, x.role FROM (
  SELECT 'John Shypitka' AS name, 'Investment Counsellor' AS role
  UNION ALL SELECT 'Pippa Fry', 'Investment Counsellor'
  UNION ALL SELECT 'Ian McNeill', 'Investment Counsellor'
  UNION ALL SELECT 'Lisa Friesen', 'Regional Wealth Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1320)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1320 AND name = x.name);

-- 1490 Nathan Leibowitz, Manulife Securities, St-Laurent, QC (address only)
UPDATE contacts SET address = '200-9800 Boul Cavendish' WHERE id = 1490;
