-- VC segment expansion, batch 15: 15 China/Hong Kong-focused VC firms,
-- added as brand-new contacts (ids 2834-2848). Next available id after
-- this batch is 2849. AUM figures for Chinese VC firms are especially
-- inconsistent across public sources (self-reported, dated, mixing
-- cumulative-raised vs current AUM); flagged per-firm, left
-- NULL/Unknown where sources meaningfully conflict rather than picking
-- an arbitrary number.

-- 2834 HongShan (formerly Sequoia Capital China)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2834, 'HongShan', 'Investment Team', 'HongShan', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Sequoia Capital China; became fully independent in the 2023-2024 Sequoia global breakup. Founding/Managing Partner Neil Shen. AUM figures vary widely by source/vintage (a "$56B total AUM" figure appears in some 2023 reporting) -- not confirmed to a single current number, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2834);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2834, x.name, x.role FROM (
  SELECT 'Neil Shen' AS name, 'Founding and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2834) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2834 AND name = x.name);

-- 2835 Hillhouse Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2835, 'Hillhouse Capital', 'Investment Team', 'Hillhouse Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage (venture, growth, buyout) investor across healthcare, consumer, technology; founded 2005 by Zhang Lei (Lei Zhang) with a $20M grant from Yale''s endowment. Global HQ Singapore, major offices Hong Kong/Beijing/Shanghai. AUM figures range ~$63B-$100B+ depending on source/year -- not confirmed to a single current number, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2835);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2835, x.name, x.role FROM (
  SELECT 'Zhang Lei' AS name, 'Founder, Chairman and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2835) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2835 AND name = x.name);

-- 2836 Qiming Venture Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2836, 'Qiming Venture Partners', 'Investment Team', 'Qiming Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Shanghai', '', 'China', 'Asia',
  9500, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage VC in technology/TMT and healthcare, founded 2006 by Duane Kuang and Gary Rieschel. $9.5B figure is cumulative capital raised across 18 USD/RMB funds (2024 aggregator reporting), not necessarily current AUM -- treat as approximate. Also offices in Beijing, Suzhou, Hong Kong, Seattle, Boston, SF Bay Area.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2836);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2836, x.name, x.role FROM (
  SELECT 'Duane Kuang' AS name, 'Founding Managing Partner' AS role
  UNION ALL SELECT 'Nisa Leung', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2836) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2836 AND name = x.name);

-- 2837 Granite Asia (formerly GGV Capital Asia/China)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2837, 'Granite Asia', 'Investment Team', 'Granite Asia', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  5000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-asset venture-through-growth investment platform spanning China, Southeast Asia, South Asia, Japan, Australia; rebrand of GGV Capital''s Asia operations (March 2024 GGV split into Granite Asia and US-focused Notable Capital). $5B AUM per Forbes, March 2024.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2837);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2837, x.name, x.role FROM (
  SELECT 'Jenny Lee' AS name, 'Co-Managing Partner' AS role
  UNION ALL SELECT 'Jixun Foo', 'Co-Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2837) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2837 AND name = x.name);

-- 2838 ZhenFund
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2838, 'ZhenFund', 'Investment Team', 'ZhenFund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed and early-stage/angel investor, generalist across tech and consumer, co-founded by Xu Xiaoping ("Bob Xu") and Wang Qiang ("Victor Wang"), both New Oriental co-founders. AUM figures inconsistent across sources ("exceeding $1B" vs ~$1.6-1.7B across seven funds) -- left Unknown. Also offices Shanghai, Shenzhen, Palo Alto.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2838);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2838, x.name, x.role FROM (
  SELECT 'Xu Xiaoping' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Wang Qiang', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2838) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2838 AND name = x.name);

-- 2839 MPC (formerly Matrix Partners China)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2839, 'MPC (formerly Matrix Partners China)', 'Investment Team', 'MPC', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage China technology/internet VC (notable portfolio: XPeng); rebranded from Matrix Partners China to "MPC" effective July 1, 2024. Founding Managing Partner David Su, Partner Harry Man. AUM reported ~RMB70B (~$9.6B, 2024 aggregator estimate) -- not firm-published, treat as approximate; left Unknown. Also significant Shanghai presence.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2839);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2839, x.name, x.role FROM (
  SELECT 'David Su' AS name, 'Founding Managing Partner' AS role
  UNION ALL SELECT 'Harry Man', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2839) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2839 AND name = x.name);

-- 2840 IDG Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2840, 'IDG Capital', 'Investment Team', 'IDG Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Broad-stage venture/growth capital, technology and internet-focused; one of the earliest foreign VC entrants into China (originated from International Data Group, entered China 1992-93). AUM figure of $20-23B is dated to ~2021; no confirmed more-recent figure, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2840);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2840, x.name, x.role FROM (
  SELECT 'Hugo Shong' AS name, 'Founding Chairman' AS role
  UNION ALL SELECT 'Quan Zhou', 'Co-Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2840) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2840 AND name = x.name);

