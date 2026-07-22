-- UHNW individual expansion, batch: 15 US real estate magnates,
-- added as brand-new contacts (ids 2894-2908). Next available id after
-- this batch is 2909. Where a REAL, published corporate contact was
-- confirmed it is populated (email_status='Corporate contact only',
-- reachable=1); where none could be confirmed it is left blank
-- (email_status='No public contact', reachable=0). No personal
-- contact was sought or used for any individual.

-- 2894 Stephen M. Ross
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2894, 'Stephen M. Ross', 'Chairman', 'Related Companies', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 17000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Related Companies (owns ~60%), developer of Hudson Yards and other mega mixed-use projects; also owns the Miami Dolphins and Related Ross (FL). Net worth ~$15-17B est. (2026), varies by source. A general press email (communications@related.com) surfaced in search-indexing but was not confirmed by direct site fetch -- left blank per policy of only using confidently confirmed contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2894);

-- 2895 Donald Bren
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2895, 'Donald Bren', 'Chairman', 'Irvine Company', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Newport Beach', 'California', 'United States', 'United States',
  NULL, 'Unknown', 19200, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman and sole owner of the Irvine Company (~129M sq ft portfolio, 590+ office buildings, 125+ apartment complexes, largely Orange County, CA); frequently cited as the wealthiest US real estate developer. Net worth ~$19.2B (Forbes 2026, #144). A press line/email surfaced in search-indexing but direct site fetch was blocked -- left blank per policy.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2895);

-- 2896 Equity Group Investments (Zell family / Sam Zell legacy)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2896, 'Zell Family (Equity Group Investments)', 'Family / Successor Leadership', 'Equity Group Investments', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Chicago', 'Illinois', 'United States', 'United States',
  NULL, 'Unknown', 5900, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Sam Zell built Equity Group Investments (EGI) and Equity Residential/Equity Office into major real estate/diversified investment platforms (the "Grave Dancer"); died May 18 2023, net worth ~$5.2-5.9B at death, used as reference since no post-estate figure exists. Now run by family/foundation (Helen Zell) and EGI execs. No confirmed direct corporate contact found.',
  'Two North Riverside Plaza'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2896);

-- 2897 Leonard N. Stern
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2897, 'Leonard N. Stern', 'Chairman', 'Hartz Mountain Industries', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(201) 271-4800', 'Secaucus', 'New Jersey', 'United States', 'United States',
  NULL, 'Unknown', 8100, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Hartz Mountain Industries, 260+ building / 45M+ sq ft industrial/office/retail/residential portfolio concentrated in northern New Jersey and NYC, funded by proceeds from selling the family''s Hartz pet-products business in 2000. Net worth estimates range $4.5B-$9B across sources; $8.1B (Forbes 2024) used here. Phone is the general/published corporate switchboard, not a personal line -- privately held, no dedicated press/IR email found.',
  '500 Plaza Drive'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2897);

-- 2898 Milstein Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2898, 'Milstein Family', 'Family Shareholders', 'Milstein Properties', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(212) 708-0800', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 4500, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). NYC office/apartment developer family (20M+ sq ft), also controls Emigrant Bank; dynasty split between two branches (Milstein Properties and Ogden CAP Properties). Family net worth figures dated/inconsistent (~$3.1B 2017 to ~$4.5B for Paul Milstein''s branch) -- not consistently tracked, treat as estimate. Phone is the general corporate office line, not personal.',
  '335 Madison Ave, Ste 1500'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2898);

-- 2899 Rudin Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2899, 'Rudin Family', 'Family Shareholders', 'Rudin Management Company', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(212) 407-2400', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 5000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Fourth-generation NYC real estate family managing ~35 properties (~15M sq ft), including 3 Times Square; descended from Samuel Rudin. Net worth ~$5B estimated (2026, secondary sources) -- not a primary Forbes/Bloomberg-tracked family, treat as estimate. Phone is the general published corporate office line, not personal; no dedicated press/IR email found.',
  '345 Park Avenue'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2899);

-- 2900 Richard LeFrak (LeFrak family)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2900, 'Richard LeFrak', 'Chairman and CEO', 'LeFrak', 'UHNW Individual', 'A', 0,
  'INFO@LEFRAK.COM', 'Corporate contact only', '(212) 708-6600', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 5000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/CEO of a 140+-year-old family real estate firm; holdings include LeFrak City (Queens, 20-building/5,000-unit complex) and large-scale NJ waterfront development (Newport, Jersey City). Net worth estimates range $4B-$6.4B (Forbes 2026 lists "Richard LeFrak & family") -- reported near the midpoint, treat as estimate. Email/phone are the general published corporate contact (lefrak.com contact page), not personal.',
  '40 W 57th St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2900);

