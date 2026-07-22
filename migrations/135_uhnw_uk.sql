-- UHNW individual expansion, batch 7: 15 UK UHNW individuals/families,
-- added as brand-new contacts (ids 2730-2744). Net worth kept in GBP
-- nominal where that was the sourced figure (Sunday Times Rich List),
-- not FX-converted, consistent with non-USD figures elsewhere in this
-- project. Most official UK corporate contact pages blocked automated
-- verification (403) -- phone/email below are snippet-sourced from
-- those same official pages, flagged as needing a manual re-confirm.
-- Next available id after this batch is 2745.

-- 2730 Hugh Grosvenor, 7th Duke of Westminster, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2730, 'Hugh Grosvenor, 7th Duke of Westminster', 'Chairman', 'Grosvenor Group', 'UHNW Individual', 'A', 0,
  'Rachel.Garstang@Grosvenor.com', 'Corporate contact only', '+44 (0)20 7408 0988', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 9880, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, Grosvenor Group (real estate; distinct individual record from The Grosvenor Estate firm-level CRM entry). Net worth ~GBP9.88bn (Sunday Times Rich List, May 2025). Email/phone sourced from official page, could not be live-verified (403) -- recommend manual re-confirm.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2730);

-- 2731 Hinduja Family, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2731, 'Hinduja Family', 'Family Ownership', 'Hinduja Group', 'UHNW Individual', 'A', 0,
  'secretarial@hindujagroup.com', 'Corporate contact only', '+44-20-7839-4661', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 35300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Hinduja Group (banking/IndusInd Bank, Ashok Leyland, energy, BPO), Mumbai HQ with significant London presence. Net worth GBP35.3bn (Sunday Times Rich List 2025). Contact is the London office; sourced from official page, could not be live-verified (403).',
  '12 Charles II Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2731);

-- 2732 Sir Jim Ratcliffe, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2732, 'Sir Jim Ratcliffe', 'Founder & Majority Owner', 'INEOS', 'UHNW Individual', 'A', 0,
  'richard.longden@ineos.com', 'Corporate contact only', '+44 (0)20 3935 5355', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 17050, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/majority owner, INEOS (chemicals). Net worth GBP17.05bn (Sunday Times Rich List 2025) / ~$18.3bn (Forbes, 2026). Email is INEOS Oil & Gas division press contact, not a group-wide switchboard. Sourced from official page, could not be live-verified (403).',
  '38 Hans Crescent, Knightsbridge'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2732);

-- 2733 David and Simon Reuben, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2733, 'David and Simon Reuben', 'Founders', 'Reuben Brothers', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+44 (0)20 7802 5002', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 27900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Reuben Brothers (real estate, data centres/Global Switch, infrastructure). Net worth GBP27.9bn combined (Sunday Times Rich List 2026 reporting). An associated email (contact@reubros.com) was found but the domain could not be independently verified -- omitted rather than risk an inaccurate contact.',
  'Millbank Tower, 21-24 Millbank'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2733);

-- 2734 Sir Leonard Blavatnik, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2734, 'Sir Leonard Blavatnik', 'Founder & Chairman', 'Access Industries', 'UHNW Individual', 'A', 0,
  'AccessIndustries@HawthornAdvisors.com', 'Corporate contact only', '+1 212-247-6400', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 32000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/Chairman, Access Industries (Warner Music, industrials, real estate); Access HQ is New York, but he also maintains a major London base (Kensington Palace Gardens) and holds UK knighthood. Net worth GBP26.85bn / ~$32bn (Forbes, Apr 2026). Sourced from official page, could not be live-verified (403).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2734);

-- 2735 Denise Coates, Stoke-on-Trent, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2735, 'Denise Coates', 'Founder', 'Bet365', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+44 1782 684757', 'Stoke-on-Trent', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 9450, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Bet365 (with family: Peter and John Coates). Net worth GBP9.45bn family (Sunday Times Rich List 2025). Phone is Bet365 general corporate contact.',
  'Media Way'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2735);

-- 2736 Cadogan Family, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2736, 'Edward Cadogan, 9th Earl Cadogan', 'Chairman', 'Cadogan Estates / Cadogan Group', 'UHNW Individual', 'B', 0,
  'info@cadogan.co.uk', 'Corporate contact only', '020 7730 4567', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 6200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairs Cadogan Estates/Group (Chelsea property). Net worth ~$6.2B (Bloomberg Billionaires Index) -- no confirmed 2026 Sunday Times Rich List figure found. Sourced from official page, could not be live-verified (403).',
  '10 Duke of York Square'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2736);

