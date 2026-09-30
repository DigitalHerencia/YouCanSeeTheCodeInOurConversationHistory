# Chapter 13: Validation Contract

**The Book of Implementation™**

## Placement

```text
schemas/
  crmSchemas.ts
  invoicingSchemas.ts
  socialSchemas.ts
  adminSchemas.ts
  integrationSchemas.ts
  ...
```

## Golden pattern — form/mutation schema with real domain constraints

```ts
import { z } from "zod";

const uuid = z.string().uuid();

export const <entity>FormSchema = z.object({
  name: z.string().trim().min(1, "Name is required.").max(100),
  email: z.union([z.literal(""), z.string().trim().email()]),
  <numericField>: z
    .string()
    .regex(/^\d+(\.\d{1,4})?$/, "Expected a non-negative decimal."),
});

export const update<Entity>Schema = <entity>FormSchema.extend({
  <entity>Id: uuid,
  expectedUpdatedAt: z.coerce.date(),
});
```

## Golden pattern — bounded, coerced list-query schema

```ts
export const <entity>ListCriteriaSchema = z.object({
  query: z.string().trim().max(100).default(""),
  status: <statusEnum>.optional(),
  sort: z.enum(<sortValues>).default("<default-sort>"),
  limit: z.coerce.number().int().min(1).max(200).default(100),
});
```

## Anatomy

- **`.trim()` before length/format checks** — normalizes whitespace before the constraint that actually matters is evaluated, so `"  "` doesn't slip past a naive non-empty check.
- **`z.union([z.literal(""), z.string().email()])` for an optional email field** — models "empty is valid, but if present it must be a real email" precisely, rather than a looser `.optional()` that would also accept a malformed non-empty string.
- **A dedicated regex for a money value, as a string, not `z.number()`** — floating-point numbers lose precision for currency; keeping it a validated decimal string (with a bounded number of decimal places) avoids an entire class of rounding bugs.
- **`z.coerce.number().int().min(1).max(200).default(100)` on a `limit` param** — coerces a string query param into a number, then bounds it, in one declaration. This is also the schema-level version of the clamp seen in the Fetcher chapter — belt-and-suspenders, not redundant, since a Fetcher can be called from code paths that don't go through this schema at all.
- **`update<Entity>Schema` extends the form schema with an id and `expectedUpdatedAt`** — the optimistic-concurrency field from the Server Action chapter is validated here too, so a malformed or missing version can't even reach the transaction.

## Real worked example

Verified against the live `crmSchemas.ts` in the maximal template:

```ts
const currency = z.string().length(3).transform((value) => value.toUpperCase());
const money = z.string().regex(/^\d+(\.\d{1,4})?$/, "Expected a non-negative decimal.");

export const contactStatusSchema = z.enum(CrmContactStatus).exclude(["ARCHIVED"]);

export const contactListCriteriaSchema = z.object({
  query: z.string().trim().max(100).default(""),
  status: contactStatusSchema.optional(),
  sort: z.enum(contactSortValues).default("name-asc"),
  limit: z.coerce.number().int().min(1).max(200).default(100),
});

export const contactFormSchema = z.object({
  firstName: z.string().trim().min(1, "First name is required.").max(100),
  lastName: z.string().trim().min(1, "Last name is required.").max(100),
  email: z.union([z.literal(""), z.string().trim().email()]),
  phone: z.string().trim().max(50),
  title: z.string().trim().max(150),
  status: contactStatusSchema,
});
```

Note `contactStatusSchema` explicitly excludes `"ARCHIVED"` from the set a form can submit — archiving is a distinct, separately-authorized operation (per the Server Action chapter), not a value a generic update should be able to set directly.

## Real-Postgres RLS test — golden pattern

```ts
// integration test, run against a real Postgres instance with RLS enabled — never mocked
test("tenant A cannot read tenant B's CRM accounts", async () => {
  await setTenantSessionContext(tenantAContext); // sets the same GUCs as withTenantTransaction
  const rows = await prisma.crmAccount.findMany({ where: { organizationId: tenantBOrgId } });
  expect(rows).toHaveLength(0); // RLS policy must block this, independent of the app-level filter
});
```

## ⚠ Gap flagged, not yet closed

The doctrine's own stance requires exactly this kind of real-Postgres, RLS-enabled cross-tenant test. Checked against the live template's `tests/` directory (`domain-workflows.test.ts`, `onboarding.test.ts`, `auth-webhooks.integration.test.ts`) — none of the three currently contain a dedicated cross-tenant RLS isolation test. This is a genuine gap between the doctrine as written and the current implementation, not a documentation nitpick: the pattern above is the shape that test needs to take, but it doesn't exist in the repo yet.

## Forbidden variants (enforced, not just documented)

- **No `z.any()` or untyped `unknown` passed through without a schema.** If a field's shape genuinely can't be constrained further, that's a signal to narrow the schema, not to skip it.
- **No numeric money field typed as `z.number()`.** Use a bounded decimal string, as above.
- **No unbounded `limit`/pagination parameter.** Always `.max()`-bounded, matching the clamp enforced independently in the Fetcher.
- **No cross-tenant isolation claim considered verified by a mocked-database unit test.** Only a real-Postgres, RLS-enabled integration test counts.

## Checklist

- [ ] Every external input parsed through a Zod schema before use, not merely typed
- [ ] String fields have realistic `.min()`/`.max()` bounds, not left unbounded
- [ ] Numeric/currency fields use appropriately precise types (bounded decimal strings for money)
- [ ] List/query schemas coerce and bound any client-supplied limit or page size
- [ ] A real-Postgres RLS cross-tenant test exists for any table with a tenant-scoping policy
