# Vercel/GitHub Actions

Category: Build & Deploy
Type: Infra
Edited: December 18, 2025 8:10 PM
Docs Link: • Vercel Deployments
• Next.js Build & Optimization
• PostCSS
• Autoprefixer
Cover: https://images.unsplash.com/photo-1631624215749-b10b3dd7bca7?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: CI/CD, GitHub Actions, Next.js, Vercel

## Mental Models

- **Server-first deployment** → Next.js RSC + Server Actions deployed server-side by default.
- **Edge-friendly builds** → middleware and server actions run at the edge when possible.
- **Deterministic bundles** → optimizations ensure consistent output across environments.
- **Environment separation** → development, preview, and production are isolated.
- **Immutable deployments** → each push creates a unique preview/deployment.

---

## Canonical Workflow

### 1. Local Build & Test

```bash
# Install dependencies
npm ci

# Run dev server
npm run dev

# Build production bundle
npm run build

# Preview bundle locally
npm start

```

- Ensure `NODE_ENV=production` for build-time behavior.
- Build catches errors, TypeScript issues, and CSS compilation problems.

---

### 2. Next.js Bundle Optimizations

- **Tree-shaking** → remove unused code.
- **Code-splitting** → RSC + dynamic imports reduce client bundle.
- **Image optimization** → Next.js Image component for automatic optimization.
- **Cache-control headers** → leverage ISR and streaming SSR.
- **PostCSS + Autoprefixer** → ensures cross-browser CSS consistency.

```tsx
// next.config.js
import { defineConfig } from "next"

export default defineConfig({
  experimental: {
    serverActions: true,
    appDir: true,
  },
  swcMinify: true,
  images: { remotePatterns: [{ protocol: "https", hostname: "**" }] },
})

```

---

### 3. Vercel Deployment

- Connect repo → automatic deployments on push/PR.
- Preview environments per branch → deterministic URLs for QA.
- Production deploy → only `main` branch merges.
- Environment variables set in Vercel dashboard, not in code.

```bash
# Deploy manually (optional)
vercel --prod

```

---

### 4. CI/CD Integration (GitHub Actions)

- Lint + test → build → preview → prod promotion.
- Automatic rollback if build fails.

```yaml
# .github/workflows/deploy.yml
name: Deploy
on:
  push:
    branches: [main]

jobs:
  vercel-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm ci
      - run: npm run build
      - uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          prod: true

```

---

## Best Practices

- Always **build locally first** before merging to main.
- Use **Preview Deployments** for QA and stakeholder review.
- Keep **environment variables secure** via Vercel secrets.
- Monitor build output for tree-shaking and bundle anomalies.
- Use **ISR, streaming SSR, and RSC** for optimal server-client balance.

---

## Docs & References

- [Vercel Deployments](https://vercel.com/docs/deployments)
- [Next.js Build & Optimization](https://nextjs.org/docs/advanced-features/automatic-static-optimization)
- [PostCSS](https://postcss.org/)
- [Autoprefixer](https://github.com/postcss/autoprefixer)

---