-- US Financial Advisor enrichment, batch 13 (26 contacts / 20 groups).
--
-- Firm-change corrections: 371 Lawrence Hood's firm, Pacific Portfolio
-- Consulting, was acquired by Waverly Advisors (Sept 2025), and he now
-- holds a Partner/Regional Director role there at the same Seattle
-- address. 392 Garret Alcaraz's team rebranded in 2024 from "Alcaraz
-- Fisher Justis Wealth Management Group" to "Bold Capital Wealth
-- Management Group" (same office). 388 Robert Fragasso transitioned in
-- 2025 from Founder/CEO to Chairman of the Board, with Christine
-- Robinette named the firm's new CEO.
--
-- Two out-of-region area-code data errors corrected: 389 Michael
-- Moeller's Chesterfield, MO firm was filed under an Albany, NY code,
-- and the real number is a St. Louis-area (636) line — same pattern as
-- prior batches' corrections.

-- ===== GROUP 241: Pacific Portfolio Consulting (now Waverly Advisors), Seattle, WA =====
-- 371 Lawrence Hood
UPDATE contacts SET
  firm = 'Waverly Advisors',
  title = 'Partner, Regional Director, Wealth Advisor',
  address = '450 Alaskan Way S, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: Pacific Portfolio Consulting, LLC was acquired by Waverly Advisors, LLC in September 2025. Lawrence "Larry" Hood remains active, now as Partner, Regional Director, and Wealth Advisor managing the Seattle regional office at the same address.')), 512)
WHERE id = 371;
INSERT INTO contact_people (contact_id, name, role)
SELECT 371, x.name, x.role FROM (
  SELECT 'Lisa Cook' AS name, 'Partner, Waverly Advisors (Seattle)' AS role
  UNION ALL SELECT 'George Jarvis', 'Associate Financial Advisor, Waverly Advisors (Seattle)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 371) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 371 AND name = x.name);

-- ===== GROUP 242: Merrill Private Wealth Management, Spokane, WA =====
-- 372 Jay Kirkpatrick (Kirkpatrick-Violette Group)
UPDATE contacts SET
  address = '601 W Riverside Avenue, Suite 500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Jay P. Kirkpatrick, CRPC, Senior Financial Advisor/Managing Director, leads the Kirkpatrick-Violette Group, Merrill Spokane. #236 America''s Top Wealth Advisors 2025; #7 Best-In-State (WA-Private Wealth) 2025.')), 512)
WHERE id = 372;
INSERT INTO contact_people (contact_id, name, role)
SELECT 372, x.name, x.role FROM (
  SELECT 'Cory Violette' AS name, 'Senior Financial Advisor, Kirkpatrick-Violette Group' AS role
  UNION ALL SELECT 'Hugh D. Severs', 'Vice President, Senior Financial Advisor, Kirkpatrick-Violette Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 372) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 372 AND name = x.name);

-- ===== GROUP 243: Merrill Wealth Management, Gilbert, AZ =====
-- 374 David Stahle (The Stahle Bottolfson Larson Group)
UPDATE contacts SET
  address = '275 E Rivulon Blvd, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name David V. Stahle, Managing Director/Senior Consultant, part of The Stahle Bottolfson Larson Group, Merrill Gilbert AZ (34+ years in industry). Barron''s Top 1,200 2011-2025; #5 Arizona (High Net Worth) Forbes; #6 Best-In-State Wealth Management Teams AZ 2025.')), 512)
WHERE id = 374;
INSERT INTO contact_people (contact_id, name, role)
SELECT 374, x.name, x.role FROM (
  SELECT 'Craig Bottolfson' AS name, 'Advisor, The Stahle Bottolfson Larson Group' AS role
  UNION ALL SELECT 'Britton Larson', 'Advisor, The Stahle Bottolfson Larson Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 374) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 374 AND name = x.name);

-- ===== GROUP 244: Morgan Stanley Wealth Management, Birmingham, AL =====
-- 375 Alistair Harding-Smith (Paragon HM Wealth Management Group)
UPDATE contacts SET
  address = '3500 Colonnade Parkway, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — founding partner and Head of Investment Strategy & Portfolio Management, Paragon HM Wealth Management Group, Morgan Stanley Birmingham AL. Barron''s Top 1,200 2022-2025; #6 Forbes Best-in-State (AL) 2026.')), 512)
