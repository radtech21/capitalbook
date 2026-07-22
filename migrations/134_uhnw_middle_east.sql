-- UHNW individual expansion, batch 6: 15 Middle East UHNW individuals,
-- added as brand-new contacts (ids 2715-2729). Real published
-- CORPORATE contact routes populated where found. Several personal
-- net worth figures are opaque/undisclosed for Gulf royals -- left
-- NULL rather than guessed. Next available id after this batch is 2730.

-- 2715 Sheikh Tahnoun bin Zayed Al Nahyan, Abu Dhabi, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2715, 'Sheikh Tahnoun bin Zayed Al Nahyan', 'Chairman', 'ADQ, International Holding Company (IHC), First Abu Dhabi Bank', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '600 625500', 'Abu Dhabi', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairs ADQ (sovereign holding), IHC, First Abu Dhabi Bank, ADIA; also chairs AI firm G42 and MGX fund. Institutions he chairs manage $1.4-1.5T combined. Personal net worth opaque/undisclosed (uses offshore structures) -- not guessed. Phone is FAB call center.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2715);

-- 2716 Sheikh Mansour bin Zayed Al Nahyan, Abu Dhabi, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2716, 'Sheikh Mansour bin Zayed Al Nahyan', 'Founder', 'Abu Dhabi United Group; UAE Vice President/Deputy PM', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Abu Dhabi', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', 30000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Abu Dhabi United Group founder; UAE Vice President/Deputy PM; former chairman Emirates Investment Authority, Mubadala. Net worth ~$30B (Celebrity Net Worth, 2026, low-confidence estimate). Flagship holding City Football Group (Manchester City) has a UK corporate contact but no direct ADUG contact was found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2716);

-- 2717 Sheikh Mohamed bin Zayed Al Nahyan, Abu Dhabi, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2717, 'Sheikh Mohamed bin Zayed Al Nahyan', 'President', 'UAE; Royal Group (family conglomerate)', 'UHNW Individual', 'B', 0,
  'info@royalgroupuae.com', 'Corporate contact only', '+971 2 811 1111', 'Abu Dhabi', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', 30000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). UAE President; personal/family holdings largely run through Royal Group (60+ companies, chaired by brother Tahnoun) and sovereign funds. Al Nahyan family called world''s wealthiest royal dynasty ($300B+ collective assets, Bloomberg 2022). Personal figure ~$30B is low-confidence. Email/phone are Royal Group corporate contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2717);

-- 2718 Al Ghurair family, Dubai, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2718, 'Abdulla bin Ahmad Al Ghurair', 'Family Patriarch', 'Al Ghurair Group; Mashreqbank', 'UHNW Individual', 'B', 0,
  'media@al-ghurair.com', 'Corporate contact only', '04-603-7777', 'Dubai', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', 4800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Al Ghurair Group (construction, food, real estate) and Mashreqbank (founded 1967). Net worth & family ~$4.8B (Forbes 2025, #954 on 2026 list). Related figure: Abdul Aziz Al Ghurair ~$2.6B (2022, dated). Email/phone are Al Ghurair Group corporate contacts.',
  'Omar Bin Al Khattab Road, Deira'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2718);

-- 2719 Khalaf Ahmad Al Habtoor, Dubai, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2719, 'Khalaf Ahmad Al Habtoor', 'Founder & Chairman', 'Al Habtoor Group', 'UHNW Individual', 'B', 0,
  '', 'Corporate contact only', '+971 4 394 1444', 'Dubai', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', 2300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Chairman, Al Habtoor Group (founded 1970) -- construction, hospitality, automotive distribution, real estate, education. Net worth ~$2.3B (Forbes, cited 2025-26). Phone is Al Habtoor Group corporate HQ.',
  'Al Wasl Road, Al Safa 2'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2719);

