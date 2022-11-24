import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { rescriptRelayVitePlugin } from "rescript-relay-router";

export default defineConfig({
  root: 'src',
  build: {
    // Relative to the root
    outDir: '../dist',
    target: "esnext"
  },
  plugins: [
    react({
      include: '**/*.{jsx,tsx}',
    }),
    rescriptRelayVitePlugin()
  ],
  publicDir: '../public',
});
