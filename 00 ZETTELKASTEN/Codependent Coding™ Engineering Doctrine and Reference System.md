# Codependent Coding™ Engineering Doctrine and Reference System

## The Authoritative Source for the Loaded Vibes™ WebApp Architecture Implemented with the Hipster Stack™ TechStack

---

# 0. Document Identity, Purpose, and Authority

## 0.1 Purpose

Define the complete engineering doctrine, conceptual model, reference architecture, methodology, and canonical implementation system used to design and build applications based on the **Loaded Vibes™ WebApp Architecture** using the **Hipster Stack™ TechStack**.

This document externalizes the accumulated knowledge, decisions, patterns, preferences, constraints, and implementation experience developed through repeated construction of substantially similar B2B SaaS web applications.

It is intended to answer, at the source level:

- what the system is;
- what exists within it;
- what its concepts mean;
- why its architectural choices exist;
- how its parts relate;
- how its architecture behaves;
- what values govern tradeoffs;
- what valid implementations look like;
- and what evidence supports its canonical claims.

## 0.2 Nature of the Document

This document is not itself:

- project governance;
- an `AGENTS.md` file;
- a Codex instruction set;
- a project-specific PRD;
- an architecture contract;
- a validation contract;
- a generator specification;
- a CLI implementation;
- an issue backlog;
- a test suite;
- or a repository template.

It is the **authoritative source from which those artifacts may later be derived**.

It may describe governance, implementation, validation, testing, generation, and agent operation, but it does so to define their place within the overall engineering system—not to serve directly as their operational configuration.

## 0.3 Relationship Between the Three Named Systems

| System | Responsibility |
|---|---|
| **Codependent Coding™** | The engineering doctrine and knowledge system defining the concepts, language, principles, architecture, methodology, patterns, evidence, and canonical implementations. |
| **Loaded Vibes™** | The reusable WebApp architecture and golden application baseline derived from the doctrine. |
| **Hipster Stack™** | The selected technologies, libraries, providers, tools, and platforms used to realize the architecture. |

## 0.4 Downstream Derivations

Artifacts that may later be derived from this source include:

- Loaded Vibes generator behavior;
- starter-repository structure;
- reusable implementation templates;
- Codependent Coding specifications;
- Codex skills and instructions;
- human-readable project context;
- machine-readable contracts;
- validation scripts;
- lint rules;
- architecture tests;
- test templates;
- CI quality gates;
- issue-generation systems;
- pull-request standards;
- project-specific documentation;
- and operational runbooks.

No downstream artifact may introduce a new architectural decision while claiming to be a direct derivation of this system.

## 0.5 Audience

The primary audiences are:

- the system’s author;
- future maintainers;
- architects and engineers evaluating the system;
- researchers analyzing its conceptual and architectural model;
- and developers producing downstream tools or implementations from it.

AI coding agents are a secondary audience. Agent-specific instructions must be derived separately.

## 0.6 Canonicality

A claim may be designated as:

- **Canonical** — authoritative and required;
- **Canonical with permitted variation** — authoritative within explicitly defined variation;
- **Reference implementation** — one approved implementation of a canonical rule;
- **Illustrative** — useful explanation that is not itself normative;
- **Product-specific** — valid for a particular application but not universal;
- **Experimental** — under evaluation;
- **Deprecated** — formerly valid but no longer preferred;
- **Prohibited** — explicitly incompatible with the system;
- **Unresolved** — insufficiently supported for canonical status.

## 0.7 Source and Evidence Hierarchy

Establish the authority of:

1. explicit decisions and explanations from the system’s author;
2. approved doctrine and architecture documents;
3. repeatedly reviewed implementation patterns;
4. corrected repository implementations;
5. database constraints, migrations, policies, and tests;
6. issues, pull requests, reviews, and corrective commits;
7. current implementation where no stronger evidence exists;
8. external literature used only to clarify terminology or compare established concepts.

Implementation evidence may clarify an architectural rule but must not silently redefine documented intent.

## 0.8 Reading Order

The recommended reading sequence is:

1. Foundations and doctrine;
2. conceptual model;
3. language and classification;
4. reference architecture;
5. behavior and lifecycle;
6. canonical patterns;
7. technology realization;
8. engineering methodology;
9. canonical code atlas;
10. evidence and unresolved canon.

---

# Part I — Foundations and Engineering Doctrine

# 1. Origin and Problem Statement

## Governing Question

