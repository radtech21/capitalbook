-- Pension Fund segment enrichment, US batch 1 of ~5 (21 of 118 records).
-- Bare firm-level seed records enriched with current AUM and hedge-fund/
-- alternatives allocation status; aum_mm column not overwritten (see
-- 104_pension_fund_canada_batch1.sql header for rationale).

-- 1823 CalPERS, Sacramento, CA
UPDATE contacts SET
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$556.2B (6/30/25), possibly ~$600B+ by mid-2026 (unconfirmed). HF status unclear post-TPA restructuring (effective 7/1/26); historically ~5% "Diversifying Strategies" (trend-following/macro). Stephen Gilmore, CIO -- current, confirmed.')), 512)
WHERE id = 1823;

-- 1825 CalPERS (2nd contact), Sacramento, CA
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Marcie Frost, CEO -- on-file, not independently re-confirmed as current this pass; verify before outreach. See id 1823 (Stephen Gilmore, CIO) for the investment-side contact.')), 512)
WHERE id = 1825;

-- 1901 CalSTRS, West Sacramento, CA
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $367.7B (6/30/25); ~$417.3B (5/31/26 unaudited). Confirmed HF investor: "Risk Mitigating Strategies," target raised to 10% (Mar 2025 policy), actual ~7.3-7.7%. Scott Chan, CIO since Jul 2024 -- current, confirmed.')), 512)
WHERE id = 1901;

-- 1902 New York State Common Retirement Fund, Albany, NY
UPDATE contacts SET
  title = 'Investment Office',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $295.4B (3/31/26, record). Confirmed HF investor: blended "Credit, Absolute Return Strategies & Opportunistic Alternatives" bucket, 9.1%. Sole Trustee: Comptroller Thomas DiNapoli; day-to-day PICM/CIO name unconfirmed -- verify before outreach.')), 512)
WHERE id = 1902;

-- 1903 NYC Retirement Systems / Bureau of Asset Management, New York, NY
UPDATE contacts SET
  name = 'Monte Tarbox',
  title = 'Chief Investment Officer, Bureau of Asset Management',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$316B across 5 systems. Monte Tarbox, CIO (made permanent 2025, succeeding Steven Meier). Mixed HF status: NYCERS exited HF 2016; ~26% blended "Private Markets Alternatives" bucket now, unclear if HF reinstated.')), 512)
WHERE id = 1903;

-- 1904 Florida SBA / FRS, Tallahassee, FL
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: >$277B (all-time high, 2025). Confirmed HF investor: "Strategic Investments" 12% target. Chris Spencer is Executive Director; on-file name (Lamar Taylor) may be a distinct CIO-track role -- title split unclear, verify before outreach.')), 512)
WHERE id = 1904;

-- 1905 Teacher Retirement System of Texas, Austin, TX
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$226.3B (8/31/25). Confirmed HF investor: "Stable Value Hedge Funds," 5% target (~$10B). Jase Auby, CIO -- current, confirmed, 17+ years at TRS.')), 512)
WHERE id = 1905;

-- 1906 Washington State Investment Board (WSIB), Olympia, WA
UPDATE contacts SET
  name = 'Allyson Tucker',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $233.9B (3/31/26). NOT a hedge fund investor by design -- known for skipping HF in favor of a very large PE allocation (~25-30% target). Allyson Tucker, CEO (combined ED+CIO role since 2022).')), 512)
WHERE id = 1906;

-- 1907 State of Wisconsin Investment Board (SWIB), Madison, WI
UPDATE contacts SET
  name = 'Edwin Denson',
  title = 'Executive Director & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: >$178B total (12/31/25). HF allocation unclear -- modest historic Multi-Asset/HF-like sleeve, current % unconfirmed. Edwin Denson, ED & CIO since Apr 2021.')), 512)
WHERE id = 1907;

-- 1909 Minnesota State Board of Investment (SBI), St. Paul, MN
UPDATE contacts SET
  name = 'Jill Schurtz',
  title = 'Executive Director & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $157.1B (3/31/26). NOT a hedge fund investor -- no explicit HF/absolute-return line in target policy; portfolio structured as public equity, fixed income, private markets. Jill Schurtz, Executive Director & CIO.')), 512)
