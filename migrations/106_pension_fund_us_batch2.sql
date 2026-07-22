-- Pension Fund segment enrichment, US batch 2 of ~5 (20 of 118 records).

-- 2132 State of Michigan Retirement Systems (ORS), Lansing, MI
UPDATE contacts SET
  name = 'Jon Braeutigam',
  title = 'Chief Investment Officer, Bureau of Investments',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $122.4B (12/31/25). Confirmed HF investor: "Absolute Return" (HF+private credit) 10.1%. Jon Braeutigam, CIO, Bureau of Investments.')), 512)
WHERE id = 2132;

-- 2133 Maryland State Retirement and Pension System, Baltimore, MD
UPDATE contacts SET
  name = 'Dianne Sandoval',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $73.5B (6/30/25). Confirmed HF investor: explicit "Absolute Return" 5.5%. Dianne Sandoval, CIO (started Jan 2026 -- very recent, verify).')), 512)
WHERE id = 2133;

-- 2134 Tennessee Consolidated Retirement System (TCRS), Nashville, TN
UPDATE contacts SET
  name = 'Michael Brakebill',
  title = 'Chief Investment Officer, TN Dept. of Treasury',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $74.9B (6/30/25). Confirmed HF investor: exposure inside "Strategic Lending" asset class (~5% target); total alternatives ~18%. Michael Brakebill, CIO.')), 512)
WHERE id = 2134;

-- 2135 Colorado PERA, Denver, CO
UPDATE contacts SET
  name = 'Amy McGarrity',
  title = 'Chief Investment Officer & Chief Operating Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $75.1B (12/31/25). HF allocation unclear -- ~6% "Alternatives" target policy, not confirmed as HF-labeled. Amy McGarrity, CFA, CIO & COO.')), 512)
WHERE id = 2135;

-- 2136 Public Employees Retirement System of Nevada (NVPERS), Carson City, NV
UPDATE contacts SET
  name = 'Steve Edmundson',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $70.5B (6/30/25). NOT a hedge fund investor -- explicit policy of no leverage/derivatives/hedge funds/junk bonds, near-100% indexed. Steve Edmundson, CIO.')), 512)
WHERE id = 2136;

-- 2137 PSRS/PEERS of Missouri, Jefferson City, MO
UPDATE contacts SET
  name = 'Craig Husting',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $64.4B combined (9/30/25). HF allocation not confirmed -- ~40% private-markets emphasis, no distinct HF line found. Craig Husting, CIO.')), 512)
WHERE id = 2137;

-- 2138 Arizona State Retirement System (ASRS), Phoenix, AZ
UPDATE contacts SET
  name = 'Michael Viteri',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$50B (6/30/25). HF allocation unclear -- policy organized around Equity/Fixed Income/RE/Private Debt/Multi-Asset rather than a distinct HF line. Michael Viteri, CIO since Jun 2021; Samer Ghaddar, Deputy CIO.')), 512)
WHERE id = 2138;

-- 2139 Texas Permanent School Fund, Austin, TX
UPDATE contacts SET
  name = 'Robert Borden',
  title = 'Chief Executive Officer & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $65.7B (8/31/25). Confirmed HF investor: ~52% of liquid portion in alternatives incl. HF; Deputy CIO Stuart Bohart owns HF/direct-lending/co-investment portfolios. Robert Borden, CEO & CIO.')), 512)
WHERE id = 2139;

-- 2140 Indiana Public Retirement System (INPRS), Indianapolis, IN
UPDATE contacts SET
  name = 'Scott Davis',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $54.9B (6/30/25). Confirmed HF investor: "Absolute Return" formal asset class, ~7.9% of DB portfolio. Scott Davis, CFA, CIO.')), 512)
WHERE id = 2140;

-- 2141 Texas County & District Retirement System (TCDRS), Austin, TX
UPDATE contacts SET
  name = 'Casey Wolf',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $51B net plan assets (12/31/24). Confirmed HF investor: explicit Hedge Fund Program to reduce total-fund volatility, target % not found. Casey Wolf, CIO.')), 512)
WHERE id = 2141;

