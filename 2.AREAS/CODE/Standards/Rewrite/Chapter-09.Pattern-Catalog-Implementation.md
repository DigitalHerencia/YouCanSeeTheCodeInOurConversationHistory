# Chapter 09: Pattern Catalog

**The Book of Implementation™**

## Placement: every pattern's concrete home

Verified against the live maximal template. Each folder below exists, with the entry counts shown at the time of writing.

```text
lib/fetchers/                  P01  domain-organized reads                     (12 entries)
lib/actions/                   P02  domain-organized mutations                 (11)
lib/workflows/                 P03  domain business-logic composition          (12)
lib/db/transactions/           P04  atomic local database operations           (23)
lib/db/selects/                P05  exact typed Prisma projections             (10)
lib/db/dto/                    P06  persistence -> application DTO mapping     (10)
lib/auth/ + lib/authz/         P07  authentication + RBAC authorization        (4 + 4)
lib/integrations/<provider>/   P08  provider client + capability helpers       (cloudinary, hugging-face, sendgrid, stripe, vercel-blob)
lib/cache/                     P09  invalidation, cache life, tags             (3)
lib/constants/                 P10  cross-cutting stable values                (3)
lib/utils/                     P11  generic reusable helpers                   (7)
schemas/                       P12  domain-organized Zod runtime validation    (11)
types/                         P13  domain-organized TypeScript types          (13)
prisma/                        P14  schema, migrations, seed, RLS              (schema.prisma, seed.ts, migrations/)
generated/prisma/              P15  generated Prisma output; never hand-edit   (gitignored, produced at build)
app/api/<provider>/.../route.ts P16 provider HTTP webhook boundary
```

`generated/prisma/` is absent from a fresh clone on purpose: it is listed in `.gitignore` and produced by the `prisma-client` generator (`output = "../generated/prisma"`). Its absence is not a gap.

## Golden pattern: a provider integration

```text
lib/integrations/<provider>/
  client.ts            # the one place the SDK is instantiated
  <capability>.ts      # one file per distinct capability the app uses
```

Real examples from the template:

```text
lib/integrations/cloudinary/   client.ts  transformations.ts  upload.ts
lib/integrations/hugging-face/ client.ts  embeddings.ts       inference.ts
lib/integrations/vercel-blob/  client.ts  delete.ts  download.ts  upload.ts
lib/integrations/sendgrid/     client.ts  email.ts   webhooks.ts
lib/integrations/stripe/       client.ts  checkout.ts  portal.ts  subscriptions.ts  webhooks.ts
```

Stripe has more files only because the app uses more distinct Stripe capabilities. It is the same client-plus-capabilities shape.

## Golden pattern: workflows and webhooks

- **Workflows** are shallow, domain-named files: `lib/workflows/crmWorkflows.ts`, `projectsWorkflows.ts`. Never `lib/<domain>/workflows/`.
- **Webhooks** have no `lib/webhooks/` layer. The HTTP endpoint stays in `app/api/<provider>/webhooks/route.ts`, provider-specific helpers stay with the provider (`lib/integrations/<provider>/webhooks.ts`), and the provider-agnostic claim/complete/fail helpers live in `lib/db/transactions/webhook-event.tx.ts`. Clerk is the exception: its webhook helpers live in `lib/auth/clerk-webhooks.ts` because they belong to the identity concern.

## Golden pattern: caching helpers (supporting, not a layer)

```ts
// lib/cache/life.ts
export const cacheLife = { realtime: 0, short: 30, standard: 300, long: 3_600, static: 86_400 } as const;

// lib/cache/tags.ts
export const cacheTags = {
  organization: (organizationId: string) => joinTag("organization", organizationId),
  collection: (organizationId: string, resource: string) => joinTag("organization", organizationId, resource),
  record: (organizationId: string, resource: string, recordId: string) =>
    joinTag("organization", organizationId, resource, recordId),
  user: (userId: string) => joinTag("user", userId),
} as const;

// lib/cache/invalidate.ts
export function invalidateTags(tags: readonly string[]) {
  for (const tag of new Set(tags)) revalidateTag(tag, "max");
}
```

Tags are organization-prefixed, so a cached value can never be shared across tenants by accident.

## Anatomy

- **Placement follows concern, not provider.** Clerk lives in `lib/auth` and Neon/Prisma in `lib/db`, because identity and persistence are the concerns. Everything else provider-shaped goes in `lib/integrations`.
- **Supporting patterns (P05, P06, P09 to P13) are folders, not layers.** They have no callers-and-callees contract of their own beyond "used by the canonical patterns."
- **Tag builders are pure functions of tenant and resource ids**, which is what makes invalidation precise instead of a global cache flush.

## Gaps flagged, not yet closed

1. **The cache helpers in `lib/cache/` are not used anywhere.** No caller of `cacheLife`, `cacheTags`, or `invalidateTags` exists in the codebase (see Chapter 23). P09 is a defined pattern with no consumer.
2. **The doctrine says to prefer explicit direct imports over barrel exports.** Two barrels exist: `components/ui/index.ts` and `components/chart/index.ts`. The doctrine says "by default," so this is a documented-exception question, not necessarily a violation.

## Forbidden variants (enforced, not just documented)

- **No new folder created to give a supporting pattern architectural status.** One obvious owner per responsibility.
- **No workflow logic duplicating a lower-level Fetcher, Action, or integration.**
- **No barrel-export layers by default.** Import from the file that owns the symbol.
- **No hand edits under `generated/prisma/`.**
- **No cross-layer closed vocabulary retyped locally.** A type alias, a Zod enum, a Prisma enum, a provider mapper, and a UI option list that happen to contain the same strings are not five authorities (Chapter 03).

## Checklist

- [ ] New code lands in the one folder that owns its responsibility (table above)
- [ ] A provider integration is a `client.ts` plus one file per capability
- [ ] A new helper is not promoted to an architectural layer or a new top-level folder
- [ ] Cache tags are tenant-prefixed and built through `cacheTags`
- [ ] Imports reference the owning file, not a barrel, unless a documented exception applies