-- 2737 Sir Richard Branson, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2737, 'Sir Richard Branson', 'Founder', 'Virgin Group', 'UHNW Individual', 'A', 0,
  'contactus@virgin.com', 'Corporate contact only', '', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 3400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, Virgin Group; primary residence Necker Island, Virgin Group HQ London. Net worth conflicting/unclear across current trackers ($2.8-4B range, 2026) -- re-verify before use. Email is a general Virgin inbox, not a personal line; sourced from official page, could not be live-verified (403).',
  'Whitfield Studios, 50a Charlotte Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2737);

-- 2738 Nick Candy and Christian Candy, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2738, 'Nick Candy and Christian Candy', 'Founders', 'Candy & Candy; Candy Capital', 'UHNW Individual', 'B', 0,
  'info@candycapital.com', 'Corporate contact only', '+44 (0)20 3841 9600', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Candy & Candy (real estate development); Nick runs Candy Capital. Net worth genuinely unconfirmed/low-confidence -- a historical joint figure (GBP1.5bn, 2010) is stale and conflicting modern estimates were not reconciled, not cited. Contact is for Nick Candy''s Candy Capital; no separate contact found for Christian Candy''s entities.',
  '49 Upper Brook Street, Mayfair'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2738);

-- 2739 John Caudwell, Staffordshire, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2739, 'John Caudwell', 'Founder', 'Caudwell (formerly Phones4u, sold 2006)', 'UHNW Individual', 'B', 0,
  'charity@caudwellchildren.com', 'Corporate contact only', '01782 433933', 'Staffordshire', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 1560, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founded Phones4u (sold 2006); now runs Caudwell investment holding and Caudwell Children charity. Net worth GBP1.56bn (Sunday Times Rich List 2026). Contact routes through the Caudwell Children charity (the public-facing entity) -- no separate contact found for the private investment business.',
  'Innovation Way, Keele'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2739);

-- 2740 Sir Chris Hohn, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2740, 'Sir Chris Hohn', 'Founder', 'TCI Fund Management', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+44 (0)20 7440 2330', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 11800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder, TCI Fund Management. Net worth $11.8B (Forbes, Jan 2026). No email found. Phone sourced from official page, could not be live-verified (403).',
  '7 Clifford Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2740);

-- 2741 Michael Platt, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2741, 'Michael Platt', 'Co-Founder', 'BlueCrest Capital Management', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+44 20 3180 3000', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 12480, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, BlueCrest Capital Management; also based Geneva. Net worth GBP12.48bn (Sunday Times Rich List 2026). Contact is directory-sourced (firm site blocked automated fetch, 403); very low-profile firm with no public press office.',
  '11 Bressenden Place'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2741);

-- 2742 Alan Howard, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2742, 'Alan Howard', 'Co-Founder', 'Brevan Howard Asset Management', 'UHNW Individual', 'A', 0,
  'enquiries@brevanhoward.com', 'Corporate contact only', '+44 20 7022 6250', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Brevan Howard Asset Management; Howard reportedly Switzerland-based, firm HQ London. Net worth conflicting across sources (GBP2.5-2.6bn Bloomberg vs. $3.3-4.3bn Forbes 2026) -- not reconciled, not cited. Sourced from official page, could not be live-verified (403).',
  '55 Baker St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2742);

-- 2743 Bamford Family (Lord Bamford), Rocester, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2743, 'Sir Anthony Bamford, Lord Bamford', 'Chairman', 'JCB', 'UHNW Individual', 'A', 0,
  'info@jcb.com', 'Corporate contact only', '+44 800 083 8015', 'Rocester', 'Staffordshire', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 9450, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman, JCB (construction/agricultural equipment). Net worth reported GBP9.45bn family (2024 reporting, possibly dated -- Forbes 2026 ranks the family #341 globally without a clean figure captured, re-check current year). A second phone number (+44 1889 590312) was also found -- verify which is current.',
  'JCB World Headquarters, Lakeside Works'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2743);

-- 2744 Issa Brothers, Blackburn, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2744, 'Mohsin Issa and Zuber Issa', 'Co-Founders', 'EG Group', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '+44 1254 582111', 'Blackburn', 'Lancashire', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 6000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 1, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founders, EG Group (forecourts/convenience retail); consortium stake in Asda (Zuber reportedly exited his Asda holding as of Apr 2026). Net worth GBP6bn combined (Sunday Times Rich List 2025) -- re-check 2026 list given reported Asda ownership changes.',
  'Waterside, Haslingden Road'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2744);
