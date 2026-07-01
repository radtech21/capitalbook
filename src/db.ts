import mysql from 'mysql2/promise';
import 'dotenv/config';

// A single shared pool. Connection details come from the environment so the same
// code runs against a local MySQL/MariaDB in development and a managed instance in
// production. Tests point DB_NAME at a throwaway database.
export const pool = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER || 'cbuser',
  password: process.env.DB_PASSWORD || 'cbpass',
  database: process.env.DB_NAME || 'capitalbook',
  waitForConnections: true,
  connectionLimit: Number(process.env.DB_POOL || 10),
  charset: 'utf8mb4_unicode_ci',
  // return DATE/DATETIME as strings (the API and frontend treat them as plain text,
  // matching the previous SQLite behaviour) and keep big numbers sane.
  dateStrings: true,
  decimalNumbers: true,
  namedPlaceholders: false,
});

/** Run a query and return the rows array. */
export async function q<T = any>(sql: string, params: unknown[] = []): Promise<T[]> {
  const [rows] = await pool.query(sql, params);
  return rows as T[];
}

/** Run a query and return the first row (or undefined). */
export async function one<T = any>(sql: string, params: unknown[] = []): Promise<T | undefined> {
  const rows = await q<T>(sql, params);
  return rows[0];
}

/** Run an INSERT/UPDATE/DELETE and return insertId / affectedRows. */
export async function run(
  sql: string,
  params: unknown[] = []
): Promise<{ insertId: number; affectedRows: number }> {
  const [res] = await pool.query(sql, params);
  const r = res as mysql.ResultSetHeader;
  return { insertId: r.insertId, affectedRows: r.affectedRows };
}

/**
 * Run a function inside a transaction on a single dedicated connection.
 * The callback receives that connection; use conn.query(...) for every statement
 * so they all share the transaction.
 */
export async function tx<T>(fn: (conn: mysql.PoolConnection) => Promise<T>): Promise<T> {
  const conn = await pool.getConnection();
  try {
    await conn.beginTransaction();
    const result = await fn(conn);
    await conn.commit();
    return result;
  } catch (e) {
    try { await conn.rollback(); } catch { /* ignore */ }
    throw e;
  } finally {
    conn.release();
  }
}

export async function contactCount(): Promise<number> {
  const r = await one<{ n: number }>('SELECT COUNT(*) AS n FROM contacts');
  return r ? Number(r.n) : 0;
}

export async function closePool(): Promise<void> {
  await pool.end();
}
