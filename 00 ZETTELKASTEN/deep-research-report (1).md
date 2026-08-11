# Hipster Stack Engineering Knowledge System

## Deliverable

The finished knowledge system contains **twenty-seven Markdown documents**, including every required file and the conditional `axiology.md`. The navigational entry point is:

[Open the Hipster Stack Engineering Knowledge System index](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/00-index.md)

The documents define the conceptual model, reusable SaaS domain model, controlled terminology, architecture, layer boundaries, implementation patterns, security model, provider integration model, presentation methodology, engineering workflow, agent governance, delivery system, operational model, and evidence provenance.

The architecture is grounded in Ivan’s documented principle that routes adapt, features orchestrate, components render, fetchers read, actions write, schemas validate, authorization decides, transactions preserve invariants, and webhooks reconcile external truth. fileciteturn14file0L2-L6

## Conceptual and Knowledge Models

| Document | Authoritative responsibility |
|---|---|
| [ontology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/ontology.md) | Defines what exists in the Hipster Stack universe, what each concept means, its relationships, ownership, cardinality, lifecycle relevance, and negative boundaries |
| [domain-model.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/domain-model.md) | Defines the reusable SaaS domain model, product-specific extension method, provider mirrors, ownership modes, commands, events, invariants, and transaction boundaries |
| [terminology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/terminology.md) | Establishes the controlled vocabulary, aliases, deprecated language, distinctions, and correct usage |
| [taxonomy.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/taxonomy.md) | Classifies engineering, repository, product, domain, security, integration, operational, testing, governance, and delivery artifacts |
| [typology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/typology.md) | Defines recurring application, module, route, page, workflow, authorization, webhook, test, release, and incident types |
| [facets.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/facets.md) | Defines independent classification axes such as layer, surface, runtime, trust boundary, tenant scope, provider ownership, maturity, authority, and evidence strength |
| [mereology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/mereology.md) | Defines part-whole relationships across the knowledge system, repositories, applications, workflows, integrations, presentation, governance, testing, and delivery |
| [epistemology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/epistemology.md) | Defines authoritative, provider-owned, application-owned, derived, normalized, cached, advisory, reconciled, inferred, stale, and verified truth |
| [axiology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/axiology.md) | Defines evidence-backed priorities and conflict rules across correctness, security, recoverability, explicitness, maintainability, accessibility, reproducibility, and speed |

The knowledge-model separation follows the DevNotes distinction between ontology, taxonomy, terminology, typology, topology, epistemology, mereology, nomenclature, semantics, schemas, metadata, and faceted classification rather than creating interchangeable glossaries. fileciteturn27file0L2-L7

## Architecture and Implementation System

| Document | Authoritative responsibility |
|---|---|
| [nomenclature.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/nomenclature.md) | Defines naming for directories, routes, components, fetchers, actions, workflows, transactions, policies, capabilities, Prisma models, migrations, events, tests, branches, commits, PRs, ADRs, and contracts |
| [semantics.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/semantics.md) | Defines the behavioral consequences of authenticated, authorized, scoped, idempotent, atomic, processed, ignored, failed, reconciled, stale, ready, active, archived, and related states |
| [schema-and-metadata.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/schema-and-metadata.md) | Defines Prisma, Zod, TypeScript, form, environment, provider, event, governance, execution, registry, and metadata contracts |
| [technology-stack.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/technology-stack.md) | Defines the exact responsibility, boundary, approved usage, prohibited usage, and replacement contract for the concrete technology stack |
| [topology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/topology.md) | Defines repository, runtime, deployment, dependency, identity, tenant, provider-event, invalidation, failure, recovery, and trust topology |
| [reference-architecture.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/reference-architecture.md) | Integrates the complete technical architecture without replacing the specialized documents |
| [layer-contracts.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/layer-contracts.md) | Defines inputs, outputs, imports, prohibitions, side effects, authentication, authorization, validation, serialization, errors, and enforcement for every architectural layer |
| [lifecycle-models.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/lifecycle-models.md) | Defines development, User, Tenant, Membership, resource, workflow, subscription, payment, Connect, webhook, retry, outbox, migration, deployment, incident, and documentation lifecycles |
| [pattern-catalog.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/pattern-catalog.md) | Preserves the six Golden Patterns and adds feature orchestration, route orchestration, layer contracts, lifecycle modeling, provider mirrors, readiness gates, and architecture validation |
| [reference-implementations.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/reference-implementations.md) | Contains repository-extracted examples from Vouch and CtrlPlus, with product-specific and reusable portions distinguished |
| [constraints.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/constraints.md) | Consolidates the normative MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY rules |

