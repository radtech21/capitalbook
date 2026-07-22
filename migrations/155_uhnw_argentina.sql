-- UHNW individual expansion, batch: 10 Argentine UHNW individuals,
-- added as brand-new contacts (ids 3029-3038). Next available id
-- after this batch is 3039. Argentina has a smaller pool of
-- well-documented UHNW individuals than other markets researched so
-- far; per the no-fabrication policy, only 10 (not 15) are included
-- here since that is genuinely all that could be confirmed to a
-- reasonable standard. Gregorio Pérez Companc (deceased June 2024) is
-- represented via his son and successor Luis Pérez Companc rather
-- than as a deceased individual. Alejandro Bulgheroni is deliberately
-- EXCLUDED as a duplicate of the existing Bulgheroni Family entry
-- (id 2823) already in the CRM.

-- 3029 Eduardo Eurnekian
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3029, 'Eduardo Eurnekian', 'Chairman', 'Corporación América', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 4600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Argentine businessman of Armenian descent who built Corporación América into the world''s largest private airport operator (~50+ airports across the Americas, Europe, Asia), incl. NYSE-listed Corporación América Airports (CAAP). Net worth ~$4.6B (Forbes 2026 real-time, ~#891 globally); other trackers show $1.9-4.88B. CAAP is publicly traded implying a standard IR function, but no specific IR contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3029);

-- 3030 Luis Pérez Companc
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3030, 'Luis Pérez Companc', 'Chairman (successor to Gregorio Pérez Companc)', 'Molinos Río de la Plata', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 4000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Son of patriarch Gregorio Pérez Companc (d. June 14 2024, age 89, ~$3.9-4.2B at death per Forbes) -- Gregorio built his fortune in oil before selling to Petrobras (2002), then handed control of food conglomerate Molinos Río de la Plata to his children in 2009. Luis currently leads Molinos; used here as the family representative rather than the deceased patriarch. No corporate contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3030);

-- 3031 Francisco de Narváez
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3031, 'Francisco de Narváez', 'Owner', 'Grupo De Narváez', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Colombian-born, naturalized Argentine businessman who built a retail fortune (formerly Casa Tía retail chain) before diversifying into media (América TV) and La Cronista newspaper; served as a national deputy for Buenos Aires Province. Net worth estimates vary $500M-$900M, below the $1B billionaire threshold in most sourcing but clearly UHNW. No corporate contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3031);

-- 3032 Marcelo Mindlin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3032, 'Marcelo Mindlin', 'Chairman and Co-Founder', 'Pampa Energía', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 2050, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder and chairman of Pampa Energía, Argentina''s largest energy company; former CFO/vice-chairman of IRSA. Net worth ~$2.0-2.1B (2026 estimates). Pampa Energía maintains a public IR site (ri.pampa.com) confirmed to exist, but no specific email/phone was verified.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3032);

-- 3033 Eduardo Costantini
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3033, 'Eduardo Costantini', 'Founder and Chairman', 'Consultatio S.A.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 1600, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Real estate developer who founded Consultatio (owns ~70% of the company) and built the Nordelta master-planned community near Buenos Aires; also founder/chairman of the MALBA art museum. Net worth ~$1.6B (Forbes, Sept 2024; ranked ~#2858 on Forbes 2026 Billionaires list). No corporate contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3033);

-- 3034 Eduardo Elsztain
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3034, 'Eduardo Elsztain', 'Chairman', 'IRSA / Cresud', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 5000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of IRSA, Argentina''s largest listed real estate company (NYSE), and of Cresud, a major agribusiness operator (NASDAQ) spanning Argentina, Bolivia, Paraguay, Uruguay; also chairs Banco Hipotecario, recently expanded into gold mining in San Juan province. Net worth shows wide variance (one 2025 Forbes Argentina figure ~$5B, others far lower) -- flagged for further verification. Both firms are US-listed implying formal IR, but no specific contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3034);

-- 3035 Hugo Sigman
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3035, 'Hugo Sigman', 'Co-Founder', 'Grupo Insud / Insud Pharma', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 3000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Psychiatrist-turned-pharma entrepreneur who co-founded Insud Pharma with wife, biochemist Silvia Gold; group subsidiary mAbxience manufactured the AstraZeneca COVID-19 vaccine in Argentina, with major operations in Barcelona, Spain. Sons Lucas and Leandro Sigman now help lead the group. Net worth wide variance (Forbes Argentina ~$6.3B vs other sources ~$1-2B) -- flagged, reported at a conservative midpoint.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3035);

-- 3036 Roemmers Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3036, 'Roemmers Family (Alejandro G. Roemmers)', 'Family Shareholders', 'Laboratorios Roemmers', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 2400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founded in 1921 by German immigrant Alberto J. Roemmers; Laboratorios Roemmers is Argentina''s largest pharmaceutical company. Patriarch Alberto Roemmers died August 2022; the group is now led by his sons, most visibly Alejandro G. Roemmers. Family net worth ~$2.4B (Forbes, family estimate at patriarch''s death, Aug 2022). No corporate contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3036);

-- 3037 Manuel Antelo
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3037, 'Manuel Antelo', 'Founder', 'Grupo Antelo', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 1300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Started as a traveling musician before building Argentina''s largest auto-parts/dealership empire (CAT logistics, Car One, Renault/Nissan/Stellantis distribution), later expanding into Uruguay and Europe (Decathlon franchise, Ford/Stellantis manufacturing). Net worth ~$1.3B per Forbes Argentina (debut ranking, ~10th place); group revenue (over $3B) is sometimes conflated with net worth in coverage -- $1.3B used as the more reliable figure.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3037);

-- 3038 Sebastián Bagó
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3038, 'Sebastián Bagó', 'General Director', 'Laboratorios Bagó', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  NULL, 'Unknown', 330, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). General director of Laboratorios Bagó, a multinational pharmaceutical company founded in 1934, present in 22+ countries. Net worth combined with brother Juan Carlos Bagó was estimated ~$660M (older estimate, ranked ~18th among richest Argentines) -- a family/combined figure below billion-dollar/individual level, so treated as UHNW rather than strictly billionaire-tier; net_worth_mm reflects an approximate individual share.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3038);
