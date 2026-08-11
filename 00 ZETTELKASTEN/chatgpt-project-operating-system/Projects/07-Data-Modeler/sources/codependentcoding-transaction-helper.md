# Pattern 004: Transaction Helper

Source: `DigitalHerencia/CodependentCoding`, `patterns/04-transaction-helper.md`
Retrieved: 2026-08-11
Authority: user-specific canonical engineering doctrine when the target repository adopts Codependent Coding.

Purpose: A transaction helper defines database facts that must succeed or fail together, especially concurrent lifecycle changes.

Responsibilities:
- Accept `Prisma.TransactionClient` first.
- Perform atomic reads/writes.
- Assert expected tenant/state/version.
- Enforce database-adjacent invariants.
- Write audit/outbox atomically where required.
- Return a minimal selected persistence result.

Non-responsibilities:
- No root Prisma client union, Clerk, React, Next.js, network/provider calls, email, cache invalidation, raw FormData, user-facing formatting, or broad workflow sequence.

Concurrency:
Use unique/check/FK constraints, conditional update predicates, optimistic versions, appropriate locks/isolation, and bounded retries only for known safe serialization errors. Tenant context is transaction-local.

Critical invariant:
Do not hold a database transaction open across network/provider calls.

Placement: `lib/db/transactions/<imperative>.tx.ts`.

Canonical live source:
https://github.com/DigitalHerencia/CodependentCoding/blob/main/patterns/04-transaction-helper.md
