-- VC segment expansion, batch 3: 15 Europe-based VC firms, added as
-- brand-new contacts (ids 2490-2504). AUM/fund figures below are kept
-- in their native currency's nominal value (EUR/GBP), not FX-converted,
-- consistent with how existing seed data handles non-USD figures.
-- Next available id after this batch is 2505.

-- 2490 EQT Ventures, Stockholm, Sweden
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2490, 'EQT Ventures', 'Investment Team', 'EQT Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  2300, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early/growth-stage European tech, part of EQT Group''s private capital platform. Fund III closed €1.1B (2022); ~€2.3B cumulative across Funds I-III. Do not conflate with EQT Group''s much larger €267B total AUM.',
  'Regeringsgatan 25'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2490);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2490, x.name, x.role FROM (
  SELECT 'Carolina Brochado' AS name, 'Partner & Head of EQT Ventures' AS role
  UNION ALL SELECT 'Lars Jörnow', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2490) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2490 AND name = x.name);

-- 2491 Creandum, Stockholm, Sweden
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2491, 'Creandum', 'Investment Team', 'Creandum', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed/early-stage European tech (Spotify, Klarna, Lovable, Bolt). Fund VII closed €500M (2024), oversubscribed in 12 weeks. Flat 9-partner structure. Also offices Berlin, London, San Francisco.',
  '18 Jakobsbergsgatan'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2491);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2491, x.name, x.role FROM (
  SELECT 'Carl Fritjofsson' AS name, 'General Partner (San Francisco)' AS role
  UNION ALL SELECT 'Simon Schmincke', 'General Partner (Berlin)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2491) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2491 AND name = x.name);

-- 2492 Kinnevik, Stockholm, Sweden
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2492, 'Kinnevik', 'Investment Team', 'Investment AB Kinnevik', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  3300, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Publicly listed permanent-capital investment company (Nasdaq Stockholm), not a traditional closed-end fund -- flag before treating as a standard VC prospect. NAV SEK35.9B/SEK130 per share (Q4 2025, -4% YoY). Growth-stage software/health/climate focus.',
  'Skeppsbron 18'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2492);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2492, x.name, x.role FROM (
  SELECT 'Georgi Ganev' AS name, 'CEO' AS role
  UNION ALL SELECT 'James Anderson', 'Chairman'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2492) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2492 AND name = x.name);

-- 2493 Cherry Ventures, Berlin, Germany
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2493, 'Cherry Ventures', 'Investment Team', 'Cherry Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Berlin', '', 'Germany', 'Europe',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-European founder-first early-stage (pre-seed/seed) investor, founded 2012. $500M raised (Feb 2025), split flagship early-stage + Series B+ opportunity fund. ~$1B total AUM. Also London, Stockholm offices.',
  'Linienstraße 214'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2493);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2493, x.name, x.role FROM (
  SELECT 'Filip Dames' AS name, 'Co-Founder & Partner' AS role
  UNION ALL SELECT 'Christian Meermann', 'Co-Founder & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2493) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2493 AND name = x.name);

-- 2494 Point Nine Capital, Berlin, Germany
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2494, 'Point Nine Capital', 'Investment Team', 'Point Nine Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Berlin', '', 'Germany', 'Europe',
  180, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Seed-stage B2B SaaS/marketplace specialist, Europe + North America. Most recent confirmed fund: €180M Fund VI (Sept 2022) -- no newer fund confirmed, possibly outdated. Also London, Zurich offices.',
  'Torstraße 19'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2494);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2494, x.name, x.role FROM (
  SELECT 'Christoph Janz' AS name, 'Co-Founder & Partner' AS role
  UNION ALL SELECT 'Pawel Chudzinski', 'Co-Founder & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2494) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2494 AND name = x.name);

-- 2495 Earlybird Venture Capital, Berlin, Germany
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2495, 'Earlybird Venture Capital', 'Investment Team', 'Earlybird Venture Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Berlin', '', 'Germany', 'Europe',
  360, 'Boutique (<$500M)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Western Europe early/growth-stage, deep-tech angle, founded 1997. Fund VIII closed €360M (Apr 2026), largest to date. CEE arm (Digital East) spun off independent 2024.',
  'Münzstraße 21'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2495);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2495, x.name, x.role FROM (
  SELECT 'Hendrik Brandis' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Christian Nagel', 'Co-Founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2495) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2495 AND name = x.name);

-- 2496 HV Capital, Munich, Germany
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2496, 'HV Capital', 'Investment Team', 'HV Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Munich', '', 'Germany', 'Europe',
  2800, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Holtzbrinck Ventures. Multi-stage German/European tech (Zalando, Delivery Hero, FlixBus). Fund IX ~€710-783M (closed May 2023). Total AUM €2.8B across 9 fund generations. Also Berlin office.',
  'Kaiserstraße 14b'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2496);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2496, x.name, x.role FROM (
  SELECT 'Lars Langusch' AS name, 'Managing Partner' AS role
  UNION ALL SELECT 'Rainer Märkle', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2496) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2496 AND name = x.name);

