-- VC segment expansion, batch 9: 15 Africa-focused VC firms, added as
-- brand-new contacts (ids 2610-2624). Several are legally domiciled
-- outside Africa (TLcom/Novastar in UK, Kepple in Japan, I&P in France)
-- while operating Africa-focused funds -- city/country/sub_region
-- reflect legal domicile, with the African focus noted in data_flags.
-- Next available id after this batch is 2625.

-- 2610 TLcom Capital, Nairobi, Kenya
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2610, 'TLcom Capital', 'Investment Team', 'TLcom Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Nairobi', '', 'Kenya', 'Africa',
  154, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-African early/growth-stage VC (Kenya/Nigeria-anchored); legally registered in London, UK. TIDE Africa Fund II closed $154M, reportedly Africa''s largest early-stage VC fund at the time. Partner Ido Sum departed Sep 2025 -- verify current roster.',
  '167–169 Great Portland Street, 5th Floor, London'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2610);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2610, x.name, x.role FROM (
  SELECT 'Maurizio Caio' AS name, 'Founder & Managing Partner' AS role
  UNION ALL SELECT 'Omobola Johnson', 'Senior Partner (Lagos)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2610) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2610 AND name = x.name);

-- 2611 Novastar Ventures, Nairobi, Kenya
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2611, 'Novastar Ventures', 'Investment Team', 'Novastar Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Nairobi', '', 'Kenya', 'Africa',
  147, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-African VC backing "people and planet" businesses (healthcare, agriculture, financial inclusion, climate); UK-registered, offices Nairobi + Lagos. Africa People and Planet Fund III closed $147M (~2026), below its $200M target. Street address unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2611);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2611, x.name, x.role FROM (
  SELECT 'Steve Beck' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Andrew Carruthers', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2611) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2611 AND name = x.name);

-- 2612 4DX Ventures, Accra, Ghana
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2612, '4DX Ventures', 'Investment Team', '4DX Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Accra', '', 'Ghana', 'Africa',
  55, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage tech investor across Africa with an African-diaspora/emerging-market lens. HQ ambiguous across sources (US-registered, Brooklyn NY, vs. regional offices Accra/Cairo/Nairobi) -- verify. Fund III raised >$55M toward an $80M target (Sept 2025, in progress).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2612);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2612, x.name, x.role FROM (
  SELECT 'Walter Baddoo' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Peter Orth', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2612) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2612 AND name = x.name);

-- 2613 Future Africa, Lagos, Nigeria
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2613, 'Future Africa', 'Investment Team', 'Future Africa', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Lagos', '', 'Nigeria', 'Africa',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early/pre-seed African tech investor via community-funded syndicate/SPV model rather than a single traditional closed fund -- explains low-confidence fund-size figures found (~$10M across 2 funds). Portfolio 100+ companies collectively valued >$6B (portfolio value, not fund AUM).',
  '6 Elsie Femi Pearse St, Victoria Island'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2613);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2613, x.name, x.role FROM (
  SELECT 'Iyinoluwa Aboyeji' AS name, 'Founder, CEO & General Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2613) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2613 AND name = x.name);

-- 2614 Ventures Platform, Abuja, Nigeria
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2614, 'Ventures Platform', 'Investment Team', 'Ventures Platform', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Abuja', '', 'Nigeria', 'Africa',
  64, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-African early-stage (seed-Series A) VC, Nigeria-anchored (sources vary between Abuja and Lagos as primary city). Pan-African Fund II raised $64M toward a $75M target (Nov 2025); Nigeria''s federal govt made its first-ever direct VC fund investment into this vehicle.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2614);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2614, x.name, x.role FROM (
  SELECT 'Kola Aina' AS name, 'Founding/Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2614) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2614 AND name = x.name);

-- 2615 Verod-Kepple Africa Ventures, Tokyo, Japan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2615, 'Verod-Kepple Africa Ventures', 'Investment Team', 'Verod-Kepple Africa Ventures (formerly Kepple Africa Ventures)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Tokyo', '', 'Japan', 'Asia-Pacific',
  60, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Japanese-capital-backed VC connecting Japanese LPs/corporates to African Series A/B tech startups; joint venture with Lagos-based PE firm Verod Capital. Joint fund closed $60M (backed by SBI Holdings, Toyota Tsusho, JICA). Founded as Kepple Africa Ventures, Dec 2018.',
  '10-10 Shinsencho VORT Shibuya Shinsen 7F'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2615);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2615, x.name, x.role FROM (
  SELECT 'Ryosuke Yamawaki' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Takahiro Kanzaki', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2615) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2615 AND name = x.name);

-- 2616 Norrsken22, Cape Town, South Africa
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2616, 'Norrsken22', 'Investment Team', 'Norrsken22 (Africa Technology Growth Fund)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cape Town', '', 'South Africa', 'Africa',
  205, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage (Series B+) African tech investor, part of the Norrsken Foundation ecosystem. Debut fund closed $205M (Nov 2023); ~59% of capital from ~30 global unicorn founders as LPs. Also has a Johannesburg presence. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2616);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2616, x.name, x.role FROM (
  SELECT 'Lexi Novitske' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Natalie Kolbe', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2616) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2616 AND name = x.name);

-- 2617 Knife Capital, Cape Town, South Africa
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2617, 'Knife Capital', 'Investment Team', 'Knife Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cape Town', '', 'South Africa', 'Africa',
  50, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Series B-stage growth capital for African/South African scale-ups expanding internationally. Fund III closed $50M (Aug 2023). Also offices London, Jersey. A previously-suggested "Andrea Bohmert" could not be verified as current personnel -- not added as a contact.',
  'Black River Office Park, Old Warehouse Building, Fir Road, Observatory'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2617);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2617, x.name, x.role FROM (
  SELECT 'Eben van Heerden' AS name, 'Co-Founder & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2617) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2617 AND name = x.name);

-- 2618 CRE Venture Capital, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2618, 'CRE Venture Capital', 'Investment Team', 'CRE Venture Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  406, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage African tech investor, US-HQ''d with a Lagos, Nigeria regional office. AUM $406.5M (Jun 2025, Crunchbase). Founded 2015; global co-investment syndicate incl. Google, Tencent, Y Combinator. Street address unconfirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2618);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2618, x.name, x.role FROM (
  SELECT 'Pardon Makumbe' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2618) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2618 AND name = x.name);

