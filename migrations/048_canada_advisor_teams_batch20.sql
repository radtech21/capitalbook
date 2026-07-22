-- Rest-of-Canada Financial Advisor enrichment, batch 20 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected. This batch's web-search budget ran out partway
-- through (hard 200/200 session cutoff, plus WebFetch 403s on everything
-- including sanity-check fetches) — three contacts (1444, 1458, 1465)
-- could not be verified at all and receive only a data_flags note, no
-- address/team changes.
--
-- Two confirmed dealer changes applied:
--   1477 Darren Alexander (White Rock): Manulife Securities -> Raymond
--     James Ltd., confirmed via LinkedIn and multiple sources.
--   1482 Len Colman (Summerland): Manulife Securities -> PEAK Securities
--     Inc., confirmed via the firm's own re-branded site ("Holistic
--     Wealth - PEAK Securities"), same office/phone/email.
--
-- One likely departure flagged (low-moderate confidence, single source):
--   1661 Andrew Suthern (Calgary): a My Business Magazine profile
--     indicates he joined Sun Life Jan 6 2025, possibly in a
--     wholesaler/advisor-support role rather than a client-facing
--     advisor role — could not independently corroborate; verify before
--     outreach.
--
-- Suspected shared team (not cross-confirmed, flagged only): 1577 Sean
-- Gaffney and 1578 Saqeeb Rahman are both referenced under "Calgary
-- Central Advisory Group" at the same CIBC Wood Gundy address (500
-- Centre Street SE, 27th Floor); 1576 Trevor Zacher shares the same
-- building address but his team-name affiliation is unconfirmed. Rosters
-- were NOT merged pending confirmation.
--
-- Shared-building notes (independent teams, not merged): 1244 Miller Li
-- and 1245 Ann Jefferson both sit at the CIBC Wood Gundy Vancouver
-- Bentall office (1055 Dunsmuir Street, Suite 2434), which hosts several
-- distinct advisor teams; 1670 Arnold Machel and 1477 Darren Alexander
-- share the same White Rock building (15178 Buena Vista Ave).
--
-- Three contacts could not be verified at all due to the web-search
-- budget cutoff, and receive only a data_flags note (no address/team
-- change applied): 1444 Conal Campbell, 1458 Rod Bruchet, 1465 Alan
-- Johnson — none could be found under CG Wealth Management/Canaccord
-- Genuity's Vancouver roster via any available source. For 1465, an
-- unconfirmed same-named obituary surfaced (West Vancouver, Feb 2025)
-- but profession was not stated, so it is explicitly NOT treated as a
-- confirmed death.

-- 1661 Andrew Suthern — LIKELY DEPARTURE to Sun Life (firm/address updated, flagged).
UPDATE contacts SET
  firm = 'Sun Life',
  address = '1230, 1122 4th Street SW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LIKELY MOVED from IPC Securities to Sun Life (per a single My Business Magazine profile, joined Jan 6 2025) — possibly a wholesaler/advisor-support role rather than direct client-facing advisor; could not independently corroborate, verify before outreach.')), 512)
WHERE id = 1661;

-- 1283 Marc Sabourin, Harbourfront Wealth Management (Trans Canada Wealth Management), Winnipeg, MB
UPDATE contacts SET address = '100-900 Harrow St E' WHERE id = 1283;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1283, x.name, x.role FROM (
  SELECT 'Colin Sabourin' AS name, 'Senior Investment Advisor (co-founder, brother)' AS role
  UNION ALL SELECT 'Matt Adams', 'Portfolio Manager & Senior Investment Advisor'
  UNION ALL SELECT 'Kevin Coulombe', 'Associate, Tax Specialist'
  UNION ALL SELECT 'Justin Baldwin', 'Wealth Advisor'
  UNION ALL SELECT 'Georgie Unsworth', 'Office Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1283)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1283 AND name = x.name);

-- 1670 Arnold Machel, IPC Securities (Visionvest Financial Planning & Services), White Rock, BC
UPDATE contacts SET address = '15178 Buena Vista Ave' WHERE id = 1670;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1670, x.name, x.role FROM (
  SELECT 'Ben Machel' AS name, 'Financial Planner (CFP, CFA)' AS role
  UNION ALL SELECT 'Sharon Machel', 'Office Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1670)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1670 AND name = x.name);

-- 1301 Duane Runzer, IG Private Wealth Management (Runzer & Associates), Kelowna, BC
UPDATE contacts SET address = 'Landmark 6, Suite 600 (Floor 6), 1631 Dickson Avenue' WHERE id = 1301;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1301, x.name, x.role FROM (
  SELECT 'Lindsey Williams' AS name, 'Client Services' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1301)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1301 AND name = x.name);

-- 1477 Darren Alexander — CONFIRMED DEALER CHANGE to Raymond James Ltd. (firm/title/address updated).
UPDATE contacts SET
  firm = 'Raymond James Ltd',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '15178 Buena Vista Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Moved from Manulife Securities to Raymond James Ltd., now practicing as "Alexander Wealth & Associates Advisory Group" — confirmed via LinkedIn and multiple sources.')), 512)
