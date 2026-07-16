-- Batch 2 of GTA "advisor team" enrichment (18 more contacts, same methodology
-- as migration 009: full name + role required, sourced from each firm's own
-- public team pages via search snippets since every firm's site blocked direct
-- fetches). Two contacts found teamed up with ANOTHER contact already in this
-- CRM (Dorfman/Hostick at BMO; Rowat/Lewenza and Jain/Love/Bellotti at Raymond
-- James and Wellington-Altus respectively) — those get the shared address and
-- the *other* team members, not each other, to avoid a contact pointing at
-- itself as its own "team member."
--
-- Two contacts are deliberately skipped, not guessed:
--   1740 Neil Stratton — strong evidence (LinkedIn + a GlobeNewswire release)
--     he left ScotiaMcLeod for JC Clark Ltd. in April 2025. The CRM's whole
--     firm/segment record for him may be stale; flagging rather than writing
--     an address for an employer he may have already left.
--   1790 Stuart Smith — there are two different ScotiaMcLeod Toronto advisors
--     with this exact name (different floors of the same building); no way to
--     tell which one is our CRM contact, so nothing was applied.

-- 1554 Johnathan Hostick + 1557 Michael Dorfman — same BMO Nesbitt Burns team
UPDATE contacts SET address = '100 King Street West (First Canadian Place), 38th Floor' WHERE id IN (1554, 1557);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, x.name, x.role FROM contacts c, (
  SELECT 'Emily Halverson-Duncan' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Femi Orenuga', 'Senior Sales Assistant'
  UNION ALL SELECT 'Bianca Creanga', 'Client Service Associate'
  UNION ALL SELECT 'Christian Grande', 'Sales Assistant'
  UNION ALL SELECT 'Sid Habed', 'Sales Assistant'
  UNION ALL SELECT 'Charlie McConville', 'Sales Assistant'
) x
WHERE c.id IN (1554, 1557)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = x.name);

-- 1224 Michael Marcovitz, TD Wealth, Toronto (address only; no team met the bar)
UPDATE contacts SET address = '79 Wellington St. W., 11th Floor' WHERE id = 1224;

-- 1466 Brian Kadey, CG Wealth Management (Kadey Group), Toronto
UPDATE contacts SET address = '40 Temperance Street, Suite 2000' WHERE id = 1466;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1466, x.name, x.role FROM (
  SELECT 'Irene Macek' AS name, 'Senior Investment Associate' AS role
  UNION ALL SELECT 'Luke Kadey', 'Investment Advisor'
  UNION ALL SELECT 'Katrina Roesand', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1466)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1466 AND name = x.name);

-- 1733 Greg Holohan, ScotiaMcLeod, Markham
UPDATE contacts SET address = '675 Cochrane Drive, Suite 115' WHERE id = 1733;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1733, x.name, x.role FROM (
  SELECT 'Anthony Chouinard' AS name, 'Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Sarah Halabi', 'Administrative Associate'
  UNION ALL SELECT 'Ruth Savage', 'Administrative Associate'
  UNION ALL SELECT 'Aesha Shah', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1733)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1733 AND name = x.name);

-- 1638 Andrew Kucey, CIBC Wood Gundy, Toronto
UPDATE contacts SET address = 'Brookfield Place, Suite 600, 181 Bay Street' WHERE id = 1638;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1638, x.name, x.role FROM (
  SELECT 'Jennifer Miller' AS name, 'Financial Associate' AS role
  UNION ALL SELECT 'Jonah Zuckerman', 'Investment Representative (CFA)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1638)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1638 AND name = x.name);

-- 1675 Douglas Rowat + 1677 Ryan Lewenza — same Raymond James team (Turner Investments)
UPDATE contacts SET address = '40 King Street West, Suite 5300 (Scotia Plaza)' WHERE id IN (1675, 1677);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, x.name, x.role FROM contacts c, (
  SELECT 'Garth Turner' AS name, 'Founder, Turner Investments' AS role
  UNION ALL SELECT 'Sebastien Skupek', 'Senior Financial Planner and Associate Portfolio Manager'
  UNION ALL SELECT 'Ross MacLachlan', 'Associate Portfolio Manager'
  UNION ALL SELECT 'Scott Booth', 'Portfolio Manager'
  UNION ALL SELECT 'Vicki Hunter', 'Senior Wealth Advisor Associate / Team Administrator'
  UNION ALL SELECT 'Leanne Wilton', 'Senior Financial Planner'
  UNION ALL SELECT 'Ahmer Chowdhary', 'Financial Planner'
  UNION ALL SELECT 'Bryan Lee', 'Trading and Research Specialist'
  UNION ALL SELECT 'Dakota Deane', 'Financial Advisor Associate'
  UNION ALL SELECT 'Sinan Terzioglu', 'Portfolio Manager'
  UNION ALL SELECT 'Lisa Grimm', 'Financial Advisor Associate'
) x
WHERE c.id IN (1675, 1677)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = x.name);

