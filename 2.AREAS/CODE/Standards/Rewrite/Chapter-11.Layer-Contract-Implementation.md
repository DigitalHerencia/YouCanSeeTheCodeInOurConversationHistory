# Chapter 11: Layer Contract

**The Book of Implementation™**

## Golden pattern — the full contract as a table

| Layer | Owns | May call | May be called by | Trust transition |
|---|---|---|---|---|
| Route (`app/`) | HTTP/framework adapting | Features, narrow workflow calls (revalidate/redirect) | The framework itself | None assumed; delegates to Feature/Workflow to establish |
| Feature (`features/`) | Presentation orchestration | Workflows, Fetchers (simple reads) | Route files only | None re-established here; inherited from what it calls |
| Workflow (`lib/workflows/`) | Composition, business-rule sequencing | Fetchers, Actions, integrations | Features | Re-derives access context via the Fetcher/Action it calls |
| Fetcher (`lib/fetchers/`) | Reads | Prisma selects, DTO mappers | Workflows, Features | Authenticates + authorizes + tenant-scopes on every call |
| Action (`lib/actions/`) | Mutations | Schemas, policy, transaction helpers | Workflows, Features | Authenticates + authorizes + re-checks object-level policy on every call |
| Integration (`lib/integrations/`) | Provider-specific mechanics | Provider SDKs | Workflows only (never Actions directly, per Ch.18) | Provider-authenticated via its own credentials, independent of app-level auth |

## Anatomy

- **This table is literally the union of every per-layer rule already stated in Chapters 12–24** — it exists so the boundaries can be scanned across layers at once, not because it introduces new rules of its own.
- **The "may be called by" column for Fetcher and Action explicitly excludes routes** — this is the check that catches the asymmetry described in the Knowledge chapter: even though a route *could* technically import a Fetcher directly, doing so is a documented violation, not a gray area.
- **Integration's "may be called by" column says "Workflows only"** — directly encodes the ESLint rule from Chapter 23 that blocks `lib/actions/**` from importing `lib/integrations/**`.

## Real worked example — the table enforced as import restrictions

This is the same ESLint configuration from Chapter 23, read here specifically as a Layer Contract enforcement mechanism rather than a tech-stack boundary:

```js
// lib/actions/** may not import lib/integrations/** — enforces "Action calls integration" being disallowed
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
// features/** may not import app/** — enforces "Feature may be called by Route" as one-directional, not "Feature may call Route"
{
  files: ["features/**/*.{js,jsx,ts,tsx}"],
  rules: {
    "no-restricted-imports": ["error", {
      patterns: [{
        group: [...databaseImportPatterns, "@/app/**", "**/app/**", "@/lib/integrations/**", "**/lib/integrations/**"],
        message: "Features orchestrate templates and workflows without importing routes, providers, or database implementation.",
      }],
    }],
  },
},
```

## Forbidden variants (enforced, not just documented)

- **No layer importing "upward"** — a Fetcher importing from `features/`, a Workflow importing from `app/`. Dependency direction only ever flows from Route down toward Fetcher/Action/Integration, never the reverse.
- **No route file importing a Fetcher or Action directly**, bypassing the Feature/Workflow composition layer, even when it would technically "work."
- **No layer assuming a trust level was already established by its caller** without re-checking it itself — Fetchers and Actions in particular never skip their own authentication/authorization pass on the theory that "the Feature already checked."

## Checklist

- [ ] For any new layer or module, all five contract questions (owns / may know / may call / may be called by / trust transition) are answered explicitly
- [ ] Import restrictions in ESLint match the "may call" / "may be called by" columns for every layer that has one
- [ ] No layer inherits a trust level from its caller without re-establishing or re-checking it itself
- [ ] Dependency direction is checked to flow one way only (Route → Feature → Workflow → Fetcher/Action → Integration/DB)