How did this engineering system emerge, and what problem does it exist to solve?

## Contents

Describe:

- the repeated construction of similar SaaS applications;
- the transition from implicit habits to explicit engineering doctrine;
- agentic pair programming as the learning and production context;
- recurring failures caused by architectural ambiguity;
- the cost of repeatedly rebuilding foundational systems;
- the distinction between AI-generated code volume and reliable system design;
- the need for one known, repeatable, inspectable implementation path;
- and the motivation for Loaded Vibes and Codependent Coding.

Clarify that the system is an extraction and formalization of repeated practice, not an abstract architecture invented independently of implementation experience.

---

# 2. Engineering Doctrine

## Governing Question

What fundamental propositions govern the system?

## Core Doctrine

Begin with the architectural source of truth:

> Routes adapt. Features orchestrate. Components render. Fetchers read. Actions write. Schemas validate. Authorization decides. Transactions preserve invariants. Webhooks reconcile external truth.

## Contents

Define the doctrine governing:

- separation of concerns;
- explicit responsibility ownership;
- deep modules and narrow interfaces;
- default Server Component usage;
- controlled client boundaries;
- authenticated and authorized protected reads;
- thin mutation entry points;
- workflow-based use-case coordination;
- minimal atomic transactions;
- explicit trust boundaries;
- local ownership of application state;
- provider isolation;
- webhook reconciliation;
- tenant containment;
- typed transport boundaries;
- runtime validation;
- evidence-backed completion;
- and minimal correct change.

Each doctrinal statement should explain:

- its intended meaning;
- the architectural property it protects;
- the failure mode it prevents;
- its relationship to other principles;
- and supporting evidence.

---

# 3. Engineering Values and Tradeoffs

## Governing Question

Which qualities govern decisions when desirable outcomes conflict?

## Contents

Define the system’s value hierarchy, including:

- correctness;
- security;
- tenant containment;
- explicitness;
- comprehensibility;
- changeability;
- testability;
- modular depth;
- maintainability;
- recoverability;
- auditability;
- supportability;
- reproducibility;
- accessibility;
- visual quality;
- delivery speed;
- agent efficiency;
- context efficiency;
- and evidence before assertion.

Document explicit tradeoffs such as:

- correctness over convenience;
- security over implementation speed;
- tenant containment over simplified persistence access;
- explicit contracts over implicit coupling;
- narrow interfaces over scattered shallow abstractions;
- stable architecture over unconstrained code generation;
- feedback quality over raw implementation velocity;
- and executed verification over confident completion claims.

This chapter is the system’s axiology, whether or not that term is used in the published title.

---

# Part II — Conceptual Model

# 4. Ontology: What Exists

## Governing Question

What kinds of things exist within the engineering system, architecture, application, and implementation?

## 4.1 System-Level Concepts

Define:

- engineering doctrine;
- knowledge system;
- WebApp architecture;
- TechStack;
- application;
- product;
- platform;
- repository;
- baseline;
- reference implementation;
- template;
- generator;
- specification;
- contract;
- artifact;
- evidence;
- pattern;
- constraint;
- invariant;
- and validation.

## 4.2 Architectural Concepts

Define:

- layer;
- role;
- responsibility;
- concern;
- boundary;
- trust boundary;
- module;
- component;
- interface;
- dependency;
- operation;
- command;
- query;
- workflow;
- transaction;
- integration;
- provider;
- adapter;
- and lifecycle.

## 4.3 Application Concepts

Define:

- route;
- layout;
- feature;
- presentation component;
- Fetcher;
- Server Action;
- application Workflow;
- Transaction Helper;
- authorization policy;
- runtime schema;
- database Select;
- DTO;
- DTO Mapper;
- integration adapter;
- webhook route;
- event ledger;
- webhook processor;
- outbox record;
- audit record;
- recovery record;
- and provider mirror.

## 4.4 Identity, Tenancy, and Authorization Concepts

Define:

- identity;
- actor;
- User;
- Tenant;
- Organization;
- Membership;
- Role;
- Permission;
- Capability;
- Resource;
- Policy;
- Scope;
- Ownership;
- entitlement;
- and administrative authority.

## 4.5 Data and Domain Concepts

Define:

- domain;
- domain model;
- entity;
- value object;
- aggregate;
- relationship;
- state;
- transition;
- state machine;
- invariant;
- persistence model;
- transport model;
- provider state;
- derived state;
- cached state;
- and normalized state.

