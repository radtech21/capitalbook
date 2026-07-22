-- UHNW individual expansion, batch: 15 Brazilian UHNW
-- individuals/families, added as brand-new contacts (ids 3014-3028).
-- Next available id after this batch is 3029.

-- 3014 Marinho Family (Grupo Globo)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3014, 'Marinho Family', 'Family Shareholders (Roberto Irineu, João Roberto, José Roberto Marinho)', 'Grupo Globo', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Rio de Janeiro', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 12000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Three billionaire brothers who inherited and jointly control Grupo Globo, Brazil''s largest media conglomerate (TV Globo, Globosat, largest newspaper group). Roberto Irineu Marinho was estimated ~$3.8B individually (Forbes, 2017); more recent real-time estimates likely higher but not independently confirmed. No published press/IR email or phone confirmed for Grupo Globo itself.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3014);

-- 3015 Moreira Salles Family (Itaú Unibanco)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3015, 'Pedro Moreira Salles', 'Family Shareholder / Co-Chairman', 'Itaú Unibanco Holding S.A. (via Itaúsa)', 'UHNW Individual', 'A', 0,
  'ri@itau-unibanco.com.br', 'Corporate contact only', '(11) 5019-8880', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 4000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Banking family founded by Walther Moreira Salles; controls Itaú Unibanco, Latin America''s largest private-sector bank, alongside stakes in CBMM (world''s leading niobium supplier). Forbes estimates for Pedro Moreira Salles individually range ~$2.6-6.1B, reported near midpoint. Email/phone are Itaú Unibanco''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3015);

-- 3016 Setubal Family (Itaúsa)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3016, 'Roberto Egydio Setubal', 'Family Shareholder / Co-Chairman', 'Itaúsa S.A. / Itaú Unibanco', 'UHNW Individual', 'A', 0,
  'ri@itau-unibanco.com.br', 'Corporate contact only', '(11) 5019-8880', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 2500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-controlling shareholder family of Itaúsa/Itaú Unibanco; Roberto Egydio Setubal was Itaú Unibanco''s CEO (1994-2017) and later co-chairman. Older Forbes figure (2012) cited Roberto and brother Ricardo Setubal combined at ~$2.5B; family did not appear as individual billionaires on more recent Forbes lists since wealth is held collectively via Itaúsa shares -- treat as dated estimate. Shares Itaú Unibanco''s corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3016);

-- 3017 Ermírio de Moraes Family (Votorantim)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3017, 'Ermírio de Moraes Family', 'Family Shareholders', 'Votorantim S.A.', 'UHNW Individual', 'A', 0,
  'votorantimri@votorantim.com', 'Corporate contact only', '', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 8000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). One of Brazil''s oldest industrial dynasties, controlling the diversified Votorantim conglomerate (cement, mining, metals, pulp, financial services), often cited as Brazil''s 3rd-richest family. Patriarch Antonio Ermírio de Moraes was estimated ~$3.9B at death (2014); son Ermírio Pereira de Moraes ~$3.2B (Dec 2014) -- both dated figures, current aggregate not confirmed. Email is Votorantim''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3017);

-- 3018 Joesley Batista (JBS)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3018, 'Joesley Batista', 'Co-Owner', 'JBS S.A.', 'UHNW Individual', 'A', 0,
  'ri@jbs.com.br', 'Corporate contact only', '+55 (11) 3144-4224', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 4500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Brother (with Wesley Batista) who built JBS from a Goias butcher shop into the world''s largest meat-processing company; central figure in the 2017 "Joesley Day" corruption plea-bargain scandal (public record). Net worth estimates ~$4-5B USD (also reported R$22.95-25B in Brazilian-real rankings). Email is JBS''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3018);

-- 3019 Wesley Batista (JBS)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3019, 'Wesley Batista', 'Co-Owner', 'JBS S.A.', 'UHNW Individual', 'A', 0,
  'ri@jbs.com.br', 'Corporate contact only', '+55 (11) 3144-4224', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 4500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Brother (with Joesley Batista) who built JBS from a Goias butcher shop into the world''s largest meat-processing company; also central to the 2017 "Joesley Day" corruption plea-bargain scandal (public record). Net worth estimates ~$4-5B USD (also reported R$22.95-25B in Brazilian-real rankings). Email is JBS''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3019);

-- 3020 Rubens Ometto (Cosan/Raízen)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3020, 'Rubens Ometto', 'Chairman', 'Cosan S.A.', 'UHNW Individual', 'A', 0,
  'ri@cosan.com', 'Corporate contact only', '+55 (11) 3897-9797', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 1800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Known as Brazil''s "ethanol king"; built Cosan into a major sugar, ethanol, fuel-distribution, and logistics conglomerate. Net worth peaked ~$7.5B (Forbes, 2021); more recent estimates ~$1.45-2B reflecting declines tied to the Raízen joint venture with Shell -- reported at the recent lower estimate. Email is Cosan''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3020);

