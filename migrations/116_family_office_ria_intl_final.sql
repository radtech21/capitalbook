-- Family Office (15) + RIA / Private Bank / MFO (8) segment enrichment,
-- final international batch (23/23 records). Completes both segments.
-- Several entities have no single confirmed "CEO" (partnership/multi-MD
-- governance, or a genuine leadership vacancy) -- name left unchanged
-- rather than guessed where that's the case, per the no-fabrication
-- policy used throughout this project.

-- 1929 Pontegadea Inversiones, A Coruna, Spain
UPDATE contacts SET
  name = 'Roberto Cibeira Moreiras',
  title = 'Chief Executive Officer',
  address = 'Calle Cantón Grande, 4',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since 2025, succeeded José Arnau Sierra (retired). Address is registered/fiscal, not confirmed operational. AUM/NAV not publicly disclosed.')), 512)
WHERE id = 1929;

-- 1932 Athos KG, Munich, Germany
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CRM correction: this is the Strüngmann family office (Hexal/BioNTech), NOT Reimann/JAB as previously assumed. Run by a multi-person MD team, no single CEO. ~$30B AUM est. (unverified).')), 512)
WHERE id = 1932;

-- 1936 The Grosvenor Estate, London, UK
UPDATE contacts SET
  name = 'Mark Preston',
  title = 'Executive Trustee',
  address = '70 Grosvenor Street, Mayfair',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Top executive holds "Executive Trustee" title, not CEO. James Raynor named Grosvenor Property CEO Sep 2025 (property business only). No current AUM figure found (only stale 2015-2019 data).')), 512)
WHERE id = 1936;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1936, x.name, x.role FROM (
  SELECT 'James Raynor' AS name, 'CEO, Grosvenor Property (international property business)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1936) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1936 AND name = x.name);

-- 1937 Premji Invest, Bengaluru, India
UPDATE contacts SET
  name = 'T.K. Kurien',
  title = 'Chief Executive Officer & Managing Partner',
  address = '134, Doddakannelli, Sarjapur Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Ex-Wipro Vice Chairman/CEO. ~$15B AUM (Oct 2025, third-party estimate, not firm-disclosed).')), 512)
WHERE id = 1937;

-- 1938 KIRKBI A/S, Billund, Denmark
UPDATE contacts SET
  name = 'Søren Thorup Sørensen',
  title = 'Group Chief Executive Officer',
  address = 'Koldingvej 2',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since 2010; also LEGO Group Vice Chairman. Family Chairman: Thomas Kirk Kristiansen. Core investment portfolio ~DKK81B (end 2025); group pre-tax profit DKK22.6B (2025).')), 512)
WHERE id = 1938;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1938, x.name, x.role FROM (
  SELECT 'Thomas Kirk Kristiansen' AS name, 'Chairman (LEGO/Kirk Kristiansen family)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1938) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1938 AND name = x.name);

-- 2178 Exor, Amsterdam, Netherlands
UPDATE contacts SET
  name = 'John Elkann',
  title = 'Chief Executive Officer',
  address = 'Hildegard von Bingenstraat 38',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Also Ferrari/Stellantis Chairman. NAV EUR33.2B / EUR164.4 per share (end 2025, -8% YoY); Gross Asset Value EUR37.1B. Benoît Ribadeau-Dumas named Deputy CEO Jul 2026.')), 512)
WHERE id = 2178;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2178, x.name, x.role FROM (
  SELECT 'Benoît Ribadeau-Dumas' AS name, 'Deputy CEO (effective Jul 1 2026)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2178) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2178 AND name = x.name);

-- 2179 Tethys Invest, Paris, France
UPDATE contacts SET
  name = 'Alexandre Benais',
  title = 'Chief Executive Officer',
  address = '27-29 Rue des Poissonniers, Neuilly-sur-Seine',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since ~Feb 2023 (Bettencourt Meyers/L''Oreal family office); Chairwoman: Françoise Bettencourt Meyers. Address from secondary source, needs spot-check. AUM not disclosed (press-shy).')), 512)
WHERE id = 2179;

-- 2224 Kingdom Holding Company, Riyadh, Saudi Arabia
UPDATE contacts SET
  name = 'Talal Ibrahim Al Maiman',
  title = 'Chief Executive Officer',
  address = 'Kingdom Centre, 66th Floor, King Fahd Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Chairman/founder: Prince Alwaleed bin Talal (not CEO -- some outdated sources mislabel him as CEO). Total assets SAR74.93B / ~$20B (end 2025); market cap ~$14.4B (Jun 2026).')), 512)
WHERE id = 2224;

-- 2226 Mansour Group, Cairo, Egypt
UPDATE contacts SET
  name = 'Mohamed Mansour',
  title = 'Chairman',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | No single Group CEO -- run collectively by 3 Mansour brothers with separate divisional CEOs. HQ address conflicting across sources, not added. ~$7.5B annual revenue, 100+ countries.')), 512)
WHERE id = 2226;

-- 2227 Al-Futtaim, Dubai, UAE
UPDATE contacts SET
  name = 'Omar Abdulla Al Futtaim',
  title = 'Vice Chairman & Chief Executive Officer',
  address = 'Festival Tower, Dubai Festival City',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since 2001. IMPORTANT: distinct from Majid Al Futtaim Holding (separate company, cousin branch) -- do not conflate financials. No group revenue figure publicly disclosed.')), 512)
WHERE id = 2227;

-- 2252 Djarum / Hartono Family, Jakarta, Indonesia
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO identity conflicting/unresolved (Zeinal Arifin vs Victor Hartono) -- verify directly before outreach. Historic HQ is Kudus, Central Java, not Jakarta. Michael Bambang Hartono (co-founder) died Mar 19 2026.')), 512)
WHERE id = 2252;

