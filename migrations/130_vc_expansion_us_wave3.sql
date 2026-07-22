-- VC segment expansion, batch 11: 15 more US VC firms (consumer,
-- media/gaming, enterprise/SaaS specialists), added as brand-new
-- contacts (ids 2655-2669). Next available id after this batch is 2670.

-- 2655 Bedrock, Austin, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2655, 'Bedrock', 'Investment Team', 'Bedrock (Bedrock Capital)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  2000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage, industry-agnostic (fintech, HR tech, cloud/dev tools, defense/AI: OpenAI, Rippling, Vercel). ~$2B AUM (2025), up from a $127M debut fund. Multi-hub (Austin/NY/LA), no single confirmed HQ address.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2655);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2655, x.name, x.role FROM (
  SELECT 'Geoff Lewis' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Eric Stromberg', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2655) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2655 AND name = x.name);

-- 2656 Homebrew, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2656, 'Homebrew', 'Investment Team', 'Homebrew', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage consumer/"bottom-up economy" investor. No longer raises traditional LP funds -- moved to an evergreen, self-funded structure from prior-investment proceeds. No current disclosed fund size.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2656);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2656, x.name, x.role FROM (
  SELECT 'Hunter Walk' AS name, 'Partner (Co-Founder)' AS role
  UNION ALL SELECT 'Satya Patel', 'Partner (Co-Founder)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2656) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2656 AND name = x.name);

-- 2657 Female Founders Fund, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2657, 'Female Founders Fund', 'Investment Team', 'Female Founders Fund (F Cubed LLC)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  140, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed/seed/Series A backer of female-founded consumer, healthcare, deep tech, fintech companies ($250K-$2M checks). Solo-GP model. ~$140M AUM; Fund IV closed $29M (Dec 2025). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2657);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2657, x.name, x.role FROM (
  SELECT 'Anu Duggal' AS name, 'Founding Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2657) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2657 AND name = x.name);

-- 2658 BBG Ventures, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2658, 'BBG Ventures', 'Investment Team', 'BBG Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  130, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/pre-seed consumer-tech investor, historically female-founder-focused (healthcare, financial inclusion, energy resiliency). Fund II closed $60M (Oct 2024), ~$130M total AUM; Fund III figure ($50M) not fully reconciled. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2658);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2658, x.name, x.role FROM (
  SELECT 'Susan Lyne' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Nisha Dua', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2658) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2658 AND name = x.name);

-- 2659 Base10 Partners, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2659, 'Base10 Partners', 'Investment Team', 'Base10 Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  2600, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor automating "real economy" sectors (transportation, healthcare, retail, logistics, construction); largest Black-led VC firm. ~$2.6B total AUM after closing $850M fresh capital (Jun 2026).',
  '101 Mission Street, Suite 1115'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2659);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2659, x.name, x.role FROM (
  SELECT 'Adeyemi Ajao' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'TJ Nahigian', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2659) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2659 AND name = x.name);

-- 2660 Village Global, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2660, 'Village Global', 'Investment Team', 'Village Global (Village Global VC)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  300, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Sector-agnostic pre-seed/seed investor, backed by prominent entrepreneur LPs (past LPs incl. Gates, Bezos, Zuckerberg); runs an accelerator arm too. Fund size conflicting ($225M vs. $500M cumulative) -- not reconciled. Full GP roster beyond Chairman unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2660);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2660, x.name, x.role FROM (
  SELECT 'Reid Hoffman' AS name, 'Chairman' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2660) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2660 AND name = x.name);

-- 2661 Konvoy, Denver, CO
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2661, 'Konvoy', 'Investment Team', 'Konvoy (Konvoy Ventures)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Denver', 'Colorado', 'United States', 'United States',
  270, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Video-game-industry-exclusive VC (tech, infra, platforms). ~$270M AUM across 3 funds. HQ city conflicting across sources (Denver vs. Cambridge/Marshfield MA) -- verify.',
  '1644 Platte Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2661);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2661, x.name, x.role FROM (
  SELECT 'Josh Chapman' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Jason Chapman', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2661) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2661 AND name = x.name);