## 4.6 Relationships and Cardinalities

Document consequential relationships, including:

- User participation in a Tenant through Membership;
- Role aggregation of Capabilities;
- Policy evaluation of Actor, Capability, Resource, and context;
- Route adaptation into Feature orchestration;
- Feature composition of presentation and use cases;
- Fetcher access to protected read infrastructure;
- Server Action delegation to Workflow;
- Workflow coordination of policies, transactions, providers, audit, and recovery;
- Transaction Helper ownership of atomic persistence mechanics;
- integration adapter isolation of provider semantics;
- webhook processor reconciliation of provider truth;
- DTO exposure of approved projections;
- and runtime schema validation of untrusted input.

For each consequential relationship define:

- source concept;
- target concept;
- relationship type;
- cardinality;
- ownership;
- direction;
- lifecycle relevance;
- permitted combinations;
- prohibited combinations;
- and supporting evidence.

## 4.7 Part–Whole Model

Define the system’s mereology:

- what comprises the knowledge system;
- what comprises a Loaded Vibes application;
- what comprises a domain;
- what comprises a module;
- what comprises a Feature;
- what comprises a Workflow;
- what comprises the webhook subsystem;
- what comprises the authorization system;
- and what comprises the quality and delivery system.

Identify:

- mandatory parts;
- optional parts;
- replaceable parts;
- removable sample parts;
- independently deployable parts;
- inseparable invariants;
- and replacement consequences.

---

# 5. Semantics: What Concepts Mean in Operation

## Governing Question

What behavioral meaning and consequences are carried by the system’s terms, structures, states, and operations?

## 5.1 Operation Semantics

Define:

- read-only;
- mutating;
- idempotent;
- atomic;
- transactional;
- retryable;
- compensatable;
- reversible;
- destructive;
- tenant-scoped;
- resource-authorized;
- provider-backed;
- webhook-reconciled;
- synchronous;
- asynchronous;
- and side-effecting.

## 5.2 State Semantics

Define the operational meaning of states such as:

- pending;
- active;
- inactive;
- suspended;
- archived;
- deleted;
- received;
- processing;
- processed;
- ignored;
- failed;
- stale;
- retryable;
- terminal;
- entitled;
- canceled;
- and reconciled.

## 5.3 Authority Semantics

Define:

- authoritative;
- canonical;
- normalized;
- derived;
- mirrored;
- cached;
- inferred;
- verified;
- advisory;
- stale;
- contradicted;
- and unsupported.

## 5.4 Interface Semantics

Define what it means to expose:

- a Fetcher result;
- a Server Action result;
- a Workflow result;
- a transaction result;
- a DTO;
- a policy decision;
- an adapter response;
- a webhook acknowledgement;
- and a validation error.

## 5.5 Presentation Semantics

Define:

- semantic HTML;
- interactive control;
- navigation;
- destructive action;
- confirmation;
- empty state;
- loading state;
- error state;
- forbidden state;
- and not-found state.

---

# 6. State, Lifecycle, and Transition Model

## Governing Question

How do important entities and processes change over time?

## Contents

For each lifecycle define:

- states;
- transitions;
- transition authority;
- preconditions;
- postconditions;
- invariants;
- illegal transitions;
- concurrency behavior;
- retry behavior;
- terminal states;
- recovery behavior;
- audit requirements;
- and implementation evidence.

## Required Lifecycles

Evaluate and define:

- application conception and development;
- User synchronization;
- Tenant creation;
- Membership invitation, activation, suspension, and removal;
- Role and Capability assignment;
- resource creation, update, archival, and deletion;
- Workflow execution;
- optimistic concurrency;
- subscription;
- entitlement;
- Checkout;
- billing portal management;
- payment;
- connected accounts where enabled;
- webhook receipt;
- event claiming;
- webhook processing;
- retry;
- permanent failure;
- stale-processing recovery;
- outbox delivery;
- database migration;
- deployment;
- release;
- incident;
- rollback;
- canonical-pattern promotion;
- and deprecation.

Use state diagrams where they clarify behavior.

---

# Part III — Language and Classification

# 7. Terminology and Ubiquitous Language

## Governing Question

Which terms are approved, and what does each term mean within this system?

## Entry Structure

Each controlled term should include:

- preferred term;
- exact definition;
- conceptual category;
- accepted aliases;
- deprecated alternatives;
- prohibited substitutions;
- commonly confused terms;
- correct usage;
- incorrect usage;
- and canonical evidence.

