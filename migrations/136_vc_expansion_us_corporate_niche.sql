-- VC segment expansion, batch 13: 15 US corporate-VC/niche firms
-- (auto/tech corporate VCs, university/emerging-manager funds, sports/
-- proptech VCs), added as brand-new contacts (ids 2745-2759). Next
-- available id after this batch is 2760.

-- 2745 Toyota Ventures, Los Altos, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2745, 'Toyota Ventures', 'Investment Team', 'Toyota Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Altos', 'California', 'United States', 'United States',
  800, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Toyota investing in AI/frontier tech and climate-tech. $800M+ AUM across Frontier Fund and Climate Fund. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2745);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2745, x.name, x.role FROM (
  SELECT 'Jim Adler' AS name, 'Founding Managing Director' AS role
  UNION ALL SELECT 'Natalie Fonseca Licciardi', 'Managing Partner & COO'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2745) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2745 AND name = x.name);

-- 2746 GM Ventures, Detroit, MI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2746, 'GM Ventures', 'Investment Team', 'GM Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Detroit', 'Michigan', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). GM''s corporate VC arm (electrification, connected/autonomous vehicle tech, digital enterprise). No fixed fund size disclosed; $3-50M checks, ~19 investment professionals. Address may be outdated given GM''s 2024-26 HQ relocation to Hudson''s Detroit -- verify.',
  '300 Renaissance Ctr'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2746);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2746, x.name, x.role FROM (
  SELECT 'Anirvan Coomer' AS name, 'Managing Director' AS role
  UNION ALL SELECT 'Kent Helfrich', 'President (also GM Chief Technology Officer)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2746) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2746 AND name = x.name);

-- 2747 Cisco Investments, San Jose, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2747, 'Cisco Investments', 'Investment Team', 'Cisco Investments', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Jose', 'California', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cisco''s corporate VC arm (networking, security, cloud, collaboration, AI). ~$200M deployed annually; launched a dedicated $1B AI-focused fund in 2024.',
  '170 W Tasman Dr'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2747);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2747, x.name, x.role FROM (
  SELECT 'Derek Idemoto' AS name, 'SVP of Corporate Development and Cisco Investments' AS role
  UNION ALL SELECT 'Janey Hoe', 'Vice President'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2747) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2747 AND name = x.name);

-- 2748 Qualcomm Ventures, San Diego, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2748, 'Qualcomm Ventures', 'Investment Team', 'Qualcomm Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Diego', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Qualcomm (mobile, AI, connectivity), 140-150+ active portfolio companies. No reliable current AUM found -- an AI-search "$100B" figure surfaced but is implausible (likely conflated with Qualcomm''s market cap) and was NOT used. Only confirmed sub-fund: a $100M AI Fund (2018).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2748);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2748, x.name, x.role FROM (
  SELECT 'Quinn Li' AS name, 'SVP and Global Head of Qualcomm Ventures' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2748) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2748 AND name = x.name);

-- 2749 Workday Ventures, Pleasanton, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2749, 'Workday Ventures', 'Investment Team', 'Workday Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Pleasanton', 'California', 'United States', 'United States',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Workday''s corporate VC arm (early-to-growth enterprise software: finance, HR, agentic AI). $500M strategic investment commitment, including an additional $250M commitment (2024/2025). No separate Ventures address confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2749);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2749, x.name, x.role FROM (
  SELECT 'Barbry McGann' AS name, 'SVP and Managing Director' AS role
  UNION ALL SELECT 'Michael Magaro', 'SVP of Corporate Growth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2749) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2749 AND name = x.name);

-- 2750 Dorm Room Fund, Philadelphia, PA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2750, 'Dorm Room Fund', 'Investment Team', 'Dorm Room Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Philadelphia', 'Pennsylvania', 'United States', 'United States',
  12, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Student-run VC fund, $90K-250K SAFEs exclusively in startups founded by current university students. Spun out of First Round Capital (2012 origin). $12.5M fund raised, oversubscribed (Sept 2022), backed by Andreessen, Underscore VC, Insight Partners, Chris Dixon. Multi-chapter, no single HQ address.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2750);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2750, x.name, x.role FROM (
  SELECT 'Molly Fowler' AS name, 'General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2750) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2750 AND name = x.name);

-- 2751 Contrary Capital, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2751, 'Contrary Capital', 'Investment Team', 'Contrary Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  75, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Emerging-manager fund built on a university-founder scout network, early-stage across North America and India. Fund III closed $75M (Mar 2022); current (2025+) total AUM not confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2751);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2751, x.name, x.role FROM (
  SELECT 'Eric Tarczynski' AS name, 'Founder and Managing Partner' AS role
  UNION ALL SELECT 'Kyle Harrison', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2751) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2751 AND name = x.name);