WHERE id = 375;
INSERT INTO contact_people (contact_id, name, role)
SELECT 375, x.name, x.role FROM (
  SELECT 'Scott McClanahan' AS name, 'Executive Director, Family Wealth Director, Financial Advisor, principal partner, Paragon HM Wealth Management Group' AS role
  UNION ALL SELECT 'Greg Werchanowskyj', 'Financial Advisor/Partner, Paragon HM Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 375) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 375 AND name = x.name);

-- ===== GROUP 245: Merrill Wealth Management, Canfield, OH =====
-- 376 Sidney Jones (internal Merrill team name "Jones Wealth Management" — distinct from
-- an unrelated independent RIA of the same public name)
UPDATE contacts SET
  address = '4137 Boardman-Canfield Rd, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Wealth Management Advisor, Managing Director, Merrill Canfield OH (began career at Merrill 1982); team internally branded "Jones Wealth Management" (note: distinct from an unrelated independent RIA using the same public name — do not conflate). Barron''s Top 1,200 2014-2025; Forbes Best-in-State 2018-2025. No named colleagues confirmed.')), 512)
WHERE id = 376;

-- ===== GROUP 246: Merrill Private Wealth Management, Frederick, MD =====
-- 377 William Orr (The Orr Group, founder)
UPDATE contacts SET
  address = '30 West Patrick St, 4th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director, founder of The Orr Group, Merrill Frederick MD (founded practice ~1992). #11 Best-in-State Wealth Advisors (MD) 2025; team #17 in Maryland.')), 512)
WHERE id = 377;
INSERT INTO contact_people (contact_id, name, role)
SELECT 377, x.name, x.role FROM (
  SELECT 'Timothy G. Mellott' AS name, 'Private Wealth Advisor (30+ years with Orr), The Orr Group' AS role
  UNION ALL SELECT 'Cherie M. Edwards, CFP', 'Senior Vice President, Private Wealth Advisor (20+ years with Orr), The Orr Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 377) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 377 AND name = x.name);

-- ===== GROUP 247: Pathstone, Los Angeles, CA =====
-- 378 David Kahn
UPDATE contacts SET
  address = '10250 Constellation Blvd, Suite 2450',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Managing Director (Client Advisory), Pathstone Los Angeles. Named to Barron''s Top 100 Independent Advisors.')), 512)
WHERE id = 378;
INSERT INTO contact_people (contact_id, name, role)
SELECT 378, x.name, x.role FROM (
  SELECT 'Michael Cafarchia, CFP' AS name, 'Managing Director, Client Advisory (LA office), Pathstone' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 378) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 378 AND name = x.name);

-- ===== GROUP 248: UBS Wealth Management, Kansas City, MO =====
-- 379 Matt Bret (Jefferies/Bret Wealth Management Group)
UPDATE contacts SET
  address = '4622 Pennsylvania Ave, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Matthew Tyler Bret, CFA, Financial Advisor, part of the Jefferies/Bret Wealth Management Group, UBS Kansas City (with UBS since 1998). Barron''s Top 1,200 Financial Advisors 2024.')), 512)
WHERE id = 379;
INSERT INTO contact_people (contact_id, name, role)
SELECT 379, x.name, x.role FROM (
  SELECT 'Michael Jefferies' AS name, 'Managing Director, co-namesake, Jefferies/Bret Wealth Management Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 379) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 379 AND name = x.name);

-- ===== GROUP 249: Merrill Wealth Management, Billings, MT =====
-- 381 Charles Wagner, 382 Joshua Hedge (Anderson Hedge Wagner Kienitz Zwemke & Associates)
UPDATE contacts SET
  address = '3412 Colton Blvd, Suite 104',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "C.B." Wagner, Managing Director, Wealth Management Advisor, Anderson Hedge Wagner Kienitz Zwemke & Associates, Merrill Billings MT. Barron''s Top 1200 2023.')), 512)
WHERE id = 381;
UPDATE contacts SET
  address = '3412 Colton Blvd, Suite 104',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Josh" Hedge, Managing Director, Global Institutional Consultant, Wealth Management Advisor, Anderson Hedge Wagner Kienitz Zwemke & Associates, Merrill Billings MT, alongside id 381 Charles Wagner. Forbes Best-in-State team member 2026.')), 512)
WHERE id = 382;
INSERT INTO contact_people (contact_id, name, role)
SELECT 381, x.name, x.role FROM (
  SELECT 'Christopher Anderson' AS name, 'Senior VP, Wealth Management Advisor, Anderson Hedge Wagner Kienitz Zwemke & Associates' AS role
  UNION ALL SELECT 'Seth Hedge, CFA, CFP, CPFA', 'Financial Advisor, Anderson Hedge Wagner Kienitz Zwemke & Associates'
  UNION ALL SELECT 'Timothy Kienitz, CFP, CFA', 'Financial Advisor, Anderson Hedge Wagner Kienitz Zwemke & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 381) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 381 AND name = x.name);

-- ===== GROUP 250: Merrill Wealth Management, Tulsa, OK =====
-- 383 Matt R. Cain + 494 Donald Lehman (MLCS Group), 647 Steve Jelley (Jelley, Udrisky &
-- Associates), 911 Matthew Monger (Monger, Connor & Associates) — three separate teams
-- sharing the same building.
UPDATE contacts SET
  address = '6100 S Yale Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP/CIMA, part of MLCS Group, Merrill Tulsa, alongside id 494 Donald Lehman.')), 512)
