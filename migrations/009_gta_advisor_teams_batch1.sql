-- Batch 1 of GTA "advisor team" enrichment: branch address + confirmed team
-- members, sourced from each firm's own public team/bio pages (fetched via
-- search-engine snippets where the firm's site blocks direct automated
-- fetches, which was true for every firm in this batch). Only team members
-- confirmed by BOTH full name and role/title were added; several additional
-- first-name-only mentions were deliberately left out rather than guessed.
-- Top 15 GTA Financial Advisor contacts by AUM (Bryan Baker/1636 already
-- covered in migration 007). 190 more GTA advisors remain unresearched.

-- 1632 Jay Smith, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '200 King Street West, Suite 1807' WHERE id = 1632;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1632, 'Andrew Houldsworth', 'Client Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1632)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1632 AND name = 'Andrew Houldsworth');

-- 1230 Benjamin Lee, TD Wealth Private Investment Advice, Markham
UPDATE contacts SET address = '85 Enterprise Blvd., Suite 308' WHERE id = 1230;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1230, x.name, x.role FROM (
  SELECT 'Stephen Stuart' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Wayne Bryson', 'Vice President, Portfolio Manager, Investment Advisor'
  UNION ALL SELECT 'Tara Biro', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1230)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1230 AND name = x.name);

-- 1563 Frank Teti, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 38th Floor' WHERE id = 1563;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1563, x.name, x.role FROM (
  SELECT 'Mark J. Moskowitz' AS name, 'Portfolio Manager, Senior Wealth Associate' AS role
  UNION ALL SELECT 'James P. Murphy', 'Senior Wealth Management Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1563)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1563 AND name = x.name);

-- 1789 Matt Horan, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1789;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1789, 'Jessica Tong', 'Client Service / Wealth Management Operations'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1789)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1789 AND name = 'Jessica Tong');

-- 1235 Andrew Palazzi, TD Wealth Private Investment Advice, Vaughan
UPDATE contacts SET address = 'Suite 180, 2300 Steeles Avenue West' WHERE id = 1235;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1235, x.name, x.role FROM (
  SELECT 'Jeffrey Schacter' AS name, 'Senior Portfolio Manager & Senior Investment Advisor' AS role
  UNION ALL SELECT 'James McKinnon', 'Associate Portfolio Manager & Investment Advisor'
  UNION ALL SELECT 'Jessica Molinaro', 'Investment Advisor'
  UNION ALL SELECT 'Christopher Kalafatis', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1235)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1235 AND name = x.name);

-- 1595 Ross Ferrier, CIBC Wood Gundy (Commerce Valley Financial Group), Markham/Thornhill
UPDATE contacts SET address = '123 Commerce Valley Drive East, Suite 100' WHERE id = 1595;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1595, x.name, x.role FROM (
  SELECT 'George Ballos' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Betty Wang', 'Associate Investment Advisor'
  UNION ALL SELECT 'Inez Phair', 'Portfolio Manager'
  UNION ALL SELECT 'Gordon D. McRae', 'Associate Investment Advisor'
  UNION ALL SELECT 'Alicja Segui', 'Administrative Assistant'
  UNION ALL SELECT 'Mara Simetic', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1595)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1595 AND name = x.name);

-- 1215 Laura Barclay, TD Wealth Private Investment Counsel, Markham (address only - no team met the accuracy bar)
UPDATE contacts SET address = '220 Commerce Valley Dr. W., Suite 300' WHERE id = 1215;

-- 1509 Richard Veale, BMO Nesbitt Burns, Oakville
UPDATE contacts SET address = '360 Oakville Place Dr., 2nd Floor' WHERE id = 1509;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1509, x.name, x.role FROM (
  SELECT 'Joanna Hewgill' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Jimin Hong', 'Senior Investment Associate'
  UNION ALL SELECT 'Jessica Slater', 'Associate'
  UNION ALL SELECT 'Cosette Alward', 'Associate'
  UNION ALL SELECT 'Jennifer Morabito', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1509)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1509 AND name = x.name);

