# Chapter 22: Knowledge System Map

**The Book of Knowledge™**

## Concept

A knowledge system map answers two questions: how the doctrine's own layers relate to each other, and which component is the authority for each kind of runtime truth. The first is a hierarchy of *documents*. The second is a hierarchy of *state*. Keeping them in one place lets you check that the two agree: the architecture should place authority in the same places the documentation says it does.

## The canonical hierarchy

TypeScripture™ Canonical Doctrine, then Codependent Coding™ engineering doctrine and governance, then Loaded Vibes™ WebApp architecture, then Hipster Stack™ technology stack, then product and reference implementations. Each level constrains the one below it and is evidenced by it.

## How the two books relate

The Book of Knowledge defines what concepts mean, who owns decisions, which relationships and invariants exist, and what evidence can justify a claim. The Book of Implementation defines how those concepts are realized in files, interfaces, schemas, code, workflows, configuration, tests, and runtime boundaries. This is the same split engineering organizations draw between an architecture or design document and the reference implementation that proves it, with one added rule: neither book may silently overwrite the other. A defect found in implementation is reported upward and does not rewrite the doctrine.

## Runtime truth ownership

| Concern | System of record |
|---|---|
| External identity and session | Clerk |
| Local user, membership, roles, domain and entitlement state | PostgreSQL application model |
| Payment and settlement | Stripe |
| Legal product transitions | Domain policy plus Workflow |
| Intended access and containment | Application authorization plus PostgreSQL RLS |
| URL, HTTP, and framework outcomes | The Next.js app boundary |
| Page experience orchestration | Feature |
| Conformance (not product truth) | Tests, builds, review, runtime observation |

The last row matters most. Tests and builds are evidence about the system, and they are never the source of truth for what the product does.

## Where people get it wrong

The common mistake is letting a reference implementation become doctrine because it is complete, old, or labeled "golden." Completeness is not authority. A reference implementation supplies evidence that a pattern can work, and it also supplies evidence of where the pattern has drifted. Treating it as the specification means every accidental choice in it becomes a rule.

## Your stance

Reference implementations supply evidence and do not become doctrine merely because they are complete or older documentation called them "golden." The doctrine changes only through an explicit normative decision (Chapters 01 and 17). When the doctrine and the implementation disagree, the disagreement is recorded and resolved by the owner, and neither is quietly edited to match the other.

## Trade-offs you're accepting

Keeping doctrine and implementation as separate authorities means reconciliation is a recurring chore, and during the gap the two will disagree. You're accepting that because a doctrine that is rewritten to match whatever the code currently does has stopped being a doctrine.

## See also

Book of Implementation, Chapter 22: each system of record mapped to the files that implement it, and the physical layout of the two books.
