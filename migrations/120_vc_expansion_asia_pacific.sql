-- VC segment expansion, batch 4: 15 Asia-Pacific VC firms, added as
-- brand-new contacts (ids 2505-2519). Peak XV Partners and HongShan are
-- Sequoia's fully-independent India/SEA and China spinoffs (2023-24) --
-- legitimate new firms, not duplicates of Sequoia Capital (US, already
-- in the CRM). Next available id after this batch is 2520.

-- 2505 Peak XV Partners, Bengaluru, India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2505, 'Peak XV Partners', 'Investment Team', 'Peak XV Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia-Pacific',
  10000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Sequoia Capital India & SEA, fully independent since 2023. Early-to-growth stage, India/SEA + AI. $1.3B raised across new funds (Feb 2026); >$10B AUM. Offices Bangalore, Mumbai, Delhi, Singapore, Dubai. Street address low-confidence (aggregator source).',
  '278 Defence Colony, 2nd Stage, 100 Feet Road, Indiranagar'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2505);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2505, x.name, x.role FROM (
  SELECT 'Shailendra Singh' AS name, 'Managing Director' AS role
  UNION ALL SELECT 'Rajan Anandan', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2505) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2505 AND name = x.name);

-- 2506 HongShan Capital Group, Beijing, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2506, 'HongShan Capital Group', 'Investment Team', 'HongShan Capital Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Sequoia Capital China, fully independent since Mar 2024. Growth/venture in tech, consumer, healthcare across Greater China. No current fund size/AUM found. Street address low-confidence (aggregator source) -- verify.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2506);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2506, x.name, x.role FROM (
  SELECT 'Neil Shen' AS name, 'Founding & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2506) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2506 AND name = x.name);

-- 2507 Hillhouse Capital, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2507, 'Hillhouse Capital', 'Investment Team', 'Hillhouse Investment Management', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia-Pacific',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage (VC through PE/buyout), consumer/tech/healthcare, founded 2005 with Yale endowment seed capital. HQ location conflicting (Beijing vs. Singapore) reflecting multi-jurisdictional structure. AUM figures conflict ($63B vs. a stale $73.3B/2021) -- not reconciled, verify before use.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2507);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2507, x.name, x.role FROM (
  SELECT 'Zhang Lei' AS name, 'Founder & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2507) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2507 AND name = x.name);

-- 2508 Qiming Venture Partners, Shanghai, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2508, 'Qiming Venture Partners', 'Investment Team', 'Qiming Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Shanghai', '', 'China', 'Asia-Pacific',
  9500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cross-stage TMT/healthcare VC, US/China-linked LP base. $9.5B aggregate raised across 11 USD + 7 RMB funds. Managing partner Nisa Leung reportedly stepped down Feb 2025 -- flag as recent change. Offices also Beijing, Suzhou, HK, Seattle, Boston, SF.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2508);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2508, x.name, x.role FROM (
  SELECT 'Duane Kuang' AS name, 'Founding Managing Partner' AS role
  UNION ALL SELECT 'Gary Rieschel', 'Founding Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2508) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2508 AND name = x.name);

-- 2509 IDG Capital, Beijing, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2509, 'IDG Capital', 'Investment Team', 'IDG Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth/venture across TMT, healthcare, consumer in China with global reach (US, SEA). Founded early 1990s. No current disclosed fund size/AUM found. Current managing-partner roster beyond the founding chairman not confirmed.',
  '6th Floor, Tower A, COFCO Plaza, 8 Jianguomennei Avenue'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2509);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2509, x.name, x.role FROM (
  SELECT 'Hugo Shong' AS name, 'Founding Chairman' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2509) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2509 AND name = x.name);

-- 2510 Vertex Holdings, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2510, 'Vertex Holdings', 'Investment Team', 'Vertex Holdings (Vertex Ventures network)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia-Pacific',
  6800, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Wholly owned by Temasek. Early-to-growth tech/healthcare via a global network (SEA & India, China, US, Israel, Japan, Growth). ~$6.8B AUM across 7 network funds. Founded 1988.',
  '250 North Bridge Road, #11-01 Raffles City Tower'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2510);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2510, x.name, x.role FROM (
  SELECT 'Ben Mathias' AS name, 'Managing Partner (Vertex Ventures SEA & India)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2510) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2510 AND name = x.name);

-- 2511 Blume Ventures, Mumbai, India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2511, 'Blume Ventures', 'Investment Team', 'Blume Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mumbai', '', 'India', 'Asia-Pacific',
  900, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed/Series A) India-focused/globally-scalable tech investor. Fund IV (2022) ~$290M; total AUM >$900M. New fund reportedly launched 2025, details unconfirmed. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2511);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2511, x.name, x.role FROM (
  SELECT 'Karthik Reddy' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Sanjay Nath', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2511) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2511 AND name = x.name);

-- 2512 Nexus Venture Partners, Mumbai, India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2512, 'Nexus Venture Partners', 'Investment Team', 'Nexus Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mumbai', '', 'India', 'Asia-Pacific',
  3200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Dual US/India HQ (legally Silicon Valley-anchored: 3000 Sand Hill Rd, Menlo Park, CA) with India offices in Mumbai and Bengaluru. Fund 8 closed $700M (Dec 2025), reportedly largest VC fund raised globally that year. AUM figures conflict across sources (~$3.2B vs. a stale "$1.5B+").',
  'G-2, Sarjan Plaza 100, Dr. Annie Besant Road, Worli'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2512);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2512, x.name, x.role FROM (
  SELECT 'Sandeep Singhal' AS name, 'Co-Founder & Managing Director' AS role
  UNION ALL SELECT 'Suvir Sujan', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2512) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2512 AND name = x.name);

