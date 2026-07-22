-- UHNW individual expansion, batch 1: 15 real estate magnates, added as
-- brand-new contacts (ids 2535-2549). New segment value introduced:
-- 'UHNW Individual' (no prior segment fit these personally-held
-- fortunes). net_worth_mm populated where a credible recent Forbes/
-- Bloomberg figure exists; aum_mm left NULL (not applicable to personal
-- net worth). No personal email/phone/home address was found or
-- guessed -- only public corporate/company contact routes, per the
-- same no-fabrication discipline used for the angel investor batch.
-- Next available id after this batch is 2550.

-- 2535 Stephen M. Ross, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2535, 'Stephen M. Ross', 'Chairman', 'Related Companies', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 17000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Related Companies (Hudson Yards, Deutsche Bank Center); also owner, Miami Dolphins. Net worth ~$17B (Forbes 2026). Routing via relatedcompanies.com; no personal contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2535);

-- 2536 Donald L. Bren, Newport Beach, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2536, 'Donald L. Bren', 'Chairman & Sole Owner', 'The Irvine Company', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Newport Beach', 'California', 'United States', 'United States',
  NULL, 'Unknown', 19000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Sole owner, The Irvine Company -- Southern California master-planned communities, 129M sq ft portfolio, also owns Manhattan''s MetLife Building. Net worth ~$18.9-19B (Forbes, 2024/2025 list). Routing via irvinecompany.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2536);

-- 2537 Steven Roth, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2537, 'Steven Roth', 'Chairman & CEO', 'Vornado Realty Trust', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 426, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, Vornado Realty Trust (NYSE: VNO), NYC office/retail REIT. FLAG: Forbes'' last billionaire estimate was $1B in 2016 and he is not on Forbes'' current list -- ~$426M is a stock-based estimate (Jul 2026), treat net worth as stale/uncertain.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2537);

-- 2538 Richard LeFrak, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2538, 'Richard LeFrak', 'Chairman & CEO', 'LeFrak Organization', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 2700, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, LeFrak Organization -- large-scale residential (LeFrak City, Queens: 5,000 units), NYC-Newark waterfront + Miami expansion. Net worth $2.7-2.81B (Forbes, 2025/2026). Routing via lefrak.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2538);

-- 2539 Harry B. Macklowe, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2539, 'Harry B. Macklowe', 'Founder & Principal', 'Macklowe Properties', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 2000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Macklowe Properties (432 Park Avenue, One Wall Street); still actively acquiring at age 88 (809 Madison Ave, Sept 2025). Net worth ~$2-2.5B, but highly leverage-dependent and contested (own attorneys argued negative net worth in 2018 divorce) -- treat as directional only.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2539);

-- 2540 William C. Rudin, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2540, 'William C. Rudin', 'Co-Chairman & CEO', 'Rudin Management Company', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 5000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-Chairman/CEO, Rudin Management (family firm with cousin Eric Rudin) -- ~15M sq ft NYC residential/commercial. Rudin family net worth estimated ~$5B (2025). Routing via rudin.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2540);

-- 2541 Douglas Durst, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2541, 'Douglas Durst', 'President & Chairman', 'The Durst Organization', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 4400, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). President/Chairman, The Durst Organization (with nephew Jody Durst) -- Midtown Manhattan office (4 Times Square, One WTC co-developer), luxury rentals. Personal net worth ~$4.4B; org assets ~$8.1B. Routing via durst.org.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2541);

-- 2542 Jerry Speyer, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2542, 'Jerry Speyer', 'Chairman', 'Tishman Speyer', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 4400, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Tishman Speyer (son Rob Speyer is CEO) -- global CRE ownership/development/investment mgmt, ~$65B AUM across 40 markets, diversifying into life sciences/industrial/credit/venture. Speyer & family net worth ~$4.4B (Forbes). Routing via tishmanspeyer.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2542);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2542, x.name, x.role FROM (
  SELECT 'Rob Speyer' AS name, 'President & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2542) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2542 AND name = x.name);

-- 2543 Barry Sternlicht, Miami Beach, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2543, 'Barry Sternlicht', 'Chairman & CEO', 'Starwood Capital Group', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Miami Beach', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 3100, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, Starwood Capital Group -- global RE private equity (~$130B AUM), founded W Hotels, also chairs Starwood Property Trust (mortgage REIT). Net worth $3.1-4.5B (estimates vary). Routing via starwoodcapital.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2543);

-- 2544 Larry A. Silverstein, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2544, 'Larry A. Silverstein', 'Chairman', 'Silverstein Properties', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 1000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Silverstein Properties -- rebuilder/developer of the World Trade Center complex (99-yr lease signed Jul 2001), Lower Manhattan commercial. Net worth ~$1B (Forbes, Dec 2024). Routing via silversteinproperties.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2544);

-- 2545 Charles S. Cohen, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2545, 'Charles S. Cohen', 'Chairman & CEO', 'Cohen Brothers Realty Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 1600, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, Cohen Brothers Realty -- ~12M sq ft high-end NYC office/design centers; also owns Landmark Theatres and Avenue magazine. Net worth ~$1.6B (down from $3.7B peak in 2022, disputed by Cohen). Corporate line +1 212-838-1800.',
  '750 Lexington Ave'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2545);

-- 2546 Wang Jianlin, Beijing, China
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2546, 'Wang Jianlin', 'Founder & Chairman', 'Dalian Wanda Group', 'UHNW Individual', 'C', 0,
  '', 'No public contact', '', 'Beijing', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 4200, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Chairman, Dalian Wanda Group -- China''s largest commercial RE operator (500+ Wanda Plazas). Net worth ~$4.2-4.4B, down sharply from prior peak amid 2025 debt defaults and a court-imposed luxury spending restriction -- flag active financial distress before outreach.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2546);

-- 2547 Li Ka-shing, Hong Kong
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2547, 'Li Ka-shing', 'Senior Advisor (retired Chairman)', 'CK Asset Holdings / CK Hutchison Holdings', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Hong Kong', '', 'China', 'Asia-Pacific',
  NULL, 'Unknown', 45100, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Retired Chairman (2018), CK Asset/CK Hutchison -- diversified conglomerate incl. major HK/China/global RE arm plus infrastructure, ports, retail, telecom. Net worth ~$45.1-47B (Forbes, Feb 2026). Retired from day-to-day exec roles -- outreach likely routes via corporate/family office, not him directly.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2547);

-- 2548 Neil G. Bluhm, Chicago, IL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2548, 'Neil G. Bluhm', 'Co-Founder & Managing Principal', 'Walton Street Capital', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Chicago', 'Illinois', 'United States', 'United States',
  NULL, 'Unknown', 9500, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-Founder, Walton Street Capital (also co-founded JMB Realty); RE PE across asset classes, plus casino/gaming (Rush Street Interactive) and minority Bulls/White Sox stakes. Net worth ~$9.5-9.7B. Firm acquired by Ares Management Oct 2024 -- outreach may now route via Ares.',
  '900 N. Michigan Ave., Suite 1900'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2548);

-- 2549 Jeff Sutton, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2549, 'Jeff Sutton', 'Founder', 'Wharton Properties', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 2700, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Wharton Properties -- prime Manhattan retail RE, leasing storefronts to luxury brands (Prada, Armani); has partnered with SL Green. Net worth ~$2.7B (Forbes, 2024/2025). Routing via jeffsutton.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2549);
