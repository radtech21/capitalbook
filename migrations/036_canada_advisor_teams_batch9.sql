-- Rest-of-Canada Financial Advisor enrichment, batch 9 of ~24 (18 contacts).
-- Address + team-roster research, same methodology as prior batches. All
-- web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- 1663 Anna Macias + 1664 Dan Nolan (IPC Securities, Ottawa) were flagged
-- for a possible shared-team pair due to matching AUM, but research
-- confirmed they are on SEPARATE, unrelated practices at different
-- addresses — no cross-reference applied.
--
-- 1467 Darcie Crowe (Crowe Private Wealth) is a 4th confirmed independent
-- Canaccord Genuity team at 1133 Melville St, Suite 1200, Vancouver,
-- alongside Graham Stanley, Jamie Switzer, and Cam Currie (batches 7-8) —
-- consistent with the recurring shared-building pattern. Likewise 1742
-- Stephen Roster shares Constitution Square, Ottawa with the Gawargy
-- Hamilton Temidire Group (batch 7); 1645 Kevin Punshon shares 1801
-- Hamilton St, Regina with Don Promhouse (batch 6); 1379 Emmanuel Moreau
-- shares 1040 rue du Lux, Brossard with Stephane Masse (batch 6); and 1611
-- Hart Pollack shares 1 Lombard Place, Winnipeg with Charlie Aiello
-- (batch 4) — all independent, unrelated teams.
--
-- Two weak/unconfirmed signals applied per the established precedent
-- (address+team applied, but flagged for manual verification):
--   1664 Dan Nolan: since ~July 2024 shows as "VP, Pinnacle Advisor
--     Growth & Development" (a corporate HQ role) rather than a
--     client-facing advisor, and is absent from the public advisor
--     directory — his continued client-facing status is uncertain.
--   1694 Chad Woolsey: a June 2025 LinkedIn post stated he was retiring
--     at the end of 2025; not independently confirmed on a current roster.
--
-- 1364 Shawn Veroba's team excludes Brenda Serfling — her LinkedIn now
-- reads "Retired Senior Advisor," so she is no longer an active colleague.

-- 1278 Paul Green, Harbourfront Wealth Management, Woodstock, ON
UPDATE contacts SET address = '112 Springbank Avenue N' WHERE id = 1278;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1278, x.name, x.role FROM (
  SELECT 'David (Dave) Harris' AS name, 'Portfolio Manager, CFP, CIM' AS role
  UNION ALL SELECT 'Christine Cooper', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1278)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1278 AND name = x.name);

-- 1798 Peter Miller, ScotiaMcLeod (The Miller Investment Management Group), Waterloo, ON
UPDATE contacts SET address = '115 King Street South, Suite 210' WHERE id = 1798;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1798, x.name, x.role FROM (
  SELECT 'Drew Taylor' AS name, 'Business Development Associate' AS role
  UNION ALL SELECT 'James Hoey', 'Senior Insurance Consultant'
  UNION ALL SELECT 'Laura Power', 'Investment Associate'
  UNION ALL SELECT 'Raluca Tanase', 'Senior Associate'
  UNION ALL SELECT 'Meghan Gomes', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1798)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1798 AND name = x.name);

-- 1361 Patrick Lagace, NBF Wealth Management (Équipe Lagacé-Proulx), Saint-Hyacinthe, QC
UPDATE contacts SET address = '1355 Rue Daniel-Johnson Ouest, Bureau 4100' WHERE id = 1361;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1361, x.name, x.role FROM (
  SELECT 'Anthony Beaurivage-Proulx' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Karolane Corbeil', 'Senior/Principal Associate in Wealth Management'
  UNION ALL SELECT 'Audrey Lefebvre', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1361)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1361 AND name = x.name);

-- 1514 Nader Hamid, iA Private Wealth (TWM Group), Pointe-Claire, QC
UPDATE contacts SET address = '755 Boulevard St-Jean, Suite 301' WHERE id = 1514;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1514, x.name, x.role FROM (
  SELECT 'Jean Hénault, CIM®' AS name, 'Portfolio Manager, Managing Partner' AS role
  UNION ALL SELECT 'Pascal Ricard, CIM®', 'Portfolio Manager'
  UNION ALL SELECT 'Kevin John Abouzeid', 'Associate Investment Advisor'
  UNION ALL SELECT 'Lily Yan', 'Administrative Assistant'
  UNION ALL SELECT 'Sofia Troubetskaia', 'Administrative Assistant'
  UNION ALL SELECT 'Tessa Wong', 'Senior Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1514)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1514 AND name = x.name);

-- 1663 Anna Macias, IPC Securities (Craig & Taylor Associates), Ottawa, ON (address only — no team confirmed; NOT same team as 1664)
UPDATE contacts SET address = '1525 Carling Avenue, Suite 504' WHERE id = 1663;

-- 1664 Dan Nolan, IPC Securities, Ottawa, ON (address only — no team confirmed; NOT same team as 1663)
UPDATE contacts SET
  address = '702-2210 Prince of Wales Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: since ~July 2024 shows as "VP, Pinnacle Advisor Growth & Development" at IPC (a corporate HQ role, not client-facing) and is absent from the public advisor directory — continued client-facing status uncertain, needs manual verification.')), 512)
WHERE id = 1664;

