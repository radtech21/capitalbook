-- UHNW individual expansion, batch 3: 15 Canadian UHNW individuals,
-- added as brand-new contacts (ids 2640-2654), per user request to
-- extend the UHNW pass to Canada. Several entries are family-level
-- fortunes with control concentrated in one family member but wealth
-- not individually disclosed -- flagged explicitly rather than
-- guessing a personal split. No personal email/phone/home address
-- found or guessed -- only public corporate contact routes.
-- Next available id after this batch is 2655.

-- 2640 David Thomson, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2640, 'David Thomson', 'Co-Chairman', 'The Woodbridge Company Ltd.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', 31800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-Chairman, Woodbridge Company (controls ~70% of Thomson Reuters); family also owns The Globe and Mail, Montreal Canadiens, Winnipeg Jets. Individual net worth ~$31.8B USD; family collectively ~$50B, Canada''s wealthiest family (Forbes, 2026).',
  '65 Queen Street West, Suite 2400'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2640);

-- 2641 Galen Weston Jr., Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2641, 'Galen Weston Jr.', 'Chairman & CEO', 'George Weston Limited; Chairman, Loblaw Companies Ltd.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', 20600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/CEO, George Weston Ltd.; Chairman, Loblaw Companies Ltd. (controls via Wittington Investments Ltd.). Net worth ~$20.6B CAD (Maclean''s 2025 Rich List) / ~$18B USD (2024 estimate). Routing via George Weston / Loblaw corporate IR.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2641);

-- 2642 Jim Irving, Saint John, NB
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2642, 'Jim Irving', 'Co-CEO', 'J.D. Irving, Limited', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Saint John', 'New Brunswick', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-CEO, J.D. Irving Ltd. (forestry, forest products, transportation, shipbuilding). No individual net worth figure publicly disclosed; family wealth several billion USD, exact split not public. Note: co-CEO/brother Robert Irving died May 19 2026 -- verify current leadership structure before outreach.',
  '300 Union St.'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2642);

-- 2643 Edward Rogers, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2643, 'Edward Rogers', 'Chairman', 'Rogers Communications Inc.', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Rogers Communications; Chair, Rogers Control Trust (controls ~97.5% of voting shares). Net worth estimates wildly divergent ($1.5B vs. $118M tied to narrow disclosed holdings) -- not reconciled; his family''s control of a company worth tens of billions is the more meaningful signal than any net-worth figure.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2643);

-- 2644 Lino Saputo Jr., Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2644, 'Lino Saputo Jr.', 'Chairman, President & CEO', 'Saputo Inc.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', 5700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/President/CEO, Saputo Inc. (dairy -- cheese, milk; ~$14B annual revenue). Net worth figure is family-level (~$5.5-5.9B, Forbes), not confirmed as his individual share. Routing via Saputo Inc. corporate IR (public company, TSX: SAP).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2644);

-- 2645 Jim Pattison, Vancouver, BC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2645, 'Jim Pattison', 'Chairman, CEO & Sole Owner', 'The Jim Pattison Group', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Vancouver', 'British Columbia', 'Canada', 'Canada',
  NULL, 'Unknown', 12000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/CEO/sole owner, The Jim Pattison Group (Canada''s 2nd-largest privately held company: packaging, food services, forestry, auto, media). Net worth ~$11.9-12.2B USD (Forbes 2026, #255 globally). Routing via Jim Pattison Group corporate HQ, Vancouver.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2645);

-- 2646 Paul Desmarais Jr., Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2646, 'Paul Desmarais Jr.', 'Chairman', 'Power Corporation of Canada & Power Financial Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Power Corporation of Canada / Power Financial Corp. Individual net worth not publicly disclosed; Desmarais family collectively ~CAD$9.96B (2024 estimate). Routing via Power Corp corporate IR (public company).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2646);

-- 2647 André Desmarais, Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2647, 'André Desmarais', 'Deputy Chairman', 'Power Corporation of Canada & Power Financial Corporation', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Deputy Chairman, Power Corporation of Canada / Power Financial Corp. Individual net worth not disclosed; part of the Desmarais family''s collective ~CAD$9.96B. Routing via Power Corp corporate IR.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2647);