## Required Distinctions

Explicitly distinguish:

- Codependent Coding, Loaded Vibes, and Hipster Stack;
- application, product, platform, and system;
- architecture, methodology, pattern, and implementation;
- template, baseline, reference implementation, and generator;
- domain, module, layer, feature, and component;
- User, Actor, member, and Membership;
- Tenant, Organization, Account, Workspace, Team, and Business;
- Role, Permission, Capability, Policy, and Resource;
- Fetcher, Select, query, and repository;
- Server Action, command, Workflow, and Transaction Helper;
- authentication and authorization;
- validation and verification;
- provider state and domain state;
- active and entitled;
- canonical, mandatory, optional, replaceable, product-specific, deprecated, and prohibited.

---

# 8. Taxonomy and Faceted Classification

## Governing Question

How are the system’s concepts and artifacts classified?

## 8.1 Primary Taxonomies

Define classification systems for:

- architectural concerns;
- application layers;
- modules;
- artifacts;
- patterns;
- presentation elements;
- data artifacts;
- security artifacts;
- integration artifacts;
- tests;
- delivery artifacts;
- operational records;
- governance artifacts;
- and evidence.

For every category define:

- definition;
- classification criterion;
- inclusion rules;
- exclusion rules;
- parent category;
- sibling categories;
- examples;
- counterexamples;
- and whether multiple classification is allowed.

## 8.2 Module Classification

Classify modules as:

- mandatory baseline;
- optional baseline;
- removable sample domain;
- reusable;
- product-specific;
- provider-specific;
- replaceable;
- experimental;
- deprecated;
- or prohibited.

## 8.3 Facets

Define orthogonal facets such as:

- architectural layer;
- domain;
- surface;
- operation;
- runtime;
- rendering boundary;
- trust boundary;
- tenant scope;
- authorization scope;
- provider ownership;
- data sensitivity;
- mutability;
- statefulness;
- reuse scope;
- lifecycle stage;
- canonicality;
- maturity;
- status;
- authority;
- and evidence strength.

For each facet define:

- allowed values;
- assignment rules;
- invalid combinations;
- and examples.

---

# 9. Typology: Recurring Forms

## Governing Question

What recurring structural and behavioral forms exist within the system?

## Required Types

Define recurring forms of:

- applications;
- domains;
- modules;
- Features;
- routes;
- pages;
- forms;
- components;
- reads;
- mutations;
- Workflows;
- transactions;
- authorization decisions;
- provider operations;
- webhook operations;
- reconciliation processes;
- state machines;
- tests;
- migrations;
- issues;
- pull requests;
- releases;
- and incidents.

## Type Definition Structure

Each type should include:

- defining traits;
- intended context;
- required parts;
- optional parts;
- permitted variants;
- prohibited variants;
- related ontology concepts;
- related patterns;
- and representative evidence.

---

# 10. Nomenclature

## Governing Question

How must concrete artifacts be named?

## Contents

Define naming rules for:

- repositories;
- directories;
- files;
- route groups;
- routes;
- layouts;
- React components;
- Server Components;
- Client Components;
- Features;
- Fetchers;
- Server Actions;
- Workflows;
- Transaction Helpers;
- Selects;
- DTOs;
- DTO Mappers;
- runtime schemas;
- policies;
- Capabilities;
- Roles;
- adapters;
- provider mirrors;
- events;
- inbox and outbox records;
- audit records;
- Prisma models;
- PostgreSQL objects;
- indexes;
- constraints;
- migrations;
- RLS policies;
- tests;
- fixtures;
- environment variables;
- branches;
- commits;
- issues;
- pull requests;
- ADRs;
- and validation commands.

For each naming family define:

- casing;
- singular or plural form;
- prefix;
- suffix;
- namespace pattern;
- verb and noun conventions;
- canonical examples;
- ambiguous names to avoid;
- and prohibited examples.

---

# Part IV — Loaded Vibes™ Reference Architecture

# 11. Architectural Overview

## Governing Question

What is the complete structural and behavioral model of the Loaded Vibes WebApp Architecture?

## Contents

Define:

- architectural scope;
- supported application class;
- major subsystems;
- layer ownership;
- dependency direction;
- trust boundaries;
- runtime execution paths;
- data ownership;
- integration ownership;
- presentation architecture;
- deployment assumptions;
- and replacement boundaries.

Provide a high-level diagram connecting:

