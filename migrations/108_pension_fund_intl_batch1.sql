-- Pension Fund segment enrichment, international batch 1 (18 of 118
-- records): Australian superannuation funds, Dutch/UK pension funds
-- (partial, WebSearch budget was exhausted mid-research on ATP/Alecta/
-- Varma/Ilmarinen/PFA -- not included here, pending a follow-up pass),
-- four smaller US state funds, and the US federal Thrift Savings Plan.

-- 1899 AustralianSuper, Melbourne, Australia
UPDATE contacts SET
  name = 'Paul Schroder',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: A$410B+ (12/31/25). Alts ~35% of Balanced option (PE/infra/property), no standalone HF %. CEO: Paul Schroder; CIO: Shaun Manuell (from Jul 1 2026, succeeded Mark Delaney).')), 512)
WHERE id = 1899;

-- 2032 Australian Retirement Trust (ART), Brisbane, Australia
UPDATE contacts SET
  name = 'Kathy Vincent',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~$300-370B, unreconciled across sources. ~25% alts target, no separate HF %. CEO: Kathy Vincent (from Oct 1 2025); CIO: Ian Patrick.')), 512)
WHERE id = 2032;

-- 2033 Aware Super, Sydney, Australia
UPDATE contacts SET
  name = 'Deanne Stewart',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$190-210B. Confirmed HF investor: liquid alts/HF portfolio (36 South, AQR, Ionic Capital) ~4% of conservative balanced pension. CEO: Deanne Stewart; CIO: Simon Warner (from Dec 1 2025).')), 512)
WHERE id = 2033;

-- 2034 UniSuper, Melbourne, Australia
UPDATE contacts SET
  name = 'Peter Chun',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~$155-166B, unreconciled. ~15% alts target, no HF-specific %. CEO: Peter Chun (since Sept 2021); CIO: John Pearce (since Jul 2009).')), 512)
WHERE id = 2034;

-- 2035 Hostplus, Melbourne, Australia
UPDATE contacts SET
  name = 'David Elia',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$115-118B. Alts an available asset class, no % disclosed. CEO: David Elia AM; CIO: Sam Sicilia (since 2008).')), 512)
WHERE id = 2035;

-- 2036 Cbus, Melbourne, Australia
UPDATE contacts SET
  name = 'Kristian Fok',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $110B (2/1/26, post Media Super merger). ~10% "alternative strategies" (PE/HF/long-duration credit) per a dated 2024 source. CEO: Kristian Fok (since Jun 2023); CIO: Leigh Gavin (recent, replaced Brett Chatfield).')), 512)
WHERE id = 2036;

-- 2037 HESTA, Melbourne, Australia
UPDATE contacts SET
  name = 'Debby Blakey',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $100B+ (Oct 2025 milestone). Growth option incl. some alts, no % found. CEO: Debby Blakey (Robbie Campo incoming Aug 2026); CIO: Sonya Sawtell-Rickson (since Jul 2017).')), 512)
WHERE id = 2037;

-- 1896 ABP (managed by APG), Heerlen, Netherlands
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: EUR532B (~$615B, 2025 est., date unconfirmed). Alts/real assets ~28-30% (PE ~10%, infra, RE, HF). Announced ending strategic HF allocation (~4.1%) by end 2022 -- may retain HF-like strategies, current status unconfirmed. APG CEO: Alineke van den Berge-Blindenbach (from Jul 1 2026); CIO name unconfirmed.')), 512)
WHERE id = 1896;

-- 1897 PFZW (managed by PGGM), Zeist, Netherlands
UPDATE contacts SET
  name = 'Lars Dijkstra',
  title = 'Interim Chief Investment Officer, PGGM',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~EUR252B (12/31/25 implied). Alts ~22-30% (PE/infra/RE/private credit); ILS/reinsurance ~3%. Like ABP, known for scaling back traditional HF -- not independently confirmed. PGGM CEO Edwin Velzel departing end 2026; Lars Dijkstra is interim CIO after Frank Roeters van Lennep resigned.')), 512)