WHERE id = 1477;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1477, x.name, x.role FROM (
  SELECT 'Holly Begley' AS name, 'Associate Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1477)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1477 AND name = x.name);

-- 1482 Len Colman — CONFIRMED DEALER CHANGE to PEAK Securities Inc. (firm/address updated).
UPDATE contacts SET
  firm = 'PEAK Securities Inc',
  address = '9523 Main St, Suite 102',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Moved from Manulife Securities to PEAK Securities Inc. — firm''s own site now branded "Holistic Wealth - PEAK Securities," same office/phone/email.')), 512)
WHERE id = 1482;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1482, x.name, x.role FROM (
  SELECT 'Tristan Knoll' AS name, 'Administrative Assistant' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1482)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1482 AND name = x.name);

-- 1244 Miller Li, CIBC Private Wealth (Wood Gundy), Vancouver, BC
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1244;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1244, x.name, x.role FROM (
  SELECT 'Kyle Lam' AS name, 'Client Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1244)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1244 AND name = x.name);

-- 1245 Ann Jefferson, CIBC Private Wealth (Wood Gundy), Vancouver, BC (address only)
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1245;

-- 1246 Bardia Baghaei, CIBC Private Wealth (West Bay Wealth Management), West Vancouver, BC
UPDATE contacts SET address = '235 17th Street' WHERE id = 1246;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1246, x.name, x.role FROM (
  SELECT 'Brandi Lockhart' AS name, 'Wealth Advisor (CFP, CIM, PFP)' AS role
  UNION ALL SELECT 'Vern Phaneuf', 'Portfolio Manager (CPA, CA, CIM, CFP, FCSI)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1246)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1246 AND name = x.name);

-- 1308 Sam Younes, Altium Wealth Architecture, Montreal, QC
UPDATE contacts SET address = '1130 Sherbrooke St. W, Suite 400' WHERE id = 1308;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1308, x.name, x.role FROM (
  SELECT 'Dominic Blais' AS name, 'Lead Client Advisor, Wealth Management' AS role
  UNION ALL SELECT 'Jonathan Fortin', 'Associate, Wealth Management'
  UNION ALL SELECT 'Clément Chenneveau', 'Client Advisor, Wealth Management'
  UNION ALL SELECT 'Alexandre Bellefleur', 'Wealth Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1308)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1308 AND name = x.name);

-- 1444 Conal Campbell, CG Wealth Management, Vancouver, BC (unverifiable, flag only)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Could not verify: no public record found tying this name to CG Wealth Management/Canaccord Genuity or any financial-advisory role in Vancouver; web search budget exhausted mid-research.')), 512)
WHERE id = 1444;

-- 1499 Kyle Harris, Manulife Wealth Inc (Harris Wealth Management), Chilliwack, BC
UPDATE contacts SET address = '15-8337 Young Road' WHERE id = 1499;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1499, x.name, x.role FROM (
  SELECT 'Joan Zielke' AS name, 'Insurance Advisor (CFP)' AS role
  UNION ALL SELECT 'Sandra Harris', 'Associate'
  UNION ALL SELECT 'Mary-Kate Mitchell', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1499)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1499 AND name = x.name);

-- 1530 Kalee Boisvert, Raymond James Ltd, Calgary, AB (address only, low confidence)
UPDATE contacts SET
  address = '101 6 St SW Suite 110A',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Address has an unconfirmed alternate from a stale 2020 profile; treat with caution.')), 512)
WHERE id = 1530;

-- 1576 Trevor Zacher, CIBC Wood Gundy (possibly Calgary Central Advisory Group), Calgary, AB
UPDATE contacts SET
  address = '500 Centre Street SE, 27th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Same building as 1577 Sean Gaffney and 1578 Saqeeb Rahman, who are both referenced under "Calgary Central Advisory Group" — his own team-name affiliation is unconfirmed, flagged as a suspected but unverified shared team.')), 512)
WHERE id = 1576;

-- 1577 Sean Gaffney, CIBC Wood Gundy (Calgary Central Advisory Group), Calgary, AB
UPDATE contacts SET
  address = '500 Centre Street SE, 27th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Referenced under the same "Calgary Central Advisory Group" name as 1578 Saqeeb Rahman — suspected shared team, not cross-confirmed; roster not merged.')), 512)
WHERE id = 1577;

-- 1578 Saqeeb Rahman, CIBC Wood Gundy (Calgary Central Advisory Group), Calgary, AB
UPDATE contacts SET
  address = '500 Centre Street SE, 27th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Referenced under the same "Calgary Central Advisory Group" name as 1577 Sean Gaffney — suspected shared team, not cross-confirmed; roster not merged.')), 512)
WHERE id = 1578;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1578, x.name, x.role FROM (
  SELECT 'Cindy Truong' AS name, 'Client Associate' AS role
  UNION ALL SELECT 'Nasim Khan', 'Client Associate'
  UNION ALL SELECT 'Nicholas Molina', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1578)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1578 AND name = x.name);

-- 1458 Rod Bruchet, CG Wealth Management, Vancouver, BC (unverifiable, flag only)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Could not verify: no CG Wealth Management bio, LinkedIn, or CIRO record found; web search budget exhausted mid-research (hard 200/200 cutoff).')), 512)
WHERE id = 1458;

-- 1465 Alan Johnson, CG Wealth Management, Vancouver, BC (unverifiable, flag only)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Could not verify: not found on current CG Wealth Management/Canaccord Genuity Vancouver roster. An unconfirmed same-named obituary (West Vancouver, Feb 2025) surfaced but profession was not stated, so it is NOT treated as a confirmed death. Web search budget exhausted mid-research.')), 512)
WHERE id = 1465;
