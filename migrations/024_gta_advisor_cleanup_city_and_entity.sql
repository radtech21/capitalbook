-- Cleanup pass (part 3 of N): resolves the 4 city-mismatch contacts that
-- migrations 009/011/015 deliberately left without a street address
-- (correct real-world office, but in a different city than the CRM's
-- on-file city — writing the address without fixing the city first would
-- have looked more precise than it was). Also corrects one entity-name
-- mismatch flagged in migration 019.
--
--   1221 Giac Gelmo: CRM city Mississauga -> Oakville. Address was already
--     known (migration 009) but withheld pending this city fix.
--   1201 Marc Nadeau: CRM city Toronto -> Whitby. Address newly researched;
--     adds one more confirmed team member (Mary Dignoti) alongside the
--     Beaulieu/Fischer team already applied in migration 011.
--   1219 Drew Abbott: CRM city Toronto -> Oakville. Address newly
--     researched — turns out to be the IDENTICAL street address/suite as
--     1221 Giac Gelmo (2020 Winston Park Drive, Suite 301), both TD Wealth
--     Private Investment Advice — consistent with the recurring shared-
--     building/independent-teams pattern seen throughout this project.
--   1536 Jonathan Lin: CRM city Toronto -> Oakville. Address newly
--     researched — same BMO Nesbitt Burns floor (360 Oakville Place Drive,
--     2nd Floor) as 1509/1512/1519/1517 from earlier batches. No team
--     member met the accuracy bar.
--
--   1659 John Klotz: firm corrected from "IPC Securities" (IIROC dealer)
--     to "IPC Investment Corp" (mutual fund dealer) — his own LinkedIn
--     title, independent business directories, and Northwood Financial's
--     own site all consistently tie him to IPC Investment Corp, and no
--     source ties him to IPC Securities.

UPDATE contacts SET city = 'Oakville', address = '2020 Winston Park Drive, Suite 301' WHERE id = 1221;

UPDATE contacts SET city = 'Whitby', address = '3000 Garden St, Suite 214' WHERE id = 1201;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1201, 'Mary Dignoti', 'Business Administrator'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1201)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1201 AND name = 'Mary Dignoti');

UPDATE contacts SET city = 'Oakville', address = '2020 Winston Park Drive, Suite 301' WHERE id = 1219;

UPDATE contacts SET city = 'Oakville', address = '360 Oakville Place Drive, 2nd Floor' WHERE id = 1536;

UPDATE contacts SET firm = 'IPC Investment Corp' WHERE id = 1659 AND firm = 'IPC Securities';
