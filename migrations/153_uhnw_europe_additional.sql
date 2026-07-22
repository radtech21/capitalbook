-- UHNW individual expansion, batch: 15 additional Europe UHNW
-- individuals/families, added as brand-new contacts (ids 2999-3013).
-- Next available id after this batch is 3014.

-- 2999 Kjell Inge Røkke
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2999, 'Kjell Inge Røkke', 'Majority Owner', 'Aker ASA', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '+47 41 18 84 82', 'Lysaker', '', 'Norway', 'Europe',
  NULL, 'Unknown', 7700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Norwegian self-made industrialist and former fisherman who built Aker ASA into one of Norway''s largest industrial groups (offshore energy, shipping, marine biotech); owns ~68% of publicly traded Aker ASA. Net worth ~$7.7B (Forbes 2026 real-time, #487). Phone is a search-indexed IR line, not independently re-verified this session.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2999);

-- 3000 Petter Stordalen
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3000, 'Petter Stordalen', 'Owner', 'Strawberry (Nordic Choice Hotels)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Oslo', '', 'Norway', 'Europe',
  NULL, 'Unknown', 1700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Norwegian hotelier/entrepreneur who built Strawberry into Scandinavia''s largest hotel chain (~230+ hotels) alongside real estate and retail holdings. Net worth estimates vary widely ($1.2-2.2B) -- reported near midpoint. Company is private; no dedicated confirmed corporate press email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3000);

-- 3001 Persson Family (H&M)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3001, 'Persson Family (Stefan Persson)', 'Family Shareholders', 'H&M (Hennes & Mauritz AB)', 'UHNW Individual', 'A', 0,
  'info@hm.com', 'Corporate contact only', '+46 8 796 55 00', 'Stockholm', '', 'Sweden', 'Europe',
  NULL, 'Unknown', 17000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Swedish retail family controlling H&M, the world''s second-largest fast-fashion retailer, founded by Erling Persson in 1947; family (Stefan Persson and descendants) holds ~64% of H&M as of Sept 2025. Stefan Persson net worth ~$16-18B (Forbes #107, 2026); son Karl-Johan Persson ~$1.9B. Email/phone are H&M Group''s general published corporate contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3001);

-- 3002 Rausing Family (Tetra Pak)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3002, 'Rausing Family', 'Family Shareholders', 'Tetra Pak (via Tetra Laval)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Lausanne', '', 'Switzerland', 'Europe',
  NULL, 'Unknown', 9500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Secretive Swedish-origin family behind Tetra Pak (world''s largest food-packaging company), now diversified into a large global public-equities portfolio via Tetra Laval (HQ Lausanne, operational Tetra Pak HQ Lund, Sweden). Family fortune estimated ~$9-12B aggregate (Bloomberg); siblings Jorn/Kirsten/Finn Rausing each ~$5.9B. A regional press contact surfaced but was not independently re-verified, left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3002);

-- 3003 Reimann Family (JAB Holding)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3003, 'Reimann Family', 'Family Shareholders', 'JAB Holding Company', 'UHNW Individual', 'A', 0,
  'info@jabholco.com', 'Corporate contact only', '+352 23 23 02 200', 'Luxembourg', '', 'Luxembourg', 'Europe',
  NULL, 'Unknown', 26000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Reclusive German family whose fortune originated in the Benckiser/Reckitt Benckiser chemical business, now channeled through JAB Holding Company (Luxembourg), a major private investor in global consumer brands (Peet''s Coffee, Panera, Krispy Kreme, Pret A Manger, Keurig Dr Pepper/Coty stakes). Family aggregate net worth estimated $20-33B, reported near midpoint. Email/phone from official jabholco.com domain.',
  '4 Rue Jean Monnet'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3003);

-- 3004 Otto Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3004, 'Otto Family (Michael Otto)', 'Family Shareholders', 'Otto Group', 'UHNW Individual', 'A', 0,
  'presse@otto.de', 'Corporate contact only', '+49 40 6461 0', 'Hamburg', '', 'Germany', 'Europe',
  NULL, 'Unknown', 9500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). German retail dynasty controlling the Otto Group, one of the world''s largest e-commerce/mail-order retail conglomerates, founded by Werner Otto in 1949. Michael Otto net worth ~$9.5B (Forbes #588, 2026); other estimates run $16-18B reflecting family vs individual scope. Email/phone from official otto.de/ottogroup.com domains.',
  'Werner-Otto-Str. 1-7'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3004);

-- 3005 Merckle Family (Heidelberg Materials)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3005, 'Ludwig Merckle', 'Head of Family Holdings', 'Heidelberg Materials / Phoenix Group', 'UHNW Individual', 'A', 0,
  'ir-info@heidelbergmaterials.com', 'Corporate contact only', '+49 6221 481 41326', 'Heidelberg', '', 'Germany', 'Europe',
  NULL, 'Unknown', 16800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). German industrial family that rebuilt its fortune around a 28%+ stake in Heidelberg Materials (formerly HeidelbergCement) after the 2009 debt crisis and death of patriarch Adolf Merckle, having earlier sold generics maker Ratiopharm to Teva; also Phoenix Group (pharma wholesale). Ludwig Merckle net worth ~$16.8B (2026 estimate). Email/phone from official heidelbergmaterials.com domain.',
  'Berliner Straße 6'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3005);

