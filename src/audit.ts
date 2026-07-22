import { run } from './db.js';
import type { JwtPayload } from './types.js';

// A handful of unauthenticated flows (password reset request/confirm) audit
// against a user record fetched directly from the DB rather than a verified
// JWT, so they only need to supply the fields writeAudit actually reads.
type Auditable = Pick<JwtPayload, 'uid' | 'email' | 'orgId'>;

// Append-only audit trail. Auditing must never break a request, so all errors are
// swallowed; the returned promise never rejects (safe to await or fire-and-forget).
export async function writeAudit(
  user: Auditable | undefined,
  action: string,
  entity: string,
  entityId: string | number,
  detail: unknown = ''
): Promise<void> {
  try {
    await run(
      `INSERT INTO audit_log (user_id, user_email, org_id, action, entity, entity_id, detail)
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [
        user?.uid ?? null,
        user?.email ?? '',
        user?.orgId ?? 1,
        action,
        entity,
        String(entityId),
        typeof detail === 'string' ? detail : JSON.stringify(detail),
      ]
    );
  } catch {
    /* never throw from auditing */
  }
}
