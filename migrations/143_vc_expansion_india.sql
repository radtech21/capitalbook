-- VC segment expansion, batch 16: 15 India-focused VC firms, added as
-- brand-new contacts (ids 2849-2863). Next available id after this
-- batch is 2864. AUM/fund-size figures are self-reported and
-- inconsistently updated across press coverage; flagged per-firm.

-- 2849 Peak XV Partners (formerly Sequoia Capital India & SEA)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2849, 'Peak XV Partners', 'Investment Team', 'Peak XV Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  9500, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage technology investor (seed to growth) across India and Southeast Asia; split off from global Sequoia Capital in 2023/2024. Managing Director Shailendra Singh. AUM reported ~$9.2B (2023, 13 funds) to $10B+ more recently -- treat as approximate.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2849);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2849, x.name, x.role FROM (
  SELECT 'Shailendra Singh' AS name, 'Managing Director / Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2849) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2849 AND name = x.name);

-- 2850 Accel India
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2850, 'Accel India', 'Investment Team', 'Accel Partners India LLP', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  650, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage technology investing across fintech, SaaS, consumer, AI startups in India; Fund VIII was $650M (closed ~Jan 2025).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2850);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2850, x.name, x.role FROM (
  SELECT 'Shekhar Kirani' AS name, 'Partner' AS role
  UNION ALL SELECT 'Prashanth Prakash', 'Partner'
  UNION ALL SELECT 'Anand Daniel', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2850) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2850 AND name = x.name);

-- 2851 Nexus Venture Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2851, 'Nexus Venture Partners', 'Investment Team', 'Nexus Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mumbai', '', 'India', 'Asia',
  3200, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed and Series A investor in enterprise software (US-facing) and digitally-enabled consumer/tech businesses (India). ~$3.2B across 8 funds; co-founder Naren Gupta died Dec 2021. Also offices Bengaluru, Menlo Park (US).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2851);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2851, x.name, x.role FROM (
  SELECT 'Sandeep Singhal' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Suvir Sujan', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2851) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2851 AND name = x.name);

-- 2852 Blume Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2852, 'Blume Ventures', 'Investment Team', 'Blume Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mumbai', '', 'India', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (seed) investor in Indian technology startups; co-founded 2010/2011 by Karthik Reddy and Sanjay Nath. AUM figures conflict ("$900M+" per firm site vs ~$600M per a 2022 report after Fund IV''s $250M close) -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2852);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2852, x.name, x.role FROM (
  SELECT 'Karthik Reddy' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Sanjay Nath', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2852) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2852 AND name = x.name);

-- 2853 Kalaari Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2853, 'Kalaari Capital', 'Investment Team', 'Kalaari Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  650, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in consumer internet, SaaS, fintech; founded 2006 (originally Indo-US Venture Partners) by Vani Kola and Vinod Dham. ~$650M current AUM estimate, started as a $150M fund in 2012.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2853);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2853, x.name, x.role FROM (
  SELECT 'Vani Kola' AS name, 'Founder and Managing Director' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2853) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2853 AND name = x.name);

-- 2854 Z47 (formerly Matrix Partners India)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2854, 'Z47', 'Investment Team', 'Z47', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  3500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage investor in consumer, SaaS, fintech; rebranded from Matrix Partners India to Z47 in 2024/2025. $3.5B AUM as of rebrand; Fund IV was $525M. Also offices Delhi, Mumbai.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2854);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2854, x.name, x.role FROM (
  SELECT 'Avnish Bajaj' AS name, 'Founder' AS role
  UNION ALL SELECT 'Rishi Navani', 'Founder'
  UNION ALL SELECT 'Vikram Vaidyanathan', 'Managing Director'
  UNION ALL SELECT 'Rajat Agarwal', 'Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2854) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2854 AND name = x.name);

-- 2855 Lightspeed India Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2855, 'Lightspeed India Partners', 'Investment Team', 'Lightspeed India Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New Delhi', '', 'India', 'Asia',
  275, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor across consumer, SaaS, fintech; part of global Lightspeed Venture Partners platform. Fund III was $275M (2020) -- global parent Lightspeed had ~$35B AUM (2023) but that figure is not India-specific. Partners also based in Bengaluru.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2855);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2855, x.name, x.role FROM (
  SELECT 'Bejul Somaia' AS name, 'Partner' AS role
  UNION ALL SELECT 'Dev Khare', 'Partner'
  UNION ALL SELECT 'Hemant Mohapatra', 'Partner'
  UNION ALL SELECT 'Harsha Kumar', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2855) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2855 AND name = x.name);

