-- Rest-of-Canada Financial Advisor enrichment, batch 11 of ~24 (18 contacts),
-- plus two user-approved successor contacts for the batch-10 deaths.
-- All web-search-derived; direct fetches to advisor sites returned 403
-- throughout, as expected.
--
-- 1446 Cary Pinkowski + 1463 Lori Pinkowski were flagged as a possible
-- shared-team pair (same surname, identical AUM) but run SEPARATE,
-- independently branded practices at the same Canaccord Genuity office —
-- the identical AUM is likely a source-data artifact, noted in data_flags.
-- They are the 6th and 7th independent CG teams at 1133 Melville St,
-- Suite 1200, Vancouver.
--
-- One confirmed departure, applied per precedent:
--   1355 Brad Gustafson: Richardson Wealth -> NBF Wealth Management,
--     Calgary ("Gustafson Lienau Advisory Group," reported April 2026).
--     New NBF email is confirmed on the firm's own contact page, so the
--     stale Richardson email is replaced as well.
--
-- One confirmed retirement, flagged per the deceased/archived precedent
-- (reachable=0, no reassignment — successor disposition is a human call):
--   1325 Earl Kaplin (Assante Dorval): retired by Dec 2025 after 42
--     years; practice rebranded "KHB Capital" under partners Jeremy
--     Hampson and Olivier Brasseur.
--
-- One weak signal flagged: 1673 Ethan Astaneh (Nicola Wealth) now shows
-- an internal title ("Head of Practice Management and Advisor
-- Enablement") and may no longer be client-facing.
--
-- Shared-building notes: 1755 Mani Mohtadi joins Keil and the Cook team
-- at 650 West Georgia St, Vancouver; 1775 Shamsh Moosa is the 3rd
-- independent team in Stantec Tower, Edmonton (Klein, Knechtel); 1777
-- Jason Bell is the 3rd independent team at Constitution Square, Ottawa.
-- Shared CI/Scotia regional specialists (Cindy David, Nav Nijjar, Cheryl
-- Norton) are excluded from per-team rosters per the established rule.
--
-- New contacts (user-approved successor dispositions):
--   2458 Benoît Arsenault — successor to 1362 René Gagnon (deceased).
--   2459 Russell Hope — successor to 1480 Steve Barban (deceased).

-- 1446 Cary Pinkowski, CG Wealth Management (Pinkowski Group), Vancouver, BC
UPDATE contacts SET
  address = '1133 Melville St., Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM identical to 1463 Lori Pinkowski (separate practice, same office) — likely source-data artifact, verify AUM.')), 512)
WHERE id = 1446;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1446, x.name, x.role FROM (
  SELECT 'Kevin Liu' AS name, 'Investment Advisor' AS role
  UNION ALL SELECT 'Suzanne Wensley', 'Investment Advisor Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1446)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1446 AND name = x.name);

-- 1463 Lori Pinkowski, CG Wealth Management (Lori Pinkowski Wealth Management), Vancouver, BC
UPDATE contacts SET
  address = '1133 Melville St., Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM identical to 1446 Cary Pinkowski (separate practice, same office) — likely source-data artifact, verify AUM.')), 512)
WHERE id = 1463;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1463, x.name, x.role FROM (
  SELECT 'Marko Ferenc' AS name, 'Senior Investment Advisor & Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Marina Zlomislic', 'Licensed Registered Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1463)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1463 AND name = x.name);

-- 1355 Brad Gustafson — CONFIRMED DEPARTURE: Richardson Wealth -> NBF
-- Wealth Management, Calgary (April 2026). New email confirmed on NBF's
-- own contact page.
UPDATE contacts SET
  firm = 'NBF Wealth Management',
  address = 'Suite 3810, 855 2nd Street SW',
  email = 'brad.gustafson@nbc.ca',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Left Richardson Wealth for NBF Wealth Management, Calgary, April 2026 — "Gustafson Lienau Advisory Group." Firm, address, and email updated accordingly (old Richardson email stale).')), 512)
WHERE id = 1355;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1355, x.name, x.role FROM (
  SELECT 'Cameron Lienau' AS name, 'Wealth Advisor and Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Brittlyn Nickel', 'Operations Manager'
  UNION ALL SELECT 'Jeremy Stibbard', 'Senior Analyst, Wealth Management'
  UNION ALL SELECT 'Augustine Braima', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1355)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1355 AND name = x.name);

