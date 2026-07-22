-- US Financial Advisor enrichment, batch 26 (20 contacts / 20 groups).
--
-- Firm-change correction: 780 Jerod Spaeth's Northwestern Mutual
-- Private Client Group practice ("Amplify Wealth Partners") merged
-- into Socium Advisors (a St. Louis-headquartered NM Private Client
-- Group firm) around April 2026, ~$1.6B AUM combined into Socium's
-- ~$4.3B. Spaeth remains in Milwaukee as a Socium Partner. This same
-- merger also explains why id 777 Scott Underwood's Socium Advisors
-- research (St. Louis) surfaced Spaeth as a new partner.
--
-- Cross-CRM-record match confirmed: 796 David Brazen (Ameriprise Troy,
-- MI) is the SAME person previously listed only as an unconfirmed
-- team member under id 733 Eric Furlotte's "TruVista Wealth Advisors"
-- record in batch 24 (migration 083) — not a coincidental namesake.
-- Both records updated to reflect the confirmed relationship.

-- ===== GROUP 501: Baird, Anchorage, AK =====
-- 770 Sarah Springer (The Planning Group of the Northwest)
UPDATE contacts SET
  address = '3800 Centerpoint Drive, Suite 1120',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, part of "The Planning Group of the Northwest," Baird Anchorage AK. Forbes #3 Best-In-State Alaska 2025; #1 Top Women Wealth Advisors Best-In-State Alaska 2025.')), 512)
WHERE id = 770;
INSERT INTO contact_people (contact_id, name, role)
SELECT 770, x.name, x.role FROM (
  SELECT 'Grant Shearer' AS name, 'Senior Partner & Resident Manager, Baird Anchorage' AS role
  UNION ALL SELECT 'Melanie Schmieding', 'Director, Baird Family Wealth'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 770) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 770 AND name = x.name);

-- ===== GROUP 502: Merrill Wealth Management, Anchorage, AK =====
-- 771 Kenneth Jones (JP Group)
UPDATE contacts SET
  address = '3601 C Street, Frontier Building, Floor 14',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Senior Financial Advisor / SVP, part of "JP Group" (#1 Forbes Best-in-State Wealth Management Team Alaska 2023-2026), Merrill Anchorage AK (34+ yr career). Forbes #7 Best-In-State Alaska 2026; Barron''s Top 1,200/1,500 continuously 2010-2011/2013-2026.')), 512)
WHERE id = 771;
INSERT INTO contact_people (contact_id, name, role)
SELECT 771, x.name, x.role FROM (
  SELECT 'John Peterson' AS name, 'Financial Advisor (with Merrill since 1995), JP Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 771) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 771 AND name = x.name);

-- ===== GROUP 503: Ameriprise Financial, Louisville, KY =====
-- 772 Dean Donohue (Encore Wealth Management Group)
UPDATE contacts SET
  address = '9405 Mill Brook Rd, Ste 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, MBA/CFP/CRPC/APMA, "Encore Wealth Management Group," Ameriprise Louisville KY. Forbes Best-in-State 2026; Ameriprise Circle of Success 2000-2024. CRM phone (502) 423-6200 differs from the team''s listed number (502) 412-4050 — worth verifying.')), 512)
