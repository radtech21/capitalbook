-- UHNW individual expansion, batch: 15 US hedge fund billionaires,
-- added as brand-new contacts (ids 2984-2998). Next available id
-- after this batch is 2999. Corporate contacts below are only
-- populated where a source strongly indicated an official
-- firm-published address; several research agents this batch could
-- not independently re-fetch pages (proxy 403s) so some contacts are
-- flagged lower-confidence in data_flags rather than being dropped or
-- fabricated -- reachable/email_status reflect that caveat.

-- 2984 Kenneth C. Griffin
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2984, 'Kenneth C. Griffin', 'Founder and CEO', 'Citadel', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 50000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/CEO of Citadel (multi-strategy hedge fund) and majority owner of market-maker Citadel Securities; relocated firm HQ Chicago to Miami in 2022. Net worth range $48-55B across sources, reported near midpoint. Citadel has an official newsroom at citadel.com/news -- specific press email not independently re-confirmed this session, left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2984);

-- 2985 Raymond T. Dalio
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2985, 'Raymond T. Dalio', 'Founder', 'Bridgewater Associates', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Westport', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', 18000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Bridgewater Associates (historically the world''s largest hedge fund); stepped down as CEO 2017, retired as co-CIO 2022, exited his remaining ownership stake by 2025 -- wealth now mostly outside the firm. Net worth estimates span $15-21.5B, high uncertainty; reported near midpoint. No dedicated press email confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2985);

-- 2986 Steven A. Cohen
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2986, 'Steven A. Cohen', 'Founder and CEO', 'Point72 Asset Management', 'UHNW Individual', 'A', 0,
  'pressinquiries@point72.com', 'Corporate contact only', '', 'Stamford', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', 21500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/CEO of Point72 (successor to SAC Capital, which pleaded guilty to insider trading in 2013); also owner of the New York Mets. Net worth ~$21-23B across sources. Email is a search-indexed Point72 press contact, not independently re-verified via direct page load this session -- confirm before use.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2986);

-- 2987 Israel A. Englander
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2987, 'Israel A. Englander', 'Founder and Co-CEO', 'Millennium Management', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 22000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder and co-CEO of Millennium Management, one of the largest multi-strategy hedge funds globally. Net worth widely divergent -- Forbes ~$18.9B (Sept 2025) vs Bloomberg ~$26.2B (Nov 2025), highly methodology-dependent; reported near midpoint. No verified official press/IR contact found (only unreliable data-broker listings surfaced).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2987);

-- 2988 David E. Shaw
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2988, 'David E. Shaw', 'Founder', 'D. E. Shaw & Co.', 'UHNW Individual', 'A', 0,
  'irweb@deshaw.com', 'Corporate contact only', '+1 (212) 478-0890', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 10000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of D.E. Shaw, a pioneering quantitative/algorithmic hedge fund; former Columbia University computer science professor. Net worth ~$8.8-12B across sources, reported near midpoint. D.E. Shaw maintains a dedicated IR portal (investors.deshaw.com) -- most credibly "official" contact found in this research, though not independently re-loaded this session.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2988);

-- 2989 Paul Tudor Jones II
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2989, 'Paul Tudor Jones II', 'Founder', 'Tudor Investment Corporation', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Stamford', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', 8000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Tudor Investment Corporation, a macro-trading hedge fund; also a prominent philanthropist and co-founder of the Robin Hood Foundation. Net worth ~$7.9-8.1B per Forbes-linked estimates (2026). No published press/media email found; no verified public corporate contact.',
  '200 Elm St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2989);

-- 2990 John A. Paulson
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2990, 'John A. Paulson', 'Founder', 'Paulson & Co.', 'UHNW Individual', 'A', 0,
  'media@paulsonco.com', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 3700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Paulson & Co., famous for profiting from the 2007-08 subprime mortgage collapse ("the greatest trade ever"). Net worth estimates cluster ~$3.5-4B (a lower $1.8B shareholding-based figure uses a different, narrower methodology). Email is a search-indexed paulsonco.com contact, not independently re-verified this session.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2990);

