-- Batch 1 of "rest of Canada" advisor team/address enrichment — extends
-- the GTA-only project (migrations 009-026) to the remaining ~419 Canadian
-- Financial Advisor contacts outside the Greater Toronto Area. Same
-- methodology: web-search-first research (wealth-management firm sites
-- consistently block direct fetches with 403), strict full-name+title
-- accuracy bar for team members, explicit employment-status checks.
--
-- No contacts are skipped this round — even a confirmed employer
-- departure (1592 Tom Porteous) came back with enough new-firm data to
-- apply in full:
--
--   1592 Tom Porteous — his entire "BPS Wealth Management" team (~$1.4B
--     AUM) left CIBC Wood Gundy for CG Wealth Management (Canaccord
--     Genuity) in Sept 2024 (Globe and Mail, Wealth Professional). Firm
--     and address corrected to the new employer.
--
-- 1369 Manik Sincennes, 1382 Benoit Beausejour, and 1394 Bernard Dallaire
-- are three separate CRM contacts on the same NBF Wealth Management team
-- in Brossard, QC ("Dallaire Sincennes Beauséjour Lemay Wealth
-- Management") — each one's INSERT lists the other two plus shared staff,
-- never themselves, per the recurring shared-team-pair/trio pattern.
--
-- 1407 Reg Jackson (London, ON) and 1428 Adam Watson (Chatham, ON) are
-- both CRM contacts and co-founders of the same larger practice, "Fairway
-- Wealth Management" (NBF), which operates out of multiple Ontario
-- offices (London, Chatham, Toronto) — each is applied their own actual
-- office address, but their contact_people lists include each other as
-- firm colleagues alongside their own office-specific staff.
--
-- 1715 Sophia Ito and 1685 Karen Ikeda (both Nicola Wealth, Vancouver)
-- share the same address-in-flux note: Nicola Wealth signed a long-term
-- lease in Jan 2025 for a new HQ at 1477 West Broadway, targeted for
-- mid-2026 move-in; applying the current confirmed address (1508 West
-- Broadway) since the move's completion could not be confirmed.

-- 1472 David LePoidevin, CG Wealth Management (LePoidevin Group), Vancouver
UPDATE contacts SET address = '1133 Melville Street, Suite 1200' WHERE id = 1472;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1472, x.name, x.role FROM (
  SELECT 'Marc Rinfret' AS name, 'Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Fletcher Hemmons', 'Senior Portfolio Manager'
  UNION ALL SELECT 'Darcie Crowe', 'Senior Wealth Advisor, Senior Portfolio Manager (Founder, Crowe Private Wealth Group)'
  UNION ALL SELECT 'Anne Jackson', 'Wealth & Estate Planning'
  UNION ALL SELECT 'Susanna Kam', 'Trader'
  UNION ALL SELECT 'Aren Hoffman', 'Research Analyst'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1472)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1472 AND name = x.name);

