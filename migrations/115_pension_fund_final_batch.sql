-- Pension Fund segment enrichment, final batch (19/118 records).
-- Completes the segment. CIO/investment-lead used as primary contact
-- where a distinct role exists (matching prior batches' convention);
-- CEO/President used where no separate investment chief was confirmed.
-- Several funds have active/imminent leadership transitions -- flagged
-- explicitly in data_flags rather than treated as settled.

-- 1900 Employees Provident Fund (EPF), Kuala Lumpur, Malaysia
UPDATE contacts SET
  name = 'Mohamad Hafiz Kassim',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | AUM RM1.409T (Dec 2025, +12.8% YoY). CIO promoted Dec 2025 (ex-CFO), succeeded Rohaya Mohammad Yusof. CEO: Ahmad Zulqarnain Onn (since Feb 2024).')), 512)
WHERE id = 1900;

-- 1908 New York State Teachers Retirement System (NYSTRS), Albany, NY
UPDATE contacts SET
  name = 'Thomas K. Lee',
  title = 'Executive Director and Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Combined ED/CIO role, held since 2006/07. AUM $151.8B (Jun 30 2025 FY-end); FY25 net return 10.6%. Alt/HF allocation % not disclosed in public sources checked.')), 512)
WHERE id = 1908;

-- 2040 ATP, Hillerod, Denmark
UPDATE contacts SET
  name = 'Mikkel Svenstrup',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CIO since Mar 2020. CEO: Martin Praestegaard (since 2022). Members'' net assets DKK 694B (end 2025); 19.5% portfolio return but net assets fell ~DKK24B on rising-rate liability growth.')), 512)
WHERE id = 2040;

-- 2041 Alecta, Stockholm, Sweden
UPDATE contacts SET
  name = 'Pablo Bernengo',
  title = 'Chief Investment Officer (until Sep 1 2026)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership transition: Bernengo becomes CEO Sep 1 2026 (succeeding retiring CEO Peder Hasslev); Magnus Tell becomes acting CIO same date. AUM SEK 1,405B (end 2025).')), 512)
WHERE id = 2041;

-- 2042 Varma, Helsinki, Finland
UPDATE contacts SET
  name = 'Markus Aho',
  title = 'Chief Investment Officer & Deputy CEO',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CIO since 2014. CEO: Risto Murto. AUM ~EUR68B (end 2025). Hedge funds ~17% of portfolio (EUR10.7B); broader alternatives ~20%.')), 512)
WHERE id = 2042;

-- 2043 Ilmarinen, Helsinki, Finland
UPDATE contacts SET
  name = 'Annika Ekman',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CIO since Sep 1 2025, succeeded Mikko Mursula (promoted to CEO, replacing Jouko Polonen who left for eQ Plc). AUM ~EUR63-64B (mid-2025, stale). Hedge funds 9.1% of assets (end 2025).')), 512)
WHERE id = 2043;

-- 2150 Taiwan Bureau of Labor Funds, Taipei, Taiwan
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Director-General name not confirmed (official site blocked automated access) -- verify via blf.gov.tw before outreach. Combined AUM NT$8.61T (May 2026); record gains 2 years running.')), 512)
WHERE id = 2150;

-- 2151 Brazil Previ, Rio de Janeiro, Brazil
UPDATE contacts SET
  name = 'Cláudio Gonçalves',
  title = 'Diretor de Investimentos (Director of Investments)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Term to May 2028. President: Márcio Chiumento (since Nov 2025). AUM ~R$300B (end 2025). Plano 1 had a ~R$14B deficit in 2024 under TCU audit, reversed to a 2025 surplus.')), 512)
WHERE id = 2151;

-- 2152 South Africa GEPF, Pretoria, South Africa
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | GEPF assets are actually managed by PIC (separate SOE), currently in active governance crisis: CEO suspended and CIO role acting-only as of Jul 2026 -- do not assign a named contact until resolved. GEPF fund AUM R2.69T (Mar 2025).')), 512)
WHERE id = 2152;