-- 2619 Launch Africa Ventures, Port Louis, Mauritius
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2619, 'Launch Africa Ventures', 'Investment Team', 'Launch Africa Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Port Louis', '', 'Mauritius', 'Africa',
  36, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-African pre-seed/seed generalist VC, high-volume portfolio strategy. Fund I raised ~$36M (invested $31M into 133 startups across 22 countries). Seed Fund II first close $64M, still actively deploying (Jul 2026). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2619);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2619, x.name, x.role FROM (
  SELECT 'Zachariah George' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Janade du Plessis', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2619) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2619 AND name = x.name);

-- 2620 Consonance Investment Managers, Lagos, Nigeria
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2620, 'Consonance Investment Managers', 'Investment Team', 'Consonance Investment Managers', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Lagos', '', 'Nigeria', 'Africa',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/growth investor, primarily Nigeria-based startups, founded 2017. AUM/fund size not confirmed via search. 43 companies invested as of Aug 2023 (Gebeya, VerifyMe, Pezesha, SeamlessHR). No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2620);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2620, x.name, x.role FROM (
  SELECT 'Bolaji Adeoye' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2620) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2620 AND name = x.name);

-- 2621 Savannah Fund, Nairobi, Kenya
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2621, 'Savannah Fund', 'Investment Team', 'Savannah Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Nairobi', '', 'Kenya', 'Africa',
  25, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pioneering early seed-stage fund for African tech startups, founded 2012. ~$25M AUM (Fund II, ~2021 vintage). Current activity level and up-to-date fund size uncertain -- one of the older, less-recently-active firms in this batch, verify before outreach.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2621);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2621, x.name, x.role FROM (
  SELECT 'Mbwana Alliy' AS name, 'Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2621) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2621 AND name = x.name);

-- 2622 Investisseurs & Partenaires (I&P), Paris, France
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2622, 'Investisseurs & Partenaires', 'Investment Team', 'Investisseurs & Partenaires (I&P)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  135, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Impact investing / SME and startup financing across Sub-Saharan Africa (broader than pure tech VC -- impact PE/VC hybrid), 10 African country offices + Washington DC. Manages 4 pan-African vehicles totaling EUR135M -- figure is from an older (2019-era) source, likely outdated. No current senior leadership names confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2622);

-- 2623 Algebra Ventures, Cairo, Egypt
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2623, 'Algebra Ventures', 'Investment Team', 'Algebra Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cairo', '', 'Egypt', 'Middle East',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Egypt/MENA-focused early-stage tech VC. Fund I $54M (2016, IFC-anchored); Fund II $100M, actively investing. No confirmed Fund III. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2623);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2623, x.name, x.role FROM (
  SELECT 'Tarek Assaad' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2623) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2623 AND name = x.name);

-- 2624 Flat6Labs / F6 Ventures, Cairo, Egypt
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2624, 'Flat6Labs', 'Investment Team', 'Flat6Labs (venture arm now branded "F6 Ventures" under parent F6 Group)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cairo', '', 'Egypt', 'Middle East',
  90, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage accelerator/VC across MENA and Africa, Egypt-anchored, founded 2011. Restructured Aug 2025 under new parent "F6 Group." F6 Ventures manages 6 funds, combined AUM >$90M, targeting $200M within 5 years. Also offices Riyadh, Abu Dhabi, Amman, Tunis, Nairobi.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2624);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2624, x.name, x.role FROM (
  SELECT 'Dina El-Shenoufy' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Ramez El-Serafy', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2624) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2624 AND name = x.name);
