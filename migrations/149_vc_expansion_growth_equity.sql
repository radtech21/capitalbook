-- VC segment expansion, batch 20: 15 US growth-equity/late-stage VC
-- firms, added as brand-new contacts (ids 2939-2953). Next available
-- id after this batch is 2954. AUM figures for these large multi-
-- strategy firms are especially inconsistent across public sources;
-- flagged per-firm.

-- 2939 Tiger Global Management
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2939, 'Tiger Global Management', 'Investment Team', 'Tiger Global Management', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  32000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Public and private equity investor in global internet/software/tech, early venture through late growth and public markets; founder Chase Coleman. ~$32B AUM across public/private portfolios (aggregator data) -- figures vary by source, treat as approximate.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2939);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2939, x.name, x.role FROM (
  SELECT 'Chase Coleman' AS name, 'Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2939) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2939 AND name = x.name);

-- 2940 Coatue Management
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2940, 'Coatue Management', 'Investment Team', 'Coatue Management', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  56000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Invests across public/private markets in tech, media, telecom, consumer, healthcare; founder Philippe Laffont. AUM figures range ~$54B (Forbes 2026) to ~$58.6B (discretionary AUM, March 2024) -- not a single confirmed number, reported near the midpoint.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2940);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2940, x.name, x.role FROM (
  SELECT 'Philippe Laffont' AS name, 'Founder' AS role
  UNION ALL SELECT 'Thomas Laffont', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2940) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2940 AND name = x.name);

-- 2941 General Atlantic
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2941, 'General Atlantic', 'Investment Team', 'General Atlantic', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  118000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global growth equity investor, primarily minority growth investments in tech, healthcare, financial services, consumer, life sciences, infrastructure; Chairman/CEO William (Bill) Ford. AUM figures range ~$80B-$126B across sources (Wikipedia ~$118B as of Sept 2025 used here) -- not fully reconciled.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2941);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2941, x.name, x.role FROM (
  SELECT 'William E. Ford' AS name, 'Chairman and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2941) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2941 AND name = x.name);

-- 2942 Insight Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2942, 'Insight Partners', 'Investment Team', 'Insight Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  92000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth equity and venture firm investing in high-growth software ("ScaleUp") companies globally; co-founder Jeff Horing. Over $90B regulatory AUM as of Dec 31 2025 (~$92.18B per Form ADV). Also offices London, Tel Aviv, Palo Alto.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2942);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2942, x.name, x.role FROM (
  SELECT 'Jeff Horing' AS name, 'Co-Founder and Managing Director' AS role
  UNION ALL SELECT 'Deven Parekh', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2942) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2942 AND name = x.name);

-- 2943 TCV (Technology Crossover Ventures)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2943, 'TCV', 'Investment Team', 'Technology Crossover Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  23000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage investor in public/private tech companies (Airbnb, ByteDance, Netflix, Spotify, Zillow); founded 1995 by Jay Hoag and Richard H. Kimball. ~$22-24B AUM as of mid-2025; separately closed a record $4B fund. Also offices New York, London, Melbourne.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2943);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2943, x.name, x.role FROM (
  SELECT 'Jay Hoag' AS name, 'Founding General Partner' AS role
  UNION ALL SELECT 'Richard H. Kimball', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2943) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2943 AND name = x.name);

-- 2944 IVP (Institutional Venture Partners)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2944, 'IVP', 'Investment Team', 'Institutional Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  7000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Later-stage (Series B+) VC in fast-growing US tech companies across internet, software, mobile; founded 1980. ~$7.0B AUM (one source also cites "$8B+"; exact as-of date not confirmed).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2944);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2944, x.name, x.role FROM (
  SELECT 'Todd Chaffee' AS name, 'Managing Director' AS role
  UNION ALL SELECT 'Somesh Dash', 'General Partner'
  UNION ALL SELECT 'Jules Maltz', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2944) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2944 AND name = x.name);

-- 2945 DST Global
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2945, 'DST Global', 'Investment Team', 'DST Global', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  50000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). VC/PE firm primarily investing in late-stage internet/tech companies globally; founder Yuri Milner. ~$50B AUM (exact as-of date not confirmed). Registered Cayman Islands; no single confirmed HQ city -- offices in Menlo Park, New York, London, Beijing, Hong Kong.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2945);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2945, x.name, x.role FROM (
  SELECT 'Yuri Milner' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2945) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2945 AND name = x.name);

