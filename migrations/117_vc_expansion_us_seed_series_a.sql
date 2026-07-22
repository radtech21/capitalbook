-- VC segment expansion, batch 1 of many: 15 US seed/Series A-focused
-- venture firms, added as brand-new contacts (ids 2460-2474).
-- IMPORTANT: next available id after this batch is 2475. Verified by
-- grepping all migrations for INSERT INTO contacts -- the true max id
-- ever used is 2459 (from Financial Advisor successor inserts in
-- migrations 026/030/033/039), NOT seeds/contacts-seed.json's max of
-- 2452, which does not reflect ids consumed by later migrations.

-- 2460 Y Combinator, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2460, 'Y Combinator', 'Investment Team', 'Y Combinator', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Premier seed-stage accelerator; standard $500K check per company. No current AUM disclosed -- YC Continuity growth fund wound down 2023, do not use as a current figure.',
  '560 20th Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2460);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2460, x.name, x.role FROM (
  SELECT 'Garry Tan' AS name, 'President & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2460) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2460 AND name = x.name);

-- 2461 Techstars, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2461, 'Techstars', 'Investment Team', 'Techstars', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  850, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global seed-stage accelerator network, relocated HQ Boulder->NYC Feb 2024. CEO title conflicting (Maëlle Gavet vs. co-founder David Cohen) -- verify before outreach. AUM >$850M (undated cumulative).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2461);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2461, x.name, x.role FROM (
  SELECT 'David Cohen' AS name, 'Co-Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2461) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2461 AND name = x.name);

-- 2462 500 Global, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2462, '500 Global', 'Investment Team', '500 Global', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  2400, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly 500 Startups. Global early-stage fund + accelerator, 2,800+ portfolio companies across 77 countries. AUM $2.4-2.7B (range across sources).',
  '814 Mission St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2462);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2462, x.name, x.role FROM (
  SELECT 'Christine Tsai' AS name, 'Co-Founder & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2462) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2462 AND name = x.name);

-- 2463 Initialized Capital, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2463, 'Initialized Capital', 'Investment Team', 'Initialized Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  3200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Y Combinator alumni-founded seed/Series A firm. Current day-to-day leadership unconfirmed -- Garry Tan''s role reduced (now leads YC), Alexis Ohanian departed for Seven Seven Six. $3.2B+ raised across funds historically.',
  '464 Tehama Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2463);

-- 2464 True Ventures, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2464, 'True Ventures', 'Investment Team', 'True Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  4000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage generalist tech VC. 2024: closed $840M combined across True Core Fund VIII ($375M) + True Select Fund V ($465M). ~$4B total AUM.',
  '575 High St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2464);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2464, x.name, x.role FROM (
  SELECT 'Jon Callaghan' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2464) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2464 AND name = x.name);

-- 2465 Foundry Group, Boulder, CO
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2465, 'Foundry Group', 'Investment Team', 'Foundry Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boulder', 'Colorado', 'United States', 'United States',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Flat, no-associates partnership model. "Foundry 2022" fund ($500M) reported as possibly the final flagship fund -- verify current fundraising status before outreach. ~$3B total AUM.',
  '645 Walnut Street, Suite 210'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2465);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2465, x.name, x.role FROM (
  SELECT 'Brad Feld' AS name, 'Co-Founder & Partner' AS role
  UNION ALL SELECT 'Seth Levine', 'Co-Founder & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2465) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2465 AND name = x.name);

-- 2466 Emergence Capital, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2466, 'Emergence Capital', 'Investment Team', 'Emergence Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). B2B/enterprise SaaS specialist. Fund VII closed $1B (Mar 2025), up from Fund VI''s $575M (2021).',
  '5 Pier, Suite 102'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2466);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2466, x.name, x.role FROM (
  SELECT 'Jason Green' AS name, 'Founder & General Partner Emeritus' AS role
  UNION ALL SELECT 'Santi Subotovsky', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2466) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2466 AND name = x.name);