-- 2142 Connecticut Retirement Plans and Trust Funds (CRPTF), Hartford, CT
UPDATE contacts SET
  title = 'Office of the State Treasurer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $68.7B (12/31/25). Confirmed HF investor: "Absolute Return/Risk Mitigating Strategies" sleeve, 5% target, 4.2% actual. Administered by CT Office of the State Treasurer (Erick Russell); CIO name unconfirmed.')), 512)
WHERE id = 2142;

-- 2143 Retirement Systems of Alabama (RSA), Montgomery, AL
UPDATE contacts SET
  name = 'David Bronner',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | NOT a hedge fund investor -- invests fully in-house via staff, no external HF managers. David Bronner, CEO (no separate CIO title; in role since 1973, age ~82 -- re-verify given tenure).')), 512)
WHERE id = 2143;

-- 2144 Utah Retirement Systems (URS), Salt Lake City, UT
UPDATE contacts SET
  name = 'John Skjervem',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$58.5B combined (12/31/24). Confirmed HF investor: "Absolute Return" 15% target. John Skjervem, CIO (start date conflicting across sources, verify).')), 512)
WHERE id = 2144;

-- 2145 Iowa Public Employees' Retirement System (IPERS), West Des Moines, IA
UPDATE contacts SET
  name = 'Sriram Lakshminarayanan',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$44.7-47B. NOT a hedge fund investor -- no HF/absolute-return bucket found. Sriram Lakshminarayanan cited as CIO (Jan 2026 article); separately searching for new CEO.')), 512)
WHERE id = 2145;

-- 2146 South Carolina RSIC, Columbia, SC
UPDATE contacts SET
  name = 'Bryan Moore',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $50.3B (FYE 6/30/25). Confirmed HF investor: explicit "portable alpha" HF program, target ~10%, capped 15%. Bryan Moore, CIO (permanent 10/16/2025 -- very recent, verify).')), 512)
WHERE id = 2146;

-- 2147 Employees Retirement System of Texas (ERS), Austin, TX
UPDATE contacts SET
  name = 'David Veal',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $42.6B (8/31/25, record). Confirmed HF investor: explicit "Absolute Return Portfolio," 6% target, 5.6% actual. David Veal, CIO (Executive Director is a separate role: Porter Wilson).')), 512)
WHERE id = 2147;

-- 1893 GPIF (Government Pension Investment Fund), Tokyo, Japan -- leadership stale, updating
UPDATE contacts SET
  name = 'Kazuto Uchida',
  title = 'President',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Kazuto Uchida, President since Apr 2025. AUM refined: ~$1.87-2.0T (world''s largest pension fund). Minimal HF investor: alts only ~1.7% ($35.4B) vs 5% ceiling. CIO seat vacant -- Eiji Ueda departed for Apollo ~Oct 2025, no successor confirmed, verify before CIO-level outreach.')), 512)
WHERE id = 1893;

-- 2450 New Mexico Public Employees Retirement Association (PERA), Santa Fe, NM
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$18.6B (6/30/25). HF allocation not confirmed. CIO name CONFLICTING across sources (Michael Shackelford per 2022 official release vs. Gregory Wright per a lower-confidence aggregator) -- verify directly before outreach.')), 512)
WHERE id = 2450;

-- 2451 San Diego County Employees Retirement Association (SDCERA), San Diego, CA
UPDATE contacts SET
  name = 'Stephen Sexauer',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$18.4-18.5B (FY2025 est.). Likely HF investor: known industry-wide for a large "Diversifying Strategies" bucket incl. HF/absolute return; current target % not confirmed. Stephen Sexauer, CIO since 2015.')), 512)
WHERE id = 2451;

-- 2452 South Dakota Retirement System (SDRS) / Investment Council, Pierre, SD
UPDATE contacts SET
  name = 'Matthew Clark',
  title = 'State Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$21B (SDIC total, incl. non-pension state trust funds -- pension-only AUM likely smaller). "Arbitrage & Aggressive Absolute Return" category exists; current % not found. Matthew Clark, State Investment Officer.')), 512)
WHERE id = 2452;
