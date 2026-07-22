-- Family Office / RIA-Private Bank-MFO enrichment, batch 3 (20 contacts).
--
-- Two structural findings worth flagging for human review, same pattern as
-- the Hall Capital/Pathstone flag in migration 056:
--   * 2124 The Colony Group and 2125 Buckingham Strategic Wealth merged with
--     each other (Jan 2025) and were renamed Focus Partners Wealth, LLC,
--     then absorbed Kovitz Investment Group (Jan 2026) — both CRM records
--     now represent the same underlying ~$175B combined entity.
--   * 2129 Veritable LP was acquired by Pathstone Family Office, LLC (2023),
--     which is ALREADY a separate CRM contact (2078, applied in migration
--     054) — same likely-duplicate situation as Hall Capital.
--
-- One personnel correction: 1343 Trevor Hunt has left Northwood Family
-- Office (per the hiring firm's own announcement) for Our Family Office
-- Inc. — firm/title updated, but address withheld since two candidate
-- addresses for the new firm conflict across sources.
--
-- One title correction: 1931 Gregg Lemkau is Chairman of DFO Management,
-- not CEO (his CEO-level title, Co-CEO, sits at a related but distinct
-- entity, BDT & MSD Partners).

-- 1931 Gregg Lemkau (DFO Management / Michael Dell), New York, NY
UPDATE contacts SET
  title = 'Chairman, DFO Management (Co-CEO, BDT & MSD Partners)',
  address = '1 Vanderbilt Avenue, 26th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: no longer CEO of DFO Management — now Chairman; his CEO-level title is Co-CEO of the related entity BDT & MSD Partners (formed Jan 2023 from the merger of MSD Partners'' advisory business with BDT & Company), alongside Byron Trott. Confirmed via Wikipedia and a Jan 2026 BlackRock board-election press release. AUM check: consistent, ~$31B. Named contacts: Marc Lisker, President, DFO Management; Alisa Mall, Chief Investment Officer, DFO Management.')), 512)
WHERE id = 1931;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1931, x.name, x.role FROM (
  SELECT 'Marc Lisker' AS name, 'President, DFO Management' AS role
  UNION ALL SELECT 'Alisa Mall', 'Chief Investment Officer, DFO Management'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1931)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1931 AND name = x.name);

-- 1933 Bayshore Global Management (Sergey Brin), Los Altos, CA
UPDATE contacts SET
  address = '229 Forest Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: STALE and dramatically understated — current estimate is ~$100B (Sergey Brin net-worth basis), not $30B. Firm has relocated from Los Altos to Palo Alto (CRM city field left as-is per project convention, flagged here only). Named contacts: Marie Young, Chief Investment Officer; George Pavlov, Chief Executive Officer.')), 512)
WHERE id = 1933;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1933, x.name, x.role FROM (
  SELECT 'Marie Young' AS name, 'Chief Investment Officer' AS role
  UNION ALL SELECT 'George Pavlov', 'Chief Executive Officer'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1933)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1933 AND name = x.name);

-- 2090 BBR Partners, New York, NY
UPDATE contacts SET
  address = '55 East 52nd Street, 18th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: stale, correct figure is ~$36.5B, not $30B. Named contact: Marc Koslowsky, Partner, Head of Investment Research.')), 512)
WHERE id = 2090;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2090, x.name, x.role FROM (
  SELECT 'Marc Koslowsky' AS name, 'Partner, Head of Investment Research' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2090)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2090 AND name = x.name);

-- 2123 EP Wealth Advisors, Torrance, CA
UPDATE contacts SET
  address = '21535 Hawthorne Blvd, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: stale, correct figure is ~$44B, not $30B. Named contact: Adam N. Phillips, CFA, CAIA, CFP, Managing Director, Investments.')), 512)
WHERE id = 2123;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2123, x.name, x.role FROM (
  SELECT 'Adam N. Phillips, CFA, CAIA, CFP' AS name, 'Managing Director, Investments' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2123)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2123 AND name = x.name);

-- 1934 Dawn Fitzpatrick (Soros Fund Management), New York, NY
UPDATE contacts SET
  address = '250 West 55th Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'STATUS: confirmed still CEO & Chief Investment Officer of Soros Fund Management. AUM check: consistent, $25-28B range. Named contact: Alexander Soros, Chairman, Open Society Foundations (oversees the investment committee since 2023) — well-corroborated; several additional colleague names surfaced from a single unverified secondary aggregator and were excluded pending better corroboration.')), 512)
WHERE id = 1934;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1934, x.name, x.role FROM (
  SELECT 'Alexander Soros' AS name, 'Chairman, Open Society Foundations (oversees Soros Fund Management investment committee)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1934)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1934 AND name = x.name);

-- 1935 Emerson Collective (Laurene Powell Jobs), Palo Alto, CA
UPDATE contacts SET
  address = '555 Bryant St, Suite 259',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: consistent — public estimates cluster $15-28B, with ~$28B (early 2026) the most current widely-cited figure; CRM''s $26B is within range. Named contact: Brad Powell, Managing Director, Investments. No evidence found of a separate "Aria" family-office vehicle for Laurene Powell Jobs — flagged as unconfirmed rather than ruled out.')), 512)
WHERE id = 1935;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1935, x.name, x.role FROM (
  SELECT 'Brad Powell' AS name, 'Managing Director, Investments' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1935)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1935 AND name = x.name);

