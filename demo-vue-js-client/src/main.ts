import { createApp } from 'vue';
import { authService, ServiceProviderKeys } from '@/services';
import App from './App.vue';
import router from './router';

createApp(App)
  .use(router)
  .provide(ServiceProviderKeys.AUTH_SERVICE, authService)
  .mount('#app');
