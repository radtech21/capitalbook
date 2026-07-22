-- UHNW individual expansion, batch: 15 continental Europe UHNW
-- individuals/families, added as brand-new contacts (ids 2805-2819).
-- Next available id after this batch is 2820. Johann Rupert is
-- deliberately included ONLY in this batch (not repeated in the
-- Latin America + Africa batch, where a research agent duplicated him).

-- 2805 Bernard Arnault
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2805, 'Bernard Arnault', 'Chairman and CEO', 'LVMH', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  NULL, 'Unknown', 170000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman and CEO of LVMH (luxury goods). Net worth ~$170B (2026 est., volatile with LVMH/luxury sector). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2805);

-- 2806 Axel Dumas (Hermes family)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2806, 'Axel Dumas', 'Executive Chairman', 'Hermes International', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  NULL, 'Unknown', 15000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Executive Chairman of Hermes, member of the Hermes founding family. Personal net worth ~$15B est. (2026); broader Hermes family collective wealth is far larger (~$150B+) but is not attributable to any one individual. No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2806);

-- 2807 Francois Pinault / Pinault family (Kering)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2807, 'Francois Pinault', 'Honorary Chairman', 'Kering / Artemis Group', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Paris', '', 'France', 'Europe',
  NULL, 'Unknown', 25000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founder of Kering (Gucci, Saint Laurent, Balenciaga), controls holding company Artemis with son Francois-Henri Pinault as CEO. Family net worth ~$25B est. (2026, volatile with Kering share price). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2807);

-- 2808 Mulliez family (Auchan/Decathlon)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2808, 'Mulliez Family', 'Family Shareholders', 'Association Familiale Mulliez (Auchan, Decathlon, Leroy Merlin)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Roubaix', '', 'France', 'Europe',
  NULL, 'Unknown', 45000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). One of France''s largest business dynasties (Auchan, Decathlon, Leroy Merlin, Kiabi and other AFM group retail brands), 800+ family shareholders. Collective family net worth ~$45B est. (2026), not attributable to a single named individual. No public contact found; treated as a family/group entry rather than one person.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2808);

-- 2809 Johann Rupert
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2809, 'Johann Rupert', 'Chairman', 'Richemont', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Geneva', '', 'Switzerland', 'Europe',
  NULL, 'Unknown', 15000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Richemont (Cartier, Van Cleef & Arpels, Montblanc); also has substantial South African business interests (Remgro). Net worth ~$15B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2809);

-- 2810 Wallenberg family (Investor AB)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2810, 'Wallenberg Family', 'Controlling Family Shareholders', 'Investor AB / Wallenberg Foundations', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Stockholm', '', 'Sweden', 'Europe',
  NULL, 'Unknown', 20000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Sweden''s most prominent business dynasty, controls Investor AB (stakes in Ericsson, ABB, Atlas Copco, SEB and others) mainly via family foundations rather than direct personal ownership. Attributable family wealth ~$20B est. (2026), highly approximate given the foundation structure. No public contact found; treated as a family/group entry.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2810);

-- 2811 Kamprad family / Ikano Group (IKEA heirs)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2811, 'Kamprad Family', 'Family Shareholders', 'Ikano Group (IKEA-affiliated)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Leiden', '', 'Netherlands', 'Europe',
  NULL, 'Unknown', 10000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Heirs of IKEA founder Ingvar Kamprad, control Ikano Group (real estate, financial services, retail) separately from the IKEA Ingka/Inter IKEA foundation structure. Family net worth ~$10B est. (2026), highly approximate given IKEA''s opaque foundation ownership. No public contact found; treated as a family/group entry.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2811);

-- 2812 Klaus-Michael Kuehne
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2812, 'Klaus-Michael Kuehne', 'Honorary Chairman', 'Kuehne+Nagel', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Schindellegi', '', 'Switzerland', 'Europe',
  NULL, 'Unknown', 35000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Majority shareholder and Honorary Chairman of Kuehne+Nagel (global logistics), also large shareholder in Lufthansa and Hapag-Lloyd. Net worth ~$35B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2812);

-- 2813 Dieter Schwarz
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2813, 'Dieter Schwarz', 'Owner (via Schwarz Group / Dieter Schwarz Stiftung)', 'Schwarz Group (Lidl, Kaufland)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Neckarsulm', '', 'Germany', 'Europe',
  NULL, 'Unknown', 45000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Owner of Schwarz Group (Lidl and Kaufland discount retail chains), Germany''s largest retailer. Net worth ~$45B est. (2026); ownership is largely held through the Dieter Schwarz Stiftung foundation. No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2813);

-- 2814 Albrecht family (Aldi)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2814, 'Albrecht Family', 'Family Shareholders', 'Aldi Nord / Aldi Sud', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Essen', '', 'Germany', 'Europe',
  NULL, 'Unknown', 40000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Descendants of Aldi founders Karl and Theo Albrecht, own the Aldi Nord and Aldi Sud discount grocery chains (split since a 1960 family division, held via foundations). Collective family net worth ~$40B est. (2026), not attributable to a single named individual. No public contact found; treated as a family/group entry.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2814);

-- 2815 Susanne Klatten
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2815, 'Susanne Klatten', 'Shareholder / Deputy Chair', 'BMW / Altana', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Munich', '', 'Germany', 'Europe',
  NULL, 'Unknown', 28000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Major BMW shareholder (Quandt family heir) and majority owner of chemicals group Altana. Net worth ~$28B est. (2026, volatile with BMW share price). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2815);

-- 2816 Stefan Quandt
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2816, 'Stefan Quandt', 'Deputy Chairman, Supervisory Board', 'BMW', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Bad Homburg', '', 'Germany', 'Europe',
  NULL, 'Unknown', 22000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Major BMW shareholder, Deputy Chairman of BMW''s Supervisory Board (Quandt family heir, brother of Susanne Klatten). Net worth ~$22B est. (2026, volatile with BMW share price). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2816);

-- 2817 Georg Schaeffler
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2817, 'Georg Schaeffler', 'Majority Owner', 'Schaeffler Group / Continental (via Schaeffler)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Herzogenaurach', '', 'Germany', 'Europe',
  NULL, 'Unknown', 20000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Majority owner (with mother Maria-Elisabeth Schaeffler-Thumann) of the Schaeffler Group (automotive/industrial components), which also holds a large stake in Continental AG. Net worth ~$20B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2817);

-- 2818 Del Vecchio family (EssilorLuxottica)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2818, 'Del Vecchio Family', 'Family Shareholders', 'EssilorLuxottica (Delfin holding company)', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Milan', '', 'Italy', 'Europe',
  NULL, 'Unknown', 28000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Heirs of Luxottica founder Leonardo Del Vecchio (d. 2022), collectively control EssilorLuxottica (eyewear) via holding company Delfin. Collective family net worth ~$28B est. (2026), not attributable to a single named living individual. No public contact found; treated as a family/group entry.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2818);

-- 2819 Giovanni Ferrero
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2819, 'Giovanni Ferrero', 'Executive Chairman', 'Ferrero Group', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Alba', '', 'Italy', 'Europe',
  NULL, 'Unknown', 42000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Sole owner and Executive Chairman of the Ferrero Group (Nutella, Kinder, Ferrero Rocher, and Tic Tac, plus Nestle US confectionery acquisitions). Net worth ~$42B est. (2026). No verified personal contact found; no corporate contact confidently confirmed, so left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2819);