The implementation system reflects Vouch’s documented separation of route shells, features, components, fetchers, actions, workflows, authentication, authorization, database projections, transaction helpers, integrations, and webhook processors. fileciteturn17file0L2-L6 It also incorporates CtrlPlus’s enforced rules that protected reads use fetchers, writes use actions, server-side authorization governs sensitive behavior, Client Components cannot become security boundaries, and capability tokens follow explicit domain and scope conventions. fileciteturn24file0L2-L6

The six existing canonical patterns are grounded in their source documents:

* Golden Fetcher: scoped authorization, minimal select, mapper, and DTO rather than broad ORM access. fileciteturn28file0L1-L2
* Golden Server Action: a framework mutation adapter rather than a workflow, provider layer, or database service. fileciteturn29file0L1-L6
* Golden Application Workflow: one recoverable business use case coordinating policy, persistence, and providers. fileciteturn30file0L1-L6
* Golden Transaction Helper: a transaction-client-only atomic persistence boundary without network calls. fileciteturn31file0L1-L6
* Golden Auth/Authz Boundary: explicit separation among authentication, local identity, membership, capability, resource policy, workflow legality, readiness, and RLS. fileciteturn32file0L1-L6
* Golden Webhook Processor: raw-body verification, durable receipt, atomic processing claims, idempotent reconciliation, and outbox-aware recovery. fileciteturn33file0L1-L6

## Product, Security, Presentation, and Operations

| Document | Authoritative responsibility |
|---|---|
| [presentation-system.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/presentation-system.md) | Defines tokens, theming, primitives, shared and domain components, blocks, features, page recipes, state handling, forms, content, responsive behavior, accessibility, motion, fixtures, registries, and asset lifecycle |
| [data-security-and-integrations.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/data-security-and-integrations.md) | Defines PostgreSQL, Prisma, Neon, roles, tenant keys, RLS, Clerk, local User, Membership, capabilities, policies, Stripe, Connect, mirrors, webhooks, inbox, outbox, reconciliation, audit, recovery, and secrets |
| [quality-delivery-and-operations.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/quality-delivery-and-operations.md) | Defines static analysis, tests, CI, migrations, drift, clean-clone validation, deployment, smoke checks, observability, alerts, runbooks, rollback, recovery, release evidence, and definition of done |
| [methodology.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/methodology.md) | Defines Ivan’s full idea-to-operation application-building method and evidence gates |
| [governance.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/governance.md) | Defines authority, DevNotes, AGENTS, context, contracts, execution state, ADRs, issues, PRs, agent roles, delegation, scope, contradiction handling, versioning, and completion claims |
| [provenance.md](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/provenance.md) | Records repository revisions, inspected sources, evidence status, corrective history, unresolved evidence, and research limitations |

The security and integration model incorporates Vouch’s explicit provider boundaries: Clerk owns authentication, Prisma owns product state, verified identity webhooks own local-user synchronization, Stripe provider objects remain account-scoped, and reconciliation cannot replace synchronous workflow eligibility. fileciteturn18file0L2-L6 Vouch’s Prisma schema provides concrete evidence for local User state, connected-account mirrors, payment records, durable provider-event identity, confirmation state, audit, retries, and recovery records. fileciteturn37file0L2-L6

The system also treats corrective history as stronger evidence than accidental earlier behavior. Vouch commit `5fec3d04d61507d14cb90b1ed8b914415adb27e7` hardened webhook atomic claims, stale processing recovery, capture eligibility rechecks, confirmation-code throttling, route authorization, and targeted lifecycle validation. fileciteturn36file0L2-L7

## Source Revisions and Limitations

The knowledge system records these inspected revisions:

| Repository | Default branch | Inspected revision |
|---|---|---|
| `DigitalHerencia/DevNotes` | `master` | `3140329afaf5358b566504f9fa658a3f103d5bd5` |
| `DigitalHerencia/Vouch` | `main` | `d8dd85a2b6b566c7f16f8b4fce3ae14cc228858f` |
| `DigitalHerencia/CtrlPlus` | `main` | `593bc0be7f4410a557a8ab46794ee4a9b6138b6d` |

The exact source revisions are visible in the retrieved DevNotes, Vouch, and CtrlPlus file references. fileciteturn14file0L4-L6 fileciteturn17file0L4-L6 fileciteturn24file0L4-L6

The research environment did not provide a recursive GitHub archive or repository write operation, and external cloning from the execution container was unavailable. Evidence was collected through repository metadata, code search, file retrieval, PR search, commit search, and corrective diffs. Several specifically named source documents were not independently retrievable by exact path. The deliverable therefore marks unsupported implementation examples rather than fabricating them.

The principal unresolved areas recorded in `provenance.md` are a universal repository-extracted Organization and Membership implementation, a complete reusable RLS helper and attack-test body, a complete outbox worker, a canonical observability vendor, exact branch-protection counts, universal tenant-deletion rules, and a universal preview-environment policy.

[Open provenance and unresolved evidence](sandbox:/mnt/data/hipster-stack-engineering-knowledge-system/provenance.md)