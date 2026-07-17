-- Rest-of-Canada Financial Advisor enrichment, batch 14 of ~24 (18 contacts).
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- Three confirmed firm departures this batch (firm/title updated + flagged):
--   1366 Joseph Bakish (Pointe-Claire): Bakish Wealth (~$350M AUM) left
--     Richardson Wealth for Manulife Wealth Inc., Sept 2025, amid the iA
--     acquisition period. New street address unverified, left unset.
--   1529 Rebecca Broadley (Calgary): Broadley and Associates left BMO
--     Nesbitt Burns after ~27 years for Richardson Wealth, June 2024 —
--     same Eighth Avenue Place tower, Suite 4700 (Richardson) vs the BMO
--     branch's Suite 1100.
--   1388 Rob Campbell (Edmonton): left Richardson Wealth post-iA
--     acquisition; now co-leads the Campbell Germain Advisory Group at
--     NBF Edmonton (Suite 1800, 10175 101 Street NW).
--
-- Both suspected shared-team pairs were REFUTED — separate practices:
--   1470 Karen Harrison (The Harrison Group) vs 1471 Neil Gregory (The
--     Cartograph Group, ex "Gregory Wei Mutch Wealth Counsel") share the
--     same CG Calgary suite (520 3rd Ave SW, Suite 2400) — sequential
--     phone extensions come from the shared branch, not a shared book.
--   1570 Doug Lochhead (Granite Financial Group, 4 Donald St) vs 1567
--     Grant White (Endeavour Wealth Management, 201 Portage Ave) are
--     separate iA Private Wealth practices in Winnipeg.
--
-- Weak signals flagged, applied anyway per precedent: 1588 Darren Luck
-- (longtime team member now shows a Wellington-Altus profile; his own
-- CIBC status unconfirmed), 1570 Lochhead (publicized succession plan —
-- daughter joined to take over), 1764 Lamontagne (directory listing
-- reassigned to another advisor — likely benign), 1713 Terry Wright
-- (team member Chris Mills may have spun off his own RJ practice).
--
-- Shared-building notes (independent teams): 1634 Coreen Sol is the 5th
-- team at the CIBC Bentall suite (1055 Dunsmuir St, Suite 2434); 1424
-- Lev Zentner shares NBF Winnipeg (400 St. Mary Ave, Suite 1000) with
-- Current Wealth Advisors; 1796 Macenko Merkley shares the Scotia
-- Calgary branch (225 6th Ave SW, Suite 1700) with the Flores Advisory
-- Group; 1771 LaRochelle's former partners (O'Reilly Advisory Group)
-- remain at his same Medicine Hat address after the practice split.
--
-- Address-only entry (no team member met the strict full-name+title
-- bar): 1809 Cameron McLeod.

-- 1809 Cameron McLeod, Odlum Brown (Cameron McLeod Wealth Management), Vancouver, BC (address only)
UPDATE contacts SET address = 'Suite 1100 - 250 Howe Street' WHERE id = 1809;

-- 1470 Karen Harrison, CG Wealth Management (The Harrison Group), Calgary, AB
UPDATE contacts SET address = '520 3rd Avenue SW, Suite 2400' WHERE id = 1470;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1470, x.name, x.role FROM (
  SELECT 'Paul Harrison' AS name, 'Senior Portfolio Manager & Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Kathryn Low', 'Wealth Advisor (CFP, CIM)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1470)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1470 AND name = x.name);

-- 1366 Joseph Bakish — CONFIRMED DEPARTURE to Manulife Wealth (firm/title updated).
-- New street address unverified (possibly Saint-Laurent), so address stays
-- unset and the stale Richardson email is flagged.
UPDATE contacts SET
  firm = 'Manulife Wealth',
  title = 'Senior Wealth Advisor, Portfolio Manager',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'Left Richardson Wealth for Manulife Wealth Inc. (reported Sept 2025, amid the iA acquisition) — "Bakish Wealth," ~$350M AUM, 7-person team. New office address unverified (one snippet: 6265 Ch. de la Côte-de-Liesse, Saint-Laurent, QC); old Richardson email likely stale — verify before outreach.'))