WHERE id = 383;
UPDATE contacts SET
  address = '6100 S Yale Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Vice President, Wealth Management Advisor, CDFA, co-senior partner of MLCS Group (~13-person team), Merrill Tulsa, alongside id 383 Matt R. Cain.')), 512)
WHERE id = 494;
UPDATE contacts SET
  address = '6100 S Yale Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, CFP/ChFC, co-founder of Jelley, Udrisky & Associates, Merrill Tulsa (separate team from MLCS Group and Monger Connor, sharing the same building).')), 512)
WHERE id = 647;
UPDATE contacts SET
  address = '6100 S Yale Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Sales Manager, Wealth Management Advisor, CDFA/CFP/CPFA/CRPC, leads Monger, Connor & Associates Wealth Management Group, Merrill Tulsa (separate team, same building).')), 512)
WHERE id = 911;
INSERT INTO contact_people (contact_id, name, role)
SELECT 383, x.name, x.role FROM (
  SELECT 'D. Kurt Morgan' AS name, 'SVP Wealth Management Advisor, MLCS Group' AS role
  UNION ALL SELECT 'Benjamin Culver, CFP, CPFA', 'SVP Wealth Management Advisor, MLCS Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 383) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 383 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 647, x.name, x.role FROM (
  SELECT 'Steve Udrisky' AS name, 'Financial Advisor/co-founder, Jelley, Udrisky & Associates' AS role
  UNION ALL SELECT 'Ethan Udrisky, CRPC', 'Financial Advisor, Jelley, Udrisky & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 647) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 647 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 911, x.name, x.role FROM (
  SELECT 'Robert "Bo" Connor, CPFA, CRPC' AS name, 'SVP Wealth Management Advisor, Monger, Connor & Associates' AS role
  UNION ALL SELECT 'Stephanie Chappell Morgan, CRPC', 'AVP, Senior Financial Advisor, Monger, Connor & Associates'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 911) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 911 AND name = x.name);

-- ===== GROUP 251: Wells Fargo Advisors, Jackson, MS =====
-- 384 Steve Sharp
UPDATE contacts SET
  address = '188 E Capitol St, Suite 375',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Steven F. Sharp, Financial Advisor, Wells Fargo Advisors Jackson MS (with firm since 1999); operates as an individual practice, no named team found.')), 512)
WHERE id = 384;

-- ===== GROUP 252: Merrill Wealth Management, Farmington Hills, MI =====
-- 387 Aaron Romain (The Kulhavi Team), 475 Bruce Ballard + 823 Jason Bowens (The BBRK
-- Wealth Management Group) — two separate teams sharing the same building.
UPDATE contacts SET
  address = '39001 W 12 Mile Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, member of The Kulhavi Team, Merrill Farmington Hills MI.')), 512)
WHERE id = 387;
UPDATE contacts SET
  address = '39001 W 12 Mile Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFP, member of The BBRK Wealth Management Group, Merrill Farmington Hills MI, alongside id 823 Jason Bowens.')), 512)
WHERE id = 475;
UPDATE contacts SET
  address = '39001 W 12 Mile Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Management Advisor, CFA/CFP/CPFA/CRPC/CRPS/SE-AWMA, member of The BBRK Wealth Management Group, Merrill Farmington Hills MI, alongside id 475 Bruce Ballard. #20 Michigan-Detroit Area Forbes 2026 Best-In-State.')), 512)
