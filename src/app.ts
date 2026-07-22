import 'express-async-errors';
import express from 'express';
import cors from 'cors';
import { authRouter } from './routes/auth.js';
import { contactsRouter } from './routes/contacts.js';
import { pipelineRouter } from './routes/pipeline.js';
import { dashboardRouter } from './routes/dashboard.js';
import { auditRouter } from './routes/audit.js';
import { activitiesRouter } from './routes/activities.js';
import { tasksRouter } from './routes/tasks.js';
import { tagsRouter } from './routes/tags.js';
import { viewsRouter } from './routes/views.js';
import { templatesRouter } from './routes/templates.js';
import { organizationsRouter } from './routes/organizations.js';
import { contactCount } from './db.js';

export function createApp() {
  const app = express();

  // CORS: allow all by default, or a comma-separated CORS_ORIGIN allowlist.
  const origin = process.env.CORS_ORIGIN && process.env.CORS_ORIGIN !== '*'
    ? process.env.CORS_ORIGIN.split(',').map((s) => s.trim())
    : true;
  app.use(cors({ origin }));
  app.use(express.json({ limit: '1mb' }));

  app.get('/', (_req, res) => {
    res.json({ service: 'Capital Book CRM API', status: 'ok', docs: '/api/health' });
  });

  app.get('/api/health', async (_req, res) => {
    res.json({ ok: true, contacts: await contactCount(), time: new Date().toISOString() });
  });

  app.use('/api/auth', authRouter);
  app.use('/api/contacts', contactsRouter);
  app.use('/api', activitiesRouter); // /api/activity, /api/contacts/:id/activities, /api/activities/:id
  app.use('/api', tagsRouter);       // /api/tags and /api/contacts/:id/tags
  app.use('/api/tasks', tasksRouter);
  app.use('/api/views', viewsRouter);
  app.use('/api/templates', templatesRouter);
  app.use('/api/pipeline', pipelineRouter);
  app.use('/api/dashboard', dashboardRouter);
  app.use('/api/audit', auditRouter);
  app.use('/api/organizations', organizationsRouter);

  // 404 for unknown API routes
  app.use('/api', (_req, res) => res.status(404).json({ error: 'Not found' }));

  // JSON error handler (async route errors land here via express-async-errors)
  app.use((err: unknown, _req: express.Request, res: express.Response, _next: express.NextFunction) => {
    const message = err instanceof Error ? err.message : 'Internal error';
    res.status(500).json({ error: message });
  });

  return app;
}
