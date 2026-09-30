# Chapter 16: Fetcher

**The Book of Implementation™**

## Placement

Fetchers live under `lib/fetchers/`, one file per domain, named `<domain>Fetchers.ts`.

```text
lib/fetchers/
  crmFetchers.ts
  invoicingFetchers.ts
  adminFetchers.ts
  ...
```

## Golden pattern

```ts
import "server-only";

export async function get<Domain><Entity>(/* narrow, typed params */) {
  return withAuthenticatedRead(async (tx, access) => {
    assertPermission(access, "<domain>:read");

    const rows = await tx.<model>.findMany({
      where: { organizationId: access.organizationId /* + entity filters */ },
      select: <entity>Select,
      orderBy: { /* deterministic order */ },
      take: /* bounded page size */,
    });

    return rows.map(to<Entity>DTO);
  });
}
```

## Anatomy

- **`server-only`** — a compile-time guardrail, not a runtime check; it makes it impossible to accidentally import this module into client-bundled code.
- **`withAuthenticatedRead(...)`** — the authentication + tenant-context wrapper. This is where "who is calling, and inside which organization's data" gets resolved once, instead of per query.
- **`assertPermission(access, "<domain>:read")`** — authorization. Distinct from authentication on purpose: authentication answers *who*, authorization answers *what they're allowed to do*. Collapsing these into one check is a common source of privilege bugs.
- **`select: <entity>Select`** — an explicit projection object, defined once per entity. This is what keeps a schema migration (adding a sensitive column) from silently widening every existing read.
- **`.map(to<Entity>DTO)`** — the DTO mapper. The boundary between "what the database looks like" and "what the application is allowed to see."

## Real worked example

Verified against the live `crmFetchers.ts` in the maximal template — this compiles and runs, it isn't illustrative pseudocode:

```ts
export async function getCrmAccounts(limit = 100) {
  return withAuthenticatedRead(async (tx, access) => {
    assertPermission(access, "crm:read");
    const rows = await tx.crmAccount.findMany({
      where: { organizationId: access.organizationId, archivedAt: null },
      orderBy: { name: "asc" },
      take: Math.min(Math.max(limit, 1), 200),
      select: crmAccountSelect,
    });
    return rows.map(toCrmAccountDTO);
  });
}
```

Note the `Math.min(Math.max(limit, 1), 200)` clamp — this is defense against a caller passing an unbounded or negative page size, which is its own minor denial-of-service vector if left unclamped.

## Purpose-built read rule (avoiding N+1)

Answer aggregate questions with aggregate queries, never by fetching a row set and iterating. Verified against the live `getClosedWonCrmValue` in `lib/fetchers/crmFetchers.ts`:

```ts
export async function getClosedWonCrmValue(periodStart: Date, periodEnd: Date) {
  return withAuthenticatedRead(async (tx, access) => {
    assertPermission(access, "crm:read");

    const result = await tx.crmDeal.aggregate({
      where: {
        organizationId: access.organizationId,
        archivedAt: null,
        stage: "WON",
        closedAt: { gte: periodStart, lte: periodEnd },
      },
      _sum: { value: true },
    });

    return result._sum.value?.toString() ?? "0";
  });
}
```

The database does the summing in one query. The value comes back as a string so a `Decimal` is never coerced through a JavaScript float.

## Forbidden variants (enforced, not just documented)

- **No raw SQL outside `lib/db/**` or `prisma/**`.** Enforced by an ESLint `no-restricted-syntax` rule that matches tagged-template SQL syntax anywhere else in the codebase and fails the build.
- **No calling `prisma` (the root client) directly from a Fetcher.** All reads go through the `tx` handle supplied by `withAuthenticatedRead`, which carries the tenant/RLS context. Bypassing it means bypassing row-level security.
- **No mutation inside a Fetcher.** If a "read" needs to also update a `lastViewedAt` timestamp, that's two operations, not one function with a side effect.
- **No returning a raw Prisma model.** If there's no DTO mapper, that's a signal the entity is missing its data-boundary contract, not a shortcut to take.

## Checklist

- [ ] Wrapped in `withAuthenticatedRead`
- [ ] `assertPermission` call present and scoped to the correct permission string
- [ ] Explicit `select`, no implicit full-row fetch
- [ ] Result passed through a DTO mapper
- [ ] Any caller-supplied filter/limit is validated or clamped
- [ ] Aggregate questions answered with an aggregate query, not row iteration
