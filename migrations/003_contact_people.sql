-- Additional named people attached to a contact: the assistant, the associate
-- advisor, the branch manager, anyone else at that desk you actually email.
-- The main contact record keeps its single primary email; these sit alongside it.
CREATE TABLE IF NOT EXISTS contact_people (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  contact_id INT          NOT NULL,
  name       VARCHAR(255) NOT NULL,
  role       VARCHAR(120) NOT NULL DEFAULT '',
  email      VARCHAR(255) NOT NULL DEFAULT '',
  phone      VARCHAR(60)  NOT NULL DEFAULT '',
  created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_cp_contact (contact_id),
  INDEX idx_cp_email (email),
  CONSTRAINT fk_cp_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