-- 2467 Mayfield Fund, Menlo Park, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2467, 'Mayfield Fund', 'Investment Team', 'Mayfield Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed/Series A) enterprise + consumer VC. ~$3B+ total AUM (undated cumulative figure, no specific recent fund-close date found).',
  '2484 Sand Hill Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2467);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2467, x.name, x.role FROM (
  SELECT 'Navin Chaddha' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2467) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2467 AND name = x.name);

-- 2468 Canaan Partners, Menlo Park, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2468, 'Canaan Partners', 'Investment Team', 'Canaan Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  850, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage tech/healthcare VC. Fund XIII closed Apr 2023: $650M fund + $200M add''l commitments = $850M total. Most-senior current GP not independently confirmed -- verify via canaan.com/team.',
  '2765 Sand Hill Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2468);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2468, x.name, x.role FROM (
  SELECT 'Deepak Kamra' AS name, 'General Partner (seniority vs. other GPs unconfirmed)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2468) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2468 AND name = x.name);

-- 2469 Matrix Partners, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2469, 'Matrix Partners', 'Investment Team', 'Matrix Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  800, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage VC (enterprise/consumer/frontier tech); also has a Cambridge, MA office. Fund XII closed Oct 2022 at $800M -- total firm AUM across history not found.',
  '535 Mission Street, Suite 2600'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2469);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2469, x.name, x.role FROM (
  SELECT 'Antonio Rodriguez' AS name, 'Managing Partner (AI/frontier tech)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2469) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2469 AND name = x.name);

-- 2470 Venrock, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2470, 'Venrock', 'Investment Team', 'Venrock', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  650, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage VC, healthcare + technology focus. Latest fund size/number conflicting across sources (~$650M cited Jan 2024 vs. an SEC filing showing $423.45M for Fund IX, Jan 2021) -- verify via venrock.com.',
  '3340 Hillview Avenue'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2470);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2470, x.name, x.role FROM (
  SELECT 'Bryan Roberts' AS name, 'Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2470) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2470 AND name = x.name);

-- 2471 Sutter Hill Ventures, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2471, 'Sutter Hill Ventures', 'Investment Team', 'Sutter Hill Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of the oldest active VC firms (est. 1964); enterprise infrastructure/IT focus (Snowflake, Pure Storage). Notably does not publicize a single top leader or fund size/AUM -- both flagged as data gaps requiring direct outreach.',
  '755 Page Mill Road, Building A, Suite 200'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2471);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2471, x.name, x.role FROM (
  SELECT 'Pete Schlampp' AS name, 'Managing Director' AS role
  UNION ALL SELECT 'Palmer Rampell', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2471) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2471 AND name = x.name);

-- 2472 Floodgate, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2472, 'Floodgate', 'Investment Team', 'Floodgate', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  146, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage "first check" VC. Fund VII $146M (Oct 2021); a separate "$131M current fund" figure found but not reconciled. Co-founder Ann Miura-Ko widely documented publicly but not independently reconfirmed this research pass.',
  '820 Ramona Street, Suite 200'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2472);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2472, x.name, x.role FROM (
  SELECT 'Mike Maples Jr.' AS name, 'Co-Founding Partner' AS role
  UNION ALL SELECT 'Ann Miura-Ko', 'Co-Founding Partner (title not reconfirmed this session)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2472) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2472 AND name = x.name);

-- 2473 Felicis, Menlo Park, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2473, 'Felicis', 'Investment Team', 'Felicis', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  900, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Felicis Ventures. Early-stage generalist VC, also has SF and NYC presence. Fund X = $900M, close date ambiguous (2024 vs 2025 across sources).',
  '2460 Sand Hill Road, #100'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2473);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2473, x.name, x.role FROM (
  SELECT 'Aydin Senkut' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2473) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2473 AND name = x.name);

-- 2474 Upfront Ventures, Santa Monica, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2474, 'Upfront Ventures', 'Investment Team', 'Upfront Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Santa Monica', 'California', 'United States', 'United States',
  2000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly GRP Partners; leading LA/West Coast institutional VC. Fund VII $280M (2022); ~$2B AUM figure may be stale (paired with older Fund VI reporting). Kara Nortman reportedly departed ~2023, do not list as contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2474);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2474, x.name, x.role FROM (
  SELECT 'Mark Suster' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Yves Sisteron', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2474) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2474 AND name = x.name);
