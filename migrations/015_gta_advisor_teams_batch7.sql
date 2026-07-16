-- Batch 7 of GTA "advisor team" enrichment (18 more contacts, same methodology
-- as migrations 009-014). Two contacts are skipped entirely this round —
-- both confirmed employer changes, not branch moves:
--
--   1555 Nicholas Palahnuk — well-corroborated (RBC's own wealth site, LinkedIn,
--     a legal filing) that he left BMO Nesbitt Burns for RBC Dominion
--     Securities, now leading "The Palahnuk Group" there. The CRM's firm field
--     itself is stale; not writing the old BMO address/team.
--   1401 Dustin Van Der Hout — left Richardson Wealth Ltd for Wellington-Altus
--     Private Wealth; his practice "Van Der Hout Associates Wealth Management"
--     now operates under Wellington-Altus. Same reasoning as 1555: a genuine
--     employer change, not a branch move, so nothing applied here.
--
-- One more contact gets no data applied for a different reason:
--
--   1536 Jonathan Lin — the CRM lists Toronto, but his real branch is in
--     Oakville, ON (360 Oakville Place Drive). Per the batch-3 precedent
--     (Nadeau/Abbott), don't write a street address under the wrong city.
--     No team member met the name+title accuracy bar either, so nothing is
--     applied for this contact this round.
--
-- Two more shared-building notes, consistent with prior batches: 1750 Laurie
-- Peterkin's assistant Sarah Halabi also appears on 1733 Greg Holohan's team
-- (batch 2) — same Markham building, genuinely two different people sharing a
-- name is not the case here; she appears to support both practices at 675
-- Cochrane Drive. 1443 Steve Stavridis and 1784 Peter Corolis each have one
-- team member flagged as a shared/firm-wide resource (Ben Fawcett; Annalisa
-- Mohammed) rather than exclusive to their team, included with a note per the
-- precedent set with Jamie Golombek in earlier batches.

-- 1562 Debbie Bongard, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 40th Floor' WHERE id = 1562;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1562, x.name, x.role FROM (
  SELECT 'Christopher Bowlby' AS name, 'Portfolio Manager' AS role
  UNION ALL SELECT 'Rosemary Hart', 'Investment Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1562)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1562 AND name = x.name);

-- 1750 Laurie Peterkin, ScotiaMcLeod, Markham — shares assistant Sarah Halabi
-- with 1733 Greg Holohan (batch 2), same building
UPDATE contacts SET address = '675 Cochrane Drive, Suite 115' WHERE id = 1750;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1750, x.name, x.role FROM (
  SELECT 'Laura Paradiso' AS name, 'Wealth Advisor, Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Sarah Halabi', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1750)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1750 AND name = x.name);

