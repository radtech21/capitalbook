-- Batch 4 of "rest of Canada" advisor team/address enrichment. 15 of 18
-- targeted contacts are resolved here; 3 (Charlie Aiello 1607, Brad
-- Hummel 1579, Jerome Bastien 1367) hit a research-tooling API error
-- mid-run and will be picked up in a follow-up batch rather than guessed.
--
-- Also adds Michael Pate as a new contact — the successor to 1267 Craig
-- Baun (Wellington-Altus Private Wealth, Calgary), who died in June 2026
-- (see migration 029). Baun's team, "Baun & Pate Investment Group,"
-- rebranded to "Aspire Wealth Partners" before his death and continues
-- under Pate's leadership. Per explicit decision, Baun's record stays
-- archived/unreachable (already done in migration 029) and Pate is added
-- as a distinct new contact, consistent with the McGlade -> McGoey
-- precedent in migrations 022/026.
--
-- 1653 David Popowich and 1655 Faisal Karmali are two separate CRM
-- contacts on the same merged CIBC Wood Gundy Calgary practice
-- ("Popowich Karmali Advisory Group," partners since 2010) — each lists
-- the other plus shared staff. 1414 Neil Kumar and 1426 Tyler Steele are
-- two separate CRM contacts co-leading the same Richardson Wealth
-- Vancouver team ("JSK Partners") — each lists the other plus shared
-- staff; a possible CIRO enforcement record for a "Neil Kumar" surfaced
-- but couldn't be confirmed as the same person (common surname), flagged
-- for manual verification rather than acted on.
--
-- 500 Centre Street SE, 27th Floor, Calgary now has FIVE confirmed
-- independent CIBC Wood Gundy teams on file: 1581 Wade Kozak, 1654 David
-- Kamitakahara, 1651 Milan Cacic, 1641 B.K. Milne, and 1653/1655
-- Popowich/Karmali. 1474 Dwight Mann is a second independent CG Wealth
-- Management team at 1133 Melville Street, Suite 1200, Vancouver
-- (alongside 1472 David LePoidevin from batch 1).