-- 2155 PFA Pension, Copenhagen, Denmark
UPDATE contacts SET
  name = 'Kasper A. Lorenzen',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO: Ole Krogh Petersen (since Dec 2022, not freshly reconfirmed for 2026). AUM DKK 764B (Jan 30 2026, up from DKK 678B in 2024).')), 512)
WHERE id = 2155;

-- 2157 Afore XXI Banorte, Mexico City, Mexico
UPDATE contacts SET
  name = 'David Razú Aznar',
  title = 'Director General',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | In role since Jan 2021. No distinct CIO name found. AUM ~MXN1.58T (end 2025), ~19.1% market share (2nd-largest Afore). No hedge-fund-specific allocation disclosed.')), 512)
WHERE id = 2157;

-- 2158 Switzerland Publica, Bern, Switzerland
UPDATE contacts SET
  name = 'Sandro Doudin',
  title = 'Head of Asset Management',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | In role since Jul 2025 (succeeded Stefan Beiner). Director role in transition: Emmanuel Vauclair named permanent Director, takes office May 2026, succeeding Doris Bianchi. AUM CHF44.9B (end 2025).')), 512)
WHERE id = 2158;

-- 2204 AFP Cuprum, Santiago, Chile
UPDATE contacts SET
  name = 'Andrés García',
  title = 'Gerente de Inversiones (Investment Manager)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | IMPORTANT: hedge funds are explicitly EXCLUDED from Cuprum''s permitted alternative-asset policy per regulatory filing -- not a hedge-fund-investor prospect under current policy. GM: Martín Mujica. Fund-level AUM not confirmed.')), 512)
WHERE id = 2204;

-- 2205 AFP Capital (SURA Chile), Santiago, Chile
UPDATE contacts SET
  name = 'Francisco Guzmán',
  title = 'Gerente de Inversiones (Investment Manager)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Succeeded Ricardo Mogrovejo (date unconfirmed). GM: Renzo Vercelli (since Aug 2024). 2025 net profit $140M, led 3 of 5 Chilean multifunds on returns. Fund-level AUM not confirmed.')), 512)
WHERE id = 2205;

-- 2206 Afore SURA, Mexico City, Mexico
UPDATE contacts SET
  name = 'Andrés Moreno',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CIO since 2018, active as of Apr 2026 press. Director General: Emilio Bertrán Rodríguez. AUM ~MXN1.08T (Dec 2024, stale -- no confirmed 2025/26 figure). 4th-largest Afore.')), 512)
WHERE id = 2206;

-- 2207 Profuturo, Mexico City, Mexico
UPDATE contacts SET
  name = 'Arturo García Rodríguez',
  title = 'Director General',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | In role ~11 years. CIO name unconfirmed (single low-confidence source, not used). Largest Afore by AUM as of 2025 (~MXN1.4-1.76T, sources conflict -- verify before use).')), 512)
WHERE id = 2207;

-- 2208 Porvenir, Bogota, Colombia
UPDATE contacts SET
  name = 'Alonso Ángel',
  title = 'Vicepresidente de Inversiones (CIO)',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Presidente: Miguel Largacha. AUM ~COP279T (Mar 2026, up from COP271T end-2025). Record COP27T in affiliate returns generated in 2025. Hedge fund allocation % not researched.')), 512)
WHERE id = 2208;

-- 2221 Hassana Investment Company, Riyadh, Saudi Arabia
UPDATE contacts SET
  name = 'Hani Al-Jehani',
  title = 'Chief Investment Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CIO since Jul 2025. CEO: Sabty Sulaiman Al-Sabty (since Dec 1 2025, after a major 2025 leadership shake-up incl. prior CEO/CRO/senior adviser departures). AUM ~$320B (SAR1.2T).')), 512)
WHERE id = 2221;

-- 2222 KWAP, Kuala Lumpur, Malaysia
UPDATE contacts SET
  name = 'Jay Khairil Jeremy Abdullah',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | CEO since May 20 2026 (succeeded Nik Amlizan Nik Mohamed, term ended Mar 2026). CIO name unverified, do not use without direct confirmation. AUM RM185.6B (end 2024, stale).')), 512)
WHERE id = 2222;
