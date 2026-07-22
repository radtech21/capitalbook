-- Venture Capital / Growth segment enrichment, batch 5 (final 7/52 records).
-- Completes the segment: all 52 VC/growth firm records now enriched.
-- Notable caveat: OMERS Ventures' Head of Ventures (Saar Pikar) departs
-- Jul 28 2026 with no successor named yet -- Laura Lenz listed as the
-- safer current contact rather than a departing exec.

-- 2295 DST Global, London, UK
UPDATE contacts SET
  address = '24 Savile Row, 6th Floor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$50B AUM est. (unverified secondary estimate, not firm-disclosed).')), 512)
WHERE id = 2295;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2295, x.name, x.role FROM (
  SELECT 'Yuri Milner' AS name, 'Founder' AS role
  UNION ALL SELECT 'John Lindfors', 'Co-Founder & Managing Partner'
  UNION ALL SELECT 'Rahul Mehta', 'Co-Founder & Managing Partner'
  UNION ALL SELECT 'Saurabh Gupta', 'Co-Founder & Managing Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2295) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2295 AND name = x.name);

-- 2299 OMERS Ventures, Toronto, ON
UPDATE contacts SET
  address = 'EY Tower, 900-100 Adelaide Street West',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership in flux: Saar Pikar (Head of Ventures) departs Jul 28 2026 for Kensington Capital; no successor named yet. ~$2B AUM (unverified).')), 512)
WHERE id = 2299;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2299, x.name, x.role FROM (
  SELECT 'Laura Lenz' AS name, 'Managing Director' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2299) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2299 AND name = x.name);

-- 2300 Georgian, Toronto, ON
UPDATE contacts SET
  address = '100 University Ave',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$5.9B AUM (Dec 2025). Growth Fund VI ~$900M (2023) + Alignment Fund II ~$500M. Mar 2026: $100M Navigator Global stake sale (mgmt co., not a new fund).')), 512)
WHERE id = 2300;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2300, x.name, x.role FROM (
  SELECT 'Justin LaFayette' AS name, 'Co-Founder & Head of Firm' AS role
  UNION ALL SELECT 'Simon Chong', 'Co-Founder & CEO'
  UNION ALL SELECT 'Tyson Clark', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2300) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2300 AND name = x.name);

-- 2301 Inovia Capital, Montreal, QC
UPDATE contacts SET
  address = '3 Place Ville-Marie, Bureau 12350',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $2.5B active AUM + $1.2B GP/LP co-invest (per firm site). Other named partners found only via low-confidence directories -- unverified, not added.')), 512)
WHERE id = 2301;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2301, x.name, x.role FROM (
  SELECT 'Chris Arsenault' AS name, 'Co-Founder, President & CEO' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2301) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2301 AND name = x.name);

-- 2302 Real Ventures, Montreal, QC
UPDATE contacts SET
  address = '3 Place Ville-Marie, Suite 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Janet Bannister departed 2022 (now at Staircase Ventures) -- do not list as contact. ~$320-330M AUM (dated figure, no 2025-26 update found).')), 512)
WHERE id = 2302;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2302, x.name, x.role FROM (
  SELECT 'John Stokes' AS name, 'Co-Founder & Managing Partner' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2302) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2302 AND name = x.name);

-- 2303 Golden Ventures, Toronto, ON
UPDATE contacts SET
  address = '20 Maud Street, Suite 306',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$364M AUM (Oct 2025). Fund IV launched ~Jun 2024, standalone size unconfirmed.')), 512)
WHERE id = 2303;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2303, x.name, x.role FROM (
  SELECT 'Matt Golden' AS name, 'Founder & Managing Partner' AS role
  UNION ALL SELECT 'Ameet Shah', 'General Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2303) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2303 AND name = x.name);

-- 2305 BDC Capital, Montreal, QC
UPDATE contacts SET
  address = '5 Place Ville-Marie, Bureau 400',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Suite/floor conflicting across sources (Bureau 400 vs ground floor listing) -- verify before use. ~CAD$6.9-7B AUM (2024, no 2025-26 update found).')), 512)
WHERE id = 2305;
INSERT INTO contact_people (contact_id, name, role)
SELECT 2305, x.name, x.role FROM (
  SELECT 'Geneviève Bouthillier' AS name, 'Executive Vice President, BDC Capital' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2305) AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2305 AND name = x.name);