-- 2946 Iconiq Growth
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2946, 'Iconiq Growth', 'Investment Team', 'Iconiq Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  81000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage venture arm of Iconiq Capital, investing in late-stage tech companies (recent focus incl. AI: Writer, Pinecone); co-founder/CEO Divesh Makan, Iconiq Growth led by GP Will Griffith. Iconiq Capital overall ~$80-83.5B (2025); Iconiq Growth''s 7th flagship fund closed ~$5.75-5.8B (mid-2024).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2946);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2946, x.name, x.role FROM (
  SELECT 'Divesh Makan' AS name, 'Co-Founder and CEO' AS role
  UNION ALL SELECT 'Will Griffith', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2946) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2946 AND name = x.name);

-- 2947 Dragoneer Investment Group
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2947, 'Dragoneer Investment Group', 'Investment Team', 'Dragoneer Investment Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-oriented investor across public/private tech markets (DoorDash, Airbnb, Snowflake, Slack, Samsara, ServiceTitan); founder and Managing Partner Marc Stad. AUM not firmly confirmed -- figures range ~$25B to "over $30-35B" depending on source, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2947);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2947, x.name, x.role FROM (
  SELECT 'Marc Stad' AS name, 'Founder and Managing Partner' AS role
  UNION ALL SELECT 'Christian Jensen', 'Partner, Co-Head of Private Investments'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2947) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2947 AND name = x.name);

-- 2948 Altimeter Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2948, 'Altimeter Capital', 'Investment Team', 'Altimeter Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  12700, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Manages both public equity and venture/growth-stage private investments in tech companies; founder, Chairman and CEO Brad Gerstner. ~$12.7B AUM (as of June 2025). Originally founded in Boston, MA; sources describe it as dual-based Boston/Menlo Park.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2948);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2948, x.name, x.role FROM (
  SELECT 'Brad Gerstner' AS name, 'Founder, Chairman and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2948) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2948 AND name = x.name);

-- 2949 Bessemer Venture Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2949, 'Bessemer Venture Partners', 'Investment Team', 'Bessemer Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  19500, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage venture/growth-equity firm, seed through growth, across enterprise, consumer, fintech, healthcare. AUM ~$19-20B across most sources; one regulatory-filing-based source cites $37.6B but may conflate BVP with the related "Bessemer Investors" wealth-management entity, so the lower figure is used. HQ designation also inconsistent across sources (SF vs Redwood City, CA).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2949);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2949, x.name, x.role FROM (
  SELECT 'Jeremy Levine' AS name, 'Partner' AS role
  UNION ALL SELECT 'Talia Goldberg', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2949) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2949 AND name = x.name);

-- 2950 Battery Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2950, 'Battery Ventures', 'Investment Team', 'Battery Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  17800, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Invests across the full company lifecycle (seed through growth equity/buyouts), primarily tech; founded 1983. AUM figures vary ($17.8B as of March 2022 vs $13.0B "raised across 14 funds" framing); most recent funds (Fund XIV + Select Fund II) closed at combined $3.8B (July 2022).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2950);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2950, x.name, x.role FROM (
  SELECT 'Neeraj Agrawal' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Michael Brown', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2950) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2950 AND name = x.name);

-- 2951 Meritech Capital Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2951, 'Meritech Capital Partners', 'Investment Team', 'Meritech Capital Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Late-stage VC in IT companies -- consumer internet/media, software/services, enterprise infrastructure, medical devices; co-founded 1999 by Paul Madera and Rob Ward. Total-firm AUM not confirmed; individual data points only (one fund sized $1.1B, Fund V raised $500M in 2014) -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2951);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2951, x.name, x.role FROM (
  SELECT 'Paul Madera' AS name, 'Co-Founder and General Partner' AS role
  UNION ALL SELECT 'Rob Ward', 'Co-Founder and General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2951) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2951 AND name = x.name);

-- 2952 Spark Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2952, 'Spark Capital', 'Investment Team', 'Spark Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  12000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage VC (seed through growth) primarily in consumer internet, fintech, enterprise/software; senior team incl. Alex Finkelstein, Santo Politi, Nabeel Hyatt. AUM figures vary ("north of $12B" vs "$8.7B committed AUM" across 8 Venture + 5 Venture Growth funds) -- reported near the higher figure, not reconciled. Also offices San Francisco, New York.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2952);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2952, x.name, x.role FROM (
  SELECT 'Alex Finkelstein' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Santo Politi', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2952) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2952 AND name = x.name);

-- 2953 Thrive Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2953, 'Thrive Capital', 'Investment Team', 'Thrive Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  15600, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage venture investor in software/internet, increasing recent AI/ML focus; founder Joshua Kushner (this is the firm entity -- distinct from the earlier individual angel-investor record for Josh Kushner already in the CRM). ~$15.57B reported early 2025; separately a $10B new fund raise reported Feb 2026 -- figures vary by source/date.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2953);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2953, x.name, x.role FROM (
  SELECT 'Kareem Zaki' AS name, 'General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2953) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2953 AND name = x.name);