WHERE id = 823;
INSERT INTO contact_people (contact_id, name, role)
SELECT 387, x.name, x.role FROM (
  SELECT 'Lisa R. Kulhavi' AS name, 'Team namesake/lead advisor, The Kulhavi Team' AS role
  UNION ALL SELECT 'Amanda Pelton', 'Team member, The Kulhavi Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 387) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 387 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 823, x.name, x.role FROM (
  SELECT 'Shaun M. Kosnik, CFP' AS name, 'Team member, The BBRK Wealth Management Group' AS role
  UNION ALL SELECT 'David M. Roberge', 'Senior Vice President, Senior Consultant, The BBRK Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 823) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 823 AND name = x.name);

-- ===== GROUP 253: Fragasso Financial Advisors, Sewickley, PA =====
-- 388 Robert Fragasso — transitioned in 2025 from Founder/CEO to Chairman of the Board
UPDATE contacts SET
  title = 'Founder and Chairman of the Board',
  address = '2200 Georgetown Drive, Suite 302',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: transitioned in 2025 from Founder/CEO to Chairman of the Board; Christine (Christi) Robinette (formerly EVP, with firm since 1996) was named the firm''s new CEO. Robert Fragasso remains active with the firm in the Chairman role.')), 512)
WHERE id = 388;
INSERT INTO contact_people (contact_id, name, role)
SELECT 388, x.name, x.role FROM (
  SELECT 'Christine Robinette' AS name, 'CEO (successor to id 388 Robert Fragasso), Fragasso Financial Advisors' AS role
  UNION ALL SELECT 'Marsha Posset', 'Chief Marketing Officer, Fragasso Financial Advisors'
  UNION ALL SELECT 'Brianne King', 'Executive VP of Wealth Planning, Fragasso Financial Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 388) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 388 AND name = x.name);

-- ===== GROUP 254: Moeller Investment Group, Chesterfield, MO =====
-- 389 Michael Moeller
UPDATE contacts SET
  address = '14767 North Outer Forty Drive, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: CRM phone (518) 489-1500 is an Albany, NY area code with no connection to this St. Louis-area firm; correct number is (636) 735-3025. Confirmed current — President, Moeller Investment Group (founded 2021 after departing Wells Fargo Advisors, where he was MD-Investments since 1995). #3 Barron''s Top 1,200 2025; #3 Forbes Best-in-State (St. Louis) 2025; ~$2.8B AUM.')), 512)
WHERE id = 389;
INSERT INTO contact_people (contact_id, name, role)
SELECT 389, x.name, x.role FROM (
  SELECT 'Philip Blaxton' AS name, 'Financial Advisor, Moeller Investment Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 389) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 389 AND name = x.name);

-- ===== GROUP 255: Janney Montgomery Scott, Richmond, VA =====
-- 390 Allan Strange (The Strange Wealth Advisory Group)
UPDATE contacts SET
  address = '6241 River Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Executive Vice President/Wealth Management, Financial Advisor, leads The Strange Wealth Advisory Group, Janney Richmond VA. Barron''s Top 1,200 every year since 2015; Forbes Best-in-State every year since 2018.')), 512)
WHERE id = 390;
INSERT INTO contact_people (contact_id, name, role)
SELECT 390, x.name, x.role FROM (
  SELECT 'John F. Baron, AIF' AS name, 'Vice President, Wealth Management, Financial Advisor, The Strange Wealth Advisory Group' AS role
  UNION ALL SELECT 'Melissa G. Garrett, CFP, CDFA, AIF, AWMA', 'Senior Vice President, Wealth Management, Financial Advisor, The Strange Wealth Advisory Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 390) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 390 AND name = x.name);

-- ===== GROUP 256: Ameriprise Financial, Owensboro, KY =====
-- 391 William Watson (goes by "Drew Watson," Align Wealth Management)
UPDATE contacts SET
  address = '2708 New Hartford Rd',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes professionally by "Drew Watson" (full name William A. Watson), CFP, Private Wealth Advisor and head/CEO of Align Wealth Management, an Ameriprise practice, Owensboro KY. Named to 2026 Forbes Best-in-State Wealth Advisors.')), 512)
WHERE id = 391;
INSERT INTO contact_people (contact_id, name, role)
SELECT 391, x.name, x.role FROM (
  SELECT 'Amy Wiitala, CFP' AS name, 'Managing Director / Chief Operating Officer, Align Wealth Management' AS role
  UNION ALL SELECT 'Michael Tison', 'Managing Director, Align Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 391) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 391 AND name = x.name);

-- ===== GROUP 257: Wells Fargo Advisors, Virginia Beach, VA =====
-- 392 Garret Alcaraz — team rebranded 2024 from "Alcaraz Fisher Justis Wealth Management
-- Group" to "Bold Capital Wealth Management Group" (same office/phone)
UPDATE contacts SET
  address = '208 Golden Oak Ct, Suite 300 (Reflections III)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: team rebranded in 2024 from "Alcaraz Fisher Justis Wealth Management Group" to "Bold Capital Wealth Management Group" (same office/phone). Often shown professionally as "Gary Alcaraz," Financial Advisor, CIMA/CPWA (28+ yrs experience). Barron''s Top 1,500 2026; team on Forbes 2026 Best-in-State Wealth Management Teams.')), 512)
