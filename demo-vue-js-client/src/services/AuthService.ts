import Oidc from 'oidc-client';
import Routes from '@/router/routes';

Oidc.Log.logger = console;
Oidc.Log.level = (process.env.NODE_ENV === 'production') ? Oidc.Log.ERROR : Oidc.Log.DEBUG;

class AuthService {
  private LOGIN_REDIRECT_KEY = 'login.redirect';

  private userManager: Oidc.UserManager;

  private user?: Oidc.User;

  constructor() {
    const domain = process.env.VUE_APP_AUTH_DOMAIN;
    const { origin } = window.location;

    const settings: Oidc.UserManagerSettings = {
      userStore: new Oidc.WebStorageStateStore({ store: window.sessionStorage }),
      authority: domain,
      metadataUrl: `${domain}/realms/demo-realm/.well-known/openid-configuration`,
      redirect_uri: `${origin}/login/callback`,
      response_type: 'id_token token',
      scope: 'openid profile groups',
      client_id: process.env.VUE_APP_AUTH_CLIENT_ID,
      accessTokenExpiringNotificationTime: 10,
      automaticSilentRenew: true,
      filterProtocolClaims: false,
      loadUserInfo: true,
      includeIdTokenInSilentRenew: false,
      post_logout_redirect_uri: origin,
    };

    this.userManager = new Oidc.UserManager(settings);
  }

  get userProfile(): Oidc.Profile | undefined {
    return this.user?.profile;
  }

  private get userGroups(): string[] {
    return this.user?.profile?.groups ?? [];
  }

  get authHeaderValue() {
    const accessToken = this.user?.access_token;
    let tokenType = this.user?.token_type ?? '';
    tokenType = tokenType.charAt(0).toUpperCase() + tokenType.slice(1);

    return `${tokenType} ${accessToken}`;
  }

  get isLoggedIn(): boolean {
    return !(this.user?.expired ?? true);
  }

  get loginRedirect(): string | null | undefined {
    return window.sessionStorage.getItem(this.LOGIN_REDIRECT_KEY);
  }

  private set loginRedirect(redirect: string | null | undefined) {
    if (redirect && redirect !== Routes.LOGIN) {
      window.sessionStorage.setItem(this.LOGIN_REDIRECT_KEY, redirect);
    } else {
      window.sessionStorage.removeItem(this.LOGIN_REDIRECT_KEY);
    }
  }

  public async checkLoginStatus(): Promise<boolean> {
    this.user = await this.getUser() ?? undefined;

    return this.isLoggedIn;
  }

  public hasAuthority(role: string): boolean {
    return this.userGroups.includes(role);
  }

  public hasAnyAuthority(roles: string[]): boolean {
    return this.userGroups.some((role) => roles.includes(role));
  }

  private async getUser(): Promise<Oidc.User | null> {
    return this.userManager.getUser();
  }

  public login(redirect?: string): Promise<void> {
    this.loginRedirect = redirect;
    return this.userManager.signinRedirect();
  }

  public loginCallback(): Promise<Oidc.User> {
    return this.userManager.signinRedirectCallback();
  }

  public logout(): Promise<void> {
    return this.userManager.signoutRedirect();
  }
}

export default AuthService;
