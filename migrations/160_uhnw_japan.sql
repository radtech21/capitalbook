-- UHNW individual expansion, batch: 13 Japanese UHNW individuals,
-- added as brand-new contacts (ids 3085-3097). Next available id
-- after this batch is 3098. Tadashi Yanai and Masayoshi Son were
-- deliberately EXCLUDED as duplicates already in the CRM (migration
-- 133_uhnw_asia.sql). Note: the earlier Panama Papers screening batch
-- (see chat) found only one candidate (Li Ka-shing) cleared every
-- compliance criterion, and he was ALSO already in the CRM (migration
-- 122, id 2547) -- so that research yielded zero new contacts and no
-- migration file was created for it.

-- 3085 Takemitsu Takizaki
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3085, 'Takemitsu Takizaki', 'Founder (Honorary Chairman)', 'Keyence Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '+81-6-6379-2211', 'Osaka', '', 'Japan', 'Asia',
  NULL, 'Unknown', 24000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Keyence, a factory-automation sensor and electronics maker; stepped down as chairman in 2015, remains honorary chairman/board member. Net worth estimates vary widely ($18-29B across sources); ranked #3 on Forbes Japan''s 2026 list -- reported near midpoint, treat as unconfirmed. Phone is Keyence''s general HQ line; no dedicated IR contact found separately.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3085);

-- 3086 Nobutada Saji
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3086, 'Nobutada Saji', 'Chairman', 'Suntory Holdings Limited', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '+81-6-6346-1131', 'Osaka', '', 'Japan', 'Asia',
  NULL, 'Unknown', 3000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Suntory Holdings, the beverage conglomerate (whisky, beer, soft drinks) that acquired Beam Inc. (Jim Beam, Maker''s Mark) in 2014. Net worth estimate ~$3B (2023-era figure); Suntory is closely held, real-time valuation harder to pin down, treat as estimate. Phone is Suntory Holdings'' general HQ line; the holding company itself is not separately listed, no dedicated IR contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3086);

-- 3087 Akira Mori (Mori Trust)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3087, 'Akira Mori', 'Chairman', 'Mori Trust Co., Ltd.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 3000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Mori Trust, a Tokyo real estate developer/operator of office buildings and hotels (daughter Miwako Date is President/CEO). Distinct from sister company Mori Building, run by the late Minoru Mori''s widow Yoshiko Mori -- the family split holdings in 1999. Net worth estimate ~$3.0B as of mid-2022 (ranged $3.8B in 2015). Mori Trust is privately held, no public IR contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3087);

-- 3088 Hiroshi Mikitani
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3088, 'Hiroshi Mikitani', 'Founder and CEO', 'Rakuten Group, Inc.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '+81-50-5581-6910', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 5000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and CEO of Rakuten, one of Japan''s largest e-commerce and internet-services groups. Net worth estimates vary $4.2-6.1B (2026 reporting); ranked #13 on Forbes Japan''s 2026 list; Rakuten''s mobile-business losses have made his wealth volatile in recent years. Phone is Rakuten''s general HQ line; IR page has a web-form contact only, no direct email/phone found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3088);

-- 3089 Akio Toyoda
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3089, 'Akio Toyoda', 'Chairman', 'Toyota Motor Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '0565-28-2121', 'Toyota City', 'Aichi', 'Japan', 'Asia',
  NULL, 'Unknown', 800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Toyota Motor Corporation, grandson of founder Kiichiro Toyoda. Net worth widely disputed -- estimates range ~$300M to ~$2.1B depending on source/date, as his family''s actual stake in Toyota is small (under 2%; the company is majority owned by institutional/bank shareholders). Reported near the lower end here but flagged as inconsistent across sources. Phone is Toyota''s general HQ line.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3089);

-- 3090 Yasumitsu Shigeta
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3090, 'Yasumitsu Shigeta', 'Founder and Chairman', 'Hikari Tsushin, Inc.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 6900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and chairman of Hikari Tsushin, a Tokyo-listed mobile phone/telecom retailer and diversified services company (also power/gas supply, insurance). Net worth ~$5.2-6.9B depending on source/date; Forbes noted him entering the top 5 on Japan''s 2025 list with $6.9B, up from $4.2B the prior year -- notably volatile given stock concentration. No specific IR phone/email found published.',
  'Hikari West Gate Bldg, 1-4-10 Nishiikebukuro'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3090);

