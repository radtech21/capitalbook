-- Batch 8 of GTA "advisor team" enrichment (18 more contacts, same
-- methodology as migrations 009-015). One contact gets team data but no
-- address, for a CRM city mismatch consistent with the batch-3 precedent:
--
--   1221 Giac Gelmo — CRM lists Mississauga, but his real office (GS Wealth
--     Management, TD Wealth Private Investment Advice) is in Oakville, ON.
--     Writing the street address under the wrong city would look more
--     precise than it is, so only his team is applied here.
--
-- One contact has a weak, unconfirmed status signal worth a human glance,
-- same treatment as Peter Volpe in batch 6:
--
--   1789 Matt Horan — a single AI-search-summary referenced an unverified
--     "LinkedIn post" suggesting he retired from Scotiabank, but no
--     corroborating source could be found and the firm's own current pages
--     still list him as active Founder/Senior Wealth Advisor. Address/team
--     applied since the retirement claim couldn't be substantiated.
--
-- One contact's parent firm was acquired but there's no evidence she
-- personally left, the same pattern as De Thomasis in batch 5:
--
--   1403 Ida Khajadourian — Richardson Wealth's parent (RF Capital Group)
--     was acquired by iA Financial Corporation (closed Oct 31, 2025); the
--     Richardson brand is expected to retire over the following ~30 months.
--     No evidence Ida herself has left, so address/team applied as usual,
--     with the acquisition noted for the record.
--
-- Two more shared-building notes, consistent with prior batches: 1625 Dean
-- Colling shares a building (200 King Street West, Suite 1807) with 1632 Jay
-- Smith — independent teams. 1464 Peter Kirby is in the same building/suite
-- (40 Temperance Street, Suite 2100) as 1442 Wolfgang Klein (batch 6) and
-- 1455 Darrell Thompson (batch 7) — also independent.

-- 1230 Benjamin Lee, TD Wealth Private Investment Advice, Markham
UPDATE contacts SET address = '85 Enterprise Boulevard, Suite 308' WHERE id = 1230;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1230, x.name, x.role FROM (
  SELECT 'Stephen W. Stuart' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Wayne Bryson', 'Vice President, Portfolio Manager, Investment Advisor'
  UNION ALL SELECT 'Tara Biro', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1230)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1230 AND name = x.name);

-- 1632 Jay Smith, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '200 King Street West, Suite 1807' WHERE id = 1632;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1632, x.name, x.role FROM (
  SELECT 'Andrew Houldsworth' AS name, 'Client Associate' AS role
  UNION ALL SELECT 'Victoria Nepomuceno', 'Branch Administrator'
  UNION ALL SELECT 'Kelly Leon', 'Financial Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1632)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1632 AND name = x.name);

-- 1563 Frank Teti, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 38th Floor' WHERE id = 1563;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1563, x.name, x.role FROM (
  SELECT 'Mark J. Moskowitz' AS name, 'Portfolio Manager and Financial Planner' AS role
  UNION ALL SELECT 'Sophia Sam', 'Business Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1563)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1563 AND name = x.name);

-- 1789 Matt Horan, ScotiaMcLeod, Toronto — see note above on the weak,
-- unconfirmed retirement signal
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1789;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1789, x.name, x.role FROM (
  SELECT 'Michael Chisholm' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Gil Eany', 'Wealth Advisor and Portfolio Manager'
  UNION ALL SELECT 'Jennifer O''Connell', 'Senior Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1789)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1789 AND name = x.name);

-- 1235 Andrew Palazzi, TD Wealth Private Investment Advice, Vaughan
UPDATE contacts SET address = 'Suite 180, 2300 Steeles Avenue West' WHERE id = 1235;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1235, x.name, x.role FROM (
  SELECT 'Jeffrey Schacter' AS name, 'Senior Portfolio Manager & Senior Investment Advisor' AS role
  UNION ALL SELECT 'Jessica Molinaro', 'Investment Advisor'
  UNION ALL SELECT 'Christopher Kalafatis', 'Investment Advisor'
  UNION ALL SELECT 'James McKinnon', 'Associate Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Nino Wijangco', 'Associate Investment Advisor'
  UNION ALL SELECT 'Henry Wu', 'Client Service Associate'
  UNION ALL SELECT 'Stacey Espinola', 'Client Relationship Associate'
  UNION ALL SELECT 'Jane Chen', 'Client Service Associate'
  UNION ALL SELECT 'Rose Capito', 'Client Service Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1235)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1235 AND name = x.name);

-- 1595 Ross Ferrier, CIBC Wood Gundy, Markham (Thornhill)
UPDATE contacts SET address = '123 Commerce Valley Drive East, Suite 100' WHERE id = 1595;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1595, x.name, x.role FROM (
  SELECT 'George Ballos' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Betty Wang', 'Associate Investment Advisor'
  UNION ALL SELECT 'Inez Phair', 'Portfolio Manager / Investment Advisor'
  UNION ALL SELECT 'Gordon McRae', 'Associate Investment Advisor'
  UNION ALL SELECT 'Alicja Segui', 'Administrative Assistant'
  UNION ALL SELECT 'Mara Simetic', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1595)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1595 AND name = x.name);

-- 1215 Laura Barclay, TD Wealth Private Investment Counsel, Markham (address only)
UPDATE contacts SET address = '220 Commerce Valley Drive West, Suite 300' WHERE id = 1215;

-- 1509 Richard Veale, BMO Nesbitt Burns, Oakville — same building as 1536
-- Jonathan Lin (batch 7), independent team
UPDATE contacts SET address = '360 Oakville Place Drive, 2nd Floor' WHERE id = 1509;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1509, x.name, x.role FROM (
  SELECT 'Jessica Slater' AS name, 'Associate' AS role
  UNION ALL SELECT 'Cosette Alward', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1509)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1509 AND name = x.name);

-- 1310 Hussein Amad, Yorkville Asset Management, Toronto
UPDATE contacts SET address = 'Suite 1240, 100 Wellington Street West' WHERE id = 1310;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1310, x.name, x.role FROM (
  SELECT 'Robert Featherby' AS name, 'Director and Portfolio Manager' AS role
  UNION ALL SELECT 'Ruben Kamhi', 'Portfolio Manager'
  UNION ALL SELECT 'Derek Brenzil', 'Portfolio Manager'
  UNION ALL SELECT 'Jennifer Kestenberg', 'Senior Portfolio Associate, Client Services'
  UNION ALL SELECT 'Joanne Kudakiewicz', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1310)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1310 AND name = x.name);

