-- Batch 11 of GTA "advisor team" enrichment (18 more contacts, same
-- methodology as migrations 009-018). One contact is skipped entirely this
-- round, a confirmed employer change:
--
--   1254 John De Goey — left Wellington-Altus Private Wealth for Designed
--     Wealth Management in early 2023 (Wealth Professional, Oct 2023
--     article; corroborated by ZoomInfo and LinkedIn). CRM's firm field is
--     stale, so nothing is applied here — flag for manual review.
--
-- 1512 Adam Fenech and 1519 Jordan Winter are both separate CRM contacts on
-- the same team (BMO Nesbitt Burns "Winter Fenech Group", Oakville) —
-- each one's INSERT lists the other as a colleague, per the recurring
-- shared-team-pair pattern.
--
-- 1329 "Ullman Wealth Management Team" is itself the CRM contact's name
-- (not an individual) — its founder Lawrence Ullman and full leadership
-- team are recorded as contact_people.
--
-- Shared-building notes: 1265 Laura Allpress (Wellington-Altus, Burlington)
-- is at the identical suite as batch10's 1274 Brian Schofield — same
-- building/suite, unclear if same practice or two independent ones sharing
-- space, noted for awareness. 1517 Tara Kelly (BMO Nesbitt Burns, Oakville)
-- is at 360 Oakville Place Drive, 2nd Floor along with 1512/1519 this
-- batch and 1509/1536 from earlier batches — confirms that floor now hosts
-- (at least) four independent BMO teams, as flagged in batch10. 1330
-- Andrew Porteous and 1331 Bill Vastis (both RBC Dominion Securities,
-- Toronto) share 200 Bay Street, 25th Floor — independent teams, same
-- recurring RBC Royal Bank Plaza floor noted since batch7.
--
-- 1659 John Klotz: sources list his firm as "IPC Investment Corp" (mutual
-- fund dealer) vs CRM's "IPC Securities" (IIROC dealer) — possible entity
-- mismatch, flagged but not acted on, same as batch10's John Klotz-style
-- note precedent. 1662 John Soutsos: suite number could not be confirmed
-- across sources (conflicting historical references), so only the
-- building-level address is applied.

-- 1679 JoAnne Anderson, Raymond James (MoneyPower Group), Mississauga
UPDATE contacts SET address = '4263 Sherwoodtowne Blvd, Suite 200' WHERE id = 1679;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1679, x.name, x.role FROM (
  SELECT 'Stephen Gibson' AS name, 'Financial Advisor' AS role
  UNION ALL SELECT 'Justin Johnston', 'Associate Financial Advisor and Associate Portfolio Manager'
  UNION ALL SELECT 'Joani Williams', 'Branch Administrator'
  UNION ALL SELECT 'Krzysztof Podolski', 'Associate Financial Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1679)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1679 AND name = x.name);

-- 1503 Jason Nakhoul, Manulife Securities (now Manulife Wealth Inc., Salus Wealth), Oakville (address only)
UPDATE contacts SET address = '200A-2010 Winston Park Drive' WHERE id = 1503;

-- 1326 Jennifer Watson, Aligned Capital Partners (Watson Investments/Securities), Oakville
UPDATE contacts SET address = '220 Randall Street' WHERE id = 1326;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1326, x.name, x.role FROM (
  SELECT 'Peter Watson' AS name, 'Founder / Investment Advisor' AS role
  UNION ALL SELECT 'David Granik', 'Wealth Manager'
  UNION ALL SELECT 'Kathryn Teichroew', 'Wealth Manager'
  UNION ALL SELECT 'Jake Clark', 'Wealth Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1326)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1326 AND name = x.name);

-- 1297 J Scott Tomenson, High Rock Capital Management, Toronto
UPDATE contacts SET address = '1 Toronto St, Suite 210' WHERE id = 1297;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1297, x.name, x.role FROM (
  SELECT 'Paul Tepsich' AS name, 'Founder, Managing Partner, Portfolio Manager' AS role
  UNION ALL SELECT 'Dianne Leckie', 'Senior Client Service Representative & Manager, Compliance'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1297)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1297 AND name = x.name);

-- 1660 Shelley Johnston, IPC Securities (The Pension Specialists), Whitby
UPDATE contacts SET address = '604 Brock Street South' WHERE id = 1660;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1660, x.name, x.role FROM (
  SELECT 'Ian Burns' AS name, 'Managing/Business Partner' AS role
  UNION ALL SELECT 'Michael Leonardelli', 'Wealth Advisor'
  UNION ALL SELECT 'Sandra Leonardelli', 'Financial Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1660)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1660 AND name = x.name);

-- 1265 Laura Allpress, Wellington-Altus Private Wealth, Burlington — same
-- suite as batch10's 1274 Brian Schofield, see note above
UPDATE contacts SET address = '3455 North Service Road, Suite 300' WHERE id = 1265;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1265, 'Jessica Allpress', 'Senior Investment Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1265)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1265 AND name = 'Jessica Allpress');

-- 1614 Patrick Ross, CIBC Wood Gundy, Toronto (address only)
UPDATE contacts SET address = '200 King Street West, 8th Floor' WHERE id = 1614;

-- 1254 John De Goey — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: confirmed departure from Wellington-Altus Private Wealth to
-- Designed Wealth Management (early 2023).

-- 1512 Adam Fenech + 1519 Jordan Winter, BMO Nesbitt Burns (Winter Fenech
-- Group), Oakville — same team, both CRM contacts, see note above
UPDATE contacts SET address = '360 Oakville Place Drive, 2nd Floor' WHERE id IN (1512, 1519);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1512, 'Jordan Winter', 'Portfolio Manager, co-lead'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1512)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1512 AND name = 'Jordan Winter');
INSERT INTO contact_people (contact_id, name, role)
SELECT 1519, 'Adam Fenech', 'Investment Advisor, co-founder/partner'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1519)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1519 AND name = 'Adam Fenech');

