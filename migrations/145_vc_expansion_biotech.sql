-- VC segment expansion, batch 18: 15 biotech/healthcare-focused VC
-- firms (US-based), added as brand-new contacts (ids 2879-2893). Next
-- available id after this batch is 2894.

-- 2879 Third Rock Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2879, 'Third Rock Ventures', 'Investment Team', 'Third Rock Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  2400, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Company-creation venture firm that builds and funds biotech startups from the ground up (e.g. Sage Therapeutics, Editas Medicine); co-founded by Mark Levin, Kevin Starr, Robert Tepper. AUM figures vary (~$2.4-3B; total capital raised since 2007 ~$3.8B incl. a recent $1.1B fund round) -- reported at the lower end, treat as approximate. Also has an SF office.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2879);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2879, x.name, x.role FROM (
  SELECT 'Mark Levin' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Kevin Starr', 'Co-Founder'
  UNION ALL SELECT 'Robert Tepper', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2879) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2879 AND name = x.name);

-- 2880 Flagship Pioneering
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2880, 'Flagship Pioneering', 'Investment Team', 'Flagship Pioneering', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cambridge', 'Massachusetts', 'United States', 'United States',
  14000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). "Bioplatform" venture-creation firm originating and building life-sciences, health, and sustainability companies from scratch; founder and CEO Noubar Afeyan, also co-founder/Chairman of Moderna. ~$14B AUM (July 2024); most recent capital raise $3.6B (2024).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2880);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2880, x.name, x.role FROM (
  SELECT 'Noubar Afeyan' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2880) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2880 AND name = x.name);

-- 2881 ARCH Venture Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2881, 'ARCH Venture Partners', 'Investment Team', 'ARCH Venture Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Chicago', 'Illinois', 'United States', 'United States',
  10000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage firm partnering with scientist-entrepreneurs to found and build biotech/life-sciences companies; co-founded by Robert Nelsen and Keith Crandell. Regulatory AUM reported at more than $10B per SEC Form ADV. Also offices Seattle, San Francisco, Dublin.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2881);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2881, x.name, x.role FROM (
  SELECT 'Robert Nelsen' AS name, 'Co-Founder and Managing Director' AS role
  UNION ALL SELECT 'Keith Crandell', 'Co-Founder and Managing Director'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2881) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2881 AND name = x.name);

-- 2882 Polaris Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2882, 'Polaris Partners', 'Investment Team', 'Polaris Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  5000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Multi-stage healthcare/biotech (and some technology) investor, founded 1996 by Terry McGuire; ~400 companies backed, 50+ therapies brought to market. ~$5.0B AUM/committed capital, investing via its tenth fund. Also offices New York, San Francisco.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2882);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2882, x.name, x.role FROM (
  SELECT 'Terry McGuire' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Amir Nashat', 'Managing Partner (Boston)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2882) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2882 AND name = x.name);

-- 2883 Atlas Venture
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2883, 'Atlas Venture', 'Investment Team', 'Atlas Venture', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Cambridge', 'Massachusetts', 'United States', 'United States',
  2700, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage, company-creation-focused biotech venture firm founded 1980. ~$2.7B AUM; most recent dedicated fund (Fund XIV) closed at $450M for early-stage biotech.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2883);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2883, x.name, x.role FROM (
  SELECT 'Bruce Booth' AS name, 'Partner' AS role
  UNION ALL SELECT 'Jean-Francois Formela', 'Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2883) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2883 AND name = x.name);

-- 2884 Versant Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2884, 'Versant Ventures', 'Investment Team', 'Versant Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  4700, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Healthcare/biotech-focused venture firm, portfolio of ~190 companies with 131 exits. AUM figures range ~$4.2B (2023) to ~$5.3B (more recent) -- reported near the midpoint. ~19 partners total; only Brad Bolzon could be confirmed by name from available research. Also offices Basel, New York, San Diego, Toronto, Vancouver.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2884);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2884, x.name, x.role FROM (
  SELECT 'Brad Bolzon' AS name, 'Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2884) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2884 AND name = x.name);

-- 2885 Sofinnova Investments
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2885, 'Sofinnova Investments', 'Investment Team', 'Sofinnova Investments', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  3300, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Life-sciences/healthcare investor, primarily therapeutics; founded 1976; ~118 companies funded, 55 IPOs, 30 M&As to date. ~$3.3B AUM reported. Distinct from the similarly-named, separately-operated Paris-headquartered "Sofinnova Partners" (>EUR4B AUM) -- the two share a common origin but are not the same firm; specific founder name not confirmed for this Menlo Park entity, no contact_people rows added.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2885);

-- 2886 Frazier Healthcare Partners
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2886, 'Frazier Healthcare Partners', 'Investment Team', 'Frazier Healthcare Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Seattle', 'Washington', 'United States', 'United States',
  6000, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Healthcare-focused investor spanning growth buyouts and life-sciences venture capital; founded by Alan D. Frazier (now Chairman Emeritus). AUM figures range ~$4.7B-$7.7B depending on source -- reported near the midpoint; total capital raised across firm history exceeds $11B. Also offices New York, Menlo Park.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2886);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2886, x.name, x.role FROM (
  SELECT 'Alan D. Frazier' AS name, 'Founder, Chairman Emeritus' AS role
  UNION ALL SELECT 'Nader Naini', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2886) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2886 AND name = x.name);