-- 1680 Rob Pollard, Raymond James (The Wyndham Group), Toronto — different team,
-- same building as Rowat/Lewenza above
UPDATE contacts SET address = '40 King Street West, Suite 5300 (Scotia Plaza)' WHERE id = 1680;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1680, x.name, x.role FROM (
  SELECT 'Daniel Brodlieb' AS name, 'Senior Portfolio Manager, Private Client Group' AS role
  UNION ALL SELECT 'Dr. Wilson Chen', 'Lead Financial Planner'
  UNION ALL SELECT 'Mina Huang', 'Senior Tax Advisor'
  UNION ALL SELECT 'Kelsey Pirnak', 'Lead Trading & Research Specialist'
  UNION ALL SELECT 'John Whyte', 'Trading & Research Specialist'
  UNION ALL SELECT 'Carole Nollner', 'Senior Investment Advisor Associate'
  UNION ALL SELECT 'Denise Pinto', 'Administrative Assistant'
  UNION ALL SELECT 'Julie Le', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1680)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1680 AND name = x.name);

-- 1250 Himalaya Jain + 1269 Gord Love + 1252 Rocky Bellotti — same Wellington-Altus
-- team ("Rosedale Family Office"), independently confirmed by two separate lookups
UPDATE contacts SET address = '10 Alcorn Ave., Suite 300' WHERE id IN (1250, 1269, 1252);
INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, x.name, x.role FROM contacts c, (
  SELECT 'Alison Forster' AS name, 'Head of Wealth Planning Services' AS role
  UNION ALL SELECT 'Adam Chambers', 'Investment Advisor'
  UNION ALL SELECT 'George Hurley', 'Investment Advisor'
  UNION ALL SELECT 'Jack Nattress', 'Associate'
  UNION ALL SELECT 'Noah Djurfeldt', 'Investment Advisor'
) x
WHERE c.id IN (1250, 1269, 1252)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = x.name);

-- 1773 Tom Vandewater, ScotiaMcLeod, Toronto (address only; no team met the bar)
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1773;

-- 1758 Darren Farwell, ScotiaMcLeod (Farwell Group), Toronto — same building as
-- Vandewater above, different independent team
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1758;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1758, x.name, x.role FROM (
  SELECT 'Eddy Leung' AS name, 'Senior Wealth Advisor and Portfolio Manager' AS role
  UNION ALL SELECT 'Leslie McCormick', 'Senior Wealth Advisor and Portfolio Manager'
  UNION ALL SELECT 'Michael Hastings', 'Wealth Advisor'
  UNION ALL SELECT 'Jessica Sevink', 'Investment Associate'
  UNION ALL SELECT 'Maddalena Marchese', 'Insurance Advisor, Scotia Wealth Insurance Services'
  UNION ALL SELECT 'Sandra Terceira', 'Insurance Advisor, Scotia Wealth Insurance Services'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1758)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1758 AND name = x.name);

-- 1739 Michael Black, ScotiaMcLeod (Black-Stratton Group), Markham — independently
-- corroborates that Neil Stratton (1740, see note above) has left this team
UPDATE contacts SET address = '675 Cochrane Drive, Suite 115' WHERE id = 1739;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1739, x.name, x.role FROM (
  SELECT 'Robert Caldarola' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Brian Cooper', 'Investment Associate'
  UNION ALL SELECT 'Ronald Miu', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Frank LoPresti', 'Investment Associate'
  UNION ALL SELECT 'Nashila Malick', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1739)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1739 AND name = x.name);

-- 1598 Shawn Jerusalim, CIBC Wood Gundy (Jerusalim Financial Group), Toronto
UPDATE contacts SET address = '4110 Yonge Street, Suite 600' WHERE id = 1598;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1598, 'Nicole Napoleone', 'Client Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1598)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1598 AND name = 'Nicole Napoleone');
