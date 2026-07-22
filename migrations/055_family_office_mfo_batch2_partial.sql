-- Family Office / RIA-Private Bank-MFO enrichment, batch 2 (PARTIAL — 8
-- of 20 contacts). The remaining 12 in this batch could not be
-- researched: mid-batch, WebSearch's session budget was exhausted and
-- WebFetch began returning 403 on every host tried, including neutral
-- control domains — confirmed via the outbound proxy status endpoint as
-- a genuine session-wide egress denial, independently corroborated by
-- multiple agents (not a per-site block). Those 12 contacts (1927... no
-- — see list below) are left untouched, pending a retry once tooling is
-- available again. No unverified/recalled-from-memory data was applied
-- for any of them.
--
-- Untouched, needs retry: 2113 iA Private Wealth, 2114 Wellington-Altus
-- Private Wealth, 2098 Glenmede, 2121 Hall Capital Partners, 2088 SCS
-- Financial, 2086 Carson Group, 2087 Moneta, 2115 Canaccord Genuity
-- Wealth (Canada), 2122 Beacon Pointe Advisors, 2116 Richardson Wealth
-- (firm), 2091 Silvercrest Asset Management, 2099 Fiduciary Trust
-- International.
--
-- Two of the 8 completed this batch carry lower confidence: 2112
-- Raymond James Ltd (Canada) — sources conflict on whether Vancouver or
-- Toronto is the formal Canadian HQ, and the agent's own search budget
-- ran low mid-research; 1930 The Woodbridge Company — address is
-- registry-sourced but not independently verified, and AUM estimates
-- conflict by source (treated conservatively, low-end figure kept).

-- 1927 ICONIQ Capital, San Francisco, CA
UPDATE contacts SET
  address = '394 Pacific Ave, Ste 200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — firm''s own site now states "over $100B", not $80B. No named manager-research/CIO contact could be confirmed; founding partners (Divesh Makan, Michael Anders/CEO, Chad Boeding, Lou Thorne/COO) are general leadership, not confirmed as owning external-manager research.')), 512)
WHERE id = 1927;

-- 2112 Raymond James Ltd (Canada), Vancouver, BC
UPDATE contacts SET
  address = 'Suite 2100, 925 West Georgia Street (Cathedral Place)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: STALE — surpassed C$100B in assets under administration Oct 2025, not $74B. Sources conflict on whether Vancouver or Toronto (Scotia Plaza) is the formal Canadian HQ — moderate confidence only on address. No named manager-research/CIO contact confirmed (Daryl Swetlishoff is Head of Equity Research, sell-side, not a confident substitute).')), 512)
WHERE id = 2112;

-- 2089 AlTi Tiedemann Global, New York, NY
UPDATE contacts SET
  address = '22 Vanderbilt Ave, 27th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$90-93B AUM/AUA, not $70B. Named contact: Antonio Casal, Head of Manager Research, Tiedemann Advisors (AlTi Tiedemann Global).')), 512)
WHERE id = 2089;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2089, x.name, x.role FROM (
  SELECT 'Antonio Casal' AS name, 'Head of Manager Research, Tiedemann Advisors' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2089)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2089 AND name = x.name);

-- 1928 Waycrosse (Cargill-MacMillan family), Wayzata, MN
UPDATE contacts SET
  address = '15407 McGinty Road West, MS-28',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: consistent — Cargill-MacMillan family net worth ~$60.6-67.9B is a reasonable proxy for the CRM''s $65B figure. Named contact: Lucy MacMillan Stitzer, Chairman, Waycrosse, Inc. (governance title, not a confirmed CEO/CIO).')), 512)
WHERE id = 1928;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1928, x.name, x.role FROM (
  SELECT 'Lucy MacMillan Stitzer' AS name, 'Chairman, Waycrosse, Inc.' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1928)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1928 AND name = x.name);

-- 2084 Mercer Advisors, Denver, CO
UPDATE contacts SET
  address = '1200 17th St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current client assets ~$110B (May 2026), not $65B. Named contact: Donald Calcagni, Chief Investment Officer.')), 512)
WHERE id = 2084;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2084, x.name, x.role FROM (
  SELECT 'Donald Calcagni' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2084)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2084 AND name = x.name);

-- 2085 Cresset Capital, Chicago, IL
UPDATE contacts SET
  address = '444 West Lake Street, Suite 4700',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$250B (April 2026), not $65B. Named contact: Ted Werthman, Managing Director, Investment Strategy (oversees due diligence on private market managers, private credit, hedge funds).')), 512)
WHERE id = 2085;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2085, x.name, x.role FROM (
  SELECT 'Ted Werthman' AS name, 'Managing Director, Investment Strategy' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2085)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2085 AND name = x.name);

-- 2097 Brown Brothers Harriman (Private Banking), New York, NY
UPDATE contacts SET
  address = '140 Broadway',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: could not verify this pass (tooling-limited); $60B plausible for historical range. Named contact: Suzanne Brenner, Partner & Co-Chief Investment Officer, Private Banking (leads Investment Research Group).')), 512)
WHERE id = 2097;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2097, x.name, x.role FROM (
  SELECT 'Suzanne Brenner' AS name, 'Partner & Co-Chief Investment Officer, Private Banking' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2097)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2097 AND name = x.name);

-- 1930 The Woodbridge Company (Thomson family), Toronto, ON
UPDATE contacts SET
  address = '65 Queen Street West, Suite 2400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: ambiguous — Forbes-style net worth ~$50-53.5B roughly matches the CRM''s $54B, but one source cites total family fortune ~$80B given the Thomson Reuters stake value; treated as a conservative lower-bound. No named investment-office contact found (intensely private single-family office); David Thomson is Chairman (governance role, not confirmed operating contact).')), 512)
WHERE id = 1930;
