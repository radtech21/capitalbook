-- UHNW individual expansion, batch: 15 sports team owners (billionaires),
-- added as brand-new contacts (ids 2909-2923). Next available id after
-- this batch is 2924. Jim Irsay (Indianapolis Colts) died May 2025;
-- control passed to his daughter Carlie Irsay-Gordon, who is used here
-- instead of the deceased individual. All corporate contacts below are
-- published team press-office or corporate investor-relations
-- channels, never personal.

-- 2909 Robert K. Kraft
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2909, 'Robert K. Kraft', 'Chairman and CEO', 'The Kraft Group / New England Patriots', 'UHNW Individual', 'A', 0,
  'PatriotsPR@patriots.com', 'Corporate contact only', '(508) 384-9105', 'Foxborough', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', 13800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Owner of the New England Patriots (bought 1994) and head of the diversified Kraft Group (paper/packaging, real estate, sports). Net worth ~$13.8B (Forbes 2026); some outlets cite ~$14B. Email/phone are the published Patriots media-relations contact, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2909);

-- 2910 Jerry Jones
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2910, 'Jerry Jones', 'Owner, President and General Manager', 'Dallas Cowboys', 'UHNW Individual', 'A', 0,
  'mediainfo@icowboys.nfl.net', 'Corporate contact only', '(972) 497-4959', 'Frisco', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 20500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Oil-and-gas businessman who bought the Dallas Cowboys in 1989 and serves as owner, president, and GM; family holds majority stake. Net worth ~$20.3-20.7B (Forbes 2026), range across sources. Email/phone are the published Cowboys PR department contact per the 2025 Media Guide, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2910);

-- 2911 E. Stanley (Stan) Kroenke
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2911, 'E. Stanley Kroenke', 'Owner', 'Kroenke Sports & Entertainment', 'UHNW Individual', 'A', 0,
  'credentials@rams.nfl.com', 'Corporate contact only', '', 'Denver', 'Colorado', 'United States', 'United States',
  NULL, 'Unknown', 21300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Real-estate developer who built the single largest multi-team sports ownership portfolio in the world via Kroenke Sports & Entertainment (LA Rams NFL, Denver Nuggets NBA, Colorado Avalanche NHL, Colorado Rapids MLS, Arsenal FC Premier League). Net worth ~$21.3B per Forbes; other trackers range $18-27B depending on sports-asset valuation method. Email is the LA Rams media/credentials contact -- no general KSE corporate press line was confirmed.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2911);

-- 2912 Josh Harris
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2912, 'Josh Harris', 'Managing Partner', 'Washington Commanders / Harris Blitzer Sports & Entertainment', 'UHNW Individual', 'A', 0,
  'charlie.mule@commanders.com', 'Corporate contact only', '', 'Ashburn', 'Virginia', 'United States', 'United States',
  NULL, 'Unknown', 11500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Private-equity billionaire (Apollo Global Management co-founder, 26North founder) who led the 2023 group purchase of the Washington Commanders for $6.05B; separately co-owns the Philadelphia 76ers and New Jersey Devils via Harris Blitzer Sports & Entertainment. Net worth reported roughly $10.8-12B (Forbes #341 on 2026 list) -- sources vary. Email is published team communications staff contact per commanders.com/press-room, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2912);

-- 2913 David Tepper
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2913, 'David Tepper', 'Owner / Founder and President', 'Carolina Panthers / Appaloosa Management', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(704) 358-7000', 'Charlotte', 'North Carolina', 'United States', 'United States',
  NULL, 'Unknown', 21300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Hedge-fund manager (Appaloosa Management, based Miami Beach, FL) who bought the Carolina Panthers in 2018 for $2.3B. Net worth ~$21.3B per most recent Forbes-cited figure (2024/2025 reporting) -- not confirmed for exact 2026. Phone is the published Panthers front-office contact (Charlie Dayton, panthers.com/about-us/contact-us), not personal.',
  '800 South Mint St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2913);

-- 2914 Arthur M. Blank
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2914, 'Arthur M. Blank', 'Owner', 'Atlanta Falcons / Atlanta United FC', 'UHNW Individual', 'A', 0,
  'jessica.stephans@falcons.nfl.com', 'Corporate contact only', '(470) 341-4100', 'Flowery Branch', 'Georgia', 'United States', 'United States',
  NULL, 'Unknown', 11000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Home Depot co-founder who bought the Atlanta Falcons in 2002 and later launched MLS''s Atlanta United. Net worth range ~$10.7-11.4B across Forbes/Bloomberg-cited figures -- sources not fully aligned. Email/phone are the published Falcons media-credentials contact (atlantafalcons.com/about/contact), not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2914);

-- 2915 Shad Khan
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2915, 'Shad Khan', 'Owner', 'Jacksonville Jaguars / Fulham FC / Flex-N-Gate', 'UHNW Individual', 'A', 0,
  'JaguarsPR@nfl.jaguars.com', 'Corporate contact only', '(904) 633-2000', 'Jacksonville', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 14300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Auto-parts manufacturer (Flex-N-Gate, based Urbana, IL) who bought the Jacksonville Jaguars in 2012 and Fulham FC in 2013. Net worth ~$14.3B per Forbes (Sept 2025 update, cited through 2026 reporting). Email/phone are the published Jaguars PR/credentials contact (jaguars.com), not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2915);

-- 2916 Carlie Irsay-Gordon
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2916, 'Carlie Irsay-Gordon', 'Owner and CEO', 'Indianapolis Colts', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '', 'Indianapolis', 'Indiana', 'United States', 'United States',
  NULL, 'Unknown', 4800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Daughter of longtime Colts owner Jim Irsay, who died May 2025 (net worth ~$4.8B at death per Forbes -- used here as the family reference figure since no separate current figure has been published for Carlie); she assumed control of the Indianapolis Colts following his death. Colts front office is at 7001 W 56th St, Indianapolis, IN; general contact form at colts.com/footer/contact-us, but no specific email/phone was confirmed in research -- left blank.',
  '7001 W 56th St'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2916);

