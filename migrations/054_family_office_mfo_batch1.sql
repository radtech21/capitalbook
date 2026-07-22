-- Family Office / RIA-Private Bank-MFO enrichment, batch 1 of ~5 (20
-- contacts, top by AUM), covering Canada + US. These records are
-- firm-level (not individual advisors) and already had firm name + a
-- rough AUM figure from a prior enrichment pass, but no address and no
-- named point of contact. This batch adds HQ/office address, flags
-- whether the on-file AUM figure is current or stale (with the better
-- current figure noted for human review — aum_mm itself is not
-- overwritten here, since "AUM" for these firms is reported multiple
-- ways: discretionary regulatory AUM, AUM+AUA, or total client assets),
-- and where findable, a named contact relevant to manager
-- research/due diligence/CIO-level investment decisions, added to
-- contact_people the same way advisor team members were in the prior
-- phase. All direct fetches to firm sites returned 403, as expected;
-- findings rely on search snippets, press coverage, and firm bio pages.
--
-- Two of the ultra-private single-family offices in this batch (1923
-- Bezos Expeditions) could not be tied to a genuine public office
-- address — only a UPS Store private mailbox surfaced in data-broker
-- listings, which is explicitly NOT applied as a real address.
--
-- Address note: 1922 Michael Larson / Cascade Investment LLC and 1923
-- Bezos Expeditions are both extremely private single-family offices;
-- team/contact info for both is sourced from secondary family-office
-- directories rather than the firms' own sites, which publish no public
-- staff list — flagged as lower-confidence accordingly.

-- 2074 Creative Planning, Overland Park, KS
UPDATE contacts SET
  address = '5454 W 110th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: $700B is combined AUM+AUA (incl. SageView, United Capital, Baseline); pure Form ADV regulatory AUM is ~$295.6B. Named contact: James "Jamie" Battmer, Chief Investment Officer (Co-CIO: Ramesh Poola, PhD, CFA).')), 512)
WHERE id = 2074;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2074, x.name, x.role FROM (
  SELECT 'James Battmer' AS name, 'Chief Investment Officer' AS role
  UNION ALL SELECT 'Ramesh Poola, PhD, CFA', 'Co-Chief Investment Officer'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2074)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2074 AND name = x.name);

-- 2094 Northern Trust Wealth, Chicago, IL
UPDATE contacts SET
  address = '50 South LaSalle Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current wealth-management AUM is ~$498-507B, not $450B. Named contact: Eric Freedman, Chief Investment Officer, Northern Trust Wealth Management (appointed Dec 2, 2025, succeeding Katie Nixon).')), 512)
WHERE id = 2094;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2094, x.name, x.role FROM (
  SELECT 'Eric Freedman' AS name, 'Chief Investment Officer, Northern Trust Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2094)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2094 AND name = x.name);

-- 2095 BNY Wealth, New York, NY
UPDATE contacts SET
  address = '240 Greenwich Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure is ~$339-348B, not $320B. Named contact: Anthony Mastrocola, CFA, CAIA, Head of Manager Research (since May 2024, succeeding Jasmine Yu).')), 512)
WHERE id = 2095;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2095, x.name, x.role FROM (
  SELECT 'Anthony Mastrocola, CFA, CAIA' AS name, 'Head of Manager Research' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2095)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2095 AND name = x.name);

-- 2075 Fisher Investments, Plano, TX
UPDATE contacts SET
  address = '6500 International Parkway, Suite 2050',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure is ~$441B (as of 6/30/2026), not $295B. Named contact: Bill Glaser, EVP Portfolio Management, Co-Chief Investment Officer (oversees Research group; Fisher runs money directly rather than allocating to external managers, so no dedicated external-manager-research role exists).')), 512)
WHERE id = 2075;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2075, x.name, x.role FROM (
  SELECT 'Bill Glaser' AS name, 'EVP Portfolio Management, Co-Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2075)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2075 AND name = x.name);

-- 2076 Edelman Financial Engines, Santa Clara, CA
UPDATE contacts SET
  address = '3945 Freedom Circle, Suite 950',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure is ~$326.3B (SEC Form ADV, July 2026), not $287B. Named contact: Neil Gilfedder, EVP Investment Management & Chief Investment Officer.')), 512)
WHERE id = 2076;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2076, x.name, x.role FROM (
  SELECT 'Neil Gilfedder' AS name, 'EVP Investment Management & Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2076)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2076 AND name = x.name);

-- 2077 SageView Advisory Group, Newport Beach, CA
UPDATE contacts SET
  address = '4000 MacArthur Boulevard, Suite 1050',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: $239B is combined AUM+AUA typical for a retirement-plan RIA; pure discretionary regulatory AUM is only ~$37.5B (Mar 2026). Pending acquisition by Creative Planning (announced Sept 2025) may change org structure. Named contact: B. Todd Stewart, CFA, Managing Director, Investment Research (chairs national Investment Committee, oversees manager due diligence).')), 512)
WHERE id = 2077;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2077, x.name, x.role FROM (
  SELECT 'B. Todd Stewart, CFA' AS name, 'Managing Director, Investment Research' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2077)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2077 AND name = x.name);

-- 1921 Walton Enterprises, Bentonville, AR
UPDATE contacts SET
  address = '110 NW 2nd St, Ste 300',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Address is from a Chamber/D&B listing, not primary-source-confirmed — the firm''s SEC filer address of record is a P.O. Box, consistent with a privacy-conscious family office. AUM check: STALE — Walton family net worth (via Walmart stake) is now ~$460-520B, not $225B; note this is family net worth, not a discrete disclosed AUM figure. Named contact: Rupal (Patel) Poltack, CEO & President, Walton Enterprises (enterprise-wide leader, not a narrowly-titled CIO).')), 512)
WHERE id = 1921;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1921, x.name, x.role FROM (
  SELECT 'Rupal Poltack' AS name, 'CEO & President, Walton Enterprises' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1921)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1921 AND name = x.name);