-- 3091 Takahisa Takahara
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3091, 'Takahisa Takahara', 'President and CEO', 'Unicharm Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 3400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). President and CEO of Unicharm, maker of personal-care products (MamyPoko diapers, sanitary products, masks), founded by his late father Keiichiro Takahara. Net worth estimate ~$3.4B as of early 2026, down from a peak of ~$6.4B in 2022 -- treat as estimate. IR page has a "Contact Us" form only, no direct phone/email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3091);

-- 3092 Yoshikazu Tanaka
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3092, 'Yoshikazu Tanaka', 'Founder', 'GREE, Inc. (GREE Holdings)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '+81-3-6221-2024', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 1500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of GREE, a mobile/social gaming company he took public in 2008; Forbes named him "Asia''s Youngest Self-Made Billionaire" in 2010. Net worth estimate ~$1.0-1.9B in recent years, down sharply from a peak near $4B around 2012, highly volatile with GREE''s share price. Phone is GREE Holdings'' general HQ line.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3092);

-- 3093 Masakazu Idemitsu
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3093, 'Masakazu Idemitsu', 'Board Member (Family Representative)', 'Idemitsu Kosan Co., Ltd.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '0120-132-015', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 1150, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Board member and grandson of founder Sazo Idemitsu; the Idemitsu family collectively holds roughly 30% of Idemitsu Kosan, one of Japan''s leading oil refiners. Net worth ~$1.15B per Forbes'' June 2026 report naming the family newly on Japan''s billionaire list amid higher oil prices. Phone is Idemitsu Kosan''s general reception line; no dedicated IR contact found separate from it.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3093);

-- 3094 Shigenobu Nagamori
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3094, 'Shigenobu Nagamori', 'Founder and Chairman', 'Nidec Corporation', 'UHNW Individual', 'A', 0,
  'ir@nidec.com', 'Corporate contact only', '+81-75-935-6140', 'Kyoto', '', 'Japan', 'Asia',
  NULL, 'Unknown', 2400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and chairman of Nidec, the world''s largest maker of precision motors (HDD, EV drivetrain motors). Net worth estimate ~$2.3-2.5B in 2026 rankings, down from a 2018-era $5.5B; company faced recent headwinds (removed from Nikkei 225/TOPIX Nov 2025 amid a subsidiary accounting investigation) -- treat as volatile. Email/phone are Nidec''s verified corporate IR channel (contact Teruaki Urago, GM Investor Relations, per a Jan 28 2026 press release).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3094);

-- 3095 Yusaku Maezawa
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3095, 'Yusaku Maezawa', 'Founder (former CEO)', 'ZOZO, Inc. (Zozotown)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Chiba City', 'Chiba', 'Japan', 'Asia',
  NULL, 'Unknown', 1600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Zozotown, Japan''s largest online fashion retailer; sold his stake to Yahoo Japan/Z Holdings in 2019 and stepped down as CEO. Now known for space-tourism ventures (chartered SpaceX flights) and art collecting. Net worth ~$1.4-1.9B in recent reporting, down from historical highs of $2-3B. ZOZO''s IR/ESG contact page is the company''s, not his personal office -- left blank rather than misattributed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3095);

-- 3096 Banjo Yamauchi
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3096, 'Yamauchi No. 10 Family Office', 'Family Representative', 'Yamauchi No. 10 Family Office', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Kyoto', '', 'Japan', 'Asia',
  NULL, 'Unknown', 918, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Private investment vehicle for the family behind Nintendo''s founding lineage (descendant of Fusajiro Yamauchi; family of former Nintendo president Hiroshi Yamauchi, d. 2013). Manages over JPY100B (~$918M at 2020 formation) -- below the standard $1B threshold, included as a notable UHNW family office. Hiroshi Yamauchi was Japan''s richest in 2008 at ~$7.8B (Nintendo shares, since transferred). No public contact; private family office.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3096);

-- 3097 Kazuo Okada
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3097, 'Kazuo Okada', 'Founder', 'Universal Entertainment Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', 1100, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Universal Entertainment (formerly Aruze Corp.; pachinko/casino equipment, Okada Manila resort); ousted from company leadership in 2017 amid financial-mismanagement allegations, engaged in extended litigation with Wynn Resorts (public record, compliance-relevant). Net worth $1.1-3B across sources, wide range reflects ongoing legal disputes, reported at the lower/recent estimate. IR page exists but no phone/email found.',
  '3-7-26 Ariake, Koto-ku'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3097);
