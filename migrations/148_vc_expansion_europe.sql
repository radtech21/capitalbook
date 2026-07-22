-- VC segment expansion, batch 19: 15 Europe-focused VC firms, added
-- as brand-new contacts (ids 2924-2938). Next available id after this
-- batch is 2939.

-- 2924 Index Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2924, 'Index Ventures', 'Investment Team', 'Index Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  12000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage investor across software, fintech, healthcare, consumer internet; founded Geneva 1996, now HQ London. Partners incl. Danny Rimer; co-founder Neil Rimer retired active-partner status ~2021. ~$12B AUM; raised $2.3B for AI-focused funds July 2024. Also offices Geneva, SF, NY, Jersey.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2924);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2924, x.name, x.role FROM (
  SELECT 'Danny Rimer' AS name, 'Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2924) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2924 AND name = x.name);

-- 2925 Balderton Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2925, 'Balderton Capital', 'Investment Team', 'Balderton Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). European tech investor from seed through growth (AI, fintech, B2B SaaS, digital health, mobility). $1.3B raised in 2024 across two funds; ~$3B total committed capital since becoming independent from Benchmark Capital in 2007. Managing Partner Bernard Liautaud (co-founder of Business Objects).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2925);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2925, x.name, x.role FROM (
  SELECT 'Bernard Liautaud' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Suranga Chandratillake', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2925) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2925 AND name = x.name);

-- 2926 Atomico
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2926, 'Atomico', 'Investment Team', 'Atomico', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  1240, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Series A-through-growth investor in European tech; founded 2006 by Niklas Zennström (Skype/Kazaa co-founder) to prove European tech didn''t need to relocate to Silicon Valley. $1.24B raised across two funds Sept 2024; prior flagship fund $1.1B (2020). Also offices Paris, Berlin, Stockholm.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2926);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2926, x.name, x.role FROM (
  SELECT 'Niklas Zennström' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2926) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2926 AND name = x.name);

-- 2927 Northzone
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2927, 'Northzone', 'Investment Team', 'Northzone', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  1500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage VC across Europe and the US since 1996; notable investments include Spotify and Klarna. Fund X closed at $1B (its largest); over $1.5B raised across fund history. Also offices London, New York, Berlin, Amsterdam.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2927);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2927, x.name, x.role FROM (
  SELECT 'Jessica Schultz' AS name, 'Partner' AS role
  UNION ALL SELECT 'Elena Pantazi', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2927) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2927 AND name = x.name);

-- 2928 EQT Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2928, 'EQT Ventures', 'Investment Team', 'EQT Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  2300, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage European tech investor backed by EQT Group''s institutional platform; domiciled in Luxembourg, investment team across Stockholm, Paris, London, NY, Berlin, Amsterdam. EQT Ventures III closed at EUR1.1B (2022); ~EUR2.3B total raised across three funds. Founding partner Hjalmar Winbladh departed 2020.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2928);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2928, x.name, x.role FROM (
  SELECT 'Ted Persson' AS name, 'Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2928) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2928 AND name = x.name);

-- 2929 Cherry Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2929, 'Cherry Ventures', 'Investment Team', 'Cherry Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Berlin', '', 'Germany', 'Europe',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed and early-stage investor in European tech, "founders first" positioning; co-founded by Christian Meermann and Filip Dames (both ex-Zalando). $500M raised for Fund V; AUM ~$1B. Also offices London, Stockholm.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2929);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2929, x.name, x.role FROM (
  SELECT 'Christian Meermann' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Filip Dames', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2929) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2929 AND name = x.name);

-- 2930 Point Nine Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2930, 'Point Nine Capital', 'Investment Team', 'Point Nine Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Berlin', '', 'Germany', 'Europe',
  547, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage investor focused exclusively on SaaS and online-marketplace startups; co-founded 2011 by Christoph Janz and Pawel Chudzinski. AUM ~$547M; latest disclosed fund EUR180M (Fund VI, 2022).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2930);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2930, x.name, x.role FROM (
  SELECT 'Christoph Janz' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Pawel Chudzinski', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2930) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2930 AND name = x.name);

-- 2931 HV Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2931, 'HV Capital', 'Investment Team', 'HV Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Munich', '', 'Germany', 'Europe',
  2800, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Full lifecycle European digital company investor (seed through growth); founded 2000 as Burda Digital Ventures, became independent via management buyout 2017. AUM EUR2.8B; Fund IX closed ~EUR710M (2023), its largest. Also offices Berlin.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2931);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2931, x.name, x.role FROM (
  SELECT 'Rainer Märkle' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Lars Langusch', 'Managing Partner'
  UNION ALL SELECT 'David Kuczek', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2931) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2931 AND name = x.name);

