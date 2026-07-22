-- UHNW individual expansion, batch: 4 additional Canadian UHNW
-- individuals/families, added as brand-new contacts (ids 3067-3070).
-- Next available id after this batch is 3071. This batch was
-- deliberately trimmed from 15 candidates down to 4: the research
-- agent (lacking visibility into the exact existing CRM contents)
-- returned mostly duplicates of the earlier Canada UHNW batch
-- (migration 129: Thomson, Rogers, Irving, Saputo, Desmarais,
-- Pattison, Bronfman, Stronach, Katz families/individuals are all
-- already in the CRM). Only genuinely new individuals/families are
-- included here.

-- 3067 Chip Wilson
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3067, 'Chip Wilson', 'Founder (former CEO/Chairman)', 'Lululemon Athletica Inc.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Vancouver', 'British Columbia', 'Canada', 'Canada',
  NULL, 'Unknown', 6300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founded Lululemon in 2000; remains its largest individual shareholder (~7%) though he exited management/board roles by 2015. Net worth ~$6.3B (Forbes #645, 2026 list); estimates range $4-7B by source/date. Lululemon has an investor-contact page (corporate.lululemon.com/investors); a specific email/phone was not independently confirmed, left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3067);

-- 3068 Tobi Lütke
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3068, 'Tobi Lütke', 'Co-Founder and CEO', 'Shopify Inc.', 'UHNW Individual', 'A', 0,
  'IR@shopify.com', 'Corporate contact only', '+1 (877) 373-6374', 'Ottawa', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', 10500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder and long-time CEO of Shopify, the e-commerce platform used by millions of merchants. Net worth estimates range ~$9-15B across sources (Forbes #302 ~$9.1B, Jan 2025; Bloomberg ~$10.5B, Apr 2026) -- reported near midpoint. Email/phone are Shopify''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3068);

-- 3069 Azrieli Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3069, 'Azrieli Family (Danna Azrieli et al.)', 'Family Shareholders', 'Azrieli Group', 'UHNW Individual', 'A', 0,
  'IR@azrieli.com', 'Corporate contact only', '+972 3 6081310', 'Toronto', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', 2900, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Canadian-Israeli real estate dynasty founded by the late David Azrieli (d. 2014, estimated ~$3.1B at death); daughters Danna, Naomi, and Sharon jointly hold ~46% of the publicly traded Azrieli Group (dual-listed real estate group, Tel Aviv HQ, family base Toronto). Danna Azrieli individually estimated ~$2.9B (Forbes 2026). Email/phone are Azrieli Group''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3069);

-- 3070 Gerald Schwartz
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3070, 'Gerald Schwartz', 'Founder (former CEO/Chairman)', 'Onex Corporation', 'UHNW Individual', 'A', 0,
  'investor@onex.com', 'Corporate contact only', '+1 416.362.7711', 'Toronto', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', 1700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and, until 2023, longtime CEO/chairman of Onex Corporation, one of Canada''s largest private-equity firms (~$50B AUM). Net worth ~$1.5-1.9B (Forbes #2481, 2026 list), reported near midpoint. Email/phone are Onex''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3070);
