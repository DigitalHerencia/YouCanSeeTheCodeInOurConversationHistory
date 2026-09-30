# Chapter 15: Auth / Authz / Policy

**The Book of Knowledge™**

## Concept

This chapter covers three distinct concerns that are easy to collapse into one but must stay separate: **authentication** (proving who you are), **authorization** (checking what your role permits in general — classic **RBAC**, Role-Based Access Control), and **policy** (checking what you're specifically permitted to do *to this record* — an **ABAC**-flavored layer, Attribute-Based Access Control, since the decision depends on attributes of the resource, like who owns it or is assigned to it, not just the caller's role). A mature system needs all three, applied in that order, every time.

## Why it exists

Conflating authentication with authorization is how "logged in" becomes a synonym for "allowed," which is never true in a multi-tenant system. Conflating role-level authorization with object-level policy is subtler and more common: a role check answers "can a Manager write CRM records," but it can't answer "can *this* Manager write *this specific* CRM record they don't own and aren't assigned to." Systems that only implement the first layer are vulnerable to **Broken Object Level Authorization (BOLA)** — currently the single most common API vulnerability class in the industry (it tops the OWASP API Security Top 10) — because a valid, authenticated, correctly-permissioned user can still reach records that aren't theirs simply by changing an ID in the request.

## Where people get it wrong

The typical shortcut is to check the role once, usually at a route or middleware level, and treat that as sufficient for every operation the route serves. This is exactly the **route-matcher/middleware-as-authorization-boundary** anti-pattern current platform vendor guidance is actively moving away from (Clerk's own current documentation, for example, now recommends against relying on middleware route-matching for authorization, pushing per-resource `.protect()` calls instead) — because middleware runs before the specific resource is known, it can only ever answer the role question, never the object-level question.

## Your stance

Authentication is a single source of truth (`requireIdentity()` / `requireAuthenticatedSession()`), and it is a distinct authentication layer from Clerk, not something reimplemented per feature. Authorization is a static, exhaustive role→permission grant map (a `Set<Permission>` per role) — checked with a single `assertPermission` call that throws rather than returns a boolean, so a missed check fails loudly instead of falling through silently. Policy is a separate function set — `isSameTenant`, `ownsResource`, `isAssignedResource`, `requestedResource` — composed into higher-level checks like `canManageOwnedOrAssignedResource`, and it always runs *after* the specific record has been fetched, never before, because it needs the record's actual attributes to evaluate. A route's middleware/proxy layer does session hydration only — it is never the authorization boundary. That boundary lives inside each Fetcher and Server Action.

## Trade-offs you're accepting

Every protected operation does its own full authorization pass — role check, tenant check, and where relevant an object-level check — even when a very similar-looking operation elsewhere in the codebase just did something adjacent. This is deliberately non-DRY: authorization logic that's factored for reuse tends to get factored wrong for the one case that actually needed a different rule, and the failure mode of over-sharing an authorization check is silent privilege leakage, which is worse than a little repetition.

## See also

Book of Implementation, Chapter 15 — the golden pattern, a worked real-world example (RBAC grant map + object-level policy composition), and the enforced anti-patterns.
