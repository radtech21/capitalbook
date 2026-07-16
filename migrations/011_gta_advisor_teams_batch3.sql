-- Batch 3 of GTA "advisor team" enrichment (18 more contacts, same methodology
-- as migrations 009/010). Two data-quality issues surfaced that are NOT
-- silently patched here — flagging both for manual review instead:
--
--   1760 Allan McGlade — solid evidence (ScotiaMcLeod Charitable Foundation +
--     the firm's own "Staff Update" post) that he died of ALS in April 2023.
--     His book is now led by Andrew McGoey under "The McGoey Financial Group"
--     at the same address. Nothing applied to this contact — this needs a
--     human decision (mark inactive? reassign to McGoey?), not a silent edit.
--   1201 Marc Nadeau, 1219 Drew Abbott — both have a real branch address, but
--     it's in a DIFFERENT city than what's on file (Nadeau: CRM says Toronto,
--     real office is Whitby; Abbott: CRM says Toronto, real office is
--     Oakville). Writing the street address under the wrong city would look
--     more precise than it is, so only their team members are applied here;
--     the address/city itself needs correcting together, not the address
--     alone. Both cities (Whitby, Oakville) are already in the GTA bucket, so
--     this doesn't affect country/region filtering — just contact accuracy.
--
-- Two more pairs turned out to be each other's CRM contacts on the same team
-- (MacDonald+Konidis at TD; Newman+Newman at Scotia — literally brothers or
-- partners trading under "Newman Group"), handled the same way as batch 2:
-- shared address, the *other* member's colleagues, not each other. Richie
-- (1374) and Feindel (1421) are confirmed co-leads of the same practice but
-- no other team member met the name+title bar, so they just share an address.

-- 1479 Kurt Rosentreter, Manulife Securities, Toronto (Etobicoke)
UPDATE contacts SET address = '2848 Bloor Street West' WHERE id = 1479;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1479, x.name, x.role FROM (
  SELECT 'Jordan Campbell' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Frank Valicek', 'Financial Advisor'
  UNION ALL SELECT 'Monika Kucinskaite', 'Financial Advisor Associate'
  UNION ALL SELECT 'Mathew Cain', 'Financial Advisor Associate'
  UNION ALL SELECT 'Laura Collins', 'Executive Assistant to Kurt Rosentreter'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1479)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1479 AND name = x.name);

-- 1728 Graeme Watt, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1728;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1728, x.name, x.role FROM (
  SELECT 'Stuart W. Statton' AS name, 'Investment Associate, Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Michael Davidovits', 'Wealth Advisor, Associate Portfolio Manager'
  UNION ALL SELECT 'Anthony Di Vito', 'Investment Advisor'
  UNION ALL SELECT 'Jennie Ho', 'Senior Manager, Wealth Management Taxation'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1728)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1728 AND name = x.name);

-- 1730 Greg Newman + 1761 Allan Newman — same ScotiaMcLeod team ("Newman Group")
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id IN (1730, 1761);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, x.name, x.role FROM contacts c, (
  SELECT 'Tryphena Christian' AS name, 'Investment Associate' AS role
  UNION ALL SELECT 'Chris Bien', 'Administrative Associate'
  UNION ALL SELECT 'Timothy Chan', 'Senior Associate'
  UNION ALL SELECT 'Miranda Chan', 'Total Wealth Planner'
  UNION ALL SELECT 'Jay Hershfield', 'Director, Insurance Consultant'
  UNION ALL SELECT 'Aline Philavong', 'Administrative Assistant'
) x
WHERE c.id IN (1730, 1761)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = x.name);

-- 1565 Daniel Sacke, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '4881 Yonge Street, 9th Floor' WHERE id = 1565;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1565, 'Kevin Kolb', 'Associate Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1565)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1565 AND name = 'Kevin Kolb');

-- 1220 Jeff MacDonald + 1225 Peter Konidis — same TD team ("MK Total Wealth Management Group")
UPDATE contacts SET address = '5140 Yonge Street, Suite 1600' WHERE id IN (1220, 1225);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, 'Nicholas Agius', 'Investment Advisor' FROM contacts c
WHERE c.id IN (1220, 1225)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = 'Nicholas Agius');

