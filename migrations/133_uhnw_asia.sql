-- UHNW individual expansion, batch 5: 15 Asian UHNW individuals, added
-- as brand-new contacts (ids 2700-2714). Real published CORPORATE
-- contact routes (IR/press office) populated where found -- company
-- channels only, never personal. Next available id after this batch
-- is 2715.

-- 2700 Mukesh Ambani, Mumbai, India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2700, 'Mukesh Ambani', 'Chairman & Managing Director', 'Reliance Industries Limited', 'UHNW Individual', 'A', 0,
  'rrvl.investor@kfintech.com', 'Corporate contact only', '1800-309-8998', 'Mumbai', '', 'India', 'Asia-Pacific',
  NULL, 'Unknown', 95000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Reliance Industries (petrochemicals, telecom/Jio, retail, energy). Net worth ~$90-117B (Forbes 2026, #21 globally, range reflects RIL share volatility). Email/phone are Reliance Retail Ventures IR corporate contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2700);

-- 2701 Gautam Adani, Ahmedabad, India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2701, 'Gautam Adani', 'Chairman', 'Adani Group', 'UHNW Individual', 'A', 0,
  'investor.apl@adani.com', 'Corporate contact only', '079 2656 7555', 'Ahmedabad', '', 'India', 'Asia-Pacific',
  NULL, 'Unknown', 89200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Adani Group (ports, power, energy, infrastructure). Net worth $89.2B (Forbes, Jun 2026) -- briefly Asia''s richest person. Email/phone are Adani Power IR corporate contact.',
  'Shantigram'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2701);

-- 2702 Zhong Shanshan, Hangzhou, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2702, 'Zhong Shanshan', 'Founder & Chairman', 'Nongfu Spring; Beijing Wantai Biological', 'UHNW Individual', 'B', 0,
  'pr@mail.nfsq.com.cn', 'Corporate contact only', '0571-87631800', 'Hangzhou', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 68100, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Nongfu Spring (bottled water); also controls Beijing Wantai Biological. Net worth ~$68.1B (Forbes, Mar 2026, China rich list #27 global). Email/phone are Nongfu Spring corporate switchboard/media contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2702);

-- 2703 Zhang Yiming, Beijing, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2703, 'Zhang Yiming', 'Founder', 'ByteDance (TikTok/Douyin)', 'UHNW Individual', 'A', 0,
  'press@bytedance.com', 'Corporate contact only', '', 'Beijing', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 69300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, ByteDance (TikTok/Douyin), based Beijing/Singapore. Net worth $69.3B (Forbes, Mar 2026, China''s richest); a Jun 2026 Bloomberg estimate was higher (~$92.8B) after new investor valuations. Email is ByteDance corporate press contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2703);

-- 2704 Colin Huang, Hangzhou, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2704, 'Colin Huang', 'Founder', 'PDD Holdings (Pinduoduo, Temu)', 'UHNW Individual', 'A', 0,
  'investor@pddholdings.com', 'Corporate contact only', '', 'Hangzhou', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 44000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, PDD Holdings (Pinduoduo, Temu); former CEO/chairman. Net worth estimates $39-49B (Forbes ~$39.1B, May 2025; other trackers up to $49B in 2026). Email is PDD Holdings investor-relations corporate contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2704);

-- 2705 Ma Huateng (Pony Ma), Shenzhen, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2705, 'Ma Huateng', 'Co-Founder, Chairman & CEO', 'Tencent Holdings', 'UHNW Individual', 'A', 0,
  'tencent.ecom@computershare.com.hk', 'Corporate contact only', '(852) 2862 8688', 'Shenzhen', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 61000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Chairman & CEO, Tencent Holdings. Net worth ~$57-65B (range across 2026 sources). Also known as Pony Ma. Email/phone are Tencent IR via Computershare Hong Kong.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2705);

-- 2706 William Ding, Hangzhou, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2706, 'William Ding', 'Founder & CEO', 'NetEase', 'UHNW Individual', 'B', 0,
  'ir@service.netease.com', 'Corporate contact only', '(+86) 571-8985-3378', 'Hangzhou', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 41000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder & CEO, NetEase (also known as Ding Lei). Net worth ~$38-44B (Forbes #55, 2026). Email/phone are NetEase investor-relations corporate contacts.',
  '599 Wangshang Road, Binjiang District'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2706);

-- 2707 Robin Zeng, Ningde, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2707, 'Robin Zeng', 'Founder, Chairman & CEO', 'CATL (Contemporary Amperex Technology)', 'UHNW Individual', 'A', 0,
  'CATL-IR@catl.com', 'Corporate contact only', '+86 0593-8901666', 'Ningde', 'Fujian', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 61850, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Chairman/CEO, CATL (world''s largest EV battery maker). Also known as Zeng Yuqun. Net worth ~$57.8-65.9B (Forbes, Jul 2026). Email/phone are CATL investor-relations corporate contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2707);

