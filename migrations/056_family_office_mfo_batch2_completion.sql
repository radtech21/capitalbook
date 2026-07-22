-- Family Office / RIA-Private Bank-MFO enrichment, batch 2 completion:
-- the 12 contacts left untouched in migration 055 after a mid-batch
-- tooling outage (WebSearch budget exhaustion + WebFetch 403s,
-- confirmed via the proxy status endpoint). Tools were confirmed
-- working again this pass and all 12 were successfully researched.
--
-- Notable finding: 2121 Hall Capital Partners was acquired by Pathstone
-- (deal announced Oct 2024, appears closed per Eric Alt's title now
-- reading "Pathstone Co-Chief Investment Officer") — Pathstone is
-- ALREADY a separate contact in this CRM (2078, applied in migration
-- 054). This record is flagged as a likely duplicate/merged-entity
-- situation for human review rather than resolved unilaterally (e.g. by
-- deleting or merging records), since that's a data-model decision
-- outside the scope of an address/contact enrichment pass.
--
-- Two records (2113 iA Private Wealth, 2098 Glenmede) have confirmed
-- "no current named contact" as a genuine negative result (checked
-- against multiple credible sources), not a research gap — noted
-- accordingly rather than left to look like an oversight.

-- 2113 iA Private Wealth, Montreal, QC (address only, no named contact confirmed)
UPDATE contacts SET
  address = '1981 McGill College, Suite 800',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: STALE — current standalone entity figure is ~$70-73B AUA (Sept 2025), not $50B (reports "assets under administration," not AUM). Broader "iA Wealth" umbrella (incl. Richardson Wealth, acquired by iA Financial Oct 2025) is ~$175B combined. No named manager-research/CIO contact could be confirmed after checking multiple sources — a genuine negative result, not a research gap.')), 512)
WHERE id = 2113;

-- 2114 Wellington-Altus Private Wealth, Winnipeg, MB
UPDATE contacts SET
  address = '201 Portage Ave., Suites 300 & 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: consistent — surpassed $50B AUA June 2026, matches CRM. Named contact: James Virgo, SVP & Chief Investment Officer, Wellington-Altus Private Wealth (based Toronto, not Winnipeg HQ; CIO title, not literally "Manager Research").')), 512)
WHERE id = 2114;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2114, x.name, x.role FROM (
  SELECT 'James Virgo' AS name, 'SVP & Chief Investment Officer, Wellington-Altus Private Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2114)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2114 AND name = x.name);

-- 2098 Glenmede, Philadelphia, PA
UPDATE contacts SET
  address = 'One Liberty Place, 1650 Market Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: roughly consistent/slightly stale — Glenmede Trust Co. reports ~$47.3-50B (2025), CRM''s $45B is in the right ballpark. The prior "Director of Manager Research" (Elizabeth Eldridge) was promoted to President of Glenmede Investment Management in Nov 2024 with no successor publicly named — that specific role is currently vacant. Named contact: Brian K. Green, CFA, Chief Investment Officer, Private Wealth (appointed April 2024).')), 512)
WHERE id = 2098;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2098, x.name, x.role FROM (
  SELECT 'Brian K. Green, CFA' AS name, 'Chief Investment Officer, Private Wealth' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2098)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2098 AND name = x.name);

-- 2121 Hall Capital Partners, San Francisco, CA — flag likely duplicate/merged entity.
UPDATE contacts SET
  address = 'One Maritime Plaza, Suite 650',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'STRUCTURAL FLAG: Hall Capital Partners was acquired by Pathstone (deal announced Oct 2024, appears closed — Eric Alt, Hall Capital''s former Co-CIO, is now listed as Pathstone''s Co-Chief Investment Officer). Pathstone is ALREADY a separate contact in this CRM (contact_id 2078). This record likely represents the same underlying entity post-merger — recommend human review for a possible merge/dedupe rather than treating as two independent $45B+$170B firms. AUM check: the $45B figure was accurate standalone mid-2024 but is now stale given the merger.')), 512)
WHERE id = 2121;

-- 2088 SCS Financial, Boston, MA
UPDATE contacts SET
  address = '888 Boylston Street, Suite 1010',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: consistent — ~$42.5B post-merger (Lake Street Advisors + Edge Capital Group, Q1 2025), matches CRM''s $43B. Named contact: Lane MacDonald, Chief Investment Officer & Chair of SCS Investment Committee (appointed July 2024).')), 512)
