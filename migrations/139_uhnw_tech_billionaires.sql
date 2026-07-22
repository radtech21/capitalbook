-- UHNW individual expansion, batch: 15 tech billionaires, added as
-- brand-new contacts (ids 2790-2804). Next available id after this
-- batch is 2805. Per standing policy, email/phone are populated ONLY
-- with real, published corporate/IR contacts and never with fabricated
-- or guessed personal details; where no such contact could be
-- confidently verified, the fields are left blank and data_flags notes
-- that explicitly.

-- 2790 Bill Gates
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2790, 'Bill Gates', 'Co-Chair, Gates Foundation / Founder, Microsoft', 'Gates Foundation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Medina', 'Washington', 'United States', 'United States',
  NULL, 'Unknown', 108000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder of Microsoft, Chair of Gates Foundation and Cascade Investment. Net worth ~$108B (2026 est., Forbes/Bloomberg range). No verified personal contact found; Gates Foundation general/press contacts exist but were not confidently confirmed here, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2790);

-- 2791 Jeff Bezos
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2791, 'Jeff Bezos', 'Founder and Executive Chairman', 'Amazon', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 235000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Amazon, owner of Blue Origin and The Washington Post. Net worth ~$235B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2791);

-- 2792 Elon Musk
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2792, 'Elon Musk', 'CEO', 'Tesla / SpaceX', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 400000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). CEO of Tesla and SpaceX, founder of xAI and The Boring Company. Net worth ~$400B (2026 est., highly volatile with TSLA/xAI valuations). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2792);

-- 2793 Mark Zuckerberg
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2793, 'Mark Zuckerberg', 'Founder, Chairman and CEO', 'Meta Platforms', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', 220000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Chairman and CEO of Meta Platforms. Net worth ~$220B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2793);

-- 2794 Larry Ellison
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2794, 'Larry Ellison', 'Co-Founder and Chairman / CTO', 'Oracle', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Lanai', 'Hawaii', 'United States', 'United States',
  NULL, 'Unknown', 275000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Chairman and CTO of Oracle; owner of most of the island of Lanai, Hawaii. Net worth ~$275B (2026 est., volatile with ORCL). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2794);

-- 2795 Larry Page
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2795, 'Larry Page', 'Co-Founder', 'Alphabet (Google)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', 190000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder of Google/Alphabet. Net worth ~$190B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2795);

-- 2796 Sergey Brin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2796, 'Sergey Brin', 'Co-Founder', 'Alphabet (Google)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Los Altos', 'California', 'United States', 'United States',
  NULL, 'Unknown', 180000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder of Google/Alphabet. Net worth ~$180B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2796);

-- 2797 Michael Dell
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2797, 'Michael Dell', 'Founder, Chairman and CEO', 'Dell Technologies', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 130000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Chairman and CEO of Dell Technologies; also runs MSD Capital/MSD Partners family office. Net worth ~$130B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2797);

-- 2798 Steve Ballmer
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2798, 'Steve Ballmer', 'Former CEO, Microsoft / Owner, LA Clippers', 'Microsoft / LA Clippers', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Hunts Point', 'Washington', 'United States', 'United States',
  NULL, 'Unknown', 175000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Former Microsoft CEO, owner of the LA Clippers. Net worth ~$175B (2026 est., largely MSFT stock). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2798);

-- 2799 Jensen Huang
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2799, 'Jensen Huang', 'Co-Founder, President and CEO', 'NVIDIA', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Los Altos Hills', 'California', 'United States', 'United States',
  NULL, 'Unknown', 155000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, President and CEO of NVIDIA. Net worth ~$155B (2026 est., highly volatile with NVDA). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2799);

-- 2800 Eric Schmidt
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2800, 'Eric Schmidt', 'Former CEO/Chairman, Google', 'Google / Alphabet', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Atherton', 'California', 'United States', 'United States',
  NULL, 'Unknown', 40000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Former Google/Alphabet CEO and Chairman, active tech/AI investor and philanthropist. Net worth ~$40B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2800);

-- 2801 Marc Benioff
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2801, 'Marc Benioff', 'Co-Founder, Chair and CEO', 'Salesforce', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 12000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Chair and CEO of Salesforce; owner of Time magazine. Net worth ~$12B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2801);

-- 2802 Dustin Moskovitz
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2802, 'Dustin Moskovitz', 'Co-Founder and CEO', 'Asana', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 17000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Facebook co-founder, co-founder and CEO of Asana, co-founder of Good Ventures/Open Philanthropy. Net worth ~$17B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2802);

-- 2803 Brian Chesky
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2803, 'Brian Chesky', 'Co-Founder and CEO', 'Airbnb', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 14000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder and CEO of Airbnb. Net worth ~$14B (2026 est., volatile with ABNB). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2803);

-- 2804 Daniel Ek
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2804, 'Daniel Ek', 'Co-Founder and CEO', 'Spotify', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  NULL, 'Unknown', 12000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder and CEO of Spotify, active European tech investor (defense-tech via Helsing). Net worth ~$12B (2026 est.). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2804);
