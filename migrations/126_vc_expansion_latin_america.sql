-- VC segment expansion, batch 8: 15 Latin America-focused VC firms,
-- added as brand-new contacts (ids 2595-2609). Valor Capital Group
-- (US-HQ'd, Brazil cross-border) and Mundi Ventures (Spain-HQ'd, has a
-- dedicated LatAm fund) are included per the batch's "pan-LatAm fund"
-- allowance. Next available id after this batch is 2610.

-- 2595 Kaszek Ventures, Buenos Aires, Argentina
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2595, 'Kaszek Ventures', 'Investment Team', 'Kaszek Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage/growth VC across LatAm, backed Nubank, Bitso, QuintoAndar. ~$3B AUM across 9 funds; Opportunity III closed $435M (2023). Also offices São Paulo, Montevideo, Mexico City, Bogotá. Street address unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2595);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2595, x.name, x.role FROM (
  SELECT 'Hernán Kazah' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Nicolás Szekasy', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2595) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2595 AND name = x.name);

-- 2596 Monashees, São Paulo, Brazil
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2596, 'Monashees', 'Investment Team', 'Monashees', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Generalist early-stage VC across South America/Mexico. AUM figures conflict/stale ($430M as of 2018 vs. an eighth fund of $150M, exact date unconfirmed, Temasek LP) -- not reconciled, verify before use. Street address unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2596);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2596, x.name, x.role FROM (
  SELECT 'Eric Acher' AS name, 'Founder & Managing General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2596) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2596 AND name = x.name);

-- 2597 Canary, São Paulo, Brazil
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2597, 'Canary', 'Investment Team', 'Canary', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'São Paulo', '', 'Brazil', 'Latin America',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage generalist VC in Brazil/LatAm. Third fund closed oversubscribed at $100M (Nov 2021); prior funds $45M and $75M. Street address conflicting across sources (Faria Lima vs. Cunha Gago) -- verify.',
  'Av. Brigadeiro Faria Lima 3355, 20th floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2597);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2597, x.name, x.role FROM (
  SELECT 'Marcos Toledo' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Izabel Gallera', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2597) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2597 AND name = x.name);

-- 2598 Valor Capital Group, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2598, 'Valor Capital Group', 'Investment Team', 'Valor Capital Group', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  2200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). US-Brazil cross-border tech investor. ~$2.2B AUM across Growth Equity + VC strategies (undated). Also offices Rio de Janeiro, São Paulo, Silicon Valley. A claim that ex-PayPal CEO Dan Schulman is a "newest Managing Partner" is unconfirmed -- not added as a contact.',
  '10 E 53rd St, Fl 25'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2598);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2598, x.name, x.role FROM (
  SELECT 'Clifford Sobel' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Scott Sobel', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2598) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2598 AND name = x.name);

-- 2599 ALLVP (Hi Ventures), Mexico City, Mexico
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2599, 'ALLVP', 'Investment Team', 'ALLVP (rebranded "Hi Ventures," Jan 2024)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mexico City', '', 'Mexico', 'Latin America',
  200, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Series A-focused VC across Mexico/Colombia/Chile/Argentina (fintech, healthcare, smart cities). IMPORTANT: rebranded to "Hi Ventures" Jan 2024 -- confirm which legal/brand name to use. >$200M across 3 funds; Fund IV size undisclosed. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2599);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2599, x.name, x.role FROM (
  SELECT 'Federico Antoni' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Fernando Lelo de Larrea', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2599) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2599 AND name = x.name);

-- 2600 Kayyak Ventures, Santiago, Chile
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2600, 'Kayyak Ventures', 'Investment Team', 'Kayyak Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Santiago', '', 'Chile', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/Series A/B investor, $1.5-5M checks, mission-driven founders across LatAm, founded 2020. Fund size conflicting ($100M vs. $45M across sources) -- not reconciled, verify. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2600);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2600, x.name, x.role FROM (
  SELECT 'Cristóbal Silva' AS name, 'General Partner / Co-Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2600) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2600 AND name = x.name);

-- 2601 Mountain Nazca, Mexico City, Mexico
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2601, 'Mountain Nazca', 'Investment Team', 'Mountain Nazca', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mexico City', '', 'Mexico', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage VC/company-builder for LatAm entrepreneurs (fintech, logistics, mobility, edtech, health, e-commerce). Fund II received a $10M IFC investment (2020); total fund size not confirmed. Hubs in Mexico, Chile, Colombia.',
  '195 Sinaloa, Piso 3'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2601);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2601, x.name, x.role FROM (
  SELECT 'Héctor Sepúlveda' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Jaime Zunzunegui', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2601) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2601 AND name = x.name);

-- 2602 Igah Ventures, São Paulo, Brazil
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2602, 'Igah Ventures', 'Investment Team', 'Igah Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage tech/healthcare investor in Brazil. IMPORTANT: acquired by Pátria Investimentos Dec 2022, now operates as "High Growth | Patria" -- may no longer function as an independent brand, confirm correct CRM entity before outreach. No leader names or fund size independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2602);

-- 2603 DGF Investimentos, São Paulo, Brazil
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2603, 'DGF Investimentos', 'Investment Team', 'DGF Investimentos', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'São Paulo', '', 'Brazil', 'Latin America',
  45, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). B2B software-focused VC in Brazil/LatAm, operating since 1998. Fund VII targeted $40-50M (approximate).',
  'Av. Paulista 1337, 20th floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2603);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2603, x.name, x.role FROM (
  SELECT 'Sidney Chameh' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Frederico Greve', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2603) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2603 AND name = x.name);

