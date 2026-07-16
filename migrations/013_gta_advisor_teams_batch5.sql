-- Batch 5 of GTA "advisor team" enrichment (18 more contacts, same methodology
-- as migrations 009-012, with the employment-status check added in batch 4).
-- Two contacts are skipped entirely this round — a firm merger with layered
-- address/team uncertainty, and a confirmed departure to a different firm:
--
--   1345 Matthew Bacchiochi — his firm (GMG Private Counsel) merged into
--     Cardinal Point Wealth Management (~June 2024). Unlike 1306 below, here
--     BOTH the address (old Bay St. office vs. a possible new Bloor St.
--     office) and the team roster (old "GAVIN" staff vs. current Cardinal
--     Point colleagues) are genuinely unclear, so nothing is applied.
--   1521 Will Simpson — left BMO Nesbitt Burns in 2024 (~14-15 years there)
--     to co-found Aretec Wealth Inc. as President/CIO. Well-corroborated
--     (LEI registry, an Investment Executive industry-moves item). The CRM's
--     firm field is stale; not writing either the old or new address/team
--     since this is a genuine employer change, not a branch move.
--
-- 1306 Tony De Thomasis is a related but different case: his firm was also
-- acquired (by Investment Planning Counsel, closed Dec 2025), but there's no
-- evidence he personally left — same office, same team, new parent company.
-- Applied address + team here, with the acquisition noted for the record.
--
-- Three more pairs are confirmed teammates sharing one CRM-visible team:
-- 1271/1273 (Stonehaven Wealth Management), 1540/1546 (Peebles Martin Wealth
-- Management, whose exact floor number conflicted across sources so only the
-- building address is used), and as usual several unrelated teams turned up
-- sharing the same large downtown floor (not duplicates).