-- 2662 Griffin Gaming Partners, Santa Monica, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2662, 'Griffin Gaming Partners', 'Investment Team', 'Griffin Gaming Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Santa Monica', 'California', 'United States', 'United States',
  750, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). VC fund investing exclusively across the global gaming ecosystem. Fund II closed $750M (Mar 2022, oversubscribed) after $238M Fund I (2020). A $1.5B total-AUM figure (implying an unconfirmed Fund III) was not independently verified.',
  '1501 Colorado Avenue, Suite B'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2662);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2662, x.name, x.role FROM (
  SELECT 'Peter Levin' AS name, 'Managing Director & Co-Founder' AS role
  UNION ALL SELECT 'Nick Tuosto', 'Managing Director & Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2662) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2662 AND name = x.name);

-- 2663 Makers Fund, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2663, 'Makers Fund', 'Investment Team', 'Makers Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Interactive entertainment/gaming-exclusive VC, team from Riot Games/Activision Blizzard; $500K-$40M checks. >$1B AUM across 3 funds (latest: $500M Fund III, Mar 2022). Multi-office (London, Tokyo, Singapore, LA, NY, Reykjavik); primary/legal HQ uncertain.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2663);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2663, x.name, x.role FROM (
  SELECT 'Jay Chi' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Michael K. Cheung', 'Founding General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2663) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2663 AND name = x.name);

-- 2664 Work-Bench, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2664, 'Work-Bench', 'Investment Team', 'Work-Bench', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  160, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). NYC-based seed investor exclusively in enterprise/SaaS/infrastructure software, $2-4M checks. Fund IV closed $160M (May 2025), up from $100M Fund III.',
  '915 Broadway, Suite 1200'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2664);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2664, x.name, x.role FROM (
  SELECT 'Jonathan Lehr' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Jessica Lin', 'Co-Founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2664) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2664 AND name = x.name);

-- 2665 Wing Venture Capital, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2665, 'Wing Venture Capital', 'Investment Team', 'Wing Venture Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  2500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed/Series A) B2B/enterprise software, PLG-model bias, AI-first. ~$2.5B cumulative AUM; most recent fund(s) ~$600M (2023). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2665);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2665, x.name, x.role FROM (
  SELECT 'Peter Wagner' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Gaurav Garg', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2665) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2665 AND name = x.name);

-- 2666 Costanoa Ventures, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2666, 'Costanoa Ventures', 'Investment Team', 'Costanoa Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  2800, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/Series A B2B investor (applied AI, cybersecurity, fintech, data/dev infra, national security), $1-10M checks. ~$2.8B AUM; Fund V closed $275M + $119M Opportunity Fund III (Sept 2024).',
  '160 Forest Ave'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2666);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2666, x.name, x.role FROM (
  SELECT 'Greg Sands' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2666) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2666 AND name = x.name);

-- 2667 Amplify Partners, Menlo Park, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2667, 'Amplify Partners', 'Investment Team', 'Amplify Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Deeply technical infra/data/AI/dev-tools/security investor for enterprise (Datadog, Fastly, dbt Labs). >$1B total AUM; $900M closed Jun 2025 across 3 vehicles (Fund VI $400M core + Select $300M + Amplify Bio I $200M). Current partner names not confirmed -- no contact_people added.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2667);

-- 2668 boldstart ventures, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2668, 'boldstart ventures', 'Investment Team', 'boldstart ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  1100, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Inception/pre-seed enterprise software (AI-native, DevTools, security -- Snyk, BigID, Superhuman), $250K-15M checks. ~$1.1B total AUM; Fund VII closed $250M (Jul 2025). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2668);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2668, x.name, x.role FROM (
  SELECT 'Ed Sim' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2668) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2668 AND name = x.name);

-- 2669 NextView Ventures, Boston, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2669, 'NextView Ventures', 'Investment Team', 'NextView Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  200, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed) generalist -- consumer, transport, healthcare, tech-enabled -- "society-first" investing lens. Fund V: $135M seed + $65M opportunity = $200M total (Oct 2022). Also operates from NY and SF; address given is the NYC office.',
  '109 West 27th Street, Suite 3S'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2669);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2669, x.name, x.role FROM (
  SELECT 'David Beisel' AS name, 'Co-Founder & Partner' AS role
  UNION ALL SELECT 'Rob Go', 'Co-Founder & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2669) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2669 AND name = x.name);
