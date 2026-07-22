-- Sovereign Wealth Fund segment enrichment, batch 2 of 2 (final 3 of 25
-- records). Completes the segment started in 102_swf_enrichment_batch1.sql.
-- Future Fund (1888) is fully handled in batch 1; not repeated here.

-- 1883 SAFE Investment Company (China), Hong Kong
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~US$1.952T (May 2026, third-party trackers -- SAFE doesn''t publish its own figure). Alternatives exposure confirmed; HF-specific allocation not confirmed. No public corporate site exists. Current director name unconfirmed -- verify before outreach.')), 512)
WHERE id = 1883;

-- 2197 New Zealand Superannuation Fund, Auckland, New Zealand
UPDATE contacts SET
  name = 'Jo Townsend',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Jo Townsend is current CEO. NZ$86.6B (12mo to 3/31/2026). Confirmed HF investor: actively-managed portfolio includes global macro/distressed-debt HF strategies; reference portfolio (95% equities/FI) has no dedicated HF line.')), 512)
WHERE id = 2197;

-- 2223 Permodalan Nasional Berhad (PNB, Malaysia), Kuala Lumpur, Malaysia
UPDATE contacts SET
  name = 'Dato'' Rizal Rickman Ramli',
  title = 'President & Group Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Dato'' Rizal Rickman Ramli appointed President & Group CEO May 2026 (succeeded Dato'' Abdul Rahman Ahmad). ~RM366B (Mar 2026). Expanding PE/private markets (target 6-7% AUM); HF-specific allocation not confirmed.')), 512)
WHERE id = 2223;