-- 2856 Elevation Capital (formerly SAIF Partners India)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2856, 'Elevation Capital', 'Investment Team', 'Elevation Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Gurugram', '', 'India', 'Asia',
  2600, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth stage investor (formerly SAIF Partners India); portfolio includes Paytm, Swiggy, Unacademy. Over $2.6B AUM, ~190 investments made.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2856);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2856, x.name, x.role FROM (
  SELECT 'Ravi Adusumalli' AS name, 'Founder and Co-Managing Partner' AS role
  UNION ALL SELECT 'Mukul Arora', 'Co-Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2856) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2856 AND name = x.name);

-- 2857 Chiratae Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2857, 'Chiratae Ventures', 'Investment Team', 'Chiratae Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  1300, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in consumer, SaaS, fintech, deep tech (portfolio incl. FirstCry, Lenskart, PolicyBazaar); founded 2006 by Sudhir Sethi and T.C.M. Sundaram. ~$1.28-1.3B across seven funds (2024-2025 figures).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2857);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2857, x.name, x.role FROM (
  SELECT 'Sudhir Sethi' AS name, 'Founder and Chairman' AS role
  UNION ALL SELECT 'T.C.M. Sundaram', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2857) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2857 AND name = x.name);

-- 2858 Stellaris Venture Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2858, 'Stellaris Venture Partners', 'Investment Team', 'Stellaris Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  600, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Sector-agnostic early-stage (seed/Series A) investor in consumer, AI, deep tech; co-founded 2016 by three ex-Helion Ventures partners. Over $600M total AUM after a $300M Fund III (Dec 2024).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2858);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2858, x.name, x.role FROM (
  SELECT 'Ritesh Banglani' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Alok Goyal', 'Co-Founder'
  UNION ALL SELECT 'Rahul Chowdhri', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2858) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2858 AND name = x.name);

-- 2859 3one4 Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2859, '3one4 Capital', 'Investment Team', '3one4 Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in consumer tech, SaaS, fintech, deep tech; co-founded 2016 by brothers Pranav Pai and Siddarth Pai. AUM figures conflict (~$750M per one 2023 source vs ~$530M+ per a 2026 reference) -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2859);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2859, x.name, x.role FROM (
  SELECT 'Pranav Pai' AS name, 'Co-Founder and CIO' AS role
  UNION ALL SELECT 'Siddarth Pai', 'Co-Founder and CFO'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2859) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2859 AND name = x.name);

-- 2860 India Quotient
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2860, 'India Quotient', 'Investment Team', 'India Quotient', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mumbai', '', 'India', 'Asia',
  318, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed and seed-stage investor ("invest before it''s obvious"); co-founded 2013 by Anand Lunia and Madhukar Sinha. Total fund size cited at $318M cumulatively; most recent Fund V closed at $129M (~INR 1,132 crore) in October 2025.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2860);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2860, x.name, x.role FROM (
  SELECT 'Anand Lunia' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Madhukar Sinha', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2860) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2860 AND name = x.name);

-- 2861 Bertelsmann India Investments
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2861, 'Bertelsmann India Investments', 'Investment Team', 'Bertelsmann India Investments', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Noida', '', 'India', 'Asia',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Corporate VC arm of Germany''s Bertelsmann, early-growth stage (Series A-C), sector-agnostic; portfolio incl. Shiprocket, Licious, Eruditus. Approximately $1B AUM. Only one senior partner (Pankaj Makkar) could be confirmed -- do not assume a second named partner.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2861);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2861, x.name, x.role FROM (
  SELECT 'Pankaj Makkar' AS name, 'Managing Director' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2861) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2861 AND name = x.name);

-- 2862 Fireside Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2862, 'Fireside Ventures', 'Investment Team', 'Fireside Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Bengaluru', '', 'India', 'Asia',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Exclusively consumer-brand (D2C/FMCG) investor, backed boAt, Slurrp Farm, Vahdam Teas; founded by Kanwaljit Singh. AUM figures conflict (~$400M across three funds per most recent sources vs. an older $650M figure) -- left Unknown.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2862);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2862, x.name, x.role FROM (
  SELECT 'Kanwaljit Singh' AS name, 'Founder and Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2862) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2862 AND name = x.name);

-- 2863 Orios Venture Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2863, 'Orios Venture Partners', 'Investment Team', 'Orios Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mumbai', '', 'India', 'Asia',
  273, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage investor in consumer internet, fintech, SaaS. ~$273M across four funds (current fund targeting $120M). Only Rehan Yar Khan could be confirmed as founder -- a possible "Anup Jain" co-founder association surfaced in research but could not be verified, so not included.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2863);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2863, x.name, x.role FROM (
  SELECT 'Rehan Yar Khan' AS name, 'Managing Partner and Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2863) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2863 AND name = x.name);
