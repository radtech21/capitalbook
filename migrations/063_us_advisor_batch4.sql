-- US Financial Advisor enrichment, batch 4 (~53 contacts / 17 researched
-- groups + 2 directly-resolved cross-reference contacts).
--
-- Two contacts were resolved directly from already-confirmed addresses
-- in prior batches, without a new research agent, because they shared an
-- exact CRM phone number with an already-researched office:
--   * 91 Dorian McKelvy shares (650) 926-7600 with contacts 10/11/217
--     (The 545 Group / The 173 Group, Menlo Park — migration 060).
--   * 112 Steven Strzelecki shares (516) 746-2600 with contact 83 (Bruce
--     Burrows, The Burrows Strzelecki Group, Garden City NY — migration
--     062) — he is in fact Burrows' named co-head, already identified as
--     a colleague in that migration's contact_people insert.
--
-- Three firm-change corrections in the JPMorgan NY group: 157 Elizabeth
-- Weikes departed for Wells Fargo Advisors (~Feb 2026, ~$3.1B team);
-- 400 Glenn Degenaars and 790 Jason Babb departed together for RBC
-- Wealth Management (~April 2025, ~$5B "Degenaars Babb Group").
--
-- Firm-acquisition flag: 113/220/446 (Evoke Advisors, LA) — Evoke was
-- acquired by MAI Capital Management (Oct 31, 2025) and relocated to a
-- new Century City office; flagged in data_flags, firm field not renamed
-- per the same convention used for other post-acquisition entities.
--
-- Same tooling-outage pattern as prior batches.

-- ===== GROUP 61: J.P. Morgan Wealth Management, Los Angeles, CA =====
-- 88 Matthew Babrick (The Babrick Team / Babrick Leff Mavredakis Team)
UPDATE contacts SET
  address = '2029 Century Park East, Suite 3700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, J.P. Morgan Wealth Management, Century City LA; joined JPM Oct 2023.')), 512)
WHERE id = 88;
INSERT INTO contact_people (contact_id, name, role)
SELECT 88, x.name, x.role FROM (
  SELECT 'Ethan Leff, CFA' AS name, 'Financial Advisor, co-lead, The Babrick Team' AS role
  UNION ALL SELECT 'Michael Mavredakis', 'Wealth Advisor, The Babrick Team'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 88) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 88 AND name = x.name);

-- ===== GROUP 62: Cresset, Scottsdale, AZ =====
-- 89 Charlie Maxwell
UPDATE contacts SET
  title = 'Co-Founder and Co-Chairman',
  address = '18801 N. Thompson Peak Parkway, Suite 320',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Title corrected — Co-Founder and Co-Chairman of Cresset (formerly Chairman & CEO of Meristem Family Wealth, merged into Cresset 2022), not a plain "Financial Advisor." Barron''s Top 1,200 2025 #1 in Arizona; Barron''s Top 100 Independent Advisor 2025 (#39). Note: some bio material ties his day-to-day base to Cresset''s Minnetonka, MN office rather than Scottsdale — office city is ambiguous, address applied is the Scottsdale team''s.')), 512)
WHERE id = 89;
INSERT INTO contact_people (contact_id, name, role)
SELECT 89, x.name, x.role FROM (SELECT 'Dan Kambeitz, CFP' AS name, 'Managing Director, Wealth Advisor, Cresset Scottsdale' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 89) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 89 AND name = x.name);

-- ===== GROUP 63: Morgan Stanley Wealth Management, Menlo Park, CA — resolved via cross-reference =====
-- 91 Dorian McKelvy shares the exact CRM phone number ((650) 926-7600) with contacts 10/11/217
-- (The 545 Group / The 173 Group), already confirmed at 2725 Sand Hill Road in migration 060.
UPDATE contacts SET
  address = '2725 Sand Hill Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Address applied by cross-reference: shares the exact CRM phone number (650) 926-7600 with contacts 10, 11, and 217 (The 545 Group / The 173 Group, Morgan Stanley Menlo Park), already confirmed at this address in migration 060 — same building/switchboard, though his specific team affiliation was not independently re-verified this pass.')), 512)
WHERE id = 91;

