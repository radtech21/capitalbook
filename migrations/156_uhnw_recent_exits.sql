-- UHNW individual expansion, batch: 15 entrepreneurs with recent
-- (2023-2026) $500M+ liquidity events (IPO, acquisition, major
-- funding round), added as brand-new contacts (ids 3039-3053). Next
-- available id after this batch is 3054. This is a standard
-- wealth-management prospecting category: newly-liquid entrepreneurs
-- often seek financial advice shortly after a major exit.

-- 3039 Dylan Field
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3039, 'Dylan Field', 'Co-Founder and CEO', 'Figma', 'UHNW Individual', 'A', 0,
  'ir@figma.com', 'Corporate contact only', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 6300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Co-founder/CEO of Figma (design software); company IPO''d on NYSE July 31 2025, stock nearly tripled on debut. Owns ~11% of Figma, stake valued ~$6-6.6B after the pop; remains CEO. Email is Figma''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3039);

-- 3040 Sebastian Siemiatkowski
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3040, 'Sebastian Siemiatkowski', 'Co-Founder and CEO', 'Klarna', 'UHNW Individual', 'A', 0,
  'press@klarna.com', 'Corporate contact only', '', 'Stockholm', '', 'Sweden', 'Europe',
  NULL, 'Unknown', 1050, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Co-founder/CEO of Klarna (Swedish buy-now-pay-later giant); IPO''d on NYSE Sept 10 2025 (priced $40/share, raised $1.37B). His ~7% stake was worth ~$1-1.1B at IPO; remains CEO. Email is Klarna''s verified corporate press channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3040);

-- 3041 Jeremy Allaire
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3041, 'Jeremy Allaire', 'Co-Founder and CEO', 'Circle Internet Group', 'UHNW Individual', 'A', 0,
  'investors@circle.com', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 2500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Co-founder/CEO of Circle Internet Group (issuer of USDC stablecoin); IPO''d on NYSE June 5 2025, raising ~$1.1B, shares surged up to 235% on debut. Net worth estimated $1.7-3B in following months, reported near midpoint; remains CEO. Email is Circle''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3041);

-- 3042 Philip Fayer
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3042, 'Philip Fayer', 'Founder, Chair and CEO', 'Nuvei Corporation', 'UHNW Individual', 'A', 0,
  'IR@nuvei.com', 'Corporate contact only', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  NULL, 'Unknown', 1500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/Chair/CEO of Nuvei Corporation (Canadian fintech/payments); taken private by Advent International (with Novacap and CDPQ) valuing the company at ~$6.3B USD, deal completed Nov 15 2024. Rolled ~24% equity into the private company rather than fully cashing out; remains Chair/CEO. Email is Nuvei''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3042);

-- 3043 Anthony Casalena
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3043, 'Anthony Casalena', 'Founder, CEO and Chairman', 'Squarespace', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 1000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/CEO/Chairman of Squarespace (website builder); taken private by Permira in an all-cash deal valued ~$7.2B enterprise value ($46.50/share), completed Oct 17 2024. Rolled over most of his equity, remains a top shareholder and CEO. No specific IR/press contact confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3043);

-- 3044 Poppy Gustafsson
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3044, 'Poppy Gustafsson', 'Co-Founder (former CEO)', 'Darktrace', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Cambridge', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Co-founder of Darktrace (UK cybersecurity), acquired by Thoma Bravo for GBP4.3B (~$5.3B), deal completed Oct 2024 (she resigned as CEO shortly before). Became Baroness Gustafsson and served as UK Minister of State for Investment (Oct 2024-Sept 2025) -- a real public office, not corporate. Personal proceeds/net worth not publicly disclosed, net_worth_mm left NULL rather than guessed; no current corporate contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3044);

-- 3045 Lew Cirne
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3045, 'Lew Cirne', 'Founder and Executive Chairman', 'New Relic', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/Executive Chairman of New Relic (observability software); acquired by Francisco Partners and TPG for $6.5B, deal completed Nov 2023. Rolled over ~40% of his beneficial shareholdings rather than fully cashing out. Net worth not independently confirmed post-deal, figure is a rough estimate, flagged approximate. Press page at newrelic.com/about/newsroom.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3045);

