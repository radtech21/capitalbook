-- Rest-of-Canada Financial Advisor enrichment, batch 23 (18 contacts).
-- Second batch of the "no firm recorded" phase (same "Global Pension &
-- Institutional" sourced list as batch 22). Every one of these 18 was
-- successfully identified as a retail wealth advisor — an unusually high
-- hit rate, likely because Montreal's major dealers (NBF, CIBC Wood
-- Gundy, Scotia Wealth, BMO Nesbitt Burns, Raymond James/3Macs, TD
-- Wealth) publish detailed team bio pages and are well covered by Globe
-- and Mail's "Top Wealth Advisors" rankings. As in batch 22, every
-- record is flagged noting the CRM's "pension/institutional" source-list
-- tag does not match the person's actual (retail wealth) role — treated
-- as an unresolved data-quality question, not silently corrected. All
-- direct fetches to advisor/firm sites returned 403, as expected.
--
-- THREE confirmed shared teams (cross-referenced independently by
-- multiple agents), rosters merged accordingly:
--   1837 Bob McKenzie / 1861 Jim Bowey / 1869 Nicholas Aristeo — Raymond
--     James "MBA Wealth Management" / Bowey-Aristeo Group. Note: an
--     address conflict surfaced (McKenzie/Bowey both independently found
--     1000 rue de la Gauchetière Suite 2600; Aristeo's agent found 1800
--     McGill College Ave Suite 915) — used the address confirmed by two
--     independent agents.
--   1865 Lionel Chriqui / 1868 Michel Rizkalla — NBF "Groupe conseil
--     Chriqui Rizkalla Paré."
--   1843 Charles Coulson / 1877 Stuart Ansky — CIBC Wood Gundy
--     "Ansky-Coulson Group."
--   1860 Jeffrey Alcorn / 1864 Karim Mahfouz / 1874 Richard Sauve — CIBC
--     Wood Gundy "SMA Investment Group."
--
-- 1855 Guillaume Maurice was identified in batch 22 as a team member on
-- his father Jacques Maurice's team (1858). Further research this batch
-- found he split off in 2017 to found his OWN separate practice at the
-- same Scotia building (different suite) — he is NOT currently a
-- subordinate on Jacques Maurice's team. Batch 22's migration (050) is
-- not being amended per this project's no-amend convention; this
-- migration's flag on 1855 documents the correction. 1858's own
-- data_flags already list Guillaume Maurice as a team member from batch
-- 22 and are not retroactively changed here.
--
-- Coincidental/overlap notes flagged, not merged: 1852 François Guy's
-- team sits at the exact same suite (1 Place Ville Marie, Suite 4125) as
-- 1843/1877's Ansky-Coulson Group — both CIBC Wood Gundy, likely a large
-- shared floor, not a shared team. 1846 Cimon Plante's teammate "Éric
-- Lamontagne" shares a full name with 1880 Yanick Page's teammate of the
-- same name — possibly the same person or a coincidental namesake,
-- flagged for manual review rather than merged.

