-- Rest-of-Canada Financial Advisor enrichment, batch 18 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Two confirmed firm departures flagged and applied:
--   1319 Percy MacDonald (Halifax/Bedford): left CI Assante Wealth
--     Management for Saltwinds Financial, an independent boutique, as
--     President/Co-Principal — old Assante team page no longer lists him.
--   1299 Faisal Khorshid (Saskatoon): moved his practice with Paul
--     Bourgeault from IG Private Wealth to Richardson Wealth (~Sept/Oct
--     2025), confirmed via Richardson Wealth's own welcome post and
--     Investment Executive coverage.
--
-- One likely dealer switch flagged (moderate confidence, ambiguous
-- secondary source found — see contact note):
--   1697 Doug Pinder (Calgary): team rebranded "OP Elite Integrated
--     Wealth" (Raymond James) to "OP Elite Wealth," now branded "iA
--     Private Wealth," same office building (Alberta corporate registry
--     confirms). A second, possibly-stale entity ("Pinder Wealth
--     Management" / "Pinder Mastel Wealth Management") still references
--     Raymond James and a Tate Pinder — could not resolve the ambiguity,
--     so Tate Pinder was excluded from the roster.
--
-- Manulife Securities -> Manulife Wealth rebrand only (not a departure)
-- applies to 1484 Scott Coolman, 1501 Tom Kelly, and 1492 Jonathan
-- Rosenberg, consistent with prior batches.
--
-- Practice rebrand notes (not departures): 1608 Chris James's team
-- dropped former partner Tim Hicks from its name ("Hicks James Advisory
-- Group" -> "James Financial Advisory Group"); 1256 Kelly Lindsey's team
-- renamed "Bate Lindsey Rutherford Wealth Management Group" ->
-- "Okanagan Wealth Management Group."
--
-- Shared-specialist exclusions (per established precedent): 1766 Edward
-- Wootten's team includes Fan Wang (known shared Scotia specialist,
-- excluded); 1770 Millicent Hicks's team includes Colin Hicks, Director
-- of Scotia Wealth Insurance Services, who serves multiple Scotia Wealth
-- Management teams (excluded).
--
-- Historical note, no status change: 1268 Darryl Tatomir's original
-- practice co-founder Bradley Bergh died in 2018 — long-settled, does
-- not affect Tatomir's current active status at Wellington-Altus.
--
-- Disambiguation note: 1400 Greg Phillips was confirmed against two
-- unrelated same-named individuals (a GTA Richardson Wealth advisor and
-- a deceased West Vancouver physician) before applying his record.

-- 1766 Edward Wootten, ScotiaMcLeod, West Vancouver, BC
UPDATE contacts SET address = '1555 Marine Drive, 3rd Floor' WHERE id = 1766;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1766, x.name, x.role FROM (
  SELECT 'Nimrat Batra' AS name, 'Administrative Associate' AS role
  UNION ALL SELECT 'Yael Dirnfeld', 'Director & Team Lead, Private Banking'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1766)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1766 AND name = x.name);

-- 1410 Paul Shelestowsky, Meridian Credit Union, Niagara-on-the-Lake, ON (address only)
UPDATE contacts SET address = '1567 Niagara Stone Rd' WHERE id = 1410;

-- 1319 Percy MacDonald — CONFIRMED DEPARTURE from Assante to Saltwinds Financial (firm/address updated).
UPDATE contacts SET
  firm = 'Saltwinds Financial',
  address = '1361 Bedford Hwy',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Left CI Assante Wealth Management for Saltwinds Financial, an independent boutique, as President/Co-Principal — old Assante team page no longer lists him.')), 512)
WHERE id = 1319;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1319, x.name, x.role FROM (
  SELECT 'Cara Boston' AS name, 'Co-Principal, Saltwinds Financial' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1319)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1319 AND name = x.name);

-- 1484 Scott Coolman, Manulife Securities (Coolman Cameron Financial), Kitchener, ON (address only)
UPDATE contacts SET address = '185 Washburn Drive, Unit A' WHERE id = 1484;

