-- Rest-of-Canada Financial Advisor enrichment, batch 22 (18 contacts).
-- First batch of the "no firm recorded" phase — all 18 contacts are
-- sourced from a CRM list tagged "Global Pension & Institutional," with
-- generic title "Advisor," no email/phone, and no city (only province).
-- Contrary to expectations going in, nearly all of these turned out to
-- be identifiable, well-documented RETAIL wealth advisors (mostly at
-- National Bank Financial) rather than pension-fund staff — the AUM
-- figures on these CRM records appear to be team/practice book sizes,
-- not institutional fund assets. Every match below carries an explicit
-- note that the "pension/institutional" CRM source-list categorization
-- does not match the person's actual (retail wealth) role — this is
-- flagged on every record as an unresolved data-quality question, not
-- silently corrected. All direct fetches to advisor/firm sites returned
-- 403, as expected; findings rely on search snippets, Globe and Mail
-- "Top Wealth Advisors" profiles, and secondary aggregators.
--
-- Confirmed as the SAME TEAM (cross-referenced): 1830 Richard Brunet and
-- 1876 Sophie Paquet are both members of "Groupe Financier Brunet
-- Gilbert Paquet" at National Bank Financial, Quebec City — same address,
-- independently corroborated by both agents. Their rosters include each
-- other.
--
-- Shared-building note (independent teams, not merged): 1833 An-Lap
-- Vo-Dignard, 1848 Daniel Lalonde, 1871 Nicolas Schulman, and 1879
-- Vincent Compagnat are all National Bank Financial teams at the same
-- landmark address (1 Place Ville-Marie, Suite 1700, Montreal) — a large
-- shared NBF flagship floor, not evidence of a shared team.
--
-- Confirmed unrelated despite matching surnames: 1827 David Poliquin
-- (iA Private Wealth/BGY) and 1828 Jean Poliquin (National Bank
-- Financial, Trois-Rivières) were both explicitly checked and are
-- different, unrelated advisors.
--
-- One contact could not be confirmed at all and receives no firm/address
-- change: 1856 Guy Cote (Guy Côté) — the only substantive "Guy Côté" in
-- Quebec finance is a retail NBF wealth advisor at the same 1 Place
-- Ville-Marie building as several others in this batch, but the agent
-- declined to adopt this as a confirmed match given the common name and
-- source-list mismatch; noted as an unverified lead only.
--
-- One compliance note (not an identity concern): 1858 Jacques Maurice
-- has a 2019 CIRO/IIROC enforcement/settlement record on file while a
-- Registered Representative at Scotia Capital Inc.'s Montreal branch.

-- 1858 Jacques Maurice — CONFIRMED, high confidence (AUM matches team book almost exactly).
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Jacques Maurice Group',
  title = 'Senior Wealth Advisor and Director, Wealth Management',
  address = '1002, rue Sherbrooke Ouest, 3e étage, bureau 300',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff — team AUM matches the CRM figure almost exactly. Note: a 2019 CIRO/IIROC enforcement/settlement record exists for this individual — relevant for compliance review.'))
WHERE id = 1858;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1858, x.name, x.role FROM (
  SELECT 'Marc-Antoine Saad' AS name, 'Partner, Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Guillaume Maurice', 'Portfolio Manager'
  UNION ALL SELECT 'Rosemarie Bertrand, CIM', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1858)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1858 AND name = x.name);

-- 1849 Darren Carmosino — CONFIRMED, high confidence.
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Carmosino Wealth Management',
  title = 'Vice President, Investment Advisor / Portfolio Manager',
  address = '1250 René-Lévesque Blvd West, Suite 3100',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1849;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1849, x.name, x.role FROM (
  SELECT 'Marc-André Chartier' AS name, 'Associate Wealth Advisor' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1849)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1849 AND name = x.name);

-- 1833 An-Lap Vo-Dignard — CONFIRMED, high confidence.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Vo-Dignard Provost Group',
  title = 'Senior Wealth Advisor & Portfolio Manager (Senior VP)',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares this NBF flagship building/suite with several other independent teams identified this batch.'))
