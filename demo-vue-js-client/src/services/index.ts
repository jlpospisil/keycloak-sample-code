import { reactive } from 'vue';
import AuthService from '@/services/AuthService';

export const authService = reactive(new AuthService());

export enum ServiceProviderKeys {
  AUTH_SERVICE = '$authService'
}
