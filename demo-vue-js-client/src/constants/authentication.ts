export enum Roles {
  DEMO_READ = 'demo.read',
  DEMO_WRITE = 'demo.write',
}

export const AuthenticationScopes: string = Object.values(Roles).join(' ');