-- 1596 Jeanette Power, CIBC Wood Gundy, Mississauga
UPDATE contacts SET address = '1 City Centre Drive, Suite 1100' WHERE id = 1596;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1596, x.name, x.role FROM (
  SELECT 'Jennifer Savona' AS name, 'Financial Associate' AS role
  UNION ALL SELECT 'Hasan Biyabani', 'Client Associate'
  UNION ALL SELECT 'Sakhil Goel', 'Administrative/Team Support'
  UNION ALL SELECT 'Besy Zoleta', 'Marketing, Social Media & Event Coordination Support'
  UNION ALL SELECT 'Dalvir Bhari', 'Associate Branch Manager'
  UNION ALL SELECT 'Donna Joseph-Quon', 'Branch Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1596)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1596 AND name = x.name);

-- 1631 Lisa Applegath, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '333 Bay St., Suite 2800' WHERE id = 1631;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1631, x.name, x.role FROM (
  SELECT 'Tom Trimble' AS name, 'Investment Advisor / Partner' AS role
  UNION ALL SELECT 'Carter Whitehead', 'Wealth Advisor'
  UNION ALL SELECT 'Maddie Tanzola', 'Private Wealth Management Associate / Junior Client Relationship Manager'
  UNION ALL SELECT 'Mara Draper', 'Team Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1631)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1631 AND name = x.name);

-- 1628 Mark Newsome, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '4110 Yonge Street, Suite 600' WHERE id = 1628;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1628, 'Tyler Newsome', 'Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1628)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1628 AND name = 'Tyler Newsome');

-- 1788 John Taylor, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1788;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1788, 'Julio Cesar D''Alvia Pedro, CFA', 'Investment Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1788)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1788 AND name = 'Julio Cesar D''Alvia Pedro, CFA');

-- 1785 John Hogarth, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '95 St. Clair Avenue West, Suite 1400' WHERE id = 1785;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1785, x.name, x.role FROM (
  SELECT 'Gentian Zhuleku' AS name, 'Investment Associate, Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Behrad Sorkhpar', 'Client Service / Operations'
  UNION ALL SELECT 'Malcolm Burrows', 'Head of Philanthropic Advisory Services'
  UNION ALL SELECT 'Fiona Zhao', 'Insurance Consultant'
  UNION ALL SELECT 'Rylee Moxam', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1785)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1785 AND name = x.name);

-- 1633 Jonathan Kopman, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '4110 Yonge Street, Suite 600' WHERE id = 1633;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1633, x.name, x.role FROM (
  SELECT 'Josh Silver' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Tanya Werger', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1633)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1633 AND name = x.name);

-- 1409 Albert Brandstatter, NBF Wealth Management, Mississauga
UPDATE contacts SET address = '350 Burnhamthorpe Road W, Suite 603' WHERE id = 1409;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1409, 'Rhonda Brown', 'Wealth Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1409)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1409 AND name = 'Rhonda Brown');

-- 1306 Tony De Thomasis, De Thomas Wealth Management, Richmond Hill — firm was
-- acquired by Investment Planning Counsel (closed Dec 2025); no evidence Tony
-- himself left, so address/team applied, but the firm-name change is real
UPDATE contacts SET address = '9033 Leslie Street, Unit 1' WHERE id = 1306;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1306, x.name, x.role FROM (
  SELECT 'Chris Sabey' AS name, 'CFP Wealth Advisor' AS role
  UNION ALL SELECT 'Tracy Parks', 'Financial Advisor'
  UNION ALL SELECT 'Ryan McVeigh', 'Qualified Associate Financial Planner and Elder Planning Counsellor'
  UNION ALL SELECT 'Brandon Barteski', 'Licensed Associate'
  UNION ALL SELECT 'Foster Martens', 'Certified Financial Planner'
  UNION ALL SELECT 'Bruce McCartney', 'Certified Financial Planner'
  UNION ALL SELECT 'Emalee Pauze', 'Certified Financial Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1306)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1306 AND name = x.name);

-- 1629 Lois Smith, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = '333 Bay Street, Suite 2800' WHERE id = 1629;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1629, x.name, x.role FROM (
  SELECT 'Lira Lamaca' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Meredith Mercer', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1629)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1629 AND name = x.name);

-- 1271 Ben Kizemchuk + 1273 Scott Harris — same Wellington-Altus team
-- ("Stonehaven Wealth Management")
UPDATE contacts SET address = '46 Wellington Street East' WHERE id IN (1271, 1273);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, x.name, x.role FROM contacts c, (
  SELECT 'Robb Wismer' AS name, 'Wealth & Estate Planning Advisor' AS role
  UNION ALL SELECT 'Justin Gifford', 'Director of Investments'
  UNION ALL SELECT 'Gayle Shannon', 'Manager of Client Service'
) x
WHERE c.id IN (1271, 1273)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = x.name);

-- 1753 Corrine Spiegel, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '95 St. Clair Avenue West, Suite 1400' WHERE id = 1753;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1753, x.name, x.role FROM (
  SELECT 'David Chaim' AS name, 'Investment Associate / Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Michael Kane', 'Investment Associate / Associate Portfolio Manager'
  UNION ALL SELECT 'Michael Ruby', 'Investment Associate / Associate Portfolio Manager'
  UNION ALL SELECT 'Alex Rochtchine', 'Senior Total Wealth Planner'
  UNION ALL SELECT 'Seth Aronoff', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1753)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1753 AND name = x.name);

-- 1317 Alex Carter, Assante Wealth Management, Toronto (address only)
UPDATE contacts SET address = '21 St. Clair Avenue East, Suite 1105' WHERE id = 1317;

-- 1540 Gabriel Martin + 1546 Ian Peebles — same BMO team ("Peebles Martin
-- Wealth Management"); exact floor conflicted across sources, so only the
-- building address is used
UPDATE contacts SET address = '100 King Street West' WHERE id IN (1540, 1546);

-- 1800 Rod White, ScotiaMcLeod, Burlington
UPDATE contacts SET address = '1005 Skyview Drive, Suite 322' WHERE id = 1800;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1800, x.name, x.role FROM (
  SELECT 'Alex Pogacean' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Mason White', 'Investment Associate'
  UNION ALL SELECT 'Christopher Casalinuovo', 'Senior Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1800)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1800 AND name = x.name);

-- 1345 Matthew Bacchiochi — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: GMG Private Counsel merged into Cardinal Point Wealth Management,
-- with genuine uncertainty on both his current address and current team.

-- 1521 Will Simpson — DELIBERATELY NOTHING APPLIED. See note at top of file:
-- confirmed departure from BMO Nesbitt Burns to Aretec Wealth Inc. in 2024;
-- the CRM's firm field itself needs updating, not just his address.