-- 2841 China Renaissance
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2841, 'China Renaissance', 'Investment Team', 'China Renaissance', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Dual investment-banking/asset-management model serving China''s "new economy" companies (HKEX: 1911), not a pure VC fund. Founder Bao Fan resigned all roles in early 2024 after a 2023 disappearance amid a government probe; per Caixin, reportedly released ~Aug 2025. Most recent confirmed AUM ~$7.7B (Dec 2021); no reliable current figure, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2841);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2841, x.name, x.role FROM (
  SELECT 'Bao Fan' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2841) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2841 AND name = x.name);

-- 2842 Source Code Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2842, 'Source Code Capital', 'Investment Team', 'Source Code Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  6000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed/Series A/B) technology VC; founding partner Cao Yi (Yi Cao), ex-Sequoia Capital China VP. Early backer of ByteDance; also invested in Meituan, Li Auto. AUM figures inconsistent (~$5.2B 2022 vs ~$7B more recent) -- reported as ~$6B midpoint estimate, treat as approximate.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2842);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2842, x.name, x.role FROM (
  SELECT 'Cao Yi' AS name, 'Founding Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2842) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2842 AND name = x.name);

-- 2843 5Y Capital (formerly Morningside Venture Capital)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2843, '5Y Capital', 'Investment Team', '5Y Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Shanghai', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Venture/growth capital across technology, biotech, consumer (portfolio incl. XPeng, Horizon Robotics); founded 2008 as Morningside Venture Capital, rebranded 5Y Capital October 2020. Name derives from Wuyuan Road (Shanghai). AUM figures conflict (~$3B vs ~$6B across sources) -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2843);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2843, x.name, x.role FROM (
  SELECT 'Richard Liu' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Ken Shi', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2843) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2843 AND name = x.name);

-- 2844 Gaorong Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2844, 'Gaorong Capital', 'Investment Team', 'Gaorong Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early- and growth-stage TMT, AI, consumer, and enterprise-services VC; founded Jan 2014 (formerly Banyan Capital until 2018) by three ex-IDG Capital professionals. AUM figures range widely (~$2.2B-$4B, one "RMB 30B+" outlier) -- left Unknown given the spread.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2844);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2844, x.name, x.role FROM (
  SELECT 'Zhang Zhen' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Gao Xiang', 'Co-Founder'
  UNION ALL SELECT 'Yue Bin', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2844) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2844 AND name = x.name);

-- 2845 Legend Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2845, 'Legend Capital', 'Investment Team', 'Legend Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Legend Holdings/Lenovo-affiliated VC, investing in tech, healthcare, consumer, enterprise services (portfolio incl. Meituan, NIO, ZTO Express). No current senior-partner names confirmed -- no contact_people rows added. AUM range ~$10-15B+, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2845);

-- 2846 CDH Investments
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2846, 'CDH Investments', 'Investment Team', 'CDH Investments', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Diversified alternative asset manager spanning private equity, venture/growth capital, credit, real assets, and wealth management (broader than a pure VC fund); founded 2002 by former CICC Direct Investment Division colleagues. AUM figures dated (~$25.7-27B, 2021-2022) with no confirmed recent figure, left Unknown. Also offices Hong Kong, Singapore, Shanghai, Shenzhen.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2846);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2846, x.name, x.role FROM (
  SELECT 'Wu Shangzhi' AS name, 'Chairman and Co-Founder' AS role
  UNION ALL SELECT 'Jiao Shuge', 'Co-Founder and CEO'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2846) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2846 AND name = x.name);

-- 2847 Northern Light Venture Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2847, 'Northern Light Venture Capital', 'Investment Team', 'Northern Light Venture Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia',
  4500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage technology and healthcare VC; co-founded 2005 by Feng Deng and Yan Ke, both previously co-founded NetScreen Technologies (acquired by Juniper for $4.2B in 2004). ~$4.5B AUM across 5-6 USD and 4-5 RMB funds (source undated). Also offices Shanghai, Hong Kong, Silicon Valley.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2847);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2847, x.name, x.role FROM (
  SELECT 'Feng Deng' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Yan Ke', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2847) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2847 AND name = x.name);

-- 2848 Lightspeed China Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2848, 'Lightspeed China Partners', 'Investment Team', 'Lightspeed China Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Shanghai', '', 'China', 'Asia',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage China-focused technology, consumer, and enterprise VC; founded 2011 by James Mi (previously a partner at the US-based Lightspeed Venture Partners). ~$3B AUM (undated aggregator estimate). One source indicates a possible rebrand to "Luminous Ventures" starting ~November 2025 -- unconfirmed, recommend checking the firm''s current name before outreach. Also offices Beijing, Hong Kong.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2848);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2848, x.name, x.role FROM (
  SELECT 'James Mi' AS name, 'Founding Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2848) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2848 AND name = x.name);
