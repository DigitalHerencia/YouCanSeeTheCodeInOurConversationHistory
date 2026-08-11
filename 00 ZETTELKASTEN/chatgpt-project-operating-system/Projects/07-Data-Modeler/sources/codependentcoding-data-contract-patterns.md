# Supporting Data and Contract Patterns

Source: `DigitalHerencia/CodependentCoding`, `patterns/11a-data-contract-patterns.md`
Retrieved: 2026-08-11
Authority: user-specific canonical engineering doctrine when the target repository adopts Codependent Coding.

## SP01 - Select definition

Purpose: Define the exact Prisma projection needed by a query, transaction result, or DTO.
Responsibilities: Own selected scalar/nested/count fields and the inferred selected-record type.
Non-responsibilities: No authorization, tenant filtering, query criteria, business rules, DTO shaping, or mutation.
Invariants: Every field is justified; sensitive/provider/internal fields stay absent unless explicitly required; mapper mismatch should fail compilation.
Placement: `lib/db/selects/<domain>.selects.ts`.
Adjacent relationships: Query/Fetcher owns scope/retrieval; Select owns projection; DTO Mapper owns translation; Type owns public shape.
Anti-patterns: Full relation graphs, unrestricted model export, speculative fields, Select containing auth/business logic.

## SP02 - DTO mapper

Purpose: Translate selected persistence or normalized provider records into stable transport-safe DTOs.
Responsibilities: Convert dates, money, enums, nullability, names, nested shapes, counts, and approved derived display-safe values.
Non-responsibilities: No I/O, authorization, transactions, provider calls, cache effects, redirects, or product transitions.
Invariants: Synchronous, deterministic, exhaustive for closed unions, field-explicit, serialization-safe, no whole-record spread.
Security: Omit sensitive fields, recovery metadata, secrets, and raw provider objects unless an approved transport contract requires a safe projection.
Placement: `lib/db/dto/<domain>.dto.ts`.
Anti-patterns: `{...record}`, Prisma Date/Decimal/BigInt leakage, query inside mapper, provider payload passthrough.

## SP03 - Schema

Purpose: Validate and normalize untrusted runtime values at explicit trust boundaries.
Responsibilities: Define accepted shape, bounded values, deliberate coercion, enums, cross-field rules, and normalized output.
Non-responsibilities: No authentication, authorization, tenant ownership, persistence, provider operations, transactions, or lifecycle decisions.
Invariant: Parsing never implies authorization. Parsed actor/tenant/provider IDs still cannot establish authority.

## SP04 - Type

Purpose: Define stable compile-time contracts for domain vocabulary, DTOs, action results, provider-normalized results, security context, and presentation state.
Non-responsibilities: No runtime validation, authorization, serialization execution, data access, or provider behavior.
Invariant: Generated models do not escape through aliases; public/shared types expose only approved fields.

Canonical live source:
https://github.com/DigitalHerencia/CodependentCoding/blob/main/patterns/11a-data-contract-patterns.md
