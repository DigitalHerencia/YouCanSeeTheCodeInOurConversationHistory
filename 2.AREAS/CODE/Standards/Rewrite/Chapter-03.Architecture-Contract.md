# Chapter 03: Architecture Contract

**The Book of Knowledge™**

## Concept

Architecture is the set of responsibility boundaries, dependency directions, and ownership rules that hold regardless of how the directory tree happens to be arranged on a given day — the folder structure is *evidence* of the architecture, not the architecture itself. The core discipline this chapter names is what's often called **single source of truth for domain vocabulary**: any closed set of values or business invariant (an enum, a status lifecycle, a permission name) has exactly one place that defines it, and every other representation of that same concept — a TypeScript union, a Zod schema, a Prisma enum, a UI label — either derives from that one place or translates it through an explicit, exhaustive mapping. It never gets independently redefined.

## Why it exists

The specific failure mode this prevents is **semantic drift**: the same real-world concept (say, a contact's lifecycle status) gets typed once in Prisma, again in a Zod schema, again in a TypeScript union for the frontend, and again as literal strings in a few UI components — each individually valid, until someone adds a new status value in one place and the others silently fall out of sync. This isn't caught by any single file's type-checker, because each file is internally consistent; it's only visible as a runtime bug when a value valid in one layer is unrecognized in another. Deriving every downstream representation from one canonical source turns that entire class of bug into a compile error the moment the two diverge.

## Where people get it wrong

The common shortcut is retyping a concept locally because it's faster than importing and re-deriving it — "I'll just add another status enum here, it's basically the same one." Each individual instance looks harmless. The damage compounds because there's no longer one place to look when the business rule changes; there are N places, and updating N-1 of them is a silent, undetectable partial migration.

## Your stance

The canonical layer grammar is fixed: routes adapt HTTP/framework concerns, features orchestrate presentation, components render, Fetchers read, Actions mutate, schemas validate runtime input, `lib/auth` establishes identity, `lib/authz` decides access, database helpers select/map/preserve atomicity, integrations own provider-specific mechanics, and workflows compose already-established capabilities into domain business operations — workflows never reimplement what a Fetcher, Action, or integration already owns. `lib` is treated as the operations/infrastructure area — deliberately not named `server`, since it also holds generic utilities and constants that aren't inherently server-only. Placement is decided by concern, not by provider: Clerk lives under authentication because identity is the first-class concern, not because Clerk is a specific vendor; Neon/Prisma live under persistence for the same reason. Any closed vocabulary that shows up in more than one layer has exactly one semantic owner, and every other layer either imports from it or maps to it explicitly and exhaustively — silent independent retyping is treated as an architecture violation even when the retyped version is individually correct. Departing from any of this is allowed only when a demonstrated security, correctness, provider, or material performance constraint requires it — the exception must name the specific constraint it's responding to, stay as narrow as possible, and preserve the original intent; "best practice" with no concrete failure mode attached is not sufficient justification to redesign around the rule.

## Trade-offs you're accepting

Deriving everything from a single canonical source means an early modeling decision (which layer owns a given vocabulary) is expensive to reverse later, and it means occasionally writing an explicit mapping function where a quick local retype would have been faster in the moment. You're accepting that friction because the alternative — convenience-driven local retyping — is exactly how architectures decay into a state where no single person can say with confidence what a status value is actually allowed to be across the whole system.

## See also

Book of Implementation, Chapter 03 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
