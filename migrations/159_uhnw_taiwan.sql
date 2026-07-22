-- UHNW individual expansion, batch: 14 Taiwanese UHNW individuals,
-- added as brand-new contacts (ids 3071-3084). Next available id
-- after this batch is 3085. Samuel Yin (Ruentex Group) was deliberately
-- EXCLUDED: per Bloomberg he died May 26, 2026, and no named successor
-- was identified for the family business, so he is omitted rather than
-- added as a deceased/inactive lead. Leslie Koo (Taiwan Cement, from
-- the original candidate list) died January 2017; represented here via
-- his successor Nelson Chang instead.

-- 3071 Terry Gou
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3071, 'Terry Gou', 'Founder', 'Hon Hai Precision Industry (Foxconn)', 'UHNW Individual', 'A', 0,
  'ir@foxconn.com', 'Corporate contact only', '+886-2-2268-3466', 'New Taipei City', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 15300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Hon Hai Precision Industry (Foxconn), the world''s largest electronics contract manufacturer (Apple''s largest assembler); owns ~12.4% of the company per a May 2026 TWSE filing. Net worth ~$15.3B (Forbes 2026 list, Taiwan''s richest; global #190). Email/phone are Foxconn''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3071);

-- 3072 Barry Lam
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3072, 'Barry Lam', 'Co-Founder and Chairman', 'Quanta Computer', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Taoyuan', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 11700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder/chairman of Quanta Computer, the world''s largest laptop/server contract manufacturer and a major AI-server supplier. Net worth ~$11.7B (Forbes 2024 Taiwan list, named richest that year) -- figure moves heavily with AI-driven stock swings, treat as volatile. Dedicated IR page exists at quantatw.com but no specific email confirmed, left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3072);

-- 3073 Cher Wang
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3073, 'Cher Wang', 'Chairperson and CEO', 'HTC Corporation', 'UHNW Individual', 'A', 0,
  'ir@htc.com', 'Corporate contact only', '+886-2-8912-4138', 'New Taipei City', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 1100, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder and chairperson/CEO of HTC, formerly Taiwan''s dominant smartphone maker; also co-founded chipmaker VIA. Net worth recent estimates ~$1.1B, down sharply from an $8.8B peak (with husband Wen-Chi Chen) in 2011 -- high volatility/decline, flagged. Email/phone are HTC''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3073);

-- 3074 Robert Tsao
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3074, 'Robert Tsao', 'Founder', 'United Microelectronics Corporation (UMC)', 'UHNW Individual', 'A', 0,
  'ir@umc.com', 'Corporate contact only', '+886-2-2658-9168 ext.16900', 'Hsinchu', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 2700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of UMC, one of the world''s largest semiconductor foundries; now largely known for pro-Taiwan civil-defense philanthropy. Net worth ~$2.7B (most reliable estimate found is from 2022; a more recent precise figure not confirmed). Email/phone are UMC''s verified corporate IR channel (contacts David Wong / Michael Lin).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3074);

-- 3075 Jeffrey Koo Jr.
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3075, 'Jeffrey Koo Jr.', 'Chairman', 'CTBC Financial Holding', 'UHNW Individual', 'A', 0,
  'ir@ctbcholding.com', 'Corporate contact only', '+886-2-3327-7777 ext.6653', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman and majority owner of CTBC Financial Holding, Taiwan''s largest private financial group by employees (~27,000). A specific current individual net worth figure could not be confirmed (family/holding-level figures exist but not a firm recent number) -- net_worth_mm left NULL rather than guessed. Email/phone are CTBC''s verified corporate IR channel (contact Justine Shen).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3075);

-- 3076 William Wang (Wong-Yeung Wang)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3076, 'William Wang', 'Chairman', 'Formosa Plastics Group', 'UHNW Individual', 'A', 0,
  'formosa@fpc.com.tw', 'Corporate contact only', '+886-2-2712-2211', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 1400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Son of founder Wang Yung-tsai; took over Formosa Plastics Group leadership in 2006, overseeing the plastics/petrochemicals conglomerate. Net worth ~$1.4B as of roughly 2020; the Wang brothers reportedly dropped off Taiwan''s Forbes 50-richest list in 2025 amid a petrochemical downturn -- treat as declining/uncertain, flagged. Email/phone are Formosa Plastics'' general Stock Affairs Department line, not a dedicated IR contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3076);

-- 3077 Tsai Eng-Meng
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3077, 'Tsai Eng-Meng', 'Chairman', 'Want Want Group', 'UHNW Individual', 'A', 0,
  'want-want.ecom@computershare.com.hk', 'Corporate contact only', '+852-2862-8688', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 5900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman who built Want Want from a small trading firm into a major China/Taiwan snack-food conglomerate; family also owns the China Times newspaper. Net worth ~$5.9-6B across recent Forbes citations (was Taiwan''s richest in 2017). Contact is via share registrar Computershare Hong Kong, published on want-want.com investor page.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3077);

