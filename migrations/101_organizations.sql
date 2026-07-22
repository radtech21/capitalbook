-- Multi-organization support. Capital Book's own team is the "platform" org
-- (is_platform = 1) and keeps seeing everything across all orgs, exactly as
-- before. Client orgs (e.g. a VC firm given access to a specific contact
-- segment) only see contacts explicitly assigned to their org_id, and get
-- their own isolated pipeline/tasks/activity/templates/audit trail on the
-- contacts they can see.
--
-- pipeline, activities, tasks, tags, contact_tags, and saved_views do NOT get
-- their own org_id column: they're already scoped by user_id or reachable
-- only by joining through contacts/users, so isolation for them is enforced
-- in application code by checking the related contact's/user's org_id.

CREATE TABLE IF NOT EXISTS organizations (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(160) NOT NULL,
  is_platform TINYINT      NOT NULL DEFAULT 0,
  created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO organizations (id, name, is_platform) VALUES (1, 'Capital Book', 1);

-- Existing rows all backfill to org_id = 1 via DEFAULT 1, so current behavior
-- is unchanged for every existing user, contact, template, and audit entry.
ALTER TABLE users ADD COLUMN org_id INT NOT NULL DEFAULT 1 AFTER role;
ALTER TABLE users ADD CONSTRAINT fk_users_org FOREIGN KEY (org_id) REFERENCES organizations(id);
ALTER TABLE users ADD INDEX idx_users_org (org_id);

ALTER TABLE contacts ADD COLUMN org_id INT NOT NULL DEFAULT 1 AFTER id;
ALTER TABLE contacts ADD CONSTRAINT fk_contacts_org FOREIGN KEY (org_id) REFERENCES organizations(id);
ALTER TABLE contacts ADD INDEX idx_contacts_org (org_id);

ALTER TABLE templates ADD COLUMN org_id INT NOT NULL DEFAULT 1 AFTER created_by;
ALTER TABLE templates ADD CONSTRAINT fk_templates_org FOREIGN KEY (org_id) REFERENCES organizations(id);
ALTER TABLE templates ADD INDEX idx_templates_org (org_id);

ALTER TABLE audit_log ADD COLUMN org_id INT NOT NULL DEFAULT 1 AFTER user_email;
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_org FOREIGN KEY (org_id) REFERENCES organizations(id);
ALTER TABLE audit_log ADD INDEX idx_audit_org (org_id);
