-- Family Office / RIA-Private Bank-MFO enrichment, batch 4 (PARTIAL — 8 of
-- 21 contacts). The remaining 13 could not be researched: mid-batch,
-- WebSearch's session budget was exhausted (200/200) and WebFetch began
-- returning 403 on every host tried, including neutral control domains
-- (example.com) — confirmed via the outbound proxy status endpoint as a
-- genuine session-wide egress denial, independently corroborated by
-- multiple agents, one of which also confirmed a freshly spawned subagent
-- hit the identical wall (budget did not reset per-subagent). Those 13
-- contacts are left untouched, pending a retry once tooling is available
-- again. No unverified/recalled-from-memory data was applied for any of
-- them — several agents surfaced plausible addresses/names from training
-- knowledge but explicitly flagged them as unconfirmed, and that
-- discipline is respected here (nothing from those flagged recollections
-- was written to the database).
--
-- Untouched, needs retry: 2172 Willett Advisors (Bloomberg), 2173
-- Duquesne Family Office (Druckenmiller), 2174 Cohen Private Ventures
-- (Steven Cohen), 2175 Pritzker Group, 2176 Thiel Capital, 2177 Dalio
-- Family Office, 2180 Olayan Group, 2228 Hillspire (Eric Schmidt), 2229
-- 1888 Management (Koch family), 2230 Loews Corporation (Tisch family),
-- 2231 Lauder family office, 2232 Bass family offices (Fort Worth), 2233
-- Hunt family (Ray L. Hunt).
--
-- Notable finding: 2171 "BDT & MSD (Dell family)" shares an address (1
-- Vanderbilt Avenue, 26th Floor, NYC) and shared leadership (Gregg
-- Lemkau) with contact 1931 (DFO Management), researched in batch 3.
-- BDT & MSD Partners is the merchant bank; DFO Management is the actual
-- Dell family office; they are legally distinct but closely linked —
-- flagged for awareness, not treated as an outright duplicate the way
-- Hall Capital/Pathstone or Veritable/Pathstone were.

-- 1344 Tom McCullough (Northwood Family Office), Toronto, ON
UPDATE contacts SET
  title = 'Chairman & CEO, Northwood Family Office',
  address = '130 King Street West, Suite 2250, P.O. Box 245',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Co-founder of Northwood (2003), Chairman & CEO. Note: Northwood is mid-rebrand into Corient (CI Financial''s global UHNW brand); the Northwood website itself was slated to go inactive July 15, 2026, redirecting to corient.com — his post-rebrand title could not be independently confirmed and should be re-checked once Corient''s Canada org structure is finalized. AUM/scale: $2.2B investment AUM / $9B family net worth advised under the Northwood name; the new combined Corient Canada platform (incl. Northwood + Coriel Capital) reports ~C$10B. Named contacts: Scott Hayman, President & COO (co-founder); Gregory Nott, Chief Investment Officer.')), 512)
WHERE id = 1344;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1344, x.name, x.role FROM (
  SELECT 'Scott Hayman' AS name, 'President & COO, Northwood Family Office' AS role
  UNION ALL SELECT 'Gregory Nott', 'Chief Investment Officer, Northwood Family Office'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1344)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1344 AND name = x.name);

-- 1375 Our Family Office Inc, Toronto, ON
UPDATE contacts SET
  address = '161 Bay St, Suite 4040',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Address moderate confidence only — three independent data aggregators (ZoomInfo, Datanyze, ContactOut) converge on 161 Bay St Suite 4040 (Bay Adelaide Centre), but two other sources (Preqin, andsimple.co) list 2 Queen Street East, Suite 801; the firm''s own contact page could not be fetched (403) to resolve the conflict. AUM/scale: ~$3.0-3.5B in assets under advisement, ~40 UHNW families, ~12-person team; partnership with Ballentine Partners LLP (Boston). Named contacts: Tim Cestnick, Co-Founder & CEO; Neil Nisker, Co-Founder, Executive Chairman & Co-Chief Investment Officer (more directly relevant to investment decisions). Note: this firm hired Trevor Hunt (contact 1343, see migration 057) from Northwood Family Office in 2025.')), 512)
WHERE id = 1375;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1375, x.name, x.role FROM (
  SELECT 'Tim Cestnick' AS name, 'Co-Founder & Chief Executive Officer, Our Family Office Inc.' AS role
  UNION ALL SELECT 'Neil Nisker', 'Co-Founder, Executive Chairman & Co-Chief Investment Officer, Our Family Office Inc.'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1375)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1375 AND name = x.name);

-- 1506 Sana Family Office, Surrey, BC
UPDATE contacts SET
  address = '#310 - 15288 54A Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM: not publicly disclosed. Named contact: Sean Rosas, team member/advisor at Sana Family Office — his specific title could not be independently confirmed (bio page exists on the firm site but direct fetch was blocked); treat as a directional lead, not a confirmed senior title.')), 512)
