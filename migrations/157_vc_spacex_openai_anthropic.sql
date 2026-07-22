-- VC/investor expansion: early investors/backers of SpaceX, OpenAI,
-- and Anthropic, added as brand-new contacts (ids 3054-3066). Next
-- available id after this batch is 3067. Three candidates surfaced by
-- research (Eric Schmidt, Dustin Moskovitz, Spark Capital) were
-- deliberately EXCLUDED as duplicates already in the CRM (ids 2800,
-- 2802, 2952 respectively). Two candidates (Ross Perot Jr., Capricorn
-- Investment Group/Jeff Skoll) could not be verified as SpaceX
-- investors and were excluded per the no-fabrication policy.

-- 3054 Founders Fund
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3054, 'Founders Fund', 'Investment Team', 'Founders Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): SpaceX early-backer research. Wrote SpaceX''s first institutional check in 2008, invested roughly $600M+ since. Co-founded by Peter Thiel, already a separate UHNW/angel record in the CRM (id 2970) -- this is the distinct firm entity, not a duplicate. AUM not confirmed, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3054);

-- 3055 Valor Equity Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3055, 'Valor Equity Partners', 'Investment Team', 'Valor Equity Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Chicago', 'Illinois', 'United States', 'United States',
  450, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): SpaceX early-backer research. Private equity/growth firm led by longtime Musk ally Antonio Gracias, one of SpaceX''s earliest and largest institutional backers (invested since 2008, ~$400-500M over the years). Also offices San Francisco, New York.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3055);
INSERT INTO contact_people (contact_id, name, role)
SELECT 3055, x.name, x.role FROM (
  SELECT 'Antonio Gracias' AS name, 'Founder, CEO and CIO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 3055) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 3055 AND name = x.name);

-- 3056 DFJ Growth
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3056, 'DFJ Growth', 'Investment Team', 'DFJ Growth', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  800, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): SpaceX early-backer research. Growth-stage VC firm (spinoff of Draper Fisher Jurvetson); first invested in SpaceX from its inaugural fund in 2009 (~$10M initially, $800M+ since).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3056);

-- 3057 Steve Jurvetson
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3057, 'Steve Jurvetson', 'Co-Founder / Board Member, SpaceX', 'Future Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): SpaceX early-backer research. Venture capitalist, formerly of Draper Fisher Jurvetson, now co-founder of Future Ventures; personally invested in SpaceX in 2009 and has served on its board since. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3057);

-- 3058 Google / Alphabet Inc. (SpaceX investor)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3058, 'Google (Alphabet Inc.) — SpaceX Investment', 'Corporate Strategic Investor', 'Alphabet Inc.', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mountain View', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): SpaceX early-backer research. Google jointly led a $1B funding round in SpaceX alongside Fidelity in January 2015 (~7.5-10% stake), tied to satellite internet ambitions; a direct corporate investment, not made through Google''s formal VC arm (GV). Represents the SpaceX-specific investment relationship distinct from Google/Alphabet as a general institution.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3058);

-- 3059 Fidelity Investments
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3059, 'Fidelity Investments', 'Institutional Co-Investor, SpaceX', 'Fidelity Investments', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): SpaceX early-backer research. Major mutual fund company that co-invested alongside Google in SpaceX''s January 2015 $1B round. This record represents Fidelity''s SpaceX-specific investment relationship, not a general Fidelity corporate contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3059);

-- 3060 Khosla Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3060, 'Khosla Ventures', 'Investment Team', 'Khosla Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): OpenAI early-backer research. Founded by Vinod Khosla; was OpenAI''s first outside institutional investor, January 2019, ~$50M (now estimated worth ~$8B) -- one of the most successful single venture bets on record.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3060);
INSERT INTO contact_people (contact_id, name, role)
SELECT 3060, x.name, x.role FROM (
  SELECT 'Vinod Khosla' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 3060) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 3060 AND name = x.name);

-- 3061 Microsoft Corporation (OpenAI investor)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3061, 'Microsoft Corporation — OpenAI Investment', 'Corporate Strategic Investor', 'Microsoft Corporation', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Redmond', 'Washington', 'United States', 'United States',
  13000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): OpenAI early-backer research. Microsoft is OpenAI''s largest corporate backer, providing capital and compute via a multi-stage strategic partnership: $1B (2019), $2B (2021), $10B (2023); ~$13B+ cumulative, ~27% stake. CEO Satya Nadella. This record represents the OpenAI-specific investment relationship.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3061);
INSERT INTO contact_people (contact_id, name, role)
SELECT 3061, x.name, x.role FROM (
  SELECT 'Satya Nadella' AS name, 'CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 3061) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 3061 AND name = x.name);

-- 3062 Jaan Tallinn
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3062, 'Jaan Tallinn', 'Individual Investor / Co-Founder, Skype', 'Independent', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cambridge', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): Anthropic early-backer research. Skype/Kazaa co-founder turned prominent AI-safety-focused investor; led Anthropic''s $124M Series A (2021) and was also an early DeepMind investor/board member. Based Estonia/Cambridge UK area, ties to Cambridge MA via Future of Life Institute. No dedicated corporate/personal contact published.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3062);

-- 3063 James McClave
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3063, 'James McClave', 'Individual Angel Investor', 'Independent', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): Anthropic early-backer research. Lower-profile Wall Street-connected angel (background at Jane Street) who was an early Anthropic backer (Series A/B, 2021-2022). Per CNN/WRAL reporting, also a co-investor alongside Sam Bankman-Fried before FTX''s 2022 collapse -- flagged here neutrally as a factual, publicly-reported association, not an allegation against McClave himself. Only firm-level (Jane Street) contact is public; no personal contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3063);

-- 3064 Salesforce Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3064, 'Salesforce Ventures', 'Investment Team', 'Salesforce Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): Anthropic early-backer research. Corporate venture arm of Salesforce; participated in Anthropic''s $450M Series C (May 2023) alongside Google and Spark Capital, as part of its enterprise-AI investment thesis.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3064);

-- 3065 Zoom Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3065, 'Zoom Ventures', 'Investment Team', 'Zoom Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Jose', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): Anthropic early-backer research. Corporate venture arm of Zoom; invested ~$51M in Anthropic alongside a strategic partnership (May 2023) while integrating Claude into Zoom''s product suite; stake reportedly worth ~$1.3B as of 2025.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3065);

-- 3066 Sound Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3066, 'Sound Ventures', 'Investment Team', 'Sound Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in investor expansion (2026): Anthropic early-backer research. Co-founded by Ashton Kutcher and Guy Oseary; participated in Anthropic''s $450M Series C (May 2023). Note: Kutcher reportedly left Sound Ventures in mid-2026 to launch a new firm with Morgan Beller -- flag for a firm-affiliation refresh before outreach.',
  '9255 Sunset Blvd'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3066);
INSERT INTO contact_people (contact_id, name, role)
SELECT 3066, x.name, x.role FROM (
  SELECT 'Ashton Kutcher' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Guy Oseary', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 3066) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 3066 AND name = x.name);