-- ===== GROUP 64+71: Morgan Stanley, Chicago, IL (233 S Wacker Dr / Willis Tower) — two CRM groups, same building =====
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads One Point Wealth Management Group, Morgan Stanley Wealth Management, Willis Tower Chicago; ~30-year MS veteran, Forbes #15 Chicago Private Wealth (2025).')), 512)
WHERE id = 92;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads Chicago Tower Group, Morgan Stanley Wealth Management, Willis Tower Chicago; Corporate Client Group/stock plan specialist, Chairman''s Club.')), 512)
WHERE id = 141;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — The Mathias Group, Morgan Stanley Wealth Management, Willis Tower Chicago; Barron''s 2026 Top 250 Wealth Management Teams #234.')), 512)
WHERE id = 1133;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads The Davis Wealth Management Group, Morgan Stanley Wealth Management, Willis Tower Chicago; Chairman''s Club, Barron''s Top 1,200 (2014-16, 2020-24).')), 512)
WHERE id = 1172;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Graystone Consulting - SVLO Chicago Group, Morgan Stanley Private Wealth Management; Barron''s Top Institutional Consultants (2016-2024), Barron''s Top 100 Women.')), 512)
WHERE id = 103;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Graystone Consulting - Chicago, Morgan Stanley Private Wealth Management; ranked #2 Best-In-State Chicago Private Wealth (2025), ~$2B AUM oversight.')), 512)
WHERE id = 106;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor/Lending Specialist/Family Wealth Director, Graystone Consulting - Chicago (same team as Whitney, id 106); joined MS 2016.')), 512)
WHERE id = 206;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — leads The Kartheiser Group, Morgan Stanley, Willis Tower Chicago; Forbes Best-In-State Team 2023-2026, Barron''s Top 1,500 2026.')), 512)
WHERE id = 534;
UPDATE contacts SET
  address = '233 S Wacker Dr, Suite 8600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Morgan Stanley Private Wealth Management, Alternative Investments Director, UHNW multi-generational family specialist; Forbes #22 Best-In-State Chicago Private Wealth (2025). Address confidence: moderate — one aggregator lists a conflicting Suite 9200 for him at the same building; not fully resolved.')), 512)
WHERE id = 674;
INSERT INTO contact_people (contact_id, name, role)
SELECT 92, x.name, x.role FROM (
  SELECT 'Alan S. Guernsey' AS name, 'Financial Advisor, One Point Wealth Management Group' AS role
  UNION ALL SELECT 'Andrew G. Rothstein', 'Financial Advisor, One Point Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 92) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 92 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 106, x.name, x.role FROM (
  SELECT 'Michael Sakach' AS name, 'Graystone Consulting - Chicago' AS role
  UNION ALL SELECT 'Brian Birnbaum', 'Graystone Consulting - Chicago'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 106) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 106 AND name = x.name);

-- ===== GROUP 65: Morgan Stanley Wealth Management, Washington, D.C. (The I Street Group) =====
-- 93 Brett Anthony, 94 H.L. McLaughlin III
UPDATE contacts SET
  address = '1775 I St NW, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — heads Private Wealth Management practice, The I Street Group, Morgan Stanley DC (a different building than the other DC CRM group, 1747 Pennsylvania Ave NW); Barron''s Top 1,200 recipient 2008-2025.')), 512)
WHERE id = 93;
UPDATE contacts SET
  address = '1775 I St NW, Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — "Trip" McLaughlin, heads Institutional Consulting Practice, The I Street Group, Morgan Stanley DC; CIMA.')), 512)
