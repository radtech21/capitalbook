-- VC segment expansion, batch 12: 15 Canadian VC firms, added as
-- brand-new contacts (ids 2670-2684). AUM figures kept in native
-- currency nominal value (CAD/USD as reported), not FX-converted.
-- Next available id after this batch is 2685.

-- 2670 Whitecap Venture Partners, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2670, 'Whitecap Venture Partners', 'Investment Team', 'Whitecap Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  150, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage VC across ICT, MedTech, Food/FoodTech. Whitecap V closed CAD$150M (2021) -- no newer fund found, may be outdated. Address from a directory source, not independently confirmed.',
  '22 St. Clair Avenue East, Suite 1010'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2670);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2670, x.name, x.role FROM (
  SELECT 'Carey Diamond' AS name, 'Managing Director' AS role
  UNION ALL SELECT 'Russell Samuels', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2670) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2670 AND name = x.name);

-- 2671 Panache Ventures, Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2671, 'Panache Ventures', 'Investment Team', 'Panache Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Canada''s leading pre-seed/seed fund, national coverage (Toronto, Montreal, Calgary, Vancouver); $1-1.5M checks. Fund II closed CAD$100M. HQ city conflicting across sources (Montreal vs. Toronto) -- verify. Ex-Partner Chris Neumann has departed.',
  '3 Place Ville Marie, Suite 12350'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2671);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2671, x.name, x.role FROM (
  SELECT 'Patrick Lor' AS name, 'Partner' AS role
  UNION ALL SELECT 'Scott Loong', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2671) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2671 AND name = x.name);

-- 2672 Version One Ventures, Vancouver, BC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2672, 'Version One Ventures', 'Investment Team', 'Version One Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Vancouver', 'British Columbia', 'Canada', 'Canada',
  108, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage/seed investor in marketplaces, SaaS, crypto/web3, global reach from a Canadian base. Also has an SF presence. Closed $108M USD across 2 vehicles (Jun 2 2026): Fund V $78M + Opportunities Fund III $30M. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2672);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2672, x.name, x.role FROM (
  SELECT 'Boris Wertz' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Angela Tran', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2672) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2672 AND name = x.name);

-- 2673 Yaletown Partners, Vancouver, BC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2673, 'Yaletown Partners', 'Investment Team', 'Yaletown Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Vancouver', 'British Columbia', 'Canada', 'Canada',
  600, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage investor in industrial tech, cleantech, enterprise software. ~CAD$600M total AUM. Innovation Growth Fund III first close CAD$100M (a separately-cited "$250M" appears to be the fund target). Also offices Calgary, Edmonton, Toronto, Montreal.',
  '1122 Mainland Street, Suite 510'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2673);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2673, x.name, x.role FROM (
  SELECT 'Hans Knapp' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Salil Munjal', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2673) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2673 AND name = x.name);

-- 2674 ScaleUP Ventures, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2674, 'ScaleUP Ventures', 'Investment Team', 'ScaleUP Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage B2B-focused VC. First fund closed CAD$100M (~2016-17) -- no confirmed newer fund found, current fund status uncertain. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2674);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2674, x.name, x.role FROM (
  SELECT 'Kent Thexton' AS name, 'General Partner' AS role
  UNION ALL SELECT 'Derek Spratt', 'Partner & Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2674) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2674 AND name = x.name);

-- 2675 White Star Capital (Canada), Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2675, 'White Star Capital', 'Investment Team (Canada)', 'White Star Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  360, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global multi-stage tech investor with strong Canadian roots (co-founders Canadian); global HQ New York, Canadian offices Toronto/Montreal. >$500M USD total AUM; Fund III closed $360M USD (2021). Dedicated North American Seed Fund first close $25M (Sept 2025), targeting $50M.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2675);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2675, x.name, x.role FROM (
  SELECT 'Eric Martineau-Fortin' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Jean-François Marcoux', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2675) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2675 AND name = x.name);

-- 2676 Radical Ventures, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2676, 'Radical Ventures', 'Investment Team', 'Radical Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  650, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). AI-exclusive VC, early- and growth-stage. Fund III closed $650M USD (Oct 2025, largest to date); also runs an $800M USD AI growth fund (Aug 2024). Total AUM ~$1.8B. Street address conflicting across sources -- verify.',
  '661 University Avenue, Suite 470'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2676);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2676, x.name, x.role FROM (
  SELECT 'Jordan Jacobs' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Tomi Poutanen', 'Founding Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2676) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2676 AND name = x.name);

