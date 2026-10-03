# Chapter 22: Knowledge System Map

**The Book of Implementation™**

## Golden pattern: truth owners mapped to code

Verified against the live maximal template.

| System of record | Where it is implemented | Evidence it holds |
|---|---|---|
| Clerk (identity and session) | `lib/auth/auth.ts` (`requireIdentity`, `getIdentity`), `proxy.ts` (`clerkMiddleware()`), `lib/auth/clerk-webhooks.ts` | Identity resolves server-side; identity is mapped to a local user in `lib/db/tenant.ts` |
| PostgreSQL (membership, role, domain state) | `lib/db/tenant.ts` `resolveAccessContext` (reads `User`, then an `ACTIVE` `Membership`) | Role comes from the membership row, never from the client |
| Stripe (payment truth) | `lib/integrations/stripe/webhooks.ts` plus the local `BillingSubscription` mirror | The webhook updates local state; the redirect never does |
| Domain policy plus Workflow (legal transitions) | `lib/workflows/*Workflows.ts`, `lib/authz/policies.ts` | Guards such as "only a lead can be qualified" |
| App authorization plus RLS (access and containment) | `lib/authz/permissions.ts`, `lib/authz/policies.ts`, `prisma/migrations/20260814000200_tenant_rls` | Permission grants, object-level checks, `ENABLE` and `FORCE ROW LEVEL SECURITY` on 34 tables |
| Next.js app boundary (HTTP outcomes) | `app/**/page.tsx`, `app/api/**/route.ts`, route-group layouts | 78 pages import nothing from `lib/` |
| Feature (page orchestration) | `features/<domain>/*Feature.tsx` | Thin server components delegating to a Fetcher or Workflow |
| Conformance evidence | `tests/` (`node:test`), `pnpm lint`, `pnpm typecheck`, `.agents/contracts/validation.yaml` | Evidence only; see the gaps in Chapters 13, 20, and 23 |

## Golden pattern: the doctrine's physical layout

```text
TypeScripture/
├── The-Book-of-Knowledge/        24 flat chapters
├── The-Book-of-Implementation/   24 flat chapters
├── 00-Chapter-Map.md
├── 00-Chapter-Map.json
├── 00-Source-Map.md
└── 00-Validation.json
```

Navigation rule: chapter numbers pair Knowledge and Implementation directly, by identical filename. Conceptual labels such as epistemology, ontology, topology, taxonomy, typology, and mereology stay as content and model concepts and never become directory levels (Chapter 06).

## Anatomy

- **Every row of the truth table has exactly one primary file or folder.** If a row cannot be pointed at, either the owner is undecided or the truth is being derived in several places at once.
- **The Stripe row is the pattern for every provider mirror.** The local table is a derivative of the provider's truth, updated only by a verified, idempotent webhook (Chapter 21).
- **The last row is deliberately weaker than the others.** Evidence rows can be wrong, stale, or skipped, which is why the evidence-state vocabulary exists (Chapter 12).

## Gap flagged, not yet closed

The four navigation files listed above (`00-Chapter-Map.md`, `00-Chapter-Map.json`, `00-Source-Map.md`, `00-Validation.json`) are described by the doctrine but do not exist in the repository's `content/` folder. The books themselves are in good shape: 24 and 24 chapters, identical filenames in both folders, no subfolders. Chapter 07 covers how those files get produced.

## Forbidden variants (enforced, not just documented)

- **No second system of record for the same truth.** If two components can both answer "what role does this user have," one of them is a derivative and must be labeled so.
- **No redirect, browser state, or provider delivery order treated as product truth.**
- **No reference implementation promoted to doctrine by age or completeness.** Promotion needs an explicit decision (Chapter 17).
- **No directory created for a conceptual dimension.**

## Checklist

- [ ] Each kind of runtime truth names exactly one system of record
- [ ] Every derived copy (a mirror table, a cached value) names its source and its refresh path
- [ ] Doctrine/implementation disagreements are recorded, not silently reconciled
- [ ] Chapter pairing is by identical filename across the two books
