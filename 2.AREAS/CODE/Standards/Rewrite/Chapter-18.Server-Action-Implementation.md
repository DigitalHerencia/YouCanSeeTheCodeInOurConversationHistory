# Chapter 18: Server Action

**The Book of Implementation™**

## Placement

Server Actions live under `lib/actions/`, one file per domain, named `<domain>Actions.ts`, marked `"use server"` at the top of the file.

```text
lib/actions/
  crmActions.ts
  supportActions.ts
  projectsActions.ts
  ...
```

## Golden pattern — create

```ts
"use server";

export async function create<Entity>(rawInput: unknown) {
  const input = <entity>FormSchema.parse(rawInput);
  const identity = await requireIdentity();
  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "<domain>:write");
    const record = await tx.<model>.create({
      data: { organizationId: access.organizationId, /* + input fields */ },
      select: <entity>Select,
    });
    return to<Entity>DTO(record);
  });
}
```

## Golden pattern — update (with ownership check + optimistic concurrency)

```ts
export async function update<Entity>(rawInput: unknown) {
  const input = update<Entity>Schema.parse(rawInput);
  const identity = await requireIdentity();
  return withTenantTransaction(identity, async (tx, access) => {
    const existing = await tx.<model>.findFirst({
      where: { id: input.id, organizationId: access.organizationId, archivedAt: null },
      select: { organizationId: true, ownerMembershipId: true },
    });
    if (!existing) throw new ResourceNotFoundError("<Entity>");

    authorizeOwnedOrAssignedWrite(access, "<domain>:write", { kind: "<domain>", ...existing });

    const result = await tx.<model>.updateMany({
      where: {
        id: input.id,
        organizationId: access.organizationId,
        updatedAt: input.expectedUpdatedAt, // optimistic concurrency guard
        archivedAt: null,
      },
      data: { /* input fields */ },
    });
    if (result.count !== 1) throw new ConcurrencyConflictError("<Entity>");
    return to<Entity>DTO(
      await tx.<model>.findFirstOrThrow({
        where: { id: input.id, organizationId: access.organizationId },
        select: <entity>Select,
      }),
    );
  });
}
```

## Anatomy

- **`.parse(rawInput)` before anything else** — untrusted input is rejected at the door. `rawInput: unknown` (not a loosely-typed object) is intentional: it forces every caller through the schema, there's no typed shortcut around it.
- **`requireIdentity()`** — authentication. Resolves *who* is calling, independent of what they're asking to do.
- **`withTenantTransaction(identity, ...)`** — opens the tenant-scoped transaction; everything inside runs against the caller's organization, never a global unscoped context.
- **`assertPermission` (create) vs `authorizeOwnedOrAssignedWrite` (update)** — create only needs a general write permission; update needs an *object-level* check against the specific record's ownership/assignment, which is why the record is fetched first.
- **`updatedAt: input.expectedUpdatedAt` in the `updateMany` where-clause** — the optimistic concurrency guard. If another write has already changed the row, this clause matches zero rows instead of overwriting silently.
- **`result.count !== 1` → `ConcurrencyConflictError`** — the concurrency check has teeth: a lost race is a thrown, typed error (defined in `lib/db/transactions/errors.ts`) the caller has to handle, not a silent no-op. The update then re-reads the row and returns it through the DTO mapper, so the caller gets the new `updatedAt` for its next edit.

## Real worked example

Verified against the live `crmActions.ts` in the maximal template:

```ts
export async function createCrmAccount(rawInput: unknown) {
  const input = crmAccountFormSchema.parse(rawInput);
  const identity = await requireIdentity();
  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "crm:write");
    const record = await tx.crmAccount.create({
      data: {
        organizationId: access.organizationId,
        ownerMembershipId: access.membershipId,
        name: input.name,
        website: input.website || null,
        industry: input.industry || null,
        notes: input.notes || null,
      },
      select: crmAccountSelect,
    });
    return toCrmAccountDTO(record);
  });
}

export async function updateCrmAccount(rawInput: unknown) {
  const input = updateCrmAccountSchema.parse(rawInput);
  const identity = await requireIdentity();
  return withTenantTransaction(identity, async (tx, access) => {
    const existing = await tx.crmAccount.findFirst({
      where: { id: input.accountId, organizationId: access.organizationId, archivedAt: null },
      select: { organizationId: true, ownerMembershipId: true },
    });
    if (!existing) throw new ResourceNotFoundError("Account");

    authorizeOwnedOrAssignedWrite(access, "crm:write", { kind: "crm", ...existing });

    const result = await tx.crmAccount.updateMany({
      where: {
        id: input.accountId,
        organizationId: access.organizationId,
        updatedAt: input.expectedUpdatedAt,
        archivedAt: null,
      },
      data: {
        name: input.name,
        website: input.website || null,
        industry: input.industry || null,
        notes: input.notes || null,
      },
    });
    if (result.count !== 1) throw new ConcurrencyConflictError("Account");
    return toCrmAccountDTO(
      await tx.crmAccount.findFirstOrThrow({
        where: { id: input.accountId, organizationId: access.organizationId },
        select: crmAccountSelect,
      }),
    );
  });
}
```

## Forbidden variants (enforced, not just documented)

- **No `rawInput` used before `.parse()`.** Reading any field off the unvalidated payload before the schema has run defeats the entire point of the boundary.
- **No permission check via `assertPermission` alone on an update/delete.** General write permission is necessary but not sufficient for object-level operations — ownership/assignment must be checked against the actual record.
- **No naive `update` by id without an `updatedAt` (or equivalent version) guard** on any record more than one user can plausibly edit.
- **No returning a raw Prisma record from an Action** — same DTO-boundary rule as Fetchers.
- **No business logic inside the transaction that makes an outbound network call** (payment provider, webhook, email) — that belongs after the transaction commits, never inside it.

## Checklist

- [ ] Input parsed with the schema before any other line executes
- [ ] Identity resolved via `requireIdentity()`
- [ ] Tenant-scoped transaction used for the write
- [ ] Create: general permission check present
- [ ] Update/delete: record re-fetched and object-level ownership/assignment check present
- [ ] Update: optimistic concurrency guard present, with a typed conflict error on failure
- [ ] Result mapped through a DTO
- [ ] No network calls inside the transaction
