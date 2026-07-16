-- Batch 9 of GTA "advisor team" enrichment (18 more contacts, same
-- methodology as migrations 009-016). Three notes worth keeping in mind:
--
--   1569 Asif Khan — a genuine address conflict: BMO's own directory tags
--     him under Oakville (matching the CRM), but the street text found
--     repeatedly ("50 Burnhamthorpe Road West, Mississauga") may belong to a
--     different branch. Team applied, address withheld pending manual
--     verification.
--   1378 Rosemary Horwood — her Richardson Wealth practice page now appears
--     folded into "MBP Sterling Partners," a rebrand/merger with genuine
--     uncertainty about her current team roster. Address applied (same
--     building as other Richardson Wealth Toronto contacts, unaffected by
--     the question), team withheld — same treatment as Bacchiochi in batch 5.
--   1781 Richard Dri — his group appears to have rebranded from "Rosenberg
--     Dri Financial Group" to "Rosenberg Financial Group" with Yulia
--     Rosenberg now the team lead; he's absent from the live team page but
--     LinkedIn/ZoomInfo still list him as active at Scotiabank with no
--     obituary found. Applied anyway per the Volpe/Horan precedent for
--     unconfirmed signals — worth a human glance.
--
-- 1249 Ian Garriock and 1263 Tyler Manning are two more CRM contacts on the
-- same Wellington-Altus team as 1264 Andrew Greene (batch 7, "Garriock
-- Manning McGuire & Greene"). Both individually confirmed as being "based in
-- Markham" at a satellite office of that team, matching their CRM city — a
-- different address from Andrew Greene's North York address, but the same
-- team roster. Each gets the shared team roster minus themselves.

-- 1560 Philip Burton, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '100 King Street West, 40th Floor' WHERE id = 1560;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1560, 'Meghan Gray', 'Investment Associate'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1560)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1560 AND name = 'Meghan Gray');

-- 1734 Edmond Chin, ScotiaMcLeod, Markham
UPDATE contacts SET address = '675 Cochrane Drive, Suite 101' WHERE id = 1734;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1734, x.name, x.role FROM (
  SELECT 'Ray Li' AS name, 'Wealth Advisor and Portfolio Manager' AS role
  UNION ALL SELECT 'Ling Liang', 'Investment Representative'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1734)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1734 AND name = x.name);

-- 1419 Erin Racioppa, NBF Wealth Management, Toronto
UPDATE contacts SET address = 'Exchange Tower, 130 King Street West, Suite 3200' WHERE id = 1419;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1419, x.name, x.role FROM (
  SELECT 'Elsie Chan' AS name, 'Senior Wealth Associate' AS role
  UNION ALL SELECT 'Vanessa Pandeirada', 'Wealth Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1419)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1419 AND name = x.name);

-- 1569 Asif Khan, BMO Nesbitt Burns — address NOT applied, see note at top of
-- file (genuine conflict between BMO's own Oakville directory tag and a
-- repeated Mississauga street address)
INSERT INTO contact_people (contact_id, name, role)
SELECT 1569, x.name, x.role FROM (
  SELECT 'Ahsan Khan' AS name, 'Wealth Advisor, CERTIFIED FINANCIAL PLANNER' AS role
  UNION ALL SELECT 'Arnel Ayala', 'Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1569)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1569 AND name = x.name);

-- 1402 Craig Machel, Richardson Wealth Ltd, Toronto
UPDATE contacts SET address = '145 King Street West, Suite 500' WHERE id = 1402;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1402, 'Mattais Salem', 'Client Service / Administrative Team Member'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1402)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1402 AND name = 'Mattais Salem');

-- 1249 Ian Garriock, Wellington-Altus, Markham — see note above
UPDATE contacts SET address = '675 Cochrane Drive, Suite 501, North Tower' WHERE id = 1249;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1249, x.name, x.role FROM (
  SELECT 'Andrew Greene' AS name, 'Founder, Executive Vice-President & Senior Investment Advisor' AS role
  UNION ALL SELECT 'Paul J. Greene', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Tyler Manning', 'Vice-President, Senior Investment Advisor'
  UNION ALL SELECT 'Murray McGuire', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Emily Wood', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Yashmeen Saroye', 'Investment Associate'
  UNION ALL SELECT 'Shilpa Shanbhag', 'Associate (Compliance)'
  UNION ALL SELECT 'Diana Schweissing', 'Licensed Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1249)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1249 AND name = x.name);

-- 1263 Tyler Manning, Wellington-Altus, Markham — same team as 1249/1264
UPDATE contacts SET address = '675 Cochrane Drive, Suite 501, North Tower' WHERE id = 1263;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1263, x.name, x.role FROM (
  SELECT 'Andrew Greene' AS name, 'Founder, Executive Vice-President & Senior Investment Advisor' AS role
  UNION ALL SELECT 'Paul J. Greene', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Ian Garriock', 'Vice-President, Senior Investment Advisor'
  UNION ALL SELECT 'Murray McGuire', 'Senior Wealth Advisor'
  UNION ALL SELECT 'Emily Wood', 'Associate Wealth Advisor'
  UNION ALL SELECT 'Yashmeen Saroye', 'Investment Associate'
  UNION ALL SELECT 'Shilpa Shanbhag', 'Associate (Compliance)'
  UNION ALL SELECT 'Diana Schweissing', 'Licensed Associate'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1263)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1263 AND name = x.name);

