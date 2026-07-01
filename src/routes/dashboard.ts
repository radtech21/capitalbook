import { Router } from 'express';
import { q, one } from '../db.js';
import { requireAuth } from '../auth.js';

export const dashboardRouter = Router();

dashboardRouter.get('/stats', requireAuth, async (req, res) => {
  const total = Number((await one<{ n: number }>('SELECT COUNT(*) AS n FROM contacts'))!.n);
  const segments = Number((await one<{ n: number }>('SELECT COUNT(DISTINCT segment) AS n FROM contacts'))!.n);
  const countries = Number((await one<{ n: number }>('SELECT COUNT(DISTINCT country) AS n FROM contacts'))!.n);

  const bySegment = await q(`SELECT segment, COUNT(*) AS count, COALESCE(SUM(aum_mm), 0) AS aum_sum FROM contacts GROUP BY segment ORDER BY count DESC`);
  const byTier = await q('SELECT aum_tier AS tier, COUNT(*) AS count FROM contacts GROUP BY aum_tier');
  const geography = await one(
    `SELECT
       SUM(CASE WHEN country = 'United States' THEN 1 ELSE 0 END) AS us,
       SUM(CASE WHEN country = 'Canada' THEN 1 ELSE 0 END) AS canada,
       SUM(CASE WHEN country NOT IN ('United States','Canada') THEN 1 ELSE 0 END) AS intl,
       COUNT(DISTINCT CASE WHEN country NOT IN ('United States','Canada') THEN country END) AS intl_countries
     FROM contacts`
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

  // team activity volume in the last 7 days
  const activity7d = Number((await one<{ n: number }>("SELECT COUNT(*) AS n FROM activities WHERE created_at >= (NOW() - INTERVAL 7 DAY)"))!.n);
  // contacts owned by the current user
  const assignedToMe = Number((await one<{ n: number }>('SELECT COUNT(*) AS n FROM contacts WHERE owner_id = ?', [req.user!.uid]))!.n);

  return res.json({
    total, segments, countries, bySegment, byTier, geography, tasks, activity7d, assignedToMe,
    pipeline: { byStatus, openOpp: openOppRow!.open_opp, tracked: openOppRow!.tracked },
  });
});
