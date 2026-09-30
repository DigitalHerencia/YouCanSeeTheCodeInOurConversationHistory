# Chapter 20: Transaction Helper

**The Book of Knowledge™**

## Concept

A Transaction Helper is the single function that opens a database transaction and, inside it, establishes the caller's **tenant context** as actual Postgres session state — not just an application-level variable. It does this by setting **session-scoped configuration parameters** (Postgres's `set_config`, GUCs — Grand Unified Configuration variables) that **Row-Level Security (RLS)** policies on the tables then read to decide which rows a query is even allowed to see. Every subsequent query inside that transaction runs under both the caller's application-level identity *and* a database-enforced tenant boundary.

## Why it exists

This is the concrete mechanism behind the invariant "RLS is containment, not authority" — a phrase that sounds abstract until you see what it means in code: your application code still does the real authorization decision (Chapter 15's role/policy checks); RLS is a second, independent enforcement layer that would still block a cross-tenant row *even if the application-level check had a bug*. Without this, a single missed `where organizationId: ...` clause anywhere in the codebase is a full cross-tenant data leak. With it, that same bug is caught at the database layer before the row ever reaches your code — this is **defense in depth**, and it's the difference between one wall and two.

The reason the tenant context is set as a Postgres session variable rather than just an application variable is that `set_config(..., true)` with the `true` (local) flag scopes it to the current transaction only — it cannot leak into a different request's connection if the connection is later reused from a pool, which a naive global/session-level setting could.

## Where people get it wrong

The common shortcut is to trust RLS alone and skip the explicit `where organizationId` filter in queries, reasoning "the database will filter it anyway." This is backwards for two reasons: it makes queries silently depend on RLS being correctly configured for every single table and policy, which is a much larger and more fragile surface than checking it explicitly in code, and it means a bug in the RLS policy itself (not uncommon — RLS policies are easy to get subtly wrong) has no second layer catching it. The opposite shortcut — application-level filtering with RLS disabled or absent — has the same single-point-of-failure problem in the other direction.

## Your stance

Every tenant-scoped operation runs inside `withTenantTransaction`, which: resolves the caller's identity, sets the Postgres session GUCs for both user and organization scope as the very first statements inside the transaction, resolves the caller's active membership and role, and only then hands control to the actual query/mutation logic — with both the transaction client and a fully-resolved `AccessContext` (organization id, membership id, role) passed in. Application code still filters explicitly by `organizationId` in every query. RLS is the backstop, not the only check.

## Trade-offs you're accepting

Every transaction pays the cost of an extra round-trip (or two) to set session config and resolve membership before the "real" work starts. For a single cheap read this overhead is proportionally significant. You're accepting it because the alternative — skipping the RLS context setup for "just this one simple read" — is exactly the kind of exception that becomes the one query nobody remembers to fix when a new tenant-scoping requirement shows up later.

## See also

Book of Implementation, Chapter 20 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