WHERE id = 392;
INSERT INTO contact_people (contact_id, name, role)
SELECT 392, x.name, x.role FROM (
  SELECT 'Ann Justis' AS name, 'Financial Advisor (manages Eastern Shore office), Bold Capital Wealth Management Group' AS role
  UNION ALL SELECT 'Hunter Fisher', 'Senior Vice President, Financial Advisor, chairs investment committee, Bold Capital Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 392) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 392 AND name = x.name);

-- ===== GROUP 258: Merrill Wealth Management, Salt Lake City, UT =====
-- 393 Jeff Roundy (team now "Roundy, Joseph & Pantone")
UPDATE contacts SET
  address = '60 E South Temple St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Jeffry Roundy, CFP/CIMA, Managing Director/Wealth Management Advisor, Merrill Salt Lake City; team now branded "Roundy, Joseph & Pantone." Barron''s Top 1,200 multiple years 2012-2022; Forbes 2026 Best-in-State Wealth Management Teams (#1 Utah, 2023).')), 512)
WHERE id = 393;
INSERT INTO contact_people (contact_id, name, role)
SELECT 393, x.name, x.role FROM (
  SELECT 'Randy Joseph, CPFA' AS name, 'Financial Advisor, Roundy, Joseph & Pantone' AS role
  UNION ALL SELECT 'Ashley Pantone, CPFA, CEPA', 'Financial Advisor, Roundy, Joseph & Pantone'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 393) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 393 AND name = x.name);

-- ===== GROUP 259: Merrill Wealth Management, Birmingham, AL — 205-326-9606 =====
-- 394 Brian Woodke (Woodke, Donnell & Wilder / Woodke, Donnell, Wilder, Buchan & Armstrong)
UPDATE contacts SET
  address = '569 Brookwood Village',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — full name Brian M. Woodke, CFP/CIMA/CPFA/C(k)P, Senior Financial Advisor/SVP-Wealth Management, leads Woodke, Donnell & Wilder (also referenced as Woodke, Donnell, Wilder, Buchan & Armstrong), Merrill Birmingham AL. #8 Forbes Best-in-State (AL) 2024; ~$1.7B AUM.')), 512)
WHERE id = 394;
INSERT INTO contact_people (contact_id, name, role)
SELECT 394, x.name, x.role FROM (
  SELECT 'Sam Donnell' AS name, 'Financial Advisor, Woodke, Donnell & Wilder' AS role
  UNION ALL SELECT 'Guy "Bentley" Wilder', 'Financial Advisor, Woodke, Donnell & Wilder'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 394) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 394 AND name = x.name);

-- ===== GROUP 260: UBS Private Wealth Management, Salt Lake City, UT =====
-- 395 Michael Peirce (Sage Partners)
UPDATE contacts SET
  address = '95 State Street, Suite 2210',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — goes by "Mike" Peirce, CFP/CIMA, Managing Director, leads Sage Partners, UBS Salt Lake City (joined UBS 2014, previously 13 years at Morgan Stanley). #1 Utah Forbes Best-in-State 2025/2026; Barron''s Top 1,200/1,500 2022-2024, 2026.')), 512)
WHERE id = 395;
INSERT INTO contact_people (contact_id, name, role)
SELECT 395, x.name, x.role FROM (
  SELECT 'Danielle Bellon' AS name, 'Team member (managed accounts/retirement platforms), Sage Partners' AS role
  UNION ALL SELECT 'Allison Smoot, CFP, CDFA, AIF', 'Financial Advisor, Sage Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 395) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 395 AND name = x.name);
