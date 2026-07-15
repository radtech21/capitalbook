-- Force a password change at next sign-in. Set automatically when an account is
-- created by an admin or has its password set by an admin or the break-glass
-- CLI (those are handed-over temporary passwords); cleared the moment the user
-- sets their own.
ALTER TABLE users ADD COLUMN must_change_password TINYINT(1) NOT NULL DEFAULT 0;
