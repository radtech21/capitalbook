-- VC segment expansion, batch 5: 15 individual angel investors, added
-- as brand-new contacts (ids 2520-2534). Unlike the firm batches, these
-- rows ARE the person (name = the individual, not a firm placeholder) --
-- no contact_people rows needed. No personal email/phone/address was
-- found or guessed for anyone in this batch; email_status reflects that
-- explicitly. Next available id after this batch is 2535.

-- 2520 Jason Calacanis, Los Angeles, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2520, 'Jason Calacanis', 'Founder', 'LAUNCH', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Los Angeles', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder of LAUNCH (fund + accelerator) and "The Syndicate"; host of This Week in Startups. Early $25K Uber investment. ~100 new investments/yr claimed; 300+ lifetime, 145+ LAUNCH portfolio. Apply via launch.co/apply -- no personal email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2520);

-- 2521 Elad Gil, San Francisco Bay Area, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2521, 'Elad Gil', 'Solo GP / Independent Investor', 'Gil Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Author of "High Growth Handbook"; ex-Google/Twitter exec. 325+ investments incl. Airbnb, Stripe, Coinbase, Figma, Anthropic. Raised $1B+ for a new AI-focused fund. No personal email found; eladgil.com is the public profile.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2521);

-- 2522 Naval Ravikant, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2522, 'Naval Ravikant', 'Co-Founder & Chairman', 'AngelList', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founder/Chairman, AngelList. 381 investments recorded (37 exits, 16 unicorns) incl. Uber, Twitter, Notion; crypto/Web3-skewed. No personal contact published -- AngelList is the natural routing venue.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2522);

-- 2523 Ron Conway, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2523, 'Ron Conway', 'Founder & Co-Managing Partner', 'SV Angel', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). One of Silicon Valley''s original "super angels," active since the mid-1990s. SV Angel has made 1,100+ investments, 450+ exits (Stripe, Reddit, Notion, GitHub). Routing via svangel.com; no personal email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2523);

-- 2524 Chris Sacca, Lake Tahoe/Truckee, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2524, 'Chris Sacca', 'Co-Founder', 'Lowercarbon Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Truckee', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Formerly Lowercase Capital (early Uber/Twitter/Instagram/Stripe bets); now climate/decarbonization focus at Lowercarbon Capital (energy, carbon removal, fusion) with wife Crystal Sacca. Routing via lowercarbon.com; no personal email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2524);

-- 2525 Alexis Ohanian, Miami, FL
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2525, 'Alexis Ohanian', 'Founder & General Partner', 'Seven Seven Six', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Miami', 'Florida', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Reddit co-founder; Seven Seven Six (776) is a ~$1B AUM venture firm, LP base 50% women/15% Black or Indigenous. 89 companies via personal/776 investing. Routing via 776.co; no personal email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2525);

-- 2526 Balaji Srinivasan, Asia-based (nomadic)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2526, 'Balaji Srinivasan', 'President', 'Network School', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'Singapore', '', 'Singapore', 'Asia-Pacific',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Ex-Coinbase CTO, ex-a16z GP, author of "The Network State." 226 total portfolio investments (crypto/Web3-heavy: Alchemy, Polychain, Perplexity), 3 unicorns. No public contact route found; base is nomadic, most recently Asia-based.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2526);

-- 2527 Josh Buckley, Northern California
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2527, 'Josh Buckley', 'Founder & Chairman', 'Buckley Ventures', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  1000, 'Mid ($500M–2B)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder/Chairman of Mino Games (mobile gaming). Runs a dedicated ~$50M early-stage fund; Buckley Ventures reported >$1B AUM. Portfolio incl. Clearbit (Chairman), Rippling, Boom Supersonic. Routing via joshbuckley.com; no personal email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2527);

-- 2528 Lachy Groom, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2528, 'Lachy Groom', 'Sole General Partner', 'LGF', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  100, 'Boutique (<$500M)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Early Stripe employee (led Issuing/payments partnerships), left 2018 to invest full-time. 217 investments (Figma, Notion, Ramp, Lattice), concentrated $100-500K checks. LGF II raised ~$100M after a $48M debut fund. No public firm site/contact route found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2528);

-- 2529 Immad Akhund, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2529, 'Immad Akhund', 'Co-Founder & CEO', 'Mercury', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  26, 'Boutique (<$500M)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founder/CEO of Mercury (startup banking); formerly CEO of Heyzap (sold $45M, 2016), ex-part-time YC partner. 350+ angel investments since 2016 (Airtable, Linear, Rippling); formalized as a $26M fund May 2025. Profile at mercury.com/investor-database.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2529);

-- 2530 Sahil Lavingia, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2530, 'Sahil Lavingia', 'Founder & CEO', 'Gumroad', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Founder/CEO of Gumroad; early Pinterest product designer. ~26-59 investments depending on source (Figma, Notion, Vercel); runs an AngelList Rolling Fund (~$1M/quarter LP commitments). Routing via sahillavingia.com; no personal email found.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2530);

-- 2531 Tim Ferriss, Austin, TX
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2531, 'Tim Ferriss', 'Author / Independent Investor', '', 'Venture Capital / Growth', 'B', 0,
  '', 'No public contact', '', 'Austin', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Author of "The 4-Hour Workweek." Early Uber ($25K, 2009) and Twitter (2007) checks; also Shopify, Facebook, Duolingo. Publicly stated he stepped back from active angel investing after the Uber outcome -- treat as lower-activity contact. Portfolio at tim.blog/portfolio.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2531);

-- 2532 Scott Belsky, New York, NY
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2532, 'Scott Belsky', 'Partner (Tech/Innovation)', 'A24', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'New York', 'New York', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Behance co-founder (acquired by Adobe 2012), ex-Adobe Creative Cloud EVP/CPO; joined A24''s leadership Jan 2025 overseeing tech/innovation. 288 investments since 2010 (Uber, Pinterest, Airtable, Ramp). Board seats incl. Atlassian. Profile at scottbelsky.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2532);

-- 2533 Gokul Rajaram, San Francisco Bay Area, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2533, 'Gokul Rajaram', 'Founding Partner', 'Marathon Management Partners', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco Bay Area', 'California', 'United States', 'United States',
  NULL, 'Unknown', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). "Godfather of AdSense"; ex-Google/Meta/Square/DoorDash product leader; Founding Partner, Marathon Management Partners (2025). 300+ investments, typical $50-250K checks (Airtable, Figma, Deel). 7 board seats incl. Pinterest, Coinbase. Profile at gokulrajaram.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2533);

-- 2534 Kevin Hartz, San Francisco, CA
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2534, 'Kevin Hartz', 'Co-Founder & General Partner', 'A* Capital', 'Venture Capital / Growth', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  450, 'Boutique (<$500M)', NULL, 'Angel Investor', NULL, '', 1, 0, 0,
  'Angel investing', 0, 'Global Pension & Institutional',
  'Added in VC segment expansion (2026). Co-founder of Xoom and Eventbrite (both IPO''d); co-founded A* Capital with ex-Coatue investor Bennett Siegel. A* raised a $450M third fund (May 2026); allocates 20%+ to teenage founders. Angel portfolio incl. Airbnb, Uber, Slack, PayPal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2534);
