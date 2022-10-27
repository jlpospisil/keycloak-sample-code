import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';
import authRouterGuard from '@/router/AuthRouterGuard';
import Routes from '@/router/routes';
import { Groups } from '@/constants/authentication';
import HomeView from '../views/HomeView.vue';

const routes: Array<RouteRecordRaw> = [
  {
    path: Routes.LOGIN,
    alias: [
      Routes.LOGIN_CALLBACK,
      Routes.LOGOUT,
    ],
    // Authentication functionality is handled by router guard; no component necessary.
    component: () => ({}),
  },
  {
    path: Routes.HOME,
    name: 'home',
    component: HomeView,
    meta: {
      permitAll: true,
    },
  },
  {
    path: Routes.READ_ACCESS,
    name: 'read-access',
    component: () => import(/* webpackChunkName: "read-access" */ '../views/ReadAccess.vue'),
    meta: {
      hasAuthority: Groups.DEMO_READ,
    },
  },
  {
    path: Routes.WRITE_ACCESS,
    name: 'write-access',
    component: () => import(/* webpackChunkName: "write-access" */ '../views/WriteAccess.vue'),
    meta: {
      hasAuthority: Groups.DEMO_WRITE,
    },
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

router.beforeEach(authRouterGuard);

export default router;