-- 3006 Brenninkmeijer Family (C&A)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3006, 'Brenninkmeijer Family', 'Family Shareholders', 'C&A (via Cofra Holding AG)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Baar', '', 'Switzerland', 'Europe',
  NULL, 'Unknown', 20000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Extremely private Dutch-German family behind C&A (founded 1841, one of Europe''s oldest fashion retail chains), whose diversified holding company Cofra also spans real estate, private equity, banking; family has 500+ members. Estimated fortune ranges $18-27B across sources, reported near midpoint. No single confirmed global corporate press email; only a regional (Hungary) address surfaced.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3006);

-- 3007 Weston Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3007, 'Weston Family', 'Family Shareholders', 'Associated British Foods plc / George Weston Limited', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+44 20 7399 6500', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 13500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Anglo-Canadian dynasty controlling Associated British Foods (Primark, Twinings, AB Sugar) and Canada''s Loblaw/Shoppers Drug Mart via George Weston Limited; formerly also owned Selfridges until its 2021 sale. Family wealth estimated ~GBP10.5-11B (~$13-14B) per Sunday Times Rich List circa 2020-21; holds ~56% of ABF, ~63% of George Weston Ltd. Phone is the published ABF switchboard.',
  'Weston Centre, 10 Grosvenor Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3007);

-- 3008 Reuben Brothers
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3008, 'Reuben Brothers (David and Simon Reuben)', 'Founders', 'Reuben Brothers', 'UHNW Individual', 'A', 0,
  'contact@reubros.com', 'Corporate contact only', '+44 20 7802 5002', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 16000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). British billionaire brothers, born in Mumbai and raised in the UK, who built their fortune first in metals trading and property before diversifying into technology, telecoms, global real estate. Net worth estimated $13.3-18B each/combined depending on source (Forbes lists both at #223 on the 2026 list); reported near midpoint. Email/phone from search-indexed reubenbrothers.com contact page, not independently re-verified this session.',
  'Millbank Tower, 21-24 Millbank'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3008);

-- 3009 Leonard (Len) Blavatnik
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3009, 'Leonard Blavatnik', 'Founder', 'Access Industries', 'UHNW Individual', 'A', 0,
  'AccessIndustries@HawthornAdvisors.com', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 31000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Ukrainian-born, US/UK billionaire industrialist (Sir Leonard "Len" Blavatnik) who built diversified holding company Access Industries with major stakes in petrochemicals (LyondellBasell) and entertainment (Warner Music Group); also funds Oxford''s Blavatnik School of Government. Net worth ~$29.9-32B (Forbes real-time ~March 2026, #78). Press email routed through an external PR firm per official contact page.',
  '40 W 57th St, Fl 28'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3009);

-- 3010 Jim Ratcliffe
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3010, 'Jim Ratcliffe', 'Founder, Chairman and Majority Owner', 'INEOS', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 17500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). British chemical industry billionaire (Sir Jim Ratcliffe), founder/chairman/majority owner of INEOS (one of the world''s largest privately held chemicals/petrochemicals producers); also known for Manchester United and Team Sky/INEOS cycling ownership. Net worth ~$16.7-18.3B (Forbes/Bloomberg, mid-2026), reported near midpoint. INEOS maintains an official press-contacts directory at ineos.com/press-contacts, not independently re-verified this session.',
  '38 Hans Crescent, Knightsbridge'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3010);

-- 3011 Issa Brothers (Mohsin and Zuber Issa)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3011, 'Issa Brothers (Mohsin and Zuber Issa)', 'Co-Founders', 'EG Group / Asda', 'UHNW Individual', 'A', 0,
  'CF-Communications@eg-america.com', 'Corporate contact only', '', 'Blackburn', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 3000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). British-Pakistani brothers from Blackburn who built EG Group from a single petrol station into a global forecourt retail empire, later co-acquiring UK supermarket chain Asda with TDR Capital. Net worth estimates vary significantly ($2-6B range) amid EG Group/Asda debt pressures; reported near the lower-middle of the range as more conservative. Email is EG Group''s North America media-inquiries contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3011);

-- 3012 Françoise Bettencourt Meyers
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3012, 'Françoise Bettencourt Meyers', 'Family Shareholder (former Board Member)', 'L''Oréal', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '0 800 66 66 66', 'Clichy', '', 'France', 'Europe',
  NULL, 'Unknown', 94400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Granddaughter of L''Oreal founder Eugene Schueller; she and her family control roughly a third of publicly traded L''Oreal, the world''s largest cosmetics company. Chaired family holding company Tethys and served on L''Oreal''s board until 2025. Net worth ~$94.4B (Forbes, April 2026, #20) -- widely reported as the world''s second-richest woman. Phone is L''Oreal Investor Relations (France toll-free); international +33 1 40 14 80 50.',
  '90-110 Esplanade du Général de Gaulle'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3012);

-- 3013 Wertheimer Brothers (Chanel)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3013, 'Wertheimer Brothers (Alain and Gérard)', 'Owners', 'Chanel', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  NULL, 'Unknown', 41400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). French billionaire brothers, grandsons of Pierre Wertheimer (Coco Chanel''s original business partner), who jointly and privately own Chanel, one of the world''s leading luxury fashion houses. Net worth ~$41.4B each per late-2024 estimates (fluctuates with luxury sector valuations). Chanel''s press office is at 29 rue Cambon, Paris; specific named PR contacts could not be independently verified this session, left blank.',
  '29 rue Cambon'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3013);
