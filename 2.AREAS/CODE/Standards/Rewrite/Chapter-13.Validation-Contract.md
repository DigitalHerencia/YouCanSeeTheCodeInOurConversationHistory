# Chapter 13: Validation Contract

**The Book of Knowledge™**

## Concept

A Validation Contract is a schema — in this stack, a **Zod** schema — that defines the exact shape, types, and constraints of data crossing a trust boundary, and is the single place that shape is defined. It is distinct from a TypeScript type in a crucial way: a TypeScript type is erased at compile time and enforces nothing at runtime; a Zod schema is a runtime-checked contract that also *produces* a TypeScript type via inference, so the compile-time type and the runtime check can never drift apart from each other.

## Why it exists

Any data arriving from outside the current process — a form submission, a webhook payload, a URL search param, an environment variable — is untrusted until proven otherwise, no matter how strongly typed the client that sent it appears to be. Client-side TypeScript types are a development-time convenience for the client; they impose nothing on what actually arrives over the wire, which could be malformed, truncated, maliciously crafted, or simply stale (produced by an older client version against a schema that has since changed). Validating at the boundary is what turns "probably fine" into "provably fine before another line of code runs."

## Where people get it wrong

A common shortcut is validating only the fields the developer remembers are important — an email format, say — while leaving numeric ranges, string lengths, or enum membership unchecked, which is how a negative quantity or a 10,000-character "name" field ends up in the database. Another common gap is validating shape but not semantic constraints that only make sense together (a currency code that must be exactly 3 letters and uppercase, a money value that must be a non-negative decimal string with bounded precision) — general-purpose "just a string" typing misses exactly the constraints that matter.

The much larger version of this same mistake, at the database layer rather than the request layer, is trusting that application-level tenant filtering is sufficient and never actually testing that a different tenant's row is unreachable. That has to be verified against a real Postgres instance with RLS enabled — a mocked database can't tell you whether your RLS policies are correctly written, because a mock has no policies to enforce or fail to enforce.

## Your stance

Every external input is parsed through a Zod schema before it is used — not just checked with an `if`, parsed, so that a validation failure throws immediately with a structured error rather than continuing with partially-trusted data. Schemas encode real domain constraints, not just types: bounded string lengths, numeric ranges via `.min()`/`.max()`, coerced and defaulted query parameters (`z.coerce.number().int().min(1).max(200).default(100)` for a page size, for example), and semantic transforms where useful (uppercasing a currency code on parse rather than validating it's already uppercase). Separately, and just as non-negotiable: cross-tenant data isolation is verified with real integration tests against a real Postgres database with RLS enabled — asserting that a query executed under Tenant A's session context genuinely cannot see Tenant B's rows — not asserted only in application-level unit tests with the database mocked out.

## Trade-offs you're accepting

Writing a precise schema (with real bounds, not just `z.string()`) takes longer than writing a loose one, and a real-Postgres RLS test suite is slower and more infrastructure-dependent than an all-mocked unit test suite. You're accepting both costs because a loose schema and a mocked-database test suite can both pass green while a real vulnerability sits underneath them undetected.

## See also

Book of Implementation, Chapter 13 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
