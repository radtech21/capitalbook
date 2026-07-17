-- Batch 3 of "rest of Canada" advisor team/address enrichment (18
-- contacts, same methodology as migrations 027-028). One contact is
-- skipped entirely this round:
--
--   1267 Craig Baun (Wellington-Altus Private Wealth, Calgary) — confirmed
--     deceased, per Wellington-Altus's own official statement (June 19,
--     2026, "more than 25 years" in the industry). His team ("Baun &
--     Pate Investment Group," rebranded to "Aspire Wealth Partners" in
--     Aug 2025, before his death) continues under co-lead Michael Pate.
--     Same treatment as 1760 Allan McGlade in migration 022: marked
--     unreachable with a data_flags note rather than silently reassigned
--     or address/team data applied — needs a human decision on whether to
--     archive and/or add Michael Pate as a new contact.
--
-- 1623 Oliver Gilbert and 1639 Jeff Watchorn are two separate CRM contacts
-- on the same joint CIBC Wood Gundy Vancouver practice ("Jeff Watchorn &
-- Oliver Gilbert") — each lists the other plus shared staff.
--
-- 1531 Jason Armstrong and 1533 Devin Antony are two separate CRM
-- contacts on the same joint BMO Nesbitt Burns Calgary practice
-- ("Armstrong Antony Wealth Management") — each lists the other.
--
-- 1511 Cameron McLean and 1527 Philip Harland are two separate CRM
-- contacts on the same BMO Nesbitt Burns Vancouver team ("McLean Harland
-- Wealth Management") — each lists the other plus shared staff. This also
-- resolves 1527's CRM city (was "North Vancouver," corrected to
-- Vancouver) since the confirmed office is 2102 West 41st Avenue,
-- Kerrisdale, Vancouver.
--
-- Two more shared-building notes: 1811 Ross Turnbull is a fourth
-- independent Odlum Brown team at 250 Howe St, Suite 1100, Vancouver
-- (joining 1802, 1810, 1815 from earlier batches). 1654 David Kamitakahara
-- is a second independent CIBC Wood Gundy team at 500 Centre Street SE,
-- 27th Floor, Calgary (alongside 1581 Wade Kozak).

-- 1811 Ross Turnbull, Odlum Brown (Burrard Investment Management), Vancouver
UPDATE contacts SET address = 'Suite 1100, 250 Howe Street' WHERE id = 1811;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1811, x.name, x.role FROM (
  SELECT 'Christopher Lowe' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Diana Ruse', 'Financial Planner'
  UNION ALL SELECT 'Jessica Lidder', 'Investment Assistant'
  UNION ALL SELECT 'Angela Chan', 'Investment Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1811)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1811 AND name = x.name);

-- 1643 Richard Jule, CIBC Wood Gundy, Regina
UPDATE contacts SET address = '1801 Hamilton Street, Suite 420' WHERE id = 1643;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1643, x.name, x.role FROM (
  SELECT 'Kavan Kamboz' AS name, 'Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Eric Beattie', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1643)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1643 AND name = x.name);

-- 1623 Oliver Gilbert + 1639 Jeff Watchorn, CIBC Wood Gundy, Vancouver —
-- same joint practice, both CRM contacts
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id IN (1623, 1639);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1623, x.name, x.role FROM (
  SELECT 'Jeff Watchorn' AS name, 'Investment Advisor & Vice President' AS role
  UNION ALL SELECT 'Will (William) Dennis', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1623)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1623 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1639, x.name, x.role FROM (
  SELECT 'Oliver Gilbert' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Will (William) Dennis', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1639)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1639 AND name = x.name);

-- 1654 David Kamitakahara, CIBC Wood Gundy (Kamitakahara Investment
-- Team), Calgary — same building as 1581 Wade Kozak, independent team
UPDATE contacts SET address = '500 Centre Street SE, 27th Floor' WHERE id = 1654;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1654, x.name, x.role FROM (
  SELECT 'Dan Di Stefano' AS name, 'Investment Advisor, First Vice-President' AS role
  UNION ALL SELECT 'William Hesson', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1654)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1654 AND name = x.name);

-- 1795 Rob Gray, ScotiaMcLeod (Panorama Advisory Group, formerly Rob Gray
-- Asset Management, renamed April 2023), Calgary
UPDATE contacts SET address = '225 6th Avenue Southwest, Suite 1700' WHERE id = 1795;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1795, x.name, x.role FROM (
  SELECT 'Jamie Snow' AS name, 'Team Lead & Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Kurtis Wagner', 'Portfolio Manager'
  UNION ALL SELECT 'Byron Nelson', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Chris Courtice', 'Wealth Advisor and Portfolio Manager'
  UNION ALL SELECT 'Maddalena Marchese', 'Director, Scotia Wealth Insurance Services'
  UNION ALL SELECT 'Maegan Allan', 'Administrative Support Assistant'
  UNION ALL SELECT 'Brielle Howden', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1795)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1795 AND name = x.name);

-- 1642 Marvin Schmidt, CIBC Wood Gundy (Schmidt Family Office, formerly
-- The Schmidt Investment Group, renamed Jan 2026), Edmonton
UPDATE contacts SET address = 'Suite 1800, 10180 - 101 Street' WHERE id = 1642;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1642, x.name, x.role FROM (
  SELECT 'Nigel Seth' AS name, 'Senior Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Christine Skoreyko', 'Senior Executive Assistant'
  UNION ALL SELECT 'Joanne Miechowicz', 'Investment Associate'
  UNION ALL SELECT 'Liam Belas', 'Shared Executive Assistant'
  UNION ALL SELECT 'Jaja Cruz', 'Client Associate'
  UNION ALL SELECT 'Celine Hunke', 'Administrative Assistant'
  UNION ALL SELECT 'Alexis Myschuk', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1642)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1642 AND name = x.name);