-- 1755 Mani Mohtadi, ScotiaMcLeod (Mohtadi Financial Advisory Group), Vancouver, BC
UPDATE contacts SET address = '650 West Georgia Street, Suite 1100' WHERE id = 1755;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1755, x.name, x.role FROM (
  SELECT 'Russ Aunger' AS name, 'Wealth Advisor (PFP, AMP, AICB)' AS role
  UNION ALL SELECT 'Anthony Pranata', 'Estate and Trust Consultant, Scotiatrust (TEP)'
  UNION ALL SELECT 'Miko Co, CIM', 'Investment management practice support (exact title unconfirmed)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1755)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1755 AND name = x.name);

-- 1712 Tony Lee, Nicola Wealth, Vancouver, BC (address only — firm publishes no per-advisor rosters)
UPDATE contacts SET address = 'Suite 500, 1508 West Broadway' WHERE id = 1712;

-- 1282 Kevin Anseeuw, Harbourfront Wealth Management (Trans Canada Wealth Management), Winnipeg, MB
UPDATE contacts SET address = '100-900 Harrow St. E' WHERE id = 1282;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1282, x.name, x.role FROM (
  SELECT 'Marc Sabourin' AS name, 'Co-Founder, Portfolio Manager' AS role
  UNION ALL SELECT 'Colin Sabourin', 'Co-Founder, Senior Investment Advisor'
  UNION ALL SELECT 'Matt Adams', 'Portfolio Manager & Senior Investment Advisor'
  UNION ALL SELECT 'Kevin Coulombe', 'Associate, Tax Specialist'
  UNION ALL SELECT 'Georgie Unsworth', 'Office Administrator'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1282)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1282 AND name = x.name);

-- 1385 Chad Krahn, NBF Wealth Management (Krahn Wealth Advisory Group), Kelowna, BC
UPDATE contacts SET address = '1631 Dickson Ave., Suite 1710 (Landmark 6)' WHERE id = 1385;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1385, x.name, x.role FROM (
  SELECT 'Lise Maurier' AS name, 'Senior Wealth Associate' AS role
  UNION ALL SELECT 'Kari Headley', 'Senior Wealth Associate'
  UNION ALL SELECT 'Jarrod Murphy', 'Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1385)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1385 AND name = x.name);

-- 1673 Ethan Astaneh, Nicola Wealth, Vancouver, BC (address + weak internal-role signal)
UPDATE contacts SET
  address = 'Suite 500, 1508 West Broadway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | WEAK SIGNAL: title now "Head of Practice Management and Advisor Enablement" (internal leadership role at Nicola Wealth) — may no longer be client-facing; needs manual verification.')), 512)
WHERE id = 1673;

