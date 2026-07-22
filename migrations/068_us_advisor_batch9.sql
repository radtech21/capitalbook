-- US Financial Advisor enrichment, batch 9 (29 contacts / 20 groups).
--
-- One out-of-state area-code data error found and corrected: 244 Henry
-- Crosby's CRM phone (870) is an Arkansas code for an Alabama firm
-- (Twickenham Advisors, Huntsville) — same pattern seen in batch 5's
-- Stonegate corrections. One leadership-transition correction: 259
-- Thomas Bartholomew stepped down as CEO/President (~July 2026) in
-- favor of his son Alex Bartholomew, remaining as Founder/Chairman.
--
-- Cross-reference confirmed: 261 James Meek's Graystone Consulting team
-- shares the exact same Baltimore building (650 S Exeter St, Suite
-- 1100) as 239 Ted Smith's CWS Group (batch 8) — two distinct Morgan
-- Stanley teams in the same Harbor East office.

-- ===== GROUP 161: Twickenham Advisors, Huntsville, AL =====
-- 244 Henry Crosby (co-founder/CEO)
UPDATE contacts SET
  title = 'Co-Founder and CEO, Managing Director',
  address = '200 Clinton Avenue W, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (870) 933-1339 is an Arkansas area code — a data error for this Huntsville, AL firm; correct number is (256) 213-1150. Full name Henry "Moss" E. Crosby Jr., firm affiliated with the HighTower Advisors network.')), 512)
WHERE id = 244;
INSERT INTO contact_people (contact_id, name, role)
SELECT 244, x.name, x.role FROM (
  SELECT 'Wes Clayton' AS name, 'Co-Founder/Partner, Twickenham Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 244) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 244 AND name = x.name);

-- ===== GROUP 162: CIBC Private Wealth, San Francisco, CA =====
-- 245 Vicken Ekmekjian
UPDATE contacts SET
  address = '101 2nd Street, Suite 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, senior relationship manager, CIBC Private Wealth San Francisco; 25+ years experience. Barron''s Top Advisor rankings 8 of last 9 years including 2024-2026.')), 512)
WHERE id = 245;
INSERT INTO contact_people (contact_id, name, role)
SELECT 245, x.name, x.role FROM (
  SELECT 'Jack B. Caldwell, CFP' AS name, 'Managing Director, CIBC Private Wealth San Francisco' AS role
  UNION ALL SELECT 'Jennifer Man, CFA', 'Managing Director, CIBC Private Wealth San Francisco'
  UNION ALL SELECT 'J. Bradford Craig', 'Senior Vice President, CIBC Private Wealth San Francisco'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 245) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 245 AND name = x.name);

-- ===== GROUP 163: Ameriprise Financial, Hauppauge, NY =====
-- 246 Jonathan Kuttin (Kuttin Wealth Management)
UPDATE contacts SET
  address = '1174 Veterans Memorial Highway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO, Kuttin Wealth Management, a private wealth advisory practice of Ameriprise Financial, Hauppauge NY. Barron''s Hall of Fame Advisor, named to 2026 Barron''s Top 100 Financial Advisors. Firm manages ~$2.4B AUM.')), 512)
WHERE id = 246;
INSERT INTO contact_people (contact_id, name, role)
SELECT 246, x.name, x.role FROM (
  SELECT 'Evan Branfman' AS name, 'Managing Partner, Kuttin Wealth Management' AS role
  UNION ALL SELECT 'Ashley Lang', 'Managing Director, Kuttin Wealth Management'
  UNION ALL SELECT 'Claire K. Fitz', 'Managing Director, Kuttin Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 246) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 246 AND name = x.name);

-- ===== GROUP 164: Morgan Stanley Wealth Management, Allentown, PA =====
-- 247 Michael Malz — team rebranded from "The Lehigh Valley Group" to "Citadel Point Wealth Management"
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President/Financial Advisor, Morgan Stanley (Graystone Consulting), Allentown PA; team rebranded from "The Lehigh Valley Group" to "Citadel Point Wealth Management." Barron''s Top 1,200 2025; Forbes Best-in-State 2025.')), 512),
  address = '515 West Hamilton Street, 7th Floor'
WHERE id = 247;
INSERT INTO contact_people (contact_id, name, role)
SELECT 247, x.name, x.role FROM (
  SELECT 'Clayton Collins, CIMA, CFP, CRPS, CRPC' AS name, 'Alternative Investments Director / team member, Citadel Point Wealth Management' AS role
  UNION ALL SELECT 'Nicholas Tardy, CFP, QPFC', 'Team member, Citadel Point Wealth Management'
  UNION ALL SELECT 'Ron Mentel, CRPC, CRPS, QPFC', 'Team member, Citadel Point Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 247) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 247 AND name = x.name);

-- ===== GROUP 165: Mariner Wealth Advisors, New York, NY =====
-- 248 Justin McCarthy
UPDATE contacts SET
  address = '1500 Broadway, 28th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Director & Senior Wealth Advisor, Mariner Wealth Advisors, New York. Ranked #2 in NY on Barron''s Top 1,500 Advisors 2026, #3 in 2025/2024. No named team members found.')), 512)
