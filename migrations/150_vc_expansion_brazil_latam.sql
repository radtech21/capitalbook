-- VC segment expansion, batch 21: 15 Brazil/Latin America-focused VC
-- firms, added as brand-new contacts (ids 2954-2968). Next available
-- id after this batch is 2969.

-- 2954 Kaszek Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2954, 'Kaszek Ventures', 'Investment Team', 'Kaszek Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Montevideo', '', 'Uruguay', 'Latin America',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage, sector-agnostic tech investor across Latin America; co-founded 2011 by Hernan Kazah and Nicolas Szekasy (both ex-MercadoLibre execs). ~$3B AUM per LAVCA; most recent funds $540M early-stage (Fund VI) and $435M growth vehicle (KVO-III), closed 2023. Sources vary on primary HQ -- also major offices Sao Paulo, Mexico City.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2954);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2954, x.name, x.role FROM (
  SELECT 'Hernan Kazah' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Nicolas Szekasy', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2954) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2954 AND name = x.name);

-- 2955 monashees
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2955, 'monashees', 'Investment Team', 'monashees', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  430, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage tech investor across Latin America ("future is human" thesis); co-founded 2005 by Eric Acher and Fabio Igel, Carlo Dapuzzo also a Founding Partner. Over $430M AUM; Fund VIII raised $150M (largest at the time), Fund XI targeted ~$200M.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2955);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2955, x.name, x.role FROM (
  SELECT 'Eric Acher' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Fabio Igel', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2955) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2955 AND name = x.name);

-- 2956 Canary
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2956, 'Canary', 'Investment Team', 'Canary', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  175, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (pre-seed/seed) investor in Brazilian/Latin American startups; founded 2017 by Marcos Toledo (co-founder/managing partner) with Florian Hagenbuch, Mate Pencz, Patrick de Picciotto, Julio Vasconcellos. ~$175M AUM; Fund III closed at $100M (oversubscribed), Funds I/II raised $45M/$75M.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2956);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2956, x.name, x.role FROM (
  SELECT 'Marcos Toledo' AS name, 'Co-Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2956) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2956 AND name = x.name);

-- 2957 Valor Capital Group
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2957, 'Valor Capital Group', 'Investment Team', 'Valor Capital Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  2200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cross-border seed-to-growth investor bridging US and Brazil/Latin American tech markets; co-founded 2011 by Clifford Sobel (former US Ambassador to Brazil) and Scott Sobel. Over $2.2B AUM across multiple funds; separately fundraising ~$500M across two vehicles incl. a $250M Opportunity Fund II. Significant Sao Paulo team.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2957);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2957, x.name, x.role FROM (
  SELECT 'Clifford Sobel' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Scott Sobel', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2957) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2957 AND name = x.name);

-- 2958 DGF Investimentos
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2958, 'DGF Investimentos', 'Investment Team', 'DGF Investimentos', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage B2B software/SaaS investor across the Americas, dating to 1998; Founding Partner Sidney Chameh. AUM/latest fund size not confirmed in public sources -- firm has raised at least 7-8 fund vehicles (DGF 7 is a 2023-vintage fund), left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2958);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2958, x.name, x.role FROM (
  SELECT 'Sidney Chameh' AS name, 'Founding Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2958) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2958 AND name = x.name);

-- 2959 Redpoint eventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2959, 'Redpoint eventures', 'Investment Team', 'Redpoint eventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage tech investor in Brazil/Latin America, backed by Silicon Valley VC partners; a partnership between Redpoint Ventures (US) and e.ventures, founded 2012; Managing Director/co-founder Anderson Thees. AUM figures conflict (~$130M earlier period vs over $300M more recently) -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2959);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2959, x.name, x.role FROM (
  SELECT 'Anderson Thees' AS name, 'Managing Director and Co-Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2959) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2959 AND name = x.name);

-- 2960 Igah Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2960, 'Igah Ventures', 'Investment Team', 'Igah Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Series A-focused investor in Brazilian startups across enterprise, tech, consumer sectors; formed from the 2011 merger of e.bricks ventures and Joa Investimentos, team of ~5 partners. No individual partner names could be confirmed from available research -- no contact_people rows added. AUM not confirmed, left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2960);

-- 2961 Vox Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2961, 'Vox Capital', 'Investment Team', 'Vox Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  250, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Impact investor backing scalable businesses improving life for low-income Brazilians (health, education, financial inclusion); founded 2009 as Brazil''s first certified impact-investing fund by Daniel Izzo (Founder and CEO). AUM figures conflict (~$200-250M across seven venture funds).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2961);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2961, x.name, x.role FROM (
  SELECT 'Daniel Izzo' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2961) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2961 AND name = x.name);

