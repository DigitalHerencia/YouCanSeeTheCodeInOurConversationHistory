# Chapter 15: Auth / Authz / Policy

**The Book of Implementation™**

## Placement

```text
lib/auth/
  clerk.ts       # instantiates the Clerk client
  auth.ts        # identity + session resolution
  redirects.ts   # Clerk auth redirects
  clerk-webhooks.ts

lib/authz/
  roles.ts        # role hierarchy
  resources.ts     # resource kind descriptors
  permissions.ts    # role → permission grant map + assertPermission
  policies.ts       # object-level (ownership/assignment) checks
```

## Golden pattern — authentication (identity only, no role/permission)

```ts
import "server-only";
import { auth } from "@clerk/nextjs/server";

export class AuthenticationRequiredError extends Error {
  constructor() { super("Authentication is required."); this.name = "AuthenticationRequiredError"; }
}

export async function requireIdentity(): Promise<AuthenticatedIdentity> {
  const { isAuthenticated, userId } = await auth();
  if (!isAuthenticated || !userId) throw new AuthenticationRequiredError();
  return { clerkUserId: userId };
}
```

## Golden pattern — role-based authorization (static grant map)

```ts
export const permissions = ["<domain>:read", "<domain>:write", /* ... */] as const;

const grants: Record<AppRole, ReadonlySet<Permission>> = {
  OWNER: new Set(permissions),
  ADMIN: new Set(permissions),
  MANAGER: new Set([/* subset */]),
  MEMBER: new Set([/* narrower subset */]),
};

export class AuthorizationError extends Error {
  constructor(permission: Permission) { super(`Missing required permission: ${permission}`); this.name = "AuthorizationError"; }
}

export function hasPermission(context: AccessContext, permission: Permission): boolean {
  return grants[context.role].has(permission);
}

export function assertPermission(context: AccessContext, permission: Permission): void {
  if (!hasPermission(context, permission)) throw new AuthorizationError(permission);
}
```

## Golden pattern — object-level policy (attribute checks + composition)

```ts
export function isSameTenant(context: AccessContext, resource: ResourceAccessDescriptor): boolean {
  return context.organizationId === resource.organizationId;
}

export function ownsResource(context: AccessContext, resource: ResourceAccessDescriptor): boolean {
  return resource.ownerMembershipId === context.membershipId;
}

export function isAssignedResource(context: AccessContext, resource: ResourceAccessDescriptor): boolean {
  return resource.assigneeMembershipId === context.membershipId;
}

export function canManageOwnedOrAssignedResource(
  context: AccessContext,
  resource: ResourceAccessDescriptor,
): boolean {
  if (!isSameTenant(context, resource)) return false;
  return (
    isPrivilegedRole(context.role) ||
    context.role === "MANAGER" ||
    ownsResource(context, resource) ||
    isAssignedResource(context, resource)
  );
}

export function authorizeOwnedOrAssignedWrite(
  context: AccessContext,
  permission: Permission,
  resource: ResourceAccessDescriptor,
): void {
  assertPermission(context, permission);          // layer 2: role
  if (!canManageOwnedOrAssignedResource(context, resource)) { // layer 3: object policy
    throw new ResourceAuthorizationError(resource);
  }
}
```

## Anatomy

- **`requireIdentity` throws, doesn't return null-and-hope** — every caller is forced to handle the unauthenticated case; there's no code path where a missing identity silently continues.
- **`grants` is a static, exhaustive map, not computed per-request** — the full permission surface for every role is visible in one file, which is what makes it auditable at a glance.
- **`assertPermission` throws a typed error rather than returning a boolean** — a forgotten check fails loudly (unhandled exception, 500/redirect) instead of silently letting an unauthorized request fall through an `if` that was never written.
- **Policy functions take the resource as a plain descriptor, not a live Prisma record** — this keeps the policy layer decoupled from the ORM, so it's pure, trivially testable, and reusable across every domain.
- **`authorizeOwnedOrAssignedWrite` composes layers 2 and 3 explicitly, in order** — role check first (cheap, no DB needed beyond what's already loaded), object check second (needs the actual record, fetched by the caller before this runs).

## Real worked example

Verified against the live `permissions.ts` and `policies.ts` in the maximal template — this is the actual grant map and composed policy check used by the CRM `updateCrmAccount` action from Chapter 18:

```ts
// permissions.ts — role grant map (excerpt)
export const permissions = [
  "organization:read", "organization:write",
  "crm:read", "crm:write",
  "projects:read", "projects:write",
  // ...
] as const;

const grants: Record<AppRole, ReadonlySet<Permission>> = {
  OWNER: new Set(permissions),
  ADMIN: new Set(permissions),
  MANAGER: new Set(["organization:read", "crm:read", "crm:write", /* ... */]),
  MEMBER: new Set(["organization:read", "crm:read", "crm:write", /* ... */]),
};

// policies.ts — object-level check
export function canManageOwnedOrAssignedResource(context, resource) {
  if (!isSameTenant(context, resource)) return false;
  return (
    isPrivilegedRole(context.role) ||
    context.role === "MANAGER" ||
    ownsResource(context, resource) ||
    isAssignedResource(context, resource) ||
    (context.role === "CLIENT" && requestedResource(context, resource))
  );
}
```

Note the `CLIENT` role gets a fourth path — `requestedResource` — that no other role has. This is the object-level layer doing something a pure RBAC role check structurally cannot: granting access based on a relationship (being the person who *requested* something) rather than membership or ownership.

## Forbidden variants (enforced, not just documented)

- **No relying on `proxy.ts` / middleware for authorization.** It handles Clerk session hydration only. Every Fetcher and Server Action performs its own `assertPermission` and, where applicable, object-level policy check.
- **No object-level check without first fetching the actual resource.** `canManageOwnedOrAssignedResource` cannot evaluate ownership against a resource that hasn't been loaded from the tenant-scoped transaction.
- **No permission check that returns a boolean silently ignored.** Use `assertPermission`, which throws; a boolean invites an unchecked `if` to be skipped by mistake.
- **No cross-tenant comparison skipped.** `isSameTenant` is checked first in every composed policy function, before any ownership/assignment logic runs.

## Checklist

- [ ] Identity resolved via `requireIdentity()` before any authorization logic runs
- [ ] Role-level `assertPermission` call present for the specific permission string needed
- [ ] For anything beyond create: resource fetched first, then `isSameTenant` + ownership/assignment checked
- [ ] Any thrown authorization/authentication error is a typed error class, not a generic `Error` or silent `null`
- [ ] No authorization logic present in `proxy.ts` or any middleware
