-- Family Office / RIA-Private Bank-MFO enrichment, batch 4 completion:
-- the 13 contacts left untouched in migration 058 after a mid-batch
-- tooling outage (WebSearch budget exhaustion + WebFetch 403s, confirmed
-- via the proxy status endpoint — this time the block persisted even for
-- a freshly spawned subagent, suggesting an account/org-level exhaustion
-- rather than per-session). Tools were confirmed working again this pass
-- (verified directly before relaunching) and all 13 were successfully
-- researched.
--
-- This completes the 81-contact Canada + US Family Office / RIA-MFO
-- enrichment phase (migrations 054-059).
--
-- Several of these are ultra-private single/multi-branch family
-- structures with no single well-documented "the family office" entity
-- (Lauder, Bass) — best-available candidate entities are used, with the
-- ambiguity flagged rather than presented as a confident match.
--
-- One notable leadership correction surfaced: Loews Corporation (2230) —
-- James Tisch stepped down as CEO effective Jan 1, 2025 (moving to
-- Chairman); his son Benjamin J. Tisch is now President & CEO.

-- 2172 Willett Advisors (Bloomberg), New York, NY
UPDATE contacts SET
  address = '650 Madison Avenue, 17th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: ~$25B per third-party press estimate (familyofficehub.io); not an SEC-verified figure (13F only captures a small public-equity slice, ~$273K, of a mostly private/alts portfolio). Named contacts: Steven Rattner, Chairman & CEO; Andrew Mulderry, Chief Investment Officer (sole CIO since co-CIO Brad Briner departed to become NC State Treasurer, 2023/2025); Peter McCormick, VP, Operational Due Diligence.')), 512)
WHERE id = 2172;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2172, x.name, x.role FROM (
  SELECT 'Steven Rattner' AS name, 'Chairman & Chief Executive Officer, Willett Advisors' AS role
  UNION ALL SELECT 'Andrew Mulderry', 'Chief Investment Officer, Willett Advisors'
  UNION ALL SELECT 'Peter McCormick', 'VP, Operational Due Diligence, Willett Advisors'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2172)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2172 AND name = x.name);

-- 2173 Duquesne Family Office (Stanley Druckenmiller), New York, NY
UPDATE contacts SET
  address = '40 West 57th Street, 25th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: 13F-reportable US equity AUM ~$3.4B (Q1 2026 filing); total family office assets commonly estimated ~$8-10B in press (no single audited figure exists — single-family office, no Form ADV filing). Named contact: Michael Buckley, Managing Director & Head of Equities (leads global stock investing day-to-day; Druckenmiller remains Chairman/CIO and final decision-maker).')), 512)
WHERE id = 2173;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2173, x.name, x.role FROM (
  SELECT 'Michael Buckley' AS name, 'Managing Director & Head of Equities, Duquesne Family Office' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2173)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2173 AND name = x.name);

-- 2174 Cohen Private Ventures (Steven Cohen), Stamford, CT
UPDATE contacts SET
  address = '72 Cummings Point Road',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: not publicly disclosed — explicitly separate from Point72 Asset Management''s ~$30B+ hedge fund AUM. Named contact: Andrew B. Cohen, Chief Investment Officer & Co-Founder, Cohen Private Ventures.')), 512)
WHERE id = 2174;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2174, x.name, x.role FROM (
  SELECT 'Andrew B. Cohen' AS name, 'Chief Investment Officer & Co-Founder, Cohen Private Ventures' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2174)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2174 AND name = x.name);

-- 2175 Pritzker Group, Chicago, IL
UPDATE contacts SET
  address = '110 N. Wacker Drive, Suite 4350',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: no official disclosed figure (private family office); third-party estimates ~$15B managed across PE/VC/asset management against a family net worth >$30B — directional only. Named contact: Terra Fuller (Fuller-Kulpins), Chief Investment Officer, Pritzker Group Asset Management (named CIO March 2017; leads public-markets investing and external manager selection/due diligence).')), 512)
