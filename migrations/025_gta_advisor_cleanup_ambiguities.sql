-- Cleanup pass (part 4 of N, final): resolves the highest-value unresolved
-- ambiguities from migrations 009-021 using targeted follow-up research —
-- an exact-email match, a firm's own "our partners" page, and a year's
-- worth of the merged/acquired firms' sites settling down. A few lower-
-- value ambiguities (suite-number-only uncertainty where the building
-- address is already correct, e.g. 1377 Simon Partington, 1540/1546
-- Martin/Peebles, 1662 John Soutsos, 1703/1720 Haik/Arakgi, 1265/1274
-- Allpress/Schofield) are left as documented in their original migrations
-- — the sources genuinely still conflict on the exact suite, and every
-- primary page involved returns HTTP 403, so further scraping attempts
-- are unlikely to resolve them; the building-level address already on
-- file remains accurate and useful.
--
--   1790 Stuart Smith — identity resolved via exact CRM email match
--     (stuart.smith@scotiawealth.com) to Stuart T. Smith of the Hamdy
--     Smith Group, not Stuart M.C. Smith of Smith McKay Financial.
--   1345 Matthew Bacchiochi — Cardinal Point's post-merger structure has
--     settled; both address and team are now confirmed (his practice,
--     "Cardinal Point Athlete Advisors," has its own dedicated pages).
--   1569 Asif Khan — the Oakville/Mississauga address conflict resolves
--     to Oakville (BMO's own directory tag + a phone-exchange match);
--     team was already applied in migration 017.
--   1378 Rosemary Horwood — now confirmed as a genuine, current member of
--     MBP Sterling Partners with her own profile page there; team applied
--     (address was already applied in migration 017).
--   1518 Sajjad Hussain — corrects the earlier exclusion: he and Glenn
--     Allen are confirmed colleagues on the same practice (Allen Private
--     Wealth Group), not separate groups as previously assumed.
--   1335 Murray Minuk / 1339 George Manjgaladze — the "possible shared
--     floor resource" hedge on associates Karen Lacson and Lujia Lei is
--     now confirmed: both work both teams, per RBC's own "our partners"
--     page tying the two practices together. Role text updated to drop
--     the hedge language.

UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1790;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1790, 'Amr Hamdy', 'Wealth Advisor, partner (The Hamdy Smith Group)'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1790)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1790 AND name = 'Amr Hamdy');

UPDATE contacts SET firm = 'Cardinal Point Wealth Management', address = '3280 Bloor Street West, Centre Tower, Suite 500' WHERE id = 1345;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1345, x.name, x.role FROM (
  SELECT 'Chris Slawson' AS name, 'Director, Cardinal Point Athlete Advisors' AS role
  UNION ALL SELECT 'Trevor Kidd', 'Regional Director, Cardinal Point Athlete Advisors'
  UNION ALL SELECT 'Greg Marks', 'Manager, Private Wealth, Cardinal Point Athlete Advisors'
  UNION ALL SELECT 'Luke Juha', 'Client Relationship Manager, Cardinal Point Athlete Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1345)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1345 AND name = x.name);

UPDATE contacts SET address = '360 Oakville Place Drive, 2nd Floor' WHERE id = 1569;

INSERT INTO contact_people (contact_id, name, role)
SELECT 1378, x.name, x.role FROM (
  SELECT 'Mark Begg, CFA' AS name, 'Portfolio Manager & Investment Advisor (leads MBP Sterling Partners)' AS role
  UNION ALL SELECT 'Anne O''Farrell', 'Senior Portfolio Manager & Senior Investment Advisor'
  UNION ALL SELECT 'Matteo Verrilli, MBA, CFA', 'Senior Portfolio Manager & Group Investment Advisor'
  UNION ALL SELECT 'Jody Bent', 'Senior Investment Advisor'
  UNION ALL SELECT 'Andy Rafelman', 'Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1378)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1378 AND name = x.name);

INSERT INTO contact_people (contact_id, name, role)
SELECT 1518, 'Glenn Allen', 'Portfolio Manager, Director, Private Client Group; founder of Allen Private Wealth Group'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1518)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1518 AND name = 'Glenn Allen');

UPDATE contact_people
SET role = 'Associate (confirmed shared floor resource — formally partnered teams per RBC''s own "our partners" page)'
WHERE contact_id IN (1335, 1339) AND name IN ('Karen Lacson', 'Lujia Lei');
