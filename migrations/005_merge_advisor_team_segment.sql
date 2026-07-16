-- "Advisor Team" and "Financial Advisor" are the same segment in practice;
-- fold the former into the latter so it stops appearing as a separate option.
UPDATE contacts SET segment = 'Financial Advisor' WHERE segment = 'Advisor Team';