-- 2991 William A. Ackman
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2991, 'William A. Ackman', 'Founder and CEO', 'Pershing Square Capital Management', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 9500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/CEO of Pershing Square Capital Management (activist hedge fund); holding entity Pershing Square Inc. began trading on NYSE in April 2026. Net worth highly volatile in 2026 -- cited $8.4B to $11.2B across the year as IPO tied wealth to a public vehicle; reported near midpoint. Formal IR/press pages exist at pershingsquareinc.com but specific contacts not independently confirmed this session.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2991);

-- 2992 Chase Coleman III (individual)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2992, 'Chase Coleman III', 'Founder', 'Tiger Global Management', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 7100, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Personal UHNW record for Chase Coleman, distinct from the Tiger Global Management firm contact (id 2939) already in the CRM. Previously worked for Julian Robertson at Tiger Management. Net worth ~$6-7.1B across sources. No verified published corporate press email found; recommend the contact form at tigerglobal.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2992);

-- 2993 Philippe Laffont (individual)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2993, 'Philippe Laffont', 'Founder and Managing Partner', 'Coatue Management', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 7900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Personal UHNW record for Philippe Laffont, distinct from the Coatue Management firm contact (id 2940) already in the CRM. Net worth ~$7.9B per Forbes (2026). No dedicated press email/phone found (public press page exists at coatue.com/blog/press).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2993);

-- 2994 Daniel S. Loeb
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2994, 'Daniel S. Loeb', 'Founder and CEO', 'Third Point LLC', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '212-715-6707', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 3900, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder/CEO of Third Point, an activist hedge fund known for public letters challenging corporate boards; HQ 55 Hudson Yards, NY. Net worth ~$3.3-4B (Forbes ~$3.9B, June 2026). Phone is the published general contact number at thirdpoint.com/contact-us; no specific press email confirmed.',
  '55 Hudson Yards'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2994);

-- 2995 Clifford S. Asness
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2995, 'Clifford S. Asness', 'Co-Founder, Managing Principal and CIO', 'AQR Capital Management', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Greenwich', 'Connecticut', 'United States', 'United States',
  NULL, 'Unknown', 6300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder, Managing Principal, and CIO of AQR Capital Management (systematic/quantitative investment firm). Net worth ~$6.3B (Forbes, March 2026) -- up sharply from ~$2-2.9B cited in 2024/2025 sources reflecting AQR''s AUM growth, notably volatile. A press contact name/email surfaced via press-release boilerplate but was not independently re-confirmed this session, left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2995);

-- 2996 James H. Simons (estate / Renaissance Technologies legacy)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2996, 'James H. Simons (Estate / Simons Foundation)', 'Founder (deceased May 2024)', 'Renaissance Technologies / Simons Foundation', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '631-444-7000', 'East Setauket', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 31400, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Renaissance Technologies and its Medallion Fund, the most successful quant hedge fund manager in history; died May 10, 2024. Net worth ~$31.4B at death (Forbes 2024, #55 globally) -- last documented figure, no post-death estate valuation exists. Philanthropy continues via Simons Foundation (separate entity), co-led by widow Marilyn Simons. Phone is Renaissance Technologies'' general line.',
  '600 Route 25A'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2996);

-- 2997 Leon G. Cooperman
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2997, 'Leon G. Cooperman', 'Founder', 'Omega Family Office', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 2800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Omega Advisors (converted to Omega Family Office in 2018, now managing primarily his own wealth); former Chairman/CEO of Goldman Sachs Asset Management. Net worth estimates $2.5-3.2B (2026, inconsistent sources), reported near midpoint. No independently verifiable published corporate contact found -- a data-broker-sourced email was excluded per no-fabrication policy.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2997);

-- 2998 Stanley F. Druckenmiller
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2998, 'Stanley F. Druckenmiller', 'Founder', 'Duquesne Family Office', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 4800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Duquesne Family Office (formerly Duquesne Capital Management, closed to outside investors 2010); formerly lead portfolio manager of George Soros''s Quantum Fund, credited with helping "break the Bank of England" in 1992. Net worth figures inconsistent across sources (~$2.8B vs ~$6.9B) -- reported near midpoint, treat as unconfirmed pending a live Forbes profile check. No verified official website or press contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2998);
