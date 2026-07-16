-- Pilot for enriching "advisor team" contacts with their actual branch team,
-- sourced from the firm's own public team page (Baker Financial Group / CIBC
-- Wood Gundy, Toronto — contact id 1636, Bryan Baker). Only the four team
-- members confirmed by name AND role are added; two additional first-name-only
-- mentions ("Gabe", "Nicholas") found in the same source were not added since
-- their surnames/roles could not be confirmed.
-- Guarded with WHERE EXISTS so this is a no-op wherever contact 1636 does not
-- exist or has already been enriched (e.g. re-running in an environment whose
-- ids differ from the shipped seed).
INSERT INTO contact_people (contact_id, name, role)
SELECT 1636, 'Jonathan Baker', 'Partner & Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1636)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1636 AND name = 'Jonathan Baker');

INSERT INTO contact_people (contact_id, name, role)
SELECT 1636, 'Lisa Barton', 'Associate Investment Advisor'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1636)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1636 AND name = 'Lisa Barton');

INSERT INTO contact_people (contact_id, name, role)
SELECT 1636, 'Lindsey Bentham', 'Client Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1636)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1636 AND name = 'Lindsey Bentham');

INSERT INTO contact_people (contact_id, name, role)
SELECT 1636, 'Christian Mitri', 'Client Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1636)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1636 AND name = 'Christian Mitri');