WHERE id = 1833;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1833, x.name, x.role FROM (
  SELECT 'Ian Provost' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Charles Provost', 'Wealth Advisor & Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1833)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1833 AND name = x.name);

-- 1842 Catherine Laurin — PLAUSIBLE match, moderate confidence.
UPDATE contacts SET
  firm = 'BMO Nesbitt Burns (BMO Private Wealth) — Anderson Laurin Investment Management',
  title = 'Senior Portfolio Manager, Investment Advisor',
  address = '1501 McGill College Avenue, Suite 3200',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. Only credible "Catherine Laurin" in QC finance is this BMO retail/private-wealth Senior Portfolio Manager — no CDPQ/PSP/CPPIB connection found, so the pension/institutional sourcing is unresolved; treat as plausible but not fully confirmed.'))
WHERE id = 1842;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1842, x.name, x.role FROM (
  SELECT 'Tim Anderson, CFA' AS name, 'Senior Portfolio Manager (co-lead)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1842)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1842 AND name = x.name);

-- 1854 George Sakkas — PLAUSIBLE match, moderate confidence.
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Lambert Sakkas Marsh',
  title = 'Portfolio Manager, Senior Wealth Advisor (CFA)',
  address = '1002 Sherbrooke St. West, Suite 650',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. Team AUM (~$2.7B reported) close to the CRM figure supports a retail wealth-team match, not pension staff. Team page could not be directly fetched; roster from search snippets only. Team appears rebranded from "Lambert, Klimis, Sakkas & Marsh" — Klimis may have departed.'))
WHERE id = 1854;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1854, x.name, x.role FROM (
  SELECT 'Jean-Alexandre Lambert' AS name, 'Senior Wealth Advisor' AS role
  UNION ALL SELECT 'David Marsh', 'Wealth Advisor/team partner'
  UNION ALL SELECT 'Luisa Mariani', 'Administrative/Transaction Services Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1854)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1854 AND name = x.name);

-- 1830 Richard Brunet — CONFIRMED shared team with 1876 Sophie Paquet.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Groupe Financier Brunet Gilbert Paquet',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '500 Grande Allée Est, Bureau 400',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Same team as 1876 Sophie Paquet — cross-confirmed by both agents.'))
WHERE id = 1830;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1830, x.name, x.role FROM (
  SELECT 'Sophie Paquet' AS name, 'Senior Wealth Advisor / Portfolio Manager, VP' AS role
  UNION ALL SELECT 'David Gilbert', 'Investment Advisor, Portfolio Manager, VP'
  UNION ALL SELECT 'Gaétan Turmel', 'Senior Investment Advisor and Portfolio Manager'
  UNION ALL SELECT 'Adriana Popa', 'Associate Investment Advisor'
  UNION ALL SELECT 'Charles-Antoine Montreuil', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Olivier Deblois', 'Wealth Advisor'
  UNION ALL SELECT 'Nicolas Gauthier', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1830)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1830 AND name = x.name);

-- 1876 Sophie Paquet — CONFIRMED shared team with 1830 Richard Brunet.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Groupe Financier Brunet Gilbert Paquet',
  title = 'Senior Wealth Advisor / Investment Advisor, Portfolio Manager, VP',
  address = '500 Grande Allée Est, Bureau 400',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Same team as 1830 Richard Brunet — cross-confirmed by both agents.'))
WHERE id = 1876;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1876, x.name, x.role FROM (
  SELECT 'Richard Brunet' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'David Gilbert', 'Investment Advisor, Portfolio Manager, VP'
  UNION ALL SELECT 'Gaétan Turmel', 'Senior Investment Advisor and Portfolio Manager'
  UNION ALL SELECT 'Adriana Popa', 'Associate Investment Advisor'
  UNION ALL SELECT 'Charles-Antoine Montreuil', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Olivier Deblois', 'Wealth Advisor'
  UNION ALL SELECT 'Nicolas Gauthier', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1876)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1876 AND name = x.name);

