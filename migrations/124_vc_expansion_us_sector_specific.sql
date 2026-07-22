-- VC segment expansion, batch 6: 15 US sector-specialist VC firms
-- (fintech, healthcare/biotech, climate/deeptech, defense, cybersecurity),
-- added as brand-new contacts (ids 2565-2579). Next available id after
-- this batch is 2580.

-- 2565 Better Tomorrow Ventures, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2565, 'Better Tomorrow Ventures', 'Investment Team', 'Better Tomorrow Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  140, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed/seed global fintech investor, $500K-$3M checks. Fund III closed $140M (2024). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2565);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2565, x.name, x.role FROM (
  SELECT 'Jake Gibson' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Sheel Mohnot', 'Co-Founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2565) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2565 AND name = x.name);

-- 2566 Nyca Partners, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2566, 'Nyca Partners', 'Investment Team', 'Nyca Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  870, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Fintech/financial-services-infra specialist, 100+ portfolio companies. Just under $1B AUM (~$870M cited). Also has an SF office.',
  '485 Madison Avenue, Floor 17'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2566);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2566, x.name, x.role FROM (
  SELECT 'Hans Morris' AS name, 'Founder & Managing Partner' AS role
  UNION ALL SELECT 'Ravi Mohan', 'Partner & COO'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2566) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2566 AND name = x.name);

-- 2567 Fin Capital, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2567, 'Fin Capital', 'Investment Team', 'Fin Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  1300, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global B2B fintech investor across full lifecycle (pre-seed to public equity), founded 2018. >$1.3B total AUM. Also offices LA, London, Miami, NY.',
  'One Sansome Street, Suite 3950'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2567);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2567, x.name, x.role FROM (
  SELECT 'Logan Allin' AS name, 'Founding Partner & CEO' AS role
  UNION ALL SELECT 'Peter Ackerson', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2567) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2567 AND name = x.name);

-- 2568 Third Rock Ventures, Boston, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2568, 'Third Rock Ventures', 'Investment Team', 'Third Rock Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  3800, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Company-creation biotech VC (builds companies from scratch), founded by ex-Millennium Pharmaceuticals execs. Fund V closed $1.1B (2022); ~$3.8B cumulative since 2007 -- no post-2022 fund confirmed. Also has an SF office. Street address conflicting across sources.',
  '29 Newbury Street, 3rd Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2568);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2568, x.name, x.role FROM (
  SELECT 'Mark Levin' AS name, 'Co-Founder & Partner' AS role
  UNION ALL SELECT 'Robert Tepper', 'Co-Founder & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2568) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2568 AND name = x.name);

-- 2569 Flagship Pioneering, Cambridge, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2569, 'Flagship Pioneering', 'Investment Team', 'Flagship Pioneering', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cambridge', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). "Bioplatform" venture-creation firm spanning biotech/life sciences/health/sustainability (created Moderna). Current AUM not reliably confirmed -- last found figure looks stale, likely well understated; verify before use.',
  '55 Cambridge Parkway, Suite 800E'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2569);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2569, x.name, x.role FROM (
  SELECT 'Noubar Afeyan' AS name, 'Founder & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2569) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2569 AND name = x.name);

-- 2570 ARCH Venture Partners, Chicago, IL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2570, 'ARCH Venture Partners', 'Investment Team', 'ARCH Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Chicago', 'Illinois', 'United States', 'United States',
  12000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Life sciences/biotech company-creation VC, deep science/pharma-executive expertise. Fund XIII closed $3B+ (Sep 2024); total firm AUM ~$12B. Also has a Seattle office. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2570);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2570, x.name, x.role FROM (
  SELECT 'Robert Nelsen' AS name, 'Co-Founder & Managing Director' AS role
  UNION ALL SELECT 'Keith Crandell', 'Co-Founder & Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2570) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2570 AND name = x.name);

-- 2571 OrbiMed Advisors, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2571, 'OrbiMed Advisors', 'Investment Team', 'OrbiMed Advisors', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  19000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Healthcare-dedicated firm spanning PE, public equity, and royalty/credit strategies. AUM ~$18-20.6B (range across sources). Closed a $1.86B royalty/credit fund in 2025, largest of its kind.',
  '601 Lexington Avenue, 54th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2571);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2571, x.name, x.role FROM (
  SELECT 'Carl L. Gordon' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Sven H. Borho', 'Co-Founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2571) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2571 AND name = x.name);

