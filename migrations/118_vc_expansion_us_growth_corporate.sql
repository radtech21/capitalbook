-- VC segment expansion, batch 2: 15 US growth-equity / late-stage /
-- corporate-VC firms, added as brand-new contacts (ids 2475-2489).
-- Next available id after this batch is 2490.

-- 2475 TCV (Technology Crossover Ventures), Menlo Park, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2475, 'TCV', 'Investment Team', 'TCV', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  22000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage venture/growth equity in software, internet, fintech. TCV XII $3.0B (2024 vintage); firm-wide AUM ~$22B (Jun 30 2025). Founders'' current day-to-day titles for 2026 not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2475);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2475, x.name, x.role FROM (
  SELECT 'Jay Hoag' AS name, 'Founder & General Partner' AS role
  UNION ALL SELECT 'Richard Kimball', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2475) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2475 AND name = x.name);

-- 2476 Summit Partners, Boston, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2476, 'Summit Partners', 'Investment Team', 'Summit Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  46000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth equity, $75-500M majority/minority checks in profitable category-leading tech/healthcare/life-sciences. Growth Equity Fund XII closed Oct 2024 at $9.5B. Firm-wide AUM >$46B.',
  '222 Berkeley Street, 18th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2476);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2476, x.name, x.role FROM (
  SELECT 'Peter Chung' AS name, 'CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2476) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2476 AND name = x.name);

-- 2477 Warburg Pincus, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2477, 'Warburg Pincus', 'Investment Team', 'Warburg Pincus', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  75400, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global PE/growth across stages and sectors. Net AUM ~$75.4B (Dec 31 2025, excl. $26.4B uncalled). Flagship Fund 15 $17B (Oct 2023); $3.0B Financial Services Fund closed Jan 7 2026.',
  '450 Lexington Avenue'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2477);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2477, x.name, x.role FROM (
  SELECT 'Jeffrey Perlman' AS name, 'CEO' AS role
  UNION ALL SELECT 'Charles "Chip" Kaye', 'Co-Chairman'
  UNION ALL SELECT 'Timothy Geithner', 'Co-Chairman'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2477) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2477 AND name = x.name);

-- 2478 Silver Lake, Menlo Park, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2478, 'Silver Lake', 'Investment Team', 'Silver Lake', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  110000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Large-scale technology-focused PE/growth. Dual HQ Menlo Park/New York -- exact street address not confirmed for either. Fund VII closed May 2024 at $20.5B. Firm-wide AUM ~$110B (2025).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2478);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2478, x.name, x.role FROM (
  SELECT 'Egon Durban' AS name, 'Co-CEO' AS role
  UNION ALL SELECT 'Greg Mondre', 'Co-CEO'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2478) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2478 AND name = x.name);

-- 2479 Vista Equity Partners, Austin, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2479, 'Vista Equity Partners', 'Investment Team', 'Vista Equity Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  103000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). PE/growth-equity exclusively in enterprise software. Flagship Fund VIII closed 2024 at >$20B. Firm-wide AUM >$103B (Mar 31 2026). Street address not confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2479);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2479, x.name, x.role FROM (
  SELECT 'Robert F. Smith' AS name, 'Founder, Chairman & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2479) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2479 AND name = x.name);

-- 2480 Meritech Capital Partners, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2480, 'Meritech Capital Partners', 'Investment Team', 'Meritech Capital Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  2200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Late-stage venture/growth in enterprise software, infra, fintech, internet/media. Fund VIII closed Jun 2022 at $1.1B; total AUM >$2.2B. Street address conflicting across sources -- verify.',
  '245 Lytton Ave, Ste 125'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2480);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2480, x.name, x.role FROM (
  SELECT 'Rob Ward' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Alex Kurland', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2480) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2480 AND name = x.name);

-- 2481 GV (Google Ventures), Mountain View, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2481, 'GV', 'Investment Team', 'GV (Google Ventures)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mountain View', 'California', 'United States', 'United States',
  13000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Alphabet (sole LP), seed through growth, broad tech incl. AI (Anthropic, Harvey). ~$13B AUM. Address is Alphabet''s main campus, GV''s own office not separately confirmed.',
  '1600 Amphitheatre Parkway'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2481);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2481, x.name, x.role FROM (
  SELECT 'David Krane' AS name, 'CEO & Managing Partner' AS role
  UNION ALL SELECT 'Graham Spencer', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2481) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2481 AND name = x.name);

