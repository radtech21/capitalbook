-- Sovereign Wealth Fund segment enrichment, batch 1 of 2 (21 of 25 records).
-- These are firm-level bare seed records (name/firm/city/AUM only, no
-- address, no current leadership, no HF-allocation detail). This batch adds
-- current leadership (updating name/title where the on-file person has
-- departed), a data_flags summary of AUM/HF-allocation as of mid-2026
-- research, and secondary leadership as contact_people where a distinct
-- CIO/deputy exists. WebFetch to fund sites is blocked in this environment;
-- all findings are sourced from WebSearch results, dated July 2026.
--
-- Stale on-file leadership corrected: 1236 CIC (Peng Chun -> Zhang Qingsong,
-- CIC's chairman changed Nov/Dec 2024); 1243 KIA (Mohammed Al Hashel ->
-- Sheikh Saoud Salem Al-Sabah, appointed late 2024/2025); 1247 QIA (Mansoor
-- bin Ebrahim Al-Mahmoud -> Mohammed Saif Al-Sowaidi); 1887 KIC Korea (Hoon
-- Lee -> Il Young Park, CEO; KIC's CIO seat was in open recruitment as of
-- May 2026, no successor confirmed).
--
-- Norway's GPFG (1210) is included for completeness but does NOT invest in
-- hedge funds by mandate -- flagged explicitly rather than left ambiguous.

-- 1210 Norges Bank Investment Management (GPFG), Oslo, Norway
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | NOK 21,268B (~$2.05T, May 2026 est.) -- world''s largest single fund. Does NOT invest in hedge funds by mandate (Ministry of Finance rejected PE/HF expansion); runs external long/short equity manager programs within the listed-equity mandate, not classed as a hedge-fund allocation. Nicolai Tangen, CEO since Sept 2020, reappointed to 2nd term Sept 2025.')), 512)
WHERE id = 1210;

-- 1212 Abu Dhabi Investment Authority (ADIA), Abu Dhabi, UAE
UPDATE contacts SET
  title = 'Managing Director',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$1.1T (Jul 2025 est., ADIA does not publish AUM). Confirmed hedge fund investor: "Financial Alternatives" asset class (hedge funds + managed futures), 5-10% strategy range; total alternatives ~32% of portfolio. MD: H.H. Sheikh Hamed bin Zayed Al Nahyan; Board Chairman: H.H. Sheikh Tahnoon bin Zayed Al Nahyan.')), 512)
WHERE id = 1212;

-- 1236 China Investment Corporation (CIC), Beijing, China -- leadership stale, updating
UPDATE contacts SET
  name = 'Zhang Qingsong',
  title = 'Chairman & CEO',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Zhang Qingsong became Chairman & CEO Nov/Dec 2024, succeeding Peng Chun (on file, now stale). US$1.57T total assets / US$1.37T net (Dec 31 2024, CIC''s own annual report -- secondary sources cite conflicting $1.33T/$1.24T figures, use official). Confirmed hedge fund investor via "Absolute Return" bucket within overseas portfolio; HF-only % not separately disclosed (blended with PE/RE/infra at 35-48% of foreign portfolio).')), 512)
WHERE id = 1236;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1236, x.name, x.role FROM (
  SELECT 'Liu Haoling' AS name, 'President & Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1236)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1236 AND name = x.name);

-- 1243 Kuwait Investment Authority (KIA), Kuwait City, Kuwait -- leadership stale, updating
UPDATE contacts SET
  name = 'Sheikh Saoud Salem Al-Sabah',
  title = 'Managing Director',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Sheikh Saoud Salem Al-Sabah appointed Managing Director late 2024/2025, succeeding Ghanem Al-Ghenaiman (on file as Mohammed Al Hashel, now stale -- verify current incumbent, KIA is notoriously low-profile). ~$1.07T (5th-largest SWF globally, 2025-26 est.; KIA does not publish AUM). No public HF % breakdown found; manages Future Generations Fund (FGF) via external managers across equities/bonds/PE/RE/infra.')), 512)
WHERE id = 1243;

-- 1247 Qatar Investment Authority (QIA), Doha, Qatar -- leadership stale, updating
UPDATE contacts SET
  name = 'Mohammed Saif Al-Sowaidi',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Mohammed Saif Al-Sowaidi is current CEO (on file as Mansoor bin Ebrahim Al-Mahmoud, now stale). ~$524-600B (2025-26 est., QIA does not publish AUM). Likely hedge fund investor: own strategy language cites using externally managed funds "to create exposure to non-core asset classes such as hedge funds and venture capital," no specific % disclosed.')), 512)
WHERE id = 1247;

-- 1295 Public Investment Fund (PIF), Riyadh, Saudi Arabia
UPDATE contacts SET
  title = 'Governor',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$913-925B, approaching $1T per Governor''s 2026 public comments. Likely hedge fund investor: strategy names "alternative investments, hedge funds, and direct investments" as part of global diversification, no specific % disclosed. Yasir Al-Rumayyan, Governor since 2015 -- current, on file name confirmed.')), 512)
WHERE id = 1295;

-- 1493 GIC Private Limited, Singapore
UPDATE contacts SET
  title = 'Group Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | US$936B (FY2024/25, GIC''s own annual report). Confirmed hedge fund investor via small explicit "Absolute Return Strategies (hedge funds)" sub-strategy; Global SWF (third-party) estimates ~1.5% of assets. Reportedly overhauling/widening HF manager engagement (Feb 2026 press). Lim Chow Kiat, Group CEO -- current, on file name confirmed.')), 512)