WHERE id = 1366;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1366, x.name, x.role FROM (
  SELECT 'Gordon L. Kennedy' AS name, 'Wealth Advisor (Bakish Wealth, Manulife Wealth)' AS role
  UNION ALL SELECT 'Max Nykanorov', 'Portfolio Manager, Associate Wealth Advisor (Bakish Wealth)'
  UNION ALL SELECT 'Constance (Connie) Gallant', 'Business Development (Bakish Wealth)'
  UNION ALL SELECT 'Tania Italiano', 'Associate (Bakish Wealth)'
  UNION ALL SELECT 'Chrys Stamatakos', 'Client Service & Administration (Bakish Wealth)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1366)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1366 AND name = x.name);

-- 1713 Terry Wright, Raymond James (LT Wealth Management Partners), Vancouver, BC
UPDATE contacts SET
  address = '555 Burrard Street, 2nd Floor',
  data_flags = TRIM(CONCAT(data_flags, ' | Team is "LT Wealth Management Partners" (formerly Wright Wealth Management Group, joined RJ from NBF in 2017). Team member Chris Mills also appears heading "Mills Wealth Management" (RJ North Vancouver) — possible spin-off, verify roster.'))
WHERE id = 1713;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1713, x.name, x.role FROM (
  SELECT 'Patrick Caffrey' AS name, 'Partner, Tax Planning / Financial Advisor (CPA, CA, TEP, CFP, CIM)' AS role
  UNION ALL SELECT 'Chris Mills', 'Financial Advisor (CIM) — may have spun off own RJ practice'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1713)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1713 AND name = x.name);

-- 1764 Simon Lamontagne, ScotiaMcLeod (Groupe Lamontagne), Laval, QC
UPDATE contacts SET
  address = '600 Rue Lucien-Paiement, Suite 1210',
  data_flags = TRIM(CONCAT(data_flags, ' | Minor: a YellowPages listing formerly under his name now shows "Francois Laurin - ScotiaMcLeod" at the same address/phone — likely a directory reassignment, not a confirmed departure; team site still lists Lamontagne as lead.'))