-- 1226 Darrell Gebhardt, TD Wealth (Gebhardt Paquin Family Wealth Management), Winnipeg
UPDATE contacts SET address = '360 Main Street, Suite 2100' WHERE id = 1226;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1226, x.name, x.role FROM (
  SELECT 'Cedric Paquin' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Scott Wheeler', 'Associate Investment Advisor'
  UNION ALL SELECT 'Deenish Roopra', 'Client Service Associate'
  UNION ALL SELECT 'Selina Speranza', 'Client Service Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1226)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1226 AND name = x.name);

-- 1651 Milan Cacic, CIBC Wood Gundy, Calgary (address only)
UPDATE contacts SET address = '500 Centre Street SE, 27th Floor' WHERE id = 1651;

-- 1222 Ashit Dattani, TD Wealth (Dattani Wealth Advisory Group), Vancouver
UPDATE contacts SET address = '700 West Georgia St, Suite 1000-1101' WHERE id = 1222;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1222, x.name, x.role FROM (
  SELECT 'Borzo Salehi' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Dugan Batten', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1222)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1222 AND name = x.name);

-- 1266 Dean Bradshaw, Wellington-Altus Private Wealth (Cresco Wealth Management), Calgary
UPDATE contacts SET address = '222 3rd Ave SW, Suite 1650' WHERE id = 1266;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1266, x.name, x.role FROM (
  SELECT 'Chris Durno' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Peter Kollias', 'Senior Investment Advisor, Portfolio Manager'
  UNION ALL SELECT 'Jennifer Williams', 'Investment Advisor'
  UNION ALL SELECT 'Sheena Schreiner', 'Investment Advisor'
  UNION ALL SELECT 'Dimitri Korolis', 'Investment Advisor'
  UNION ALL SELECT 'Wayne De Boer', 'Senior Wealth Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1266)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1266 AND name = x.name);

-- 1580 Debra Wooding, CIBC Wood Gundy (The Wooding Group), Edmonton
UPDATE contacts SET address = '250, 10336 - 103 Street NW' WHERE id = 1580;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1580, x.name, x.role FROM (
  SELECT 'Tom Wooding' AS name, 'Senior Wealth Advisor, Portfolio Manager, Co-Founder' AS role
  UNION ALL SELECT 'Lindsay MacPhie', 'Senior Wealth Advisor and Wealth Strategist'
  UNION ALL SELECT 'Peter MacPhie', 'Portfolio Manager'
  UNION ALL SELECT 'Daniel Bui', 'Associate Investment Advisor'
  UNION ALL SELECT 'Peter Wooding', 'Associate Investment Advisor'
  UNION ALL SELECT 'Ryan Romanko', 'Estate Planning Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1580)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1580 AND name = x.name);

-- 1474 Dwight Mann, CG Wealth Management (Mann Team), Vancouver
UPDATE contacts SET address = '1133 Melville Street, Suite 1200' WHERE id = 1474;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1474, x.name, x.role FROM (
  SELECT 'Jordan James' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Ilia Nizker', 'Portfolio Manager'
  UNION ALL SELECT 'Sean Mackay', 'Portfolio Manager'
  UNION ALL SELECT 'Tanya Suelzle', 'Investment Advisor'
  UNION ALL SELECT 'Marlaena Poss', 'Office Administration'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1474)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1474 AND name = x.name);

-- 1641 B.K. Milne, CIBC Wood Gundy (Forge Advisory Group), Calgary
UPDATE contacts SET address = '500 Centre Street SE, 27th Floor' WHERE id = 1641;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1641, x.name, x.role FROM (
  SELECT 'Sarah Hart' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Matthew Moore', 'Associate Investment Advisor'
  UNION ALL SELECT 'Laure Fair', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1641)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1641 AND name = x.name);

-- 1438 Chad Larson, CG Wealth Management (MLD Wealth Management Group), Calgary
UPDATE contacts SET address = 'Centennial Place, East Tower, Suite 2400, 520 - 3rd Avenue SW' WHERE id = 1438;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1438, x.name, x.role FROM (
  SELECT 'Curtis Mayert' AS name, 'Director, Wealth Management & Senior Vice President' AS role
  UNION ALL SELECT 'Mehul Sudra', 'Partner, Senior Investment Advisor & Associate Portfolio Manager'
  UNION ALL SELECT 'Shannon Sowa', 'Senior Investment Advisor'
  UNION ALL SELECT 'Gurman Arora', 'Senior Financial Planner & Associate Portfolio Manager'
  UNION ALL SELECT 'Melissa Tully', 'Investment Associate'
  UNION ALL SELECT 'Lauren Currie', 'Senior Administrative Assistant'
  UNION ALL SELECT 'Matej Trutina', 'Associate of Business Development'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1438)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1438 AND name = x.name);

-- 1653 David Popowich + 1655 Faisal Karmali, CIBC Wood Gundy (Popowich
-- Karmali Advisory Group), Calgary — same team, both CRM contacts
UPDATE contacts SET address = '500 Centre Street SE, 27th Floor' WHERE id IN (1653, 1655);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1653, x.name, x.role FROM (
  SELECT 'Faisal Karmali' AS name, 'Portfolio Manager, Investment Advisor & First Vice-President' AS role
  UNION ALL SELECT 'Leanna Wachniak', 'Wealth Advisor'
  UNION ALL SELECT 'Robert (Rob) Gerrie', 'Investment Advisor'
  UNION ALL SELECT 'Alexandra O''Neill', 'Financial Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1653)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1653 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1655, x.name, x.role FROM (
  SELECT 'David Popowich' AS name, 'Portfolio Manager, Investment Advisor & First Vice-President' AS role
  UNION ALL SELECT 'Leanna Wachniak', 'Wealth Advisor'
  UNION ALL SELECT 'Robert (Rob) Gerrie', 'Investment Advisor'
  UNION ALL SELECT 'Alexandra O''Neill', 'Financial Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1655)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1655 AND name = x.name);

-- 1690 Mark Therriault, Nicola Wealth, Vancouver (address only)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1690;

-- 1414 Neil Kumar + 1426 Tyler Steele, Richardson Wealth Ltd (JSK
-- Partners), Vancouver — same team, both CRM contacts
UPDATE contacts SET address = 'Guinness Tower, 1055 West Hastings Street, Suite 2200' WHERE id IN (1414, 1426);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1414, x.name, x.role FROM (
  SELECT 'Tyler Steele' AS name, 'Senior Investment Advisor, Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Tim Engelbert', 'Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Rory O''Connor', 'Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Heather Meehan', 'Member of JSK Partners'
  UNION ALL SELECT 'Maryam Fejvai', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1414)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1414 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1426, x.name, x.role FROM (
  SELECT 'Neil Kumar' AS name, 'Portfolio Manager, Investment Advisor, Founding Partner' AS role
  UNION ALL SELECT 'Tim Engelbert', 'Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Rory O''Connor', 'Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Heather Meehan', 'Member of JSK Partners'
  UNION ALL SELECT 'Maryam Fejvai', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1426)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1426 AND name = x.name);

-- 1674 Dylan Reece, Nicola Wealth, Vancouver
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1674;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1674, 'David N. Chalmers', 'Wealth Advisor & Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1674)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1674 AND name = 'David N. Chalmers');

-- 1395 Marc Desgagne, NBF Wealth Management (Groupe financier Desgagné &
-- Associés), Saguenay/Chicoutimi
UPDATE contacts SET address = '1180 boulevard Talbot, Bureau 201' WHERE id = 1395;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1395, x.name, x.role FROM (
  SELECT 'Martin Desgagné' AS name, 'Portfolio Manager & Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Éric Allard', 'Wealth Advisor & Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1395)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1395 AND name = x.name);

-- Michael Pate: new contact, successor to deceased 1267 Craig Baun
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2454, 'Michael Pate', 'Advisor', 'Wellington-Altus Private Wealth', 'Financial Advisor', 'C', 0,
  'michael.pate@wellington-altus.ca', 'Provided', '587.319.6422', 'Calgary', 'AB', 'Canada',
  'CALGARY', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as successor to deceased contact 1267 Craig Baun (Wellington-Altus Private Wealth, Calgary, died June 2026) — leads the team, rebranded from "Baun & Pate Investment Group" to "Aspire Wealth Partners" (Aug 2025), same office.',
  '250 5th Street SW, Suite 2300'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2454);

INSERT INTO contact_people (contact_id, name, role)
SELECT 2454, x.name, x.role FROM (
  SELECT 'Darren Cooper' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Paul Duff', 'Senior Investment Advisor'
  UNION ALL SELECT 'Brent Koskimaki', 'Senior Investment Advisor & Portfolio Manager'
  UNION ALL SELECT 'Chantal Mackenzie', 'Senior Insurance Advisor'
  UNION ALL SELECT 'Joshua Hosein', 'Senior Wealth Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2454)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2454 AND name = x.name);
