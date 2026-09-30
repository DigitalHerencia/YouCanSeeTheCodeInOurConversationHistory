# Chapter 03: Architecture Contract

**The Book of Implementation™**

## Placement — the canonical grammar as a directory tree

```text
app/                  # routes — thin HTTP/framework adapters only
features/             # presentation orchestration (pure UI + workflow composition)
components/
  blocks/               # shadcn primitives composed into reusable blocks
  templates/            # blocks composed into page templates
  shells/               # route-group chrome (header/footer/nav/sidebar)
lib/
  auth/                 # identity — establishes who
  authz/                # access — decides what they can do
  fetchers/             # reads
  actions/              # mutations
  db/
    client.ts
    tenant.ts
    selects/
    dto/
    transactions/
  integrations/          # provider-specific mechanics (Stripe, SendGrid, etc.)
  workflows/             # composition of the above into domain business operations
schemas/               # Zod — runtime validation, derived from or mapped to Prisma enums
types/                 # shared TypeScript types
prisma/                # schema — the persistence-layer source of truth for data shape
```

## Golden pattern — single semantic owner, derived downstream

```ts
// prisma/schema.prisma — the canonical enum definition
enum CrmContactStatus {
  LEAD
  ACTIVE
  INACTIVE
  ARCHIVED
}
```

```ts
// schemas/crmSchemas.ts — derives from the Prisma enum, does not retype it
import { CrmContactStatus } from "@/generated/prisma/enums";

export const contactStatusSchema = z.enum(CrmContactStatus).exclude(["ARCHIVED"]);
```

## Anatomy

- **The Prisma enum is the one place `CrmContactStatus`'s valid values are declared.** Nowhere else in the codebase writes out `"LEAD" | "QUALIFIED" | "ACTIVE" | "ARCHIVED"` as a fresh literal union — every other layer imports this.
- **`z.enum(CrmContactStatus)` derives the runtime schema directly from the Prisma-generated enum**, rather than a hand-typed `z.enum(["LEAD", "QUALIFIED", ...])` that could silently drift from the actual database enum after a migration.
- **`.exclude(["ARCHIVED"])` is an explicit, visible translation, not a silent redefinition** — it says out loud "this form schema deliberately narrows the full set," which is exactly the "explicit, exhaustive mapping" the doctrine requires when a layer needs a different (but derived) shape of the same concept.
- **A migration that adds a new `CrmContactStatus` value** immediately makes every derived schema aware of it (or, where a schema explicitly excludes/maps values, forces a visible decision about whether the new value needs the same treatment) — the compiler and the schema library do the drift-detection work that a hand-maintained set of parallel literal unions cannot.

## Forbidden variants (enforced, not just documented)

- **No hand-written literal union that duplicates a Prisma enum's values.** If the values exist in the schema, every other layer derives from that, or explicitly maps to it — it never gets independently retyped.
- **No workflow reimplementing logic a Fetcher, Action, or integration already owns.** A workflow's job is composition; if it's doing its own database query or provider call inline instead of calling an existing Fetcher/Action/integration function, that's a boundary violation.
- **No provider-name-based placement.** Placement decisions cite the concern (authentication, persistence, provider-specific mechanics), not "because it's Clerk" or "because it's Stripe."
- **No undocumented exception to any of the above.** A deviation is allowed only when it names the specific constraint forcing it and stays as narrow as possible — an undocumented one-off is architecture drift by another name.

## Checklist

- [ ] Any closed vocabulary appearing in more than one layer has an identifiable single owner
- [ ] Every non-owning layer derives from or explicitly, exhaustively maps to that owner — no independent retyping
- [ ] New code is placed by concern (auth, persistence, provider mechanics), not by provider name or convenience
- [ ] Workflows compose existing Fetchers/Actions/integrations rather than reimplementing their logic
- [ ] Any intentional departure from the grammar names its specific forcing constraint in a comment or ADR