WHERE id = 2175;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2175, x.name, x.role FROM (
  SELECT 'Terra Fuller (Fuller-Kulpins)' AS name, 'Chief Investment Officer, Pritzker Group Asset Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2175)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2175 AND name = x.name);

-- 2176 Thiel Capital (Peter Thiel), Los Angeles, CA
UPDATE contacts SET
  address = '9200 Sunset Boulevard, Suite 1110',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Address per multiple SEC Schedule 13G/13D filings (a secondary aggregator lists a different Century City address, likely conflating with a Founders Fund-affiliated entity — SEC filings given more weight). AUM check: ~$10B estimate (single-source directory, unverified); Peter Thiel''s personal net worth is reported $16-27.7B depending on source/date, driven largely by Palantir — directional scale proxy only. Named contact: Jack R. Selby, Managing Director, Thiel Capital (independently confirmed via Crunchbase, TheOrg, RocketReach — not just recalled from memory).')), 512)
WHERE id = 2176;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2176, x.name, x.role FROM (
  SELECT 'Jack R. Selby' AS name, 'Managing Director, Thiel Capital' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2176)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2176 AND name = x.name);

-- 2177 Dalio Family Office (Ray Dalio), Westport, CT
UPDATE contacts SET
  address = '1 Glendinning Place, Suite 100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Address is the same street as Bridgewater Associates'' Westport HQ (moderate confidence, not confirmed via a primary filing). AUM check: ~$15B secondary-source estimate; a 2026 13F disclosed only ~$503M in US public equities (mostly gold ETFs) — a small disclosed slice, not total AUM; Ray Dalio''s personal net worth ~$21.5B (Bloomberg, June 2026) is not an AUM substitute. Leadership churn noted: prior CIO Mark Baumgartner departed, and Ray Dalio has been reported (Bloomberg, Sept 2025) as personally stepping back into a CIO-like role; named contacts below are the most current investment-team leads found, not confirmed as holding the top CIO title: Steven Kryger, Co-Chief Investment Officer, Global Macro Strategy; Ivan Manolov, Senior Portfolio Manager, Private Investments (PE/VC/real estate manager selection — most relevant to manager research).')), 512)
WHERE id = 2177;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2177, x.name, x.role FROM (
  SELECT 'Steven Kryger' AS name, 'Co-Chief Investment Officer, Global Macro Strategy, Dalio Family Office' AS role
  UNION ALL SELECT 'Ivan Manolov', 'Senior Portfolio Manager, Private Investments, Dalio Family Office'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2177)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2177 AND name = x.name);

-- 2180 The Olayan Group, New York, NY
UPDATE contacts SET
  address = '550 Madison Avenue, 34th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: ~$10B unofficial estimate across diversified global assets (public/private equities, real estate, operating businesses); no audited figure is publicly disclosed. Named contacts: Hutham S. Olayan, Chairman, The Olayan Group globally, and President & CEO, Olayan America Corporation (oversees Americas investment activity); Hani Lazkani, incoming CEO of the global Olayan Group (effective Jan 2024) and Global Head of Alternative Investments, overseeing PE and real estate group-wide — may be the more relevant global manager/fund due-diligence contact, though not confirmed to sit in the New York office.')), 512)
WHERE id = 2180;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2180, x.name, x.role FROM (
  SELECT 'Hutham S. Olayan' AS name, 'Chairman, The Olayan Group; President & CEO, Olayan America Corporation' AS role
  UNION ALL SELECT 'Hani Lazkani', 'CEO, The Olayan Group; Global Head of Alternative Investments'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2180)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2180 AND name = x.name);

-- 2228 Hillspire (Eric Schmidt), Palo Alto, CA
UPDATE contacts SET
  address = '505 Hamilton Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: ~$15B third-party estimate (unverified); Eric Schmidt''s personal net worth ranges widely by source ($35-64B, 2026 trackers) and is not an AUM substitute. Named contact: Ken Goldman, President, Hillspire (seven-time public-company CFO).')), 512)
WHERE id = 2228;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2228, x.name, x.role FROM (
  SELECT 'Ken Goldman' AS name, 'President, Hillspire' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2228)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2228 AND name = x.name);

-- 2229 1888 Management (Koch family), Wichita, KS
UPDATE contacts SET
  address = '4111 E. 37th Street N.',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Address matches Koch Industries'' corporate HQ — appears to be 1888 Management''s registered/mailing address rather than a distinct standalone office. AUM check: informally reported "more than $2 billion" (press, 2016-2021 — dated, actual current total AUM incl. private/direct holdings not publicly disclosed). Named contact: Trent May, President & Chief Investment Officer, 1888 Management LLC (joined 2011 from the Wyoming Retirement System).')), 512)
