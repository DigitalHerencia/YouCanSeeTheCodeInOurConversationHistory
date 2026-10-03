# Chapter 04: Engineering System Definition

**The Book of Knowledge™**

## Concept

This chapter defines the system as a whole: what it is, what its operational backbone is, who owns which truth, and which defaults every part inherits. In industry vocabulary it is the **system context and responsibility model**: the answer to "what are the parts, which one is the system of record for what, and what may never be assumed."

Three layers of the doctrine's own identity are worth stating plainly, because they are easy to blur. Codependent Coding™ is the WebApp architecture together with the system that explains and governs how it is understood and built. Hipster Stack™ is the concrete technology substrate that resolves product choices and materializes an arrangement from the shared template. Loaded Vibes™ is the agent and tooling layer that inspects, validates, and maintains an arrangement after it is generated. A generated template or product application *instantiates* the architecture; it is not the architecture itself.

## Why it exists

Without a stated system definition, every part of the codebase quietly acquires its own idea of what it is responsible for. The specific failure it prevents is **authority diffusion**: Clerk's session object, a Prisma record, and a Stripe webhook payload each get treated as "the truth" about a user or a subscription in different places, and the application slowly becomes the sum of their disagreements. Naming a **system of record** for each kind of truth makes every other representation a derivative, and a derivative can be wrong without the system being wrong.

## Where people get it wrong

The common mistake is treating a folder name as a boundary. Naming the backend directory `server` implies everything inside is server-only, and then generic utilities and constants get awkwardly shoehorned in or excluded. The second mistake is the **grab-bag module**: a `utils/` directory that slowly absorbs calculations, transition rules, and provider limits because it was the nearest place to put them. The third is premature abstraction: two files that look similar get merged into a generic layer that then has to be bent to fit each caller.

## Your stance

**The operational backbone is `lib`.** Actions, Auth, AuthZ, Cache, Constants, DB, Fetchers, Integrations, Utils, and Workflows live there. It is deliberately named for operations and infrastructure, not `server`, because not everything in it is server-only. At the project root, `types/` owns TypeScript contracts, `schemas/` owns domain-organized Zod runtime validation, `prisma/` owns the authored database schema, migrations, seed, and RLS lifecycle, and `generated/prisma/` is generated output rather than authored architecture.

**State ownership is explicit.** Clerk owns external authentication and identity truth. PostgreSQL owns local application state: users, memberships, roles, and tenant-owned data. Provider services own their external truth. Application code interprets that truth through explicit boundaries and never lets a provider object or a persistence record leak across the system.

**Security defaults are inherited, not re-decided.** Protected reads and mutations authenticate and authorize. Tenant-owned database operations establish tenant context and treat row-level security as independent containment. Zod validates untrusted input at the boundary where it becomes trusted application data.

**Abstraction is earned.** Prefer direct, domain-named modules and explicit imports over speculative generic layers and barrel exports. Extract an abstraction when it has one stable meaning and clear callers, and not merely because two files look alike. This is the practical form of the rule of thumb that duplication is cheaper than the wrong abstraction.

**Cross-layer concepts name their authority.** Role vocabulary, lifecycle states, configuration keys, the error taxonomy, resource policies, webhook identity, and sequence rules each have one semantic owner (Chapter 03). Generated types may describe a persistence representation, but generated output does not silently become product authority.

**Domain rules stay with their owner.** A calculation, a transition rule, a provider limit, or a scheduling policy lives with the operation or domain that enforces it. `utils/` is not a refuge for rules that already have an obvious business owner.

## Trade-offs you're accepting

Explicit imports and domain-named modules mean more files and more import lines than a barrel-and-service-layer design would produce. You're accepting that because the boundaries stay visible and the dependency graph stays checkable. Refusing generic layers also means you will occasionally write two similar functions side by side and live with it until a stable shared meaning appears.

## See also

Book of Implementation, Chapter 04: the verified `lib` topology, the read, write, business-process, and webhook flows, and the placement rules.