-- 1324 Steve Willems, Assante Wealth Management (Willems Wealth Planning Group), Abbotsford, BC
UPDATE contacts SET address = '101 - 33386 South Fraser Way' WHERE id = 1324;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1324, x.name, x.role FROM (
  SELECT 'Brad Willems' AS name, 'Senior Wealth Advisor (CFP)' AS role
  UNION ALL SELECT 'Gavin Caldecott', 'Wealth Advisor (CFP, CPA, CGA, RIS)'
  UNION ALL SELECT 'Chris Meehan', 'Associate Financial Advisor'
  UNION ALL SELECT 'Sean Rosas', 'Investment Counsellor (CFA, MBA)'
  UNION ALL SELECT 'Sandy Friesen', 'Client Service Associate'
  UNION ALL SELECT 'Lorraine Gross', 'Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1324)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1324 AND name = x.name);

-- 1775 Shamsh Moosa, ScotiaMcLeod (The Moosa Group), Edmonton, AB
UPDATE contacts SET address = 'Suite 2100, 10220 103 Avenue NW (Stantec Tower)' WHERE id = 1775;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1775, x.name, x.role FROM (
  SELECT 'Rhett Rachinski' AS name, 'Investment Associate (CFP, CIM, BCom)' AS role
  UNION ALL SELECT 'Bevleen Notay', 'Administrative Support Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1775)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1775 AND name = x.name);

-- 1705 Adam Skillen, Raymond James (Skillen Investment Management), Exeter, ON
UPDATE contacts SET address = '70778 London Road' WHERE id = 1705;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1705, x.name, x.role FROM (
  SELECT 'Suzanne Mathers' AS name, 'Portfolio Manager (CPA)' AS role
  UNION ALL SELECT 'Jenna McBride', 'Associate Financial Advisor (CFP)'
  UNION ALL SELECT 'Jillian Clarke', 'Administrative Assistant'
  UNION ALL SELECT 'Kristy McBride', 'Administrative Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1705)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1705 AND name = x.name);

-- 1603 Jennifer Jackson, CIBC Wood Gundy (The Jackson Group), London, ON
UPDATE contacts SET address = '255 Queens Avenue, Suite 2200' WHERE id = 1603;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1603, x.name, x.role FROM (
  SELECT 'Michael "Mike" Long' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'James "Jim" Stuart', 'Wealth Advisor (CFA)'
  UNION ALL SELECT 'Lindsay Willemse', 'Client Associate'
  UNION ALL SELECT 'Cameron Sheppard', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1603)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1603 AND name = x.name);

-- 1777 Jason Bell, ScotiaMcLeod (Bell Reid Advisory Group), Ottawa, ON
UPDATE contacts SET address = '350 Albert Street, Suite 2100 (Constitution Square)' WHERE id = 1777;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1777, x.name, x.role FROM (
  SELECT 'Graham Reid' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Hussein Masri', 'Administrative Associate'
  UNION ALL SELECT 'Keegan Gomes', 'Senior Private Banker & Team Lead, Private Banking (team specialist)'
  UNION ALL SELECT 'Emily Racine', 'Estate and Trust Consultant, Scotiatrust (team specialist)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1777)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1777 AND name = x.name);

-- 1698 Mark Hougen, Raymond James (Hougen Wealth Management Team), Calgary, AB
UPDATE contacts SET address = 'Suite 4100, 525 8th Avenue SW' WHERE id = 1698;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1698, x.name, x.role FROM (
  SELECT 'Traci Meades' AS name, 'Senior Wealth Associate & Financial Planner (CPA, CFP, CIM)' AS role
  UNION ALL SELECT 'Maria Savino-Woroniuk', 'Client Service Specialist (CFP)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1698)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1698 AND name = x.name);

-- 1300 Miles Schiller, IG Private Wealth Management (Schiller, Spence & Associates), Lloydminster, AB
UPDATE contacts SET address = '4204 70th Avenue' WHERE id = 1300;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1300, x.name, x.role FROM (
  SELECT 'Bill Spence' AS name, 'Associate Consultant (CFP)' AS role
  UNION ALL SELECT 'Ilkin Hasanzade', 'Senior Financial Consultant (CFA, CFP, CLU, CIPM)'
  UNION ALL SELECT 'Cameron Wheeler', 'Associate Consultant'
  UNION ALL SELECT 'Denise Leslie', 'Senior Assistant'
  UNION ALL SELECT 'Norma Hauber', 'Executive Assistant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1300)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1300 AND name = x.name);

-- 1325 Earl Kaplin — CONFIRMED RETIRED (Dec 2025, after 42 years).
-- Flagged per the archived-contact precedent; successor disposition
-- (Jeremy Hampson / Olivier Brasseur, KHB Capital) is a human decision.
UPDATE contacts SET
  reachable = 0,
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'RETIRED (by Dec 2025, after 42 years — Globe and Mail, Jan 21, 2026). Practice rebranded "KHB Capital" under partners Jeremy Hampson and Olivier Brasseur (CI Assante), 2020 Trans-Canada Highway, Suite 200, Dorval — needs human decision on whether/how to add a successor contact.')), 512)
WHERE id = 1325;

-- 1732 Kim Mailey, ScotiaMcLeod (Mailey Rogers Group), West Vancouver, BC
UPDATE contacts SET address = '1555 Marine Drive, 3rd Floor' WHERE id = 1732;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1732, x.name, x.role FROM (
  SELECT 'Madison Mailey' AS name, 'Wealth and Insurance Advisor' AS role
  UNION ALL SELECT 'Brad Russell', 'Wealth Advisor (CFP)'
  UNION ALL SELECT 'Bryce Kiesser', 'Investment Associate and Relationship Manager'
  UNION ALL SELECT 'Tannis Fuller', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1732)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1732 AND name = x.name);

-- 1591 Luke Kratz, CIBC Wood Gundy (The Kratz Financial Group), Victoria, BC
UPDATE contacts SET address = '730 View Street, 9th Floor' WHERE id = 1591;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1591, x.name, x.role FROM (
  SELECT 'Jesse Ogloff, CFP, PFP' AS name, 'Associate Wealth Advisor' AS role
  UNION ALL SELECT 'Maia Winter, CIM', 'Financial Associate'
  UNION ALL SELECT 'Brandie Winship', 'Client Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1591)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1591 AND name = x.name);

-- New contact 2458: Benoît Arsenault — user-approved successor to 1362
-- René Gagnon (deceased Feb 20, 2026). Leads "Groupe Gagnon Arsenault"
-- at Desjardins Securities, Rimouski. No direct email/phone confirmed.
INSERT INTO contacts (id, name, title, firm, segment, priority, lead_score, email, email_status, phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm, firm_type, state_rank, rank_movement, uhnw, institutional, foundation, client_types, reachable, source_list, data_flags, address)
SELECT 2458, 'Benoît Arsenault', 'Senior Wealth Manager & Portfolio Manager', 'Desjardins Securities', 'Financial Advisor', 'C', 0,
  '', 'Unknown', '', 'Rimouski', 'QC', 'Canada',
  'QUEBEC', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as successor to deceased contact 1362 René Gagnon (Desjardins Securities, Rimouski, died Feb 20, 2026) — made partner Feb 2025 when the practice was renamed "Groupe Gagnon Arsenault"; now leads the team. Direct email/phone not confirmed.',
  '100, rue Julien-Réhel, Bureau 301'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2458);

INSERT INTO contact_people (contact_id, name, role)
SELECT 2458, x.name, x.role FROM (
  SELECT 'Mélanie Tapp' AS name, 'Associate Wealth Management Advisor' AS role
  UNION ALL SELECT 'Pier-Luc Perreault, CFA', 'Associate Wealth Management Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2458)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2458 AND name = x.name);

-- New contact 2459: Russell Hope — user-approved successor to 1480 Steve
-- Barban (deceased Oct 30, 2024). Continues the Gentry Capital practice
-- under Manulife Securities, Ottawa. No direct email/phone confirmed.
INSERT INTO contacts (id, name, title, firm, segment, priority, lead_score, email, email_status, phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm, firm_type, state_rank, rank_movement, uhnw, institutional, foundation, client_types, reachable, source_list, data_flags, address)
SELECT 2459, 'Russell Hope', 'Financial Advisor', 'Manulife Securities', 'Financial Advisor', 'C', 0,
  '', 'Unknown', '', 'Ottawa', 'ON', 'Canada',
  'ONTARIO', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as successor to deceased contact 1480 Steve Barban (Manulife Securities / Gentry Capital, Ottawa, died Oct 30, 2024) — continues the Gentry Capital practice at the same office. Direct email/phone not confirmed.',
  '1900 City Park Drive, Suite 508'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2459);
