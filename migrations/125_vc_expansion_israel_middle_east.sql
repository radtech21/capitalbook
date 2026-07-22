-- VC segment expansion, batch 7: 15 Israel and Middle East VC firms,
-- added as brand-new contacts (ids 2580-2594). Next available id after
-- this batch is 2595.

-- 2580 Pitango Venture Capital, Herzliya, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2580, 'Pitango Venture Capital', 'Investment Team', 'Pitango Venture Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Herzliya', '', 'Israel', 'Middle East',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Israel''s largest/oldest VC platform, multi-stage across tech, health, deep tech. $300M raised across 2 new seed funds (2025); firm-wide AUM $3B+. Also offices NY, Santa Clara, Norwalk CT, Hong Kong. Street address unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2580);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2580, x.name, x.role FROM (
  SELECT 'Nechemia (Chemi) Peres' AS name, 'Co-Founder & Managing General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2580) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2580 AND name = x.name);

-- 2581 Vertex Ventures Israel, Tel Aviv, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2581, 'Vertex Ventures Israel', 'Investment Team', 'Vertex Ventures Israel', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tel Aviv', '', 'Israel', 'Middle East',
  1400, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Part of the global Vertex Holdings network (Temasek-affiliated). Early-stage (seed-Series B), $1.4B+ raised across 5 funds since 1997. HQ city conflicting (Savyon vs. Tel Aviv) -- verify. Street address unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2581);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2581, x.name, x.role FROM (
  SELECT 'Yanai Oron' AS name, 'General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2581) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2581 AND name = x.name);

-- 2582 Viola Ventures, Herzliya, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2582, 'Viola Ventures', 'Investment Team', 'Viola Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Herzliya', '', 'Israel', 'Middle East',
  1350, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed/A/B) Israeli tech fund, part of the broader Viola Group platform. $1.2-1.5B under management across 6 funds (range across sources).',
  '12 Abba Eban Avenue, Ackerstein Towers Bldg. D'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2582);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2582, x.name, x.role FROM (
  SELECT 'Shlomo Dovrat' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Omry Ben David', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2582) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2582 AND name = x.name);

-- 2583 Jerusalem Venture Partners (JVP), Jerusalem, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2583, 'Jerusalem Venture Partners', 'Investment Team', 'Jerusalem Venture Partners (JVP)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Jerusalem', '', 'Israel', 'Middle East',
  2000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cybersecurity, data, media, enterprise tech, early-to-growth. Founded 1993 by Erel Margalit. ~$1.9-2.18B raised across 10 funds (range across sources). Also offices Tel Aviv, New York, Kiryat Shmona.',
  '24 Hebron Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2583);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2583, x.name, x.role FROM (
  SELECT 'Erel Margalit' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2583) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2583 AND name = x.name);

-- 2584 Aleph, Tel Aviv, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2584, 'Aleph', 'Investment Team', 'Aleph', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tel Aviv', '', 'Israel', 'Middle East',
  850, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage VC backing Israeli entrepreneurs building global-scale companies. $850M+ under management; most recent flagship fund reported at $300M. All 4 partners hold the equal title "Partner," no seniority hierarchy.',
  '32 Rothschild Blvd'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2584);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2584, x.name, x.role FROM (
  SELECT 'Michael Eisenberg' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Eden Shochat', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2584) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2584 AND name = x.name);

-- 2585 Grove Ventures, Tel Aviv, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2585, 'Grove Ventures', 'Investment Team', 'Grove Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tel Aviv', '', 'Israel', 'Middle East',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage, deep-tech-leaning Israeli VC. $500M+ under management. Most recent named fund $185M (closed 2022) -- current 2024/2025 fund size not separately confirmed. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2585);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2585, x.name, x.role FROM (
  SELECT 'Dov Moran' AS name, 'Managing Partner & Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2585) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2585 AND name = x.name);

-- 2586 TLV Partners, Tel Aviv, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2586, 'TLV Partners', 'Investment Team', 'TLV Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tel Aviv', '', 'Israel', 'Middle East',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/Series A investor in Israeli entrepreneurs, founded 2015. $1B+ total AUM; Fund V closed $250M (2023).',
  '21 HaArbaa Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2586);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2586, x.name, x.role FROM (
  SELECT 'Rona Segev' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Eitan Bek', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2586) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2586 AND name = x.name);

-- 2587 Vintage Investment Partners, Herzliya Pituach, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2587, 'Vintage Investment Partners', 'Investment Team', 'Vintage Investment Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Herzliya Pituach', '', 'Israel', 'Middle East',
  4000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Fund-of-funds: VC fund investing, secondaries, co-investments across US/Europe/Israel (~2,250 underlying portfolio companies). ~$4B AUM overall (14 active funds); recent raise $812M across 2 new funds.',
  '12 Abba Eban Avenue, Ackerstein Towers Bldg. D, 10th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2587);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2587, x.name, x.role FROM (
  SELECT 'Alan Feld' AS name, 'Founder & Managing General Partner' AS role
  UNION ALL SELECT 'Asaf Horesh', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2587) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2587 AND name = x.name);

