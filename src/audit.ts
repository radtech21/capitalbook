import { run } from './db.js';
import type { JwtPayload } from './types.js';

// Append-only audit trail. Auditing must never break a request, so all errors are
// swallowed; the returned promise never rejects (safe to await or fire-and-forget).
export async function writeAudit(
  user: JwtPayload | undefined,
  action: string,
  entity: string,
  entityId: string | number,
  detail: unknown = ''
): Promise<void> {
  try {
    await run(
      `INSERT INTO audit_log (user_id, user_email, action, entity, entity_id, detail)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [
        user?.uid ?? null,
        user?.email ?? '',
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