-- 1310 Hussein Amad, Yorkville Asset Management, Toronto
UPDATE contacts SET address = 'Suite 1240, 100 Wellington Street West' WHERE id = 1310;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1310, x.name, x.role FROM (
  SELECT 'Robert Featherby' AS name, 'Director and Portfolio Manager' AS role
  UNION ALL SELECT 'Ruben Kamhi', 'Portfolio Manager'
  UNION ALL SELECT 'Jillian Wade', 'Associate Portfolio Manager & Trader'
  UNION ALL SELECT 'Derek Brenzil', 'Portfolio Manager and Investment Counsellor'
  UNION ALL SELECT 'Ralph Desando', 'Managing Director of Private Investments and Deputy CEO'
  UNION ALL SELECT 'Rian Malik', 'Senior Manager'
  UNION ALL SELECT 'Hayley Clift', 'Manager of Business Development'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1310)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1310 AND name = x.name);

-- 1542 Brad Goldhar, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '1 First Canadian Place, 39th Floor' WHERE id = 1542;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1542, x.name, x.role FROM (
  SELECT 'Norman Shiner' AS name, 'Investment Advisor and Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Sofia Sapra', 'Senior Associate'
  UNION ALL SELECT 'Sherman Sung', 'Senior Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1542)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1542 AND name = x.name);

-- 1464 Peter Kirby, CG Wealth Management (Kirby Private Wealth / Canaccord Genuity), Toronto
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

-- 1625 Dean Colling, CIBC Wood Gundy, Toronto (same building as Jay Smith/1632 - plausible shared branch)
UPDATE contacts SET address = '200 King Street West, Suite 1807' WHERE id = 1625;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1625, 'Rocco Letterio', 'Senior Wealth Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1625)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1625 AND name = 'Rocco Letterio');

-- 1762 Charles Tucker, ScotiaMcLeod (Tucker Willson Group), Toronto
UPDATE contacts SET address = '40 King Street West, 48th Floor' WHERE id = 1762;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1762, x.name, x.role FROM (
  SELECT 'Peter Willson' AS name, 'Portfolio Manager, Co-Founder' AS role
  UNION ALL SELECT 'Kevin Carscadden', 'Senior Wealth Advisor, Portfolio Manager'
  UNION ALL SELECT 'John Kaglik', 'Senior Wealth Advisor, Portfolio Manager'
  UNION ALL SELECT 'Jacob Coellar', 'Investment Associate, Associate Portfolio Manager'
  UNION ALL SELECT 'Emily Tucker', 'Investment Associate, Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1762)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1762 AND name = x.name);

-- 1403 Ida Khajadourian, Richardson Wealth Ltd, Toronto
UPDATE contacts SET address = '145 King Street West, Suite 500' WHERE id = 1403;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1403, 'Anton Poverennov', 'Associate Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1403)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1403 AND name = 'Anton Poverennov');

-- 1221 Giac Gelmo, TD Wealth Private Investment Advice — address DELIBERATELY NOT SET.
-- The CRM has this contact's city as Mississauga, but current TD listings show the
-- team at 2020 Winston Park Drive, Suite 301, Oakville, ON L6H 6X7 (an older cached
-- listing shows 20 Milverton Drive, Mississauga). This looks like a branch relocation
-- that the city field itself needs reconciling first — flagged for manual review
-- rather than silently overwriting city or guessing which address is current. The
-- team roster below is solid regardless of which building they're in.
INSERT INTO contact_people (contact_id, name, role)
SELECT 1221, x.name, x.role FROM (
  SELECT 'Albert Simonetta' AS name, 'Senior Portfolio Manager & Senior Investment Advisor' AS role
  UNION ALL SELECT 'William Barlow', 'Investment Advisor'
  UNION ALL SELECT 'Jeremy Wong', 'Senior Investment Advisor'
  UNION ALL SELECT 'Vesna Tintor', 'Assistant Investment Advisor'
  UNION ALL SELECT 'Kevin Douthwright', 'Associate Portfolio Manager & Senior Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1221)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1221 AND name = x.name);
