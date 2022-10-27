<template>
  <nav>
    <router-link to="/">Home</router-link>

    <template v-if="hasReadAccess">
      <span>|</span>
      <router-link :to="routes.READ_ACCESS">Read Access</router-link>
    </template>

    <template v-if="hasWriteAccess">
      <span>|</span>
      <router-link :to="routes.WRITE_ACCESS">Write Access</router-link>
    </template>

    <template v-if="!(authService?.isLoggedIn ?? false)">
      <span>|</span>
      <router-link :to="routes.LOGIN">Login</router-link>
    </template>

    <template v-else>
      <span>|</span>
      <router-link :to="routes.LOGOUT">Logout</router-link>
    </template>
  </nav>
  <router-view/>
</template>

<script lang="ts">
import { defineComponent, inject } from 'vue';
import Routes from '@/router/routes';
import AuthService from '@/services/AuthService';
import { ServiceProviderKeys } from '@/services';
import { Roles } from '@/constants/authentication';

export default defineComponent({
  name: 'App',

  // This resulted in a type error, so `setup` method below was the workaround
  // inject: {
  //   authService: { from: ServiceProviderKeys.AUTH_SERVICE },
  // },

  setup: () => ({
    authService: inject<AuthService>(ServiceProviderKeys.AUTH_SERVICE),
  }),

  computed: {
    routes: () => Routes,

    hasReadAccess() {
      return this.authService?.hasAuthority(Roles.DEMO_READ) ?? false;
    },

    hasWriteAccess() {
      return this.authService?.hasAuthority(Roles.DEMO_WRITE) ?? false;
    },
  },
});
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;
    display: inline-block;
    padding: 5px 15px;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