WHERE id = 772;
INSERT INTO contact_people (contact_id, name, role)
SELECT 772, x.name, x.role FROM (
  SELECT 'Jonathan P. Smith' AS name, 'Private Wealth Advisor/Managing Partner, Encore Wealth Management Group' AS role
  UNION ALL SELECT 'Chase M. Donohue, CFP, CRPC, APMA, BFA', 'Private Wealth Advisor (likely relative of Dean), Encore Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 772) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 772 AND name = x.name);

-- ===== GROUP 504: Wells Fargo Advisors, Springfield, MO =====
-- 773 Jeffrey Layman (Jeff Layman Group)
UPDATE contacts SET
  address = '1720 E. Bradford Pkwy',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial advisor, leads the "Jeff Layman Group" (~26 yrs, started A.G. Edwards, then Morgan Stanley, moved team to Wells Fargo ~5 yrs ago), Springfield MO (team also has a Lee''s Summit MO satellite office). Barron''s-ranked (sole Springfield-area advisor previously named). CRM phone (877) 879-2495 is generic toll-free; direct line (417) 841-3409.')), 512)
WHERE id = 773;
INSERT INTO contact_people (contact_id, name, role)
SELECT 773, x.name, x.role FROM (
  SELECT 'Lisa Jordison (Layman-Jordison)' AS name, 'Financial Consultant (sister of Jeffrey, Lee''s Summit MO office), Jeff Layman Group' AS role
  UNION ALL SELECT 'Melanie Allen', 'Client Associate, Jeff Layman Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 773) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 773 AND name = x.name);

-- ===== GROUP 505: UBS Wealth Management, Bloomington, MN =====
-- 774 Jacob Creydt (CHMC Wealth Management)
UPDATE contacts SET
  address = '8500 Normandale Lake Boulevard, Suite 210',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Senior Portfolio Manager & Institutional Consultant, UBS Bloomington MN. Team rebranded from "Creydt & Hay Wealth Management" to "CHMC Wealth Management" June 1, 2023 (Chip and Mick Connelly joined). Barron''s Top 1,200 2017-2025, Top 1,500 2026; Forbes Best-in-State 2018-2026.')), 512)
WHERE id = 774;
INSERT INTO contact_people (contact_id, name, role)
SELECT 774, x.name, x.role FROM (
  SELECT 'James Hay' AS name, 'Senior Vice President-Wealth Management, Senior Portfolio Manager, CHMC Wealth Management' AS role
  UNION ALL SELECT 'Mick Connelly, CFA', 'Advisor (joined team 2011), CHMC Wealth Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 774) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 774 AND name = x.name);

-- ===== GROUP 506: RBC Wealth Management, Rapid City, SD =====
-- 775 David Hillard (Hillard Wealth Solutions Group)
UPDATE contacts SET
  address = '243 Founders Park Dr., Suite 101',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Branch Director, Senior Portfolio Manager, leads "Hillard Wealth Solutions Group" (#1 Forbes Best-In-State Wealth Management Team 2025), RBC Rapid City SD. RBC Chairman''s Council; Forbes Best-In-State 2026.')), 512)
WHERE id = 775;
INSERT INTO contact_people (contact_id, name, role)
SELECT 775, x.name, x.role FROM (
  SELECT 'Micah Williams' AS name, 'Financial Advisor, Hillard Wealth Solutions Group' AS role
  UNION ALL SELECT 'Lori Keller', 'Financial Advisor, Hillard Wealth Solutions Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 775) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 775 AND name = x.name);

-- ===== GROUP 507: Wells Fargo Advisors, Quincy, IL =====
-- 776 John Stevenson Jr. (Stevenson Paxton Group)
UPDATE contacts SET
  address = '510 Maine St, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Branch Manager since 2003, leads the "Stevenson Paxton Group," Wells Fargo Quincy IL. Forbes #49 Best-In-State Wealth Management Team Illinois 2025; individually #22 Best-In-State IL 2025.')), 512)
WHERE id = 776;
INSERT INTO contact_people (contact_id, name, role)
SELECT 776, x.name, x.role FROM (
  SELECT 'William G. Paxton' AS name, 'Managing Director-Investments/Financial Advisor, Stevenson Paxton Group' AS role
  UNION ALL SELECT 'Brandon L. Miles', 'Financial Advisor (joined as Client Associate 2012), Stevenson Paxton Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 776) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 776 AND name = x.name);

-- ===== GROUP 508: Socium Advisors | Northwestern Mutual, St. Louis, MO =====
-- 777 Scott Underwood
UPDATE contacts SET
  address = '622 Emerson Road, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Founder and CEO, Socium Advisors (Northwestern Mutual Private Client Group), St. Louis MO. Barron''s Top 1,200 seven consecutive years. Firm grew to ~$4.3B AUM after an April 2026 merger with Milwaukee-based Amplify Wealth Partners ($1.6B AUM, led by id 780 Jerod Spaeth, who joined as Partner) — see id 780''s record for that side of the merger.')), 512)