-- 2497 Speedinvest, Vienna, Austria
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2497, 'Speedinvest', 'Investment Team', 'Speedinvest', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Vienna', '', 'Austria', 'Europe',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed/seed/early-stage across Europe, sector-specialist teams. 6 EMEA offices. Fund 4 closed €350M (Jan 2024); >€1B total AUM. Registered address possibly ambiguous -- an alternate Vienna address was also found.',
  'Nordbergstraße 1/1/71'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2497);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2497, x.name, x.role FROM (
  SELECT 'Oliver Holle' AS name, 'Founder, CEO & Managing Partner' AS role
  UNION ALL SELECT 'Marie-Helene Ametsreiter', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2497) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2497 AND name = x.name);

-- 2498 LocalGlobe / Latitude (Phoenix Court), London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2498, 'LocalGlobe / Latitude', 'Investment Team', 'LocalGlobe / Latitude (Phoenix Court)', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  500, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pre-seed through growth/IPO continuum, London/UK-anchored, "New Palo Alto" thesis. No verified street address found (King''s Cross, "Phoenix Court" only). $500M raised (2022) -- no 2023-2026 fund data found, possibly stale.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2498);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2498, x.name, x.role FROM (
  SELECT 'Saul Klein' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Robin Klein', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2498) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2498 AND name = x.name);

-- 2499 Seedcamp, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2499, 'Seedcamp', 'Investment Team', 'Seedcamp', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  1000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Europe''s original "first-check" pan-European pre-seed/seed investor. $320M raised (Jun 2026) across $220M Fund VII (flagship, largest to date) + $100M Select (Series B+). Total AUM surpassed $1B.',
  '12 Little Portland Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2499);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2499, x.name, x.role FROM (
  SELECT 'Reshma Sohoni' AS name, 'Co-Founder & Managing Partner' AS role
  UNION ALL SELECT 'Carlos Eduardo Espinal', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2499) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2499 AND name = x.name);

-- 2500 Octopus Ventures, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2500, 'Octopus Ventures', 'Investment Team', 'Octopus Ventures Limited', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  1800, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Part of Octopus Group. Early-to-growth UK/European tech, sector-specialist model (fintech, deep tech, health, consumer). AUM ~GBP1.8B. No confirmed #2 leader below CEO -- verify org structure before outreach.',
  '33 Holborn'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2500);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2500, x.name, x.role FROM (
  SELECT 'Erin Platts' AS name, 'CEO (since Jan 2025)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2500) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2500 AND name = x.name);

-- 2501 Molten Ventures, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2501, 'Molten Ventures', 'Investment Team', 'Molten Ventures plc', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  1900, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Draper Esprit; LSE/Euronext Dublin-listed permanent-capital vehicle, not a traditional closed fund. Multi-stage European deep tech/software. AUM ~GBP1.9B (end-Mar 2025, up from GBP1.2B in 2024). Also Cambridge, Dublin offices.',
  '20 Garrick Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2501);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2501, x.name, x.role FROM (
  SELECT 'Ben Wilkinson' AS name, 'CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2501) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2501 AND name = x.name);

-- 2502 Partech, Paris, France
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2502, 'Partech', 'Investment Team', 'Partech', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  2500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage (seed to growth), global with strong France/Africa/US presence, 220 portfolio companies in 40 countries. Partech Africa II closed €280M/$300M+ (Feb 2024), largest Africa-dedicated VC fund. Total firm AUM €2.5B.',
  '7-11 Boulevard Haussmann'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2502);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2502, x.name, x.role FROM (
  SELECT 'Jean-Marc Patouillaud' AS name, 'Founding Partner & Senior Advisor' AS role
  UNION ALL SELECT 'Philippe Collombel', 'Founding & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2502) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2502 AND name = x.name);

-- 2503 Target Global, London, UK
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2503, 'Target Global', 'Investment Team', 'Target Global', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'London', '', 'United Kingdom', 'Europe',
  3000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Pan-European early-to-growth stage, 15+ unicorns, 21 exits. Also strong Berlin presence; Israel-linked founders. €3B+ AUM across 6 funds. LPs incl. FERI, UBS, Allianz X, Mubadala. Registered address possibly ambiguous -- an alternate London address was also found.',
  '16-19 Eastcastle Street'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2503);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2503, x.name, x.role FROM (
  SELECT 'Shmuel Chafets' AS name, 'Co-Founder & General Partner' AS role
  UNION ALL SELECT 'Yaron Valler', 'Co-Founder & General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2503) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2503 AND name = x.name);

-- 2504 Lakestar, Zurich, Switzerland
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2504, 'Lakestar', 'Investment Team', 'Lakestar', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Zurich', '', 'Switzerland', 'Europe',
  6000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-to-growth European tech (Spotify, Revolut), diversifying into defense/dual-use. $600M fund (Apr 2024); $265M continuation fund + $300M Resilience Fund I (2025). Firm reports >$6B current AUM -- large jump vs. an older ~€2B figure, verify. No street address found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2504);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2504, x.name, x.role FROM (
  SELECT 'Klaus Hommels' AS name, 'Founder & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2504) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2504 AND name = x.name);