-- 1747 Derek Blakely, ScotiaMcLeod, Oakville
UPDATE contacts SET address = '1235 North Service Road West, Suite 200' WHERE id = 1747;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1747, x.name, x.role FROM (
  SELECT 'Christine Soumako' AS name, 'Business Development Associate' AS role
  UNION ALL SELECT 'Jese Veltri', 'Investment Associate'
  UNION ALL SELECT 'Sophia Lim', 'Administrative Associate'
  UNION ALL SELECT 'McKenzie McDermid', 'Senior Financial Planning Associate'
  UNION ALL SELECT 'Shelley Moore', 'Senior Associate'
  UNION ALL SELECT 'Sebastian Selada', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1747)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1747 AND name = x.name);

-- 1776 Nick Maggio, ScotiaMcLeod, Vaughan
UPDATE contacts SET address = '200 Apple Mill Road, Suite 800' WHERE id = 1776;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1776, x.name, x.role FROM (
  SELECT 'Badri Mahdavi-Lang' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Gregory Ang', 'Investment Associate, Associate Portfolio Manager'
  UNION ALL SELECT 'Luba Naumovski', 'Administrative Assistant'
  UNION ALL SELECT 'Sooria Namunakulan', 'Administrative Support Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1776)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1776 AND name = x.name);

-- 1600 Robert Leon, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = 'Brookfield Place, Suite 600, 181 Bay Street' WHERE id = 1600;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1600, x.name, x.role FROM (
  SELECT 'Rob Dyer' AS name, 'Investment Advisor & Partner' AS role
  UNION ALL SELECT 'Jamie Golombek', 'Managing Director, Tax and Estate Planning'
  UNION ALL SELECT 'Christine Di Corte', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1600)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1600 AND name = x.name);

-- 1616 Peter Papadopoulos, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '200 King Street West, 8th Floor' WHERE id = 1616;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1616, x.name, x.role FROM (
  SELECT 'Jack Papadopoulos' AS name, 'Client Associate' AS role
  UNION ALL SELECT 'Nicholas Papadopoulos', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1616)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1616 AND name = x.name);

-- 1757 Ian McLaughlin, ScotiaMcLeod, Toronto (North York)
UPDATE contacts SET address = '4950 Yonge Street, Suite 1200' WHERE id = 1757;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1757, x.name, x.role FROM (
  SELECT 'Brian Hutchison' AS name, 'Senior Associate' AS role
  UNION ALL SELECT 'Fiona Zhao', 'Insurance Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1757)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1757 AND name = x.name);

-- 1741 Marc Henein, ScotiaMcLeod, Mississauga
UPDATE contacts SET address = '2 Robert Speck Parkway, Suite 1600' WHERE id = 1741;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1741, x.name, x.role FROM (
  SELECT 'Shawn Cooper' AS name, 'Senior Total Wealth Planner' AS role
  UNION ALL SELECT 'Arlette Santos', 'Financial Planner'
  UNION ALL SELECT 'Rachel Medeiros', 'CAGE and Branch Systems Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1741)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1741 AND name = x.name);

-- 1374 Kyle Richie + 1421 Andrew Feindel — same Richardson Wealth practice
-- ("Richie Feindel Wealth Management"); no other team member met the bar
UPDATE contacts SET address = '100 Queens Quay East, Suite 2500' WHERE id IN (1374, 1421);

-- 1201 Marc Nadeau, Raymond James (Garden Street Wealth & Longevity Management)
-- — address NOT applied, see note at top of file (CRM city is Toronto, real
-- office is Whitby)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1201, x.name, x.role FROM (
  SELECT 'Denis C. Beaulieu' AS name, 'Founding Partner, Financial Advisor' AS role
  UNION ALL SELECT 'Glenn R. Fischer', 'Financial Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1201)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1201 AND name = x.name);

-- 1219 Drew Abbott, TD Wealth Private Investment Advice — address NOT applied,
-- see note at top of file (CRM city is Toronto, real office is Oakville)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1219, x.name, x.role FROM (
  SELECT 'Clay Abbott' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Andrew Clayton', 'Associate Portfolio Manager & Senior Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1219)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1219 AND name = x.name);

-- 1760 Allan McGlade — DELIBERATELY NOTHING APPLIED. See note at top of file:
-- strong evidence he died in April 2023; this record needs a human decision.
