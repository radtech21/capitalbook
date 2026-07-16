-- Street address for the contact's branch/office, so branches in the same city
-- (e.g. downtown Toronto vs. a GTA suburb) can be told apart beyond just city/state.
ALTER TABLE contacts ADD COLUMN address VARCHAR(255) NOT NULL DEFAULT '' AFTER city;