-- 2124 The Colony Group, Boston, MA — flag likely duplicate/merged entity with 2125.
UPDATE contacts SET
  address = 'One Boston Place, 201 Washington Street, 11th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'STRUCTURAL FLAG: The Colony Group merged with Buckingham Strategic Wealth (also a separate CRM contact, id 2125) and the combined entity was legally renamed Focus Partners Wealth, LLC (Jan 2025), then absorbed Kovitz Investment Group (Jan 2026), reaching ~$175B combined AUM vs. this record''s standalone $25B. Recommend human review for a possible merge/dedupe with contact 2125, since both now represent the same underlying firm. Named contact: Jonathan Lee, Managing Director of Research, Focus Partners Wealth (based New York, not the Boston office).')), 512)
WHERE id = 2124;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2124, x.name, x.role FROM (
  SELECT 'Jonathan Lee' AS name, 'Managing Director of Research, Focus Partners Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2124)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2124 AND name = x.name);

-- 2125 Buckingham Strategic Wealth, St. Louis, MO — flag likely duplicate/merged entity with 2124.
UPDATE contacts SET
  address = '190 Carondelet Plaza, Suite 600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'STRUCTURAL FLAG: Buckingham Strategic Wealth merged with The Colony Group (also a separate CRM contact, id 2124); the combined entity was renamed Focus Partners Wealth, LLC (Jan 2025), then absorbed Kovitz Investment Group (Jan 2026), reaching ~$175B combined AUM vs. this record''s standalone $25B. Recommend human review for a possible merge/dedupe with contact 2124. Named contact: Jared Kizer, CFA, Head of Investment Research, Focus Partners Wealth (St. Louis-based, formerly Buckingham CIO).')), 512)
WHERE id = 2125;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2125, x.name, x.role FROM (
  SELECT 'Jared Kizer, CFA' AS name, 'Head of Investment Research, Focus Partners Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2125)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2125 AND name = x.name);

-- 2126 Savant Wealth Management, Rockford, IL
UPDATE contacts SET
  address = '190 Buckley Drive',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: stale, correct figure is ~$55.7B (June 2026), not $25B — active acquisition spree through 2026. Named contact: C. Zach Ivey, CFA, CFP, Chief Investment & Advice Officer (promoted from CIO March 2026; the prior Director of Investment Research retired March 2025 with no confirmed named successor in that specific title).')), 512)
WHERE id = 2126;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2126, x.name, x.role FROM (
  SELECT 'C. Zach Ivey, CFA, CFP' AS name, 'Chief Investment & Advice Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2126)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2126 AND name = x.name);

-- 2127 Wealthspire Advisors, New York, NY
UPDATE contacts SET
  address = '521 Fifth Avenue, 15th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: stale, correct figure is ~$31-34B, not $25B. Named contact: Bradford L. Long, CFA, Chief Investment Officer, Wealthspire Advisors (and Fiducient Advisors), appointed Dec 2025.')), 512)
WHERE id = 2127;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2127, x.name, x.role FROM (
  SELECT 'Bradford L. Long, CFA' AS name, 'Chief Investment Officer, Wealthspire Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2127)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2127 AND name = x.name);

-- 2092 Whittier Trust, South Pasadena, CA
UPDATE contacts SET
  address = '177 E. Colorado Blvd, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: could not verify precisely — reported figures range ~$16-25B across sources; CRM''s $22B is plausible but unconfirmed. Firm relocated (Nov 2023) from South Pasadena to Pasadena — CRM city field left as-is per project convention, flagged here only. Named contact: Sandip A. Bhagat, Chief Investment Officer.')), 512)
WHERE id = 2092;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2092, x.name, x.role FROM (
  SELECT 'Sandip A. Bhagat' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2092)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2092 AND name = x.name);

-- 2128 Sequoia Financial Group, Akron, OH
UPDATE contacts SET
  address = '3500 Embassy Parkway, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: stale, correct figure is ~$32B (Dec 2025), not $20B. Named contact: Nick Zamparelli, Chief Investment Officer, Chair of the Sequoia Investment Policy Committee.')), 512)
WHERE id = 2128;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2128, x.name, x.role FROM (
  SELECT 'Nick Zamparelli' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2128)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2128 AND name = x.name);

