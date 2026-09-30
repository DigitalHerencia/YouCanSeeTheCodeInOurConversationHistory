# Chapter 23: Tech Stack Map

**The Book of Knowledge™**

## Concept

A Tech Stack Map is the explicit statement that **technology serves architectural responsibility; it does not define it**. Every dependency in the stack is bound to a specific concern from the Architecture Contract (Chapter 03), and — just as importantly — has an explicit list of things it is *not* trusted for. This is the difference between choosing tools because they're popular and choosing tools because each one closes a specific, named capability gap with a clear boundary.

## Why it exists

Without this discipline, tools accrete authority they were never designed to hold — the classic version being "Clerk says the user is logged in, so the route must be fine," which quietly promotes an authentication provider into an authorization and tenancy-truth system it was never built to be (this is the exact anti-pattern the profile/proxy discussion in Chapter 15 addresses directly). The senior-level habit this chapter names is asking, for every dependency, not just "what does this do" but "what is this the *source of truth* for, and what would go wrong if I let it be the source of truth for something else."

## Where people get it wrong

The common mistake is conflating a tool's convenience API with an architectural guarantee — e.g., trusting a client-side form library's validation as if it were the actual security boundary, when React Hook Form's job is UX (inline errors, submission state), not trust enforcement; the real validation contract is the Zod schema re-run on the server (Chapter 13), independent of whatever the client already checked. Another common mistake is letting a payment provider's client-side redirect (a "success" callback URL) be treated as proof a payment succeeded — provider truth arrives through the webhook, not the redirect, precisely because a redirect is a client-controlled navigation event, not a server-verified fact.

## Your stance

- **TypeScript** — compile-time contracts. It proves nothing about what actually arrives at runtime; runtime trust is Zod's job.
- **Next.js App Router (v16)** — route/framework boundaries and rendering effects (RSC, streaming, caching). It does not own domain policy.
- **React (v19, with the React Compiler)** — rendering and composition. Not business truth; the server remains the source of truth regardless of client-side state.
- **Neon Postgres** — durable application state, constraints, transactions, and RLS as the second enforcement layer (Chapter 20).
- **Prisma** — typed, approved persistence access. Not a source of public DTOs (Chapter 16's DTO mapping still applies) and not an authorization mechanism by itself.
- **Clerk** — authentication and external identity only. Not tenant membership, not RBAC, not billing truth (Chapter 15).
- **Stripe** — provider billing/payment truth, delivered via webhook (Chapter 21). Not product entitlement policy — what a plan unlocks is your own application's decision, informed by Stripe's data, not dictated by it.
- **Zod** — runtime shape and constraint validation (Chapter 13). Not authentication or authorization.
- **React Hook Form** — client-side form state and UX. Not the validation boundary; the Zod schema re-validated server-side is.
- **Tailwind v4 / shadcn/Radix** — presentation and accessibility primitives. Not business logic; a disabled button's styling is not the authorization check.
- **Vitest / Playwright / ESLint / Prettier** — evidence and tooling, scoped to what they actually check (Chapter 12's evidence-state discipline applies to their output too).
- **GitHub / GitHub Actions / Vercel** — delivery, review, and deployment infrastructure. Not application architecture.

A dependency earns a place in the stack only when it fills a defined capability gap with a named owner, an explicit boundary, understood security/operational consequences, a validation story, and a known removal/replacement path. A package is not architecture by virtue of being added to `package.json`.

## Trade-offs you're accepting

Naming what each tool is explicitly *not* trusted for means occasionally writing a small amount of redundant-looking code — re-validating on the server what a client library already checked, re-deriving entitlement from your own data instead of trusting a provider's redirect. That redundancy is the cost of not letting any single vendor's convenience feature quietly become your security boundary.

## See also

Book of Implementation, Chapter 23 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