-- 1354 Louis Khalil, NBF Wealth Management (Groupe de gestion de
-- patrimoine Khalil Provencher D'Amours LeBlanc), Rimouski
UPDATE contacts SET address = '127 Boulevard René-Lepage Est, Bureau 100' WHERE id = 1354;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1354, x.name, x.role FROM (
  SELECT 'Julien Busque' AS name, 'Notary & Director of Operations, Succession Planning Consultant' AS role
  UNION ALL SELECT 'Simon Bouchard-Bellavance', 'Wealth Management Advisor & Portfolio Manager'
  UNION ALL SELECT 'Judith Poirier', 'Financial Planner'
  UNION ALL SELECT 'Dominic Prescott', 'Senior Wealth Management Advisor & Portfolio Manager'
  UNION ALL SELECT 'Sébastien LeBlanc', 'Principal Advisor in Wealth Management, Investment Advisor & Portfolio Manager'
  UNION ALL SELECT 'Maryse Gagnon', 'Wealth Management Advisor'
  UNION ALL SELECT 'Alexandre Bastille', 'Wealth Management Advisor'
  UNION ALL SELECT 'Sophie Leclerc', 'Financial Planner'
  UNION ALL SELECT 'Nicolas Desgagnés', 'Investment Advisor & Portfolio Manager'
  UNION ALL SELECT 'Sylvie D''Amours', 'Senior Advisor, Succession Planning & Taxation'
  UNION ALL SELECT 'Isabelle Anctil', 'Associate in Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1354)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1354 AND name = x.name);

-- 1369 Manik Sincennes + 1382 Benoit Beausejour + 1394 Bernard Dallaire,
-- NBF Wealth Management, Brossard — same team, all three CRM contacts
UPDATE contacts SET address = '1040 rue du Lux, Bureau 710' WHERE id IN (1369, 1382, 1394);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1369, x.name, x.role FROM (
  SELECT 'Bernard Dallaire' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Benoit Beausejour', 'Senior Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Sébastien Lemay', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Étienne Plourde', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1369)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1369 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1382, x.name, x.role FROM (
  SELECT 'Bernard Dallaire' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Manik Sincennes', 'Senior Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Sébastien Lemay', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Étienne Plourde', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1382)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1382 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 1394, x.name, x.role FROM (
  SELECT 'Manik Sincennes' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Benoit Beausejour', 'Senior Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Sébastien Lemay', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Étienne Plourde', 'Associate Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1394)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1394 AND name = x.name);

-- 1397 Angus Watt, NBF Wealth Management (Angus Watt Advisory Group), Edmonton
UPDATE contacts SET address = '10175 101 Street NW, Suite 1800' WHERE id = 1397;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1397, x.name, x.role FROM (
  SELECT 'James (Jim) Watt' AS name, 'Senior Wealth Advisor, Managing Partner' AS role
  UNION ALL SELECT 'Jane Alm', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Eli Der', 'Wealth Advisor'
  UNION ALL SELECT 'Ksenia Lee', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1397)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1397 AND name = x.name);

-- 1407 Reg Jackson, NBF Wealth Management (Fairway Wealth Management), London ON
UPDATE contacts SET address = '201-256 Pall Mall Street' WHERE id = 1407;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1407, x.name, x.role FROM (
  SELECT 'Paul Manders' AS name, 'Senior Wealth Advisor & Portfolio Manager, Co-founder/Co-CEO' AS role
  UNION ALL SELECT 'Adam Watson', 'Wealth Advisor & Portfolio Manager, Co-founder (Chatham office, also CRM contact)'
  UNION ALL SELECT 'Mike Ankers', 'Wealth Advisor'
  UNION ALL SELECT 'Zach Davidson', 'Wealth Advisor & Portfolio Manager, Partner (Toronto office)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1407)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1407 AND name = x.name);

-- 1715 Sophia Ito, Nicola Wealth, Vancouver (address only)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1715;

-- 1765 Jon Greyell, ScotiaMcLeod (Greyell Portfolio Management), West Vancouver
UPDATE contacts SET address = '1555 Marine Drive, Floor 3' WHERE id = 1765;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1765, x.name, x.role FROM (
  SELECT 'Steve Chatelain' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Brie Fraser', 'Senior Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Irene Chen', 'Senior Financial Planning Associate'
  UNION ALL SELECT 'Erin Pasnak', 'Senior Associate'
  UNION ALL SELECT 'Mitch Thompson', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1765)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1765 AND name = x.name);

-- 1287 Chris Raper, Raymond James (Aspira Wealth), Victoria
UPDATE contacts SET address = '1175 Douglas Street, Suite 1000' WHERE id = 1287;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1287, x.name, x.role FROM (
  SELECT 'Alexandru "Alex" Vozian' AS name, 'Co-Founder & Portfolio Manager' AS role
  UNION ALL SELECT 'Ben (Benjamin) Clark', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Eileen Kelly', 'Associate Portfolio Manager, Cross-Border Specialist & Associate Partner'
  UNION ALL SELECT 'Clarke White', 'Financial Planner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1287)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1287 AND name = x.name);

-- 1592 Tom Porteous — confirmed departure: CIBC Wood Gundy -> CG Wealth
-- Management (Canaccord Genuity), "BPS Wealth Management", Sept 2024
UPDATE contacts SET firm = 'CG Wealth Management', address = '1133 Melville St' WHERE id = 1592;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1592, x.name, x.role FROM (
  SELECT 'Eric Southam' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Jay Fitch', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Emi Levy', 'Wealth Advisor Assistant'
  UNION ALL SELECT 'Rhys Porteous', 'Wealth Advisor Assistant'
  UNION ALL SELECT 'Cheryl Lee', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1592)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1592 AND name = x.name);

-- 1738 Rob Kelland, ScotiaMcLeod (Kelland Portfolio Management Group), London ON
UPDATE contacts SET address = '255 Queens Avenue, Suite 900' WHERE id = 1738;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1738, x.name, x.role FROM (
  SELECT 'Domenic Palmieri' AS name, 'Senior Total Wealth Planner' AS role
  UNION ALL SELECT 'Sarah Mowbray', 'Investment Associate'
  UNION ALL SELECT 'Sara Martin', 'Investment Associate, Associate Portfolio Manager'
  UNION ALL SELECT 'Tyler Robson', 'Investment Associate'
  UNION ALL SELECT 'Luke Baylis', 'Investment Associate'
  UNION ALL SELECT 'Marty Denomme', 'Senior Financial Planning Associate'
  UNION ALL SELECT 'Angelo Romero', 'Senior Associate'
  UNION ALL SELECT 'Adam Moltner', 'Investment Associate'
  UNION ALL SELECT 'Emily Wilson', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1738)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1738 AND name = x.name);

-- 1685 Karen Ikeda, Nicola Wealth, Vancouver (address only)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1685;

-- 1262 Charlie Spiring, Wellington-Altus Private Wealth (Spiring Wealth
-- Management), Winnipeg — founder/chair of Wellington-Altus itself
UPDATE contacts SET address = '201 Portage Ave' WHERE id = 1262;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1262, x.name, x.role FROM (
  SELECT 'Blaine Coates' AS name, 'Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Trevor Coates', 'Senior Investment Advisor'
  UNION ALL SELECT 'Matt Bilash', 'Vice President, Investment Advisor'
  UNION ALL SELECT 'Connie Gale', 'Associate Vice President'
  UNION ALL SELECT 'Jesse Browne', 'Investment Advisor'
  UNION ALL SELECT 'Alex Litinsky', 'Associate Investment Advisor'
  UNION ALL SELECT 'Maureen Rankin', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1262)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1262 AND name = x.name);

