-- Cleanup pass (part 5, final): closes out the last three items from the
-- "high value" follow-up list.
--
--   1521 Will Simpson (Aretec Wealth Inc.) — the address conflict between
--     two sources sharing an internally-inconsistent street/postal-code
--     pairing is resolved: 10 King St E's real postal code is M5C 1C3, not
--     M4W 2L8 as the LEI/OSC records paired it with, while 1128 Yonge St's
--     real postal code IS M4W 2L8 — so the OSC/LEI "10 King St E" entry is
--     almost certainly a stale street name against an updated postal code.
--     Applying 1128 Yonge St with moderate confidence.
--   1398 Fred Banwell, 1456 Jaime Carrasco — a second, deeper research pass
--     (CIRO/NRS, corporate registries, Wayback Machine, business
--     directories) still could not resolve either address. Every primary
--     source is blocked (403) or, for Banwell, narrows to one of two
--     plausible Wellington-Altus Toronto branches with no way to pick
--     between them. Left withheld, as before — this is a case where
--     further automated research isn't likely to help; confirming would
--     need a direct call/email to the firm.
--   1760 Allan McGlade (deceased, ALS, April 2023) — per your decision,
--     archived in place (already unreachable + flagged in migration 022,
--     no further change here) and his successor, Andrew McGoey ("The
--     McGoey Financial Group," same ScotiaMcLeod office, now on the 49th
--     floor of Scotia Plaza), added as a new contact with his own team.
--     Phone number could not be confirmed (conflicting sources) and is
--     left blank rather than guessed. AUM is left NULL rather than
--     assuming he inherited McGlade's exact book value.

UPDATE contacts SET address = '1128 Yonge St, Fl 3' WHERE id = 1521;

INSERT INTO contacts (
  id, name, title, firm, segment, priority, lead_score, email, email_status,
  phone, city, state, country, sub_region, aum_mm, aum_tier, net_worth_mm,
  firm_type, state_rank, rank_movement, uhnw, institutional, foundation,
  client_types, reachable, source_list, data_flags, address
)
SELECT 2453, 'Andrew McGoey', 'Advisor', 'ScotiaMcLeod', 'Financial Advisor', 'C', 0,
  'andrew.mcgoey@scotiawealth.com', 'Provided', '', 'Toronto', 'ON', 'Canada',
  'TORONTO', NULL, 'Unknown', NULL, '', NULL, '', 0, 0, 0, '', 1,
  'Global Pension & Institutional',
  'Added manually as successor to deceased contact 1760 Allan McGlade (ScotiaMcLeod, died April 2023, ALS) — inherited his book/practice at the same ScotiaMcLeod office, now Scotia Plaza 49th Floor. Phone number unconfirmed (conflicting sources); AUM left unknown rather than assumed.',
  '40 King Street West, 49th Floor'
WHERE NOT EXISTS (SELECT 1 FROM contacts WHERE id = 2453);

INSERT INTO contact_people (contact_id, name, role)
SELECT 2453, x.name, x.role FROM (
  SELECT 'David Hillier' AS name, 'Senior Wealth Advisor, Portfolio Manager' AS role
  UNION ALL SELECT 'Tyler Kochuta', 'Senior Financial Planning Associate'
  UNION ALL SELECT 'Suzanne Reid-Skidmore', 'Senior Associate'
  UNION ALL SELECT 'Andres Carreno', 'Investment Associate'
  UNION ALL SELECT 'Christopher Kelly', 'Investment Associate'
  UNION ALL SELECT 'Cameron McGlade', 'Investment Associate (CFP)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 2453)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 2453 AND name = x.name);