-- 2572 Breakthrough Energy Ventures, Kirkland, WA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2572, 'Breakthrough Energy Ventures', 'Investment Team', 'Breakthrough Energy Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Kirkland', 'Washington', 'United States', 'United States',
  2000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Bill Gates-backed (2015) long-horizon (20-yr) climate/clean-tech VC across energy, agriculture, manufacturing, transportation. BEV Fund I+II ~$839M; broader platform ~$2B+. Current Managing Partner names not independently confirmed this pass -- no contact_people added.',
  '505 5th Ave S'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2572);

-- 2573 Lowercarbon Capital, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2573, 'Lowercarbon Capital', 'Investment Team', 'Lowercarbon Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  2400, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Climate tech across carbon removal, nuclear/fusion, decarbonization. ~$2.4B total AUM (2026). Dedicated fusion funds ~$250M+ (second announced Nov 2025). Also has a presence in Jackson, WY. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2573);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2573, x.name, x.role FROM (
  SELECT 'Chris Sacca' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Crystal Sacca', 'Co-Founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2573) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2573 AND name = x.name);

-- 2574 Energy Impact Partners, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2574, 'Energy Impact Partners', 'Investment Team', 'Energy Impact Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  4500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Energy-transition investor spanning venture/growth equity/PE/credit. >$4.5B total AUM; flagship fund closed $1.3B (Oct 2025). Structured around 80+ corporate/strategic partners rather than individual GPs -- no named leader confirmed, no contact_people added. Also offices SF, DC, Atlanta, Palm Beach, London, Cologne, Oslo.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2574);

-- 2575 DCVC (Data Collective), Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2575, 'DCVC', 'Investment Team', 'DCVC (Data Collective)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  4000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Deep-tech VC spanning AI, biotech/computational biology, space, climate. ~$4B AUM across 13 funds (6 flagship). Most recent fund-close date/amount not specifically confirmed.',
  '270 University Avenue'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2575);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2575, x.name, x.role FROM (
  SELECT 'Matt Ocko' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Zachary Bogue', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2575) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2575 AND name = x.name);

-- 2576 Shield Capital, San Francisco Bay Area, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2576, 'Shield Capital', 'Investment Team', 'Shield Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  300, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage dual-use investor: AI, autonomy, cybersecurity, space for national security + commercial markets. Fund I closed $186M (Oct 2023, oversubscribed vs $120M target); firm AUM $300M+. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2576);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2576, x.name, x.role FROM (
  SELECT 'Philip Bilden' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Raj Shah', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2576) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2576 AND name = x.name);

-- 2577 8090 Industries, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2577, '8090 Industries', 'Investment Team', '8090 Industries', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Heavy-industry/deep-tech investor: decarbonization, synbio, aerospace, nuclear, geothermal, industrial AI, defense (dual-use). HQ conflicting across sources (NY vs. Texas) -- verify. $100M raise reported (Mar 2026, unconfirmed/forward-dated); typical checks $100K-$5M.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2577);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2577, x.name, x.role FROM (
  SELECT 'Kerem Ozmen' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Rayyan Islam', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2577) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2577 AND name = x.name);

-- 2578 Ballistic Ventures, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2578, 'Ballistic Ventures', 'Investment Team', 'Ballistic Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  660, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cybersecurity-exclusive VC, incubates early-stage cyber startups (BallisticX arm). Fund I $300M (May 2022) + Fund II $360M (Mar 2024) = ~$660M total AUM. HQ city conflicting (SF vs. San Mateo) -- verify.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2578);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2578, x.name, x.role FROM (
  SELECT 'Kevin Mandia' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Ted Schlein', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2578) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2578 AND name = x.name);

-- 2579 ClearSky, West Palm Beach, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2579, 'ClearSky', 'Investment Team', 'ClearSky', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'West Palm Beach', 'Florida', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cybersecurity + energy-transition venture/growth equity investor (dual-sector fund structure). AUM figures conflict (~$541M vs ~$1B cumulative commitments) -- not reconciled, verify. Fund IV targeting up to $500M (2024, close date unconfirmed). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2579);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2579, x.name, x.role FROM (
  SELECT 'Alex Weiss' AS name, 'Co-Founder, CEO & Managing Partner' AS role
  UNION ALL SELECT 'James Huff', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2579) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2579 AND name = x.name);
