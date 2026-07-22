-- UHNW individual expansion, batch 2 (final): 15 notable UHNW
-- individuals outside tech/VC and real estate (energy, sports
-- ownership, industrials, agriculture, media), added as brand-new
-- contacts (ids 2550-2564). Completes the initial UHNW pass requested
-- by the user (Terry Pegula was the seed example). Net worth figures
-- vary meaningfully across sources; ranges are flagged where they
-- diverge materially. No personal email/phone/home address found or
-- guessed -- only public corporate/team front-office contact routes.

-- 2550 Terry Pegula, Buffalo, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2550, 'Terry Pegula', 'Founder', 'East Resources; Owner, Buffalo Bills & Sabres', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Buffalo', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 9300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, East Resources (Marcellus/Niobrara shale gas, sold to Shell $4.7B, 2010); owner, Buffalo Bills (NFL) and Sabres (NHL). Net worth $9.3B (Forbes, ~Apr 2026). Routing via Pegula Sports & Entertainment / Bills front office.',
  'One Bills Drive'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2550);

-- 2551 Robert Kraft, Foxborough, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2551, 'Robert Kraft', 'Chairman & CEO', 'The Kraft Group; Owner, New England Patriots', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Foxborough', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', 13800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/CEO, The Kraft Group (paper/packaging -- Rand-Whitney, Intl Forest Products; also RE); owner, New England Patriots (NFL) and Revolution (MLS). Net worth $13.8B (Forbes, 2026). Routing via kraftgroup.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2551);

-- 2552 Jerry Jones, Dallas, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2552, 'Jerry Jones', 'Owner', 'Dallas Cowboys; Controlling Shareholder, Comstock Resources', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Dallas', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 20700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Oil & gas wildcatter; controlling shareholder, Comstock Resources (public, Frisco TX) + private Arkoma; owner, Dallas Cowboys (NFL). Net worth ~$20.7B (Forbes, early 2026) -- wide variance across sources (some ~$13B), flag before citing a precise figure.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2552);

-- 2553 Harold Hamm, Oklahoma City, OK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2553, 'Harold Hamm', 'Founder & Chairman', 'Continental Resources', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Oklahoma City', 'Oklahoma', 'United States', 'United States',
  NULL, 'Unknown', 16000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Chairman, Continental Resources (Bakken shale oil pioneer; took the company private 2022). Net worth $16B (Forbes, 2026). Routing via Continental Resources corporate HQ/IR.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2553);

-- 2554 Charles Koch, Wichita, KS
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2554, 'Charles Koch', 'Chairman & CEO', 'Koch Industries', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Wichita', 'Kansas', 'United States', 'United States',
  NULL, 'Unknown', 72000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/CEO, Koch Industries -- largest private US conglomerate (chemicals, refining, energy, pipelines, commodities trading). Net worth ~$71-73B (Bloomberg/Celebrity Net Worth, 2025). Routing via Koch Industries corporate/media relations.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2554);

-- 2555 David Tepper, Miami Beach, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2555, 'David Tepper', 'Founder & President', 'Appaloosa Management; Owner, Carolina Panthers', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Miami Beach', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 20600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/President, Appaloosa Management (hedge fund); owner, Carolina Panthers (NFL) and Charlotte FC (MLS). Net worth $20.6B (Forbes). Note: primary wealth source is a hedge fund, distinct from most of this UHNW batch.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2555);

-- 2556 Josh Harris, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2556, 'Josh Harris', 'Managing Partner', 'Washington Commanders; Co-Founder, Apollo Global Management', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 9000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Apollo Global Management (PE); founder, 26North Partners; Managing Partner, Washington Commanders (NFL); co-owner (via Harris Blitzer Sports & Entertainment) of 76ers (NBA) and Devils (NHL). Net worth estimates $7.9-10B across sources (Forbes #341, 2026).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2556);

-- 2557 Rupert Murdoch, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2557, 'Rupert Murdoch', 'Founder', 'News Corp / Fox Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 22000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, News Corp and Fox Corporation (Fox News, WSJ, The Times); stepped down as chairman Sep 2023, son Lachlan now runs Fox. Net worth ~$22-23B (Forbes, Mar 2026). Routing via News Corp / Fox Corp corporate relations.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2557);

-- 2558 Jacqueline Mars, McLean, VA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2558, 'Jacqueline Mars', 'Heir & Owner (~1/3 stake)', 'Mars, Incorporated', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'McLean', 'Virginia', 'United States', 'United States',
  NULL, 'Unknown', 39200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Heir/owner (~1/3 stake), Mars Incorporated (M&Ms, Snickers, Pedigree; privately held, $54B+ 2024 sales). Net worth ~$39.2B (Forbes). No individual contact route -- only Mars Inc. corporate/media relations (McLean, VA) is public; family members don''t have published personal channels.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2558);