WHERE id = 248;

-- ===== GROUP 166: Merrill Wealth Management, Blue Bell, PA =====
-- 249 Johanna Walters, 327 Megan Bailey (Walters Bailey Associates)
UPDATE contacts SET
  address = '470 Norristown Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Merrill Blue Bell PA, co-leads Walters Bailey Associates (joined Merrill 1998). #1 Forbes Pennsylvania-East list Feb 2026.')), 512)
WHERE id = 249;
UPDATE contacts SET
  address = '470 Norristown Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CRPC/CPFA, Merrill Blue Bell PA, co-leads Walters Bailey Associates with id 249 Johanna Walters (joined Merrill 1995).')), 512)
WHERE id = 327;
INSERT INTO contact_people (contact_id, name, role)
SELECT 249, x.name, x.role FROM (
  SELECT 'Donna J. Wells' AS name, 'Officer, Registered Wealth Management Client Associate, Walters Bailey Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 249) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 249 AND name = x.name);

-- ===== GROUP 167: Perigon Wealth Management, Boca Raton, FL =====
-- 250 Jeremy Paul (President)
UPDATE contacts SET
  address = '5355 Town Center Road, Suite 204',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President, Perigon Wealth Management, Boca Raton FL (focus: sports/entertainment clients). #6 Forbes Best-In-State FL-South High Net Worth 2026. Operates under corporate brand, no distinct named team.')), 512)
WHERE id = 250;

-- ===== GROUP 168: Merrill Private Wealth Management, Boston, MA =====
-- 251 Raj Sharma, 311 Gary McGuirk, 320 Ramzi Nuwayhid, 407 Paul McCauley — this CRM
-- phone spans a large shared building with dozens of separate teams; 3 confirmed here.
UPDATE contacts SET
  address = '100 Federal Street, Floor 17',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Head of The Sharma Group (~15 professionals), Merrill Boston. Barron''s Hall of Fame; #1 MA advisor 2021-2023 per Forbes/Barron''s.')), 512)
WHERE id = 251;
UPDATE contacts SET
  address = '100 Federal Street, Floor 17',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director, member of The McCauley McGuirk Group, Merrill Boston, alongside id 407 Paul McCauley.')), 512)
WHERE id = 311;
UPDATE contacts SET
  address = '100 Federal Street, Floor 17',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Head of The Nuwayhid Group, Merrill Boston.')), 512)
WHERE id = 320;
UPDATE contacts SET
  address = '100 Federal Street, Floor 17',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, co-lead of The McCauley McGuirk Group (9-person team, ~$3.9B AUM, est. 1997), Merrill Boston, alongside id 311 Gary McGuirk. #11 Forbes Best-in-State (MA) 2026.')), 512)
WHERE id = 407;
INSERT INTO contact_people (contact_id, name, role)
SELECT 320, x.name, x.role FROM (
  SELECT 'Aimee Cullen' AS name, 'VP, Senior Private Wealth Planner, The Nuwayhid Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 320) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 320 AND name = x.name);

-- ===== GROUP 169: Morgan Stanley Wealth Management, Morristown, NJ =====
-- 252 Michael Ricca, 418 Mary Guza (The Ricca Group)
UPDATE contacts SET
  address = '340 Mt Kemble Avenue, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder/leader, The Ricca Group, Morgan Stanley Morristown NJ (with firm since 1997); 34 years industry experience. #1 NJ-North Private Wealth Forbes Apr 2025.')), 512)
WHERE id = 252;
UPDATE contacts SET
  address = '340 Mt Kemble Avenue, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CFP, CRPS, Financial Advisor, The Ricca Group, Morgan Stanley Morristown NJ. #9 Forbes 2026 Best-In-State; repeat Barron''s Top Women Advisors honoree 2022-2025.')), 512)
