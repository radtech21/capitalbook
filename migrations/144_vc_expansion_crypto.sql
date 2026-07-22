-- VC segment expansion, batch 17: 15 crypto/web3-focused VC firms
-- (mostly US-based), added as brand-new contacts (ids 2864-2878). Next
-- available id after this batch is 2879.

-- 2864 Paradigm
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2864, 'Paradigm', 'Investment Team', 'Paradigm', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  12700, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage and technical-frontier investor across crypto, DeFi, blockchain infrastructure; co-founded by Fred Ehrsam (Coinbase co-founder) and Matt Huang (ex-Sequoia). ~$12.7B AUM reported April 2025; raised $2.5B for Paradigm One (2021) and $850M-1.2B for Paradigm Three (2024). Also has a Washington DC office.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2864);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2864, x.name, x.role FROM (
  SELECT 'Fred Ehrsam' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Matt Huang', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2864) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2864 AND name = x.name);

-- 2865 Polychain Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2865, 'Polychain Capital', 'Investment Team', 'Polychain Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  2900, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Investor in cryptocurrency protocols and tokens; founder/CEO Olaf Carlson-Wee, former Coinbase Head of Risk. ~$2.9B AUM (recent estimate); earlier reports cited ~$4B (2021) -- treat as approximate given the range.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2865);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2865, x.name, x.role FROM (
  SELECT 'Olaf Carlson-Wee' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2865) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2865 AND name = x.name);

-- 2866 Multicoin Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2866, 'Multicoin Capital', 'Investment Team', 'Multicoin Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  4500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Thesis-driven investor in cryptocurrencies, tokens, blockchain companies; co-founded by Kyle Samani (stepped down from day-to-day role Feb 2026) and Tushar Jain (Managing Partner). ~$4.5B AUM per firm''s own reporting.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2866);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2866, x.name, x.role FROM (
  SELECT 'Kyle Samani' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Tushar Jain', 'Co-Founder and Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2866) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2866 AND name = x.name);

-- 2867 Pantera Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2867, 'Pantera Capital', 'Investment Team', 'Pantera Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  4000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Venture capital and hedge fund investing exclusively in digital assets/blockchain, one of the earliest US crypto-focused funds (est. 2013); founder/Managing Partner Dan Morehead. AUM figures range ~$3.8B (Jan 2026) to ~$5B (2025) depending on source/date -- reported as ~$4B midpoint.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2867);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2867, x.name, x.role FROM (
  SELECT 'Dan Morehead' AS name, 'Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2867) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2867 AND name = x.name);

-- 2868 Electric Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2868, 'Electric Capital', 'Investment Team', 'Electric Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  2880, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in blockchain protocols and crypto-native companies, also known for its widely-cited developer report research; co-founded by Avichal Garg and Curtis Spencer. ~$2.88B AUM per Form ADV filed March 31 2026.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2868);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2868, x.name, x.role FROM (
  SELECT 'Avichal Garg' AS name, 'Co-Founder and General Partner' AS role
  UNION ALL SELECT 'Curtis Spencer', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2868) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2868 AND name = x.name);

-- 2869 Placeholder VC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2869, 'Placeholder VC', 'Investment Team', 'Placeholder VC', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  150, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Investor in cryptonetworks, Web3 infrastructure, decentralized systems; partners Chris Burniske (ex-ARK Investment Management) and Joel Monegro (ex-Union Square Ventures). ~$150M AUM (approximate, per available reporting).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2869);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2869, x.name, x.role FROM (
  SELECT 'Chris Burniske' AS name, 'Partner' AS role
  UNION ALL SELECT 'Joel Monegro', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2869) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2869 AND name = x.name);