- browser;
- Next.js application;
- identity provider;
- authorization system;
- persistence system;
- provider integrations;
- webhook engine;
- deployment platform;
- and observability.

---

# 12. Layer Model and Responsibility Ownership

## Governing Question

Which layer owns each responsibility, and which responsibilities are explicitly excluded?

## Required Layers

Define:

- route adaptation;
- feature orchestration;
- UI primitives;
- shared presentation;
- domain presentation;
- protected reads;
- mutation entry;
- application Workflows;
- authentication adaptation;
- authorization;
- Selects;
- DTOs and mappers;
- transactions;
- integrations;
- webhooks;
- runtime schemas;
- shared transport types;
- persistence;
- project context;
- and machine-readable project governance.

For every layer define:

- architectural role;
- responsibility;
- public interface;
- accepted inputs;
- permitted outputs;
- allowed dependencies;
- prohibited dependencies;
- side-effect permissions;
- authentication responsibility;
- authorization responsibility;
- validation responsibility;
- serialization expectations;
- error behavior;
- and canonical implementation evidence.

This chapter defines the architecture conceptually. Project-specific governance and enforcement artifacts are downstream derivations.

---

# 13. Module and Contract Model

## Governing Question

How are architectural roles realized as modules with interfaces, contracts, boundaries, and constraints?

## Contents

Define:

- role versus module;
- module ownership;
- cohesion;
- coupling;
- deep versus shallow modules;
- public versus internal interfaces;
- transport contracts;
- behavioral contracts;
- dependency contracts;
- lifecycle contracts;
- trust-boundary contracts;
- and replacement contracts.

For major module families document:

- responsibility;
- contract;
- boundary;
- constraints;
- dependencies;
- invariants;
- owned state;
- failure behavior;
- and evidence.

---

# 14. Repository and Dependency Topology

## Governing Question

Where do architectural elements live, and how may they depend on one another?

## Contents

Define the canonical responsibility of:

- `app/`;
- `features/`;
- `components/ui`;
- `components/shared`;
- `components/<domain>`;
- `lib/fetchers`;
- `lib/actions`;
- `lib/<domain>/workflows`;
- `lib/auth`;
- `lib/authz`;
- `lib/db/selects`;
- `lib/db/dto`;
- `lib/db/transactions`;
- `lib/integrations`;
- `lib/webhooks`;
- `schemas`;
- `types`;
- `prisma`;
- `context`;
- and `.agents`.

Document:

- permitted import direction;
- prohibited imports;
- public module entry points;
- server-only boundaries;
- persistence boundaries;
- provider boundaries;
- product-domain boundaries;
- and transport boundaries.

Use diagrams where necessary.

---

# 15. Runtime and Trust Topology

## Governing Question

How do requests, commands, data, identity, and provider events move through the system?

## Required Flows

Model:

- browser → Route → Feature → Fetcher;
- Fetcher → identity → authorization → Select → DTO;
- browser → Server Action → Workflow → Transaction Helper;
- Workflow → integration adapter → provider;
- provider → webhook route → event ledger → processor → reconciliation;
- tenant-scoped operation → canonical database helper → transaction-scoped Prisma client;
- deployment source → CI → platform → runtime infrastructure;
- and failure → audit/recovery → retry or terminal outcome.

## Trust Boundaries

Define boundaries between:

- browser and server;
- Clerk and local identity;
- application and PostgreSQL;
- application and Stripe;
- provider payload and validated domain value;
- migration role and runtime role;
- public transport and protected use cases;
- cached state and authoritative state;
- and documentation claims and executed evidence.

---

# 16. Domain, Identity, Tenancy, and Authorization Model

## Governing Question

How does the architecture represent users, tenants, membership, authority, ownership, and entitlement?

## Contents

Define:

- Clerk identity;
- local User identity;
- Tenant abstraction;
- Organization reference implementation;
- Membership;
- Roles;
- Capabilities;
- Resources;
- resource policies;
- Workflow legality;
- ownership;
- entitlements;
- administrative authority;
- and tenant-scoped persistence.

Clarify:

- what Clerk owns;
- what PostgreSQL owns;
- what authorization decides;
- what RLS contains;
- what the browser may never establish;
- and what must be server-derived.

Include the reusable baseline domain model while clearly separating product-specific domain concepts.

---

# 17. Data and Persistence Model

## Governing Question

How is application state modeled, stored, selected, transformed, isolated, and changed?

## Contents

Define:

