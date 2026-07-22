-- Pension Fund segment enrichment, Canada batch (17 of 118 records). These
-- are firm-level bare seed records with a generic "Pension Fund"/"Investment
-- Office" title placeholder and no leadership/allocation detail beyond the
-- on-file name. aum_mm is not overwritten here (reported multiple ways
-- across sources); the current figure is noted in data_flags for review.
-- On-file names are left as-is unless there's clear evidence of departure --
-- where the on-file name may not match this pass's research (a different
-- role, e.g. CEO vs CIO, is common), that's flagged rather than guessed at.

-- 1204 IMCO, Toronto, ON
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$90.7B (end 2025), not $77.4B. CIO: Rossitsa Stoyanova.')), 512)
WHERE id = 1204;

-- 1205 CDPQ, Montreal/Quebec City, QC
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$473.3B (Dec 2024). Confirmed HF investor via Total Portfolio/liquid markets program. No single CIO title -- investments run under asset-class EVPs.')), 512)
WHERE id = 1205;

-- 1206 BCI, Victoria, BC
UPDATE contacts SET
  title = 'Chief Executive Officer & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$295B gross / C$251.6B net (Mar 2025). Confirmed HF investor: C$6.4B committed to absolute-return sleeve within Global Partnership Fund, FY2026.')), 512)
WHERE id = 1206;

-- 1208 HOOPP, Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$131.9B (2025). CIO: Michael Wissell (title/tenure in transition per recent reports, verify). On-file name (Jeff Makholm) not independently re-confirmed this pass.')), 512)
WHERE id = 1208;

-- 1211 AIMCo, Edmonton, AB
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$194.7B (Dec 2025). Confirmed HF investor via multi-asset/absolute-return capability. CIO: Justin Lord (promoted 2025). Ray Gilmour, CEO, permanent since Dec 2025 -- current, confirmed.')), 512)
WHERE id = 1211;

-- 1279 Ontario Teachers' Pension Plan, Toronto, ON
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$279.4B (Dec 2025). Confirmed HF investor: ~6-8% CTA/absolute-return allocation, historically reduced as internal capabilities grew. Jo Taylor, CEO -- current, confirmed.')), 512)
WHERE id = 1279;

-- 1280 Ontario Teachers' Pension Plan (2nd contact), Toronto, ON -- title unverified, flagging
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | LEADERSHIP DISCREPANCY: current research names Gillian Brown (Public & Private Investments) and Stephen McLennan (Asset Allocation) as Co-CIOs; on-file name (Ziad Hindo) not corroborated this pass -- verify his current title before outreach.')), 512)
WHERE id = 1280;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1280, x.name, x.role FROM (
  SELECT 'Gillian Brown' AS name, 'Co-Chief Investment Officer, Public & Private Investments' AS role
  UNION ALL SELECT 'Stephen McLennan', 'Co-Chief Investment Officer, Asset Allocation'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1280)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1280 AND name = x.name);

-- 1291 University Pension Plan (UPP), Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$13.5B (Dec 2025). CEO: Barbara Zvan; CIO: Aaron Bennett. On-file name (Zandra Alexander) not independently re-confirmed this pass.')), 512)
WHERE id = 1291;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1291, x.name, x.role FROM (
  SELECT 'Barbara Zvan' AS name, 'Chief Executive Officer' AS role
  UNION ALL SELECT 'Aaron Bennett', 'Chief Investment Officer'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1291)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1291 AND name = x.name);

-- 1646 CPP Investments, Toronto, ON
UPDATE contacts SET
  title = 'Senior Managing Director & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$793.3B (Mar 2026). Confirmed HF investor: dedicated "Absolute Return Strategies" (External Portfolio Management) + Systematic Strategies Group. Edwin Cass, CIO -- current, confirmed.')), 512)
WHERE id = 1646;

-- 1647 CPP Investments (2nd contact), Toronto, ON
UPDATE contacts SET
  title = 'President & Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | John Graham, President & CEO -- current, confirmed. See id 1646 (Edwin Cass, CIO) for the investment-side contact.')), 512)
WHERE id = 1647;

-- 1649 PSP Investments, Ottawa/Montreal, QC
UPDATE contacts SET
  title = 'President & Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$299.7B (Mar 2025). Confirmed HF investor: internal/external hedge fund strategies, event-driven, ~30% private markets. Deborah Orida, President & CEO -- current, confirmed.')), 512)
WHERE id = 1649;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1649, x.name, x.role FROM (
  SELECT 'Patrick Charbonneau' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1649)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1649 AND name = x.name);

-- 1824 OPTrust, Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~C$27B. CIO cited in some sources as James Davis (unverified this pass). On-file name (Jason White) not independently re-confirmed -- verify his current title before outreach.')), 512)
WHERE id = 1824;

-- 1826 OMERS, Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$145.2B (Dec 2025). CIO seat vacant since Ralph Berg departed Jul 2025 (moved to Temasek); CEO Blake Hutcheson has absorbed CIO duties. On-file name (Jeff Chicken) not independently re-confirmed this pass.')), 512)
WHERE id = 1826;

-- 2006 WSIB Ontario, Toronto, ON
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Investment fund managed by IMCO (see id 1204) -- no separate CIO/CEO of its own found.')), 512)
WHERE id = 2006;

-- 2007 Ontario Pension Board, Toronto, ON
UPDATE contacts SET
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$34.1B (Public Service Pension Plan; managed by IMCO). Andrew Tambone, CIO since Jul 2025.')), 512)
WHERE id = 2007;

-- 2008 Vestcor, Fredericton, NB
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: >C$20B. Sean Hewitt, CEO -- current, confirmed.')), 512)
WHERE id = 2008;

-- 2009 CAAT Pension Plan, Toronto, ON
UPDATE contacts SET
  title = 'Chief Investment Officer / Acting CEO',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: C$25.4B (Jan 2026). Kevin Fahey, CIO/Acting CEO -- current, confirmed.')), 512)
WHERE id = 2009;