-- 1285 Keith Matthews, Tulett, Matthews & Associates, Kirkland, QC
UPDATE contacts SET address = '3535 St-Charles Blvd., Suite 703' WHERE id = 1285;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1285, x.name, x.role FROM (
  SELECT 'Donald (Don) Tulett' AS name, 'Partner and Portfolio Manager' AS role
  UNION ALL SELECT 'Ruben Antoine', 'Portfolio Manager'
  UNION ALL SELECT 'Julie Desrosiers', 'Associate Portfolio Manager (CIM)'
  UNION ALL SELECT 'Edmond Fhima', 'Senior Financial Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1285)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1285 AND name = x.name);

-- 1467 Darcie Crowe, CG Wealth Management / Canaccord Genuity (Crowe Private Wealth), Vancouver, BC
UPDATE contacts SET address = '1133 Melville St, Suite 1200' WHERE id = 1467;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1467, x.name, x.role FROM (
  SELECT 'Kellyanne Yep' AS name, 'Associate Portfolio Manager & Investment Advisor' AS role
  UNION ALL SELECT 'Morgan Steele, CFA', 'Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1467)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1467 AND name = x.name);

-- 1261 Colin Ryan, Wellington-Altus Private Wealth, Winnipeg, MB (address only — no team confirmed)
UPDATE contacts SET address = '201 Portage Ave, Suites 300 & 2500' WHERE id = 1261;

-- 1364 Shawn Veroba, NBF Wealth Management (Veroba Dutcheshen Advisory Group), Yorkton, SK
UPDATE contacts SET address = '89 Broadway Street West' WHERE id = 1364;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1364, x.name, x.role FROM (
  SELECT 'David Dutcheshen' AS name, 'Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Penny Sandercock', 'Senior Wealth Associate'
  UNION ALL SELECT 'Darrel Young', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1364)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1364 AND name = x.name);

-- 1742 Stephen Roster, ScotiaMcLeod, Ottawa, ON
UPDATE contacts SET address = '350 Albert St., Suite 2100' WHERE id = 1742;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1742, x.name, x.role FROM (
  SELECT 'Kris Casey' AS name, 'Senior Associate' AS role
  UNION ALL SELECT 'Jacob Cuffley', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1742)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1742 AND name = x.name);

-- 1229 Stephen Noseworthy, TD Wealth Private Investment Advice, St. John's, NL (address only — no team confirmed)
UPDATE contacts SET address = '140 Water Street, 8th Floor' WHERE id = 1229;

-- 1645 Kevin Punshon, CIBC Wood Gundy (Punshon Fleming Financial Group), Regina, SK
UPDATE contacts SET address = '1801 Hamilton Street, Suite 420' WHERE id = 1645;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1645, x.name, x.role FROM (
  SELECT 'Shawn Fleming' AS name, 'Wealth Advisor (CIM, FCSI)' AS role
  UNION ALL SELECT 'Shoieb (Steve) Abdullah', 'Financial Associate'
  UNION ALL SELECT 'Stephanie Taylor', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1645)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1645 AND name = x.name);

-- 1365 Donna Schneider, NBF Wealth Management (Schneider Financial Group), Regina, SK
UPDATE contacts SET address = '2075 Prince of Wales Dr., Suite 305' WHERE id = 1365;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1365, x.name, x.role FROM (
  SELECT 'Stephanie Schneider' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Dallas Smith', 'Wealth Advisor'
  UNION ALL SELECT 'Komal Soni', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1365)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1365 AND name = x.name);

-- 1702 Brian Steele, Raymond James (Steele Wealth Management), Waterloo, ON (address only — no team confirmed)
UPDATE contacts SET address = '595 Parkside Drive, Unit 1' WHERE id = 1702;

-- 1694 Chad Woolsey, Raymond James, Saskatoon, SK
UPDATE contacts SET
  address = '122–1st Avenue South, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: a June 2025 LinkedIn post stated he was retiring at the end of 2025 — not independently confirmed on a current roster; needs manual verification.')), 512)
WHERE id = 1694;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1694, x.name, x.role FROM (
  SELECT 'Mike Reimer' AS name, 'Financial Advisor' AS role
  UNION ALL SELECT 'Terry McBride', 'Tax & Estate Planning'
  UNION ALL SELECT 'Tammie Atchison', 'Senior Wealth Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1694)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1694 AND name = x.name);

-- 1379 Emmanuel Moreau, NBF Wealth Management (Meridiem Financial Group), Brossard, QC
UPDATE contacts SET address = '1040, rue du Lux, Bureau 710' WHERE id = 1379;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1379, x.name, x.role FROM (
  SELECT 'Richard Dumont' AS name, 'Wealth Management Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Benoit Moreau', 'Senior Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Roger Damiens', 'Wealth Advisor & Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1379)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1379 AND name = x.name);

-- 1611 Hart Pollack, CIBC Wood Gundy (Pollack Braun Blatt), Winnipeg, MB
UPDATE contacts SET address = '1 Lombard Place, 20th Floor, Suite 2000' WHERE id = 1611;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1611, x.name, x.role FROM (
  SELECT 'Jason Braun' AS name, 'Senior Wealth Advisor, FCSI, CIM, PFP, B.Comm' AS role
  UNION ALL SELECT 'Joshua P. Blatt', 'Wealth Advisor, CPA, CA'
  UNION ALL SELECT 'Sheila Balasko', 'Financial Associate / Team Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1611)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1611 AND name = x.name);
