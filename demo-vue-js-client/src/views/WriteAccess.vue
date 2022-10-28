<template>
  <div>
    <h1>Response from Demo API example write endpoint:</h1>
    <p>
      {{ demoContent }}
    </p>
  </div>
</template>

<script lang="ts">
import { ServiceProviderKeys } from '@/services';
import { defineComponent, inject } from 'vue';
import DemoApiService from '@/services/DemoApiService';

export default defineComponent({
  name: 'WriteAccess',

  setup: () => ({
    demoApiService: inject<DemoApiService>(ServiceProviderKeys.DEMO_API_SERVICE),
  }),

  data: () => ({
    demoContent: null,
  }),

  async mounted() {
    this.demoContent = await this.demoApiService?.getDemoWriteContent();
  },
});
</script>