-- 3078 Chang Kuo-Wei
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3078, 'Chang Kuo-Wei', 'Chairman', 'Starlux Airlines', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Taoyuan', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 1200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Youngest son of the late Evergreen Group founder Chang Yung-fa; after a contested succession battle lost control of Evergreen Marine but won a 2024 Taiwan Supreme Court ruling entitling him to ~NT$14B (~$460M) in inherited assets, and separately built Starlux Airlines (64% stake). Net worth ~$1.2B based on the Starlux stake. Starlux has an IR contact page but no specific email/phone confirmed, left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3078);

-- 3079 Miin Wu
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3079, 'Miin Wu', 'Founder and Chairman', 'Macronix International', 'UHNW Individual', 'A', 0,
  'vincentjhao@mxic.com.tw', 'Corporate contact only', '+886-3-578-6688 ext.76632', 'Hsinchu', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founded Macronix in 1989 and chairs it; the company is a leading global producer of non-volatile memory (ROM/NOR flash) chips. A specific current net worth figure could not be confirmed despite Macronix regularly appearing among Taiwan''s 50 richest -- net_worth_mm left NULL rather than guessed. Email/phone are Macronix''s published IR officer contact (Vincent Jhao, Director of IR), not a personal contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3079);

-- 3080 Morris Chang
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3080, 'Morris Chang', 'Founder (retired Chairman)', 'TSMC', 'UHNW Individual', 'A', 0,
  'invest@tsmc.com', 'Corporate contact only', '+886-3-568-2080', 'Hsinchu', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 8500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founded TSMC in 1987 at age 55, built it into the world''s largest dedicated semiconductor foundry; retired as chairman in 2018 but remains a hugely influential public figure. Net worth ~$8.5B (Forbes, April 2026 citation). Email/phone are TSMC''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3080);

-- 3081 Daniel Tsai
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3081, 'Daniel Tsai', 'Co-Chairman', 'Fubon Financial Holding', 'UHNW Individual', 'A', 0,
  'ir@fubon.com', 'Corporate contact only', '+886-2-6636-6636 ext.57402', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 6950, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-runs Fubon Financial Holding (banking/insurance/securities) with brother Richard Tsai; family also holds stakes in Taiwan Mobile and Momo e-commerce. Individually Forbes 2026 #440; combined with brother Richard, the Tsai family fortune was reported at ~$13.9B in 2025 (Fubon share price-driven) -- individual figure here is an approximate half-share, treat as estimate. Email/phone are Fubon''s verified corporate IR channel (contact Amanda Wang, SVP).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3081);

-- 3082 Richard Tsai
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3082, 'Richard Tsai', 'Co-Chairman', 'Fubon Financial Holding', 'UHNW Individual', 'A', 0,
  'ir@fubon.com', 'Corporate contact only', '+886-2-6636-6636', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 6950, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-leads Fubon Financial Holding alongside brother Daniel Tsai. Individually ~$2.4B per a 2016 Forbes figure (outdated); current wealth best understood via the combined Tsai-brothers figure of ~$13.9B (2025) since Forbes often lists them jointly -- individual figure here is an approximate half-share, treat as estimate. Email/phone are Fubon''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3082);

-- 3083 Nelson Chang
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3083, 'Nelson Chang', 'Chairman', 'Taiwan Cement Corporation / TCC Group Holdings', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Current chairman of Taiwan Cement/TCC Group; married into the Koo family and took over group leadership after chairman Leslie Koo died in January 2017 (fall at a Taipei hotel) -- used here as the current successor rather than the deceased Koo. Forbes lists him jointly under "Nelson Chang & Koo family," a specific individual net worth figure not isolated in searches, net_worth_mm left NULL. TCC Group has a contact page but no specific email confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3083);

-- 3084 Douglas Hsu
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3084, 'Douglas Hsu', 'Chairman', 'Far Eastern Group', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Taipei', '', 'Taiwan', 'Asia',
  NULL, 'Unknown', 1700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Far Eastern Group, a diversified conglomerate (Far EasTone Telecom, Asia Cement, U-Ming Marine, Oriental Union Chemical, Everest Textile) founded by his father in 1940. Net worth ~$1.7B per a 2017 Forbes estimate, likely changed materially since; ranked #38 on Forbes'' 2026 Taiwan 50 Richest list, current exact figure unconfirmed. No group-level IR email/phone confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3084);