-- 1822 Chris Poole, Sun Life (CWP Financial Services), Toronto
UPDATE contacts SET address = '1 Yonge Street, Suite 109' WHERE id = 1822;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1822, x.name, x.role FROM (
  SELECT 'Trevor Theobald' AS name, 'Financial Planner' AS role
  UNION ALL SELECT 'Stan Chait', 'Financial Planner'
  UNION ALL SELECT 'Richard Bell', 'Financial Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1822)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1822 AND name = x.name);

-- 1331 Bill Vastis, RBC Dominion Securities, Toronto — see shared-building
-- note above (200 Bay Street, with 1330 Andrew Porteous)
UPDATE contacts SET address = '200 Bay St, 25th Floor' WHERE id = 1331;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1331, 'Sydney Lee', 'Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1331)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1331 AND name = 'Sydney Lee');

-- 1517 Tara Kelly, BMO Nesbitt Burns (Kelly Strutt team), Oakville — see
-- shared-building note above (360 Oakville Place Drive, 2nd Floor)
UPDATE contacts SET address = '360 Oakville Place Drive, 2nd Floor' WHERE id = 1517;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1517, 'Warren Strutt', 'Senior Investment Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1517)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1517 AND name = 'Warren Strutt');

-- 1329 Ullman Wealth Management Team, Toronto — CRM contact name is the
-- firm/team itself; recording the full leadership team, led by founder
-- Lawrence Ullman
UPDATE contacts SET address = '135 Yorkville Avenue, Suite 405' WHERE id = 1329;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1329, x.name, x.role FROM (
  SELECT 'Lawrence Ullman' AS name, 'Founder, CEO & CIO' AS role
  UNION ALL SELECT 'Steven Harris', 'President & COO'
  UNION ALL SELECT 'Marlon Rosenberg', 'EVP, Client Wealth Management'
  UNION ALL SELECT 'Mark Goodfield', 'Taxation and Estates Consultant'
  UNION ALL SELECT 'Craig McGee', 'Senior Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1329)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1329 AND name = x.name);

-- 1330 Andrew Porteous, RBC Dominion Securities, Toronto (address only; see
-- shared-building note above)
UPDATE contacts SET address = '200 Bay Street, 25th Floor' WHERE id = 1330;

-- 1719 Mark Shimkovitz, Raymond James (Living Richer Wealth Management), Toronto
UPDATE contacts SET address = '40 King St W, Suite 5300' WHERE id = 1719;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1719, x.name, x.role FROM (
  SELECT 'Robin Shimkovitz' AS name, 'Business Development Specialist' AS role
  UNION ALL SELECT 'Carolina da Silva', 'Senior Wealth Advisor Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1719)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1719 AND name = x.name);

-- 1659 John Klotz, IPC Securities (Northwood Financial), Markham (address
-- only; see entity-name note above)
UPDATE contacts SET address = '7676 Woodbine Avenue, Suite 300' WHERE id = 1659;

-- 1662 John Soutsos, IPC Securities (Med-Wealth Financial Services), Mississauga
-- (suite number omitted, see note above)
UPDATE contacts SET address = '10 Kingsbridge Garden Circle' WHERE id = 1662;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1662, 'Alexander Soutsos', 'Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1662)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1662 AND name = 'Alexander Soutsos');
