import 'dotenv/config';
import { defineConfig } from 'vitest/config';

// Tests run against a dedicated database (capitalbook_test by default) so they never
// touch development data. DB host/user/password come from your environment or .env;
// only the database name is overridden. The bootstrap in test/api.test.ts creates the
// database and schema, then truncates and seeds a 300-contact subset before each run.
export default defineConfig({
  test: {
    env: {
      DB_HOST: process.env.DB_HOST || '127.0.0.1',
      DB_PORT: process.env.DB_PORT || '3306',
      DB_USER: process.env.DB_USER || 'cbuser',
      DB_PASSWORD: process.env.DB_PASSWORD || 'cbpass',
      DB_NAME: process.env.TEST_DB_NAME || 'capitalbook_test',
      JWT_SECRET: process.env.JWT_SECRET || 'test-secret',
    },
    fileParallelism: false,
    testTimeout: 20000,
    hookTimeout: 40000,
  },
});