WHERE id = 1897;

-- 2154 Pensioenfonds Metaal en Techniek (PMT), Rijswijk, Netherlands
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~EUR86B (2026 source, date unclear). ~16% alts target (RE/infra/PE/private credit) via fiduciary manager (moving from MN to PGGM). No HF-specific % found. No named CIO found -- board co-chairs Caspar Vlaar and Terry Troost; exec director Lenneke Roodenburg.')), 512)
WHERE id = 2154;

-- 2156 Pensioenfonds van de Metalektro (PME), Schiphol, Netherlands
UPDATE contacts SET
  name = 'Alae Laghrich',
  title = 'Chair, Executive Board',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~$55B (~EUR50B, Mar 2026 source). ~20% alts target (PE/infra/RE/private credit) via MN. No HF-specific % found. Alae Laghrich, chair of PME''s Executive Board; investment management outsourced to MN, no named CIO.')), 512)
WHERE id = 2156;

-- 2038 Universities Superannuation Scheme (USS), Liverpool, UK (on-file city "London" may be inaccurate -- verify)
UPDATE contacts SET
  name = 'Carol Young',
  title = 'Group Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: GBP73.1-79.8B / ~$95B (12/31/24), figures conflict, not fully reconciled. Current alts/HF % not found (search budget exhausted). Group CEO: Carol Young (since Sept 2023); a "Simon Pilcher" reference (CEO of USS Investment Management subsidiary) surfaced but not verified.')), 512)
WHERE id = 2038;

-- 2039 Railpen (RPMI), London, UK (on-file city "Coventry" may be inaccurate -- verify)
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~GBP30B, no as-of date found, likely dated. Private assets (PE/private debt/infra) >20% of AUM; HF-specific % not found. Named CIO not found this pass -- verify directly at rpmirailpen.co.uk.')), 512)
WHERE id = 2039;

-- 2148 Public Employees Retirement System of Mississippi, Jackson, MS
UPDATE contacts SET
  name = 'Charles Nielsen',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: $36.0B (FY2025). HF % not found in disclosed allocation (26% US equity/20% non-US equity/19% FI/11% global equity/11% RE/11.5% PE). Charles Nielsen, CIO.')), 512)
WHERE id = 2148;

-- 2447 Arkansas Teacher Retirement System (ATRS), Little Rock, AR
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$25.5B (Jun 2026). Confirmed HF investor: alts/HF = 5.1% of total investments; RE 6.7%, PE 13.4%. Named CIO not found this pass -- verify before outreach.')), 512)
WHERE id = 2447;

-- 2448 Public Employee Retirement System of Idaho (PERSI), Boise, ID
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: $20.8B (7/1/23, likely stale, more recent figure not confirmed). NOT a hedge fund investor -- explicit written policy against HF/tactical asset allocation, uses PE/RE for illiquidity premium instead. Named CIO not found this pass.')), 512)
WHERE id = 2448;

-- 2449 Maine Public Employees Retirement System (MainePERS), Augusta, ME
UPDATE contacts SET
  name = 'Rebecca Wyke',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~$19B. Real HF exposure confirmed (e.g. $100M Voleon Composition Fund commitment) though no clean disclosed HF-only %; a cited "57.5% alternatives" figure looks inflated/bundled, treat with caution. Rebecca Wyke, CEO (not CIO -- named CIO not found).')), 512)
WHERE id = 2449;

-- 1895 Federal Retirement Thrift Investment Board (FRTIB) / Thrift Savings Plan (TSP), Washington, DC
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~$963B-$1.006T (figures conflict, exact current not confirmed). NOT a hedge fund prospect -- statutorily restricted to 5 index funds (G/F/C/S/I) plus mutual fund window, no HF/alts permitted without Congressional action. Lower priority, exclude from HF outreach despite scale.')), 512)
WHERE id = 1895;
