-- UHNW individual expansion, batch 4: 15 more US UHNW individuals
-- (finance/hedge funds, retail, healthcare, industrials), added as
-- brand-new contacts (ids 2685-2699). Per user request, real published
-- CORPORATE contact routes (IR/press office phone + email) are now
-- populated where genuinely found on an official source -- these are
-- company channels, never personal emails/phones for the individual.
-- Next available id after this batch is 2700.

-- 2685 Ken Griffin, Miami, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2685, 'Ken Griffin', 'Founder & CEO', 'Citadel / Citadel Securities', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(305) 929-6851', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 50000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/CEO, Citadel (hedge fund, HQ relocated Chicago->Miami 2022) and Citadel Securities. Net worth ~$49.6-51.2B (Forbes/Bloomberg, early 2026). Phone is Citadel Securities corporate line, not personal.',
  '830 Brickell Plaza'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2685);

-- 2686 Steve Cohen, Stamford, CT
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2686, 'Steve Cohen', 'Founder & CEO', 'Point72 Asset Management; Owner, New York Mets', 'UHNW Individual', 'A', 0,
  'Point72.IR@sscinc.com', 'Corporate contact only', '203-890-2000', 'Stamford', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', 22000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/CEO, Point72 Asset Management; owner, New York Mets. Net worth ~$21-23B (Forbes/Bloomberg, 2026). Email/phone are Point72 investor-relations corporate contacts, not personal.',
  '72 Cummings Point Rd'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2686);

-- 2687 Israel Englander, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2687, 'Israel Englander', 'Founder & Co-CEO', 'Millennium Management', 'UHNW Individual', 'A', 0,
  'Info_MLP@mlp.com', 'Corporate contact only', '+1 (212) 841-4100', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 18900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Co-CEO, Millennium Management (multi-strategy hedge fund, ~$84-92B AUM). Net worth ~$18.9B (Forbes, Sept 2025/2026 list). Email/phone are Millennium corporate contacts, not personal.',
  '399 Park Ave'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2687);

-- 2688 Bill Ackman, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2688, 'Bill Ackman', 'CEO', 'Pershing Square Capital Management', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+1 212 813 3700', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 9200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). CEO, Pershing Square Capital Management; also CEO of Pershing Square Inc. (NYSE: PSQH, IPO''d Apr 2026). Net worth ~$9.1-9.3B (Forbes, Feb 2026). Phone is Pershing Square corporate line, not personal.',
  '888 Seventh Avenue, 42nd Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2688);

-- 2689 Carl Icahn, Sunny Isles Beach, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2689, 'Carl Icahn', 'Chairman', 'Icahn Enterprises L.P.', 'UHNW Individual', 'B', 0,
  '', 'Corporate contact only', '(212) 702-4300', 'Sunny Isles Beach', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Icahn Enterprises L.P. (NASDAQ: IEP). Net worth estimates conflict wildly ($4B-$16B+) reflecting IEP unit-price decline from prior peaks -- not reconciled, do not cite a figure without direct verification. Phone is Icahn Enterprises IR, not personal.',
  '16690 Collins Avenue, Penthouse Suite'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2689);

-- 2690 Phil Knight, Beaverton, OR
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2690, 'Phil Knight', 'Co-Founder & Chairman Emeritus', 'Nike, Inc.', 'UHNW Individual', 'A', 0,
  'Investor.Relations@nike.com', 'Corporate contact only', '1-800-640-8007', 'Beaverton', 'Oregon', 'United States', 'United States',
  NULL, 'Unknown', 38000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder & Chairman Emeritus, Nike Inc. (NYSE: NKE). Net worth ~$35-41B (Forbes, late 2025/2026, estimates vary). Email/phone are Nike investor-relations corporate contacts, not personal.',
  'One Bowerman Drive'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2690);

-- 2691 Abigail Johnson, Boston, MA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2691, 'Abigail Johnson', 'Chairman & CEO', 'Fidelity Investments', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '800-343-3548', 'Boston', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', 43000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, Fidelity Investments (privately held). Net worth ~$39.7-47B depending on source (Forbes #63, 2026). Phone is Fidelity main corporate line, not personal.',
  '245 Summer St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2691);