WHERE id = 2088;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2088, x.name, x.role FROM (
  SELECT 'Lane MacDonald' AS name, 'Chief Investment Officer & Chair of Investment Committee' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2088)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2088 AND name = x.name);

-- 2086 Carson Group, Omaha, NE
UPDATE contacts SET
  address = '14600 Branch St',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$60B+ (July 2026, rapid acquisition growth), not $40B. Named contact: Michael J. Barczak, VP, Investment Due Diligence (built Carson''s manager due diligence framework; group-level CIO role appears currently vacant since prior CIO Scott Kubie departed).')), 512)
WHERE id = 2086;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2086, x.name, x.role FROM (
  SELECT 'Michael J. Barczak' AS name, 'VP, Investment Due Diligence' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2086)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2086 AND name = x.name);

-- 2087 Moneta Group, St. Louis, MO
UPDATE contacts SET
  address = '190 Carondelet Plaza, Suite 1200',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$50.5B (SEC Form ADV, ~April 2026), not $40B. Named contact: Andrew Kelsen, Chief Investment Officer (promoted ~2024, oversees manager due diligence/portfolio strategy).')), 512)
WHERE id = 2087;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2087, x.name, x.role FROM (
  SELECT 'Andrew Kelsen' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2087)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2087 AND name = x.name);

-- 2115 Canaccord Genuity Wealth (Canada), Vancouver, BC
UPDATE contacts SET
  address = 'Suite 2200, 609 Granville Street',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$55.7B CAD (FY2026 ended March 2026), not $40B. Named contact: Kevin J. Vandermeer, CFA, FCSI, Managing Director, Investment & Advisory Solutions, Lead Portfolio Manager (based Toronto, covers national role; no dedicated manager-research/CIO title found for the Canadian wealth arm).')), 512)
WHERE id = 2115;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2115, x.name, x.role FROM (
  SELECT 'Kevin J. Vandermeer, CFA, FCSI' AS name, 'Managing Director, Investment & Advisory Solutions' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2115)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2115 AND name = x.name);

-- 2122 Beacon Pointe Advisors, Newport Beach, CA
UPDATE contacts SET
  address = '24 Corporate Plaza Drive, Suite 150',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$60-63B AUM+AUA (aggressive acquisitions through 2026), not $40B (CRM''s figure matches an older cached Form ADV snapshot). Named contact: Michael Dow, CPA, CFA, CAIA, Chief Investment Officer & Chairman of the Investment Committee.')), 512)
WHERE id = 2122;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2122, x.name, x.role FROM (
  SELECT 'Michael Dow, CPA, CFA, CAIA' AS name, 'Chief Investment Officer & Chairman of the Investment Committee' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2122)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2122 AND name = x.name);

-- 2116 Richardson Wealth (firm), Toronto, ON
UPDATE contacts SET
  address = '100 Queens Quay East, Suite 2500',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ',
    'AUM check: STALE — last reported ~$43.6B AUA (Sept 2025) before acquisition by iA Financial closed Oct 31, 2025; now part of iA Wealth''s ~$175B advisory network. Named contact: An Nguyen, VP, Investment Services (oversees Action Desk/product research platform for public funds, prior CIBC Asset Management manager research background).')), 512)
WHERE id = 2116;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2116, x.name, x.role FROM (
  SELECT 'An Nguyen' AS name, 'VP, Investment Services' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2116)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2116 AND name = x.name);

-- 2091 Silvercrest Asset Management, New York, NY
UPDATE contacts SET
  address = '1330 Avenue of the Americas, 38th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: consistent — $35.7B total AUM (Q1 2026), matches CRM''s $35B. Named contact: Martin Loeser, Head of Manager Research, Portfolio Manager (SVP).')), 512)
WHERE id = 2091;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2091, x.name, x.role FROM (
  SELECT 'Martin Loeser' AS name, 'Head of Manager Research, Portfolio Manager (SVP)' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2091)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2091 AND name = x.name);

-- 2099 Fiduciary Trust International, New York, NY
UPDATE contacts SET
  address = '280 Park Avenue',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM check: STALE — current figure ~$108-113B (Dec 2025/Mar 2026), not $35B (well below current scale). Named contact: Erick Rawlings, Managing Director & Head of Manager Research.')), 512)
WHERE id = 2099;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2099, x.name, x.role FROM (
  SELECT 'Erick Rawlings' AS name, 'Managing Director & Head of Manager Research' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2099)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2099 AND name = x.name);