- Prisma’s role;
- PostgreSQL’s role;
- Neon’s role;
- migration ownership;
- runtime database role;
- pooled and direct connections;
- table ownership;
- grants;
- RLS;
- transaction-local tenant context;
- transaction-scoped Prisma clients;
- explicit Selects;
- DTO mappings;
- state transitions;
- uniqueness;
- indexes;
- constraints;
- money;
- timestamps;
- concurrency;
- migrations;
- invalidation;
- caching;
- and direct database containment testing.

Explain the distinction between:

- domain model;
- persistence model;
- transport model;
- provider mirror;
- and presentation state.

---

# 18. Integration and External-Truth Model

## Governing Question

How does the application interact with external providers without surrendering architectural ownership?

## Contents

Define:

- provider;
- integration;
- adapter;
- provider mirror;
- normalized local state;
- idempotency;
- reconciliation;
- audit;
- recovery;
- retry;
- compensation;
- and provider replacement.

Cover:

- Clerk;
- Stripe subscription billing;
- optional Stripe Connect;
- webhook verification;
- provider-derived runtime validation;
- durable event ledgers;
- atomic event claiming;
- replay handling;
- out-of-order events;
- stale processing;
- outbox patterns;
- failure metadata;
- and reconciliation.

---

# 19. Presentation Architecture

## Governing Question

How is the application’s presentation system composed and connected to protected application behavior?

## Contents

Define:

- tokens;
- themes;
- primitives;
- shared components;
- domain components;
- blocks;
- Features;
- layouts;
- page recipes;
- Routes;
- fixtures;
- registry metadata;
- and catalog isolation.

Cover:

- server and client boundaries;
- semantic HTML;
- accessibility;
- keyboard behavior;
- responsive behavior;
- loading states;
- empty states;
- error states;
- forbidden states;
- not-found states;
- destructive actions;
- confirmation;
- visual validation;
- and reuse versus product specificity.

---

# Part V — Canonical Architectural Patterns

# 20. Pattern Language

## Governing Question

How are recurring architectural problems solved consistently within the system?

## Pattern Entry Structure

Every canonical pattern should contain:

- name;
- status;
- problem;
- context;
- forces;
- intent;
- participating concepts;
- participating layers;
- responsibilities;
- public interfaces;
- canonical flow;
- invariants;
- security implications;
- failure modes;
- prohibited shortcuts;
- permitted variations;
- related patterns;
- implementation evidence;
- canonical code;
- and required verification.

## Required Patterns

1. Golden Fetcher  
2. Golden Server Action  
3. Golden Application Workflow  
4. Golden Transaction Helper  
5. Golden Auth/AuthZ Boundary  
6. Golden Webhook Processor  
7. Feature Orchestration  
8. Route Orchestration  
9. Layer Contract  
10. Lifecycle Model  

Additional patterns may be promoted only when supported by repeated, consequential, reviewed evidence.

---

# Part VI — Hipster Stack™ Technology Realization

# 21. Technology Stack

## Governing Question

Which concrete technologies implement the architecture, and what responsibility does each technology own?

## Technologies to Evaluate

- TypeScript;
- Next.js App Router;
- React;
- Prisma ORM;
- PostgreSQL;
- Neon;
- Clerk;
- Stripe;
- Zod;
- React Hook Form;
- Tailwind CSS;
- shadcn/ui or the selected primitive system;
- Vitest;
- Playwright;
- pnpm;
- Git;
- GitHub;
- GitHub Actions;
- Vercel;
- and selected observability systems.

## Technology Entry Structure

For each technology define:

- responsibility;
- reason for inclusion;
- architectural boundary;
- approved usage;
- prohibited usage;
- integration points;
- configuration expectations;
- replacement boundary;
- portability implications;
- mandatory, optional, or replaceable status;
- and implementation evidence.

Do not reproduce generic vendor documentation.

---

# 22. Technology-to-Architecture Mapping

## Governing Question

How does each Hipster Stack technology realize a Loaded Vibes architectural role?

## Contents

Map:

- Next.js to route adaptation and rendering;
- React to presentation composition;
- Clerk to identity proof;
- PostgreSQL to canonical application state;
- Neon to hosted database infrastructure;
- Prisma to typed persistence access;
- Zod to runtime trust-boundary validation;
- Stripe to provider-owned commercial events;
- GitHub to source and review collaboration;
- GitHub Actions to automated quality evaluation;
- Vercel to application deployment and runtime;
- Vitest and Playwright to executable behavioral evidence;
- and lint/type tooling to static conformance.