-- 2692 Thomas Pritzker, Chicago, IL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2692, 'Thomas Pritzker', 'Major Shareholder (former Executive Chairman)', 'Hyatt Hotels Corporation', 'UHNW Individual', 'B', 0,
  'investorrelations@hyatt.com', 'Corporate contact only', '(800) 468-9716', 'Chicago', 'Illinois', 'United States', 'United States',
  NULL, 'Unknown', 6200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Pritzker family founded/controls Hyatt Hotels (NYSE: H); stepped down as Executive Chairman Feb 2026 amid Epstein-association scrutiny, remains a major shareholder (~16%). Net worth ~$6.2B (Forbes #677, 2026). Email/phone are Hyatt IR corporate contacts.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2692);

-- 2693 Miriam Adelson, Las Vegas, NV
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2693, 'Miriam Adelson', 'Majority Owner', 'Las Vegas Sands Corporation', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(702) 445-1775', 'Las Vegas', 'Nevada', 'United States', 'United States',
  NULL, 'Unknown', 36000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Majority/controlling shareholder, Las Vegas Sands Corp. (NYSE: LVS); widow of Sheldon Adelson; also majority owner, Dallas Mavericks (NBA). Net worth ~$32-40B (wealthiest person in Nevada). Phone is Sands IR (Daniel Briggs, SVP IR), not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2693);

-- 2694 Alice Walton, Fort Worth, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2694, 'Alice Walton', 'Walmart Heir', 'Walmart Inc.', 'UHNW Individual', 'A', 0,
  'IR@walmart.com', 'Corporate contact only', '1-479-273-4000', 'Fort Worth', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 134000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Walmart Inc. (NYSE: WMT) heir, world''s richest woman. Net worth ~$134B (Forbes #14, 2026). Email/phone are Walmart investor-relations corporate contacts, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2694);

-- 2695 Jim Walton, Bentonville, AR
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2695, 'Jim Walton', 'Walmart Heir; Chairman, Arvest Bank', 'Walmart Inc. / Arvest Bank', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '1-479-750-1400', 'Bentonville', 'Arkansas', 'United States', 'United States',
  NULL, 'Unknown', 143000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Walmart Inc. heir; Chairman, Arvest Bank (family-owned, 44% stake). Net worth ~$142-145B (Forbes #12, 2026). Phone is Arvest Bank corporate HQ, not personal.',
  '125 W. Central, Ste. 218'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2695);

-- 2696 John Menard Jr., Eau Claire, WI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2696, 'John Menard Jr.', 'Founder & Owner', 'Menard, Inc. (Menards)', 'UHNW Individual', 'B', 0,
  '', 'Corporate contact only', '715-876-5911', 'Eau Claire', 'Wisconsin', 'United States', 'United States',
  NULL, 'Unknown', 21000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/owner, Menard Inc. (Menards home improvement chain, privately held); richest person in Wisconsin. Net worth estimates $19.4-23.4B. Phone is Menards corporate HQ, not personal.',
  '5101 Menard Drive'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2696);

-- 2697 H. Fisk Johnson, Racine, WI
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2697, 'H. Fisk Johnson', 'Chairman & CEO', 'S.C. Johnson & Son, Inc.', 'UHNW Individual', 'B', 0,
  '', 'Corporate contact only', '(262) 260-2154', 'Racine', 'Wisconsin', 'United States', 'United States',
  NULL, 'Unknown', 4700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman & CEO, S.C. Johnson & Son (privately held -- Windex, Off!, Pledge); fifth-generation family leader. Net worth ~$4.35-5B (Forbes #891, 2026). Phone is SC Johnson corporate HQ, not personal.',
  '1525 Howe St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2697);

-- 2698 Ray Dalio, Westport, CT
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2698, 'Ray Dalio', 'Founder', 'Bridgewater Associates', 'UHNW Individual', 'B', 0,
  '', 'Corporate contact only', '(203) 226-3030', 'Westport', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Bridgewater Associates (world''s largest hedge fund by AUM, ~$92B) -- fully divested his ownership stake by 2025 but remains closely identified with the firm. Net worth estimates conflict wildly ($15-28B) -- not reconciled. Phone is Bridgewater corporate HQ, not personal.',
  'One Glendinning Place'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2698);

-- 2699 Thomas F. Frist Jr., Nashville, TN
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2699, 'Thomas F. Frist Jr.', 'Co-Founder', 'HCA Healthcare, Inc.', 'UHNW Individual', 'B', 0,
  'Frank.Morgan@hcahealthcare.com', 'Corporate contact only', '(615) 344-2688', 'Nashville', 'Tennessee', 'United States', 'United States',
  NULL, 'Unknown', 33000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, HCA Healthcare (NYSE: HCA), largest for-profit hospital operator in the US; wealthiest person in Tennessee. Net worth ~$32-34B (Forbes #48, 2026). Email/phone are HCA investor-relations (Frank Morgan, VP IR) corporate contacts, not personal.',
  'One Park Plaza'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2699);
