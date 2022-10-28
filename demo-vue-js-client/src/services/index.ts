import { reactive } from 'vue';
import AuthService from '@/services/AuthService';
import DemoApiService from '@/services/DemoApiService';

export const authService = reactive(new AuthService());
export const demoApiService = reactive(new DemoApiService(() => authService.authHeaderValue));

export enum ServiceProviderKeys {
  AUTH_SERVICE = '$authService',
  DEMO_API_SERVICE = '$demoApiService'
}