-- 2932 Creandum
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2932, 'Creandum', 'Investment Team', 'Creandum', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed/Series A) European tech investor since 2003; founder Staffan Helgesson. Backed Spotify, Klarna, Bolt, iZettle. AUM figures conflict widely (~$500M vs ~$2B across sources); latest disclosed fund close EUR500M -- left Unknown given the spread.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2932);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2932, x.name, x.role FROM (
  SELECT 'Staffan Helgesson' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2932) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2932 AND name = x.name);

-- 2933 Lakestar
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2933, 'Lakestar', 'Investment Team', 'Lakestar', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Zurich', '', 'Switzerland', 'Europe',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early- and growth-stage investor in digital businesses across Europe; founded 2012 by Klaus Hommels (earlier personal investments in Facebook, Skype, Spotify, Revolut). AUM figures conflict widely ($2.2B vs over $6B incl. personal investments); closed a $265M continuation fund Sept 2025. As of Oct 2025, Hommels announced he will not raise new generalist LP funds going forward.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2933);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2933, x.name, x.role FROM (
  SELECT 'Klaus Hommels' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2933) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2933 AND name = x.name);

-- 2934 Speedinvest
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2934, 'Speedinvest', 'Investment Team', 'Speedinvest', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Vienna', '', 'Austria', 'Europe',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor across fintech, deep tech, health, industrial tech, marketplaces/consumer, SaaS/infrastructure; CEO and Managing Partner Oliver Holle. Surpassed EUR1B in AUM; latest fund cycle EUR600M total. Also offices Berlin, London, Munich, Paris.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2934);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2934, x.name, x.role FROM (
  SELECT 'Oliver Holle' AS name, 'CEO and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2934) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2934 AND name = x.name);

-- 2935 Partech
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2935, 'Partech', 'Investment Team', 'Partech', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  2700, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-continent, multi-stage investor (seed through growth); 220 portfolio companies in 40 countries, notably large dedicated Africa strategy alongside Europe/US. Originated 1982 as Paribas Technologies, independent via 2008 MBO. AUM EUR2.7B across five funds. Also offices Berlin, Dakar, Dubai, Nairobi, San Francisco.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2935);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2935, x.name, x.role FROM (
  SELECT 'Vincent Worms' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Jean-Marc Patouillaud', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2935) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2935 AND name = x.name);

-- 2936 Kinnevik
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2936, 'Kinnevik', 'Investment Team', 'Kinnevik', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Publicly listed investment company (not a traditional closed-end VC fund), founded 1936 by the Stenbeck/Klingspor/von Horn families; long-term active investor in digital consumer businesses (healthcare, software, marketplaces, climate tech), 35+ portfolio stakes. Reports NAV (~SEK 35.9B, Q4 2025) rather than AUM, left Unknown. CEO Georgi Ganev departed Nov 2025, successor not confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2936);

-- 2937 LocalGlobe / Latitude (Phoenix Court Group)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2937, 'LocalGlobe / Latitude', 'Investment Team', 'Phoenix Court Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). LocalGlobe invests at seed stage; sister fund Latitude invests Series B and later; UK/Europe-focused, founded 2015 by father-son team Robin Klein and Saul Klein (also LoveFilm co-founder). Seed fund XI $150M, second Latitude fund $220M; ~$500M available at first close across all Phoenix Court Group vehicles.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2937);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2937, x.name, x.role FROM (
  SELECT 'Robin Klein' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Saul Klein', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2937) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2937 AND name = x.name);

-- 2938 Seedcamp
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2938, 'Seedcamp', 'Investment Team', 'Seedcamp', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed/first-check investor in early-stage European startups, founded 2007; portfolio incl. Synthesia, Viz.ai, Function Health. Over $1B AUM; most recent raise $320M ($220M flagship Fund VII + $100M Select follow-on fund).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2938);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2938, x.name, x.role FROM (
  SELECT 'Reshma Sohoni' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Carlos Espinal', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2938) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2938 AND name = x.name);