WHERE id = 418;
INSERT INTO contact_people (contact_id, name, role)
SELECT 252, x.name, x.role FROM (
  SELECT 'Andrea Ricca O''Donnell' AS name, 'Financial Advisor, CFP, CRPS, The Ricca Group' AS role
  UNION ALL SELECT 'Stephen Allen', 'Financial Advisor, CFP, CRPC, The Ricca Group'
  UNION ALL SELECT 'Andrew Barrow', 'Financial Advisor, CFP, The Ricca Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 252) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 252 AND name = x.name);

-- ===== GROUP 170: Merrill Wealth Management, Mount Pleasant, SC =====
-- 253 Brian Noone (712 Investment Group), 1107 John Bennett — separate advisors sharing branch
UPDATE contacts SET
  address = '75 Port City Landing, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior VP/Senior Financial Advisor, Managing Partner & Co-CEO of The 712 Investment Group (21-person multi-office team spanning NYC, SF Bay Area, Charleston/Mount Pleasant SC), Merrill.')), 512)
WHERE id = 253;
UPDATE contacts SET
  address = '75 Port City Landing, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name John Seabrook Bennett, Managing Director, Wealth Management Advisor, Merrill Mount Pleasant SC (separate advisor/team from id 253 Brian Noone, sharing the same branch). Forbes 2023 Best-In-State Team Member.')), 512)
WHERE id = 1107;

-- ===== GROUP 171: Morgan Stanley Wealth Management, Indianapolis, IN =====
-- 254 Jonathan Klausner, 255 John Duffy (The Klausner Duffy DiSalvo Investment Group)
UPDATE contacts SET
  address = '800 East 96th Street, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Director, Financial Advisor, co-lead of The Klausner Duffy DiSalvo Investment Group, Morgan Stanley Indianapolis.')), 512)
WHERE id = 254;
UPDATE contacts SET
  address = '800 East 96th Street, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Financial Advisor, The Klausner Duffy DiSalvo Investment Group, Morgan Stanley Indianapolis. Barron''s Top 1,200 every year since 2014; member of Morgan Stanley''s Financial Advisor Council.')), 512)
WHERE id = 255;
INSERT INTO contact_people (contact_id, name, role)
SELECT 254, x.name, x.role FROM (
  SELECT 'Derek DiSalvo' AS name, 'Financial Advisor, The Klausner Duffy DiSalvo Investment Group' AS role
  UNION ALL SELECT 'Justin Klausner, CFP', 'Financial Advisor, The Klausner Duffy DiSalvo Investment Group'
  UNION ALL SELECT 'Matt Henning', 'Financial Advisor, The Klausner Duffy DiSalvo Investment Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 254) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 254 AND name = x.name);

-- ===== GROUP 172: Grimes & Co., Westborough, MA =====
-- 258 Kevin Grimes (President & CEO/CIO)
UPDATE contacts SET
  address = 'One Technology Drive, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CEO / Chief Investment Officer, Grimes & Company, Westborough MA (joined 1998, son of founder). Firm ~$6.3-6.5B AUM; took minority investment from Rise Growth Partners Feb 2025.')), 512)
WHERE id = 258;
INSERT INTO contact_people (contact_id, name, role)
SELECT 258, x.name, x.role FROM (
  SELECT 'Timothy J. Grimes' AS name, 'Founder and Chairman, Grimes & Company' AS role
  UNION ALL SELECT 'Thomas Grimes', 'VP, CFP, Grimes & Company'
  UNION ALL SELECT 'Emily G. Wood', 'VP, Grimes & Company'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 258) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 258 AND name = x.name);

-- ===== GROUP 173: Bartholomew & Co., Worcester, MA =====
-- 259 Thomas Bartholomew — stepped down as CEO/President (~July 2026), now Founder/Chairman
UPDATE contacts SET
  title = 'Founder and Chairman',
  address = '370 Main Street, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: founded the firm in 1994 and stepped down as CEO/President ~July 2026 (when the firm launched its own hybrid RIA); now serves as Founder and Chairman. His son Alex Bartholomew was promoted to CEO and Chief Investment Officer.')), 512)