-- 2253 Charoen Pokphand Group, Bangkok, Thailand
UPDATE contacts SET
  name = 'Soopakij Chearavanont',
  title = 'Chairman',
  address = 'C.P. Tower, 313 Silom Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO seat VACANT since Jan 2026 (Suphachai Chearavanont departed for own venture, no successor named as of Jul 2026) -- follow up before outreach. No single group-level revenue figure published.')), 512)
WHERE id = 2253;

-- 2254 Ayala Corporation, Makati, Philippines
UPDATE contacts SET
  name = 'Cezar P. Consing',
  title = 'President & Chief Executive Officer',
  address = 'Ayala Triangle Gardens Tower 2, 37th-39th Floors, Paseo de Roxas cor. Makati Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since 2022 (first non-Zobel de Ayala CEO). Chairman: Jaime Augusto Zobel de Ayala. FY2025 revenue PHP383.64B; core net income PHP48.3B (record).')), 512)
WHERE id = 2254;

-- 2255 Salim Group, Jakarta, Indonesia
UPDATE contacts SET
  name = 'Anthoni Salim',
  title = 'Chairman',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Title inconsistent across sources (CEO/Chairman/President Commissioner all used) -- verify before outreach. Also Chairman of First Pacific (HK-listed). Group financials not publicly disclosed.')), 512)
WHERE id = 2255;

-- 2256 Hong Leong Group, Singapore
UPDATE contacts SET
  name = 'Kwek Leng Beng',
  title = 'Executive Chairman',
  address = '9 Raffles Place, #11-00, Republic Plaza',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | No distinct Group CEO -- subsidiary CEOs exist separately (e.g. City Developments Ltd). Alternate registered address found: 16 Raffles Quay. Gross assets "over S$50B" (undated estimate).')), 512)
WHERE id = 2256;

-- 2234 Lombard Odier, Geneva, Switzerland (RIA / Private Bank / MFO)
UPDATE contacts SET
  name = 'Hubert Keller',
  title = 'Senior Managing Partner',
  address = 'Chemin Messidor 1, Bellevue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | New "1Roof" HQ opened Sep 2025; exact street format unconfirmed, verify before use. Partnership structure, no separate Group CEO. AUM CHF223B (end 2025, source-snippet only).')), 512)
WHERE id = 2234;

-- 2235 Edmond de Rothschild, Geneva, Switzerland
UPDATE contacts SET
  name = 'Ariane de Rothschild',
  title = 'CEO (title also cited as President of the Board -- verify)',
  address = '18, Rue de Hesse',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Group leader since Mar 2023, first non-blood/first woman to head a Rothschild-branded institution. HQ relocating to new "Colibri" building, exact address unknown. AUM CHF198B (end 2025).')), 512)
WHERE id = 2235;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2235, x.name, x.role FROM (
  SELECT 'Cynthia Tobiano' AS name, 'Deputy CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2235) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2235 AND name = x.name);

-- 2236 EFG International, Zurich, Switzerland
UPDATE contacts SET
  name = 'Giorgio Pradelli',
  title = 'Chief Executive Officer',
  address = 'Bleicherweg 8',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM CHF190.2B (Apr 2026, record), up from CHF185B FY2025-end. FY25 net profit CHF325.2M (record).')), 512)
WHERE id = 2236;

-- 2237 Union Bancaire Privee, Geneva, Switzerland
UPDATE contacts SET
  name = 'Guy de Picciotto',
  title = 'Chief Executive Officer',
  address = 'Rue du Rhône 96-98',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since 1998. Chairman: Daniel de Picciotto. AUM CHF193.5B (Jun 30 2026), up from CHF184.5B end-2025.')), 512)
WHERE id = 2237;

-- 2238 Rothschild & Co, Paris, France
UPDATE contacts SET
  name = 'Alexandre de Rothschild',
  title = 'Executive Chairman',
  address = '23 bis avenue de Messine',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Partnership/SCA structure, no separate Group CEO. Wealth & Asset Mgmt division AUM conflicting across sources (EUR47-143B) -- reconcile against FY25 results before use.')), 512)
WHERE id = 2238;

-- 2239 Vontobel, Zurich, Switzerland
UPDATE contacts SET
  name = 'Christel Rendu de Lint',
  title = 'Co-Chief Executive Officer',
  address = 'Gotthardstrasse 43',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Co-CEO since Jan 1 2024, succeeded Zeno Staub. AUM CHF240.1B (Mar 31 2026). Former CFO Thomas Heinzl departed to become Quintet Private Bank CEO.')), 512)
WHERE id = 2239;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2239, x.name, x.role FROM (
  SELECT 'Georg Schubiger' AS name, 'Co-Chief Executive Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2239) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2239 AND name = x.name);

-- 2240 Quintet Private Bank, Luxembourg
UPDATE contacts SET
  name = 'Thomas Heinzl',
  title = 'Group Chief Executive Officer',
  address = '43, boulevard Royal',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since ~Apr 2026, succeeded Chris Allen; not independently confirmed via primary source, verify before outreach. Ex-Vontobel CFO/CRO. Total client assets EUR105.1B (end 2025).')), 512)
WHERE id = 2240;

-- 2241 Mirabaud, Geneva, Switzerland
UPDATE contacts SET
  name = 'Lionel Aeschlimann',
  title = 'Senior Managing Partner',
  address = '29, Boulevard Georges-Favon',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Transitioned from CEO to Senior Managing Partner Jan 1 2025 (partnership governance model). Umberto Boccato now CEO of Mirabaud Asset Mgmt (subsidiary-level). AUM CHF31.7B (end 2025).')), 512)
WHERE id = 2241;