-- 1827 David Poliquin — PLAUSIBLE match, moderate confidence.
UPDATE contacts SET
  firm = 'BGY Services Financiers Intégrés / iA Private Wealth',
  title = 'Portfolio Manager / Associate (CFA)',
  address = '1411, rue Peel, Bureau 500',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. Wealth Professional 5-Star Advisor with a book trending toward the CRM AUM figure supports a retail wealth-advisor match, not pension staff. Confirmed UNRELATED to 1828 Jean Poliquin (different firm, coincidental surname). Firm-level Montreal address, not confirmed as his specific desk; firm also has a Quebec City HQ office.'))
WHERE id = 1827;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1827, x.name, x.role FROM (
  SELECT 'Miguel Yargeau' AS name, 'Associate Portfolio Manager (CIM)' AS role
  UNION ALL SELECT 'Sébastien Lavoie-Ramsay', 'Investment Advisor (CFA, CAIA)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1827)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1827 AND name = x.name);

-- 1840 Carl Parent — CONFIRMED, moderate confidence.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Parent-Bujold Wealth Management',
  title = 'Senior Wealth Advisor & Portfolio Manager (SVP)',
  address = '1802, rue King Ouest, Bureau 200',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; only credible namesake in Quebec finance, no pension-fund connection found — identified as a retail wealth advisor, not pension staff.'))
WHERE id = 1840;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1840, x.name, x.role FROM (
  SELECT 'Charles Parent' AS name, 'Senior Wealth Advisor' AS role
  UNION ALL SELECT 'Eric Bujold', 'Wealth Advisor'
  UNION ALL SELECT 'Jean-Didier Lapointe', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1840)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1840 AND name = x.name);

-- 1848 Daniel Lalonde — PLAUSIBLE match, moderate confidence.
UPDATE contacts SET
  firm = 'National Bank Financial Wealth Management — Lalonde-Doyon Group',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. No institutional/pension "Daniel Lalonde" found in Quebec; ruled out an unrelated fashion-retail executive of the same name. Shares this NBF flagship building/suite with several other independent teams identified this batch.'))
WHERE id = 1848;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1848, x.name, x.role FROM (
  SELECT 'Marcel Jr Doyon' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Bassam Touchan', 'Wealth Management Advisor (MBA, CPA)'
  UNION ALL SELECT 'Christophe De Guise', 'Wealth Management Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1848)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1848 AND name = x.name);

-- 1829 Louis-Philippe Pouliot — CONFIRMED, moderate confidence.
UPDATE contacts SET
  firm = 'National Bank Financial Wealth Management — Groupe Pouliot Jarry Verreault',
  title = 'Portfolio Manager & Senior Wealth Advisor',
  address = '2600 Boulevard Laurier, Place de la Cité, Bureau 700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; ruled out an unrelated iA Financial insurance executive of the same name. Retail wealth-advisor match, not pension staff.'))
WHERE id = 1829;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1829, x.name, x.role FROM (
  SELECT 'Martin Jarry' AS name, 'Senior Wealth Management Advisor' AS role
  UNION ALL SELECT 'Pierre-Charles Verreault', 'Portfolio Manager & Wealth Management Advisor'
  UNION ALL SELECT 'Vincent Couture', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1829)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1829 AND name = x.name);

-- 1878 Sebastien St-Hilaire — CONFIRMED, moderate confidence.
UPDATE contacts SET
  firm = 'Valeurs mobilières Desjardins — Équipe Leblanc Martineau St-Hilaire L''Heureux',
  title = 'Investment Advisor & Portfolio Manager',
  address = '1170, rue Peel, Bureau 300',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; team AUM aligns closely, ruled out a journalist and an unrelated deceased namesake. Retail wealth-advisor match, not pension staff.'))
