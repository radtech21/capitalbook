-- Angel investor expansion, batch 4: 15 notable individual angel
-- investors, added as brand-new contacts (ids 2969-2983). Next
-- available id after this batch is 2984.

-- 2969 Reid Hoffman
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2969, 'Reid Hoffman', 'Partner / Angel Investor', 'Greylock Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder of LinkedIn, Partner at Greylock (Menlo Park); active angel before going full-time VC in 2009, known for network-effects businesses and early bets on Facebook, Airbnb, and other consumer/enterprise platforms. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2969);

-- 2970 Peter Thiel
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2970, 'Peter Thiel', 'Co-Founder and Partner / Angel Investor', 'Founders Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder and Partner of Founders Fund, Chairman of Palantir, Co-Founder of Thiel Capital. Legendary early Facebook angel investor ($500K in 2004); continues angel/seed investing alongside Founders Fund with a contrarian focus on hard tech, defense, category-defining startups. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2970);

-- 2971 Naval Ravikant
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2971, 'Naval Ravikant', 'Co-Founder and Chairman', 'AngelList', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder and Chairman (former CEO) of AngelList; one of the most prolific angel investors of the last two decades (146+ investments incl. early stakes in Twitter, Uber, Postmates), still actively writing personal angel checks. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2971);

-- 2972 Elad Gil
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2972, 'Elad Gil', 'Independent Solo Investor', 'Gil & Co', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). One of the most prolific solo VCs, raised over $1B for his third fund; backed 40+ unicorns/decacorns incl. Anduril, Anthropic, Perplexity, Figma, Deel, Stripe. Ranked #6 on the 2026 Forbes Midas List. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2972);

-- 2973 Jason Calacanis
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2973, 'Jason Calacanis', 'Founder', 'LAUNCH', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of LAUNCH (fund + accelerator + syndicate) and host of "This Week in Startups." Runs one of the largest angel syndicates in the world (10,000+ backers), investing in ~100 startups/year; notable early investments incl. Uber, Robinhood. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2973);

-- 2974 Chris Sacca
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2974, 'Chris Sacca', 'Founder and Chairman / Co-Founder and Managing Partner', 'Lowercase Capital / Lowercarbon Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Truckee', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Early angel/seed investor in Twitter, Uber, Instagram, Twilio, Stripe through Lowercase Capital; now focuses primarily on climate/decarbonization investing via Lowercarbon Capital. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2974);

-- 2975 Esther Dyson
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2975, 'Esther Dyson', 'Chairman', 'EDventure Holdings', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Chairman of EDventure Holdings, longtime angel investor and author across health, aerospace/"new space," emerging markets, technology; director/advisor on multiple startup boards, still actively investing. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2975);

-- 2976 Niklas Zennström (angel)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2976, 'Niklas Zennström (Angel)', 'Founder and CEO / Angel Investor', 'Atomico / Skype', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Note: Atomico (the firm he founded, id 2926) is a separate contacts_people record -- this entry captures his personal angel-investing activity distinct from the institutional fund. Co-founder of Skype/Kazaa. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2976);

-- 2977 Nat Friedman
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2977, 'Nat Friedman', 'Co-Founder, NFDG / Co-Lead, Meta Superintelligence Labs', 'NFDG', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder of NFDG (with Daniel Gross), former GitHub CEO; prolific AI-era angel/seed investor (Safe Superintelligence, Perplexity, Character.ai). As of mid-2025 joined Meta full-time (Meta Superintelligence Labs, reporting to Alexandr Wang); Meta has been in talks to partially buy out NFDG''s holdings -- role has shifted from pure independent angel toward a corporate AI leadership position, flag as borderline/special case.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2977);

-- 2978 Daniel Gross
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2978, 'Daniel Gross', 'Co-Founder, NFDG / Meta Superintelligence Labs', 'NFDG', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder of NFDG (with Nat Friedman), former CEO of Safe Superintelligence, former Y Combinator Partner; historically a top AI/tech angel investor (Pioneer Fund, NFDG). As of 2025-2026 primarily employed at Meta; NFDG remains active with LPs being partially bought out by Meta -- same borderline-status flag as Nat Friedman.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2978);

-- 2979 Balaji Srinivasan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2979, 'Balaji Srinivasan', 'Independent Angel Investor and Author', 'Independent', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Former CTO of Coinbase, former General Partner at Andreessen Horowitz; active angel across crypto, AI, biotech (99+ investments incl. Perplexity, Ultrahuman). Based primarily in Singapore/Southeast Asia region. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2979);

-- 2980 Elizabeth Yin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2980, 'Elizabeth Yin', 'Co-Founder and General Partner', 'Hustle Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Co-founder and GP of Hustle Fund; pre-seed specialist, backed 700+ early-stage companies with small check sizes ($5K-$250K) across software, fintech, consumer tech. Closed a $46M third fund. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2980);

-- 2981 Charlie Songhurst
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2981, 'Charlie Songhurst', 'Senior Venture Partner / Board Member, Meta Platforms', 'Acequia Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Kirkland', 'Washington', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Senior Venture Partner/Advisor at Acequia Capital (AceCap), Board Member at Meta Platforms, former Head of Corporate Strategy at Microsoft. One of the most prolific angel investors globally (~500 companies), pattern-recognition-driven bets across AI, fintech, deep tech, biotech, quantum computing. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2981);

-- 2982 Semil Shah
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2982, 'Semil Shah', 'Founding General Partner', 'Haystack', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founding GP of Haystack, currently investing Haystack Ventures VIII (~$85M core fund). Early seed backer of DoorDash, Figma, HashiCorp; ranked #98 on Forbes'' 2026 Midas List. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2982);

-- 2983 Lachy Groom
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2983, 'Lachy Groom', 'Founder / Co-Founder', 'LGF / Physical Intelligence', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in angel investor expansion (2026). Founder of LGF, Co-Founder of Physical Intelligence, former Stripe executive. Angel investor with 13 unicorns in portfolio (incl. Deel, Speak) and 7 exits (Metronome, Atom Finance, Umba, Hyperplane), focused heavily on enterprise software and fintech. No public personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2983);
