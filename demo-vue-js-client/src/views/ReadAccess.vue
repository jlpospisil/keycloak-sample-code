<template>
  <div>
    <h1>User has read access!!!</h1>
    <h1>User:</h1>
    <p>
      {{ userProfile }}
    </p>

    <h1>Auth Header Value:</h1>
    <p>
      {{ authHeaderValue }}
    </p>
  </div>
</template>

<script lang="ts">
import Oidc from 'oidc-client';
import { ServiceProviderKeys } from '@/services';
import { defineComponent, inject } from 'vue';
import AuthService from '@/services/AuthService';

export default defineComponent({
  name: 'ReadAccess',

  setup: () => ({
    authService: inject<AuthService>(ServiceProviderKeys.AUTH_SERVICE),
  }),

  computed: {
    authHeaderValue(): string | undefined {
      return this.authService?.authHeaderValue;
    },
    userProfile(): Oidc.Profile | undefined {
      return this.authService?.userProfile;
    },
  },
});
</script>