-- 2720 Majid Al Futtaim family, Dubai, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2720, 'Tariq Al Futtaim', 'Board Member (family representative)', 'Majid Al Futtaim Holding', 'UHNW Individual', 'B', 0,
  'contactus@maf.ae', 'Corporate contact only', '+971 4 294 9999', 'Dubai', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Majid Al Futtaim Holding (malls, retail/Carrefour ME franchise, entertainment, hospitality) -- distinct entity from the "Al-Futtaim Group" (Juma Al Futtaim branch, already a separate CRM record). Founder Majid Al Futtaim died 2021, estate valued ~$4.3B; no current family net-worth figure published. Company: $18.7B assets, $9.2B revenue (2024). Email/phone are MAF corporate contacts.',
  'Majid Al Futtaim Tower 1'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2720);

-- 2721 Naguib Sawiris, Cairo, Egypt
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2721, 'Naguib Sawiris', 'Chairman', 'Orascom TMT / Orascom Investment Holding', 'UHNW Individual', 'B', 0,
  'investorrelations@orascomih.com', 'Corporate contact only', '+20 2 2461 7300', 'Cairo', '', 'Egypt', 'Middle East',
  NULL, 'Unknown', 7400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Sold Orascom Telecom 2011; now chairs Orascom TMT/Orascom Investment Holding -- mining (La Mancha, Endeavour/Evolution Mining stakes), media, telecom, football (FC Luzern 12.5%). Net worth $5.6-9.25B (range across 2025-26, fluctuates with gold prices). Email/phone are Orascom Investment Holding IR corporate contacts.',
  'Nile City Towers, South Tower, 29th Fl'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2721);

-- 2722 Nassef Sawiris, Cairo, Egypt
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2722, 'Nassef Sawiris', 'Chairman & Majority Owner', 'OCI N.V.', 'UHNW Individual', 'A', 0,
  'sarah.rajani@oci-global.com', 'Corporate contact only', '+44 (0)7934 357766', 'Cairo', '', 'Egypt', 'Middle East',
  NULL, 'Unknown', 9600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/majority owner (43.39% stake, Apr 2026), OCI N.V. (nitrogen fertilizer, Euronext Amsterdam); ~6% stake in Adidas; co-owner Aston Villa FC. Net worth $9.6B (Forbes 2026) -- richest person in Egypt and #5 richest in Africa. Email/phone are OCI VP Investor Relations corporate contact.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2722);

-- 2723 Olayan family, Riyadh, Saudi Arabia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2723, 'Lubna S. Olayan', 'CEO', 'Olayan Financing Group', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Riyadh', '', 'Saudi Arabia', 'Middle East',
  NULL, 'Unknown', 10000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Olayan Group (founded 1947) -- diversified conglomerate: trading, food/consumer distribution, financial services, real estate, 40+ companies. Family/group valued $10B+ based on disclosed equity/property (2025 reporting); consistently ranked Forbes'' top Arab family business. No public phone/email located beyond a website contact form.',
  'P.O. Box 8772'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2723);

-- 2724 Mohammed Hussein Al Amoudi, Jeddah, Saudi Arabia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2724, 'Mohammed Hussein Al Amoudi', 'Founder', 'MIDROC Investment Group; Corral Petroleum Holdings', 'UHNW Individual', 'C', 0,
  '', 'No public contact', '', 'Jeddah', '', 'Saudi Arabia', 'Middle East',
  NULL, 'Unknown', 9400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). MIDROC Investment Group (Ethiopia) and Corral Petroleum Holdings AB (Sweden, incl. Preem energy stake ~$3.95B); gold mining, construction, hotels, agriculture. Net worth $8.5-10.6B (Bloomberg/Forbes-cited, 2025). No verified corporate contact confirmed -- official site returned an access error.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2724);

