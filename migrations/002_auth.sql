-- Password reset support. Tokens are stored as a SHA-256 hash, never in the
-- clear, are single use, and expire. Nothing else about auth changes.
ALTER TABLE users ADD COLUMN reset_token_hash VARCHAR(64) NULL;
ALTER TABLE users ADD COLUMN reset_expires_at DATETIME NULL;
CREATE INDEX idx_users_reset ON users (reset_token_hash);
