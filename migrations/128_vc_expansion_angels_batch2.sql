-- VC segment expansion, batch 10: 15 more individual angel investors,
-- added as brand-new contacts (ids 2625-2639). Second angel batch --
-- distinct from the first 15 (migration 121). No personal email/phone/
-- address found or guessed for anyone. Next available id after this
-- batch is 2640.

-- 2625 Cyan Banister, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2625, 'Cyan Banister', 'Partner ("The Frontier")', 'Long Journey Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founded Long Journey Ventures with husband Scott Belsky; previously Partner at Founders Fund. Early personal angel checks in Uber, SpaceX. 74+ investments recorded, active into 2026. Routing via longjourney.vc / cyanbanister.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2625);

-- 2626 Aileen Lee, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2626, 'Aileen Lee', 'Founder & Managing Partner', 'Cowboy Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Coined the term "unicorn" (2013). Personal angel portfolio (17+ investments, separate from Cowboy Ventures fund activity): Dollar Shave Club, Crunchbase, Textio. Co-founded All Raise. Ex-Kleiner Perkins. Routing via cowboy.vc/team/aileen-lee.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2626);

-- 2627 Julia Hartz, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2627, 'Julia Hartz', 'Co-Founder & CEO', 'Eventbrite', 'Venture Capital / Growth', 'B', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founder/CEO, Eventbrite; became Executive Chair of its board in 2024 while remaining CEO. Active angel investor on the side, ~38 investments (Reddit, Skiff exits; unicorns Remote, Flock Safety). No dedicated personal contact route found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2627);

-- 2628 Esther Crawford, San Francisco Bay Area, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2628, 'Esther Crawford', 'Founder / Sequoia Scout', '', 'Venture Capital / Growth', 'B', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder of Squad (acquired by Twitter/X, ex-Director of Product); ex-Meta; now a Sequoia scout writing ~$25K checks in consumer products. Publicly invited outreach on X (@esthercrawford, "email me via link in bio") -- personal site esthercrawford.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2628);

-- 2629 Arlan Hamilton, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2629, 'Arlan Hamilton', 'Founder & Managing Partner', 'Backstage Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder/MP, Backstage Capital (seed fund for underrepresented founders -- women, people of color, LGBTQ+), 200+ investments since 2015. Self-made, formerly homeless before founding the fund. Official contact form at backstagecapital.com/contact/.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2629);

-- 2630 Charles Hudson, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2630, 'Charles Hudson', 'Founder & Managing Partner', 'Precursor Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Solo-GP first institutional check for software/hardware startups, strong focus on underrepresented founders. 200+ companies, 340+ founders backed. Ex-SoftTech VC (now Uncork Capital), Google, Zynga, In-Q-Tel. Routing via precursorvc.com/team.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2630);

-- 2631 Semil Shah, Mill Valley, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2631, 'Semil Shah', 'Founder & General Partner', 'Haystack', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Mill Valley', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founded seed fund Haystack (2013), Menlo Park-based; also venture partner at Lightspeed. Early investor DoorDash, Instacart, Figma, HashiCorp, Applied Intuition. Forbes Midas List Seed Investors 2022-2024. Routing via haystack.vc / semilshah.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2631);

-- 2632 Jeff Clavier, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2632, 'Jeff Clavier', 'Founder & Managing Partner', 'Uncork Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  100, 'Boutique (<$500M)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founded Uncork Capital (formerly SoftTech VC, 2004), a pioneer of the micro-VC model. 200+ investments since 2004 (Mint, Fitbit, Eventbrite, Postmates, Poshmark). Currently investing Fund VI (~$100M), ~12 seed deals/yr at ~$1.2M each. Routing via uncorkcapital.com/team.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2632);

-- 2633 Manu Kumar, Palo Alto, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2633, 'Manu Kumar', 'Founder ("Chief Firestarter")', 'K9 Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Palo Alto', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founded pre-seed fund K9 Ventures (2009), invests "when it''s an idea, not a product." Investor in Lyft, Twilio, Auth0, Carta. Also co-founder/board observer Carta, co-founder/CEO HiHello. Routing via k9ventures.com; a scraped third-party email exists but was not used/verified as official.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2633);

-- 2634 Auren Hoffman, San Francisco Bay Area, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2634, 'Auren Hoffman', 'Founder', 'Flex Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder of LiveRamp (acquired by Acxiom, $310M) and SafeGraph; now runs investment firm Flex Capital. 120+ personal angel investments: Crunchbase, Scopely, JumpCloud, Carta, Datavant, Chime, Flexport. No dedicated personal contact route found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2634);

-- 2635 Elizabeth Yin, San Francisco Bay Area, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2635, 'Elizabeth Yin', 'General Partner & Co-Founder', 'Hustle Fund', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founded Hustle Fund (2017) with Eric Bahn; ex-500 Startups accelerator lead. Runs Angel Squad, a paid community of 2,000+ vetted angels co-investing with the fund; extremely high volume, checks as small as $1K. Routing via hustlefund.vc.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2635);

-- 2636 Nnamdi Okike, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2636, 'Nnamdi Okike', 'Co-Founder & Managing Partner', '645 Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founded 645 Ventures (2014), early-stage software/tech (Iterable, Overtime, LeagueApps). Previously at Insight Partners: 19 investments/9 exits worth >$9B. NVCA board member. Routing via 645ventures.com/team.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2636);

-- 2637 Kanyi Maqubela, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2637, 'Kanyi Maqubela', 'Managing Partner', 'Kindred Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Managing Partner, Kindred Ventures; came to the US as a refugee from apartheid-era South Africa. 50+ investments over 10 years (Tala, Upstart, Reddit, Outschool, HelloSign). Also co-founder Heartbeat Health; previously partner at Collaborative Fund. Routing via kindredventures.com/about.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2637);

-- 2638 Nas (Nasir Jones), Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2638, 'Nasir Jones', 'Co-Founder', 'QueensBridge Venture Partners', 'Venture Capital / Growth', 'B', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Rapper/entrepreneur (performs as "Nas"); co-founded QueensBridge Venture Partners with Anthony Saleh. $100K-500K checks, ~20 deals/yr historically (Ring, Coinbase, Lyft, Dropbox, Robinhood). General inquiries via qbvp.com (info@qbvp.com per third-party summary, verify directly).',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2638);

-- 2639 Serena Williams, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2639, 'Serena Williams', 'Founder', 'Serena Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  111, 'Boutique (<$500M)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Former professional tennis champion; founded Serena Ventures, raised inaugural $111M fund (2022). 79% of portfolio to underrepresented founders (54% women, 47% Black, 11% Latino). 95 investments (MasterClass, Coinbase, Noom, Esusu). Named Reckitt entrepreneur-in-residence, 2025. Contact via serenaventures.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2639);