-- 2725 Saudi Binladin Group, Jeddah, Saudi Arabia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2725, 'Bin Laden Family / Saudi Binladin Group', 'Former Controlling Shareholders', 'Saudi Binladin Group', 'UHNW Individual', 'C', 0,
  'info@sbg.com.sa', 'Corporate contact only', '+966 12 657 7777', 'Jeddah', '', 'Saudi Arabia', 'Middle East',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). MAJOR FLAG: as of Dec 2025 the Saudi Ministry of Finance became majority shareholder of Saudi Binladin Group (construction conglomerate) via debt-to-equity conversion; the Bin Laden family''s ~36.2% stake was transferred to a state-owned vehicle (Istidama Holding). Current chairman Muhannad Al-Azzawi is NOT a family member. No current net worth figure -- historical family estimate ($7.1B, 2009) is stale and no longer reflects direct ownership.',
  'Rawda District'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2725);

-- 2726 Al Rajhi family, Riyadh, Saudi Arabia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2726, 'Abdullah bin Sulaiman Al Rajhi', 'Chairman', 'Al Rajhi Bank', 'UHNW Individual', 'B', 0,
  'help@alrajhibank.com.sa', 'Corporate contact only', '8001241222', 'Riyadh', '', 'Saudi Arabia', 'Middle East',
  NULL, 'Unknown', 2600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Current Chairman, Al Rajhi Bank (largest Islamic bank in Saudi Arabia, co-founded 1957/1983 by his father''s generation). Net worth $2.6B (Forbes 2025). Note: family founder Sulaiman Al Rajhi''s fortune peaked at $7.7B (2011) before pledging the majority to charity via Sulaiman Al Rajhi University endowment -- do not cite that older figure as current. Email/phone are Al Rajhi Bank corporate contacts.',
  '8467 King Fahd Road, Al Muruj District'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2726);

-- 2727 Mohammed Abdul Latif Jameel, Jeddah, Saudi Arabia
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2727, 'Mohammed Abdul Latif Jameel', 'Chairman', 'Abdul Latif Jameel Company', 'UHNW Individual', 'B', 0,
  'info@alj.ae', 'Corporate contact only', '+966 12 628 4444', 'Jeddah', '', 'Saudi Arabia', 'Middle East',
  NULL, 'Unknown', 5000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Abdul Latif Jameel Company (ALJ) -- world''s largest Toyota dealership, plus mobility, energy, water, finance, health, investments across 35+ countries. Net worth estimated to exceed $5B (2024-25 reporting); family wealth rose $11.5B after Rivian''s IPO. Email/phone are ALJ corporate contacts.',
  'Amir Majed Street, Al Safa District'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2727);

-- 2728 Kutayba Alghanim, Kuwait City, Kuwait
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2728, 'Kutayba Alghanim', 'Chairman', 'Alghanim Industries', 'UHNW Individual', 'C', 0,
  'info@alghanim.com', 'Corporate contact only', '+965 2496 2000', 'Kuwait City', '', 'Kuwait', 'Middle East',
  NULL, 'Unknown', 1300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Alghanim Industries (with brother Bassam) -- automotive, engineering, food & beverage, industrial, consumer, services across 40+ countries; also a Gulf Bank stake. Net worth $1.2-1.4B is a dated Forbes estimate (most recent Forbes billionaire listing 2020) -- verify before use. Email/phone are Alghanim Industries corporate contacts.',
  'Al Hamra Tower'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2728);

-- 2729 Sheikh Ahmed bin Saeed Al Maktoum, Dubai, UAE
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2729, 'Sheikh Ahmed bin Saeed Al Maktoum', 'Chairman & CEO', 'Emirates Airline & Group', 'UHNW Individual', 'B', 0,
  'pr@emirates.com', 'Corporate contact only', '+971 4 708 1111', 'Dubai', '', 'United Arab Emirates', 'Middle East',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, Emirates Airline & Group (incl. dnata); also Chairman, Dubai Holding / Emirates NBD / Dubai Airports; President, Dubai Civil Aviation Authority. No reliable current (2025-26) personal net worth figure found (historical $31.7-37.8B cited 2011/2021, stale). Emirates Group: $39.6B revenue / $49.7B assets (FY2024-25). Email/phone are Emirates Group PR/media corporate contacts.',
  'Emirates Group HQ Building, Al-Garhoud, Airport Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2729);