-- 2129 Veritable LP, Newtown Square, PA — flag likely duplicate/merged entity with 2078 (Pathstone).
UPDATE contacts SET
  address = '6022 West Chester Pike',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'STRUCTURAL FLAG: Veritable LP no longer exists as an independent firm — it was acquired by Pathstone Family Office, LLC (announced July 2023). Pathstone is ALREADY a separate contact in this CRM (contact_id 2078). Recommend human review for a possible merge/dedupe rather than treating as two independent firms; the standalone $20B AUM figure is no longer a distinct reporting entity (Pathstone''s combined AUM is $100B+). Named contact: David Belej, former Chief Investment Officer of Veritable LP, now Managing Director at Pathstone (Philadelphia Metro Area office), the natural successor contact for this book of business.')), 512)
WHERE id = 2129;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2129, x.name, x.role FROM (
  SELECT 'David Belej' AS name, 'Managing Director, Pathstone (formerly CIO of Veritable LP)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2129)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2129 AND name = x.name);

-- 2093 Aspiriant, Los Angeles, CA
UPDATE contacts SET
  address = '11100 Santa Monica Blvd, 5th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: stale, correct figure is ~$17-18B, not $15B. Named contact: John Allen, Chief Investment Officer, leads the Investment Strategy & Research Group (asset allocation, manager selection/due diligence).')), 512)
WHERE id = 2093;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2093, x.name, x.role FROM (
  SELECT 'John Allen' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2093)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2093 AND name = x.name);

-- 2117 Nicola Wealth, Vancouver, BC
UPDATE contacts SET
  address = 'Suite 500, 1508 West Broadway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: stale, correct figure is ~$17.6-17.8B CAD, not $15B. Note: firm signed a long-term lease (Jan 2025) for a new HQ at 1477 West Broadway, Vancouver, targeted for a mid-2026 move — exact new suite not yet published, so this address reflects the current confirmed location. Named contact: Bijal Patel, Chief Investment Officer (sole CIO since end of 2025, previously Co-CIO).')), 512)
WHERE id = 2117;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2117, x.name, x.role FROM (
  SELECT 'Bijal Patel' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2117)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2117 AND name = x.name);

-- 2130 Brighton Jones, Seattle, WA
UPDATE contacts SET
  address = '2030 1st Avenue, 3rd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: stale, correct figure is ~$18.9B regulatory AUM (some press cites ~$26B total client assets), not $15B. Named contact: Brian Tall, Partner, Chief Investment Officer (since 2018, chairs the investment committee).')), 512)
WHERE id = 2130;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2130, x.name, x.role FROM (
  SELECT 'Brian Tall' AS name, 'Partner, Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2130)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2130 AND name = x.name);

-- 2131 Tolleson Wealth Management, Dallas, TX
UPDATE contacts SET
  address = '5500 Preston Road, Suite 250',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: consistent — SEC Form ADV regulatory AUM ~$8.76B, matches CRM''s $8B. Named contact: Pete Chilian, President & Chief Investment Officer, chairs the Investment Committee.')), 512)
WHERE id = 2131;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2131, x.name, x.role FROM (
  SELECT 'Pete Chilian' AS name, 'President & Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2131)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2131 AND name = x.name);

-- 1309 Samara Family Office, Westmount, QC
UPDATE contacts SET
  address = '1 Westmount Square, Suite 1600',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: not publicly disclosed — firm reports AUM "almost doubled" since its 2021 launch (per CEO statement) but no figure is published; ~100 HNW families served as of 2022. Named contacts: Michael Grondin, President & CEO; Catherine Janson, Partner & Chief Investment Officer.')), 512)
WHERE id = 1309;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1309, x.name, x.role FROM (
  SELECT 'Michael Grondin' AS name, 'President & CEO' AS role
  UNION ALL SELECT 'Catherine Janson', 'Partner & Chief Investment Officer'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1309)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1309 AND name = x.name);

-- 1338 Brad Jesson, Northwood Family Office, Toronto, ON — confirmed current.
UPDATE contacts SET
  title = 'Vice President / Principal, Client Service',
  address = '130 King Street West, Suite 2250',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed current, no evidence of departure. Note: Northwood Family Office is mid-rebrand to the "Corient" brand (Corient/CI Financial); firm name/branding may change in this CRM in the near term even though his personal role appears unchanged.')), 512)
WHERE id = 1338;

-- 1343 Trevor Hunt — CORRECTION: departed Northwood, now at Our Family Office Inc.
UPDATE contacts SET
  firm = 'Our Family Office Inc.',
  title = 'Head of Client Engagement and Portfolio Manager',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CORRECTION: no longer at Northwood Family Office — departed and joined Our Family Office Inc., Toronto, in 2025 as Head of Client Engagement and Portfolio Manager (also on that firm''s Management Committee), per the hiring firm''s own announcement and team bio. Existing email/phone on this record are for his prior Northwood role and are now stale. Address not applied: two candidate addresses for Our Family Office Inc. were found (2 Queen Street East, Suite 801 vs. 161 Bay St, Suite 4040, both Toronto) and sources conflict on which is current — left unset pending confirmation rather than guessing.')), 512)
WHERE id = 1343;