-- 2752 Courtside Ventures, Detroit, MI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2752, 'Courtside Ventures', 'Investment Team', 'Courtside Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Detroit', 'Michigan', 'United States', 'United States',
  200, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage VC at the intersection of sports, media, gaming. Fund III $100M (2023); ~$200M+ cumulative across 3 funds. Also has an NYC presence.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2752);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2752, x.name, x.role FROM (
  SELECT 'Vasu Kulkarni' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Deepen Parikh', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2752) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2752 AND name = x.name);

-- 2753 Elysian Park Ventures, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2753, 'Elysian Park Ventures', 'Investment Team', 'Elysian Park Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Private investment arm of LA Dodgers ownership group (Guggenheim Baseball Management principals incl. Mark Walter, Magic Johnson), investing in "Sports+" -- sports tech, health, commerce, culture. Fund size not disclosed/found. Also offices SF, NY, London.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2753);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2753, x.name, x.role FROM (
  SELECT 'Tucker Kain' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Cole Van Nice', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2753) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2753 AND name = x.name);

-- 2754 Fifth Wall, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2754, 'Fifth Wall', 'Investment Team', 'Fifth Wall', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  3200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Largest venture firm focused on technology for the built environment (proptech/climate). ~$3.2B total commitments cumulative across funds; largest single proptech fund $503M (2019). Also offices NY, SF, London.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2754);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2754, x.name, x.role FROM (
  SELECT 'Brendan Wallace' AS name, 'Co-Founder and Managing Partner' AS role
  UNION ALL SELECT 'Brad Greiwe', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2754) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2754 AND name = x.name);

-- 2755 Camber Creek, Rockville, MD
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2755, 'Camber Creek', 'Investment Team', 'Camber Creek', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Rockville', 'Maryland', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Real estate technology-focused VC/PE hybrid backing proptech and cash-flowing real estate investments. ~$1B AUM across 4 closed funds plus a 5th opened Feb 2025; Fund IV closed oversubscribed at $325M. Also DC and NYC presence.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2755);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2755, x.name, x.role FROM (
  SELECT 'Casey Berman' AS name, 'Founder and Managing Partner' AS role
  UNION ALL SELECT 'Jake Fingert', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2755) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2755 AND name = x.name);

-- 2756 Chapter One, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2756, 'Chapter One', 'Investment Team', 'Chapter One', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  130, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage firm backing product-first consumer/fintech/web3 startups (early backer of Mercury, Supabase, Compound Finance). ~$130M AUM, currently investing Fund II.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2756);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2756, x.name, x.role FROM (
  SELECT 'Jeff Morris Jr.' AS name, 'Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2756) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2756 AND name = x.name);

-- 2757 Behind Genius Ventures, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2757, 'Behind Genius Ventures', 'Investment Team', 'Behind Genius Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  14, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Small emerging-manager fund backing early-stage founders. Grew from $5M Fund I to $8.9M+ Fund II, ~$14M total AUM. HQ city conflicting across sources (LA vs. San Diego vs. SF) -- verify.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2757);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2757, x.name, x.role FROM (
  SELECT 'Paige Finn Doherty' AS name, 'Founding Partner and General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2757) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2757 AND name = x.name);

-- 2758 Ludlow Ventures, Detroit, MI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2758, 'Ludlow Ventures', 'Investment Team', 'Ludlow Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Detroit', 'Michigan', 'United States', 'United States',
  60, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage, small-check ($25-150K) technology investor out of Detroit. ~$60M AUM. Current partner roster beyond founder not independently confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2758);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2758, x.name, x.role FROM (
  SELECT 'Jonathon Triest' AS name, 'Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2758) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2758 AND name = x.name);

-- 2759 Slow Ventures, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2759, 'Slow Ventures', 'Investment Team', 'Slow Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage generalist VC with a creator-economy specialty. $500M+ deployed cumulatively; currently raising $275M across two new funds incl. a $60M Creator Fund (Feb 2025). Also Boston, NY presence.',
  '501 2nd St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2759);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2759, x.name, x.role FROM (
  SELECT 'Sam Lessin' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Kevin Colleran', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2759) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2759 AND name = x.name);