-- 2513 Elevation Capital, Gurugram, India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2513, 'Elevation Capital', 'Investment Team', 'Elevation Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Gurugram', '', 'India', 'Asia-Pacific',
  2600, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly SAIF Partners India, founded 2002. Early-to-late-stage, expanding into pre-IPO/late-stage growth. $400M late-stage "Elevation Holdings" fund (Aug 2025). AUM >$2.6B. ~10 partners/39 people, individual names not independently confirmed this pass.',
  '1502, 15th Floor, One Horizon Center, Sector 43, DLF Phase V, Golf Course Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2513);

-- 2514 East Ventures, Jakarta, Indonesia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2514, 'East Ventures', 'Investment Team', 'East Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Jakarta', '', 'Indonesia', 'Asia-Pacific',
  1700, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-to-growth across Indonesia/SEA, founded 2009, 525+ portfolio companies. ~$1.7B AUM. Also has a Singapore office (Marina Bay Financial Centre Tower 3); only that office''s street address was confirmed, not Jakarta''s.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2514);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2514, x.name, x.role FROM (
  SELECT 'Willson Cuaca' AS name, 'Co-Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2514) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2514 AND name = x.name);

-- 2515 Golden Gate Ventures, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2515, 'Golden Gate Ventures', 'Investment Team', 'Golden Gate Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia-Pacific',
  250, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage across SEA and MENA, founded 2011. ~$250M AUM across 4 funds; no confirmed 2025/2026 new fund. Also offices Jakarta, Hanoi, Ho Chi Minh City. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2515);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2515, x.name, x.role FROM (
  SELECT 'Vinnie Lauria' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Jeffrey Paine', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2515) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2515 AND name = x.name);

-- 2516 Monk's Hill Ventures, Singapore
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2516, 'Monk''s Hill Ventures', 'Investment Team', 'Monk''s Hill Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia-Pacific',
  200, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage tech across SEA, founded 2014, 55+ portfolio companies incl. 2 unicorns (Ninja Van, Scalable Capital). Fund III final close $200M (exact date unconfirmed).',
  '1 George Street, #21-01'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2516);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2516, x.name, x.role FROM (
  SELECT 'Peng T. Ong' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Kuo-Yi Lim', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2516) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2516 AND name = x.name);

-- 2517 Blackbird Ventures, Sydney, Australia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2517, 'Blackbird Ventures', 'Investment Team', 'Blackbird Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sydney', 'New South Wales', 'Australia', 'Asia-Pacific',
  1240, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Largest VC firm in Australia/NZ by AUM, seed/Series A. Fund V closed AUD$1B (Nov 2022, largest-ever Australian-manager fund at the time); total committed capital AUD$1.24B (2025). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2517);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2517, x.name, x.role FROM (
  SELECT 'Niki Scevak' AS name, 'Co-Founder & Partner' AS role
  UNION ALL SELECT 'Rick Baker', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2517) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2517 AND name = x.name);

-- 2518 Square Peg Capital, Sydney, Australia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2518, 'Square Peg Capital', 'Investment Team', 'Square Peg Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sydney', 'New South Wales', 'Australia', 'Asia-Pacific',
  3600, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage (early to growth/late-stage), tech-focused, spanning Australia, Israel, SEA. ~$3.6B AUM across venture/opportunities/global-listed-equities funds. Also teams in Melbourne, Tel Aviv, Singapore. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2518);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2518, x.name, x.role FROM (
  SELECT 'Paul Bassat' AS name, 'Co-Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2518) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2518 AND name = x.name);

-- 2519 AirTree Ventures, Sydney, Australia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2519, 'AirTree Ventures', 'Investment Team', 'AirTree Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sydney', 'New South Wales', 'Australia', 'Asia-Pacific',
  2000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-through-growth backing Australian tech startups. Fund V closed AUD$650M/~US$425M (Aug 2025), split $250M seed + $400M growth. Cumulative AUM ~$2B across Funds I-V.',
  '131 Devonshire St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2519);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2519, x.name, x.role FROM (
  SELECT 'Craig Blair' AS name, 'Co-Founder & Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2519) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2519 AND name = x.name);