-- 2677 Two Small Fish Ventures, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2677, 'Two Small Fish Ventures', 'Investment Team', 'Two Small Fish Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  41, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Deep-tech early-stage investor covering Toronto and Kitchener-Waterloo. Fund III closed CAD$41M (~$30M USD). Street address conflicting across sources -- verify.',
  '101 College St, Suite 250'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2677);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2677, x.name, x.role FROM (
  SELECT 'Allen Lau' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Eva Lau', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2677) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2677 AND name = x.name);

-- 2678 Graphite Ventures, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2678, 'Graphite Ventures', 'Investment Team', 'Graphite Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  110, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage B2B SaaS, fintech, proptech, digital health, capital-efficient hardware. Fund IV closed CAD$110M (2021) -- possibly not the most current fund, verify.',
  'Waterfront Innovation Centre, Suite 200, Box 87-155 Queens Quay E.'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2678);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2678, x.name, x.role FROM (
  SELECT 'Aaron Bast' AS name, 'General Partner (Waterloo)' AS role
  UNION ALL SELECT 'Craig Leonard', 'General Partner (Toronto)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2678) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2678 AND name = x.name);

-- 2679 Thin Air Labs, Calgary, AB
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2679, 'Thin Air Labs', 'Investment Team', 'Thin Air Labs', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Calgary', 'Alberta', 'Canada', 'Canada',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (pre-seed/seed) VC plus consulting/venture-building services, Alberta-rooted. Fund I targeting CAD$100M -- raise appears still in progress, final close unconfirmed.',
  '838 11th Ave SW, Suite 202'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2679);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2679, x.name, x.role FROM (
  SELECT 'Rick Bird' AS name, 'General Partner, Fund I' AS role
  UNION ALL SELECT 'Raghu Bharat', 'General Partner, Fund I'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2679) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2679 AND name = x.name);

-- 2680 Northleaf Capital Partners, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2680, 'Northleaf Capital Partners', 'Investment Team', 'Northleaf Capital Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  30000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Global private-markets fund-of-funds/direct investor spanning PE, private credit, infrastructure, and venture -- a much larger multi-strategy platform than a pure early-stage VC, flag for CRM categorization. >$30B USD total AUM/commitments (range $28-31B across sources).',
  '79 Wellington St W, 6th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2680);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2680, x.name, x.role FROM (
  SELECT 'Stuart Waugh' AS name, 'Managing Director & Managing Partner' AS role
  UNION ALL SELECT 'Michael Flood', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2680) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2680 AND name = x.name);

-- 2681 Mistral Venture Partners, Ottawa, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2681, 'Mistral Venture Partners', 'Investment Team', 'Mistral Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Ottawa', 'Ontario', 'Canada', 'Canada',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage enterprise software and AI-focused investor. Also offices Toronto, Vancouver, Los Angeles. Fund IV total size not confirmed (Fonds de solidarite FTQ contributed CAD$7.5M as an LP, Nov 2024); earlier Funds I-II raised ~CAD$60M combined.',
  '854 Bank Street, Suite 201'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2681);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2681, x.name, x.role FROM (
  SELECT 'Bernie Zeisig' AS name, 'Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2681) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2681 AND name = x.name);

-- 2682 Garage Capital, Kitchener, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2682, 'Garage Capital', 'Investment Team', 'Garage Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Kitchener', 'Ontario', 'Canada', 'Canada',
  100, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder-led seed-stage fund, strong Y Combinator-alumni focus, $1-5M checks. ~CAD$100M current fund (aggregator-sourced, not independently confirmed via press release). City cited as either Kitchener or Waterloo across sources.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2682);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2682, x.name, x.role FROM (
  SELECT 'Michael Litt' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Mike McCauley', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2682) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2682 AND name = x.name);

-- 2683 Luge Capital, Montreal, QC
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2683, 'Luge Capital', 'Investment Team', 'Luge Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Montreal', 'Quebec', 'Canada', 'Canada',
  180, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Fintech and insurtech-focused seed/Series A investor. Fund II closed CAD$96M; ~CAD$180M total AUM across 2 funds. LPs incl. CDPQ, Desjardins, Sun Life, iA. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2683);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2683, x.name, x.role FROM (
  SELECT 'David Nault' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Karim Gillani', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2683) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2683 AND name = x.name);

-- 2684 StandUp Ventures, Toronto, ON
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2684, 'StandUp Ventures', 'Investment Team', 'StandUp Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Toronto', 'Ontario', 'Canada', 'Canada',
  35, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage fund backing high-growth ventures with at least one female founder in a key leadership role. Fund II ~CAD$30-35M (figures not fully reconciled across sources). LPs incl. BDC Capital, Northleaf, Teralys, RBC, Vancity. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2684);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2684, x.name, x.role FROM (
  SELECT 'Michelle McBane' AS name, 'Managing Director & Co-Founder' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2684) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2684 AND name = x.name);