-- 3046 Rob Bernshteyn
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3046, 'Rob Bernshteyn', 'General Partner (former Founder/CEO, Coupa)', 'Iconiq Growth', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founded and led Coupa Software (business-spend-management software, San Mateo, CA at time of sale); acquired by Thoma Bravo for $8.0B, deal completed Feb 28 2023. Departed Coupa in May 2023, shortly after close; now a General Partner at Iconiq Growth (id 2946 already in CRM) and a board member at PTC Inc. Personal proceeds not publicly disclosed, net_worth_mm left NULL.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3046);

-- 3047 Reggie Aggarwal
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3047, 'Reggie Aggarwal', 'Founder and CEO', 'Cvent', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Tysons', 'Virginia', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/CEO of Cvent (event-management software); acquired by Blackstone with an ADIA minority co-investment for $4.6B, deal closed June 2023 (announced March 14 2023). Remains Founder/CEO as of 2026. Personal proceeds/net worth not publicly disclosed, net_worth_mm left NULL. Corporate press contact exists at cvent.com/en/cvent-news-and-press-releases.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3047);

-- 3048 Ryan Smith
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3048, 'Ryan Smith', 'Founder and Executive Chairman', 'Qualtrics', 'UHNW Individual', 'A', 0,
  'investors@qualtrics.com', 'Corporate contact only', '', 'Provo', 'Utah', 'United States', 'United States',
  NULL, 'Unknown', 200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/Executive Chairman of Qualtrics (experience-management software); taken private by Silver Lake and CPP Investments for $12.5B, deal completed June 28 2023. Remaining stake post-deal reported at $200M+ (had already partially cashed out via the 2021 IPO/SAP relationship). Also separately Chairman of Smith Entertainment Group (owner of the Utah Jazz/Utah Mammoth). Email is Qualtrics'' verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3048);

-- 3049 Will Shu
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3049, 'Will Shu', 'Founder (former CEO)', 'Deliveroo', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  NULL, 'Unknown', 220, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/CEO of Deliveroo (UK food-delivery); acquired by DoorDash for ~GBP2.9B (~$3.9-4B), deal completed Oct 2 2025. Received an estimated GBP170M (~$220M) from his ~6.5% stake and stepped down as CEO upon completion. No confirmed new corporate role post-departure; no current corporate contact found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3049);

-- 3050 Eric Baker
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3050, 'Eric Baker', 'Founder and CEO', 'StubHub Holdings', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder/CEO of StubHub Holdings (also founded Viagogo); IPO''d on NYSE Sept 17 2025, raising $800M at a ~$8.6B valuation. His ~9-10% stake (with supervoting B shares) was valued at roughly $760-818M, reported near midpoint; remains CEO. Investor relations exists at investors.stubhub.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3050);

-- 3051 Andrew Bialecki
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3051, 'Andrew Bialecki', 'Co-Founder and Co-CEO', 'Klaviyo', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', 3600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Co-founder/Co-CEO of Klaviyo (marketing-automation/CRM software); IPO''d NYSE Sept 20 2023, shares popped 23% on debut, making him a billionaire with a stake reported $3.2-4B, near midpoint. Remains Co-Founder/Co-CEO (2nd co-CEO Chano Fernandez appointed Jan 2026). IR at investors.klaviyo.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3051);

-- 3052 Assaf Rappaport
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3052, 'Assaf Rappaport', 'Co-Founder and CEO', 'Wiz (Google Cloud)', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Co-founder/CEO of Wiz (Israeli-founded cloud cybersecurity, dual HQ NY/Tel Aviv); acquired by Google in an all-cash deal valued $32B, the largest acquisition in Google''s history and largest Israeli tech exit ever, completed March 11 2026. Proceeds not publicly disclosed, net_worth_mm left NULL. Remains Co-Founder/CEO under Google Cloud, now an active angel investor.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3052);

-- 3053 Alexandr Wang
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3053, 'Alexandr Wang', 'Founder (former CEO), Scale AI / Co-Lead, Meta Superintelligence Labs', 'Scale AI / Meta', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 3600, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026): recent $500M+ liquidity event category. Founder of Scale AI (AI data-labeling); Meta invested $14.3B for a 49% non-voting stake in June 2025, valuing Scale at over $29B. Wang departed to lead Meta''s new Superintelligence Labs; his remaining ~14% stake made him one of the youngest self-made billionaires, net worth estimated $3.6B+ post-deal. Corporate contact via Meta corporate press (about.meta.com/news).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3053);
