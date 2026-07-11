import nodemailer from 'nodemailer';

// Minimal SMTP sender, configured entirely from environment variables so there
// is no settings table and no admin UI to maintain. Used only for password
// reset links today.
//   SMTP_HOST, SMTP_PORT (587), SMTP_SECURE (false), SMTP_USER, SMTP_PASS,
//   SMTP_FROM, APP_URL (where the frontend is served)

export function mailConfigured(): boolean {
  return Boolean(process.env.SMTP_HOST && process.env.SMTP_FROM);
}

export function appUrl(): string {
  return (process.env.APP_URL || 'http://localhost:5173').replace(/\/$/, '');
}

export async function sendMail(to: string, subject: string, text: string): Promise<void> {
  if (!mailConfigured()) {
    const err: any = new Error('Email is not configured on this server. Set SMTP_HOST and SMTP_FROM, or ask an admin to set your password directly.');
    err.status = 503;
    throw err;
  }
  const transport = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: Number(process.env.SMTP_PORT || 587),
    secure: process.env.SMTP_SECURE === 'true',
    auth: process.env.SMTP_USER ? { user: process.env.SMTP_USER, pass: process.env.SMTP_PASS || '' } : undefined,
  });
  await transport.sendMail({ from: process.env.SMTP_FROM, to, subject, text });
}