-- 1924 Bessemer Trust, New York, NY
UPDATE contacts SET
  address = '630 Fifth Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: roughly consistent — widely cited as "more than $200B," some materials cite up to ~$250B. Named contact: Jeffrey (Jeff) Mills, Chief Investment Officer (promoted 2025-2026, reports to new CEO Holly H. MacDonald, the prior CIO).')), 512)
WHERE id = 1924;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1924, x.name, x.role FROM (
  SELECT 'Jeffrey Mills' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1924)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1924 AND name = x.name);

-- 2078 Pathstone, Englewood, NJ
UPDATE contacts SET
  address = '10 Sterling Blvd, Suite 402',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: roughly consistent — ~$170B aggregate assets matches; SEC Form ADV regulatory-only AUM is a narrower $110.3B. Named contact: Miles Cooke, CFA, Director, Investment Research (Boulder office, alternatives/manager research focus, joined 2024).')), 512)
WHERE id = 2078;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2078, x.name, x.role FROM (
  SELECT 'Miles Cooke, CFA' AS name, 'Director, Investment Research' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2078)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2078 AND name = x.name);

-- 2120 Brown Advisory, Baltimore, MD
UPDATE contacts SET
  address = '901 South Bond Street, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current total client assets ~$173.5B (Dec 2025), vs. Form ADV discretionary AUM of ~$121-124B; CRM''s $160B roughly matches an earlier snapshot. Named contact: Jordan Wruble, Partner, Portfolio Manager, Head of Investment Solutions Group — oversees manager research/due diligence for ~100 external managers (based in NY, leads the function firmwide).')), 512)
WHERE id = 2120;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2120, x.name, x.role FROM (
  SELECT 'Jordan Wruble' AS name, 'Partner, Portfolio Manager, Head of Investment Solutions Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2120)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2120 AND name = x.name);

-- 2079 Rockefeller Capital Management, New York, NY
UPDATE contacts SET
  address = '45 Rockefeller Plaza, Floor 5',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current total client assets (AUM+AUA+brokerage) ~$187B (Sept 2025), up from ~$151B Jan 2025; RIA-only regulatory AUM is smaller (~$36.8B). Named contact: Michael Delli Paoli, Head Managing Director, Investment Due Diligence (title wording varies by source).')), 512)
WHERE id = 2079;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2079, x.name, x.role FROM (
  SELECT 'Michael Delli Paoli' AS name, 'Head Managing Director, Investment Due Diligence' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2079)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2079 AND name = x.name);

-- 1922 Michael Larson, Cascade Investment LLC (Gates), Kirkland, WA
UPDATE contacts SET
  address = '2365 Carillon Point',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Confirmed still CIO after ~30+ years, no succession reported. AUM check: STALE — current estimates ~$170-175B, not $150B. Team sourced from secondary family-office directories (Cascade publishes no public staff list, lower confidence): Alan Heuberger (Senior Investment Manager, direct PE & real assets), Jerry St. Dennis (Senior Advisor, PE/VC/buyout/real estate), Keith Traverse (Senior Investment Manager, Portfolio Analysis/Asset Allocation/Risk).')), 512)
WHERE id = 1922;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1922, x.name, x.role FROM (
  SELECT 'Alan Heuberger' AS name, 'Senior Investment Manager (direct private equity & real assets)' AS role
  UNION ALL SELECT 'Jerry St. Dennis', 'Senior Advisor (private equity/venture/buyout/real estate)'
  UNION ALL SELECT 'Keith Traverse', 'Senior Investment Manager (Portfolio Analysis/Asset Allocation/Risk)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1922)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1922 AND name = x.name);

-- 2080 Corient, Miami, FL
UPDATE contacts SET
  address = '830 Brickell Plaza, Suite 4800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — total client/managed assets ~$508B as of June 2026 (rapid acquisition growth); narrower regulatory AUM likely $120-165B+ depending on source, vs. CRM''s $143.6B. Named contact: Daniel M. Garza, CFA, Manager Research (Chicago) — title matches CRM exactly.')), 512)
