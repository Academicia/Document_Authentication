import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
    proxy: {
      '/login': { target: 'http://127.0.0.1:8000' },
      '/register': { target: 'http://127.0.0.1:8000' },
      '/upload': { target: 'http://127.0.0.1:8000' },
      '/sign/': { target: 'http://127.0.0.1:8000' },
      '/api/': { target: 'http://127.0.0.1:8000' },
      '/signers': { target: 'http://127.0.0.1:8000' },
      '/signer/': { target: 'http://127.0.0.1:8000' },
      '/user/': { target: 'http://127.0.0.1:8000' },
      '/document/': { target: 'http://127.0.0.1:8000' },
      '/audit/': { target: 'http://127.0.0.1:8000' },
      '/docs/': { target: 'http://127.0.0.1:8000' },
      '/output/': { target: 'http://127.0.0.1:8000' },
      '/admin': { target: 'http://127.0.0.1:8000' },
      '/admin/': { target: 'http://127.0.0.1:8000' },
    }
  }
})
