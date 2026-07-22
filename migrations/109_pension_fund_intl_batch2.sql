-- Pension Fund segment enrichment, international batch 2 (8 of 118
-- records): Japan, Korea, China, and 2 Chilean AFPs. All data here is
-- lower-confidence than prior batches -- WebSearch budget was exhausted
-- mid-research on most of these, so CIO names in particular are weaker
-- than usual; flagged individually below.

-- 2149 Norinchukin Bank, Tokyo, Japan
UPDATE contacts SET
  name = 'Taro Kitabayashi',
  title = 'President & Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM conflicting: ~JPY99.8T (FY2023) vs ~$840B (undated), no current figure confirmed. Confirmed PE/HF investor, no % disclosed. Taro Kitabayashi, President & CEO since Apr 2025 (succeeded Kazuto Oku, resigned over losses).')), 512)
WHERE id = 2149;

-- 2153 Pension Fund Association (Japan), Tokyo, Japan
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: $113B (Mar 2021 Preqin figure, stale, no recent figure found). HF allocation not found. Named President not confirmed this pass -- verify before outreach.')), 512)
WHERE id = 2153;

-- 1894 National Pension Service (NPS), Jeonju, South Korea
UPDATE contacts SET
  name = 'Kim Sung-joo',
  title = 'Chairman & Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: KRW1,670.7T (~$1.15-1.2T, end-Apr 2026) -- one of the world''s largest pension funds. ~15% target to combined alts (PE/RE/infra/HF); HF-specific % stale. Kim Sung-joo, Chairman/CEO since Dec 2025; CIO seat vacant/in transition.')), 512)
WHERE id = 1894;

-- 2159 Korea Teachers' Credit Union (KTCU), Seoul, South Korea
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: KRW85.9T (~$56.6B, end-2025, +15.2% YoY). Confirmed alts investor incl. HF advisory partnership with Man Investments; no current overall % disclosed. Chairman: Jeong Kab-yoon (since Dec 2023); CIO name unconfirmed, last known Park Man-soo likely departed.')), 512)
WHERE id = 2159;

-- 2160 Public Officials Benefit Association (POBA), Seoul, South Korea
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: KRW26T (~$19.1B) vs a separately cited $16B, unreconciled. Historical (dated, pre-2025) breakdown: 4% HF, 7.5% PE, 26% real assets, 35% private credit -- total alts target 72.5% by 2025. CEO not found; CIO cited as Jang Dong-hun but successor search reportedly underway -- verify before outreach.')), 512)
WHERE id = 2160;

-- 1898 National Council for Social Security Fund (NSSF), Beijing, China
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM: ~$455B (dated "2026", methodology unclear). HF allocation not found; historically ~90% domestic securities (2023 data, dated), implying limited offshore alts. Leadership in flux -- Vice Chairman Wang Wenling removed Apr 2026 amid corruption investigation; no confirmed current Chairman name.')), 512)
WHERE id = 1898;

-- 2202 AFP Habitat, Santiago, Chile
UPDATE contacts SET
  name = 'Max Sichel Day',
  title = 'Gerente General',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM refined: ~$61.9B (Oct 2025), 26.8% of Chilean AFP system. Chile AFPs manage individual retirement accounts under a mandatory national system, not a single pool. HF allocation not found. Max Sichel Day, Gerente General since Jan 2 2026 (succeeded Alejandro Bezanilla Mena).')), 512)
WHERE id = 2202;

-- 2203 AFP Provida (MetLife), Santiago, Chile
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM not found in absolute terms; 20.5% of Chilean AFP system (Q1 2026). Chile AFPs manage individual retirement accounts under a mandatory national system, not a single pool. CEO name CONFLICTING (Santiago Donoso Hue vs Gregorio Ruiz-Esquide) -- unresolved, verify directly before outreach.')), 512)
WHERE id = 2203;
