# Chapter 05: Ontology Contract

**The Book of Knowledge™**

## Concept

An ontology, in the formal sense used here, is the set of entities that exist in the system, the relationships between them, their valid states, and the constraints that make a given combination of those things legal or illegal. It is a distinct artifact from a folder structure (which is about code organization) and from a persistence schema (which is about how data happens to be stored) — the same ontological entity, "Organization," can be represented across a Prisma model, several TypeScript types, and multiple UI labels, but the ontology is the one underlying concept all of those represent.

## Why it exists

Without an explicit ontology, entity modeling happens implicitly and inconsistently — one part of the codebase treats "Tenant" and "Organization" as interchangeable, another introduces a "Workspace" that overlaps with both, and nobody can say with confidence whether they're the same concept or three different ones. This is the same drift problem the Architecture Contract (Chapter 03) names for vocabulary generally, applied specifically to the system's core nouns: entities, actors, and their relationships. A written ontology also does the work of surfacing illegal states early — if "Membership" can exist without a valid "Role," that's either a missing constraint or a genuine intentional case, and it should be a documented decision either way, not an accident discovered in production.

## Where people get it wrong

The common mistake is skipping explicit entity modeling entirely and letting the Prisma schema *be* the ontology by default — which conflates "how it's stored" with "what it means," and makes it easy to add a column that technically fits the table but doesn't actually correspond to a coherent concept. A second common mistake is introducing a near-duplicate noun (Tenant vs. Organization vs. Account) without an explicit decision about whether they're the same thing, aliases, or genuinely distinct — which is exactly the kind of ambiguity a formal ontology exists to close off.

## Your stance

Core entities and their relationships are documented explicitly, independent of any one implementation artifact, and kept aligned with what's actually implemented rather than describing an aspirational or historical architecture — the codebase is the alignment baseline, not the other way around. Tenant is the abstract concept; Organization is its concrete reference noun in this stack, and renaming that noun is a deliberate, documented decision (an ADR-level change), not a casual rename. Every entity's legal states, the actors who can act on it, and the constraints that make a given state combination valid are named, not left to be inferred from whatever the code happens to currently allow.

## Trade-offs you're accepting

Maintaining an ontology document separate from the schema means two artifacts can drift if the discipline of updating both lapses — you're accepting the overhead of keeping a human-readable entity catalog current specifically because the alternative, deriving your mental model of the system's entities purely by reverse-engineering the Prisma schema, gets harder and less reliable as the schema grows.

## See also

Book of Implementation, Chapter 05 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