-- 2604 Mundi Ventures, Madrid, Spain
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2604, 'Mundi Ventures', 'Investment Team (LatAm Fund)', 'Mundi Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Madrid', '', 'Spain', 'Europe',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Spain-HQ''d insurtech/fintech specialist; included for its dedicated LatAm Fund I ($100M first close, IDB Invest + COFIDES-anchored), $5M checks into 12-15 LatAm startups. Firm-wide AUM ~€1.5B (all strategies, undated). Also Barcelona, Paris offices.',
  'Paseo de Eduardo Dato 18'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2604);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2604, x.name, x.role FROM (
  SELECT 'Moisés Sánchez' AS name, 'General Partner, LatAm Fund' AS role
  UNION ALL SELECT 'Rafaela Andrade', 'Partner, LatAm Fund'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2604) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2604 AND name = x.name);

-- 2605 NXTP Ventures, Buenos Aires, Argentina
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2605, 'NXTP Ventures', 'Investment Team', 'NXTP Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  98, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage B2B/SaaS VC across Spanish-speaking LatAm, founded 2011. Fund III closed $98M (Nov 2023), largest to date. Also offices Miami, Mexico City, São Paulo. Street address conflicting across sources -- verify.',
  'Olga Cossettini 1551, 2nd floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2605);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2605, x.name, x.role FROM (
  SELECT 'Ariel Arrieta' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Marta Cruz', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2605) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2605 AND name = x.name);

-- 2606 Magma Partners, Santiago, Chile
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2606, 'Magma Partners', 'Investment Team', 'Magma Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Santiago', '', 'Chile', 'Latin America',
  50, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed to Series A generalist VC across LatAm (fintech, insurtech, marketplaces), founded 2014. $50M fund closed ~2020 (largest to date then). Also offices California, Colombia, Mexico. Street address low-confidence (third-party source).',
  'Nueva Providencia 2353, Piso 17'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2606);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2606, x.name, x.role FROM (
  SELECT 'Nathan Lustig' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Francisco Sáenz', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2606) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2606 AND name = x.name);

-- 2607 Cometa, Mexico City, Mexico
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2607, 'Cometa', 'Investment Team', 'Cometa', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mexico City', '', 'Mexico', 'Latin America',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage fintech/e-commerce/SaaS investor across LatAm, Spain, US Hispanic market (Bitso, Kueski, Conekta). Cometa III targeted $100M (2021 vintage); final close amount/date not confirmed. 2023 GP restructuring not fully detailed -- verify current partner roster.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2607);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2607, x.name, x.role FROM (
  SELECT 'Rafael de Haro' AS name, 'Co-Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2607) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2607 AND name = x.name);

-- 2608 Newtopia VC, Buenos Aires, Argentina
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2608, 'Newtopia VC', 'Investment Team', 'Newtopia VC', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Buenos Aires', '', 'Argentina', 'Latin America',
  50, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed/seed investor in fintech, healthtech, edtech, web3 across LatAm (Mexico/Brazil emphasis), founded 2020. $50M fund; 85 startups invested to date. 5 co-founders total, individual current titles beyond "co-founder" not confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2608);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2608, x.name, x.role FROM (
  SELECT 'Mariano Mayer' AS name, 'Co-Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2608) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2608 AND name = x.name);

-- 2609 Latitud, São Paulo, Brazil
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2609, 'Latitud', 'Investment Team', 'Latitud (Latitud Ventures)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'São Paulo', '', 'Brazil', 'Latin America',
  25, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed VC for early-stage LatAm founders; LPs include Nubank/MercadoLibre founders and GPs from a16z, QED, NFX. Fund II first close $12M (targeting $25M, date uncertain); Fund I rolling fund invested $13M across 100+ startups.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2609);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2609, x.name, x.role FROM (
  SELECT 'Brian Requarth' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Gina Gotthilf', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2609) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2609 AND name = x.name);