WHERE id = 777;
INSERT INTO contact_people (contact_id, name, role)
SELECT 777, x.name, x.role FROM (
  SELECT 'P.J. McDaniel' AS name, 'Chief Growth Officer, Socium Advisors' AS role
  UNION ALL SELECT 'John R. Calvert III', 'Wealth Advisor, Socium Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 777) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 777 AND name = x.name);

-- ===== GROUP 509: Merrill Wealth Management, Fort Wayne, IN =====
-- 778 Daniel Finley (Finley, Haire, and Associates)
UPDATE contacts SET
  address = '9921 Dupont Circle Dr W',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Senior Financial Advisor (with Merrill since 1999), leads "Finley, Haire, and Associates," Merrill Fort Wayne IN. Barron''s Top 1,200 2017-2025; Forbes Best-in-State Wealth Management Teams 2023-2025.')), 512)
WHERE id = 778;
INSERT INTO contact_people (contact_id, name, role)
SELECT 778, x.name, x.role FROM (
  SELECT 'Tyler Haire, CFP' AS name, 'First Vice President, Wealth Management Advisor, Finley, Haire, and Associates' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 778) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 778 AND name = x.name);

-- ===== GROUP 510: Morgan Stanley Wealth Management, Hagerstown, MD =====
-- 779 Jim Holzapfel (The Holzapfel Group)
UPDATE contacts SET
  address = '1185 Imperial Dr, Suite 102',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Branch Manager, leads "The Holzapfel Group," Morgan Stanley Hagerstown MD (team moved from Wells Fargo Advisors, predecessor Kidder Peabody, in 2020). Barron''s Top 100 2010-2017/2019; Forbes Best-In-State #47 MD 2025.')), 512)
WHERE id = 779;
INSERT INTO contact_people (contact_id, name, role)
SELECT 779, x.name, x.role FROM (
  SELECT 'K. Richard "Richie" Holzapfel, CFP' AS name, 'First Vice President, Financial Advisor (joined 2012), The Holzapfel Group' AS role
  UNION ALL SELECT 'William C. "Tad" Holzapfel, CFP', 'Financial Advisor (joined 2017), The Holzapfel Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 779) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 779 AND name = x.name);

-- ===== GROUP 511: Northwestern Mutual, Milwaukee, WI (actual firm: Socium Advisors) =====
-- 780 Jerod Spaeth
UPDATE contacts SET
  firm = 'Socium Advisors | Northwestern Mutual',
  title = 'Partner',
  address = '330 E. Kilbourn Ave., Suite 950',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CORRECTION: Jerod Spaeth''s Northwestern Mutual Private Client Group practice, "Amplify Wealth Partners" (~$1.6B AUM), merged into Socium Advisors (St. Louis-headquartered NM Private Client Group firm, led by id 777 Scott Underwood) around April 2026. Spaeth joined as a Partner, remains based in Milwaukee WI; combined firm now ~$4.3B AUM.')), 512)
WHERE id = 780;
INSERT INTO contact_people (contact_id, name, role)
SELECT 780, x.name, x.role FROM (
  SELECT 'John Barrett' AS name, 'Partner (formerly Spaeth Barrett Group), Socium Advisors' AS role
  UNION ALL SELECT 'Andrew Hoy', 'Partner (joined via merger), Socium Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 780) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 780 AND name = x.name);

-- ===== GROUP 512: Cornerstone Wealth Strategies, Kennewick, WA =====
-- 782 Matt Riesenweber
UPDATE contacts SET
  address = '8905 W. Gage Blvd., Suite 110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CEO & Wealth Advisor, Cornerstone Wealth Strategies, Inc. (independent RIA since 2018, LPL Financial-affiliated), Kennewick WA. Forbes Best-in-State #6 WA; LPL Summit Club 2026. CRM phone (509) 783-6050 could not be corroborated; firm''s listed number is (509) 396-0588.')), 512)