WHERE id = 94;
INSERT INTO contact_people (contact_id, name, role)
SELECT 93, x.name, x.role FROM (
  SELECT 'Matthew Offen, CRPS' AS name, 'Corporate Retirement Director & Family Wealth Director, The I Street Group' AS role
  UNION ALL SELECT 'Jonathan Sowanick', 'Executive Director, Senior Portfolio Management Director, The I Street Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 93) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 93 AND name = x.name);

-- ===== GROUP 66: Rockefeller Capital Management, New York, NY =====
-- 95 Ed Moldaver, 287 John Sargent, 718 Michael Bapis
UPDATE contacts SET
  address = '45 Rockefeller Plaza, Floor 5',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Advisor, Rockefeller Capital Management; Forbes #62 Best-In-State (2026).')), 512)
WHERE id = 95;
UPDATE contacts SET
  address = '45 Rockefeller Plaza, Floor 5',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Advisor, leads The Sargent Group, Rockefeller Capital Management (joined 2020 from Morgan Stanley).')), 512)
WHERE id = 287;
UPDATE contacts SET
  address = '45 Rockefeller Plaza, Floor 5',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, Head of Sports and Entertainment with Vios Advisors (division of Rockefeller Capital Management); team celebrated 7-year anniversary at Rockefeller.')), 512)
WHERE id = 718;
INSERT INTO contact_people (contact_id, name, role)
SELECT 287, x.name, x.role FROM (
  SELECT 'Daniel Marchon' AS name, 'Private Advisor, The Sargent Group' AS role
  UNION ALL SELECT 'Trever Sipperly', 'Private Advisor, Vice President, The Sargent Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 287) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 287 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 718, x.name, x.role FROM (SELECT 'Nick M. Bapis' AS name, 'Managing Director, Vios Advisors (co-founder)' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 718) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 718 AND name = x.name);

-- ===== GROUP 67: Merrill Wealth Management, Lakewood Ranch, FL =====
-- 96 Dominic Casanueva (The Casanueva Group)
UPDATE contacts SET
  address = '6311 Atrium Dr',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Resident Director & Senior Portfolio Manager, leads The Casanueva Group, Merrill Lakewood Ranch/Bradenton FL; Barron''s #203 America''s Top Wealth Advisors 2025, #2 Best-In-State FL-Tampa Area.')), 512)
WHERE id = 96;
INSERT INTO contact_people (contact_id, name, role)
SELECT 96, x.name, x.role FROM (SELECT 'Ryan Kowadla, C(k)P, CRPS, CPFA' AS name, 'Wealth Management Advisor, Senior Vice President, The Casanueva Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 96) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 96 AND name = x.name);

-- ===== GROUP 68: Merrill Wealth Management, Grand Rapids, MI (Veldheer Bernecker Team) =====
-- 97 Timothy Long, 205 William Mackay, 279 Scott Bernecker
UPDATE contacts SET
  address = '250 Monroe Ave NW, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, Managing Director, partner in the Veldheer Bernecker Team, Merrill Grand Rapids (with firm since 1994); 2026 Barron''s Top 1,500, Forbes #3 MI (2026).')), 512)
WHERE id = 97;
UPDATE contacts SET
  address = '250 Monroe Ave NW, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — CIMA, Managing Director, managing partner of the Veldheer Bernecker Team, Merrill Grand Rapids (with firm since 1993); Forbes #17 MI (2025).')), 512)
WHERE id = 205;
UPDATE contacts SET
  address = '250 Monroe Ave NW, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, partner in the Veldheer Bernecker Team, Merrill Grand Rapids (with firm since 1997).')), 512)
WHERE id = 279;
INSERT INTO contact_people (contact_id, name, role)
SELECT 97, x.name, x.role FROM (SELECT 'James Veldheer, CIMA, CRPC' AS name, 'Managing Director, senior partner, Veldheer Bernecker Team' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 97) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 97 AND name = x.name);

-- ===== GROUP 69: The Optimal Service Group | Wells Fargo Advisors, Williamsburg, VA =====
-- 98 Joseph Montgomery
UPDATE contacts SET
  address = '428 McLaws Circle, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Investments, heads The Optimal Service Group, Wells Fargo Advisors, Williamsburg VA; Forbes 2025 Best-in-State VA #1.')), 512)
WHERE id = 98;
INSERT INTO contact_people (contact_id, name, role)
SELECT 98, x.name, x.role FROM (
  SELECT 'R. Bryce Lee' AS name, 'Managing Director - Investments, Head of Institutional Consulting, The Optimal Service Group' AS role
  UNION ALL SELECT 'Julia M. Halstead', 'Team member (trust/estate), The Optimal Service Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 98) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 98 AND name = x.name);

-- ===== GROUP 70: Morgan Stanley Private Wealth Management, Los Angeles, CA — spans multiple buildings/teams =====
-- 99 Joseph McCullough shares Zager Fixed Income Management with contact 15 (Drew Zager, migration 060), same confirmed address.
UPDATE contacts SET
  address = '1999 Avenue of the Stars, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Senior Portfolio Management Director, member of Zager Fixed Income Management (same team as contact 15, Drew Zager, migration 060), Morgan Stanley LA.')), 512)
WHERE id = 99;
UPDATE contacts SET
  address = '1999 Avenue of the Stars, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The KLT Group, Morgan Stanley LA (same building as Zager Fixed Income Management, id 99).')), 512)