-- 1443 Steve Stavridis, CG Wealth Management, Toronto — Ben Fawcett is a
-- shared/firm-wide Canaccord Genuity resource, not exclusive to this team
UPDATE contacts SET address = '40 Temperance Street, Suite 2000' WHERE id = 1443;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1443, x.name, x.role FROM (
  SELECT 'Linda Dinsmore' AS name, 'Senior Investment Advisor Assistant' AS role
  UNION ALL SELECT 'Ben Fawcett', 'Vice President & Portfolio Manager, Investment Advisory Solutions (shared firm resource)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1443)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1443 AND name = x.name);

-- 1264 Andrew Greene, Wellington-Altus Private Wealth, Toronto (North York)
UPDATE contacts SET address = '2255 Sheppard Avenue East, Suite 420E' WHERE id = 1264;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1264, x.name, x.role FROM (
  SELECT 'Paul J. Greene' AS name, 'Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Ian Garriock', 'Vice-President, Senior Investment Advisor'
  UNION ALL SELECT 'Tyler Manning', 'Vice-President, Senior Investment Advisor'
  UNION ALL SELECT 'Murray McGuire', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Emily Wood', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Yashmeen Saroye', 'Investment Associate'
  UNION ALL SELECT 'Shilpa Shanbhag', 'Associate (Compliance)'
  UNION ALL SELECT 'Diana Schweissing', 'Licensed Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1264)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1264 AND name = x.name);

-- 1550 Patrick Taylor, BMO Nesbitt Burns, Toronto (address only; two team
-- members found on his team page, Kathryn and Omar, but only first names
-- surfaced through search snippets — excluded per the name+title bar)
UPDATE contacts SET address = '1 First Canadian Place' WHERE id = 1550;

-- 1536 Jonathan Lin — DELIBERATELY NOTHING APPLIED. See note at top of file:
-- CRM lists Toronto but his real branch is in Oakville, and no team member
-- met the accuracy bar either.

-- 1411 Ted Friesen, NBF Wealth Management, Mississauga
UPDATE contacts SET address = '350 Burnhamthorpe Road W, Suite 603' WHERE id = 1411;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1411, 'David Przystal', 'Senior Wealth Associate, Chartered Investment Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1411)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1411 AND name = 'David Przystal');

-- 1720 Jessica Arakgi, Nicola Wealth, Toronto (address only; suite number
-- conflicted across sources so only the building address is used, and no
-- team member met the accuracy bar)
UPDATE contacts SET address = '175 Bloor Street East, North Tower' WHERE id = 1720;

-- 1401 Dustin Van Der Hout — DELIBERATELY NOTHING APPLIED. See note at top of
-- file: confirmed departure from Richardson Wealth to Wellington-Altus Private
-- Wealth; the CRM's firm field itself needs updating, not just his address.

-- 1488 Lynn Lange, Manulife Securities (North Shore Wealth Management), Burlington
UPDATE contacts SET address = '1100 Walkers Line, Suite 202' WHERE id = 1488;

-- 1792 Rodrigo Domingues, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '40 King Street West, 16th Floor' WHERE id = 1792;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1792, 'Hussein Omar', 'Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1792)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1792 AND name = 'Hussein Omar');

-- 1683 David MacDougall, Raymond James (MacDougall Family Wealth Management / 3Macs), Toronto
UPDATE contacts SET address = '200 King Street West, Suite 1806' WHERE id = 1683;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1683, x.name, x.role FROM (
  SELECT 'Bart H. MacDougall' AS name, 'Investment Advisor & Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Meg Salazar', 'Senior Wealth Advisor Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1683)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1683 AND name = x.name);

-- 1784 Peter Corolis, ScotiaMcLeod, Toronto — Annalisa Mohammed's Private
-- Banking role also appears attached to other Scotia Wealth teams (shared
-- banking resource), included with a note per prior-batch precedent
UPDATE contacts SET address = '40 King Street West, 49th Floor' WHERE id = 1784;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1784, x.name, x.role FROM (
  SELECT 'Sasha Darling' AS name, 'Certified Financial Planner & Wealth Advisor' AS role
  UNION ALL SELECT 'Niral Vithlani', 'Associate, Chartered Investment Manager'
  UNION ALL SELECT 'Lexi Crooks Hurdon', 'Wealth Management Associate'
  UNION ALL SELECT 'Annalisa Mohammed', 'Private Banking, Director & Team Lead (shared banking resource)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1784)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1784 AND name = x.name);

-- 1605 George Wright, CIBC Wood Gundy, Burlington
UPDATE contacts SET address = '390 Brant Street, Suite 500' WHERE id = 1605;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1605, x.name, x.role FROM (
  SELECT 'Marta Bartoszek' AS name, 'Associate Investment Advisor' AS role
  UNION ALL SELECT 'Lauren Grimmer', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1605)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1605 AND name = x.name);

-- 1349 Julie Brough, Logan Wealth Management, Toronto — same building as
-- 1250/1269/1252 (batch 2, Rosedale Family Office), different suite,
-- independent firm
UPDATE contacts SET address = '10 Alcorn Avenue, Suite 303' WHERE id = 1349;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1349, x.name, x.role FROM (
  SELECT 'Timothy Logan' AS name, 'President' AS role
  UNION ALL SELECT 'Novlette Simpson', 'Chief Compliance Officer'
  UNION ALL SELECT 'Sanjay Makkar', 'Associate Portfolio Manager'
  UNION ALL SELECT 'Matthew Foglia', 'Portfolio Operations Client Service Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1349)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1349 AND name = x.name);

-- 1455 Darrell Thompson, CG Wealth Management, Toronto (address only; same
-- building/suite as 1442 Wolfgang Klein, batch 6 — independent team, no
-- support staff found for Thompson specifically)
UPDATE contacts SET address = '40 Temperance Street, Suite 2100' WHERE id = 1455;

-- 1618 Megan Deeks, CIBC Wood Gundy, Toronto — same building as several
-- earlier-batch contacts (independent teams)
UPDATE contacts SET address = 'Brookfield Place, Suite 600, 181 Bay Street' WHERE id = 1618;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1618, x.name, x.role FROM (
  SELECT 'Simon Paabor' AS name, 'Associate' AS role
  UNION ALL SELECT 'Brenda Sochaski', 'Chief Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1618)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1618 AND name = x.name);
