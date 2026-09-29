# ESLint/Prettier

Category: Dev Tools
Type: Tooling
Edited: December 18, 2025 8:06 PM
Docs Link: • ESLint
• Prettier
• GitHub Actions
• Vercel Deployments
Cover: https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: ESLint, GitHub Actions, Prettier, Vercel

## Mental Models

- **Consistency > preference** → enforce code style with ESLint + Prettier.
- **CI must gate** → lint, typecheck, and test run on every PR.
- **Preview everything** → Vercel previews tied to each branch/PR.
- **Main is sacred** → only merge to `main` after passing CI.
- **Infra as config** → Vercel config, GitHub Actions YAML all committed.

---

## Canonical Workflow

### 1. Linting & Formatting

```json
// package.json
{
  "scripts": {
    "lint": "eslint . --ext .ts,.tsx",
    "format": "prettier --write ."
  }
}

```

- ESLint: enforce rules (`next/core-web-vitals`, `@typescript-eslint`).
- Prettier: formatting only, run pre-commit or in CI.

---

### 2. GitHub Actions for CI

```yaml
# .github/workflows/ci.yml
name: CI
on:
  pull_request:
  push:
    branches: [main]

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm ci
      - run: npm run lint
      - run: npm run test

```

- Runs on push + PR.
- Blocks merges if lint/tests fail.

---

### 3. Vercel Deployment

- Connect repo → auto-deploy preview for each branch.
- Protected `main` branch deploys to production.
- Environment variables configured in Vercel dashboard.

---

## Best Practices

- Enforce lint/format via pre-commit (Husky optional).
- CI = lint + typecheck + tests (minimum bar).
- Every PR gets preview deployment.
- Rollbacks handled in Vercel dashboard.

---

## Docs & References

- ESLint
- Prettier
- GitHub Actions
- Vercel Deployments

---