WHERE id = 2229;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2229, x.name, x.role FROM (
  SELECT 'Trent May' AS name, 'President & Chief Investment Officer, 1888 Management LLC' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2229)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2229 AND name = x.name);

-- 2230 Loews Corporation (Tisch family), New York, NY
UPDATE contacts SET
  address = '667 Madison Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'LEADERSHIP CORRECTION: James S. Tisch stepped down as CEO effective Jan 1, 2025, moving to Chairman; his son Benjamin J. Tisch is now President & CEO (previously in Loews'' investment department since 2011, earlier at Fortress Investment Group). Scale: market cap ~$21-25B (fluctuating); Loews also holds ~90% of CNA Financial, 100% of Boardwalk Pipelines, and Loews Hotels — consolidated assets substantially exceed market cap given the insurance/energy holding structure.')), 512)
WHERE id = 2230;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2230, x.name, x.role FROM (
  SELECT 'Benjamin J. Tisch' AS name, 'President & Chief Executive Officer, Loews Corporation' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2230)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2230 AND name = x.name);

-- 2231 Lauder family office, New York, NY — low-moderate confidence, no single unified entity exists.
UPDATE contacts SET
  address = '767 Fifth Avenue, Suite 4200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CONFIDENCE FLAG: there is no single, well-documented "Lauder family office" — the Lauder family (Estee Lauder Companies) operates through multiple separate branches. The best-documented candidate matching this record''s New York location is RSL Investments Corporation, Ronald S. Lauder''s personal investment vehicle (address applied above). A separate "Lauder Zinterhofer Family Office" (Eric Zinterhofer, son-in-law via Aerin Lauder) exists with no verified address, and "Lauder Partners" (Gary Lauder) is a distinct Menlo Park, CA branch not matching this record. AUM: not found for any Lauder-branch entity. Named contact: Matt Cleary, Managing Director, RSL Investments LLC — sourced from LinkedIn/RocketReach aggregator listings only, not an official company source; verify before outreach.')), 512)
WHERE id = 2231;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2231, x.name, x.role FROM (
  SELECT 'Matt Cleary' AS name, 'Managing Director, RSL Investments LLC (Ronald S. Lauder family investment vehicle)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2231)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2231 AND name = x.name);

-- 2232 Bass family offices (Fort Worth), Fort Worth, TX — multiple distinct Bass-family entities exist.
UPDATE contacts SET
  address = '201 Main Street, Suite 3100',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'CONFIDENCE FLAG: the Bass family does not operate one consolidated family office — each brother (Sid, Robert, Edward, Lee) runs a separate investment vehicle. Address applied is for Keystone, Inc. (Robert M. Bass'' investment office), the most prominent/well-documented single entity by press coverage; Sid R. Bass, Inc./Associates is a distinct entity in the same building (Suite 2700). AUM: no figure represents true assets under management for either entity — only net-worth proxies exist (Bass family collectively ~$5-6B per Forbes; Robert Bass individually ~$5.3B). Named contact: Robert M. Bass, President/CEO, Keystone, Inc. — no non-family manager-research/due-diligence staff could be identified for either Bass entity.')), 512)
WHERE id = 2232;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2232, x.name, x.role FROM (
  SELECT 'Robert M. Bass' AS name, 'President/CEO, Keystone, Inc.' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2232)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2232 AND name = x.name);

-- 2233 Hunt family (Ray L. Hunt), Dallas, TX
UPDATE contacts SET
  address = '1900 North Akard Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: no disclosed AUM (private operating/holding company, not an SEC-registered adviser). Best public proxy is net worth: Ray Lee Hunt individually ~$7.2B (Forbes 2026); broader Hunt family (incl. W. Herbert Hunt heirs/Petro-Hunt) ~$24.8B (Forbes "America''s Richest Families"). Note: unrelated NY-based RIAs named "Hunt Investment Management LLC" and "Hunt Capital Management LLC" are NOT this Dallas family entity. Named contact: Christopher W. Kleinert, Chairman & CEO, Hunt Investment Holdings, LLC and Co-CEO, Hunt Consolidated, Inc. (oversees the investment/real-estate/family-capital arm since 1996).')), 512)
WHERE id = 2233;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2233, x.name, x.role FROM (
  SELECT 'Christopher W. Kleinert' AS name, 'Chairman & CEO, Hunt Investment Holdings, LLC; Co-CEO, Hunt Consolidated, Inc.' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2233)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2233 AND name = x.name);