-- 2588 Glilot Capital Partners, Herzliya Pituach, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2588, 'Glilot Capital Partners', 'Investment Team', 'Glilot Capital Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Herzliya Pituach', '', 'Israel', 'Middle East',
  850, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage cybersecurity, dev-tools, enterprise software investor, founded 2011. AUM reported ~$700M-1B (range across sources). Investing from 4th seed fund + a first early-growth fund (Glilot+); Fund V size not confirmed. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2588);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2588, x.name, x.role FROM (
  SELECT 'Kobi Samboursky' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Arik Kleinstein', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2588) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2588 AND name = x.name);

-- 2589 83North, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2589, '83North', 'Investment Team', '83North', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  2200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly "Greylock IL." Consumer/enterprise tech spanning Israel, Europe, US. Registered HQ is London (dual UK/Israel-based, major Herzliya office) -- flag this dual identity given the firm''s Israeli roots. $2.2B+ under management. All 4 partners hold the equal title "Partner."',
  '21a Kingly St, Fl 2'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2589);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2589, x.name, x.role FROM (
  SELECT 'Laurel Bowden' AS name, 'Partner' AS role
  UNION ALL SELECT 'Gil Goren', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2589) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2589 AND name = x.name);

-- 2590 Team8, Tel Aviv, Israel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2590, 'Team8', 'Investment Team', 'Team8', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tel Aviv', '', 'Israel', 'Middle East',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Venture-creation + VC group: enterprise tech, cybersecurity, data/AI, fintech. Dual HQ with Midtown Manhattan, NY. $1B+ AUM; Fund II closed $235M (Mar 2024); Fund III (~$250-300M) reportedly in progress. Co-founder Nadav Zafrir moved to Check Point CEO Dec 2024 -- his current Team8 role unclear, not listed as contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2590);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2590, x.name, x.role FROM (
  SELECT 'Sarit Firon' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2590) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2590 AND name = x.name);

-- 2591 Shorooq Partners, Abu Dhabi, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2591, 'Shorooq Partners', 'Investment Team', 'Shorooq Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Abu Dhabi', '', 'United Arab Emirates', 'Middle East',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Alternative investment manager (VC + private credit) across MENA, backing tech seed-to-growth. Grown from $2M to ~$500M AUM since 2017. Also offices Dubai, Riyadh, Manama, Cairo. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2591);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2591, x.name, x.role FROM (
  SELECT 'Mahmoud Adi' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Shane Shin', 'Co-Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2591) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2591 AND name = x.name);

-- 2592 Wamda Capital, Dubai, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2592, 'Wamda Capital', 'Investment Team', 'Wamda Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Dubai', '', 'United Arab Emirates', 'Middle East',
  450, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage/seed and growth tech investor across MENA, Turkey, Sub-Saharan Africa, founded 2010. ~$450M AUM (fund-by-fund figures vary by source).',
  'Dubai Design District (d3), Building 7, 2nd Floor, Office #208B'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2592);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2592, x.name, x.role FROM (
  SELECT 'Fadi Ghandour' AS name, 'Founder, Chairman & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2592) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2592 AND name = x.name);

-- 2593 BECO Capital, Dubai, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2593, 'BECO Capital', 'Investment Team', 'BECO Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Dubai', '', 'United Arab Emirates', 'Middle East',
  820, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Full-stack Gulf/MENA VC, pre-seed through IPO (UAE and Saudi Arabia). $820M+ AUM; most recently closed $370M across 2 new funds (Sept 2025): $120M Fund IV + $250M Growth Fund.',
  'Office 105, Offices 4, One Central, Dubai World Trade Center'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2593);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2593, x.name, x.role FROM (
  SELECT 'Dany Farha' AS name, 'Co-Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2593) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2593 AND name = x.name);

-- 2594 STV (Saudi Technology Ventures), Riyadh, Saudi Arabia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2594, 'STV', 'Investment Team', 'STV (Saudi Technology Ventures)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Riyadh', '', 'Saudi Arabia', 'Middle East',
  1400, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Largest VC firm in the Middle East, founded 2017, growth-to-late-stage (Tabby, Careem, Salla). $1.4B+ AUM. ~17-person team incl. 5 partners. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2594);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2594, x.name, x.role FROM (
  SELECT 'Abdulrahman Tarabzouni' AS name, 'Founder & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2594) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2594 AND name = x.name);