Explicitly separate:

- architectural role;
- concrete implementation;
- provider-specific semantics;
- and replacement boundary.

---

# Part VII — Engineering Methodology

# 23. End-to-End Engineering Method

## Governing Question

How does the author move from an idea to an operating product?

## Phases

Define the method for:

1. problem identification;
2. research;
3. product definition;
4. domain discovery;
5. ubiquitous-language formation;
6. ontology and domain modeling;
7. requirements;
8. PRD development;
9. technical requirements;
10. architecture;
11. trust-boundary and threat analysis;
12. design;
13. identity and authorization design;
14. data modeling;
15. lifecycle modeling;
16. migration planning;
17. specification decomposition;
18. acceptance criteria;
19. project governance preparation;
20. issue generation;
21. sequencing;
22. implementation;
23. review;
24. correction;
25. testing;
26. security validation;
27. migration validation;
28. preview deployment;
29. release;
30. production verification;
31. observability;
32. incident handling;
33. recovery;
34. iteration;
35. and extraction of reusable patterns.

For each phase define:

- purpose;
- decisions owned by the author;
- information required;
- output produced;
- dependencies;
- validation;
- stop conditions;
- and downstream derivations.

---

# 24. Feedback and Assurance Philosophy

## Governing Question

How is drift detected and correctness established during development?

## Contents

Explain the distinct roles of:

- formatting;
- static analysis;
- TypeScript;
- runtime schemas;
- architecture validation;
- unit tests;
- contract tests;
- integration tests;
- browser tests;
- accessibility tests;
- authorization tests;
- RLS containment tests;
- concurrency tests;
- webhook replay tests;
- migration validation;
- CI;
- preview deployment;
- production verification;
- observability;
- code review;
- and audit evidence.

This chapter defines assurance philosophy and ownership. Concrete project configurations are downstream artifacts.

---

# Part VIII — Canonical Code Atlas

# 25. Reference Implementations

## Governing Question

What does the approved architecture look like in actual code?

## Purpose

Provide substantial, traceable, reusable implementation examples demonstrating the architecture’s canonical rules.

## Required Examples

Where supported by reviewed evidence, include:

- authenticated Fetcher;
- resource-authorized Fetcher;
- list Fetcher;
- detail Fetcher;
- database Select;
- DTO;
- DTO Mapper;
- Server Action;
- database-only Workflow;
- provider-backed Workflow;
- Transaction Helper;
- actor resolution;
- Capability evaluation;
- resource policy;
- tenant-scoped database operation;
- canonical RLS context helper;
- webhook route;
- event claim;
- webhook processor;
- provider adapter;
- billing operation;
- Feature orchestration;
- Route orchestration;
- form/schema/action integration;
- architecture test;
- authorization test;
- and RLS containment test.

## Code Example Metadata

Each example must include:

- conceptual rule demonstrated;
- pattern represented;
- canonicality status;
- source repository;
- repository-relative path;
- exported symbol;
- inspected commit SHA;
- relevant package or framework version;
- required surrounding dependencies;
- reusable versus product-specific classification;
- permitted variation;
- prohibited modification;
- and associated tests.

## Code Stability Rule

Architectural rules remain authoritative until deliberately revised.

Code examples are versioned reference implementations and may require updates when technologies change.

A code example may not silently redefine the governing architectural rule.

---

# Part IX — Evidence, Canon, and Completeness

# 26. Epistemology and Sources of Truth

## Governing Question

How does this system establish that a claim or state is true?

## Runtime Authority

Define authority for:

- authenticated identity;
- local User identity;
- Membership;
- Roles and Capabilities;
- resource ownership;
- Workflow legality;
- persisted application state;
- subscription state;
- entitlement state;
- payment settlement;
- connected-account state;
- webhook-processing state;
- migration state;
- deployment state;
- cache state;
- and browser state.

## Architectural Authority

Define the relative authority of:

- explicit intent;
- doctrine;
- architecture;
- canonical patterns;
- ADRs;
- repository implementation;
- tests;
- database constraints;
- migrations;
- RLS policies;
- issues;
- pull requests;
- reviews;
- corrective commits;
- CI;
- and production observations.

## Evidence Classes

Define:

- explicitly declared;
- documented;
- implemented;
- repeatedly implemented;
- mechanically enforced;
- verified through execution;
- inferred from converging evidence;
- assumed;
- stale;
- contradicted;
- and unsupported.