WHERE id = 299;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor and Corporate Client Group Director, Wingfield Wealth Management Group, Morgan Stanley LA (appears to be a different building, ~10960 Wilshire Blvd, from ids 99/299 despite the shared CRM phone number). Address not applied pending confirmation.')), 512)
WHERE id = 422;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, ESW Group, Morgan Stanley LA (joined 2015, ex-Credit Suisse/UBS). Office address unresolved this pass.')), 512)
WHERE id = 511;
UPDATE contacts SET
  address = '444 S. Flower Street, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, leads his own UHNW PWM team, Morgan Stanley LA (joined MS 2015 from UBS, prior Goldman Sachs); same building as The Malone Neuhaus Group (migration 060, contacts 18/19).')), 512)
WHERE id = 787;
INSERT INTO contact_people (contact_id, name, role)
SELECT 299, x.name, x.role FROM (
  SELECT 'Rick Keller' AS name, 'The KLT Group' AS role
  UNION ALL SELECT 'Bobby Thomason', 'The KLT Group'
  UNION ALL SELECT 'Robert Lord', 'Executive Director, Private Wealth Advisor, The KLT Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 299) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 299 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 422, x.name, x.role FROM (
  SELECT 'Justin S. Hinkes, CIMA' AS name, 'Wingfield Wealth Management Group' AS role
  UNION ALL SELECT 'Howard Blitz', 'Wingfield Wealth Management Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 422) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 422 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 511, x.name, x.role FROM (SELECT 'Harry Suh' AS name, 'Private Wealth Advisor, ESW Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 511) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 511 AND name = x.name);

-- ===== GROUP 72: J.P. Morgan Wealth Management, San Francisco, CA =====
-- 107 Elaine Meyers, 227 Greg Onken, 294 Drew Corradini, 548 Catherine Evans, 799 Sam Schoner, 953 Steven Soja
UPDATE contacts SET
  address = '560 Mission Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, founder of The Meyers Group, JPM San Francisco; Forbes #70 Best-in-State (2026).')), 512)
WHERE id = 107;
UPDATE contacts SET
  address = '560 Mission Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner & Portfolio Manager, founder of The OCB Group, JPM San Francisco; Forbes #136 Best-in-State (2026).')), 512)
WHERE id = 227;
UPDATE contacts SET
  address = '560 Mission Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner & Portfolio Manager, partner in The OCB Group (with Onken, id 227), JPM San Francisco.')), 512)
WHERE id = 294;
UPDATE contacts SET
  address = '560 Mission Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, Coastline Partners, JPM San Francisco; joined 2023 from First Republic; Forbes #38 top women wealth advisors (2026).')), 512)
WHERE id = 548;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, founder of The Schoner Team, JPM. Possibly a different building ("1 Front Street") from the other CRM group members despite the shared phone number — address not applied pending confirmation.')), 512)
WHERE id = 799;
UPDATE contacts SET
  address = '560 Mission Street, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director & Wealth Partner, founder of The Soja West Group, JPM San Francisco (formerly Senior Managing Director, First Republic Investment Management).')), 512)
WHERE id = 953;
INSERT INTO contact_people (contact_id, name, role)
SELECT 799, x.name, x.role FROM (SELECT 'Hilary Yu' AS name, 'Client Associate, The Schoner Team' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 799) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 799 AND name = x.name);

-- ===== GROUP 73: Morgan Stanley Wealth Management, Aventura, FL =====
-- 108 Bobby Kolev (The Kolev Group)
UPDATE contacts SET
  address = '20807 Biscayne Boulevard, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Chairman''s Club member, Corporate Cash Investment Director & International Client Advisor, leads The Kolev Group, Morgan Stanley Aventura; Barron''s Top 1,200 (2017, 2018, 2023, 2024).')), 512)
WHERE id = 108;
INSERT INTO contact_people (contact_id, name, role)
SELECT 108, x.name, x.role FROM (
  SELECT 'Christopher Ready' AS name, 'Corporate Cash Investment Director, Senior VP, The Kolev Group' AS role
  UNION ALL SELECT 'Frances Pina Miller', 'Vice President, Corporate Cash Management, The Kolev Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 108) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 108 AND name = x.name);

-- ===== GROUP 74: Merrill Private Wealth Management, Houston, TX — four distinct practices =====
-- 109 Craig Massey, 401 Reed Smith, 402 Champ Warren, 510 Malia Morales, 1061 William Leven
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads The Massey Schmidt Harper Group, Merrill Houston; Forbes #15 Best-In-State (2026), $2.1B team AUM.')), 512)
WHERE id = 109;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — co-founder/leader of Smith Warren and Associates, Merrill Houston; Forbes #18 Best-In-State (2026).')), 512)
WHERE id = 401;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor/senior partner, Smith Warren and Associates (with Smith, id 401), Merrill Houston; ~12-person team, ~$4.25B AUM (May 2025); Forbes #17 (2026), Barron''s Top 1200 2011-2024.')), 512)
WHERE id = 402;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Private Wealth Advisor, Managing Director/SVP, Tyler Bybee Lane Morales Group, Merrill Houston; Forbes 2025 America''s Top Wealth Management Teams: Private Wealth.')), 512)
WHERE id = 510;
UPDATE contacts SET
  address = '800 Capitol St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Private Wealth Advisor, leads the Leven Team, Merrill Houston; Barron''s Top 1200 (2018-2025), FT400 2019.')), 512)