WHERE id = 1764;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1764, x.name, x.role FROM (
  SELECT 'Alain Brossoit' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Jennifer Murphy', 'Investment Associate'
  UNION ALL SELECT 'Simon Trépanier', 'Investment Associate'
  UNION ALL SELECT 'Connie Frasca', 'Business Development Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1764)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1764 AND name = x.name);

-- 1570 Doug Lochhead, iA Private Wealth (Granite Financial Group), Winnipeg, MB
UPDATE contacts SET
  address = '4 Donald Street',
  data_flags = TRIM(CONCAT(data_flags, ' | Succession in progress: daughter Andrea Lochhead joined Granite Financial Group in 2023 to take over the practice (Globe and Mail); Doug remains active and also runs Next Chapter Succession Planning. Separate practice from Endeavour Wealth Management (Grant White).'))
WHERE id = 1570;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1570, x.name, x.role FROM (
  SELECT 'Andrea Lochhead' AS name, 'Investment Advisor (CIM, MBA) — successor-designate' AS role
  UNION ALL SELECT 'Robert Arndt', 'Investment Advisor (CFP, FMA)'
  UNION ALL SELECT 'Alaina LeDuc', 'Associate Investment Advisor (CFP, FMA, FCSI)'
  UNION ALL SELECT 'Roslyn McFarlane', 'Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1570)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1570 AND name = x.name);

-- 1471 Neil Gregory, CG Wealth Management (The Cartograph Group), Calgary, AB
UPDATE contacts SET
  address = '520 3rd Avenue SW, Suite 2400',
  data_flags = TRIM(CONCAT(data_flags, ' | Team rebranded from "Gregory Wei Mutch Wealth Counsel" to "The Cartograph Group" (joined CG from Richardson GMP in 2020, ~$350M AUM). Same CG Calgary suite as The Harrison Group — separate practices.'))
WHERE id = 1471;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1471, x.name, x.role FROM (
  SELECT 'Stanley Wei' AS name, 'Founding Partner and Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Grant Mutch', 'Portfolio Manager'
  UNION ALL SELECT 'Katie Morgan', 'Senior Wealth Associate & Financial Planning Associate'
  UNION ALL SELECT 'Veronica Rooney', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1471)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1471 AND name = x.name);

-- 1424 Lev Zentner, NBF Wealth Management (Zentner Wealth Advisory Group), Winnipeg, MB
UPDATE contacts SET address = 'Suite 1000 - 400 St. Mary Avenue' WHERE id = 1424;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1424, x.name, x.role FROM (
  SELECT 'Chantelle Nault' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Boedey Vaeth', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1424)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1424 AND name = x.name);

-- 1771 Steve LaRochelle, ScotiaMcLeod, Medicine Hat, AB
UPDATE contacts SET
  address = 'Suite 210, 12 Gehring Road SW',
  data_flags = TRIM(CONCAT(data_flags, ' | Former "LaRochelle O''Reilly Financial Advisory Group" has split — Todd/Ryan O''Reilly now operate the separate O''Reilly Advisory Group at the same address; Steve continues under his own standalone Scotia team site.'))
WHERE id = 1771;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1771, x.name, x.role FROM (
  SELECT 'Kendra Selk' AS name, 'Administrative Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1771)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1771 AND name = x.name);

-- 1529 Rebecca Broadley — CONFIRMED DEPARTURE to Richardson Wealth (firm/address/title updated).
UPDATE contacts SET
  firm = 'Richardson Wealth Ltd',
  title = 'Investment Advisor, Wealth Advisor',
  address = '525 8th Avenue SW, Suite 4700 (Eighth Avenue Place)',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'Left BMO Nesbitt Burns after ~27 years for Richardson Wealth Ltd., Calgary, June 2024 — "Broadley and Associates." Same tower as the BMO branch but Richardson is Suite 4700 (BMO is Suite 1100); old BMO email stale — verify before outreach.'))
WHERE id = 1529;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1529, x.name, x.role FROM (
  SELECT 'Preston Howell' AS name, 'Investment Advisor, Wealth Advisor' AS role
  UNION ALL SELECT 'Eleena Swan', 'Estate and Insurance Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1529)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1529 AND name = x.name);

-- 1796 Sandra Macenko Merkley, ScotiaMcLeod (The Macenko Merkley Group), Calgary, AB
UPDATE contacts SET address = '225 6th Avenue SW, Suite 1700' WHERE id = 1796;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1796, x.name, x.role FROM (
  SELECT 'Brayden Laurie' AS name, 'Associate (fully licensed)' AS role
  UNION ALL SELECT 'Paige Laurie', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1796)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1796 AND name = x.name);

-- 1388 Rob Campbell — CONFIRMED DEPARTURE to NBF Wealth Management (firm/address/title updated).
UPDATE contacts SET
  firm = 'NBF Wealth Management',
  title = 'Wealth Advisor & Portfolio Manager',
  address = 'Suite 1800, 10175 101 Street NW',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'Left Richardson Wealth post-iA acquisition; now co-leads the "Campbell Germain Advisory Group" at NBF Edmonton (move date unconfirmed, no press coverage found; identity verified by matching bios). Old Richardson email stale — verify before outreach.'))
