-- Batch 12 of GTA "advisor team" enrichment (18 more contacts, same
-- methodology as migrations 009-019). Three contacts are skipped entirely
-- this round:
--
--   1740 Neil Stratton — confirmed departure from ScotiaMcLeod to JC Clark
--     Ltd as Portfolio Manager of the JC Clark High Income Opportunities
--     Fund (GlobeNewswire press release, April 23 2025, after 28 years at
--     ScotiaMcLeod). CRM's firm field is stale.
--   1790 Stuart Smith — unresolved identity ambiguity. Two distinct
--     ScotiaMcLeod Toronto advisors share this exact name: Stuart T. Smith
--     (40 King St W, 49th Floor, Smith Advisory Group / Hamdy Smith Group)
--     and Stuart M.C. Smith (40 King St W, 50th Floor, Smith McKay
--     Financial Management Team). No way to confirm which one is this CRM
--     contact from name/city/firm alone — flagged for manual review.
--   1336 Chanel Lawrence — confirmed departure from RBC Dominion
--     Securities to Wellington-Altus Private Wealth (Rosedale Family
--     Office), now an Associate Investment Advisor there. CRM's firm field
--     is stale.
--
-- 200 Bay Street, 25th Floor (Royal Bank Plaza, South Tower) turns out to
-- be an enormous RBC Dominion Securities floor hosting many independent
-- teams — consistent with the 1330/1331 note from batch11. This batch adds:
-- Minuk Wealth Management (1335), George Manjgaladze Wealth Management
-- (1339), Elizabeth Hunter (1341), Ronan Clohissey Wealth Management Group
-- / Sandler Wealth Management Group (1346, 1347 — Clohissey recently split
-- off from Sandler's team after ~10 years, a reorg not a departure), Weber
-- Wealth Partners (1351), Blackman Wealth Management Group (1352), Celej
-- Wealth Management (1334, 1348), The Harbour Group (1337, 1340, 1350),
-- and unteamed advisors David Clark (1332) and Brian Martin (1333).
--
-- Two associates, Karen Lacson and Lujia Lei, surfaced identically for
-- both 1335 Murray Minuk's and 1339 George Manjgaladze's teams — possibly
-- a shared support pool on this large floor, or search-snippet
-- cross-contamination between two separate RBC directory listings; included
-- with a note on both, flagged for manual review.
--
-- 1334 Nastassja Celej and 1348 Martine A. Celej are both separate CRM
-- contacts on the same team ("Celej Wealth Management") — each one's
-- INSERT lists the other as a colleague, per the recurring shared-team-pair
-- pattern.
--
-- 1337 Chris Newall, 1340 Graeme MacGregor, and 1350 Peter Coward are three
-- of four partners of "The Harbour Group" (RBC Dominion Securities) who
-- are each separate CRM contacts — the fourth partner, John Grant, is
-- contact_id 1353 and will be resolved in the next (final) batch. Each of
-- these three INSERTs lists the other partners plus the shared associates
-- (Robin Gullason, George Little, Leora Epelbaum), never themselves.
--
-- 1342 Ted Conrod (Focus Wealth Management) is flagged in the CRM as a
-- "generic media/IR inbox" contact, but independent research confirms a
-- real, active firm and team — applied as usual.

-- 1332 David Clark, RBC Dominion Securities, Toronto (address only)
UPDATE contacts SET address = '200 Bay Street, 25th Floor' WHERE id = 1332;

-- 1333 Brian Martin, RBC Dominion Securities, Toronto (address only)
UPDATE contacts SET address = '200 Bay Street, 25th Floor' WHERE id = 1333;

-- 1334 Nastassja Celej + 1348 Martine A. Celej, RBC Dominion Securities
-- (Celej Wealth Management), Toronto — same team, both CRM contacts
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id IN (1334, 1348);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1334, x.name, x.role FROM (
  SELECT 'Martine A. Celej' AS name, 'Senior Portfolio Manager & Investment Advisor' AS role
  UNION ALL SELECT 'Jesse Carr', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1334)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1334 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1348, 'Nastassja Celej', 'Wealth & Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1348)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1348 AND name = 'Nastassja Celej');

-- 1335 Murray Minuk, RBC Dominion Securities (Minuk Wealth Management), Toronto
UPDATE contacts SET address = '200 Bay Street, Suite 2500A' WHERE id = 1335;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1335, x.name, x.role FROM (
  SELECT 'Karen Lacson' AS name, 'Associate (possible shared-floor resource, see note above)' AS role
  UNION ALL SELECT 'Lujia Lei', 'Associate (possible shared-floor resource, see note above)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1335)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1335 AND name = x.name);

-- 1337 Chris Newall, RBC Dominion Securities (The Harbour Group), Toronto
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1337;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1337, x.name, x.role FROM (
  SELECT 'Graeme MacGregor' AS name, 'Senior Portfolio Manager & Wealth Advisor, Partner' AS role
  UNION ALL SELECT 'Peter Coward', 'Senior Investment Advisor, Partner'
  UNION ALL SELECT 'John Grant', 'Senior Portfolio Manager & Wealth Advisor (CFA), Partner'
  UNION ALL SELECT 'Robin Gullason', 'Lead Strategist'
  UNION ALL SELECT 'George Little', 'Associate Advisor'
  UNION ALL SELECT 'Leora Epelbaum', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1337)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1337 AND name = x.name);

-- 1339 George Manjgaladze, RBC Dominion Securities, Toronto
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1339;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1339, x.name, x.role FROM (
  SELECT 'Karen Lacson' AS name, 'Associate (possible shared-floor resource, see note above)' AS role
  UNION ALL SELECT 'Lujia Lei', 'Associate (possible shared-floor resource, see note above)'
  UNION ALL SELECT 'Sarah Ngo', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1339)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1339 AND name = x.name);