-- 1781 Richard Dri, ScotiaMcLeod, Toronto — see note above on the apparent
-- rebrand/uncertain current standing
UPDATE contacts SET address = '95 St. Clair Avenue West, Suite 1400' WHERE id = 1781;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1781, x.name, x.role FROM (
  SELECT 'Yulia Rosenberg' AS name, 'Portfolio Manager, Team Lead' AS role
  UNION ALL SELECT 'Alexandre Rochtchine', 'Senior Total Wealth Planner (shared firm resource)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1781)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1781 AND name = x.name);

-- 1378 Rosemary Horwood, Richardson Wealth Ltd, Toronto — team NOT applied,
-- see note at top of file (apparent fold-in to MBP Sterling Partners)
UPDATE contacts SET address = '100 Queens Quay East, Suite 2500' WHERE id = 1378;

-- 1821 Brian Burlacoff, Sun Life, Toronto
UPDATE contacts SET address = '1 York Street, 27th Floor' WHERE id = 1821;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1821, x.name, x.role FROM (
  SELECT 'Lisa Burlacoff' AS name, 'Financial Planner & Partner' AS role
  UNION ALL SELECT 'Lisa Ann Houston', 'Financial Planner & Partner'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1821)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1821 AND name = x.name);

-- 1752 Christopher Le Roy, ScotiaMcLeod, Toronto
UPDATE contacts SET address = '95 St. Clair Avenue West, Suite 1400' WHERE id = 1752;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1752, x.name, x.role FROM (
  SELECT 'Danielle Soo' AS name, 'Investment Associate, Associate Portfolio Manager' AS role
  UNION ALL SELECT 'Jeffrey Yan', 'Private Banker, Director and Team Lead'
  UNION ALL SELECT 'Chris Brown', 'Private Banker'
  UNION ALL SELECT 'Annalisa Mohammed', 'Private Banker (shared firm resource)'
  UNION ALL SELECT 'Holly LeValliant', 'Estate and Trust Consultant'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1752)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1752 AND name = x.name);

-- 1665 Jason Pereira, IPC Securities (Woodgate Financial), Toronto
UPDATE contacts SET address = '411 Richmond Street East, Suite 202' WHERE id = 1665;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1665, x.name, x.role FROM (
  SELECT 'James Collins' AS name, 'Partner and Senior Financial Consultant' AS role
  UNION ALL SELECT 'Dustin Dinis', 'Financial Associate & Planner'
  UNION ALL SELECT 'Christina Richardson', 'Client Relationship Manager'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1665)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1665 AND name = x.name);

-- 1507 Jeffrey Kaminker, Frontwater Capital, Toronto
UPDATE contacts SET address = '1920 Yonge Street, Suite 200' WHERE id = 1507;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1507, 'Dan Richmond', 'Associate Portfolio Manager'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1507)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1507 AND name = 'Dan Richmond');

-- 1703 Ron Haik, Nicola Wealth, Toronto (address only; same building as
-- batch7's 1720 Jessica Arakgi, suite number conflicts across sources so
-- only the building address is used, and no team member met the accuracy bar)
UPDATE contacts SET address = '175 Bloor Street East, North Tower' WHERE id = 1703;

-- 1706 John Salisbury, Raymond James, Burlington
UPDATE contacts SET address = '5500 North Service Road, Suite 805' WHERE id = 1706;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1706, x.name, x.role FROM (
  SELECT 'Michael Salisbury' AS name, 'Senior Financial Planner Portfolio Manager' AS role
  UNION ALL SELECT 'Karen Salisbury', 'Business Development and Operations Lead'
  UNION ALL SELECT 'Nabil Mukadam', 'Trading and Research Specialist'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1706)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1706 AND name = x.name);

-- 1749 Natalie Jamison, ScotiaMcLeod, Oakville
UPDATE contacts SET address = '1235 North Service Road West, Suite 200' WHERE id = 1749;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1749, x.name, x.role FROM (
  SELECT 'Kevin Yun' AS name, 'Administrative Associate' AS role
  UNION ALL SELECT 'Sara Badial', 'Administration Support Assistant'
  UNION ALL SELECT 'Sally Lee', 'Estate & Trust Consultant (Scotiatrust)'
) x
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1749)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1749 AND name = x.name);

-- 1553 Jeff Somer, BMO Nesbitt Burns, Toronto
UPDATE contacts SET address = '1 First Canadian Place, 40th Floor' WHERE id = 1553;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1553, 'Lou D''Aversa', 'Investment Advisor / CERTIFIED FINANCIAL PLANNER'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1553)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1553 AND name = 'Lou D''Aversa');

-- 1566 Keith Thomson, CI Private Wealth, Toronto
UPDATE contacts SET address = '15 York Street, 2nd Floor' WHERE id = 1566;
INSERT INTO contact_people (contact_id, name, role)
SELECT 1566, 'Serena Hak', 'Executive Director & Partner, The Donor Motivation Program'
WHERE EXISTS (SELECT 1 FROM contacts WHERE id = 1566)
  AND NOT EXISTS (SELECT 1 FROM contact_people WHERE contact_id = 1566 AND name = 'Serena Hak');
