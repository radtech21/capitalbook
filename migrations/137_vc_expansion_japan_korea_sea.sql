-- VC segment expansion, batch 14: 15 Japan/Korea/SEA VC firms, added as
-- brand-new contacts (ids 2760-2774). Next available id after this batch
-- is 2775.

-- 2760 Global Brain Corporation, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2760, 'Global Brain Corporation', 'Investment Team', 'Global Brain Corporation', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Japan-based VC/CVC platform, corporate-innovation focus with KDDI as an anchor LP. Total AUM/fund size not independently confirmed. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2760);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2760, x.name, x.role FROM (
  SELECT 'Yasuhiko Yurimoto' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2760) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2760 AND name = x.name);

-- 2761 JAFCO Group, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2761, 'JAFCO Group', 'Investment Team', 'JAFCO Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of Japan''s oldest and largest VC firms (est. 1973), publicly listed (TSE: 8595). Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2761);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2761, x.name, x.role FROM (
  SELECT 'Shigeki Kimura' AS name, 'President and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2761) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2761 AND name = x.name);

-- 2762 Globis Capital Partners, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2762, 'Globis Capital Partners', 'Investment Team', 'Globis Capital Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of Japan''s largest independent VC firms, part of the Globis Group (also runs Globis University). Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2762);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2762, x.name, x.role FROM (
  SELECT 'Yoshito Hori' AS name, 'Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2762) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2762 AND name = x.name);

-- 2763 Incubate Fund, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2763, 'Incubate Fund', 'Investment Team', 'Incubate Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage Japan-focused VC, multiple fund generations since 2010. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2763);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2763, x.name, x.role FROM (
  SELECT 'Masahiko Honma' AS name, 'Founder and General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2763) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2763 AND name = x.name);

-- 2764 ANRI, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2764, 'ANRI', 'Investment Team', 'ANRI', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage Japan-focused VC founded 2012. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2764);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2764, x.name, x.role FROM (
  SELECT 'Kyoko Kimura' AS name, 'Founder and General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2764) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2764 AND name = x.name);

-- 2765 Coral Capital, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2765, 'Coral Capital', 'Investment Team', 'Coral Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/early-stage Japan-focused VC (formerly 500 Startups Japan), backs foreign-founder-friendly startups. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2765);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2765, x.name, x.role FROM (
  SELECT 'James Riney' AS name, 'Founding Partner and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2765) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2765 AND name = x.name);

-- 2766 World Innovation Lab (WiL), Tokyo, Japan / Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2766, 'World Innovation Lab (WiL)', 'Investment Team', 'World Innovation Lab', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cross-border growth-stage VC bridging Japan and Silicon Valley/US, backed by major Japanese corporate LPs. Current total AUM figure not independently confirmed. Dual HQ Tokyo/Palo Alto.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2766);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2766, x.name, x.role FROM (
  SELECT 'Gen Isayama' AS name, 'Co-Founder and General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2766) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2766 AND name = x.name);

-- 2767 Genesia Ventures, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2767, 'Genesia Ventures', 'Investment Team', 'Genesia Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage Japan/Southeast Asia-focused VC, also active in Indonesia. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2767);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2767, x.name, x.role FROM (
  SELECT 'Tatsuo Tamura' AS name, 'Founder and General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2767) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2767 AND name = x.name);

-- 2768 Korea Investment Partners, Seoul, South Korea
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2768, 'Korea Investment Partners', 'Investment Team', 'Korea Investment Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Seoul', '', 'South Korea', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of South Korea''s largest and oldest VC firms, part of Korea Investment Holdings group. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2768);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2768, x.name, x.role FROM (
  SELECT 'Vincent Jinoh Ahn' AS name, 'Chairman and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2768) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2768 AND name = x.name);

-- 2769 KB Investment, Seoul, South Korea
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2769, 'KB Investment', 'Investment Team', 'KB Investment', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Seoul', '', 'South Korea', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). VC arm of KB Financial Group, one of South Korea''s largest financial conglomerates. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2769);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2769, x.name, x.role FROM (
  SELECT 'Young Jip Lee' AS name, 'CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2769) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2769 AND name = x.name);

-- 2770 Kakao Ventures, Seoul, South Korea
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2770, 'Kakao Ventures', 'Investment Team', 'Kakao Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Seoul', '', 'South Korea', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage VC affiliated with Kakao Corp (Korea''s largest mobile platform operator). Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2770);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2770, x.name, x.role FROM (
  SELECT 'Chi Hyung Kim' AS name, 'CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2770) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2770 AND name = x.name);

-- 2771 Smilegate Investment, Seoul, South Korea
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2771, 'Smilegate Investment', 'Investment Team', 'Smilegate Investment', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Seoul', '', 'South Korea', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). VC arm of Smilegate (Korean gaming company), invests broadly in tech/gaming/content. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2771);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2771, x.name, x.role FROM (
  SELECT 'Yong Woo Lee' AS name, 'CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2771) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2771 AND name = x.name);

-- 2772 Openspace Ventures, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2772, 'Openspace Ventures', 'Investment Team', 'Openspace Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage Southeast Asia-focused VC (Indonesia, Vietnam, broader SEA). Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2772);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2772, x.name, x.role FROM (
  SELECT 'Shane Chesson' AS name, 'Co-Founder and Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2772) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2772 AND name = x.name);

-- 2773 Wavemaker Partners, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2773, 'Wavemaker Partners', 'Investment Team', 'Wavemaker Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage Southeast Asia/US cross-border VC, dual HQ Singapore/Los Angeles. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2773);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2773, x.name, x.role FROM (
  SELECT 'Paul Santos' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2773) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2773 AND name = x.name);

-- 2774 Insignia Ventures Partners, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2774, 'Insignia Ventures Partners', 'Investment Team', 'Insignia Ventures Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Southeast Asia-focused VC investing across the region''s digital economy. Current total AUM figure not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2774);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2774, x.name, x.role FROM (
  SELECT 'Yinglan Tan' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2774) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2774 AND name = x.name);