-- 2648 Frank Stronach, Aurora, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2648, 'Frank Stronach', 'Founder', 'Stronach International Inc. (formerly Magna International)', 'UHNW Individual', 'C', 0,
  '', 'No public contact', '', 'Aurora', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Magna International -- fully divested his equity by 2013, wealth now held via family trusts/Stronach International/Stronach Group (horse racing). Net worth estimates wildly divergent ($5.2B vs. $1.6B) -- treat as uncertain. Routing via stronachinternational.com/about-us.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2648);

-- 2649 James (Jamie) Sobey, Stellarton, NS
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2649, 'James L.C.E. Sobey', 'Executive Chair', 'Empire Company Limited (Sobeys)', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Stellarton', 'Nova Scotia', 'Canada', 'Canada',
  NULL, 'Unknown', 2880, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Executive Chair, Empire Company Ltd. (Sobeys grocery, ~CAD$30-31B annual sales); operating CEO is now Pierre St-Laurent (non-family, appointed Nov 2025). Net worth figure is Sobey family-level (~CAD$2.88B), not individually confirmed. Routing via Empire Co. corporate IR (public, TSX: EMP.A).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2649);

-- 2650 Stephen Bronfman, Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2650, 'Stephen Bronfman', 'Executive Chairman', 'Claridge Inc.', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Executive Chairman, Claridge Inc. (family investment firm managing Bronfman/Seagram-derived wealth -- PE, real estate, public equities). No individual net worth figure verified; father Charles Bronfman was estimated ~$2.5B (2023), not Stephen''s own figure.',
  '1170 Rue Peel'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2650);

-- 2651 Daryl Katz, Edmonton, AB
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2651, 'Daryl Katz', 'Founder & Chairman', 'Katz Group of Companies; Owner, Edmonton Oilers', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Edmonton', 'Alberta', 'Canada', 'Canada',
  NULL, 'Unknown', 7200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Chairman, Katz Group (formerly Rexall pharmacy, sold to McKesson for CAD$3B, 2016; now sports/entertainment/real estate); owner, Edmonton Oilers (NHL). Net worth $7.2B USD (Forbes 2026, #542 globally), up from $5.8B in 2025.',
  '2700, 10111-104 Ave'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2651);

-- 2652 Michael Lee-Chin, Burlington, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2652, 'Michael Lee-Chin', 'Chairman & CEO', 'Portland Holdings Inc.', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Burlington', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', 1300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman/CEO, Portland Holdings Inc. (private investment holding company); Portland Private Equity. Net worth estimates range ~$1.1-1.5B (2026 sources vary). Routing via portlandpe.com/our-people/our-team/michael-lee-chin.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2652);

-- 2653 Pierre Beaudoin, Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2653, 'Pierre Beaudoin', 'Chairman of the Board', 'Bombardier Inc.', 'UHNW Individual', 'C', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of the Board, Bombardier Inc. (grandson of founder Joseph-Armand Bombardier); family controls ~47.8% of voting rights via dual-class shares. No current (2026) net worth figure verified -- last confirmed ranking was from a 2017 list, treat as stale.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2653);

-- 2654 Geoff Molson, Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2654, 'Geoff Molson', 'President, CEO & Co-Owner', 'Groupe CH (Montreal Canadiens, Bell Centre, Evenko)', 'UHNW Individual', 'B', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', 1250, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). President/CEO/co-owner (with brothers Andrew and Justin), Groupe CH; Molson family also holds a legacy stake tied to Molson Coors. Individually ~$1-1.5B (2025 estimate); family collectively ~CAD$1.75-2B. Routing via Groupe CH / Montreal Canadiens corporate offices.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2654);