-- 2962 ONEVC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2962, 'ONEVC', 'Investment Team', 'ONEVC', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  38, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed to Series A investor bridging Silicon Valley and Brazil; co-founded by Pedro Sorrentino, Bruno Yoshimura, Arthur Brennand. Fund I closed at $38M (2023) -- $30M committed capital plus $8M for special opportunities. Also has a San Francisco office/bridge.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2962);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2962, x.name, x.role FROM (
  SELECT 'Pedro Sorrentino' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Bruno Yoshimura', 'Co-Founder'
  UNION ALL SELECT 'Arthur Brennand', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2962) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2962 AND name = x.name);

-- 2963 Astella Investimentos
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2963, 'Astella Investimentos', 'Investment Team', 'Astella Investimentos', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  200, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed and Series A investor, primarily SaaS, also e-commerce/marketplaces and AI/data-driven startups; co-founded 2008 by Laura Constantini and Edson Rigonatti. Over $200M AUM across five fund vehicles; fifth fund targeted ~$150M (launched 2022).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2963);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2963, x.name, x.role FROM (
  SELECT 'Laura Constantini' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Edson Rigonatti', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2963) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2963 AND name = x.name);

-- 2964 Volpe Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2964, 'Volpe Capital', 'Investment Team', 'Volpe Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed to Series C tech and tech-enabled growth investor in Latin America; founded 2020 by André Maciel, Gregory Reider, Milena Oliveira. Raised $80M first close (2021), target $100M, hard cap $150M; anchor investors incl. SoftBank, BTG, Banco Inter affiliates.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2964);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2964, x.name, x.role FROM (
  SELECT 'André Maciel' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Gregory Reider', 'Founding Partner'
  UNION ALL SELECT 'Milena Oliveira', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2964) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2964 AND name = x.name);

-- 2965 Alexia Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2965, 'Alexia Ventures', 'Investment Team', 'Alexia Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/Series A investor in data-driven and AI-enabled software businesses across Brazil/Latin America; founder/managing partner Patrick Arippol, with partners Bianca Martinelli and Wolff Klabin. A ~$400M AUM figure appears in one source but is not independently corroborated -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2965);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2965, x.name, x.role FROM (
  SELECT 'Patrick Arippol' AS name, 'Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2965) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2965 AND name = x.name);

-- 2966 Maya Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2966, 'Maya Capital', 'Investment Team', 'Maya Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-Latin American seed-stage fund (Brazil, Mexico, Colombia, Chile), sector-agnostic; co-founded 2018 by Lara Lemann and Monica Saggioro Leal (co-founders and managing partners). Fund I $41.5M; Fund II closed $100M (June 2022); Fund III reportedly targeting ~$80M.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2966);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2966, x.name, x.role FROM (
  SELECT 'Lara Lemann' AS name, 'Co-Founder and Managing Partner' AS role
  UNION ALL SELECT 'Monica Saggioro Leal', 'Co-Founder and Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2966) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2966 AND name = x.name);

-- 2967 Latitud
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2967, 'Latitud', 'Investment Team', 'Latitud', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  25, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed investor in software-first Latin American startups ($250K-$400K checks), also runs a founder community/platform; co-founded by Brian Requarth (ex-VivaReal) and Tomas Roggio (heads Latitud Ventures), Gina Gotthilf also referenced as a broader platform co-founder. Fund II targeting $25M. A separately-named "Latitud Capital" entity in Mexico City appears distinct and was not fully disambiguated -- flag for follow-up.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2967);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2967, x.name, x.role FROM (
  SELECT 'Brian Requarth' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Tomas Roggio', 'Co-Founder and General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2967) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2967 AND name = x.name);

-- 2968 KPTL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2968, 'KPTL', 'Investment Team', 'KPTL', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Sao Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed and Series A investor across agtech, biotech, govtech, edtech, enterprise tech; formed from the merger of A5 Capital Partners and Inseed Investimentos. CEO/Managing Partner Renato Ramalho, CFO/Partner Fernando Rodrigues. AUM reported ~R$1B (Brazilian reais, not converted/confirmed in USD) -- left Unknown in USD terms. Also offices across Brazil (Manaus to Porto Alegre) plus a US presence.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2968);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2968, x.name, x.role FROM (
  SELECT 'Renato Ramalho' AS name, 'CEO and Managing Partner' AS role
  UNION ALL SELECT 'Fernando Rodrigues', 'CFO and Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2968) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2968 AND name = x.name);
