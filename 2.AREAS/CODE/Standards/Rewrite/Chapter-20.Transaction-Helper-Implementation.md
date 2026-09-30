# Chapter 20: Transaction Helper

**The Book of Implementation™**

## Placement

```text
lib/db/
  client.ts        # Prisma client singleton
  tenant.ts         # withTenantTransaction / withAuthenticatedRead
  transactions/     # named, multi-step transactional helpers (one concern each)
  selects/          # explicit Prisma select objects, per entity
  dto/              # DTO mappers, per entity
```

## Golden pattern — the tenant transaction wrapper itself

```ts
import "server-only";

async function resolveAccessContext(
  tx: Prisma.TransactionClient,
  identity: AuthenticatedIdentity,
): Promise<AccessContext> {
  await tx.$queryRaw`SELECT set_config('app.clerk_user_id', ${identity.clerkUserId}, true)`;

  const user = await tx.user.findUnique({
    where: { clerkUserId: identity.clerkUserId },
    select: { id: true },
  });
  if (!user) throw new TenantContextError("Authenticated user is not provisioned.");

  const membership = await tx.membership.findFirst({
    where: { userId: user.id, status: "ACTIVE" },
    orderBy: [{ createdAt: "asc" }, { id: "asc" }],
    select: { id: true, organizationId: true, role: true },
  });
  if (!membership) throw new TenantContextError("No active membership.");

  await tx.$queryRaw`SELECT set_config('app.organization_id', ${membership.organizationId}, true)`;

  return {
    clerkUserId: identity.clerkUserId,
    organizationId: membership.organizationId,
    membershipId: membership.id,
    userId: user.id,
    role: membership.role as AppRole,
  };
}

export async function withTenantTransaction<T>(
  identity: AuthenticatedIdentity,
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return prisma.$transaction(
    async (tx) => work(tx, await resolveAccessContext(tx, identity)),
    { maxWait: 5_000, timeout: 15_000 },
  );
}

export async function withAuthenticatedRead<T>(
  read: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return withTenantTransaction(await requireIdentity(), read);
}
```

## Anatomy

- **`set_config(..., true)` — the third argument is `is_local`.** `true` scopes the setting to the current transaction only; it's automatically cleared at commit/rollback. This is what makes it safe under connection pooling, where a physical connection is reused by a different request afterward.
- **GUCs are set before any tenant-scoped query runs**, and in the same transaction those queries execute in — RLS policies reference these same `app.clerk_user_id` / `app.organization_id` settings via `current_setting(...)` inside the policy definition.
- **Membership resolution happens inside the transaction, using the `tx` handle** — not the raw `prisma` client — so it's subject to the same GUC-scoped session as everything that follows.
- **`maxWait` / `timeout`** bound how long Prisma will wait for a transaction slot and how long the transaction itself may run — an explicit ceiling against a hung transaction holding a connection indefinitely.
- **`withAuthenticatedRead` is a thin specialization of `withTenantTransaction`** for the read path — same GUC/context setup, just pre-wired with `requireIdentity()` so Fetchers don't repeat that call.

## Real worked example — a named multi-step transactional helper

Verified against the live `addPortalVersionTx` in the template — this composes an optimistic-concurrency read, a related-resource check, an insert, and a versioned update, all inside one tenant transaction:

```ts
export async function addPortalVersionTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    membershipId: string;
    documentId: string;
    assetId: string;
    notes?: string | null;
    expectedVersion: number;
  },
) {
  const document = await tx.portalDocument.findFirst({
    where: { id: input.documentId, organizationId: input.organizationId, version: input.expectedVersion },
    select: { id: true, currentVersionNumber: true },
  });
  if (!document) throw new ConcurrencyConflictError("Portal document");

  const asset = await tx.asset.findFirst({
    where: { id: input.assetId, organizationId: input.organizationId },
    select: { id: true },
  });
  if (!asset) throw new ResourceNotFoundError("Asset");

  const nextVersion = document.currentVersionNumber + 1;

  await tx.portalDocumentVersion.create({
    data: {
      organizationId: input.organizationId,
      documentId: input.documentId,
      assetId: input.assetId,
      uploadedByMembershipId: input.membershipId,
      versionNumber: nextVersion,
      notes: input.notes ?? null,
    },
  });

  const result = await tx.portalDocument.updateMany({
    where: { id: input.documentId, organizationId: input.organizationId, version: input.expectedVersion },
    data: { currentVersionNumber: nextVersion, status: "IN_REVIEW", version: { increment: 1 } },
  });

  if (result.count !== 1) throw new ConcurrencyConflictError("Portal document");

  return tx.portalDocument.findFirstOrThrow({ where: { id: input.documentId } /* ...select */ });
}
```

