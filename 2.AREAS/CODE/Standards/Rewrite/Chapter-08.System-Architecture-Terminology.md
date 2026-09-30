# Chapter 08: System Architecture Terminology

**The Book of Knowledge™**

## Concept

A precise vocabulary is the difference between describing what you built and explaining it. This chapter does two jobs. It fixes the meaning of the doctrine's own terms, so a word like "Fetcher" always denotes the same boundary. And it maps each of those terms to the name the wider industry uses, so you can say the standard term out loud in a design review or a whiteboard interview and mean exactly what your codebase means.

## Core architectural terms

- **Role**: a named bundle of stable capabilities within a scope.
- **Responsibility**: the work or decisions owned by exactly one role, module, or layer.
- **Boundary**: a separation that controls what knowledge, authority, data, or dependencies may cross it.
- **Constraint**: a rule that limits permitted structure or behavior.
- **Invariant**: a condition that must remain true across every legal operation.
- **Contract**: the inputs, outputs, guarantees, errors, dependencies, and obligations at a boundary.
- **Interface**: the exposed surface through which a module is used.
- **Layer**: a responsibility group with a controlled dependency direction, and not merely a directory.

## Translating your vocabulary into industry vocabulary

| Your term | Industry term | What to say in an interview |
|---|---|---|
| Fetcher | Query handler (CQRS read side), close to a Repository with an authorization gate | "Reads go through a single query function that enforces authorization and tenant scope and returns DTOs." |
| Server Action | Command handler / mutation endpoint (RPC-style) | "Each write is a command handler that validates input, authorizes, and runs in a tenant-scoped transaction." |
| Workflow | Application service (DDD) or use-case interactor (Clean Architecture) | "A use-case layer composes queries and commands and owns cross-step business rules." |
| Transaction Helper | Unit of Work | "A unit of work that opens the transaction and sets tenant context first." |
| Prisma select | Projection | "Explicit projections so a new column never widens an existing read." |
| DTO mapper | DTO assembler / anti-corruption mapping at the persistence boundary | "Persistence entities never leak past the data layer." |
| Primitive / Block / Template / Feature | Atomic Design: atoms, molecules and organisms, templates, pages, with the Feature as the page-level orchestrator | "UI is composed bottom-up, and the feature layer only orchestrates." |
| Shell | App shell / layout shell | "Route-group layouts own shared chrome and the auth gate." |
| Actor | Principal (subject) | "The authenticated principal resolved server-side." |
| Capability / permission | Permission in an RBAC grant map | "Roles map to a static permission set." |
| Policy | ABAC rule, evaluated at a policy enforcement point | "Object-level checks on ownership and assignment run after the record is loaded." |
| Tenant / Organization | Multi-tenancy, pool model (shared database and schema, tenant key column, RLS as a backstop) | "Shared-schema multi-tenancy with a discriminator column and row-level security." |
| RLS as containment | Defense in depth | "Two independent layers: application authorization and database row security." |
| Version-checked update | Optimistic concurrency control | "Writes are conditioned on the last-seen `updatedAt`, so stale writes fail loudly." |
| Claim, then process, then mark | Idempotent consumer under at-least-once delivery | "Webhook events are claimed atomically by provider and event id." |
| Golden pattern | Golden path / reference implementation | "A paved-road reference implementation to copy and adapt." |
| Object-level check after loading the record | Defense against BOLA (broken object level authorization) | "Object-level authorization is checked against the loaded record, never inferred from role alone." |

## Deprecated ambiguity

Avoid generic canonical names such as `service`, `manager`, `helper`, `utils`, `getData`, `saveThing`, `admin user`, or a bare `account`, unless a narrower domain meaning is defined. A name should disclose its responsibility and its scope. `getProjectDetail` and `listOrganizationProjects` tell you what they return and for whom, and `getData` tells you nothing.

## Trade-offs you're accepting

Using both your own terms and the industry terms means maintaining a small translation layer in your head and in these docs. You're accepting it because your own terms are precise inside this codebase and opaque outside it, and the industry terms are the reverse. Fluency in both is what lets you explain the system to someone who has never seen it.

## See also

Book of Implementation, Chapter 08: the naming conventions your template actually follows, and where they differ from the written rules.