-- 1542 Brad Goldhar, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '1 First Canadian Place, 39th Floor' WHERE id = 1542;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1542, x.name, x.role FROM (
  SELECT 'Norman Shiner' AS name, 'Investment Advisor and Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Sherman Sung', 'Senior Associate'
  UNION ALL SELECT 'Sofia Sapra', 'Senior Associate'
  UNION ALL SELECT 'Marianne Cizmar', 'Associate Investment Advisor / Senior Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1542)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1542 AND name = x.name);

-- 1464 Peter Kirby, CG Wealth Management, Toronto — same building/suite as
-- 1442 Wolfgang Klein (batch 6) and 1455 Darrell Thompson (batch 7), independent team
UPDATE contacts SET address = '40 Temperance Street, Suite 2100' WHERE id = 1464;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1464, x.name, x.role FROM (
  SELECT 'Peter Beck' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Matt Shadbolt', 'Senior Investment Advisor & Associate Portfolio Manager'
  UNION ALL SELECT 'Elina Ayzenberg', 'Associate Investment Advisor'
  UNION ALL SELECT 'Andrea Gosse', 'Senior Investment Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1464)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1464 AND name = x.name);

-- 1636 Bryan Baker, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = 'West Tower, Bay Adelaide Centre, 333 Bay Street, Suite 2800' WHERE id = 1636;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1636, x.name, x.role FROM (
  SELECT 'Jonathan Baker' AS name, 'Partner, Senior Portfolio Manager / Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Lisa Barton', 'Associate Investment Advisor'
  UNION ALL SELECT 'Christian Mitri', 'Client Associate'
  UNION ALL SELECT 'Lindsey Bentham', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1636)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1636 AND name = x.name);

-- 1625 Dean Colling, CIBC Wood Gundy, Toronto — same building as 1632 Jay
-- Smith, independent team
UPDATE contacts SET address = '200 King Street West, Suite 1807' WHERE id = 1625;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1625, 'Rocco Letterio', 'Senior Wealth Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1625)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1625 AND name = 'Rocco Letterio');

-- 1762 Charles Tucker, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 48th Floor' WHERE id = 1762;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1762, x.name, x.role FROM (
  SELECT 'Peter Willson' AS name, 'Portfolio Manager, Co-Founder of Tucker Willson Group' AS role
  UNION ALL SELECT 'Kevin Carscadden', 'Senior Wealth Advisor, Portfolio Manager'
  UNION ALL SELECT 'Jacob Coellar', 'Investment Associate'
  UNION ALL SELECT 'Emily Tucker', 'Investment Associate & Associate Portfolio Manager'
  UNION ALL SELECT 'Sandra Tavares', 'Administrative Team Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1762)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1762 AND name = x.name);

-- 1221 Giac Gelmo, TD Wealth Private Investment Advice — address NOT applied,
-- see note at top of file (CRM city is Mississauga, real office is Oakville)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1221, x.name, x.role FROM (
  SELECT 'Albert Simonetta' AS name, 'Senior Investment Advisor and Senior Portfolio Manager' AS role
  UNION ALL SELECT 'William Barlow', 'Senior Portfolio Manager and Senior Investment Advisor'
  UNION ALL SELECT 'Jeremy Wong', 'Senior Investment Advisor'
  UNION ALL SELECT 'Kevin Douthwright', 'Associate Portfolio Manager and Senior Investment Advisor'
  UNION ALL SELECT 'Vesna Tintor', 'Assistant Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1221)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1221 AND name = x.name);

-- 1403 Ida Khajadourian, Richardson Wealth Ltd, Toronto — see note above on
-- the RF Capital / iA Financial acquisition
UPDATE contacts SET address = '100 Queens Quay East, Suite 2500' WHERE id = 1403;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1403, 'Anton Poverennov', 'Associate Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1403)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1403 AND name = 'Anton Poverennov');

-- 1518 Sajjad Hussain, iA Private Wealth, Toronto (address only; the only
-- named team member, Glenn Allen, appears to be the founder/lead of Allen
-- Private Wealth Group rather than a subordinate teammate of Hussain, so
-- his relationship to this specific contact was too ambiguous to apply)
UPDATE contacts SET address = '245 Yorkland Boulevard, Suite 201' WHERE id = 1518;

-- 1759 Dave Macdonald, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1759;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1759, x.name, x.role FROM (
  SELECT 'John Fini' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Erin Duffy', 'Senior Associate'
  UNION ALL SELECT 'Jeff Ware', 'Investment Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1759)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1759 AND name = x.name);
