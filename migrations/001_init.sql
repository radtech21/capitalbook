-- Capital Book CRM schema (MySQL / MariaDB, InnoDB, utf8mb4)
-- Idempotent: safe to run repeatedly.

CREATE TABLE IF NOT EXISTS users (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  email         VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  name          VARCHAR(255) NOT NULL DEFAULT '',
  role          VARCHAR(16)  NOT NULL DEFAULT 'viewer',
  created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- contacts.id is assigned by the application (it mirrors the source data set),
-- so this column is a plain primary key, not AUTO_INCREMENT.
CREATE TABLE IF NOT EXISTS contacts (
  id            INT NOT NULL PRIMARY KEY,
  name          VARCHAR(255) NOT NULL DEFAULT '',
  title         VARCHAR(255) NOT NULL DEFAULT '',
  firm          VARCHAR(255) NOT NULL DEFAULT '',
  segment       VARCHAR(80)  NOT NULL DEFAULT '',
  priority      VARCHAR(8)   NOT NULL DEFAULT '',
  lead_score    INT          NOT NULL DEFAULT 0,
  email         VARCHAR(255) NOT NULL DEFAULT '',
  email_status  VARCHAR(40)  NOT NULL DEFAULT '',
  phone         VARCHAR(64)  NOT NULL DEFAULT '',
  city          VARCHAR(120) NOT NULL DEFAULT '',
  state         VARCHAR(120) NOT NULL DEFAULT '',
  country       VARCHAR(120) NOT NULL DEFAULT '',
  sub_region    VARCHAR(120) NOT NULL DEFAULT '',
  aum_mm        DOUBLE       NULL,
  aum_tier      VARCHAR(40)  NOT NULL DEFAULT 'Unknown',
  net_worth_mm  DOUBLE       NULL,
  firm_type     VARCHAR(120) NOT NULL DEFAULT '',
  state_rank    INT          NULL,
  rank_movement VARCHAR(40)  NOT NULL DEFAULT '',
  uhnw          TINYINT      NOT NULL DEFAULT 0,
  institutional TINYINT      NOT NULL DEFAULT 0,
  foundation    TINYINT      NOT NULL DEFAULT 0,
  client_types  TEXT         NULL,
  reachable     TINYINT      NOT NULL DEFAULT 0,
  source_list   VARCHAR(255) NOT NULL DEFAULT '',
  data_flags    VARCHAR(512) NOT NULL DEFAULT '',
  owner_id      INT          NULL,
  INDEX idx_contacts_segment  (segment),
  INDEX idx_contacts_country  (country),
  INDEX idx_contacts_priority (priority),
  INDEX idx_contacts_tier     (aum_tier),
  INDEX idx_contacts_name     (name),
  INDEX idx_contacts_owner    (owner_id),
  CONSTRAINT fk_contacts_owner FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- pipeline is per-user, so every user keeps their own outreach state across devices
CREATE TABLE IF NOT EXISTS pipeline (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  contact_id INT NOT NULL,
  user_id    INT NOT NULL,
  status     VARCHAR(40) NOT NULL DEFAULT 'New',
  due        VARCHAR(10) NULL,
  opp        DOUBLE      NULL,
  poc        VARCHAR(255) NOT NULL DEFAULT '',
  note       TEXT        NULL,
  updated_at DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_pipeline_contact_user (contact_id, user_id),
  INDEX idx_pipeline_user (user_id),
  INDEX idx_pipeline_contact (contact_id),
  CONSTRAINT fk_pipeline_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
  CONSTRAINT fk_pipeline_user    FOREIGN KEY (user_id)    REFERENCES users(id)    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- activity timeline per contact (team-visible: any user reads, editors write)
CREATE TABLE IF NOT EXISTS activities (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  contact_id INT NOT NULL,
  user_id    INT NULL,
  user_email VARCHAR(255) NOT NULL DEFAULT '',
  type       VARCHAR(16)  NOT NULL DEFAULT 'note',
  body       TEXT         NULL,
  created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_activities_contact (contact_id),
  INDEX idx_activities_created (created_at),
  CONSTRAINT fk_activities_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- follow-up tasks (per-user workflow)
CREATE TABLE IF NOT EXISTS tasks (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  contact_id   INT NULL,
  user_id      INT NOT NULL,
  title        VARCHAR(300) NOT NULL,
  due          VARCHAR(10)  NULL,
  done         TINYINT      NOT NULL DEFAULT 0,
  created_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  completed_at DATETIME     NULL,
  INDEX idx_tasks_user (user_id),
  INDEX idx_tasks_due (due),
  CONSTRAINT fk_tasks_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
  CONSTRAINT fk_tasks_user    FOREIGN KEY (user_id)    REFERENCES users(id)    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- flexible labels on contacts (many-to-many)
CREATE TABLE IF NOT EXISTS tags (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(60) NOT NULL UNIQUE,
  color      VARCHAR(9)  NOT NULL DEFAULT '#6B7787',
  created_at DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS contact_tags (
  contact_id INT NOT NULL,
  tag_id     INT NOT NULL,
  PRIMARY KEY (contact_id, tag_id),
  INDEX idx_contact_tags_tag (tag_id),
  CONSTRAINT fk_ct_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
  CONSTRAINT fk_ct_tag     FOREIGN KEY (tag_id)     REFERENCES tags(id)     ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- saved filter combinations (own or shared with the team)
CREATE TABLE IF NOT EXISTS saved_views (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT NOT NULL,
  name       VARCHAR(120)  NOT NULL,
  query      VARCHAR(2000) NOT NULL DEFAULT '',
  shared     TINYINT       NOT NULL DEFAULT 0,
  created_at DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_views_user (user_id),
  CONSTRAINT fk_views_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- outreach email templates with {{field}} mail-merge placeholders
CREATE TABLE IF NOT EXISTS templates (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(160) NOT NULL,
  subject    VARCHAR(300) NOT NULL DEFAULT '',
  body       TEXT         NULL,
  created_by INT          NULL,
  created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_templates_user FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS audit_log (
  id         BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT NULL,
  user_email VARCHAR(255) NOT NULL DEFAULT '',
  action     VARCHAR(64)  NOT NULL,
  entity     VARCHAR(64)  NOT NULL DEFAULT '',
  entity_id  VARCHAR(64)  NOT NULL DEFAULT '',
  detail     TEXT         NULL,
  created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_audit_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