-- 2870 1confirmation
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2870, '1confirmation', 'Investment Team', '1confirmation', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage crypto/web3 fund backing founders building decentralized-web protocols and applications; founder and General Partner Nick Tomaino. AUM sources conflict widely ($75M to over $1B) -- left Unknown. Some sources list a Palo Alto address; not fully confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2870);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2870, x.name, x.role FROM (
  SELECT 'Nick Tomaino' AS name, 'Founder and General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2870) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2870 AND name = x.name);

-- 2871 Dragonfly Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2871, 'Dragonfly Capital', 'Investment Team', 'Dragonfly Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  4000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global crypto venture investor, originally a cross-border US/Asia fund; Managing Partners Haseeb Qureshi and Bo Feng (founding credit publicly disputed with co-founder Alexander Pack). ~$4B total AUM incl. a $650M Fund IV. HQ city not fully confirmed -- sources conflict between San Francisco and Oakland, CA.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2871);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2871, x.name, x.role FROM (
  SELECT 'Haseeb Qureshi' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Bo Feng', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2871) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2871 AND name = x.name);

-- 2872 Framework Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2872, 'Framework Ventures', 'Investment Team', 'Framework Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  1300, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early conviction investor in DeFi protocols and networks (Chainlink, Aave, Synthetix, The Graph); co-founded by Michael Anderson and Vance Spencer. ~$1.3B AUM per Form ADV/RIA filing; raised funds including $100M and $400M vehicles.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2872);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2872, x.name, x.role FROM (
  SELECT 'Michael Anderson' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Vance Spencer', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2872) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2872 AND name = x.name);

-- 2873 Blockchain Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2873, 'Blockchain Capital', 'Investment Team', 'Blockchain Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  1800, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of the earliest blockchain-dedicated VC firms (est. 2013), investing across infrastructure, gaming, DeFi; co-founded by brothers Bart Stephens and Brad Stephens (Brock Pierce also a co-founder). ~$1.8B AUM cited; most recent named fund (Fund V) closed at $300M, with a separate $580M fund also reported.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2873);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2873, x.name, x.role FROM (
  SELECT 'Bart Stephens' AS name, 'Co-Founder and Managing Partner' AS role
  UNION ALL SELECT 'Brad Stephens', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2873) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2873 AND name = x.name);

-- 2874 CoinFund
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2874, 'CoinFund', 'Investment Team', 'CoinFund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Brooklyn', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Web3-focused seed, venture, and liquid-stage investor (est. 2015); founder and CEO Jake Brukhman. No total-AUM figure confirmed -- most recent public data point is a $158M funding round for crypto/AI investments specifically, not overall AUM, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2874);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2874, x.name, x.role FROM (
  SELECT 'Jake Brukhman' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2874) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2874 AND name = x.name);

-- 2875 North Island Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2875, 'North Island Ventures', 'Investment Team', 'North Island Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  300, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Crypto and blockchain-focused venture investor, founded 2020; co-founders Glenn Hutchins (Chairman) and James Hutchins (Managing Partner), Travis Scher also a co-founder. Over $300M AUM reported; second fund closed at $125M (Sept 2022).',
  '200 Park Avenue South'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2875);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2875, x.name, x.role FROM (
  SELECT 'Glenn Hutchins' AS name, 'Co-Founder and Chairman' AS role
  UNION ALL SELECT 'James Hutchins', 'Co-Founder and Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2875) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2875 AND name = x.name);

-- 2876 Hack VC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2876, 'Hack VC', 'Investment Team', 'Hack VC', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Incline Village', 'Nevada', 'United States', 'United States',
  425, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in crypto, blockchain infrastructure, and AI-crypto crossover startups. ~$425M total AUM incl. a $150M Fund I. Named General Partners could not be confirmed from available research -- no contact_people rows added; recommend checking the firm''s site directly. HQ city also inconsistently reported (some sources cite Palo Alto/San Francisco).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2876);

-- 2877 Robot Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2877, 'Robot Ventures', 'Investment Team', 'Robot Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  75, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in technically sophisticated crypto and DeFi projects; co-founded by Robert Leshner (founder/CEO of Compound Protocol) and Tarun Chitra (founder of Gauntlet Network). Most recent fund was $75M (raised August 2024); total AUM not confirmed. HQ city also uncertain -- conflicting sources cite New York, NY and Beaverton, OR.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2877);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2877, x.name, x.role FROM (
  SELECT 'Robert Leshner' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Tarun Chitra', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2877) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2877 AND name = x.name);

-- 2878 Digital Currency Group (DCG)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2878, 'Digital Currency Group', 'Investment Team', 'Digital Currency Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stamford', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Diversified digital-currency holding company/investor since 2015, parent of Grayscale Investments, Genesis, and (at various points) CoinDesk; founder and CEO Barry Silbert. No consolidated current AUM figure is published by DCG itself -- left Unknown (historically associated with Grayscale''s >$12B AUM circa 2021, though more recent Grayscale-specific figures are lower, ~$2B). Relocated from Manhattan to Stamford, CT in November 2021.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2878);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2878, x.name, x.role FROM (
  SELECT 'Barry Silbert' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2878) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2878 AND name = x.name);