Notice this named helper takes `tx` as a parameter rather than opening its own transaction — it's meant to be *called from inside* an already-open `withTenantTransaction` block, composing with other steps atomically, not a standalone entry point.

## Gap flagged, not yet closed: nothing guarantees the runtime role is subject to RLS

This is the most important finding in the chapter pass so far, so it is stated plainly.

What the repo does correctly: the `tenant_rls` migration runs `ENABLE ROW LEVEL SECURITY` and `FORCE ROW LEVEL SECURITY` on the tenant tables, policies key off the same `app.clerk_user_id` and `app.organization_id` settings that `withTenantTransaction` sets, and `.env.example` separates a pooled runtime `DATABASE_URL` from a `DIRECT_DATABASE_URL` for migrations.

What is missing: no migration, script, or code anywhere in the template creates a restricted runtime role, grants it table privileges, or checks which role the app connected as. A search for `BYPASSRLS`, `CREATE ROLE`, `GRANT`, and `neondb_owner` across the repo returns nothing relevant.

Why it matters: Postgres documents that superusers and roles with the `BYPASSRLS` attribute always bypass row security, and `FORCE ROW LEVEL SECURITY` only subjects the table *owner* to policies. It does nothing for a `BYPASSRLS` role. Neon's documentation says its default role (`neondb_owner`) belongs to `neon_superuser`, which carries `BYPASSRLS`, and recommends creating a separate application role without it. If the deployed `DATABASE_URL` uses `neondb_owner`, every policy in the migration is skipped, and the only thing separating tenants is the explicit `organizationId` filter in application code. The "second layer" this chapter describes would exist on paper and enforce nothing.

I cannot see your deployed credentials, so this is "not guaranteed by the repo," not "confirmed broken." The real-Postgres cross-tenant test flagged in Chapter 13 would answer it immediately, because it would fail if the runtime role bypasses RLS.

The fix, in the shape Neon's guidance describes:

```sql
-- run once as the owner / migration role
CREATE ROLE app_runtime LOGIN PASSWORD '<from secret store>' NOBYPASSRLS;
GRANT USAGE ON SCHEMA public TO app_runtime;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_runtime;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_runtime;
```

```ts
// lib/db/client.ts: refuse to start as an owner/admin role
const role = new URL(connectionString).username;
if (["neondb_owner", "postgres"].includes(role)) {
  throw new Error(`App must not connect as ${role}; use the restricted runtime role.`);
}
```

Point `DATABASE_URL` at `app_runtime` everywhere (previews included) and keep the owner role only in `DIRECT_DATABASE_URL` for migrations. Verify the grants match your own table list before relying on the snippet above.

## Forbidden variants (enforced, not just documented)

- **No query against `prisma` (the untransacted root client) for anything tenant-scoped.** Only the `tx` handle inside `withTenantTransaction` carries the RLS session context.
- **No network/provider calls (Stripe, email, webhooks) inside a transaction block.** A transaction should be short and entirely database-local; an external call inside it holds a connection open for an unpredictable duration and can't be rolled back if it partially succeeds.
- **No skipping the explicit `organizationId` filter in a query "because RLS will catch it."** RLS is the second layer, not the only one.
- **No transactional helper that opens its own `$transaction` when it's meant to be composed inside another.** Helpers like `addPortalVersionTx` take `tx` as an argument for exactly this reason.

## Checklist

- [ ] Operation runs through `withTenantTransaction` or `withAuthenticatedRead`, never a bare `prisma` call
- [ ] Every query inside still includes an explicit `organizationId` filter
- [ ] No network/provider call appears anywhere inside the transaction body
- [ ] Any reusable multi-step helper accepts `tx` as a parameter rather than opening its own transaction
- [ ] Concurrency-sensitive updates use a version/timestamp guard and throw a typed conflict error on mismatch