WHERE id = 1909;

-- 1910 North Carolina Retirement Systems, Raleigh, NC
UPDATE contacts SET
  name = 'Kevin SigRist',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $139B (9/30/25, +10% YoY). HF status unclear -- historic "Multi-Strategy" bucket, possibly shifted under 2025 NC Investment Authority governance overhaul. Kevin SigRist, CIO (reappointed under Treasurer Brad Briner, Jan 2025).')), 512)
WHERE id = 1910;

-- 1911 Virginia Retirement System (VRS), Richmond, VA
UPDATE contacts SET
  name = 'Andrew Junkin',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$122.8-128.6B (6/30/25). Confirmed HF investor: "Diversifying Strategies" 4% target; "Credit Strategies" 15% target. Andrew Junkin, CIO.')), 512)
WHERE id = 1911;

-- 1912 Ohio Public Employees Retirement System (OPERS), Columbus, OH
UPDATE contacts SET
  name = 'Paul Greff',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$120.8B (12/31/24; some 2025 press cites $142-158B, unreconciled). NOT a hedge fund investor -- eliminated dedicated Hedge Funds asset class in 2020. Paul Greff, CIO.')), 512)
WHERE id = 1912;

-- 1913 Massachusetts PRIM (PRIT Fund), Boston, MA
UPDATE contacts SET
  name = 'Michael Trotsky',
  title = 'Executive Director & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $115.4B (6/30/25, record). Confirmed HF investor: "Portfolio Completion Strategies" incl. hedge funds, historically high-single/low-double digits. Michael Trotsky, CFA, ED & CIO.')), 512)
WHERE id = 1913;

-- 1914 Teachers Retirement System of Georgia (TRSGA), Atlanta, GA
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$105-109B (FY2025). HF allocation not found. CIO name not found this pass -- leadership page returned no result; verify before outreach.')), 512)
WHERE id = 1914;

-- 1915 State Teachers Retirement System of Ohio (STRS Ohio), Columbus, OH
UPDATE contacts SET
  name = 'Aaron DiCenzo',
  title = 'Deputy Executive Director, Investments & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $104.1B (9/30/25). Confirmed HF investor: new "Liquid Alternatives" asset class, 7% policy target, ~1.8% actual (ramping). Aaron DiCenzo, CIO (permanent since 2025).')), 512)
WHERE id = 1915;

-- 1916 Oregon Public Employees Retirement Fund (PERF / OIC), Tigard, OR
UPDATE contacts SET
  name = 'Rex Kim',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $106.9B (12/31/25). Confirmed HF investor: "Diversifying Strategies" ~7.5% (~$5.4B). Rex Kim, CIO, Oregon State Treasury.')), 512)
WHERE id = 1916;

-- 1917 New Jersey Division of Investment, Trenton, NJ
UPDATE contacts SET
  name = 'Shoaib Khan',
  title = 'Director & Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $84.1B (6/30/25). HF allocation unclear -- historic Absolute Return/Risk Mitigation bucket, current % unconfirmed. Shoaib Khan, Director & CIO.')), 512)
WHERE id = 1917;

-- 1918 Los Angeles County Employees Retirement Association (LACERA), Pasadena, CA
UPDATE contacts SET
  name = 'Jonathan Grabel',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$83-87B (2025). Confirmed HF investor: allocation raised to 8% (from 6%) under 2025 policy. Jonathan Grabel, CIO.')), 512)
WHERE id = 1918;

-- 1919 Pennsylvania PSERS, Harrisburg, PA
UPDATE contacts SET
  name = 'Benjamin Cotton',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$85.7B. NOT a hedge fund investor -- former "Absolute Return" allocation cut to 0% target, residual legacy ~0.9%. Benjamin Cotton, Ed.D., CFA, CIO.')), 512)
WHERE id = 1919;

-- 1920 Teachers' Retirement System of Illinois (TRS Illinois), Springfield, IL
UPDATE contacts SET
  name = 'Stan Rupnik',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $81.1B (3/31/26). Likely HF investor: "Diversifying Strategies" program (Senior Investment Officer hired Oct 2025); target % not confirmed. Stan Rupnik, CFA, CIO (verify ED/CIO title split).')), 512)
WHERE id = 1920;