-- 3021 Luiza Helena Trajano (Magazine Luiza)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3021, 'Luiza Helena Trajano', 'Chairwoman (former CEO)', 'Magazine Luiza S.A.', 'UHNW Individual', 'A', 0,
  'ri@magazineluiza.com.br', 'Corporate contact only', '+55 (11) 3504-2727', 'Franca', 'São Paulo', 'Brazil', 'Latin America',
  NULL, 'Unknown', 1200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairwoman and former CEO who transformed Magazine Luiza from a small regional retailer into one of Brazil''s largest omnichannel retail chains ("Magalu"); prominent businesswoman and philanthropist. Net worth highly volatile with the stock -- reached ~$5.6B at 2021 peak, fell out of billionaire ranks mid-2022, returned at ~$1.1-1.4B (Forbes, 2023). Email is Magazine Luiza''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3021);

-- 3022 David Feffer (Suzano)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3022, 'David Feffer', 'Chairman', 'Suzano S.A.', 'UHNW Individual', 'A', 0,
  'ri@suzano.com.br', 'Corporate contact only', '+55 (11) 3503-9330', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 1100, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Family (descended from founder Leon Feffer) chairs the board of Suzano, the world''s largest producer of eucalyptus pulp (formed via the 2019 Suzano-Fibria merger). Net worth estimates inconsistent across sources (~$1.1B USD vs R$7.1B) -- reported as the more conservative USD figure. Email is Suzano''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3022);

-- 3023 Alexandre Behring (3G Capital)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3023, 'Alexandre Behring', 'Managing Partner', '3G Capital', 'UHNW Individual', 'A', 0,
  'investor@rbi.com', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 6000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Brazilian-born co-founder and managing partner of 3G Capital (NY-based), the private-equity firm behind major global consumer-goods buyouts. Net worth ~$5.8-6.2B (Forbes, 2024-2025). 3G Capital itself has no public IR office; email is the verified IR contact for Restaurant Brands International, a related public 3G portfolio company.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3023);

-- 3024 Abílio Diniz Family (Grupo Pão de Açúcar)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3024, 'Diniz Family (Abílio Diniz legacy)', 'Founding Family (Abílio Diniz d. Feb 2024)', 'Grupo Pão de Açúcar (GPA)', 'UHNW Individual', 'A', 0,
  'gpa.ri@gpabr.com', 'Corporate contact only', '+55 11 3886-0024', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 1200, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founding family of Grupo Pão de Açúcar (GPA), a leading Brazilian supermarket chain, now majority-controlled by France''s Casino Group; Abílio Diniz (d. Feb 2024) remained chairman after Casino took operational control in 2012. Net worth ranged ~$1.2B (Bloomberg, at his death) up to ~$4.4B (Forbes, 2015) across different years -- reported near the more recent, conservative figure. Email is GPA''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3024);

-- 3025 Klabin Family
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3025, 'Klabin Family', 'Family Shareholders', 'Klabin S.A.', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Descendants of the founding Lithuanian-immigrant family; control Klabin S.A. (Brazil''s largest paper/pulp/packaging producer/exporter) via Klabin Irmãos & Cia and NIBLAK Participações. An older Forbes estimate (2014) valued one branch at ~$483M, below billion-dollar threshold; current aggregate not confirmed, net_worth_mm left NULL. IR contact form exists at ri.klabin.com.br, no direct email/phone confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3025);

-- 3026 Gerdau Family (Jorge Gerdau Johannpeter)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3026, 'Gerdau Family (Jorge Gerdau Johannpeter)', 'Family Shareholders / Former Chairman', 'Gerdau S.A.', 'UHNW Individual', 'A', 0,
  'inform@gerdau.com.br', 'Corporate contact only', '+55 11 3094 6300', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', NULL, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Descendants of German immigrant founder Joao Gerdau; family holds a 78.9% stake in Metalúrgica Gerdau S.A. and controls Gerdau, one of the largest steel producers in the Americas. Jorge Gerdau Johannpeter was CEO (1983-2006) and chairman until 2015. An older estimate (~2012/2014) placed the family at ~$926M, below $1B threshold; current aggregate not confirmed, net_worth_mm left NULL. Email is Gerdau''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3026);

-- 3027 Carlos Alberto Sicupira (3G Capital)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3027, 'Carlos Alberto Sicupira', 'Co-Founder', '3G Capital', 'UHNW Individual', 'A', 0,
  'investor@rbi.com', 'Corporate contact only', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', 8000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder of 3G Capital alongside Jorge Paulo Lemann and Marcel Telles (both already in CRM); historically also Ambev, AB InBev, RBI, Lojas Americanas; major shareholder in AB InBev, wealth substantially from that stake. Net worth ~$7.6-11B, reported near midpoint (Forbes ~$8B, Nov 2024). 3G has no public IR office; email is the verified IR contact for related portfolio company Restaurant Brands International.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3027);

-- 3028 Elie Horn (Cyrela Brazil Realty)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 3028, 'Elie Horn', 'Founder and President', 'Cyrela Brazil Realty S.A.', 'UHNW Individual', 'A', 0,
  'ri@cyrela.com.br', 'Corporate contact only', '(55 11) 4502-3153', 'São Paulo', '', 'Brazil', 'Latin America',
  NULL, 'Unknown', 1500, 'Real Estate', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Founded Cyrela in 1962, has served as its president since 1978, building it into Brazil''s largest publicly traded high-end residential real estate developer; first Brazilian signatory of the Giving Pledge. Net worth ranged ~$1.0B (Forbes, 2018) to ~$2.2B (2010) across various snapshots, on the Forbes billionaires list since 2006 -- reported near the more recent figure. Email is Cyrela''s verified corporate IR channel.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 3028);