WHERE id = 1061;

-- ===== GROUP 75: Morgan Stanley Wealth Management, Garden City, NY — resolved via cross-reference =====
-- 112 Steven Strzelecki shares (516) 746-2600 with contact 83 (Bruce Burrows, migration 062) — he is Burrows' co-head.
UPDATE contacts SET
  address = '1200 Franklin Avenue, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Corporate Client Group Director, co-heads The Burrows Strzelecki Group (with Bruce Burrows, contact 83, migration 062), Morgan Stanley Garden City NY, with the firm/predecessors since 1998.')), 512)
WHERE id = 112;

-- ===== GROUP 76: Evoke Advisors, Los Angeles, CA — acquired by MAI Capital Management =====
-- 113 Alex Shahidi, 220 Andrew Palmer, 446 Mark Sear
UPDATE contacts SET
  address = '2121 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'FIRM-EVENT FLAG: Evoke Advisors was acquired by MAI Capital Management (closed Oct 31, 2025) and relocated to this new Century City address in 2025 (previously 10635 Santa Monica Blvd) — firm now operates as part of MAI''s "Office of Managing Partners." Confirmed current — Managing Partner & Co-Chief Investment Officer, Evoke Advisors/MAI Capital; Forbes Best-in-State 2026 #55 CA.')), 512)
WHERE id = 113;
UPDATE contacts SET
  address = '2121 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM-EVENT FLAG: same MAI Capital Management acquisition as contact 113 (see that record for detail). Confirmed current — Managing Partner, Evoke Advisors/MAI Capital; Barron''s Top 1,500 by State (2026) #121 CA, Forbes Best-in-State 2026 #33 CA.')), 512)
WHERE id = 220;
UPDATE contacts SET
  address = '2121 Avenue of the Stars',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | FIRM-EVENT FLAG: same MAI Capital Management acquisition as contact 113 (see that record for detail). Confirmed current — Managing Partner (co-founder), Evoke Advisors/MAI Capital; Barron''s Top 1,500 by State (2026) #67 CA.')), 512)
WHERE id = 446;
INSERT INTO contact_people (contact_id, name, role)
SELECT 113, x.name, x.role FROM (
  SELECT 'David Hou' AS name, 'Co-Founder & Managing Partner, MAI Capital Office of Managing Partners' AS role
  UNION ALL SELECT 'Jane Eagle', 'Managing Partner, MAI Capital Office of Managing Partners'
  UNION ALL SELECT 'Jay Sanders', 'Managing Partner, MAI Capital Office of Managing Partners'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 113) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 113 AND name = x.name);

-- ===== GROUP 77: UBS Private Wealth Management, Louisville, KY — two distinct teams =====
-- 114 Mark Switow, 568 Kellie Sheryak
UPDATE contacts SET
  address = '500 N Hurstbourne Pkwy, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor, leads the Switow Hall Group, UBS Louisville; Forbes #9 Best-In-State KY (2024).')), 512)
WHERE id = 114;
UPDATE contacts SET
  address = '500 N Hurstbourne Pkwy, Suite 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — First Vice President-Wealth Management, Private Wealth Advisor, CEPA, leads Generations Private Wealth (a distinct team from Switow Hall, same building), UBS Louisville; Barron''s Top 1,500 (2026).')), 512)
WHERE id = 568;
INSERT INTO contact_people (contact_id, name, role)
SELECT 114, x.name, x.role FROM (SELECT 'Ryan Hall, CFP' AS name, 'Advisor, Switow Hall Group' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 114) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 114 AND name = x.name);
INSERT INTO contact_people (contact_id, name, role)
SELECT 568, x.name, x.role FROM (SELECT 'Connor Sheryak, CFP' AS name, 'Senior Wealth Strategy Associate / Relationship Manager, Generations Private Wealth' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 568) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 568 AND name = x.name);

