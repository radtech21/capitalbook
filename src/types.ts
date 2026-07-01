export type Role = 'admin' | 'editor' | 'viewer';

export interface User {
  id: number;
  email: string;
  name: string;
  role: Role;
  created_at: string;
}

export interface JwtPayload {
  uid: number;
  email: string;
  role: Role;
}

declare global {
  // eslint-disable-next-line @typescript-eslint/no-namespace
  namespace Express {
    interface Request {
      user?: JwtPayload;
    }
  }
}