-- 2901 Durst Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2901, 'Durst Family', 'Family Shareholders', 'The Durst Organization', 'UHNW Individual', 'A', 0,
  'media@durst.org', 'Corporate contact only', '(212) 257-6600', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 6000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Century-old NYC developer/owner of 16M+ sq ft, including a 10% stake in One World Trade Center; currently led by Douglas Durst and nephew Jody Durst. Net worth estimates vary widely (~$4.5B family vs ~$8.1B organizational-assets figure) -- reported near the midpoint, treat as estimate. Email/phone are the actively published media-inquiries contact (durst.org), not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2901);

-- 2902 Harry B. Macklowe
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2902, 'Harry B. Macklowe', 'Founder', 'Macklowe Properties', 'UHNW Individual', 'A', 0,
  'MPinfo@mackloweproperties.com', 'Corporate contact only', '+1 212-265-5900', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 500, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Veteran Manhattan developer (432 Park Avenue, One Wall Street conversion), known for aggressive leverage, a ~$2B divorce, and a ~$922M art-collection auction (2021-22). Net worth is highly disputed -- Forbes removed him from its billionaires list in 2019; post-divorce estimates range $450-550M up to $2-2.5B. $500M used as a conservative flagged estimate, contested. Email/phone are general corporate contact, not personal.',
  '767 5th Ave, Ste 2101'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2902);

-- 2903 Solow Building Company (Sheldon Solow estate / Stefan Soloviev)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2903, 'Stefan Soloviev (Solow Building Company)', 'President (successor to Sheldon Solow)', 'Solow Building Company', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 4400, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Sheldon Solow built and held trophy Manhattan office/residential assets (notably 9 West 57th Street, "the Solow Building"); died Nov 17, 2020 with net worth ~$4.4B at death (Forbes/Bloomberg), used here as the reference point since no separately confirmed current figure exists for the estate. Son Stefan Soloviev now runs the company. No dedicated press/IR contact found.',
  '9 W 57th St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2903);

-- 2904 Zeckendorf Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2904, 'Zeckendorf Family (Arthur W. and William Lie Zeckendorf)', 'Co-Chairmen', 'Zeckendorf Development / Brown Harris Stevens', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Third-generation NYC luxury residential developers (15 Central Park West, 520 Park Avenue), descended from William Zeckendorf Sr.; also co-chairmen of Brown Harris Stevens/Terra Holdings. Personal net worth NOT publicly tracked by Forbes/Bloomberg -- only a "$4B+ in developed properties" firm-level figure found, so net_worth_mm left NULL rather than guessed. No corporate contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2904);

-- 2905 Tisch Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2905, 'Tisch Family', 'Family Shareholders', 'Loews Corporation', 'UHNW Individual', 'A', 0,
  'ir@loews.com', 'Corporate contact only', '(212) 521-2000', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 12000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Descendants of Laurence and Robert Tisch; own roughly one-third of publicly traded Loews Corp (NYSE: L), incl. Loews Hotels & Co. (26 properties) plus insurance/energy holdings. Family net worth ~$10.1B-$14B depending on source/branch-counting, reported near midpoint. As a public company, ir@loews.com is a genuine, verifiable corporate IR contact.',
  '9 West 57th Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2905);

-- 2906 Igor Olenicoff
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2906, 'Igor Olenicoff', 'Chairman and Founder', 'Olen Properties', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '(949) 644-6536', 'Newport Beach', 'California', 'United States', 'United States',
  NULL, 'Unknown', 5500, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Russian-emigre-turned-developer with 8M+ sq ft office space and 17,000+ residential units across CA and 7 other states. Net worth unusually wide-ranging ($3.4B-$8B across sources), reported near the middle. Separately known for a 2007 guilty plea for hiding assets offshore (public record, KYC-relevant). Phone is the general corporate office line, not personal.',
  '7 Corporate Plaza Dr'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2906);

-- 2907 Jerry Speyer (Tishman Speyer)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2907, 'Jerry Speyer', 'Co-Founder', 'Tishman Speyer', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+1 212-715-0300', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 3000, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founded Tishman Speyer in 1978 with father-in-law Robert Tishman; the firm redeveloped Rockefeller Center and the Chrysler Building; son Rob Speyer is CEO. Net worth reported as low as ~$2.2B (Forbes 2026 #1913) vs ~$3.9-4B in older estimates -- notable variance, reported near midpoint. Phone is the general corporate line; Press Center at tishmanspeyer.com/press.',
  'Rockefeller Center, 45 Rockefeller Plaza'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2907);

-- 2908 Jeff Sutton
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2908, 'Jeff Sutton', 'Founder', 'Wharton Properties', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 2700, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Manhattan retail real estate specialist known for acquiring/leasing prime Fifth Avenue and SoHo storefronts to luxury brands (Armani, Prada, American Girl flagship deal). Net worth ~$2.7B (Forbes, Aug 2024 figure). No confirmed corporate contact -- a partially-masked, apparently personal email surfaced on a data-broker site and was deliberately excluded per policy against using unverified/personal contacts.',
  '500 5th Ave, 54th floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2908);