-- ===== GROUP 78: UBS Private Wealth Management, San Francisco, CA =====
-- 115 Marcus Fagersten, 313 Chris Clifford
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director-Wealth Management, Private Wealth Advisor, member of R72 Advisors, UBS San Francisco; Forbes #10 CA-SF Private Wealth (Apr 2025); joined UBS 2004.')), 512)
WHERE id = 115;
UPDATE contacts SET
  address = '555 California Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — partners with Kate Kennedy as Labyrinth Wealth Advisors, UBS San Francisco; #208 Forbes America''s Top Wealth Advisors 2025 (~$3.6B AUM cited).')), 512)
WHERE id = 313;
INSERT INTO contact_people (contact_id, name, role)
SELECT 313, x.name, x.role FROM (SELECT 'Kate Kennedy' AS name, 'Private Wealth Advisor, partner, Labyrinth Wealth Advisors' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 313) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 313 AND name = x.name);

-- ===== GROUP 79: Morgan Stanley Wealth Management, Palm Beach, FL =====
-- 116 Kevin Peters (shares CRM phone with contact 17, Brian Pfeifler, migration 060 — team affiliation unconfirmed)
UPDATE contacts SET
  address = '440 Royal Palm Way',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Advisor, founder/leader of The Peters Group, Morgan Stanley; Barron''s Top 1,200 (2025), Barron''s Top 250 Private Wealth Management Teams (2025). Shares the CRM phone number with contact 17 (Brian Pfeifler, migration 060) at the same building — not confirmed as the same team/suite. Team''s primary listed office is Purchase, NY with Palm Beach as secondary.')), 512)
WHERE id = 116;
INSERT INTO contact_people (contact_id, name, role)
SELECT 116, x.name, x.role FROM (
  SELECT 'Jonathan Peters' AS name, 'Executive Director, Financial Advisor, Family Wealth Director, The Peters Group' AS role
  UNION ALL SELECT 'Wenton Camporin', 'Partner, Senior Vice President, Wealth Advisor, The Peters Group'
  UNION ALL SELECT 'Sean Peake, CFP, CPWA', 'Financial Advisor, Vice President, The Peters Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 116) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 116 AND name = x.name);

-- ===== GROUP 80: J.P. Morgan Wealth Management, New York, NY — two firm-change departures =====
-- 117 Jordan Mayer, 438 Christopher Wimpfheimer confirmed current; 157, 400, 790 departed.
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner, leads Maybach Partners, JPM New York (Park Avenue office). Barron''s Top 100, Forbes Best-in-State 2026 #179.')), 512)
WHERE id = 117;
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current — Managing Director, Wealth Partner, JPM New York (Park Avenue office); ranked #2 nationally, Financial Planning''s 2024 Top 40 Brokers Under 40.')), 512)
WHERE id = 438;
UPDATE contacts SET
  firm = 'Wells Fargo Advisors',
  title = 'Managing Director, leads The Weikes Slattery Group',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed J.P. Morgan for Wells Fargo Advisors (~Feb 2026); now leads The Weikes Slattery Group, NY, managing ~$3.1B (moved with John Slattery and support staff). Existing @jpmorgan-pattern contact info is now stale. Address not applied — new Wells Fargo NY office not confirmed this pass.')), 512)
WHERE id = 157;
UPDATE contacts SET
  firm = 'RBC Wealth Management',
  title = 'Managing Director, The Degenaars Babb Group',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed J.P. Morgan for RBC Wealth Management (~April 2025) alongside Jason Babb (contact 790) as The Degenaars Babb Group, ~$5B team. FINRA-sourced records show his base as Upper Saddle River, NJ, not New York — CRM city field left as-is, flagged here. Existing contact info is now stale.')), 512)
WHERE id = 400;
UPDATE contacts SET
  firm = 'RBC Wealth Management',
  title = 'The Degenaars Babb Group',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: departed J.P. Morgan for RBC Wealth Management (~April 2025) alongside Glenn Degenaars (contact 400) — same Degenaars Babb Group breakaway, ~$5B team. Existing contact info is now stale.')), 512)
WHERE id = 790;
INSERT INTO contact_people (contact_id, name, role)
SELECT 117, x.name, x.role FROM (SELECT 'Jen Mayer' AS name, 'Co-lead, Maybach Partners' AS role) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 117) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 117 AND name = x.name);
