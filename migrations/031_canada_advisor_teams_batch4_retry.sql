-- Completes batch 4: the 3 contacts (Charlie/Pasquale Aiello, Brad
-- Hummel, Jerome Bastien) that hit a research-tooling API error in
-- migration 030's run, successfully retried.
--
-- 1579 Brad Hummel's office (10180-101 Street, Suite 1800, Edmonton) is
-- the same building as 1523 Sean Rourke and 1642 Marvin Schmidt from
-- earlier batches — independent teams sharing an address, consistent
-- with the recurring shared-building pattern.

-- 1607 Charlie Aiello (formal name Pasquale Aiello), CIBC Wood Gundy, Winnipeg
UPDATE contacts SET address = '1 Lombard Place, 20th Floor, Suite 2000' WHERE id = 1607;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1607, 'Michelle Finlay', 'Team member since 2010 (client services, research & trading, proposals and account opening)'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1607)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1607 AND name = 'Michelle Finlay');

-- 1579 Brad Hummel, CIBC Wood Gundy, Edmonton
UPDATE contacts SET address = '10180-101 Street, Suite 1800' WHERE id = 1579;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1579, x.name, x.role FROM (
  SELECT 'Landon Bucholz' AS name, 'Investment Associate & Advisor' AS role
  UNION ALL SELECT 'Angela Vass', 'Associate Investment Advisor'
  UNION ALL SELECT 'Leanne Belbin', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1579)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1579 AND name = x.name);

-- 1367 Jerome Bastien, NBF Wealth Management, Laval (address only)
UPDATE contacts SET address = '2500 Boulevard Daniel-Johnson, 7th floor, Suite 700' WHERE id = 1367;