WHERE id = 782;
INSERT INTO contact_people (contact_id, name, role)
SELECT 782, x.name, x.role FROM (
  SELECT 'Tyler Scott, CFP' AS name, 'Wealth Advisor, Cornerstone Wealth Strategies' AS role
  UNION ALL SELECT 'Cameron Burch, AIF', 'Advisor, Cornerstone Wealth Strategies'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 782) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 782 AND name = x.name);

-- ===== GROUP 513: Morgan Stanley Wealth Management, Northfield, NJ =====
-- 783 Charles Malamut (The Malamut Group)
UPDATE contacts SET
  address = '1601 New Road, 1st Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Goes by "Chuck," founder and lead advisor of "The Malamut Group," Morgan Stanley Northfield NJ. Barron''s Top 1,200 2020; Forbes Best-In-State NJ 2021/2022/2025, team Best-In-State Wealth Management Teams 2024. A related but distinct practice, "The Vitagliano-Malamut Group" (led by Jesse Vitagliano, with Lawrence "Larry" Malamut), also operates from the same Northfield office — not to be confused with this contact.')), 512)
WHERE id = 783;
INSERT INTO contact_people (contact_id, name, role)
SELECT 783, x.name, x.role FROM (
  SELECT 'Michael "Mike" Torpey' AS name, 'Financial Advisor, Chartered Retirement Plan Specialist, The Malamut Group' AS role
  UNION ALL SELECT 'Frank Malamut', 'Financial Advisor, The Malamut Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 783) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 783 AND name = x.name);

-- ===== GROUP 514: DeWees Private Wealth Mgmt | Wells Fargo Advisors FiNet, Greenville, DE =====
-- 784 Donald DeWees Jr. (The DeWees Group)
UPDATE contacts SET
  address = '3703 Kennett Pike',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Partner, "The DeWees Group" (11-person team, $1B+ AUM), DeWees Private Wealth Management (Wells Fargo Advisors FiNet), Greenville DE. Forbes #2 Best-In-State Delaware 2025, Best-In-State Wealth Management Teams 2026; Barron''s Top 1,500 2026.')), 512)
WHERE id = 784;
INSERT INTO contact_people (contact_id, name, role)
SELECT 784, x.name, x.role FROM (
  SELECT 'Dana L. Edwards' AS name, 'Branch Manager & Managing Director (with team since 1983), The DeWees Group' AS role
  UNION ALL SELECT 'Cecelia L. Dugan, CFP', 'Financial Advisor & First Vice President (40+ yrs with practice), The DeWees Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 784) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 784 AND name = x.name);

-- ===== GROUP 515: RBC Wealth Management, Brookfield, WI =====
-- 785 Daniel Kolb (The Kolb Investment Group)
UPDATE contacts SET
  address = '18500 West Corporate Drive, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director/SVP, Financial Advisor (with RBC since 1989), leads "The Kolb Investment Group," Brookfield WI. Barron''s Top 1,200 2025; Forbes #19 Best-In-State Wisconsin 2026.')), 512)
WHERE id = 785;
INSERT INTO contact_people (contact_id, name, role)
SELECT 785, x.name, x.role FROM (
  SELECT 'Matt Kolb' AS name, 'Senior Financial Associate/Financial Advisor, The Kolb Investment Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 785) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 785 AND name = x.name);

-- ===== GROUP 516: United Iowa Financial, Iowa City, IA =====
-- 786 Eli Wynes
UPDATE contacts SET
  address = '2346 Mormon Trek Blvd, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — President & CFO of United Iowa Financial (Commonwealth Financial Network affiliate, helped establish April 2019), Iowa City IA. Barron''s Top 1,200 2023; Forbes Best-In-State/Next-Gen 2019, #64 2026. CRM phone (319) 354-5580 differs from a firm number found in search ((319) 449-1145) — worth verifying.')), 512)
WHERE id = 786;
INSERT INTO contact_people (contact_id, name, role)
SELECT 786, x.name, x.role FROM (
  SELECT 'Mark Law' AS name, 'Partner Wealth Advisor, United Iowa Financial' AS role
  UNION ALL SELECT 'Michael Lehman', 'Partner Wealth Advisor, United Iowa Financial'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 786) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 786 AND name = x.name);

