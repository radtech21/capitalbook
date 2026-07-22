-- Angel investor expansion, batch 3: 15 notable individual angel
-- investors, added as brand-new contacts (ids 2775-2789). Next available
-- id after this batch is 2790.

-- 2775 Sriram Krishnan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2775, 'Sriram Krishnan', 'General Partner / Angel Investor', 'Andreessen Horowitz', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). GP at a16z, former product exec at Twitter/Meta/Snap, active early-stage angel; served in a White House AI policy advisory role (2025). No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2775);

-- 2776 Garry Tan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2776, 'Garry Tan', 'President and CEO / Angel Investor', 'Y Combinator', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). President/CEO of Y Combinator, co-founder of Posterous and Initialized Capital, prolific early angel (Instacart, Coinbase). No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2776);

-- 2777 Paul Graham
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2777, 'Paul Graham', 'Co-Founder / Angel Investor', 'Y Combinator', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cambridge', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder of Y Combinator and Viaweb, essayist, early angel investor in numerous YC-adjacent startups. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2777);

-- 2778 Jessica Livingston
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2778, 'Jessica Livingston', 'Co-Founder / Angel Investor', 'Y Combinator', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder of Y Combinator, author of "Founders at Work", active angel investor. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2778);

-- 2779 Sam Altman
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2779, 'Sam Altman', 'CEO / Angel Investor', 'OpenAI', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). CEO of OpenAI, former President of Y Combinator, one of the most prolific tech angel investors of the 2010s (Airbnb, Stripe, Reddit and many others). No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2779);

-- 2780 Keith Rabois
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2780, 'Keith Rabois', 'General Partner / Angel Investor', 'Khosla Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). GP at Khosla Ventures, former PayPal/Square/LinkedIn exec, prolific early angel (Airbnb, Palantir, Stripe, YouTube). No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2780);

-- 2781 Josh Kushner
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2781, 'Josh Kushner', 'Founder and Managing Partner', 'Thrive Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of Thrive Capital, co-founder of Oscar Health, early investor in Instagram/Stripe/OpenAI. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2781);

-- 2782 Katie Haun
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2782, 'Katie Haun', 'Founder and CEO', 'Haun Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of Haun Ventures (crypto-focused fund), former federal prosecutor and a16z crypto GP. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2782);

-- 2783 Li Jin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2783, 'Li Jin', 'Founder and Managing Partner', 'Variant Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of Variant Fund (creator economy/crypto), former a16z investor, prominent angel in the creator-economy space. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2783);

-- 2784 Turner Novak
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2784, 'Turner Novak', 'General Partner', 'Banana Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). GP of Banana Capital, publisher of "The Spilled Milkshake" newsletter, active consumer/social-app angel investor. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2784);

-- 2785 Harry Stebbings
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2785, 'Harry Stebbings', 'Founder', '20VC', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of 20VC (podcast + fund), one of the most prolific young European VC/angel investors. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2785);

-- 2786 Packy McCormick
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2786, 'Packy McCormick', 'Founder', 'Not Boring Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of "Not Boring" newsletter and Not Boring Capital, active early-stage angel investor. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2786);

-- 2787 Rex Woodbury
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2787, 'Rex Woodbury', 'Founder and Managing Partner', 'Daybreak Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of Daybreak Ventures, publisher of "Digital Native" newsletter, active consumer-tech angel investor. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2787);

-- 2788 Taavet Hinrikus
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2788, 'Taavet Hinrikus', 'Co-Founder / Angel Investor', 'Wise (formerly TransferWise)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder of Wise (TransferWise), one of Europe''s most active fintech angel investors and a founding investor at Plural VC. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2788);

-- 2789 Ilkka Paananen
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2789, 'Ilkka Paananen', 'CEO / Angel Investor', 'Supercell', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Helsinki', '', 'Finland', 'Europe',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). CEO and co-founder of Supercell (mobile gaming), active angel investor in European gaming/consumer startups. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2789);
