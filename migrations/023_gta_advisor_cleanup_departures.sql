-- Cleanup pass (part 2 of N): resolves the 9 confirmed employer departures
-- that migrations 009-021 deliberately left blank (stale CRM firm field,
-- nothing applied) rather than write data under the wrong employer. Each
-- contact's firm is now corrected to their actual current employer, with
-- address/team researched fresh for that new firm. Where the new address
-- itself carries meaningful uncertainty, it's withheld and only the city
-- is implied by firm/team context, consistent with the address-conflict
-- precedent used throughout migrations 009-021.
--
--   1740 Neil Stratton: ScotiaMcLeod -> JC Clark Ltd (Portfolio Manager,
--     JC Clark High Income Opportunities Fund, since April 2025).
--   1521 Will Simpson: BMO Nesbitt Burns -> Aretec Wealth Inc. (co-founder,
--     President/CIO, since Oct 2024). Address conflicts between the LEI
--     registry and ZoomInfo (10 King St E #600 vs 1128 Yonge St) — withheld.
--   1555 Nicholas Palahnuk: BMO Nesbitt Burns -> RBC Dominion Securities,
--     "The Palahnuk Group," 200 Bay St 25th Floor (same large RBC floor as
--     the many other RBC teams resolved in migrations 020-021).
--   1401 Dustin Van Der Hout: Richardson Wealth Ltd -> Wellington-Altus
--     Private Wealth ("Van Der Hout Associates Wealth Management"). Address
--     is Wellington-Altus's shared Toronto-King office; not independently
--     confirmed as his specific suite, but the best available data.
--   1498 Paul Polyviou: Manulife Wealth -> Harbourfront Wealth Management,
--     as part of a 13-advisor group move (July 2025). Address inferred
--     from a co-located practice's page, moderate confidence.
--   1456 Jaime Carrasco: CG Wealth Management -> Harbourfront Wealth
--     Management (Jan 2025). Current address could not be confirmed —
--     withheld, city Toronto only. Confirmed NOT on the same team as
--     Polyviou despite both landing at Harbourfront.
--   1398 Fred Banwell ("Banwell Private Wealth"): Richardson Wealth Ltd ->
--     Wellington-Altus Private Wealth (Feb 2024). Address could not be
--     confirmed as his specific office — withheld, city Toronto only.
--   1254 John De Goey: Wellington-Altus Private Wealth -> Designed Wealth
--     Management (early 2023). Address is the firm's Toronto HQ, not
--     confirmed as his exact desk; team association inferred from a
--     LinkedIn post title, moderate confidence on both.
--   1336 Chanel Lawrence: RBC Dominion Securities -> Wellington-Altus
--     Private Wealth (Rosedale Family Office). This turns out to be the
--     SAME "Rosedale Family Office" team already resolved in migration 010
--     for contacts 1250 Himalaya Jain, 1269 Gord Love, and 1252 Rocky
--     Bellotti (10 Alcorn Ave., Suite 300) — no new research was needed.
--     Since she's a new addition to that team, this also updates those
--     three existing contacts to list her as a colleague.

-- 1740 Neil Stratton: ScotiaMcLeod -> JC Clark Ltd
UPDATE contacts SET firm = 'JC Clark Ltd', address = 'Royal Bank Plaza, North Tower, 200 Bay Street, Suite 510' WHERE id = 1740;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1740, x.name, x.role FROM (
  SELECT 'Colin Stewart' AS name, 'Chief Executive Officer and Portfolio Manager' AS role
  UNION ALL SELECT 'Veeral Khatri', 'Chief Investment Officer and Portfolio Manager'
  UNION ALL SELECT 'Martin Braun', 'Senior Investment Strategist and Founder/Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1740)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1740 AND name = x.name);

-- 1521 Will Simpson: BMO Nesbitt Burns -> Aretec Wealth Inc. (address withheld, conflicting sources)
UPDATE contacts SET firm = 'Aretec Wealth Inc.' WHERE id = 1521;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1521, x.name, x.role FROM (
  SELECT 'Keeley Simpson' AS name, 'Chief Executive Officer, Chief Compliance Officer & Portfolio Manager' AS role
  UNION ALL SELECT 'Greg Wise, CIM, PFP', 'Vice-President & Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1521)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1521 AND name = x.name);

-- 1555 Nicholas Palahnuk: BMO Nesbitt Burns -> RBC Dominion Securities (The Palahnuk Group)
UPDATE contacts SET firm = 'RBC Dominion Securities', address = '200 Bay Street, 25th Floor' WHERE id = 1555;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1555, x.name, x.role FROM (
  SELECT 'Nicola Grewal' AS name, 'Associate Advisor' AS role
  UNION ALL SELECT 'Chirag Gangwani', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1555)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1555 AND name = x.name);

-- 1401 Dustin Van Der Hout: Richardson Wealth Ltd -> Wellington-Altus Private Wealth
UPDATE contacts SET firm = 'Wellington-Altus Private Wealth', address = '150 King St West, Suite 1501' WHERE id = 1401;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1401, x.name, x.role FROM (
  SELECT 'Mabelle Tavares' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Elina Surkov', 'Investment Advisor & Associate Portfolio Manager'
  UNION ALL SELECT 'Katy Tien', 'Associate Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1401)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1401 AND name = x.name);

-- 1498 Paul Polyviou: Manulife Wealth -> Harbourfront Wealth Management
UPDATE contacts SET firm = 'Harbourfront Wealth Management', address = '365 Evans Avenue, Suite 301' WHERE id = 1498;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1498, x.name, x.role FROM (
  SELECT 'Joe Pinto' AS name, 'Senior Investment Advisor' AS role
  UNION ALL SELECT 'Richard Marques', 'Portfolio Manager & Senior Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1498)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1498 AND name = x.name);

-- 1456 Jaime Carrasco: CG Wealth Management -> Harbourfront Wealth Management (address withheld)
UPDATE contacts SET firm = 'Harbourfront Wealth Management' WHERE id = 1456;

-- 1398 Fred Banwell: Richardson Wealth Ltd -> Wellington-Altus Private Wealth (address withheld)
UPDATE contacts SET firm = 'Wellington-Altus Private Wealth' WHERE id = 1398;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1398, x.name, x.role FROM (
  SELECT 'Franca Banwell' AS name, 'Business Development Associate' AS role
  UNION ALL SELECT 'Bonnie Wilson', 'Senior Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1398)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1398 AND name = x.name);

-- 1254 John De Goey: Wellington-Altus Private Wealth -> Designed Wealth Management
UPDATE contacts SET firm = 'Designed Wealth Management', address = '150 King Street West, Suite 340' WHERE id = 1254;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1254, x.name, x.role FROM (
  SELECT 'Timothy Knight, CFP' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Po Leung', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1254)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1254 AND name = x.name);

-- 1336 Chanel Lawrence: RBC Dominion Securities -> Wellington-Altus Private
-- Wealth, joining the existing "Rosedale Family Office" team (1250/1269/1252)
UPDATE contacts SET firm = 'Wellington-Altus Private Wealth', address = '10 Alcorn Ave., Suite 300' WHERE id = 1336;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1336, x.name, x.role FROM (
  SELECT 'Himalaya Jain' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Gord Love', 'Investment Advisor'
  UNION ALL SELECT 'Rocky Bellotti', 'Investment Advisor'
  UNION ALL SELECT 'Alison Forster', 'Head of Wealth Planning Services'
  UNION ALL SELECT 'Adam Chambers', 'Investment Advisor'
  UNION ALL SELECT 'George Hurley', 'Investment Advisor'
  UNION ALL SELECT 'Jack Nattress', 'Associate'
  UNION ALL SELECT 'Noah Djurfeldt', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1336)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1336 AND name = x.name);

INSERT INTO contact_people (contact_id, name, role)
SELECT c.id, 'Chanel Lawrence', 'Associate Investment Advisor'
FROM contacts c
WHERE c.id IN (1250, 1269, 1252)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = c.id AND name = 'Chanel Lawrence');