-- 2482 Intel Capital, Santa Clara, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2482, 'Intel Capital', 'Investment Team', 'Intel Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Santa Clara', 'California', 'United States', 'United States',
  5000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate/strategic VC in semiconductor/AI/data center/enterprise tech. IN TRANSITION: spinning off from Intel into a standalone fund (announced Jan 2025, new brand name not yet confirmed) -- verify current entity name/status before outreach.',
  '2200 Mission College Blvd'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2482);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2482, x.name, x.role FROM (
  SELECT 'Anthony Lin' AS name, 'Corporate VP, Managing Partner & Head of Intel Capital' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2482) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2482 AND name = x.name);

-- 2483 Salesforce Ventures, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2483, 'Salesforce Ventures', 'Investment Team', 'Salesforce Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Salesforce, enterprise cloud/SaaS/AI. $1B AI-focused fund, >$850M deployed as of Oct 2025 (on track fully invested end-2025). This figure is the AI fund only -- total historical AUM not disclosed.',
  '415 Mission St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2483);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2483, x.name, x.role FROM (
  SELECT 'John Somorjai' AS name, 'President' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2483) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2483 AND name = x.name);

-- 2484 M12 (Microsoft's Venture Fund), San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2484, 'M12', 'Investment Team', 'M12 (Microsoft''s Venture Fund)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Microsoft, early-stage enterprise tech, founded 2016. Fund size not publicly disclosed. HQ location conflicting across sources (SF vs. parent Microsoft''s Redmond, WA) -- verify before outreach.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2484);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2484, x.name, x.role FROM (
  SELECT 'Peter Lenke' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2484) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2484 AND name = x.name);

-- 2485 Comcast Ventures, Philadelphia, PA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2485, 'Comcast Ventures', 'Investment Team', 'Comcast Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Philadelphia', 'Pennsylvania', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Comcast/NBCUniversal, early-to-growth tech/media. No confirmed recent (2023-2025) fund size/AUM found. Address is parent Comcast Corporate HQ, not confirmed as Ventures'' own office.',
  'Comcast Center, 1701 JFK Blvd'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2485);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2485, x.name, x.role FROM (
  SELECT 'Allison Goldberg' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2485) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2485 AND name = x.name);

-- 2486 Great Hill Partners, Boston, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2486, 'Great Hill Partners', 'Investment Team', 'Great Hill Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  7000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth equity/buyout, $100-500M checks in software/digital commerce/fintech/healthcare/digital infra. Equity Partners IX closed 2025 at $7.0B. >$19B raised cumulatively since 1998.',
  '200 Clarendon Street, 29th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2486);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2486, x.name, x.role FROM (
  SELECT 'Christopher Gaffney' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'John Hayes', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2486) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2486 AND name = x.name);

-- 2487 Spectrum Equity, Boston, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2487, 'Spectrum Equity', 'Investment Team', 'Spectrum Equity', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  1500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth equity in internet/software/data services. Also has SF office. Fund IX closed at $1.5B hard cap. An unconfirmed "$2B Fund X" reference found but not independently verified -- flag before use.',
  'One International Place, 35th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2487);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2487, x.name, x.role FROM (
  SELECT 'Vic Parker' AS name, 'Managing Director (seniority vs. other MDs unconfirmed)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2487) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2487 AND name = x.name);

-- 2488 Providence Equity Partners, Providence, RI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2488, 'Providence Equity Partners', 'Investment Team', 'Providence Equity Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Providence', 'Rhode Island', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). PE/growth in media, communications, education, software. AUM figures conflict wildly across sources ($32B-$50B+) -- not reconciled, do not cite a specific figure without direct verification.',
  '50 Kennedy Plaza'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2488);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2488, x.name, x.role FROM (
  SELECT 'Jonathan M. Nelson' AS name, 'Founder & Executive Chairman' AS role
  UNION ALL SELECT 'David Phillips', 'Senior Managing Director & Co-Head of North America'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2488) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2488 AND name = x.name);

-- 2489 TPG Growth / TPG Rise, Fort Worth, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2489, 'TPG Growth / TPG Rise', 'Investment Team', 'TPG Growth / TPG Rise (platforms of TPG Inc.)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Fort Worth', 'Texas', 'United States', 'United States',
  6200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth equity/impact platform within TPG Inc. (dual HQ Fort Worth/SF), decarbonization focus. TPG Rise Climate II >$6.2B commitments (mid-2025), targeting $8B close/$10B hard cap. No confirmed platform-specific leader name -- data gap, not guessed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2489);