WHERE id = 1878;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1878, x.name, x.role FROM (
  SELECT 'Marc Leblanc' AS name, 'Senior Wealth Manager' AS role
  UNION ALL SELECT 'Stéphane Martineau', 'Investment Advisor & Portfolio Manager'
  UNION ALL SELECT 'Frédéric L''Heureux, CFA, MBA', 'Portfolio Manager (ex-Caisse de dépôt et placement du Québec)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1878)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1878 AND name = x.name);

-- 1828 Jean Poliquin — PLAUSIBLE match, moderate confidence.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Groupe conseil Poliquin Marquette Charlebois Gervais',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '7200, rue Marion (National Bank Financial branch)',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. 30+ year NBF career, only Jean Poliquin found active in QC finance. Confirmed UNRELATED to 1827 David Poliquin (different firm, coincidental surname). Branch-level address; suite number not confirmed.'))
WHERE id = 1828;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1828, x.name, x.role FROM (
  SELECT 'Benoit Marquette' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Patrick Charlebois', 'Senior Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Ghislain Gervais', 'Wealth Management Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1828)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1828 AND name = x.name);

-- 1867 Michael Zukor — CONFIRMED, moderate-high confidence.
UPDATE contacts SET
  firm = 'BMO Nesbitt Burns (BMO Private Wealth) — Zukor Investment Group',
  title = 'Portfolio Manager / Investment Advisor (CIM, CPA, CA)',
  address = '1501 av. McGill College, Suite 3200',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares the same building as 1842 Catherine Laurin''s BMO team — different suite/team, independent.'))
WHERE id = 1867;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1867, x.name, x.role FROM (
  SELECT 'Barbara Zukor, BSc, CFA' AS name, 'Portfolio Manager / SVP, BMO Private Wealth (mother, team lead)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1867)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1867 AND name = x.name);

-- 1879 Vincent Compagnat — CONFIRMED, moderate-high confidence.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Compagnat Reise Group',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares this NBF flagship building/suite with several other independent teams identified this batch.'))
WHERE id = 1879;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1879, x.name, x.role FROM (
  SELECT 'Peter Reise' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1879)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1879 AND name = x.name);

-- 1866 Marc Dalpe (Marc Dalpé) — CONFIRMED, moderate-high confidence (moved teams recently).
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Dalpé Wealth Partners',
  title = 'Senior Wealth Advisor / Senior Portfolio Manager',
  address = '9001 boul. de l''Acadie, Bureau 802',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. Well-known advisor who moved his ~10-person team (~$900M book) from Richardson Wealth to National Bank Financial in 2024/2025 — retail wealth advisor, not pension staff. Address moderately confirmed; a second downtown NBF location could not be fully ruled out.'))
WHERE id = 1866;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1866, x.name, x.role FROM (
  SELECT 'Jean-Philippe Phaneuf' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Jean-Mikael Michaud', 'Portfolio Manager & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1866)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1866 AND name = x.name);

-- 1871 Nicolas Schulman — CONFIRMED, moderate confidence.
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Family Wealth Management Schulman Group',
  title = 'Senior Wealth Advisor & Portfolio Manager (CIM)',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; award-winning practice, no CDPQ/pension connection found. Shares this NBF flagship building/suite with several other independent teams identified this batch.'))
WHERE id = 1871;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1871, x.name, x.role FROM (
  SELECT 'Alexandre Béland St-Denis' AS name, 'Wealth Advisor' AS role
  UNION ALL SELECT 'Simon Léveillé', 'Wealth Advisor'
  UNION ALL SELECT 'Fabrice Laques', 'Wealth Advisor'
  UNION ALL SELECT 'Rafik El-Badawi', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1871)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1871 AND name = x.name);

-- 1856 Guy Cote (Guy Côté) — NOT CONFIRMED, flag only, no firm/address applied.
UPDATE contacts SET
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'Could not confirm: the only substantive same-named lead is "Guy Côté Integrated Wealth Management," a retail wealth team at National Bank Financial (1 Place Ville-Marie, Suite 1700, Montreal — same building as several other confirmed matches this batch), but the name is common and no pension/institutional connection or corroborating detail was found to confirm this is the same person. Unverified lead only.'))
WHERE id = 1856;
