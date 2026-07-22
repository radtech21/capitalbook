import { Router } from 'express';
import { q, one } from '../db.js';
import { requireAuth, orgScope } from '../auth.js';

export const dashboardRouter = Router();

dashboardRouter.get('/stats', requireAuth, async (req, res) => {
  // Book-wide rollups narrow to the caller's own org (platform org sees
  // everything, unchanged from before multi-org support).
  const org = orgScope(req, 'org_id');
  const orgAnd = org.sql ? ` AND ${org.sql}` : '';
  const orgWhere = org.sql ? ` WHERE ${org.sql}` : '';

  const total = Number((await one<{ n: number }>(`SELECT COUNT(*) AS n FROM contacts${orgWhere}`, org.params))!.n);
  const segments = Number((await one<{ n: number }>(`SELECT COUNT(DISTINCT segment) AS n FROM contacts${orgWhere}`, org.params))!.n);
  const countries = Number((await one<{ n: number }>(`SELECT COUNT(DISTINCT country) AS n FROM contacts${orgWhere}`, org.params))!.n);

  const bySegment = await q(`SELECT segment, COUNT(*) AS count, COALESCE(SUM(aum_mm), 0) AS aum_sum FROM contacts${orgWhere} GROUP BY segment ORDER BY count DESC`, org.params);
  const byTier = await q(`SELECT aum_tier AS tier, COUNT(*) AS count FROM contacts${orgWhere} GROUP BY aum_tier`, org.params);
  const geography = await one(
    `SELECT
       SUM(CASE WHEN country = 'United States' THEN 1 ELSE 0 END) AS us,
       SUM(CASE WHEN country = 'Canada' THEN 1 ELSE 0 END) AS canada,
       SUM(CASE WHEN country NOT IN ('United States','Canada') THEN 1 ELSE 0 END) AS intl,
       COUNT(DISTINCT CASE WHEN country NOT IN ('United States','Canada') THEN country END) AS intl_countries
     FROM contacts${orgWhere}`,
    org.params
  );

  // pipeline summary for the current user
  const byStatus = await q('SELECT status, COUNT(*) AS count FROM pipeline WHERE user_id = ? GROUP BY status', [req.user!.uid]);
  const openOppRow = await one<{ open_opp: number; tracked: number }>(
    "SELECT COALESCE(SUM(opp), 0) AS open_opp, COUNT(*) AS tracked FROM pipeline WHERE user_id = ? AND status <> 'Passed'", [req.user!.uid]
  );

  // task rollup for the current user
  const tasks = await one(
    `SELECT
       COALESCE(SUM(CASE WHEN done = 0 THEN 1 ELSE 0 END), 0) AS open,
       COALESCE(SUM(CASE WHEN done = 0 AND due IS NOT NULL AND due <> '' AND due < CURDATE() THEN 1 ELSE 0 END), 0) AS overdue,
       COALESCE(SUM(CASE WHEN done = 1 THEN 1 ELSE 0 END), 0) AS done
     FROM tasks WHERE user_id = ?`,
    [req.user!.uid]
  );

  // team activity volume in the last 7 days, scoped to contacts in the caller's org
  const activityOrg = orgScope(req, 'c.org_id');
  const activityOrgAnd = activityOrg.sql ? ` AND ${activityOrg.sql}` : '';
  const activity7d = Number((await one<{ n: number }>(
    `SELECT COUNT(*) AS n FROM activities a LEFT JOIN contacts c ON c.id = a.contact_id
     WHERE a.created_at >= (NOW() - INTERVAL 7 DAY)${activityOrgAnd}`,
    activityOrg.params
  ))!.n);
  // contacts owned by the current user (owner_id already implies same-org, since
  // owners can only be assigned to contacts within their own org)
  const assignedToMe = Number((await one<{ n: number }>('SELECT COUNT(*) AS n FROM contacts WHERE owner_id = ?', [req.user!.uid]))!.n);

  return res.json({
    total, segments, countries, bySegment, byTier, geography, tasks, activity7d, assignedToMe,
    pipeline: { byStatus, openOpp: openOppRow!.open_opp, tracked: openOppRow!.tracked },
  });
});
