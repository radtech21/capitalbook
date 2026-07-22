-- UHNW individual expansion, batch: 14 Latin America + Africa UHNW
-- individuals/families, added as brand-new contacts (ids 2820-2833).
-- Next available id after this batch is 2834. Johann Rupert was
-- re-surfaced by the research agent for this batch but is deliberately
-- EXCLUDED here (deduplicated) since he is already covered under the
-- continental Europe batch (id 2809, Richemont/Switzerland framing).

-- 2820 Carlos Slim Helu
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2820, 'Carlos Slim Helu', 'Honorary Chairman', 'Grupo Carso / America Movil', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Mexico City', '', 'Mexico', 'Latin America',
  NULL, 'Unknown', 90000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Honorary Chairman of Grupo Carso and controlling shareholder of America Movil (telecom), historically Latin America''s wealthiest individual. Net worth ~$90B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2820);

-- 2821 German Larrea Mota-Velasco
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2821, 'German Larrea Mota-Velasco', 'Chairman and CEO', 'Grupo Mexico', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Mexico City', '', 'Mexico', 'Latin America',
  NULL, 'Unknown', 30000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman and CEO of Grupo Mexico (mining/transportation, incl. Southern Copper). Net worth ~$30B est. (2026, volatile with copper prices). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2821);

-- 2822 Maria Asuncion Aramburuzabala
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2822, 'Maria Asuncion Aramburuzabala', 'Chairman', 'Tresalia Capital', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Mexico City', '', 'Mexico', 'Latin America',
  NULL, 'Unknown', 6000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Heir to Grupo Modelo (Corona beer) fortune, Chairman of investment firm Tresalia Capital. Net worth ~$6B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2822);

-- 2823 Bulgheroni Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2823, 'Bulgheroni Family', 'Family Shareholders', 'Bridas Corporation / Pan American Energy', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 8000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Alejandro and Carlos Bulgheroni control Bridas Corporation and hold a major stake in Pan American Energy (oil and gas), among Argentina''s wealthiest families. Collective family net worth ~$8B est. (2026). No public contact found; treated as a family/group entry.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2823);

-- 2824 Marcos Galperin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2824, 'Marcos Galperin', 'Co-Founder, Chairman and CEO', 'MercadoLibre', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 7000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Chairman and CEO of MercadoLibre (Latin America''s largest e-commerce platform). Net worth ~$7B est. (2026, volatile with MELI). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2824);

-- 2825 Eduardo Saverin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2825, 'Eduardo Saverin', 'Co-Founder, Facebook / Managing Partner', 'B Capital', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  NULL, 'Unknown', 30000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Brazilian-born Facebook co-founder, now Singapore-based, co-founder of VC firm B Capital. Net worth ~$30B est. (2026, largely Meta stock). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2825);

-- 2826 Jorge Paulo Lemann
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2826, 'Jorge Paulo Lemann', 'Co-Founder', '3G Capital', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 15000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder of 3G Capital (AB InBev, Kraft Heinz, Burger King/Restaurant Brands), Brazil''s wealthiest individual for many years. Net worth ~$15B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2826);

-- 2827 Safra Family (Vicky Safra)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2827, 'Vicky Safra', 'Matriarch / Family Shareholder', 'Safra Group (Banco Safra, J. Safra Sarasin)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 20000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Widow of Joseph Safra, matriarch of the Safra banking dynasty (Banco Safra in Brazil, J. Safra Sarasin private bank in Switzerland). Family net worth ~$20B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2827);

-- 2828 Marcel Herrmann Telles
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2828, 'Marcel Herrmann Telles', 'Co-Founder', '3G Capital', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Rio de Janeiro', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 8000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder of 3G Capital alongside Jorge Paulo Lemann (AB InBev, Kraft Heinz, Restaurant Brands). Net worth ~$8B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2828);

-- 2829 Luis Carlos Sarmiento
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2829, 'Luis Carlos Sarmiento', 'Chairman', 'Grupo Aval (Grupo Sarmiento Angulo)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Bogota', '', 'Colombia', 'Latin America',
  NULL, 'Unknown', 5000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Grupo Aval (Colombia''s largest financial conglomerate, incl. Banco de Bogota), Colombia''s wealthiest individual. Net worth ~$5B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2829);

-- 2830 Aliko Dangote
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2830, 'Aliko Dangote', 'President and Chief Executive', 'Dangote Group', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Lagos', '', 'Nigeria', 'Africa',
  NULL, 'Unknown', 23000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). President and CEO of Dangote Group (cement, sugar, and the large Dangote Refinery), Africa''s wealthiest individual. Net worth ~$23B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2830);

-- 2831 Nicky Oppenheimer and Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2831, 'Nicky Oppenheimer', 'Chairman', 'Oppenheimer Generations (formerly De Beers)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Johannesburg', '', 'South Africa', 'Africa',
  NULL, 'Unknown', 10000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Former De Beers Chairman, now runs family investment vehicle Oppenheimer Generations following the 2012 sale of the family''s De Beers stake to Anglo American. Family net worth ~$10B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2831);

-- 2832 Patrice Motsepe
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2832, 'Patrice Motsepe', 'Founder and Executive Chairman', 'African Rainbow Minerals', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Johannesburg', '', 'South Africa', 'Africa',
  NULL, 'Unknown', 3000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and Executive Chairman of African Rainbow Minerals (mining), also President of the Confederation of African Football (CAF). Net worth ~$3B est. (2026, volatile with commodity prices). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2832);

-- 2833 Mike Adenuga
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2833, 'Mike Adenuga', 'Founder and Chairman', 'Globacom / Conoil', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Lagos', '', 'Nigeria', 'Africa',
  NULL, 'Unknown', 7000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and Chairman of Globacom (telecom) and Conoil (oil and gas), among Nigeria''s wealthiest individuals. Net worth ~$7B est. (2026, illiquid/approximate given private company structure). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2833);