WHERE id = 259;
INSERT INTO contact_people (contact_id, name, role)
SELECT 259, x.name, x.role FROM (
  SELECT 'Alex Bartholomew' AS name, 'CEO & Chief Investment Officer, Bartholomew & Company (successor to id 259 Thomas Bartholomew)' AS role
  UNION ALL SELECT 'Michelle Fuller, CIMA, CEPA', 'Managing Director of Strategy & Operations, Senior Wealth Advisor, Bartholomew & Company'
  UNION ALL SELECT 'Jim Cushman', 'Senior Wealth Advisor, Bartholomew & Company'
  UNION ALL SELECT 'Joshua Paul', 'Senior Wealth Advisor, Bartholomew & Company'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 259) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 259 AND name = x.name);

-- ===== GROUP 174: Morgan Stanley | Graystone Consulting, Baltimore, MD =====
-- 261 James Meek (The J.K. Meek Group) — confirmed same building as id 239 Ted Smith (batch 8)
UPDATE contacts SET
  address = '650 S Exeter St, Suite 1100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Institutional Consulting Director, leads The J.K. Meek Group, Graystone Consulting Baltimore — confirmed same Harbor East building (650 S Exeter St, Suite 1100) as id 239 Ted Smith''s CWS Group (batch 8), a separate Morgan Stanley PWM team. #7 Forbes 2026 Best-In-State.')), 512)
WHERE id = 261;
INSERT INTO contact_people (contact_id, name, role)
SELECT 261, x.name, x.role FROM (
  SELECT 'Martin Domres' AS name, 'Financial Advisor, The J.K. Meek Group' AS role
  UNION ALL SELECT 'Joseph Arbogast, Sr.', 'Registered Marketing Associate, The J.K. Meek Group'
  UNION ALL SELECT 'Allan D. House', 'Investment Advisor, The J.K. Meek Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 261) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 261 AND name = x.name);

-- ===== GROUP 175: Raymond James, Coral Gables, FL =====
-- 263 Peter Bermont (Bermont Gold Wealth Advisory), 836 Margaret Starner (The Starner Group)
-- — two separate Raymond James branch offices, not a joint team.
UPDATE contacts SET
  address = '2811 Ponce de Leon Blvd, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor/Private Wealth Advisor, leads Bermont Gold Wealth Advisory, Raymond James Coral Gables (separate office from id 836 Margaret Starner''s Starner Group in the same city).')), 512)
WHERE id = 263;
UPDATE contacts SET
  address = '2333 Ponce de Leon Blvd, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Investments, CFP, founder and lead partner of The Starner Group, Raymond James Coral Gables (separate office from id 263 Peter Bermont).')), 512)
WHERE id = 836;
INSERT INTO contact_people (contact_id, name, role)
SELECT 263, x.name, x.role FROM (
  SELECT 'Michael Gold, AAMS' AS name, 'Partner/Portfolio Manager, Bermont Gold Wealth Advisory' AS role
  UNION ALL SELECT 'Bill Bermont', 'Partner (joined 2023, ex-Credit Suisse MD), Bermont Gold Wealth Advisory'
  UNION ALL SELECT 'Kimberly Argüello, CFA, CIMA', 'Senior Investment Portfolio Analyst, Bermont Gold Wealth Advisory'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 263) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 263 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 836, x.name, x.role FROM (
  SELECT 'Scott Weingarden' AS name, 'Financial Advisor, The Starner Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 836) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 836 AND name = x.name);

-- ===== GROUP 176: Raymond James, Beverly Hills, CA =====
-- 265 Lisa Detanna — phone matches CRM exactly; team rebranded to "Detanna Pettey Wealth Management"
UPDATE contacts SET
  address = '9595 Wilshire Blvd, Suite 801',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Vice President, Investments, Private Wealth Advisor, Raymond James Beverly Hills (phone matches CRM exactly). Practice rebranded from "Global Wealth Solutions Group" to "Detanna Pettey Wealth Management" reflecting a partnership addition.')), 512)
WHERE id = 265;
INSERT INTO contact_people (contact_id, name, role)
SELECT 265, x.name, x.role FROM (
  SELECT 'John H. Pettey III' AS name, 'Managing Director, Private Wealth Advisor, AIF, Detanna Pettey Wealth Management' AS role
  UNION ALL SELECT 'George A. C. Pettey', 'Team member (~22 years investment experience, ex-hedge fund PM/Analyst), Detanna Pettey Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 265) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 265 AND name = x.name);

-- ===== GROUP 177: Merrill Wealth Management, Garden City, NY =====
-- 267 Daniel O'Connell (The O'Connell Group), 482 W. Corby May (May Malfettone Gold Biblo
-- Group) — two separate teams sharing the same branch.
UPDATE contacts SET
  address = '1325 Franklin Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, leads The O''Connell Group, Merrill Garden City NY (formed 1985, 40+ years at Merrill). Barron''s Top 1,200 Financial Advisors 2014-2019, 2021-2025.')), 512)