-- 2708 Tadashi Yanai, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2708, 'Tadashi Yanai', 'Chairman, President & CEO', 'Fast Retailing (Uniqlo)', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '03-6865-0960', 'Tokyo', '', 'Japan', 'Asia-Pacific',
  NULL, 'Unknown', 61800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/President/CEO, Fast Retailing (Uniqlo parent). Net worth $61.8B (Forbes #32, 2026, richest in Japan on that list). Phone is Fast Retailing PR Department corporate contact.',
  'Midtown Tower, Akasaka 9-7-1, Minato-ku'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2708);

-- 2709 Masayoshi Son, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2709, 'Masayoshi Son', 'Chairman & CEO', 'SoftBank Group Corp.', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+81 3 6889 2000', 'Tokyo', '', 'Japan', 'Asia-Pacific',
  NULL, 'Unknown', 80000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, SoftBank Group Corp. Net worth highly volatile in 2026, ranged $75-97B through the year; reclaimed #1 on Japan''s 50 Richest list (~$80B). This is separate from the SoftBank Vision Fund firm-level CRM record. Phone is SoftBank HQ switchboard.',
  '1-7-1 Kaigan, Minato'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2709);

-- 2710 Lee Jae-yong, Suwon, South Korea
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2710, 'Lee Jae-yong', 'Executive Chairman', 'Samsung Electronics', 'UHNW Individual', 'A', 0,
  'ircontactus@samsung.com', 'Corporate contact only', '82-31-200-1114', 'Suwon', '', 'South Korea', 'Asia-Pacific',
  NULL, 'Unknown', 30500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Executive Chairman, Samsung Electronics; also known as Jay Y. Lee. Net worth $27-34B (Forbes, cited $34B May 11 2026); sole Korean in Forbes'' global top 100 that year at $27B. Email/phone are Samsung IR corporate contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2710);

-- 2711 Robert Kuok, Hong Kong
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2711, 'Robert Kuok', 'Founder', 'Kuok Group / Shangri-La Asia', 'UHNW Individual', 'B', 0,
  'admin.ir@shangri-la.com', 'Corporate contact only', '', 'Hong Kong', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 13900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Kuok Group / Shangri-La Asia (hotels) / Wilmar International / PPB Group. Net worth $13.6-14.2B (Forbes 2026, Malaysia''s richest at 102 years old). Email is Shangri-La Asia IR corporate contact.',
  '28/F Kerry Centre, 683 King''s Road, Quarry Bay'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2711);

-- 2712 Lim Kok Thay, Kuala Lumpur, Malaysia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2712, 'Lim Kok Thay', 'Executive Chairman', 'Genting Group / Genting Berhad', 'UHNW Individual', 'C', 0,
  '', 'Corporate contact only', '+60 3-2178 2200', 'Kuala Lumpur', '', 'Malaysia', 'Asia-Pacific',
  NULL, 'Unknown', 1725, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Executive Chairman, Genting Group / Genting Berhad. Net worth ~$1.65-1.8B (Forbes 2026 Malaysia''s 50 Richest, #15, down from #9 prior year). Phone is Genting Berhad general HQ line.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2712);

-- 2713 Charoen Sirivadhanabhakdi, Bangkok, Thailand
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2713, 'Charoen Sirivadhanabhakdi', 'Chairman', 'TCC Group / Thai Beverage (ThaiBev)', 'UHNW Individual', 'B', 0,
  'ir@thaibev.com', 'Corporate contact only', '', 'Bangkok', '', 'Thailand', 'Asia-Pacific',
  NULL, 'Unknown', 11350, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, TCC Group / Thai Beverage (ThaiBev). Net worth $11.1-11.6B (Forbes, May 30 2026). Email is ThaiBev investor-relations corporate contact.',
  'ThaiBev Quarter, 62 Ratchadaphisek Rd., Klongtoey'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2713);

-- 2714 Dhanin Chearavanont, Bangkok, Thailand
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2714, 'Dhanin Chearavanont', 'Senior Chairman', 'Charoen Pokphand (CP) Group', 'UHNW Individual', 'B', 0,
  'prcpgroup@cp.co.th', 'Corporate contact only', '+66(0)-2766-8000', 'Bangkok', '', 'Thailand', 'Asia-Pacific',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Senior Chairman, CP Group -- individual family patriarch, distinct from the CP Group entity record already in the CRM (id 2253). Individual net worth not separately disclosed; family collectively ~$42.6-44.1B (Forbes/Bloomberg). Email/phone are CP Group corporate contacts.',
  '18 True Tower, Ratchadaphisek Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2714);