WHERE id = 1493;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1493, x.name, x.role FROM (
  SELECT 'Bryan Yeo' AS name, 'Group Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1493)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1493 AND name = x.name);

-- 1575 Temasek Holdings, Singapore
UPDATE contacts SET
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | S$518B Net Portfolio Value (~US$401B) as of 3/31/2026, Temasek''s own Review 2026. Confirmed and expanding hedge fund investor: ~10 direct HF relationships (incl. Citadel); new "Temasek Partnership Solutions" unit (Apr 2026) created to widen HF manager engagement as part of a broader restructuring. Dilhan Pillay Sandrasegara, CEO -- current, on file name confirmed (Co-CEO Chia Song Hwee added Oct 2025).')), 512)
WHERE id = 1575;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1575, x.name, x.role FROM (
  SELECT 'Rohit Sipahimalani' AS name, 'Chief Investment Officer' AS role
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1575)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1575 AND name = x.name);

-- 1884 Mubadala Investment Company, Abu Dhabi, UAE
UPDATE contacts SET
  title = 'Managing Director & Group Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$330-385B (FY2024/2025-26, figures vary by source/date). Confirmed hedge fund investor: official portfolio breakdown (12/31/2025) shows 16% "Alternatives" bucket alongside 42% PE, 20% public equity, 17% RE/infra, 5% credit. Khaldoon Khalifa Al Mubarak, MD & Group CEO since 2002 -- current, on file name confirmed.')), 512)
WHERE id = 1884;

-- 1885 Investment Corporation of Dubai (ICD), Dubai, UAE
UPDATE contacts SET
  name = 'Sheikh Hamdan bin Mohammed bin Rashid Al Maktoum',
  title = 'Chairman',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$300-380B. Holding company (Emirates, ENOC, Borse Dubai, Duty Free), not a HF allocator. Chairman: Sheikh Hamdan bin Mohammed bin Rashid Al Maktoum; no distinct CEO found. Lower priority for HF outreach.')), 512)
WHERE id = 1885;

-- 1886 ADQ, Abu Dhabi, UAE
UPDATE contacts SET
  name = 'ADQ',
  title = 'Sovereign Wealth Fund',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$225-263B. Holding company (healthcare, utilities, transport), not a HF allocator. CEO changed Jan 2026 (Alsuwaidi departed for Lunate); successor unconfirmed. Lower priority for HF outreach.')), 512)
WHERE id = 1886;

-- 1887 Korea Investment Corporation (KIC), Seoul, South Korea -- leadership stale, updating
UPDATE contacts SET
  name = 'Il Young Park',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | Leadership updated: Il Young Park is current CEO (was Hoon Lee). CIO seat in open recruitment as of May 2026, no successor confirmed -- verify before CIO-level outreach. $232.0B (Dec 2025). Confirmed HF investor: ~21.9% alts, dedicated HF program since 2010.')), 512)
WHERE id = 1887;

-- 1888 Future Fund Management Agency, Melbourne, Australia
UPDATE contacts SET
  name = 'Raphael Arndt',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~AUD 335-337B (~US$235-244B). Confirmed HF investor: explicit "Alternatives" ~15% of portfolio. Raphael Arndt, CEO since Jul 2020 -- independently reconfirmed current (2026 Milken Institute speaker bio).')), 512)
WHERE id = 1888;

-- 1889 Turkiye Wealth Fund (TVF), Istanbul, Turkey
UPDATE contacts SET
  name = 'Arda Ermut',
  title = 'Chief Executive Officer / General Manager',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$318-360B (2024 estimates, no 2026 figure found, dated). NOT a diversified hedge-fund allocator -- primarily a holding vehicle for transferred state-owned enterprises (state banks, Turkish Airlines, Borsa Istanbul, mining/energy assets). Chairman: President Recep Tayyip Erdogan; CEO: Arda Ermut, active as of Feb 2026. Lower priority for hedge-fund-focused outreach.')), 512)
