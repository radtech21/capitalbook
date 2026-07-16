-- Batch 13 (FINAL) of GTA "advisor team" enrichment — the last 10 contacts
-- of the 206-contact GTA Financial Advisor segment, completing the effort
-- started in migration 009. Same methodology as migrations 009-020.
--
-- No contacts are skipped entirely this round, but three carry flags worth
-- noting for manual review:
--
--   1497 Funding matters Inc — a real, active Toronto firm (est. 1997,
--     founder William "Bill" Petruck), but it's a philanthropic/charitable-
--     giving advisory practice, not a wealth-management firm. The CRM's
--     "Financial Advisor" segment tag is likely a miscategorization —
--     applying the confirmed address/contact anyway since the entity and
--     person are real.
--   1573 Chronicle Wealth Team — despite the CRM's "generic media/IR
--     inbox" data flag, this is a real, active independent multi-family
--     office (~$800M+ AUM, founded 2018) with a confirmed 3-person
--     leadership team. The flag appears mismatched to this entity.
--   1666 Bill Moir — a real named individual at Prime Quadrant, but as an
--     Advisory Board member (former Tim Hortons Chief Brand/Marketing
--     Officer, retired ~2014), not an active staff financial advisor.
--     CRM's "Financial Advisor" segment tag likely doesn't fit his actual
--     role — applying the firm's confirmed team roster anyway.
--
-- 1353 John Grant is the fourth and final partner of "The Harbour Group"
-- (RBC Dominion Securities, 200 Bay St, 25th Floor, Toronto) — the other
-- three (Chris Newall, Graeme MacGregor, Peter Coward) were resolved in
-- batch12 (migration 020). This completes that shared-team-quad.
--
-- 1478 Harjinder Sahota, 1494 Boyd Hume, 1495 David Armstrong, and 1496
-- Chris Vaughn are four independent Manulife Wealth Inc. advisors who all
-- share the firm's Toronto corporate office address (79 Wellington Street
-- West, Suite 2402) — consistent with the shared-building/independent-
-- practice pattern seen throughout this project.

-- 1353 John Grant, RBC Dominion Securities (The Harbour Group), Toronto
UPDATE contacts SET address = '200 Bay Street, 25th Floor' WHERE id = 1353;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1353, x.name, x.role FROM (
  SELECT 'Chris Newall' AS name, 'Senior Portfolio Manager, Partner' AS role
  UNION ALL SELECT 'Graeme MacGregor', 'Senior Portfolio Manager & Wealth Advisor, Partner'
  UNION ALL SELECT 'Peter Coward', 'Senior Investment Advisor, Partner'
  UNION ALL SELECT 'Robin Gullason', 'Lead Strategist'
  UNION ALL SELECT 'George Little', 'Associate Advisor'
  UNION ALL SELECT 'Leora Epelbaum', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1353)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1353 AND name = x.name);

-- 1478 Harjinder S. Sahota, Manulife Wealth Inc, Toronto (address only)
UPDATE contacts SET address = '79 Wellington Street West, Suite 2402' WHERE id = 1478;

-- 1494 Boyd M. Hume, Manulife Wealth Inc, Toronto (address only)
UPDATE contacts SET address = '79 Wellington Street West, Suite 2402' WHERE id = 1494;

-- 1495 David Armstrong, Manulife Wealth Inc, Toronto (address only)
UPDATE contacts SET address = '79 Wellington Street West, Suite 2402' WHERE id = 1495;

-- 1496 Chris S. Vaughn (firm spells "Vaughan"), Manulife Wealth Inc, Toronto (address only)
UPDATE contacts SET address = '79 Wellington Street West, Suite 2402' WHERE id = 1496;

-- 1497 Funding matters Inc, Toronto — see note above on likely segment miscategorization
UPDATE contacts SET address = '333 Dundas Street E' WHERE id = 1497;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1497, 'William "Bill" Petruck', 'Founder, President and CEO'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1497)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1497 AND name = 'William "Bill" Petruck');

-- 1573 Chronicle Wealth Team, Toronto — see note above on "generic inbox" flag mismatch
UPDATE contacts SET address = '2 Sheppard Avenue East, Suite 1515' WHERE id = 1573;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1573, x.name, x.role FROM (
  SELECT 'Andrew Guilfoyle' AS name, 'Co-Founder & Wealth Advisor' AS role
  UNION ALL SELECT 'Adam Shapiro', 'Co-Founder & Wealth Advisor'
  UNION ALL SELECT 'Brian McKenzie', 'Partner & Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1573)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1573 AND name = x.name);

-- 1658 Garnet Anderson, Tacita Capital, Toronto
UPDATE contacts SET address = 'Suite 2020, 150 King St W' WHERE id = 1658;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1658, x.name, x.role FROM (
  SELECT 'Michael Nairne' AS name, 'President and Chief Investment Officer' AS role
  UNION ALL SELECT 'Joanne Swystun', 'Vice President, Head of Wealth Planning'
  UNION ALL SELECT 'Harmish Naik', 'Senior Portfolio Manager'
  UNION ALL SELECT 'James Nairne', 'Senior Portfolio Manager'
  UNION ALL SELECT 'Vishesh Udeshi', 'Portfolio Management Analyst'
  UNION ALL SELECT 'Brian So', 'Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1658)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1658 AND name = x.name);

-- 1666 Bill Moir, Prime Quadrant, Toronto — see note above (Advisory Board member)
UPDATE contacts SET address = '2 St. Clair Ave W, Suite 2101' WHERE id = 1666;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1666, x.name, x.role FROM (
  SELECT 'Mo Lidsky' AS name, 'Chairman and CEO' AS role
  UNION ALL SELECT 'Peter Fink', 'Managing Consultant'
  UNION ALL SELECT 'Nancy Marshall', 'Managing Consultant & Head of Family Office Solutions'
  UNION ALL SELECT 'Andrew Doman', 'Chief Operating Officer'
  UNION ALL SELECT 'Mark Roth', 'Chief Compliance Officer & Chief Risk Officer'
  UNION ALL SELECT 'Alex Da Costa', 'Chief Investment Strategist'
  UNION ALL SELECT 'Jeremy Levy', 'Chief Growth Officer'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1666)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1666 AND name = x.name);

-- 1812 Tavinder Malhotra, Mansha Plan, Toronto
UPDATE contacts SET address = 'Suite 202, 47 Colborne St' WHERE id = 1812;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1812, x.name, x.role FROM (
  SELECT 'Jagneet Malhotra' AS name, 'Chief Executive Officer' AS role
  UNION ALL SELECT 'Hardi Anand', 'Chief Operating Officer'
  UNION ALL SELECT 'Frank Shahrokhi', 'Vice President, Group Benefits'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1812)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1812 AND name = x.name);
