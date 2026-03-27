import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://www.andrewlynch.io',
  output: 'static',
  markdown: {
    shikiConfig: {
      theme: 'github-light',
    },
  },
});
