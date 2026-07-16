// Minimal dependency-free static server for the Capital Book frontend.
// Serves index.html (landing) and app.html (the CRM) plus css/ and js/.
//   node server.js            -> http://localhost:5173
//   PORT=8080 node server.js
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { join, extname, normalize } from 'node:path';
import { fileURLToPath } from 'node:url';
import { dirname } from 'node:path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const PORT = Number(process.env.PORT || 4545);

const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.png': 'image/png',
  '.woff2': 'font/woff2',
};

const server = createServer(async (req, res) => {
  try {
    let urlPath = decodeURIComponent((req.url || '/').split('?')[0]);
    if (urlPath === '/') urlPath = '/index.html';
    // prevent path traversal
    const safe = normalize(urlPath).replace(/^(\.\.[/\\])+/, '');
    const filePath = join(__dirname, safe);
    if (!filePath.startsWith(__dirname)) { res.writeHead(403); return res.end('Forbidden'); }
    const data = await readFile(filePath);
    res.writeHead(200, { 'Content-Type': MIME[extname(filePath)] || 'application/octet-stream' });
    res.end(data);
  } catch {
    res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
    res.end('<h1>404</h1><p>Not found. Try <a href="/">/</a> or <a href="/app.html">/app.html</a>.</p>');
  }
});

server.listen(PORT, () => {
  console.log(`Capital Book frontend on http://localhost:${PORT}`);
  console.log(`  landing -> http://localhost:${PORT}/`);
  console.log(`  app     -> http://localhost:${PORT}/app.html`);
  console.log('Make sure the API is running and js/config.js points at it.');
});