WHERE id = 1506;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1506, x.name, x.role FROM (
  SELECT 'Sean Rosas' AS name, 'Advisor/Team Member, Sana Family Office (title unconfirmed)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1506)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1506 AND name = x.name);

-- 2010 Wittington Investments (Weston family), Toronto, ON
UPDATE contacts SET
  address = '22 St. Clair Avenue East, Suite 2001',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Scale: Weston family net worth ~$10B+ (Bloomberg Billionaires Index); Wittington''s core holding is ~59% of Associated British Foods plc (~GBP 9.6B stake, Sept 2025) plus a controlling stake in George Weston Limited/Loblaw Companies (~$55B annual revenue); redeployed proceeds of the ~$6.9B Selfridges & Co. sale (2021/2022) into a new investment strategy. Named contacts: Cornell Wright, President (since Jan 2022, former chair of corporate law at Torys LLP); Guy Weston, Chairman (also Chairman, Garfield Weston Foundation).')), 512)
WHERE id = 2010;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2010, x.name, x.role FROM (
  SELECT 'Cornell Wright' AS name, 'President, Wittington Investments, Limited' AS role
  UNION ALL SELECT 'Guy Weston', 'Chairman, Wittington Investments'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2010)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2010 AND name = x.name);

-- 2011 The Jim Pattison Group, Vancouver, BC
UPDATE contacts SET
  address = 'Suite 1800 - 1067 West Cordova Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'Scale: annual revenue ~$10.1-16B CAD (figures vary by source/year); Jim Pattison Group is Canada''s 2nd-largest privately held company, 45,000+ employees; Jim Pattison''s personal net worth estimated $11.4-12B (Forbes 2026). Named contact: Ryan Barrington-Foote, President, The Jim Pattison Group (de facto successor to Jim Pattison, an accountant by background, formerly Managing Director, Accounting).')), 512)
WHERE id = 2011;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2011, x.name, x.role FROM (
  SELECT 'Ryan Barrington-Foote' AS name, 'President, The Jim Pattison Group' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2011)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2011 AND name = x.name);

-- 2118 CI Assante Wealth Management, Toronto, ON
UPDATE contacts SET
  address = '15 York Street, 2nd Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: approximate figure ~CAD $46B in client assets overseen by ~900 Assante advisors (Assante-specific, distinct from CI Financial''s overall $546.1B+ AUA) — sourced from secondary advisor/partner sites citing Assante corporate materials, not a directly fetched primary disclosure. Named contact: Sean Etherington, President, CI Assante Wealth Management (also EVP & Co-Head of Canadian Wealth, CI Financial; President of Assante since 2017).')), 512)
WHERE id = 2118;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2118, x.name, x.role FROM (
  SELECT 'Sean Etherington' AS name, 'President, CI Assante Wealth Management' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2118)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2118 AND name = x.name);

-- 2119 Northland Wealth Management, Oakville, ON
UPDATE contacts SET
  address = '2010 Winston Park Drive, Suite 504',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM: no precise figure publicly disclosed; firm was recognized as "Best Family Office in North America - Under $2.5B in AUM" (Family Wealth Report awards), implying AUM below $2.5B but no exact figure stated. Named contact: Arthur C. Salzer, CFA, Founder, CEO & Chief Investment Officer.')), 512)
WHERE id = 2119;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2119, x.name, x.role FROM (
  SELECT 'Arthur C. Salzer, CFA' AS name, 'Founder, CEO & Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2119)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2119 AND name = x.name);

-- 2171 BDT & MSD (Dell family) / BDT & MSD Partners, New York, NY
UPDATE contacts SET
  address = '1 Vanderbilt Avenue, 26th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'RELATED-RECORD FLAG: this address and leadership overlap with contact 1931 (DFO Management, researched in migration 057) — MSD Capital (Michael Dell''s original family office, founded 1998) spun out its external-facing arm as MSD Partners in 2009, which merged in Jan 2023 with Byron Trott''s BDT & Company to form BDT & MSD Partners (a standalone merchant bank, this record) — legally distinct from DFO Management (the current Dell family office, contact 1931), but sharing the same NYC address and leadership (Gregg Lemkau is Chairman of DFO Management AND Co-CEO of BDT & MSD Partners). Not a straightforward duplicate like Hall Capital/Pathstone, but worth human review to ensure it''s not double-counted as separate $30B+ pools of capital. AUM check: could not verify this pass (tooling-limited); a recalled $50-65B combined figure from an earlier merger-era news cycle was NOT applied here pending verification. Named contact: Byron Trott, Chairman & Co-CEO, BDT & MSD Partners.')), 512)
WHERE id = 2171;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2171, x.name, x.role FROM (
  SELECT 'Byron Trott' AS name, 'Chairman & Co-CEO, BDT & MSD Partners' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2171)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2171 AND name = x.name);