-- 2559 Diane Hendricks, Beloit, WI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2559, 'Diane Hendricks', 'Co-Founder & Chair', 'ABC Supply Co.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Beloit', 'Wisconsin', 'United States', 'United States',
  NULL, 'Unknown', 22300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-Founder/Chair, ABC Supply Co. (largest US wholesale roofing/siding/window distributor, $20.7B 2024 sales); America''s richest self-made woman 8 consecutive years (Forbes). Net worth $22.3B (Forbes, 2025). Routing via ABC Supply / Hendricks Holding Company, Beloit, WI.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2559);

-- 2560 Arthur Blank, Atlanta, GA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2560, 'Arthur Blank', 'Owner', 'Atlanta Falcons & Atlanta United FC; Co-Founder, The Home Depot', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Atlanta', 'Georgia', 'United States', 'United States',
  NULL, 'Unknown', 10000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, The Home Depot (retired as co-chairman 2001); owner, Atlanta Falcons (NFL) and Atlanta United FC (MLS). Net worth $9.2-11.4B depending on source/date (Forbes, 2025). Routing via AMB Sports & Entertainment or the Arthur M. Blank Family Foundation, Atlanta, GA.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2560);

-- 2561 Micky Arison, Miami, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2561, 'Micky Arison', 'Chairman', 'Carnival Corporation & plc; Owner, Miami Heat', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 8600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Carnival Corporation & plc (world''s largest cruise operator); owner, Miami Heat (NBA). Net worth ~$8.6B (Forbes, 2025; some sources cite up to $10B). Routing via Carnival Corp IR or Miami Heat front office.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2561);

-- 2562 Jimmy Haslam, Knoxville, TN
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2562, 'Jimmy Haslam', 'Owner', 'Cleveland Browns; Former Chairman, Pilot Flying J', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Knoxville', 'Tennessee', 'United States', 'United States',
  NULL, 'Unknown', 8500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Former Chairman, Pilot Flying J (truck stop chain, sold in stages to Berkshire Hathaway for $13.6B total, 2017-2024); owner, Cleveland Browns (NFL); minority stakes in Columbus Crew (MLS) and Milwaukee Bucks (NBA). Net worth $8.5-8.7B (Forbes #316, 2026). Routing via Haslam Sports Group / Browns front office.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2562);

-- 2563 Tilman Fertitta, Houston, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2563, 'Tilman Fertitta', 'Owner & CEO', 'Landry''s, Inc.; Owner, Houston Rockets', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Houston', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 11300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Owner/CEO, Landry''s Inc. (restaurants, Golden Nugget Casinos, hospitality); owner, Houston Rockets (NBA). Net worth $11.3B (Forbes, 2025 Richest Sports Owners). NOTE: recently confirmed as U.S. Ambassador to Italy -- relevant for outreach availability/timing.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2563);

-- 2564 Cargill-MacMillan family (represented by Cargill MacMillan III), Wayzata, MN
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2564, 'Cargill MacMillan III', 'Family Shareholder', 'Cargill, Incorporated', 'UHNW Individual', 'C', 0,
  '', 'No public contact', '', 'Wayzata', 'Minnesota', 'United States', 'United States',
  NULL, 'Unknown', 1600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Heir/family shareholder, Cargill Inc. (America''s largest private company, $154B 2025 revenue). One of ~21 Cargill-MacMillan family billionaires; family collectively ranks #5 on Forbes'' Richest Families ($47-65B+ combined). His individual net worth ~$1.5-1.8B is far smaller since ownership spans ~100 family members. No individual contact route -- only Cargill Inc. corporate/media relations is public.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2564);