-- 2917 Robert Wood (Woody) Johnson IV
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2917, 'Robert Wood Johnson IV', 'Owner', 'New York Jets', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(973) 549-4800', 'Florham Park', 'New Jersey', 'United States', 'United States',
  NULL, 'Unknown', 6500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Johnson & Johnson family heir who bought the New York Jets in 2000 for $635M and served as US Ambassador to the UK (2018-2021). Net worth estimates diverge widely -- $3.4-3.5B (Celebrity Net Worth/other trackers) vs ~$9.9B (Bloomberg, 2024); $6.5B used here as a rough flagged midpoint, treat as unconfirmed. Phone is the published Jets general line, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2917);

-- 2918 Ricketts Family (Chicago Cubs)
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2918, 'Ricketts Family', 'Chairman (Tom Ricketts) / Family Owners', 'Chicago Cubs', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(773) 404-4191', 'Chicago', 'Illinois', 'United States', 'United States',
  NULL, 'Unknown', 5300, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Family (patriarch Joe Ricketts, founder of TD Ameritrade) took control of the Chicago Cubs and Wrigley Field in 2009; Tom Ricketts serves as Chairman. Tom Ricketts individually estimated ~$900M; broader Ricketts family estimated ~$5.3B (Forbes family listing) -- family figure used here, treat as estimate. Phone is the published Cubs media-relations contact, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2918);

-- 2919 John W. Henry
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2919, 'John W. Henry', 'Principal Owner', 'Fenway Sports Group', 'UHNW Individual', 'A', 0,
  '', 'Corporate contact only', '(617) 226-6000', 'Boston', 'Massachusetts', 'United States', 'United States',
  NULL, 'Unknown', 5700, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Former commodities-trading firm founder who leads Fenway Sports Group, owner of the Boston Red Sox (since 2002), Liverpool FC, the Pittsburgh Penguins, and The Boston Globe. Net worth ~$5.7B per Forbes (2026 list, #730). Phone is the published Red Sox general-info line; a press room is at pressroom.redsox.com and fenwaysportsgroup.com/media, not personal.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2919);

-- 2920 Micky Arison
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2920, 'Micky Arison', 'Chairman', 'Carnival Corporation & plc / Miami Heat', 'UHNW Individual', 'A', 0,
  'ir@carnival.com', 'Corporate contact only', '(305) 599-2600', 'Miami', 'Florida', 'United States', 'United States',
  NULL, 'Unknown', 9800, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Chairman of Carnival Corporation (world''s largest cruise operator, publicly listed) and controlling owner of the Miami Heat since 1995; 2025 Naismith Basketball Hall of Fame inductee (contributor category). Net worth range ~$9.7-10B per most trackers (Forbes #332, 2026 list) -- reported near the midpoint. ir@carnival.com is a genuine, publicly-listed corporate IR contact (SVP IR Beth Roberts).',
  '3655 NW 87th Ave'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2920);

-- 2921 Tilman Fertitta
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2921, 'Tilman Fertitta', 'Chairman and CEO / Owner', 'Fertitta Entertainment (Landry''s) / Houston Rockets', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'Houston', 'Texas', 'United States', 'United States',
  NULL, 'Unknown', 11000, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Restaurant/hospitality mogul (Landry''s, Golden Nugget Casinos) who bought the Houston Rockets in 2017; also serving as US Ambassador to Italy and pursuing a 2026 acquisition of Caesars Entertainment. Net worth range ~$10.6-11.7B across sources (Forbes ~$11.0B mid-July 2026). A Rockets media-info page exists (nba.com/rockets/rocketsmediainfo) but no specific phone/email was confirmed -- left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2921);

-- 2922 Joe Lacob
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2922, 'Joe Lacob', 'Majority Owner', 'Golden State Warriors', 'UHNW Individual', 'A', 0,
  '', 'No public contact', '', 'San Francisco', 'California', 'United States', 'United States',
  NULL, 'Unknown', 2100, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Venture capitalist (Kleiner Perkins partner) and majority owner of the Golden State Warriors since 2010, during which the team has won multiple NBA championships. Net worth ~$2.1B per Forbes (as of Feb 2025) -- notably lower than some team-value-based estimates, not fully confirmed for 2026. Warriors PR active as @WarriorsPR; no standalone dedicated press-office phone/email confirmed -- left blank.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2922);

-- 2923 Dan Gilbert
INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2923, 'Dan Gilbert', 'Co-Founder and Chairman / Owner', 'Rocket Companies / Cleveland Cavaliers', 'UHNW Individual', 'A', 0,
  'IR@Rocket.com', 'Corporate contact only', '(216) 420-2000', 'Cleveland', 'Ohio', 'United States', 'United States',
  NULL, 'Unknown', 22500, 'UHNW Individual', NULL, '', 1, 0, 0,
  'UHNW individual', 0, 'Global Pension & Institutional',
  'Added in UHNW expansion (2026). Co-founder and chairman of Rocket Companies/Rocket Mortgage (Detroit, MI HQ), owner of the Cleveland Cavaliers since 2005, and major real-estate investor in downtown Detroit and Cleveland. Net worth ~$22.5B per Forbes (as of May 2025) -- some sources place it higher, not fully confirmed for exact 2026 figure. IR@Rocket.com is a genuine published corporate IR contact; Cavaliers general contact is contactus@cavs.com.',
  ''
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2923);
