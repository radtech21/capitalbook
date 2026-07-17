-- Rest-of-Canada Financial Advisor enrichment, batch 24 of 24 — FINAL
-- BATCH of the entire ~419-contact rest-of-Canada enrichment project.
-- Third and last batch of the "no firm recorded" phase (same "Global
-- Pension & Institutional" sourced list as batches 22-23), 20 contacts.
-- All direct fetches to advisor/firm sites returned 403, as expected.
-- Every record is flagged noting the CRM's "pension/institutional"
-- source-list tag does not match the person's actual (retail wealth)
-- role — an unresolved data-quality question, not silently corrected.
--
-- One confirmed SAME TEAM (cross-referenced): 1831 Adam Weinstock / 1847
-- Clifford Borden — Scotia Wealth Management "Borden Weinstock Group."
--
-- One likely departure flagged (moderate-high confidence, inferred from
-- content recency rather than a direct announcement):
--   1835 Antoine Niding (Laval): Richardson Wealth ("Beauchamp-Niding"
--     team) -> RBC Dominion Securities. Former colleague Marc Beauchamp's
--     status at RBC is unconfirmed, excluded from roster.
--
-- Three contacts have a geographic conflict with the CRM's "Montreal"
-- sub-region tag — their confirmed offices are actually in Quebec City.
-- Applied anyway (treating the sub-region tag as noise, consistent with
-- how the "pension/institutional" tag has also proven unreliable this
-- phase), each flagged accordingly:
--   1859 Jean-Maurice Vezina, 1857 Hugo Lehoux, 1850 Eric Moore (this
--   last one only "plausible," not fully confirmed).
--
-- Two shared-building patterns, now confirmed a THIRD independent time
-- each this session (not data errors, large shared floors):
--   1 Place Ville Marie, Suite 4125, Montreal (CIBC Wood Gundy): 1870
--     Nicholas Lebuis, joining 1843/1877 Ansky-Coulson Group (batch 23)
--     and 1852 Francois Guy (batch 23).
--   1170 Peel Street, Suite 300, Montreal (Desjardins Securities): 1881
--     Yves Lefebvre, joining 1878 Sebastien St-Hilaire (batch 22) and
--     1882 Edith Beaucage (this batch).
--
-- Also flagged, not merged: 1832 Alexander Gross and 1834 Andrew
-- Salpeter (CIBC Wood Gundy) and 1872 Peter Guidote / 1853 Gabriel
-- Melkonian (Canaccord Genuity) and 1845 Cielo Carin (Richardson Wealth)
-- all sit in the same 1250 René-Lévesque Blvd West office tower, at
-- least two in the exact same suite (2930) — a large shared building
-- with several independent dealers/teams, not evidence of a shared team.
--
-- One contact could not be found at any dealer or independent practice
-- despite thorough searching: none in this final batch — all 20 were
-- at least plausibly identified, the highest hit rate of the three
-- "no firm" batches.
--
-- This closes out the ~419-contact rest-of-Canada Financial Advisor
-- enrichment phase.

-- 1831 Adam Weinstock, Scotia Wealth Management (Borden Weinstock Group)
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Borden Weinstock Group',
  title = 'Senior Wealth Advisor & Portfolio Manager',
  address = '1002 Sherbrooke Street West, Suite 700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1831;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1831, x.name, x.role FROM (
  SELECT 'Clifford Borden' AS name, 'Wealth Advisor / co-lead' AS role
  UNION ALL SELECT 'Mathew Borden', 'Team member'
  UNION ALL SELECT 'François Beauregard', 'Pl. Fin., CFP, Financial Security Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1831)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1831 AND name = x.name);

-- 1847 Clifford Borden, Scotia Wealth Management (Borden Weinstock Group)
UPDATE contacts SET
  firm = 'Scotia Wealth Management (ScotiaMcLeod) — Borden Weinstock Group',
  title = 'Senior Wealth Advisor and Portfolio Manager',
  address = '1002 Sherbrooke St. West, Suite 700',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1847;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1847, x.name, x.role FROM (
  SELECT 'Adam Weinstock' AS name, 'Senior Wealth Advisor and Portfolio Manager (business partner)' AS role
  UNION ALL SELECT 'Pina Pepe', 'Investment Associate/Administrative Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1847)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1847 AND name = x.name);

-- 1838 Bradley Steinmetz, BMO Nesbitt Burns (Steinmetz Wealth)
UPDATE contacts SET
  firm = 'BMO Nesbitt Burns (BMO Private Wealth) — Steinmetz Wealth',
  title = 'Investment Advisor & Portfolio Manager',
  address = '1501 avenue McGill College, 32nd floor',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1838;

-- 1832 Alexander Gross, CIBC Wood Gundy (Gross Hanna / Gross Financial Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Gross Hanna / Gross Financial Group',
  title = 'Senior Portfolio Manager, Investment Advisor',
  address = '1250 René-Lévesque Blvd West, Suite 3100',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1832;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1832, x.name, x.role FROM (
  SELECT 'Maude Larose, CFA' AS name, 'Associate Investment Advisor & Associate Portfolio Manager' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1832)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1832 AND name = x.name);

-- 1834 Andrew Salpeter, CIBC Wood Gundy (Salpeter Financial Advisory Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Salpeter Financial Advisory Group',
  title = 'Senior Wealth Advisor & Portfolio Manager (CIM)',
  address = '1250 René-Lévesque Blvd West, Suite 3100',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares this office building/suite with several other independent teams identified this session — a large multi-dealer tower.'))
WHERE id = 1834;

-- 1862 Jim Wilson, CIBC Wood Gundy (Jim Wilson Financial Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Jim Wilson Financial Group',
  title = 'Investment Advisor / Senior Wealth Advisor & Portfolio Manager',
  address = '600 Boulevard de Maisonneuve Ouest, Bureau 3050',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1862;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1862, x.name, x.role FROM (
  SELECT 'Matthieu Piotte, CFA' AS name, 'Portfolio Manager' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1862)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1862 AND name = x.name);

-- 1882 Edith Beaucage, Desjardins Securities (Beaucage Bruneau Advisory Group)
UPDATE contacts SET
  firm = 'Valeurs mobilières Desjardins / Desjardins Securities — Beaucage Bruneau Advisory Group',
  title = 'Senior Wealth Manager (Portfolio Manager), co-lead',
  address = '1170 Rue Peel, Suite 300',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1882;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1882, x.name, x.role FROM (
  SELECT 'Christian Bruneau' AS name, 'Wealth Manager & Financial Planner (co-founder)' AS role
  UNION ALL SELECT 'Sophia Bouchard', 'Assistant Wealth Management Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1882)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1882 AND name = x.name);

-- 1859 Jean-Maurice Vezina, IG Wealth Management (semi-retired, geographic conflict)
UPDATE contacts SET
  firm = 'IG Wealth Management — Équipe Jean-Maurice Vézina',
  title = 'Conseiller émérite (Advisor Emeritus)',
  address = '955, Grande Allée Ouest, Québec',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Semi-retired — practice transitioned to son Jean-Philippe Vézina as lead advisor in Jan 2022, advisor-emeritus role continues. Confirmed office is Québec City, not Montreal as the CRM sub-region states — treated as noise, not disqualifying.'))
WHERE id = 1859;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1859, x.name, x.role FROM (
  SELECT 'Jean-Philippe Vézina, Pl.Fin., M.Fisc., CIM, A.V.A.' AS name, 'Financial Planner/Investment Advisor (son, current lead advisor)' AS role
  UNION ALL SELECT 'Justin Beaudoin, B.A.A., Pl.Fin.', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1859)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1859 AND name = x.name);

-- 1872 Peter Guidote, Canaccord Genuity Wealth Management (Guidote Wealth Stewardship)
UPDATE contacts SET
  firm = 'Canaccord Genuity Wealth Management — Guidote Wealth Stewardship',
  title = 'Investment Advisor / Portfolio Manager',
  address = '1250 René-Lévesque Blvd West, Suite 2930',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares this office building/suite with several other independent teams identified this session — a large multi-dealer tower.'))
WHERE id = 1872;

-- 1845 Cielo Carin, Richardson Wealth (Cielo Carin Wealth Management)
UPDATE contacts SET
  firm = 'Richardson Wealth — Cielo Carin Wealth Management',
  title = 'Wealth Advisor, Portfolio Manager and Investment Advisor',
  address = '1250 René-Lévesque Blvd. West, Suite 1500',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Shares this office building with several other independent teams identified this session — a large multi-dealer tower.'))
WHERE id = 1845;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1845, x.name, x.role FROM (
  SELECT 'Nancy Bounadere, CIM, B.A.' AS name, 'Team member' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1845)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1845 AND name = x.name);

-- 1853 Gabriel Melkonian, Canaccord Genuity Wealth Management
UPDATE contacts SET
  firm = 'Canaccord Genuity Wealth Management',
  title = 'Portfolio Manager & Senior Investment Advisor',
  address = '1250 René-Lévesque West, Suite 2930',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Same suite as 1872 Peter Guidote — same firm, not confirmed whether same or separate team.'))
WHERE id = 1853;

-- 1851 Francis Gingras Roy, Manulife Wealth Inc. (Diligence Wealth Management)
UPDATE contacts SET
  firm = 'Manulife Wealth Inc. — Diligence Wealth Management',
  title = 'Senior Investment Advisor (CIM), co-owner',
  address = '1405 Trans-Canada Hwy, Suite 200, Dorval',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1851;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1851, x.name, x.role FROM (
  SELECT 'Camille Estephan' AS name, 'Senior and Founding Partner' AS role
  UNION ALL SELECT 'William Frenn', 'Portfolio Manager'
  UNION ALL SELECT 'Thierry Jabbour', 'Portfolio Manager'
  UNION ALL SELECT 'Georges Ackhar', 'Senior Investment Advisor'
  UNION ALL SELECT 'Albert Assaf', 'Investment Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1851)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1851 AND name = x.name);

-- 1870 Nicholas Lebuis, CIBC Wood Gundy (Lebuis Financial Group)
UPDATE contacts SET
  firm = 'CIBC Wood Gundy — Lebuis Financial Group',
  title = 'Portfolio Manager, Investment Advisor / Wealth Advisor',
  address = '1 Place Ville Marie, Suite 4125',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Third independent CIBC Wood Gundy team confirmed at this exact suite this session (with Ansky-Coulson Group and Francois Guy Financial Group) — a large shared floor.'))
WHERE id = 1870;

-- 1863 Josee Lacasse, IG Wealth Management (Lacasse De La Riera & Associates)
UPDATE contacts SET
  firm = 'IG Wealth Management — Lacasse De La Riera & Associates',
  title = 'Division Director, Financial Planner, Financial Security Advisor',
  address = '8250 Décarie Boulevard, Suite 200',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff.'))
WHERE id = 1863;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1863, x.name, x.role FROM (
  SELECT 'Shaun Westlake' AS name, 'Administrative/Operations Specialist' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1863)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1863 AND name = x.name);

-- 1881 Yves Lefebvre, Desjardins Securities (Picotte Lefebvre Group)
UPDATE contacts SET
  firm = 'Desjardins Securities (Valeurs mobilières Desjardins) — Picotte Lefebvre Group',
  title = 'Senior Wealth and Portfolio Manager (co-founder)',
  address = '1170 Peel Street, Suite 300',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Third independent Desjardins Securities team confirmed at this exact suite this session (with Sebastien St-Hilaire''s and Edith Beaucage''s teams) — a large shared floor.'))
WHERE id = 1881;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1881, x.name, x.role FROM (
  SELECT 'Sylvie Picotte' AS name, 'Wealth Manager (co-founder)' AS role
  UNION ALL SELECT 'Benjamin Picotte Lefebvre', 'Wealth Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1881)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1881 AND name = x.name);

-- 1857 Hugo Lehoux, IG Private Wealth Management (geographic conflict)
UPDATE contacts SET
  firm = 'IG Private Wealth Management — Lehoux et associés',
  title = 'Financial Planner / Senior Advisor / Division Manager',
  address = '3075, chemin des Quatre-Bourgeois, bureau 104, Québec',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Confirmed office is Québec City (Ste-Foy), not Montreal as the CRM sub-region states — treated as noise, not disqualifying.'))
WHERE id = 1857;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1857, x.name, x.role FROM (
  SELECT 'François Pineau' AS name, 'Financial Planner / Practice Director' AS role
  UNION ALL SELECT 'Alexandre Lebel', 'Associate Advisor'
  UNION ALL SELECT 'Vincent Labrie', 'Associate Advisor'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1857)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1857 AND name = x.name);

-- 1835 Antoine Niding — LIKELY MOVED from Richardson Wealth to RBC Dominion Securities (firm/address updated, flagged).
UPDATE contacts SET
  firm = 'RBC Dominion Securities Inc. (RBC Wealth Management)',
  title = 'Investment Advisor',
  address = '545 Promenade du Centropolis, Bureau 200, Laval',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. LIKELY MOVED from Richardson Wealth ("Beauchamp-Niding" team) to RBC Dominion Securities — inferred from recency of RBC content vs. a stale Richardson Wealth page, not a direct announcement; verify before outreach.'))
WHERE id = 1835;

-- 1873 Rani Baroud, BMO Nesbitt Burns (Rani Baroud Group)
UPDATE contacts SET
  firm = 'BMO Nesbitt Burns (BMO Private Wealth) — Rani Baroud Group',
  title = 'Investment Advisor & Financial Planner',
  address = '129 Rue Saint-Jacques',
  data_flags = TRIM(CONCAT(data_flags, ' | CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. Address unconfirmed directly from BMO''s own site, sourced from an aggregator.'))
WHERE id = 1873;

-- 1836 Bernard Meloche, IG Wealth Management (no address found)
UPDATE contacts SET
  firm = 'IG Wealth Management — Meloche & Associés Gestion Privée de Patrimoine',
  title = 'Wealth Advisor / team lead',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list; identified via web research as a retail wealth advisor, not pension staff. No specific office address could be confirmed. Disambiguated from an unrelated "Richard Meloche" at Scotia Wealth Management.'))
WHERE id = 1836;

-- 1850 Eric Moore, ScotiaMcLeod (Groupe Moore), geographic conflict, plausible not fully confirmed
UPDATE contacts SET
  firm = 'ScotiaMcLeod / Scotia Wealth Management — Groupe Moore',
  title = 'Senior Wealth Advisor & Portfolio Manager, team lead',
  address = '2875, boulevard Laurier, Delta 2, 5th floor, Québec',
  data_flags = TRIM(CONCAT(data_flags, ' | ',
    'CRM listed no firm and sourced this record from a "Global Pension & Institutional" list. PLAUSIBLE match, not fully confirmed — name+role+industry fit but confirmed office is Québec City, not Montreal as the CRM sub-region states; treated as noise but flagged for extra verification given lower overall confidence.'))
WHERE id = 1850;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1850, x.name, x.role FROM (
  SELECT 'Frédéric Noiseux' AS name, 'Wealth Management Advisor, Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Jean-Christophe Gauthier, CFA, CAIA', 'Wealth Management Advisor, Associate Portfolio Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1850)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1850 AND name = x.name);