-- 1837 Bob McKenzie, Raymond James (MBA Wealth Management / Bowey-Aristeo Group)
UPDATE contacts SET
  firm = 'Raymond James Ltd. — MBA Wealth Management (Bowey-Aristeo Group)',
  title = 'Senior Wealth Advisor / Portfolio Manager (CFA)',
  address = 'Suite 2600, 1000 rue de la Gauchetière Ouest',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1837;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1837, x.name, x.role FROM (
  SELECT 'James (Jim) Bowey, PhD, CIM' AS name, 'Senior Portfolio Manager & Partner' AS role
  UNION ALL SELECT 'Nicholas P. Aristeo, CIM', 'Senior Portfolio Manager & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1837)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1837 AND name = x.name);

-- 1861 Jim Bowey, Raymond James (MBA Wealth Management)
UPDATE contacts SET
  firm = 'Raymond James Ltd. — MBA Wealth Management (Bowey-Aristeo Group)',
  title = 'Senior Portfolio Manager and Partner (PhD, CIM)',
  address = 'Suite 2600, 1000 rue de la Gauchetière Ouest',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1861;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1861, x.name, x.role FROM (
  SELECT 'Bob McKenzie, CFA' AS name, 'Senior Wealth Advisor / Portfolio Manager' AS role
  UNION ALL SELECT 'Nicholas P. Aristeo, CIM', 'Senior Portfolio Manager & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1861)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1861 AND name = x.name);

-- 1869 Nicholas Aristeo, Raymond James (MBA Wealth Management)
UPDATE contacts SET
  firm = 'Raymond James Ltd. — MBA Wealth Management (Bowey-Aristeo Group)',
  title = 'Senior Portfolio Manager (CIM)',
  address = 'Suite 2600, 1000 rue de la Gauchetière Ouest',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Address conflict: this agent independently found Suite 915, 1800 McGill College Avenue — used the address confirmed by two other agents (1837, 1861) instead; verify before outreach.'))
WHERE id = 1869;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1869, x.name, x.role FROM (
  SELECT 'James Bowey, PhD, CIM' AS name, 'Senior Portfolio Manager' AS role
  UNION ALL SELECT 'Bob McKenzie, CFA', 'Senior Portfolio Manager'
  UNION ALL SELECT 'Kyle Prillo-Guaiani', 'Investment Advisor and Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1869)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1869 AND name = x.name);

-- 1875 Roberto Pietracupa, Scotia Wealth Management (Pietracupa Group)
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Pietracupa Group',
  title = 'Senior Wealth Advisor & Portfolio Manager (CIM)',
  address = '1002 rue Sherbrooke Ouest, bureau 1200',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1875;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1875, x.name, x.role FROM (
  SELECT 'David Stewart' AS name, 'Senior Wealth Advisor, Portfolio Manager (CIM)' AS role
  UNION ALL SELECT 'Melanie Ireland', 'Wealth Advisor, Portfolio Manager (CFA)'
  UNION ALL SELECT 'German Pulido', 'Wealth Advisor, Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1875)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1875 AND name = x.name);

-- 1865 Lionel Chriqui, NBF (Groupe conseil Chriqui Rizkalla Paré)
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Groupe conseil Chriqui Rizkalla Paré',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1865;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1865, x.name, x.role FROM (
  SELECT 'Michel Rizkalla' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Frédérick Paré', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Benoit Denommé', 'Wealth Advisor'
  UNION ALL SELECT 'Alexandra Boutin-Therrien', 'Wealth Advisor'
  UNION ALL SELECT 'Ryan Mago', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1865)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1865 AND name = x.name);

-- 1868 Michel Rizkalla, NBF (Groupe conseil Chriqui Rizkalla Paré)
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Groupe conseil Chriqui Rizkalla Paré',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1868;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1868, x.name, x.role FROM (
  SELECT 'Lionel Chriqui' AS name, 'Senior Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Frédérick Paré', 'Wealth Advisor & Portfolio Manager'
  UNION ALL SELECT 'Benoit Denommé', 'Wealth Advisor'
  UNION ALL SELECT 'Ryan Mago', 'Wealth Advisor'
  UNION ALL SELECT 'Alexandra Boutin-Therrien', 'Wealth Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1868)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1868 AND name = x.name);

-- 1843 Charles Coulson, CIBC Wood Gundy (Ansky-Coulson Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Ansky-Coulson Group',
  title = 'Investment Advisor / Portfolio Manager (co-lead)',
  address = '1 Place Ville Marie, Suite 4125',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1843;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1843, x.name, x.role FROM (
  SELECT 'Stuart Ansky' AS name, 'Investment Advisor / co-lead' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1843)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1843 AND name = x.name);

-- 1877 Stuart Ansky, CIBC Wood Gundy (Ansky-Coulson Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Ansky-Coulson Group',
  title = 'Investment Advisor (VP), co-head',
  address = '1 Place Ville Marie, Suite 4125',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1877;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1877, x.name, x.role FROM (
  SELECT 'Charles Coulson' AS name, 'Investment Advisor / co-lead' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1877)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1877 AND name = x.name);

-- 1844 Charles Edgar Martin, TD Wealth (The Martin Advisory Group)
UPDATE contacts SET
  firm = 'TD Wealth Private Investment Advice — The Martin Advisory Group',
  title = 'Investment Advisor / Portfolio Manager (CFA), team lead',
  address = '1350 boulevard René-Lévesque Ouest, 8e étage',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1844;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1844, x.name, x.role FROM (
  SELECT 'Guillaume Paradis, CFA' AS name, 'Team member (ex-TD Asset Management RVP)' AS role
  UNION ALL SELECT 'Kevin Quach', 'Business Succession Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1844)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1844 AND name = x.name);

-- 1855 Guillaume Maurice, Scotia Wealth Management (own practice, Guillaume Maurice Group)
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Guillaume Maurice Group',
  title = 'Portfolio Manager / Senior Wealth Advisor (CIM)',
  address = '1002 Sherbrooke Street West, Suite 300',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Son of 1858 Jacques Maurice — joined his father''s "Jacques Maurice Group" in 2010 but split off in 2017 to found his own separate practice at the same Scotia building, different suite; NOT currently a subordinate team member of Jacques Maurice Group.'))
WHERE id = 1855;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1855, x.name, x.role FROM (
  SELECT 'Jonathan Hynes, CIM' AS name, 'Investment Associate & Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Ati Abhari, MSc, MBA, Adm.A., C.M.C.', 'Investment Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1855)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1855 AND name = x.name);

-- 1880 Yanick Page, NBF (Pagé Plante Group)
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Pagé Plante Group',
  title = 'Senior Wealth Advisor & Portfolio Manager (partner/head)',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Teammate "Éric Lamontagne" shares a full name with 1846 Cimon Plante''s teammate of the same name — possibly the same person or a coincidental namesake, flagged for review.'))
WHERE id = 1880;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1880, x.name, x.role FROM (
  SELECT 'Éric Lamontagne' AS name, 'Wealth Advisor & Portfolio Manager' AS role
  UNION ALL SELECT 'Jessy Kraitem', 'Wealth Management Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1880)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1880 AND name = x.name);

-- 1860 Jeffrey Alcorn, CIBC Wood Gundy (SMA Investment Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — SMA Investment Group',
  title = 'Senior Wealth Advisor / Portfolio Manager (co-founder)',
  address = '600 Boul. de Maisonneuve Ouest, Bureau 3050',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1860;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1860, x.name, x.role FROM (
  SELECT 'Richard Sauvé' AS name, 'Senior Wealth Advisor / Portfolio Manager (co-founder, CIM)' AS role
  UNION ALL SELECT 'Karim Mahfouz', 'Senior Wealth Advisor (co-founder)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1860)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1860 AND name = x.name);

-- 1864 Karim Mahfouz, CIBC Wood Gundy (SMA Investment Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — SMA Investment Group',
  title = 'Senior Wealth Advisor',
  address = '600 Boulevard de Maisonneuve Ouest, Bureau 3050',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1864;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1864, x.name, x.role FROM (
  SELECT 'Jeffrey Alcorn' AS name, 'Wealth Advisor (co-founder)' AS role
  UNION ALL SELECT 'Richard Sauvé', 'VP, Portfolio Manager (co-founder)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1864)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1864 AND name = x.name);

-- 1874 Richard Sauve, CIBC Wood Gundy (SMA Investment Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — SMA Investment Group',
  title = 'Vice-President, Portfolio Manager (Senior Wealth Advisor), co-founder',
  address = '600 Boulevard de Maisonneuve Ouest, Bureau 3050',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1874;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1874, x.name, x.role FROM (
  SELECT 'Jeffrey Alcorn' AS name, 'Senior Wealth Advisor & Portfolio Manager (co-founder)' AS role
  UNION ALL SELECT 'Karim Mahfouz', 'Senior Wealth Advisor (co-founder)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1874)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1874 AND name = x.name);

-- 1852 Francois Guy, CIBC Wood Gundy (Francois Guy Financial Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Francois Guy Financial Group (Guy & Roy Wealth Management)',
  title = 'First Vice President, Portfolio Manager & Investment Advisor',
  address = '1 Place Ville Marie, Suite 4125',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares the same exact suite number as 1843/1877''s Ansky-Coulson Group — likely a large shared CIBC Wood Gundy floor, not the same team; flagged, not merged.'))
WHERE id = 1852;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1852, x.name, x.role FROM (
  SELECT 'Eric Roy' AS name, 'Associate Portfolio Manager' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1852)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1852 AND name = x.name);

-- 1846 Cimon Plante, NBF (Plante Group)
UPDATE contacts SET
  firm = 'National Bank Financial – Wealth Management — Plante Group',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '1 Place Ville-Marie, Suite 1700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Teammate "Éric Lamontagne" shares a full name with 1880 Yanick Page''s teammate of the same name — possibly the same person or a coincidental namesake, flagged for review.'))
WHERE id = 1846;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1846, x.name, x.role FROM (
  SELECT 'Caroline Bédard' AS name, 'Portfolio Manager' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1846)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1846 AND name = x.name);

-- 1839 Bruno Masson, BMO Nesbitt Burns (MPB & Associates)
UPDATE contacts SET
  firm = 'BMO Nesbitt Burns (BMO Private Wealth) — MPB & Associates',
  title = 'Portfolio Manager (CPA, MBA, CIM)',
  address = '1501 Avenue McGill College, Suite 3200',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Disambiguated from an unrelated same-named LinkedIn profile in a different field.'))
WHERE id = 1839;

-- 1841 Caroline Hild, Scotia Wealth Management (Caroline Hild Group)
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Caroline Hild Group',
  title = 'Senior Wealth Advisor, Portfolio Manager',
  address = '1002 Sherbrooke Street West, Suite 600',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1841;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1841, x.name, x.role FROM (
  SELECT 'Emmanuel Andrikopoulos' AS name, 'Investment Associate' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1841)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1841 AND name = x.name);
