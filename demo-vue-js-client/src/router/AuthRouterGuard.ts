import { authService } from '@/services';
import { NavigationGuardNext, RouteLocationNormalized, RouteRecord } from 'vue-router';
import Routes from '@/router/routes';

const requiresAuth = (to: RouteLocationNormalized): boolean => to.matched
  .some((record: RouteRecord) => !record.meta.permitAll);

const hasAuthorityIfRequired = (record: RouteRecord): boolean => {
  const routeAuthority = record.meta.hasAuthority;
  const requiredAuthority = typeof routeAuthority === 'string' ? routeAuthority : '';
  return !requiredAuthority || authService.hasAuthority(requiredAuthority);
};

const hasPermission = (to: RouteLocationNormalized): boolean => {
  const routesWithoutPermission = to.matched
    .filter((record: RouteRecord) => !hasAuthorityIfRequired(record));
  return routesWithoutPermission.length === 0;
};

const login = (to: RouteLocationNormalized, next: NavigationGuardNext) => {
  authService
    .login(to.fullPath)
    // login is a redirect, but we still have to call next
    .then(() => next(false));
};

const logout = (next: NavigationGuardNext) => {
  authService
    .logout()
    // login is a redirect, but we still have to call next
    .then(() => next(false));
};

const handleLoginCallback = (next: NavigationGuardNext) => {
  authService
    .loginCallback()
    .then(() => {
      next({ path: authService.loginRedirect ?? Routes.HOME });
    })
    .catch((error) => {
      console.error('Login Error:', error);
      next({ path: Routes.HOME });
    });
};

const handleRouteChange = (to: RouteLocationNormalized, next: NavigationGuardNext) => {
  // We need to check the login status even if the route doesn't require authentication b/c
  // this is how we get user details/roles/etc. if they are logged in.  This information
  // drives various display aspects.
  authService.checkLoginStatus()
    .then((isLoggedIn: boolean) => {
      if (!requiresAuth(to)) {
        // If the route doesn't require auth, proceed
        next();
      } else if (!isLoggedIn) {
        // If the route requires auth, and we're not logged in, log in
        login(to, next);
      } else if (hasPermission(to)) {
        // If the route requires auth, and we're logged in with the required permission, proceed
        next();
      } else {
        // If the route requires auth, and we're logged in without the required permission, go home
        next({ path: Routes.HOME });
      }
    });
};

export default (
  to: RouteLocationNormalized,
  _from: RouteLocationNormalized,
  next: NavigationGuardNext,
) => {
  if (to.path === Routes.LOGOUT) {
    logout(next);
  } else if (to.path === Routes.LOGIN_CALLBACK) {
    handleLoginCallback(next);
  } else {
    handleRouteChange(to, next);
  }
};
