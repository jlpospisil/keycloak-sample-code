import { createApp } from 'vue';
import { authService, demoApiService, ServiceProviderKeys } from '@/services';
import App from './App.vue';
import router from './router';

createApp(App)
  .use(router)
  .provide(ServiceProviderKeys.AUTH_SERVICE, authService)
  .provide(ServiceProviderKeys.DEMO_API_SERVICE, demoApiService)
  .mount('#app');