-- 1340 Graeme MacGregor, RBC Dominion Securities (The Harbour Group), Toronto
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1340;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1340, x.name, x.role FROM (
  SELECT 'Chris Newall' AS name, 'Senior Portfolio Manager, Partner' AS role
  UNION ALL SELECT 'Peter Coward', 'Senior Investment Advisor, Partner'
  UNION ALL SELECT 'John Grant', 'Senior Portfolio Manager & Wealth Advisor (CFA), Partner'
  UNION ALL SELECT 'Robin Gullason', 'Lead Strategist'
  UNION ALL SELECT 'George Little', 'Associate Advisor'
  UNION ALL SELECT 'Leora Epelbaum', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1340)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1340 AND name = x.name);

-- 1341 Elizabeth (Libby) Hunter, RBC Dominion Securities, Toronto
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1341;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1341, 'Amanda Rushton', 'Associate Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1341)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1341 AND name = 'Amanda Rushton');

-- 1342 Ted Conrod, Focus Wealth Management, Toronto
UPDATE contacts SET address = '200 King Street West, Suite 610, Box 69' WHERE id = 1342;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1342, x.name, x.role FROM (
  SELECT 'James Stellick' AS name, 'Managing Director, Client Advisory' AS role
  UNION ALL SELECT 'Greg Thompson', 'Executive Chairman'
  UNION ALL SELECT 'Don Cranston', 'Vice Chair, Client Advisory'
  UNION ALL SELECT 'Alexander MacDonald', 'Portfolio Manager'
  UNION ALL SELECT 'Michael Kosmalski', 'Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1342)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1342 AND name = x.name);

-- 1346 Ronan Clohissey, RBC Dominion Securities (Ronan Clohissey Wealth
-- Management Group), Toronto
UPDATE contacts SET address = '200 Bay Street, 25th Floor' WHERE id = 1346;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1346, x.name, x.role FROM (
  SELECT 'Gary H. Tsang' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Steve James', 'Senior Associate'
  UNION ALL SELECT 'Joshua Orr', 'Associate Advisor'
  UNION ALL SELECT 'Amalia Pontikos', 'Client Experience Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1346)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1346 AND name = x.name);

-- 1347 Scott Sandler, RBC Dominion Securities (Sandler Wealth Management
-- Group), Toronto
UPDATE contacts SET address = '200 Bay Street, 25th Floor' WHERE id = 1347;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1347, x.name, x.role FROM (
  SELECT 'Michelle Noel-Smith' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Jonah Kates', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1347)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1347 AND name = x.name);

-- 1350 Peter Coward, RBC Dominion Securities (The Harbour Group), Toronto
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1350;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1350, x.name, x.role FROM (
  SELECT 'Chris Newall' AS name, 'Senior Portfolio Manager, Partner' AS role
  UNION ALL SELECT 'Graeme MacGregor', 'Senior Portfolio Manager & Wealth Advisor, Partner'
  UNION ALL SELECT 'John Grant', 'Senior Portfolio Manager & Wealth Advisor (CFA), Partner'
  UNION ALL SELECT 'Robin Gullason', 'Lead Strategist'
  UNION ALL SELECT 'George Little', 'Associate Advisor'
  UNION ALL SELECT 'Leora Epelbaum', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1350)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1350 AND name = x.name);

-- 1351 Michael Weber, RBC Dominion Securities (Weber Wealth Partners), Toronto (address only)
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1351;

-- 1352 Lucas Paulino, RBC Dominion Securities (Blackman Wealth Management
-- Group), Toronto
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1352;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1352, 'Mark Blackman', 'Senior Portfolio Manager, team lead'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1352)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1352 AND name = 'Mark Blackman');

-- 1336 Chanel Lawrence — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: confirmed departure from RBC Dominion Securities to Wellington-
-- Altus Private Wealth (Rosedale Family Office).

-- 1740 Neil Stratton — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: confirmed departure from ScotiaMcLeod to JC Clark Ltd (April 2025).

-- 1790 Stuart Smith — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: unresolved identity ambiguity between two same-named ScotiaMcLeod
-- Toronto advisors.