## Conflict Resolution

Explain how to resolve conflicts between:

- documentation and implementation;
- two repository implementations;
- implementation and tests;
- tests and database constraints;
- current and deprecated patterns;
- provider truth and local state;
- redirect outcomes and webhook-confirmed outcomes;
- and declared intent and accidental Codex output.

---

# 27. Provenance

## Governing Question

What evidence supports each canonical concept, rule, pattern, and implementation?

## Contents

Record:

- source type;
- source document or repository;
- path or section;
- symbol, model, migration, policy, or test;
- issue or pull request where relevant;
- commit SHA;
- evidence classification;
- conflicts;
- resolution;
- verification date;
- and remaining uncertainty.

Inline evidence should support consequential claims. This chapter provides the complete audit map.

---

# 28. Completeness and Unresolved Canon

## Completeness Matrix

Verify that the system answers:

- what exists;
- what each concept means;
- how concepts relate;
- what is part of what;
- how parts connect;
- which source owns each truth;
- which language is approved;
- how concepts and artifacts are classified;
- which recurring types exist;
- how concrete artifacts are named;
- what operations and states mean;
- which values govern decisions;
- how the architecture is structured;
- how the architecture behaves;
- how technologies realize the architecture;
- how applications are built;
- what canonical implementations look like;
- how correctness is evaluated;
- and what evidence supports canonical claims.

## Unresolved Knowledge

List:

- insufficiently supported concepts;
- contradictions that remain unresolved;
- missing implementation evidence;
- unverified assumptions;
- technology-version uncertainties;
- gaps requiring author adjudication;
- and areas requiring future canonicalization.

No unsupported conclusion may be silently promoted to canonical status.

---

# Appendices

# Appendix A — Controlled Glossary

Provide a compact alphabetical reference to approved terminology while linking each term to its authoritative conceptual definition.

# Appendix B — Concept Registry

Provide one canonical record for every major concept, including:

- identifier;
- preferred term;
- definition;
- category;
- role;
- properties;
- relationships;
- contract;
- constraints;
- lifecycle relevance;
- topology;
- related patterns;
- code evidence;
- and canonicality status.

This registry prevents the same concept from being independently redefined throughout the manuscript.

# Appendix C — Diagram Index

Index all:

- conceptual diagrams;
- dependency diagrams;
- runtime flows;
- trust-boundary diagrams;
- lifecycle diagrams;
- state machines;
- part-whole diagrams;
- and deployment diagrams.

# Appendix D — Pattern Index

List all canonical, candidate, deprecated, and prohibited patterns.

# Appendix E — Code Example Index

List every canonical implementation example by:

- pattern;
- architectural layer;
- repository;
- source path;
- symbol;
- commit;
- and technology version.

# Appendix F — Downstream Derivation Map

Show how source sections may later produce:

- Loaded Vibes generator rules;
- repository templates;
- project documentation;
- Codependent Coding specifications;
- agent instructions;
- skills;
- governance contracts;
- validation scripts;
- tests;
- CI gates;
- and operational runbooks.

The map must make clear that these are derived artifacts and not coequal sources of architectural truth.

---

# Editorial and Structural Rules

## One Canonical Home per Claim

Every concept and rule must have one authoritative definition.

Other sections may:

- apply it;
- classify it;
- display it through another analytical lens;
- provide implementation evidence;
- or link to it.

They must not independently redefine it.

## Lens Rule

Ontology, epistemology, terminology, taxonomy, typology, nomenclature, semantics, mereology, topology, and axiology are analytical lenses applied to the same engineering system.

They do not represent independent and competing systems of truth.

## Rule–Implementation Separation

Every consequential implementation entry must distinguish:

1. the stable architectural rule;
2. the canonical pattern;
3. the current versioned reference implementation;
4. permitted variations;
5. product-specific specialization;
6. and obsolete or prohibited alternatives.

## No Silent Invention

Where evidence is insufficient:

> Insufficient evidence to define canonically.

The unresolved matter must be recorded for later adjudication.

## No Downstream Leakage

The manuscript may define the purpose and required properties of governance, agent systems, generators, contracts, tests, and validation.

It must not accidentally become:

- a project’s active governance package;
- an agent prompt collection;
- an executable generator specification;
- or a project-specific implementation plan.

Those artifacts are derived after the doctrine and architecture have been canonically established.