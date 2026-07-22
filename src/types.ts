export type Role = 'admin' | 'editor' | 'viewer';

export interface User {
  id: number;
  email: string;
  name: string;
  role: Role;
  org_id: number;
  created_at: string;
}

export interface JwtPayload {
  uid: number;
  email: string;
  role: Role;
  orgId: number;
  // true only for members of Capital Book's own "platform" organization, who
  // see across every org exactly as the app behaved before multi-org support.
  isPlatformOrg: boolean;
}

declare global {
  // eslint-disable-next-line @typescript-eslint/no-namespace
  namespace Express {
    interface Request {
      user?: JwtPayload;
    }
  }
}