WHERE id = 1889;

-- 1890 Emirates Investment Authority (EIA), Abu Dhabi, UAE
UPDATE contacts SET
  name = 'Mohamed Hamad Al Mehairi',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$90B (Nov 2023 figure, likely stale -- EIA is one of the most opaque Gulf funds, no more recent figure found). Highly secretive; no HF allocation disclosure found. CEO: Mohamed Hamad Al Mehairi (since Nov 2023); Chairman: Mansour bin Zayed Al Nahyan.')), 512)
WHERE id = 1890;

-- 1891 HKMA Exchange Fund (Investment Portfolio), Hong Kong
UPDATE contacts SET
  name = 'Eddie Yue',
  title = 'Chief Executive, Hong Kong Monetary Authority',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | HK$4,151.4B (~$530B) total Exchange Fund, end-2025 (HKMA official). Modest confirmed hedge fund exposure: ~32 local hedge funds plus broader alternatives within the Long-Term Growth Portfolio (~HK$517B); no HF-specific % disclosed. Eddie Yue, Chief Executive of HKMA, reappointed to 2029 -- note: no distinct "CIO" title found for the Investment Portfolio specifically.')), 512)
WHERE id = 1891;

-- 1892 Oman Investment Authority (OIA), Muscat, Oman
UPDATE contacts SET
  name = 'Abdulsalam Al Murshidi',
  title = 'President',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$59.7B (2025). No explicit hedge fund category disclosed; portfolio ~66% domestic Oman-focused, 19% North America, 9% Europe, 4% Asia-Pacific. President: Abdulsalam Al Murshidi.')), 512)
WHERE id = 1892;

-- 2196 Alaska Permanent Fund Corporation (APFC), Juneau, AK
UPDATE contacts SET
  name = 'Deven Mitchell',
  title = 'Executive Director & Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$81.1B (FY2025 official; ~$84B per more recent 2026 press, use $81.1B as the defensible sourced figure). Confirmed hedge fund investor: dedicated "Absolute Return" portfolio, 7% target allocation. Deven Mitchell, Executive Director and CEO since Oct 2022 -- current, on file name confirmed.')), 512)
WHERE id = 2196;

-- 2198 State Oil Fund of Azerbaijan (SOFAZ), Baku, Azerbaijan
UPDATE contacts SET
  name = 'Israfil Mammadov',
  title = 'Executive Director',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | $70.2B (9/30/2025, +16.9% YTD). No distinct hedge fund bucket -- real estate ~6% (~$3.7B) via managers like GIP/EQT/Brookfield is closest to "alternatives," real-assets/infra-oriented not HF. Israfil Mammadov, Executive Director since Nov 2019 -- current, on file name confirmed.')), 512)
WHERE id = 2198;

-- 2199 National Fund of Kazakhstan (NBK), Astana, Kazakhstan
UPDATE contacts SET
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$78.6B (1/1/2026), 26.3% of GDP. Confirmed HF investor via subsidiary National Investment Corporation (NIC, nicnbk.kz) -- the real outreach target, not the National Fund itself. Managed in trust by NBK, Governor Timur Suleimenov; NIC''s CEO unconfirmed.')), 512)
WHERE id = 2199;

-- 2200 Mumtalakat (Bahrain)
UPDATE contacts SET
  name = 'Shaikh Abdulla bin Khalifa Al Khalifa',
  title = 'Chief Executive Officer',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$17.6-18B (Dec 2024). NOT a diversified hedge-fund allocator -- development/holding company (Alba, Gulf Air, Batelco), not a liquid-alts allocator. CEO: Shaikh Abdulla bin Khalifa Al Khalifa -- possible recent CEO change flagged in research, unresolved, verify before outreach. Lower priority for hedge-fund-focused outreach.')), 512)
WHERE id = 2200;

-- 2201 Ireland Strategic Investment Fund (ISIF), Dublin, Ireland
UPDATE contacts SET
  name = 'Rebekah Brady',
  title = 'Interim Director',
  data_flags = LEFT(TRIM(CONCAT(data_flags, ' | ~$28B (est., not fully reconciled). No distinct HF bucket -- mandate is commercial direct/co-investment for Irish economic activity. Rebekah Brady, Interim Director since Dec 2025 (permanent search pending) -- leadership in flux, re-verify.')), 512)
WHERE id = 2201;