-- ===== GROUP 517: Rockefeller Capital Management, Los Angeles, CA =====
-- 788 Pedro Marti (Marti Wealth Partners)
UPDATE contacts SET
  address = '1900 Avenue of the Stars, Suite 1000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Private Advisor, leads "Marti Wealth Partners," Rockefeller Los Angeles CA (joined from Wells Fargo, bringing ~$1B AUM).')), 512)
WHERE id = 788;
INSERT INTO contact_people (contact_id, name, role)
SELECT 788, x.name, x.role FROM (
  SELECT 'Loreen Washburn' AS name, 'Senior Client Associate (moved with Marti from Wells Fargo), Marti Wealth Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 788) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 788 AND name = x.name);

-- ===== GROUP 518: Raymond James, Sioux Falls, SD (actual firm detail: Loft Advisors) =====
-- 789 Nathan Quello
UPDATE contacts SET
  firm = 'Loft Advisors (First Dakota National Bank) | Raymond James Financial Services',
  address = '101 N Main Avenue, Suite 201',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Financial Advisor, Loft Advisors (division of First Dakota National Bank, securities through Raymond James Financial Services), Sioux Falls SD. Forbes #2 Best-In-State South Dakota 2025. Works alongside father John Quello — team moved together from UBS in 2013.')), 512)
WHERE id = 789;
INSERT INTO contact_people (contact_id, name, role)
SELECT 789, x.name, x.role FROM (
  SELECT 'John Quello' AS name, 'Financial Advisor (father/partner, ~40 yrs experience), Loft Advisors' AS role
  UNION ALL SELECT 'Dan Statema', 'Advisor, Loft Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 789) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 789 AND name = x.name);

-- ===== GROUP 519: Morgan Stanley Wealth Management, Purchase, NY =====
-- 795 Anthony Maddalena (The Maddalena Group)
UPDATE contacts SET
  address = '2000 Westchester Ave, Suite 1NC',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Group Director/founding partner, "The Maddalena Group," Morgan Stanley Purchase NY. Forbes #239 America''s Top Wealth Advisors 2025; team Forbes Best-In-State Wealth Management Teams 2023-2026.')), 512)
WHERE id = 795;
INSERT INTO contact_people (contact_id, name, role)
SELECT 795, x.name, x.role FROM (
  SELECT 'Seth Marcus, CFP' AS name, 'Financial Advisor, The Maddalena Group' AS role
  UNION ALL SELECT 'Judith Battaglia, CFP, CRPC', 'Team member, The Maddalena Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 795) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 795 AND name = x.name);

-- ===== GROUP 520: Ameriprise Financial, Troy, MI =====
-- 796 David Brazen (TruVista Wealth Advisors) — confirmed cross-reference to id 733 Eric Furlotte (batch 24)
UPDATE contacts SET
  address = '1301 W Long Lake Rd, Ste 270',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, CRPC, Managing Partner of "TruVista Wealth Advisors," Ameriprise Troy MI. CROSS-REFERENCE CONFIRMED: this is the same David Brazen listed as an unconfirmed team member under id 733 Eric Furlotte''s TruVista Wealth Advisors record (batch 24) — verified via TruVista''s own team page and a TruVista trademark registration in his name. Alongside id 733 Eric Furlotte, Kevin Hepner, and Jason Batchelder as co-Managing Partners.')), 512)
WHERE id = 796;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | SUPPLEMENTARY (batch 26): team member "David Brazen" is confirmed as id 796, a separate CRM contact (Ameriprise Troy MI, TruVista Wealth Advisors co-Managing Partner) — not merely an unnamed colleague.')), 512)
WHERE id = 733;
INSERT INTO contact_people (contact_id, name, role)
SELECT 796, x.name, x.role FROM (
  SELECT 'Eric Furlotte' AS name, 'Managing Partner (Farmington Hills MI office; also id 733 in this CRM), TruVista Wealth Advisors' AS role
  UNION ALL SELECT 'Kevin Hepner', 'Managing Partner, TruVista Wealth Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 796) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 796 AND name = x.name);
