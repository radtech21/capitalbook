-- The AUM figures for the Financial Advisor segment were sourced a while back and
-- are stale; bump them 30% across the board to bring them back in line with
-- current asset values. Only the Financial Advisor segment is touched — other
-- segments (Pension Fund, Family Office, etc.) were not reported as out of date.
UPDATE contacts SET aum_mm = ROUND(aum_mm * 1.3, 2) WHERE segment = 'Financial Advisor' AND aum_mm IS NOT NULL;
