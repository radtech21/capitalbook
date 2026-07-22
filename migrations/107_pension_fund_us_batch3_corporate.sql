-- Pension Fund segment enrichment, US batch 3 (9 records) + corporate/
-- Taft-Hartley batch (6 records) = 15 of 118 total records.

-- 2438 Illinois Municipal Retirement Fund (IMRF), Oak Brook, IL
UPDATE contacts SET
  name = 'Angela Miller-May',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $60.8B (12/31/25). HF allocation not found. Angela Miller-May, CIO.')), 512)
WHERE id = 2438;

-- 2439 Texas Municipal Retirement System (TMRS), Austin, TX
UPDATE contacts SET
  name = 'Tom Masthay',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$47-48B (2025). HF allocation unclear -- no current explicit target found; 2025 policy overhaul emphasized PE/credit/real assets instead. Tom Masthay, CFA CAIA FRM, CIO (promoted Dec 2025 -- very recent, verify).')), 512)
WHERE id = 2439;

-- 2440 San Francisco Employees Retirement System (SFERS), San Francisco, CA
UPDATE contacts SET
  name = 'Alison Romano',
  title = 'Executive Director & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$36.3B (12/31/24). Confirmed HF investor: 10% target Absolute Return/HF, 10% actual. Alison Romano, ED & CIO.')), 512)
WHERE id = 2440;

-- 2441 Kansas Public Employees Retirement System (KPERS), Topeka, KS
UPDATE contacts SET
  name = 'Bruce Fink',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $29.4B (6/30/25). HF allocation not found. Bruce Fink, CIO since 2022.')), 512)
WHERE id = 2441;

-- 2442 Employees Retirement System of Hawaii (ERS), Honolulu, HI
UPDATE contacts SET
  name = 'Kristin Varela',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$22-22.5B. Confirmed HF investor: "Diversifying Strategies" bucket incl. Global Macro/Relative Value. Kristin Varela, CIO since Jan 2023.')), 512)
WHERE id = 2442;

-- 2443 Los Angeles City Employees Retirement System (LACERS), Los Angeles, CA
UPDATE contacts SET
  name = 'Rodney June',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM figure unreliable -- flagged for re-verification against LACERS'' own FY2025 ACFR, do not use on file until confirmed. HF status unclear -- a search result conflated LACERS with the much larger LACERA. Rodney June, CIO.')), 512)
WHERE id = 2443;

-- 2444 West Virginia Consolidated Public Retirement Board (CPRB), Charleston, WV
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CPRB administers benefits; assets are actually managed by the separate West Virginia Investment Management Board (WVIMB, wvimb.org) -- $28.5B (6/30/25), confirmed HF investor via dedicated Hedge Fund Pool. Craig Slaughter is WVIMB''s CIO, the real investment-side contact.')), 512)
WHERE id = 2444;

-- 2445 Orange County Employees Retirement System (OCERS), Santa Ana, CA
UPDATE contacts SET
  name = 'Molly Murphy',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$20-24.5B, range unreconciled. Confirmed HF investor: "Risk Mitigation" asset class, 10% target (6-14% range). Molly Murphy, CIO.')), 512)
WHERE id = 2445;

-- 2446 Teachers Retirement System of Oklahoma (OTRS), Oklahoma City, OK
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$25B. HF allocation not found; "lower-than-average" alts per secondary source. CIO cited as Kirk Stebbins (single-source, unconfirmed) -- verify before outreach.')), 512)
WHERE id = 2446;

-- 2044 The Boeing Company pension plan, Arlington, VA
UPDATE contacts SET
  name = 'Elizabeth Tulach',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Confirmed HF investor: small explicit HF sleeve alongside PE/RE (59% FI/19% global equity as of 12/31/24). Elizabeth Tulach, CIO.')), 512)
WHERE id = 2044;

-- 2045 Ford Motor Company pension plan, Dearborn, MI
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$45B worldwide. Confirmed HF investor: ~20% "growth assets" incl. HF/RE/PE. Named CIO not found this pass -- corporate pension CIOs are typically not publicly profiled.')), 512)
WHERE id = 2045;

-- 2046 IBM Retirement Funds pension plan, Armonk, NY
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$50B (2023-24). Confirmed HF investor: PE/RE/hedge assets, fixed-income/hedge target cut to 70% (from 83%) in 2024. Named CIO not found -- Harshal Chaudhari moved to Chief Analytics Officer, successor unknown.')), 512)
WHERE id = 2046;

-- 2047 General Motors pension plan (GMAM), Detroit, MI
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$64.5B (12/31/22). Confirmed HF investor: historic pioneer among corporate plans in HF/"alpha" allocations. Named CIO not found this pass.')), 512)
WHERE id = 2047;

-- 2048 RTX Corporation (Raytheon) pension plan, Arlington, VA
UPDATE contacts SET
  name = 'Robin Diamonte',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$40-46.4B (figures conflict). LDI approach, shifting toward liability-hedging bonds as funded status improves -- implies moderating alts allocation, HF % not confirmed. Robin Diamonte, CIO -- solidly confirmed.')), 512)
WHERE id = 2048;

-- 2049 Western Conference of Teamsters Pension Trust, Seattle, WA area
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$50-58B. Reputed diversified institutional program incl. alternatives, though HF allocation not independently confirmed. Named CIO not found -- administered by Northwest Administrators, Inc.')), 512)
WHERE id = 2049;