WHERE id = 2080;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2080, x.name, x.role FROM (
  SELECT 'Daniel M. Garza, CFA' AS name, 'Manager Research' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2080)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2080 AND name = x.name);

-- 2096 Wilmington Trust, Wilmington, DE
UPDATE contacts SET
  address = 'Rodney Square North, 1100 North Market Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current AUM ~$79-80B (Nov 2024, post M&T integration); CRM''s $130B appears overstated vs. current disclosures. Named contact: Tony Roth, Chief Investment Officer, Wilmington Trust/M&T Wealth (oversees 100+ person investment group incl. manager research).')), 512)
WHERE id = 2096;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2096, x.name, x.role FROM (
  SELECT 'Tony Roth' AS name, 'Chief Investment Officer, Wilmington Trust/M&T Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2096)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2096 AND name = x.name);

-- 1923 Bezos Expeditions, Medina/Mercer Island, WA (no genuine address found)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'No genuine office address could be confirmed — only a UPS Store private mailbox (Mercer Island, WA) surfaces in data-broker listings; NOT applied as a real address. CRM''s "Medina, WA" city likely conflates Bezos''s personal residence with the firm''s actual base (Mercer Island, WA). AUM check: STALE — Bezos net worth proxy is now ~$220-290B depending on tracker, not $108B (an outdated ~2022-era snapshot). Named contact: Melinda Lewison, Managing Director (since 2005, leads investments) — prior CIO Stephen Campbell departed for Citi Private Bank ~2025.')), 512)
WHERE id = 1923;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1923, x.name, x.role FROM (
  SELECT 'Melinda Lewison' AS name, 'Managing Director, Bezos Expeditions' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1923)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1923 AND name = x.name);

-- 2081 Wealth Enhancement Group, Plymouth, MN
UPDATE contacts SET
  address = '505 Highway 169 N, Suite 900',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$148B (April 2026, after RIA acquisitions), not $100B. Named contact: Herbert "Bertie" Cayzer, Senior Portfolio Manager, external manager research (some aggregators list "Director of Investment Manager Research" instead).')), 512)
WHERE id = 2081;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2081, x.name, x.role FROM (
  SELECT 'Herbert Cayzer' AS name, 'Senior Portfolio Manager (external manager research)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2081)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2081 AND name = x.name);

-- 2083 Mariner Wealth Advisors, Overland Park, KS
UPDATE contacts SET
  address = '5700 W. 112th St., Suite 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — affiliates collectively report >$647B AUA as of March 2026 (Cardinal Investment Advisors merger + continued M&A), not $100B. Named contact: Brad Rollins, CFA, Deputy Chief Investment Officer (oversees Manager Research, Portfolio Management teams); firm CIO is Katrina Radenberg, CFA.')), 512)
WHERE id = 2083;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2083, x.name, x.role FROM (
  SELECT 'Brad Rollins, CFA' AS name, 'Deputy Chief Investment Officer' AS role
  UNION ALL SELECT 'Katrina Radenberg, CFA', 'Chief Investment Officer'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2083)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2083 AND name = x.name);

-- 2082 Captrust, Raleigh, NC
UPDATE contacts SET
  address = '4208 Six Forks Road, Suite 1700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — discretionary/AUM now ~$220B, firm reports >$1T total client assets/AUA as of mid-2025, vs. CRM''s $98B. Named contact: David Hood, Senior Director, Investment Research (Head of Manager Research & Due Diligence).')), 512)
WHERE id = 2082;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2082, x.name, x.role FROM (
  SELECT 'David Hood' AS name, 'Senior Director, Investment Research (Head of Manager Research & Due Diligence)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2082)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2082 AND name = x.name);

-- 1925 Mousse Partners (Wertheimer/Chanel), New York, NY
UPDATE contacts SET
  address = '9 West 57th Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: roughly consistent — public estimates cluster $80-100B. Named contact: Charles Heilbronn, Chairman (founder, also EVP Chanel, half-brother of Alain and Gerard Wertheimer).')), 512)
WHERE id = 1925;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1925, x.name, x.role FROM (
  SELECT 'Charles Heilbronn' AS name, 'Chairman' AS role
  UNION ALL SELECT 'Matthew Woodbury', 'Managing Director & Head of Public Investments'
  UNION ALL SELECT 'Arthur Heilbronn', 'Managing Director, Co-Head of Private Equity & Venture Direct Investing'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1925)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1925 AND name = x.name);

-- 1926 Ballmer Group, Bellevue, WA
UPDATE contacts SET
  address = '10400 NE 4th St, Suite 3000',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — Steve Ballmer net worth proxy now ~$130-151B depending on tracker, not $85B. Named contact: Brandt Vaughan, COO & CIO, Ballmer Group (oversees public/private equity investing and operations).')), 512)
WHERE id = 1926;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1926, x.name, x.role FROM (
  SELECT 'Brandt Vaughan' AS name, 'COO & CIO, Ballmer Group' AS role
  UNION ALL SELECT 'Terri Ludwig', 'CEO, Ballmer Group'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1926)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1926 AND name = x.name);
