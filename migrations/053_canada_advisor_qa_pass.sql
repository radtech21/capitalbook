-- QA pass on the rest-of-Canada Financial Advisor enrichment (migrations
-- 041-052): re-verified the weakest-confidence flagged records (6 fully
-- unverified contacts, 3 low-confidence "likely moved" claims) with a
-- fresh round of research agents using different search angles.
--
-- RESULT: Andrew Suthern (1661, batch 20/migration 048) — the "likely
-- moved to Sun Life" claim is WRONG. Four independent, current sources
-- (his own practice site, LinkedIn, Facebook business page, and a June
-- 2025 Wealth Professional Excellence Award — five months after the
-- claimed Sun Life start date) all show him still active at IPC
-- Securities Corporation / Suthern Private Wealth Management, Calgary.
-- The original My Business Magazine source (dated Feb 2024, not tied to
-- a 2025 Sun Life announcement as previously read) was misread. Reverted
-- to IPC Securities and the original address; the Sun Life claim is
-- corrected in data_flags rather than silently erased.
--
-- RESULT: Guy Cote (1856, batch 22/migration 050) — previously left
-- unconfirmed ("common name, no corroboration"). A second pass found the
-- team's reported AUM range ($2.2B-$2.9B across sources) closely matches
-- the CRM's recorded $2.86B figure, which is strong additional
-- corroboration beyond name/location alone. Now applying firm/address.
--
-- RESULT: Ross Campbell (1672, batch 19/migration 047) and Antoine
-- Niding (1835, batch 24/migration 052) — both "likely moved" claims are
-- now CORROBORATED by independent second sources (Camaco Capital's own
-- client-relationship disclosure for Campbell; RBC's own advisor
-- directory plus a renamed former-team page for Niding). No data change
-- needed, just a confidence-upgrade note.
--
-- RESULT: five contacts remain genuinely unconfirmable after a second,
-- differently-angled search pass (Sandra Smith 1620, Dorothy Keating
-- 1803, Conal Campbell 1444, Rod Bruchet 1458, Alan Johnson 1465) — no
-- changes made, existing flags stand. All five hit the same tooling
-- limitation (CIRO's registry and the relevant dealer "find an advisor"
-- pages are not scrapable), so this is a genuine data gap, not a
-- research shortfall.

-- 1661 Andrew Suthern — CORRECTION: still at IPC Securities, not Sun Life.
UPDATE contacts SET
  firm = 'IPC Securities Corporation — Suthern Private Wealth Management',
  title = 'Portfolio Manager',
  address = '1230, 1122 4th Street SW',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: the batch-20 "likely moved to Sun Life" flag was wrong. A QA re-check found four independent current sources (his own practice site, LinkedIn, Facebook business page, and a June 2025 Wealth Professional Excellence Award) all showing him still at IPC Securities / Suthern Private Wealth Management, Calgary — the original single source was misread.')), 512)
WHERE id = 1661;

-- 1672 Ross Campbell — confidence upgrade only (Q Wealth move corroborated by a second source).
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | QA re-check: the Q Wealth partnership is now corroborated by Camaco Capital''s own client-relationship disclosure, independent of the original email-domain inference.')), 512)
WHERE id = 1672;

-- 1835 Antoine Niding — confidence upgrade only (RBC move corroborated by a second source).
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | QA re-check: the RBC Dominion Securities move is now corroborated by RBC''s own advisor directory and by his former Richardson Wealth team page being renamed to drop his name.')), 512)
WHERE id = 1835;

-- 1856 Guy Cote — now confirmed via AUM-range corroboration; apply firm/address/team.
UPDATE contacts SET
  firm = 'National Bank Financial Wealth Management — Guy Côté Integrated Wealth Management',
  title = 'Senior Wealth Advisor & Portfolio Manager (Senior VP)',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'QA re-check: now confirmed — team''s publicly reported AUM range ($2.2B-$2.9B across sources) closely matches the CRM''s recorded $2.86B figure, corroborating the name/location match. Same NBF flagship building/suite as several other independent teams identified elsewhere in this project.')), 512)
WHERE id = 1856;