WHERE id = 1388;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1388, x.name, x.role FROM (
  SELECT 'Jon Germain' AS name, 'Wealth Advisor, Portfolio Manager — team co-lead' AS role
  UNION ALL SELECT 'John Warnke', 'Wealth Advisor'
  UNION ALL SELECT 'Mary Powell', 'Wealth Associate'
  UNION ALL SELECT 'Gina Freeland', 'Wealth Associate'
  UNION ALL SELECT 'Sofia Oleksyn', 'Associate (administration, client service, onboarding)'
  UNION ALL SELECT 'Taylor Thursby', 'Associate (administration, client service, onboarding)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1388)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1388 AND name = x.name);

-- 1801 AJ Chase, ScotiaMcLeod (AJ Chase Financial Group), Hamilton, ON
UPDATE contacts SET address = '1 King Street West, Suite 1402' WHERE id = 1801;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1801, x.name, x.role FROM (
  SELECT 'Jacob Abraham' AS name, 'Senior Associate' AS role
  UNION ALL SELECT 'Sally Lee', 'Estate and Trust Consultant (J.D.)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1801)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1801 AND name = x.name);

-- 1772 Dion Zukiwsky, ScotiaMcLeod (The Zukiwsky Group), Red Deer, AB
UPDATE contacts SET address = '4320 50 Avenue, Suite 201' WHERE id = 1772;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1772, x.name, x.role FROM (
  SELECT 'Bond Jewell' AS name, 'Investment Associate' AS role
  UNION ALL SELECT 'Rachel Collin', 'Investment Associate'
  UNION ALL SELECT 'Jessaca Laboret', 'Assistant Branch Administrator'
  UNION ALL SELECT 'Katherine Nelson', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1772)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1772 AND name = x.name);

-- 1588 Darren Luck, CIBC Wood Gundy (Luck Financial Group), Windsor, ON (weak signal, applied + flagged)
UPDATE contacts SET
  address = '2510 Ouellette Avenue, Suite 101',
  data_flags = TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: longtime team member Stephanie Senteris (with the group since 2011) now has a Wellington-Altus advisor profile — possible departure or team move; Darren''s own current CIBC status unconfirmed (newest team publications found are from 2022). Verify before outreach.'))
WHERE id = 1588;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1588, x.name, x.role FROM (
  SELECT 'John Robinson' AS name, 'Estate Planning Specialist' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1588)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1588 AND name = x.name);

-- 1384 Mark Dumanowski, NBF Wealth Management (The Dumanowski Investment Group), Medicine Hat, AB
UPDATE contacts SET address = 'Suite 102, 505 1st Street SE' WHERE id = 1384;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1384, x.name, x.role FROM (
  SELECT 'Sam Dumanowski' AS name, 'Wealth Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1384)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1384 AND name = x.name);

-- 1567 Grant White, iA Private Wealth (Endeavour Wealth Management), Winnipeg, MB
UPDATE contacts SET address = '940-201 Portage Avenue' WHERE id = 1567;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1567, x.name, x.role FROM (
  SELECT 'Brandt Butt' AS name, 'Investment Advisor / Portfolio Manager' AS role
  UNION ALL SELECT 'Andrew Chan', 'Portfolio Manager (FCSI, CIM)'
  UNION ALL SELECT 'Ryan Secord', 'Senior Investment Advisor'
  UNION ALL SELECT 'Dennis Rubeniuk', 'Investment Advisor'
  UNION ALL SELECT 'Kondwelani Kalinda', 'Associate Investment Advisor'
  UNION ALL SELECT 'Kristy McDonald', 'Licensed Assistant'
  UNION ALL SELECT 'Cristina Mapuyan', 'Client Service Specialist'
  UNION ALL SELECT 'Alex Budgell', 'Director of Finance, Endeavour Group of Companies'
  UNION ALL SELECT 'Mitchell Cathcart', 'Marketing Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1567)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1567 AND name = x.name);

-- 1634 Coreen Sol, CIBC Wood Gundy (Solinvest), Vancouver, BC
UPDATE contacts SET address = '1055 Dunsmuir Street, Suite 2434' WHERE id = 1634;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1634, x.name, x.role FROM (
  SELECT 'Torre Undseth' AS name, 'Client Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1634)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1634 AND name = x.name);
