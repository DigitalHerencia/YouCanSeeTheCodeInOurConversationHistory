# Chapter 23: Tech Stack Map

**The Book of Implementation™**

## Golden pattern — pinned ownership table

| Package | Pinned version | Owns | Never trusted for |
|---|---|---|---|
| `typescript` | 6.0.3 | Compile-time types | Runtime validation |
| `next` | 16.3.4 | Routing, RSC, streaming, caching | Domain policy, authorization |
| `react` / `react-dom` | 19.2.8 | Rendering, composition | Business truth |
| `@neondatabase/serverless` + `@prisma/adapter-neon` | 1.1.0 / 7.10.0 | Postgres connectivity | — |
| `@prisma/client` | 7.10.0 | Typed persistence access | Public DTO shape, authorization |
| `@clerk/nextjs` | 7.9.1 | Authentication, session, identity | Tenant membership, RBAC, billing truth |
| `zod` | 4.5.4 | Runtime shape/constraint validation | Authentication, authorization |
| `react-hook-form` + `@hookform/resolvers` | 7.87.0 / 5.9.1 | Client-side form UX/state | The actual validation boundary (still Zod, server-side) |
| `tailwindcss` | 4.3.3 | Utility-class styling | Business logic |
| Radix primitives (`@radix-ui/*`) | pinned per-component | Accessible interaction primitives | Business logic |

## Golden pattern — boundary enforced per layer, not just documented

```js
// eslint.config.mjs (excerpt)
{
  files: ["app/**/*.{js,jsx,ts,tsx}"],
  rules: {
    "no-restricted-imports": ["error", {
      paths: databasePackages.map((name) => ({
        name, allowTypeImports: true,
        message: "Database runtime access belongs in lib/db.",
      })),
      patterns: [{
        group: databaseImportPatterns,
        message: "Routes and proxy must use fetchers, actions, auth, or workflows instead of database implementation.",
      }],
    }],
  },
},
{
  files: ["lib/actions/**/*.{js,jsx,ts,tsx}"],
  rules: {
    "no-restricted-imports": ["error", {
      patterns: [{
        group: ["@/lib/integrations/**", "**/lib/integrations/**"],
        message: "Server Actions invoke provider behavior through workflows or provider-neutral capabilities.",
      }],
    }],
  },
},
{
  files: ["features/**/*.{js,jsx,ts,tsx}"],
  rules: {
    "no-restricted-imports": ["error", {
      paths: databasePackages.map((name) => ({
        name, allowTypeImports: true,
        message: "Features use fetchers and actions, never database SDKs.",
      })),
      patterns: [{
        group: [...databaseImportPatterns, "@/app/**", "**/app/**", "@/lib/integrations/**", "**/lib/integrations/**"],
        message: "Features orchestrate templates and workflows without importing routes, providers, or database implementation.",
      }],
    }],
  },
},
{
  files: ["components/**/*.{js,jsx,ts,tsx}"],
  rules: {
    "no-restricted-imports": ["error", {
      paths: databasePackages.map((name) => ({
        name, allowTypeImports: true,
        message: "Presentation cannot import database SDKs.",
      })),
    }],
  },
},
```

## Anatomy

- **The table's "never trusted for" column is the actual point of this chapter** — it's not enough to know Clerk does authentication; the golden pattern is knowing, and enforcing, that it's never asked to do tenancy or billing truth instead.
- **`no-restricted-imports` is scoped per directory glob**, not one global rule — `app/`, `lib/actions/`, `features/`, and `components/` each get a *different* forbidden-import list, matching each layer's specific boundary from the Architecture Contract (Chapter 03).
- **This turns "features never import database SDKs" from a doctrine sentence into a build failure** — the rule doesn't just restrict Prisma/Neon packages by name, it also restricts by import-path pattern, catching a database import from `features/` even if it's re-exported through an intermediate file.
- **Server Actions are barred from importing `lib/integrations` directly** — provider mechanics (Stripe, SendGrid) are meant to be reached through a workflow or a provider-neutral capability, keeping Actions thin and provider-agnostic, matching Chapter 18's stance.

## ⚠ Gaps flagged, not yet closed

Three things worth naming honestly rather than glossing over:

1. **Caching policy exists as vocabulary but is not wired into anything.** `lib/cache/` defines `cacheLife` (realtime 0s, short 30s, standard 300s, long 3,600s, static 86,400s), `cacheTags` (organization, collection, record, and user tag builders), and `invalidateTags` / `invalidatePaths` helpers. A repo-wide search found no caller of any of them, no `"use cache"` directive, no `export const revalidate` or `dynamic` route segment config, and no caching flags in `next.config.ts`. Despite ISR being your stated primary caching strategy, no route currently opts into it, including the static marketing pages (`(public)/faq`, `terms`, `privacy`).
2. **Rate limiting exists for exactly one endpoint.** AI generation has a real, database-backed limiter: `createGeneration` in `lib/actions/aiActions.ts` takes a `rateLimit` of `{ limit, windowStart }` (the default caller uses 60 seconds), takes a per-user `pg_advisory_xact_lock` via `lockAiRateLimitTx` so concurrent requests serialize, counts that user's `aiGeneration` rows since `windowStart`, and throws `AiRateLimitError` when the count reaches the limit. `app/api/ai/generate/route.ts` maps it to HTTP 429. Nothing else is limited: no sign-in or sign-up throttling, no limit on other mutations, none on webhook endpoints. The stable `RATE_LIMITED` error code from the doctrine's vocabulary is not used by this path, which throws its own `AiRateLimitError` and matches it by `cause.name`.
3. **No security headers or Content-Security-Policy is configured.** `next.config.ts` sets only `poweredByHeader: false`, `reactStrictMode`, `typedRoutes`, and image formats. It defines no `headers()` block, and the Security Model contract in the source docs calls for a CSP/security-header review.

## Forbidden variants (enforced, not just documented)

- **No provider package imported outside its designated layer** (`@prisma/client` outside `lib/db`, `@clerk/nextjs` outside `lib/auth`, a provider SDK outside `lib/integrations`) — enforced by the per-directory ESLint rules above, not left to code review discipline.
- **No dependency added to `package.json` without a named owner and an explicit "never trusted for" boundary** — if you can't fill in both columns of the ownership table for a new package, that's a signal it doesn't have a defined place in the architecture yet.
- **No provider redirect (payment success callback, OAuth callback) treated as the source of truth** for anything the provider's webhook is the actual authority on.

## Checklist

- [ ] Every dependency in `package.json` has an identifiable owner and a stated "never trusted for" boundary
- [ ] Cross-layer imports are enforced by ESLint rules scoped to each directory, not only documented
- [ ] No provider SDK imported outside its designated `lib/` subdirectory
- [ ] Caching policy (ISR intervals, fetch cache options) is explicitly declared per route, not left as a framework default
- [ ] Rate limiting covers every abusable entry point (sign-in, mutations, webhooks), not only AI generation, and uses the doctrine's `RATE_LIMITED` code