-- 2887 Domain Associates
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2887, 'Domain Associates', 'Investment Team', 'Domain Associates', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Princeton', 'New Jersey', 'United States', 'United States',
  2800, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Biopharmaceutical, medical device, and diagnostics venture investor; co-founded 1985 by Jim Blair and Brian Dovey. ~194 companies funded, ~90 IPOs and 110+ M&As over nearly four decades. ~$2.8B AUM. Also has a San Diego office.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2887);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2887, x.name, x.role FROM (
  SELECT 'Jim Blair' AS name, 'Co-Founder' AS role
  UNION ALL SELECT 'Brian Dovey', 'Co-Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2887) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2887 AND name = x.name);

-- 2888 OrbiMed
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2888, 'OrbiMed', 'Investment Team', 'OrbiMed', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  18000, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of the largest dedicated healthcare investment firms globally, spanning public equities, private venture, and royalty/credit investing in biotech/pharma/medtech; founder Samuel D. Isaly (now Chairman Emeritus). ~$18B AUM as of March 2024.',
  'Citigroup Center'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2888);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2888, x.name, x.role FROM (
  SELECT 'Samuel D. Isaly' AS name, 'Founder, Chairman Emeritus' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2888) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2888 AND name = x.name);

-- 2889 RA Capital Management
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2889, 'RA Capital Management', 'Investment Team', 'RA Capital Management', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Boston', 'Massachusetts', 'United States', 'United States',
  12600, 'Mega ($10B+)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Cross-over investor (public and private) in biotechnology; co-founder and CEO Peter Kolchinsky. ~$12.6B AUM reported. Dedicated venture vehicles: Nexus Fund I ($300M, 2019), Nexus Fund II ($461M, 2020), Nexus Fund III ($880M, 2021).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2889);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2889, x.name, x.role FROM (
  SELECT 'Peter Kolchinsky' AS name, 'Co-Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2889) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2889 AND name = x.name);

-- 2890 Deerfield Management
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2890, 'Deerfield Management', 'Investment Team', 'Deerfield Management', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Public and private investor across healthcare/biotechnology, considered one of the largest dedicated healthcare investment firms; founded 1994 by Arnold Snider (retired 2005), led since by James (Jim) Flynn (Managing Partner/CEO). Overall firm AUM not clearly confirmed, left Unknown. Recent dedicated venture funds: Healthcare Innovations Fund I ($550M, 2015), Fund II ($880M, 2020), Fund III ($600M, 2025).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2890);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2890, x.name, x.role FROM (
  SELECT 'James Flynn' AS name, 'Managing Partner and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2890) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2890 AND name = x.name);

-- 2891 Foresite Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2891, 'Foresite Capital', 'Investment Team', 'Foresite Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  3500, 'Large ($2B–10B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Healthcare investment firm spanning venture, growth, and public-market strategies in biotech/health tech; founder and CEO Jim Tananbaum, MD. ~$3.5B AUM; most recent fund (Fund VI) closed at $900M in June 2024. HQ city inconsistently reported across sources (LA vs SF Bay Area) -- also has offices in both.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2891);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2891, x.name, x.role FROM (
  SELECT 'Jim Tananbaum' AS name, 'Founder and CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2891) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2891 AND name = x.name);

-- 2892 5AM Ventures
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2892, '5AM Ventures', 'Investment Team', '5AM Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  750, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early-stage (primarily Series A) investor in private therapeutics companies; founding partner John D. Diekman, PhD, and Managing Partner Andy J. Schwab. $750M combined across most recent funds -- 5AM Ventures VII ($450M) and 5AM Opportunities II ($300M). Significant presence also in Boston/Menlo Park.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2892);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2892, x.name, x.role FROM (
  SELECT 'John D. Diekman' AS name, 'Founding Partner' AS role
  UNION ALL SELECT 'Andy J. Schwab', 'Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2892) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2892 AND name = x.name);

-- 2893 Longitude Capital
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2893, 'Longitude Capital', 'Investment Team', 'Longitude Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Menlo Park', 'California', 'United States', 'United States',
  2000, 'Mid ($500M–2B)', NULL, 'Venture Capital', NULL, '', 0, 0, 0,
  'Venture / growth capital', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Growth-stage healthcare venture investor in biotechnology, medical technology, health solutions; co-founded 2007 by Patrick Enright and Juliet Bakker. Nearly $2B in cumulative capital commitments raised across five funds since inception; one third-party tracker listed a much lower current figure (~$135M) -- the cumulative-raised figure is better documented and used here, treat as approximate.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2893);
INSERT INTO contact_people (contact_id, name, role)
SELECT 2893, x.name, x.role FROM (
  SELECT 'Patrick Enright' AS name, 'Managing Director and Founder' AS role
  UNION ALL SELECT 'Juliet Bakker', 'Managing Director and Founder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2893) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2893 AND name = x.name);