-- 1299 Faisal Khorshid — CONFIRMED DEPARTURE from IG to Richardson Wealth (firm/title/address updated).
UPDATE contacts SET
  firm = 'Richardson Wealth',
  title = 'Senior Wealth Advisor',
  address = '606 Spadina Crescent East, Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Moved practice (with Paul Bourgeault, now "Khorshid Bourgeault Wealth Partners") from IG Private Wealth to Richardson Wealth, ~Sept/Oct 2025 — confirmed via Richardson Wealth''s own welcome post and Investment Executive coverage.')), 512)
WHERE id = 1299;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1299, x.name, x.role FROM (
  SELECT 'Paul Bourgeault' AS name, 'Senior Wealth Advisor (co-principal)' AS role
  UNION ALL SELECT 'Clayton Lane', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1299)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1299 AND name = x.name);

-- 1501 Tom Kelly, Manulife Securities (Granville West Group / Dixon Kelly Wealth Advisory), Vancouver, BC
UPDATE contacts SET address = 'Suite 1100, 1075 West Georgia Street' WHERE id = 1501;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1501, x.name, x.role FROM (
  SELECT 'Colin Dixon' AS name, 'Principal & Portfolio Manager' AS role
  UNION ALL SELECT 'Colin McCubbin', 'Financial Advisor'
  UNION ALL SELECT 'Janine Ravell', 'Investment Advisor Assistant'
  UNION ALL SELECT 'Suzanne Martins', 'Client Services Coordinator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1501)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1501 AND name = x.name);

-- 1413 Serge Duhaime, NBF Wealth Management, Ottawa, ON
UPDATE contacts SET address = '50 O''Connor St., Suite 1602' WHERE id = 1413;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1413, x.name, x.role FROM (
  SELECT 'Imane Hamich' AS name, 'Wealth Associate' AS role
  UNION ALL SELECT 'Costa Mpiana', 'Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1413)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1413 AND name = x.name);

-- 1216 Kate Flanagan, IG Private Wealth (Dumitru Flanagan & Associates), Victoria, BC
UPDATE contacts SET address = '101 - 4400 Chatterton Way' WHERE id = 1216;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1216, x.name, x.role FROM (
  SELECT 'Amanda Dumitru' AS name, 'Executive Financial Consultant / Practice Lead' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1216)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1216 AND name = x.name);

-- 1368 Mark Tetrault, Richardson Wealth (Tetrault Hatzitzanakis), Pointe-Claire, QC
UPDATE contacts SET address = '1 Holiday Avenue, East Tower, Suite 405' WHERE id = 1368;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1368, x.name, x.role FROM (
  SELECT 'Helen Hatzitzanakis' AS name, 'Senior Investment Advisor & Wealth Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1368)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1368 AND name = x.name);

-- 1435 Marshall Drozduk, Richardson Wealth (Drozduk Filion Wealth Management), Calgary, AB
UPDATE contacts SET address = 'Eighth Avenue Place, 525 8th Avenue SW, Suite 4700' WHERE id = 1435;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1435, x.name, x.role FROM (
  SELECT 'Kelsey Filion Drozduk' AS name, 'Vice President, Investment Advisor' AS role
  UNION ALL SELECT 'Rory Hyland', 'Investment Associate & Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1435)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1435 AND name = x.name);

-- 1608 Chris James, CIBC Wood Gundy (James Financial Advisory Group), Fredericton, NB
UPDATE contacts SET
  address = '77 Westmorland Street, Suite 770',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team rebranded from "Hicks James Advisory Group" to "James Financial Advisory Group" — former partner Tim Hicks no longer on roster; does not affect Chris James''s own status.')), 512)
WHERE id = 1608;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1608, x.name, x.role FROM (
  SELECT 'Jakub Bundil' AS name, 'Investment Advisor (CFP)' AS role
  UNION ALL SELECT 'Lindsay Herron', 'Financial Associate (PFP)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1608)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1608 AND name = x.name);

-- 1583 Khaled Sultan, CIBC Wood Gundy, London, ON
UPDATE contacts SET address = '255 Queens Avenue, Suite 2200' WHERE id = 1583;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1583, x.name, x.role FROM (
  SELECT 'Anna Terpstra' AS name, 'Client Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1583)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1583 AND name = x.name);

-- 1492 Jonathan Rosenberg, Manulife Securities (Rosenberg Wealth Management), St-Laurent, QC
UPDATE contacts SET address = '9800 Cavendish Blvd, Suite 200' WHERE id = 1492;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1492, x.name, x.role FROM (
  SELECT 'Dario Rahmatian' AS name, 'Partner' AS role
  UNION ALL SELECT 'Galani Stamatopoulos', 'Executive Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1492)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1492 AND name = x.name);

-- 1770 Millicent Hicks, ScotiaMcLeod (Millicent Hicks Group), St. John's, NL
UPDATE contacts SET address = '235 Water Street, Suite 902' WHERE id = 1770;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1770, x.name, x.role FROM (
  SELECT 'Ryan Miller' AS name, 'Partner / Investment Associate' AS role
  UNION ALL SELECT 'Gordon MacDonald', 'Estate and Trust Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1770)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1770 AND name = x.name);

-- 1268 Darryl Tatomir, Wellington-Altus Private Wealth (Bergh Tatomir & Associates), Calgary, AB
UPDATE contacts SET
  address = 'Suite 301, 322 11 Ave SW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Original practice co-founder Bradley Bergh died in 2018 — historical, does not affect Tatomir''s current active status.')), 512)
WHERE id = 1268;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1268, x.name, x.role FROM (
  SELECT 'Sharon Colond' AS name, 'Licensed Investment Associate' AS role
  UNION ALL SELECT 'Zachary Connors', 'Associate Investment Advisor'
  UNION ALL SELECT 'Kimberly Van Egmond', 'Insurance Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1268)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1268 AND name = x.name);

-- 1400 Greg Phillips, Richardson Wealth (Phillips Byler Wealth Management), Vancouver, BC
UPDATE contacts SET address = 'Guinness Tower, 1055 West Hastings Street, Suite 2200' WHERE id = 1400;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1400, x.name, x.role FROM (
  SELECT 'Robert Byler' AS name, 'Portfolio Manager, Director Wealth Management, Investment Advisor' AS role
  UNION ALL SELECT 'Lori Wright', 'Associate (Branch Administrator / Associate Advisor)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1400)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1400 AND name = x.name);

-- 1256 Kelly Lindsey, Raymond James (Okanagan Wealth Management Group), Penticton, BC
UPDATE contacts SET
  address = '465 Ellis Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Team renamed from "Bate Lindsey Rutherford Wealth Management Group" to "Okanagan Wealth Management Group" — not a departure.')), 512)
WHERE id = 1256;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1256, x.name, x.role FROM (
  SELECT 'Kristy Carter' AS name, 'Financial Associate' AS role
  UNION ALL SELECT 'Danelle Lussier', 'Associate Financial Advisor'
  UNION ALL SELECT 'Ashley Hilton', 'Licensed Financial Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1256)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1256 AND name = x.name);

-- 1697 Doug Pinder — LIKELY DEALER SWITCH to iA Private Wealth (firm/address updated, flagged).
UPDATE contacts SET
  firm = 'iA Private Wealth',
  address = '100-1900 11 Street SE (Eighth Avenue Place)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LIKELY MOVED dealer affiliation from Raymond James to iA Private Wealth — team renamed "OP Elite Integrated Wealth" to "OP Elite Wealth," now branded iA Private Wealth on its own site; Alberta corporate registry confirms same office building. A second, possibly-stale entity ("Pinder Wealth Management"/"Pinder Mastel Wealth Management") still references Raymond James and a Tate Pinder — unresolved ambiguity, verify before outreach.')), 512)
WHERE id = 1697;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1697, x.name, x.role FROM (
  SELECT 'Kristin Thankachen' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Jake Frank', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1697)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1697 AND name = x.name);