WHERE id = 267;
UPDATE contacts SET
  address = '1325 Franklin Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, leads/co-leads the May Malfettone Gold Biblo Group, Merrill Garden City NY (separate team from id 267 Daniel O''Connell, sharing the same branch). Forbes "America''s Top Wealth Advisors" 2022.')), 512)
WHERE id = 482;
INSERT INTO contact_people (contact_id, name, role)
SELECT 267, x.name, x.role FROM (
  SELECT 'Jack O''Connell, CFP' AS name, 'Team member (joined Merrill 2004), The O''Connell Group' AS role
  UNION ALL SELECT 'Daniel O''Connell Jr.', 'Team member, The O''Connell Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 267) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 267 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 482, x.name, x.role FROM (
  SELECT 'Brian Malfettone' AS name, 'Wealth Management Advisor, May Malfettone Gold Biblo Group' AS role
  UNION ALL SELECT 'Matthew Gold, CFA, CFP', 'Team member, May Malfettone Gold Biblo Group'
  UNION ALL SELECT 'Matthew Biblo, CFP', 'Team member, May Malfettone Gold Biblo Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 482) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 482 AND name = x.name);

-- ===== GROUP 178: Morgan Stanley Private Wealth Management, Clayton, MO =====
-- 268 Niall Gannon — team renamed from "The Gannon Group" to "The Clayton Group"
UPDATE contacts SET
  address = '7733 Forsyth Blvd, Suite 2100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Morgan Stanley PWM Clayton MO; team renamed from "The Gannon Group" to "The Clayton Group." Forbes Best-In-State (Missouri) 2024/2025/2026; Barron''s Top 1,500 2026.')), 512)
WHERE id = 268;
INSERT INTO contact_people (contact_id, name, role)
SELECT 268, x.name, x.role FROM (
  SELECT 'Mark Allenspach' AS name, 'Executive Director, Private Wealth Advisor, The Clayton Group' AS role
  UNION ALL SELECT 'Matthew Rogers, CFP, CPM', 'Senior Vice President, The Clayton Group'
  UNION ALL SELECT 'Scott Seibert, CFA, CPWA', 'Vice President, Private Wealth Advisor, The Clayton Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 268) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 268 AND name = x.name);

-- ===== GROUP 179: Main Street Research, Sausalito, CA =====
-- 269 James Demmert (Founder, Chairman & CIO)
UPDATE contacts SET
  address = '30 Liberty Ship Way, Third Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder, Chairman & Chief Investment Officer, Main Street Research, Sausalito CA (splits time with a Midtown Manhattan office).')), 512)
WHERE id = 269;
INSERT INTO contact_people (contact_id, name, role)
SELECT 269, x.name, x.role FROM (
  SELECT 'Aaron M. Stern' AS name, 'Managing Partner / Portfolio Manager & Private Client Advisor, Main Street Research' AS role
  UNION ALL SELECT 'Benjamin Armellini', 'Principal, Main Street Research'
  UNION ALL SELECT 'Natalie McMahon', 'Principal, Main Street Research'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 269) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 269 AND name = x.name);

-- ===== GROUP 180: Merrill Private Wealth Management, Frontenac, MO =====
-- 270 Shawn Williams (The Williams Group) — Merrill's own site labels this office "Ladue, MO," an adjacent suburb to Frontenac
UPDATE contacts SET
  address = '1630 South Lindbergh Blvd, Ladue, MO 63131',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, CIMA/CEPA/CPFA, leads The Williams Group, Merrill (joined 2015). Note: Merrill''s own site labels this office "Ladue, MO," an adjacent suburb to the CRM''s "Frontenac, MO."')), 512)
WHERE id = 270;
INSERT INTO contact_people (contact_id, name, role)
SELECT 270, x.name, x.role FROM (
  SELECT 'Robert (Ty) Webster, CEPA, CIMA' AS name, 'Financial Advisor & Senior Portfolio Advisor, The Williams Group' AS role
  UNION ALL SELECT 'Ann M. Granquist', 'Officer, Registered Senior Private Wealth Client Associate, The Williams Group'
  UNION ALL SELECT 'Geraldine F. Saban', 'Officer, Registered Senior Private Wealth Client Associate, The Williams Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 270) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 270 AND name = x.name);