-- 1511 Cameron McLean + 1527 Philip Harland, BMO Nesbitt Burns (McLean
-- Harland Wealth Management), Vancouver — same team, both CRM contacts.
-- 1527's city corrected from "North Vancouver" to Vancouver.
UPDATE contacts SET city = 'Vancouver', address = '2102 West 41st Avenue' WHERE id IN (1511, 1527);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1511, x.name, x.role FROM (
  SELECT 'Philip Harland' AS name, 'Portfolio Manager and Senior Investment Advisor' AS role
  UNION ALL SELECT 'Carie Mak', 'Client Services Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1511)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1511 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1527, x.name, x.role FROM (
  SELECT 'Cameron McLean' AS name, 'Senior Wealth Advisor / Investment Advisor' AS role
  UNION ALL SELECT 'Carie Mak', 'Client Services Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1527)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1527 AND name = x.name);

-- 1531 Jason Armstrong + 1533 Devin Antony, BMO Nesbitt Burns (Armstrong
-- Antony Wealth Management), Calgary — same team, both CRM contacts
UPDATE contacts SET address = '525 8 Ave SW, Suite 1000' WHERE id IN (1531, 1533);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1531, 'Devin Antony', 'Senior Portfolio Manager / Senior Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1531)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1531 AND name = 'Devin Antony');
INSERT INTO contact_people (contact_id, name, role)
SELECT 1533, 'Jason Armstrong', 'Lead Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1533)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1533 AND name = 'Jason Armstrong');

-- 1768 Scott Stewart, ScotiaMcLeod (Stewart-Renouf Group), Winnipeg
UPDATE contacts SET address = '242 Hargrave Street, Suite 1400' WHERE id = 1768;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1768, x.name, x.role FROM (
  SELECT 'Geoff Renouf' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Lori Black', 'Portfolio Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1768)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1768 AND name = x.name);

-- 1523 Sean Rourke, BMO Nesbitt Burns, Edmonton
UPDATE contacts SET address = '800 Manulife Place, 10180 - 101 Street' WHERE id = 1523;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1523, x.name, x.role FROM (
  SELECT 'Linda Desnoyer' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Kathy Nham', 'Senior Client Service Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1523)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1523 AND name = x.name);

-- 1617 Stan Clark, CIBC Wood Gundy, Vancouver
UPDATE contacts SET address = '1285 West Pender Street, Suite 400' WHERE id = 1617;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1617, x.name, x.role FROM (
  SELECT 'Michael Chu' AS name, 'Portfolio Manager / Investment Advisor' AS role
  UNION ALL SELECT 'Tom Cowans', 'Senior Portfolio Manager & Wealth Advisor'
  UNION ALL SELECT 'Elaine Loo', 'Portfolio Manager, Wealth Advisor'
  UNION ALL SELECT 'Jocelyn Johansson', 'Associate Portfolio Manager'
  UNION ALL SELECT 'Heather Guzak', 'Associate Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1617)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1617 AND name = x.name);

-- 1448 Rob Tetrault, CG Wealth Management, Winnipeg
UPDATE contacts SET address = '1010-201 Portage Avenue' WHERE id = 1448;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1448, x.name, x.role FROM (
  SELECT 'Jean-Luc Funk' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Adam W. Buss', 'Wealth & Estate Planning Specialist'
  UNION ALL SELECT 'Marc Foidart', 'Associate, Client Services'
  UNION ALL SELECT 'Patrick Labossière', 'Associate, Client Services'
  UNION ALL SELECT 'Gabriel Comeau', 'Wealth & Estate Planning Associate'
  UNION ALL SELECT 'Diego Guzman', 'Business Development Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1448)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1448 AND name = x.name);

-- 1233 Rob Sager, TD Wealth Private Investment Advice (Sager Yandt Wealth
-- Management, formerly Sager Fingland), Waterloo
UPDATE contacts SET address = '412 Albert Street' WHERE id = 1233;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1233, x.name, x.role FROM (
  SELECT 'D. Blair Fingland' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Heidi Yandt', 'Associate Portfolio Manager, Senior Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1233)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1233 AND name = x.name);

-- 1258 Todd Degelman, Wellington-Altus Private Wealth (Degelman Pruden Group), Saskatoon
UPDATE contacts SET address = '410 22nd Street East, Suite 1100' WHERE id = 1258;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1258, x.name, x.role FROM (
  SELECT 'Chad Pruden' AS name, 'Senior Wealth Advisor & Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Noah Degelman', 'Investment Advisor'
  UNION ALL SELECT 'Chris Fryett-Miller', 'Investment Advisor'
  UNION ALL SELECT 'Steven Lam', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1258)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1258 AND name = x.name);

-- 1267 Craig Baun — DELIBERATELY NO ADDRESS/TEAM APPLIED. See note at top
-- of file: confirmed deceased June 2026, needs a human decision.
UPDATE contacts
SET reachable = 0,
    data_flags = TRIM(CONCAT(COALESCE(data_flags, ''),
      CASE WHEN COALESCE(data_flags, '') = '' THEN '' ELSE ' | ' END,
      'DECEASED (per Wellington-Altus official statement, June 19, 2026). Team "Baun & Pate Investment Group" rebranded to "Aspire Wealth Partners" (Aug 2025) continues under co-lead Michael Pate — needs human decision: archive this contact and/or add Michael Pate as a new contact.'))
WHERE id = 1267
  AND data_flags NOT LIKE '%DECEASED%';