-- 1810 Dan Sambolec, Odlum Brown (Corner Group), Vancouver
UPDATE contacts SET address = '250 Howe St, Suite 1100' WHERE id = 1810;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1810, x.name, x.role FROM (
  SELECT 'Matt MacGrotty' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Charlotte Faulkner', 'Investment Advisor'
  UNION ALL SELECT 'Anita Celio', 'Investment Advisor'
  UNION ALL SELECT 'Mike Henry', 'Director / Investment Advisor'
  UNION ALL SELECT 'Kyle Thompson', 'Investment Advisor'
  UNION ALL SELECT 'Rajeena Minhas', 'Investment Advisor'
  UNION ALL SELECT 'Pamela Starek', 'Investment Assistant'
  UNION ALL SELECT 'James Hemer', 'Investment Assistant'
  UNION ALL SELECT 'Eliza Fedechko', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1810)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1810 AND name = x.name);

-- 1676 Clark Linton, Raymond James (Plena Wealth Advisors), Vancouver
UPDATE contacts SET address = 'Suite 2100, 925 West Georgia Street' WHERE id = 1676;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1676, x.name, x.role FROM (
  SELECT 'Craig White' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Jay Snyder', 'Senior Wealth Advisor, Portfolio Manager'
  UNION ALL SELECT 'John Huggan', 'Senior Wealth Advisor, Portfolio Manager'
  UNION ALL SELECT 'Tamara Martin', 'Certified Financial Planner'
  UNION ALL SELECT 'Alex Slade', 'Associate Financial Advisor / Associate Portfolio Manager'
  UNION ALL SELECT 'Sherri Johnson', 'Wealth Advisor Associate'
  UNION ALL SELECT 'Vernita Wooton', 'Wealth Advisor Assistant'
  UNION ALL SELECT 'Derek Williams', 'Financial Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1676)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1676 AND name = x.name);

-- 1428 Adam Watson, NBF Wealth Management (Fairway Wealth Management), Chatham
UPDATE contacts SET address = '902 St. Clair Street, Unit 3' WHERE id = 1428;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1428, x.name, x.role FROM (
  SELECT 'Reg Jackson' AS name, 'Senior Wealth Advisor & Portfolio Manager, Co-CEO (London office, also CRM contact)' AS role
  UNION ALL SELECT 'Wesley Babbitt', 'Wealth Advisor (Chatham office)'
  UNION ALL SELECT 'Amy Dao', 'Wealth Associate (Chatham office)'
  UNION ALL SELECT 'Jadyn Tellier', 'Associate (Chatham office)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1428)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1428 AND name = x.name);

-- 1724 Rick McDonald, ScotiaMcLeod (Bishop McDonald Group), Calgary
UPDATE contacts SET address = '225 6th Avenue SW, Suite 1700' WHERE id = 1724;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1724, x.name, x.role FROM (
  SELECT 'Craig Bishop' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Corey Wartman', 'Wealth Advisor Associate, Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1724)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1724 AND name = x.name);
