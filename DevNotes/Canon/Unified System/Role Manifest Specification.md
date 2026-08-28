---
title: Reconciled Role Manifest Specification
role: DevNotes
system: DevNotes
workspace:
type: contract
status: Active
authority: Source of Truth
created: 2026-08-28
updated: 2026-08-28
tags:
  - roles
  - governance
  - obsidian
  - chatgpt-projects
  - codependent-coding
  - typescripture
---

# Reconciled Role Manifest Specification

## System Contract

The unified system operates through four mutually constituting surfaces:

- **TypeScripture™** supplies canonical doctrine and engineering knowledge.
- **Codependent Coding™** realizes that doctrine as an engineering system, product family, generation model, implementation architecture, and vocabulary.
- **Obsidian** is the durable human-and-machine operating environment for project management, knowledge, specifications, creative work, dashboards, live-code access, state, evidence, coordination, and institutional memory.
- **ChatGPT Projects + Codex** form the active specialized agent team.

The common operating loop is:

**Human intent → structured knowledge → specification → orchestration → implementation → verification → durable context**

> **You should only have to mean something once.**

## Responsibility Domains

| Project | Formal Role | Core Question |
| --- | --- | --- |
| **Chief of Staff** | Organization & Lifecycle | What are we trying to accomplish and what state is the work in? |
| **Trust Issues** | Epistemology & Evidence | How do we know this is true? |
| **Execution** | Function & Implementation | What does the system do, and how is that behavior realized? |
| **Vibes** | Architecture & Topology | How is the system constructed and connected? |
| **DevNotes** | Knowledge & Classification | What do we know, and how can we recover it? |
| **Schemes** | Ontology & Modeling | What exists, relates, and is valid? |
| **Prömpter** | Language & Semantics | What do we call things, and how is intent communicated? |
| **Fuck You Pay Me** | Domain & External Reality | What real-world business entities, obligations, authorities, customers, and money does the system interact with? |

Canonical ownership does not imply exclusive use. One role owns the universal meaning; other roles consume it.

## Artifact Format Contract

### Markdown — human-readable governance and working artifacts

- `Project-Home.md`
- `PRD.md`
- `Tech-Requirements.md`
- `Architecture.md`
- `Design.md`
- `Auth.md`
- `Specification.md`
- `Knowledge-Model.md`
- `Research.md`
- `Deep-Research.md`
- `Reference.md`
- `Capture.md`
- `Work-Package.md`
- `Task.md`
- `Prompt-Contract.md`
- `Data-Model.md`
- `Verification-Evidence.md`
- `Business-Operation.md`
- `Roadmap.md`
- `OKR.md`
- `Milestone.md`
- `Devlog-Writing.md`

### YAML — machine-readable contracts

- `Product.yaml`
- `Validation.yaml`
- `Design.yaml`

### JSON — execution records

- `Decision.json`
- `Handoff.json`
- `Progress.json`

**Markdown explains. YAML constrains. JSON states what happened or what state is being transferred.**

## Naming Contract

Human-facing durable artifacts use short, ordinary, descriptive filenames. Spaces, capitalization, and familiar document names are allowed and preferred when they improve readability.

Do **not** encode taxonomy, role, project, domain, type, authority, or lifecycle as dot-separated filename segments. Do not generate semantic dot-notation filenames.

Classification belongs in:

- the role/folder location;
- Properties;
- tags;
- wikilinks and typed relationships;
- Bases and other retrieval surfaces.

Machine artifacts may use filenames required by a tool or format, but there is no DevNotes semantic dot-notation naming convention.

Existing protected historical material is not renamed merely to conform to this rule. New and actively governed material follows this rule.

## Metadata Contract

### Tags classify

Tags answer:

- What kind of material is this?
- What subject does it concern?
- Which semantic facet should retrieve it?
- Which engineering/domain concepts appear here?

Tags do **not** determine canonical ownership.

A DevNotes artifact may therefore carry an `ontology` tag without DevNotes becoming the owner of Ontology.

### Properties represent useful mutable state

Properties primarily exist when the user or system will actually change them.

#### Project

`Status`  
`Priority`  
`Health`  
`Phase`  
`Progress`  
`Target`  
`Next Action`

#### Governance

`Status`  
`Authority`  
`Review State`

#### Specification

`Status`  
`Priority`  
`Implementation State`  
`Validation State`

#### Decision

`Status`  
`Impact`  
`Decision Date`

#### Research

`Status`  
`Confidence`  
`Disposition`

#### Task

`Status`  
`Priority`  
`Due`  
`Scheduled`  
`Project`  
`Blocked By`

#### Writing

`Stage`  
`Publish Status`

### State vocabularies

Knowledge lifecycle:

**Draft → Review → Active → Superseded → Archived**

Work lifecycle:

**Backlog → Ready → In Progress → Blocked → Done / Cancelled**

Project health:

**On Track / At Risk / Blocked / Paused**

Authority:

**Source of Truth / Working / Reference / Derived / Historical**

Meta Bind is the ordinary editing surface for these states. Routine workflow must not require manually editing YAML.

The discarded authority vocabulary (`canonical`, `supporting`, `implementation-evidence`, `project-specific`, `operational`) is not an alias set and must not be generated by active governance, templates, controls, or machine contracts.

## Knowledge-Graph Contract

Internal durable relationships use wikilinks and backlinks.

Explicit typed relationships are introduced only when the edge itself carries important semantics:

- `part_of`
- `depends_on`
- `implements`
- `refines`
- `validates`
- `evidence_for`
- `derived_from`
- `supersedes`
- `governed_by`
- `connects_to`

The canonical traceability path is:

**source → claim → decision → specification → artifact → validation → evidence**

Links exist because they improve recovery, provenance, navigation, dependency reasoning, or authority—not to inflate graph density.

## Shared Obsidian Interaction Contract

| Plugin | System Responsibility |
| --- | --- |
| **Hearth** | Primary operating shell and dashboard layer |
| **Bases** | Retrieval, facets, projections, lists, tables, cards, health views |
| **Meta Bind** | Mutable state controls |
| **Note Toolbar** | Context-sensitive actions and commands |
| **Callout Studio** | Semantic visual language |
| **Templater** | Deterministic artifact creation |
| **QuickAdd** | Friendly creation commands/macros |
| **TaskNotes** | Task lifecycle, Kanban, calendar, agenda |
| **Code Space** | Live implementation/repository surface |
| **Canvas** | Spatial ontology/topology/model reasoning |
| **Iconic** | Semantic role/artifact/action wayfinding |
| **Git** | Provenance and durable version history |
| **Web Clipper** | External capture/reference intake |
| **Linter** | Safe structural cleanup only |
| **Obsidian CLI** | Environment automation |

**Note Toolbar performs actions. Meta Bind changes state. Templater creates deterministic artifact shapes. QuickAdd makes those creation flows convenient. Bases retrieves. Hearth composes the operating interface.**

## Shared Callout Vocabulary

Operational / epistemic:

`truth`, `decision`, `requirement`, `working`, `risk`, `blocked`, `evidence`, `handoff`, `spark`, `deprecated`

Engineering / semantic:

`source-of-truth`, `product-definition`, `entity`, `transition`, `boundary`, `contract`, `constraint`, `invariant`

Callouts annotate meaning. They do not duplicate mutable property state.

Dense semantic vocabulary may use smaller inline markers rather than turning every concept into a large callout block.

# Role Manifests

## Chief of Staff

### Responsibility

Owns global project-management semantics and the lifecycle of work.

Other roles own their substantive work. Chief of Staff owns the state, scheduling, sequencing, priority, milestone, blocker, and handoff surrounding it.

A role-scoped Kanban is a projection of that role's work. It does not transfer project-management ownership to that role.

### Tags

`mission`, `product-intent`, `requirements`, `goals`, `objectives`, `initiatives`, `roadmaps`, `project-definitions`, `project-manager-state`, `milestones`, `work-allocation`, `governance-roles`, `ownership`, `lifecycle-of-work`

### Primary Templates

`Project-Home.md`, `PRD.md`, `Product.yaml`, `Task.md`, `Roadmap.md`, `OKR.md`, `Milestone.md`, `Decision.json`, `Handoff.json`, `Progress.json`

### Primary Properties

Project, Task, and Decision property families.

### Callouts

`requirement`, `decision`, `working`, `blocked`, `handoff`, `risk`

### Plugins

**Primary:** Hearth, TaskNotes, Meta Bind, Bases, QuickAdd, Note Toolbar, Templater  
**Supporting:** Git, Iconic, Callout Studio

### TypeScripture™

Primary correspondence:

- Chapter 10 — Product Contract
- Chapter 17 — Governance System / Specification Model
- Chapter 19 — System Lifecycle
- Role
- Responsibility
- Lifecycle
- State
- Transition
- Governance
- Orchestration

### Codependent Coding™

Operationalizes the product/generation lifecycle surrounding:

**Ontology™ → Anthimeria™ → Virgule™ → resolution/materialization → Arrangement™**

Tracks goals, commitments, sequencing, milestones, work state, and coordination without redefining the engineering constituents themselves.

### Dashboard / Launcher Actions

Create Project; Create PRD; Plan Work; Create Task; Create Milestone; Review Blocked Work; Record Decision; Create Handoff; Advance Project State; Review Message Board.

## Trust Issues

### Responsibility

Owns epistemology, validation, evidence, conformance, contradiction, falsification, reconciliation, and confidence.

A claim is not true because a summary says the work completed.

### Tags

`epistemology`, `architecture-principles`, `security-perspective`, `ux-perspective`, `verification-perspective`, `design-philosophy`, `decision-records`, `adrs`, `assumptions`, `risks`, `tradeoffs`, `audits`, `critiques`, `confidence`, `unresolved-ambiguity`

### Primary Templates

`Validation.yaml`, `Verification-Evidence.md`, `Research.md`, `Deep-Research.md`, `Decision.json`, `Progress.json`

Consumes `Specification.md` as the thing to validate.

### Primary Properties

Governance; Research; Specification Validation State; Decision.

### Callouts

`truth`, `source-of-truth`, `evidence`, `risk`, `constraint`, `invariant`, `decision`, `blocked`

### Plugins

**Primary:** Bases, Callout Studio, Meta Bind, Note Toolbar, Git  
**Supporting:** Templater, Code Space, Hearth, Iconic

### TypeScripture™

Chapters 01–02 — Epistemology / Engineering Practice; Chapter 13 — Validation Contract; Chapter 23 — Source Provenance; evidence semantics; validation; conformance; quality gates; tests; static analysis; authority; confidence; falsification.

### Codependent Coding™

Validates resolved configuration and generated system across Virgule™, Arrangement™, Loaded Vibes™ enforcement, generation results, architecture contracts, and runtime evidence.

Preserves the distinction: **passed / failed / skipped / blocked / inferred**.

### Dashboard / Launcher Actions

Start Verification; Review Evidence; Validate Specification; Record Finding; Reconcile Contradiction; Audit Claim; Open Implementation Evidence; Record Validation Result.

## Execution

### Responsibility

Owns implementation, behavior, workflows, operations, work packages, implementation specifications, and functional realization.

GitHub Projects v2 remains execution authority for actual repository issue/PR delivery.

### Tags

`workflows`, `use-cases`, `features`, `operations`, `commands`, `queries`, `business-behavior`, `interfaces`, `lifecycle-transitions`, `acceptance-behavior`, `state-changing-functions`, `implementation-specifications`

### Primary Templates

`Specification.md`, `Work-Package.md`, `Tech-Requirements.md`, `Progress.json`, `Handoff.json`, `Decision.json`

Consumes `Validation.yaml`.

### Primary Properties

Specification; Task.

### Callouts

`requirement`, `contract`, `constraint`, `invariant`, `transition`, `working`, `blocked`, `evidence`, `deprecated`

### Plugins

**Primary:** Code Space, Git, Note Toolbar, Templater, TaskNotes  
**Supporting:** Bases, Meta Bind, QuickAdd, Hearth, Callout Studio, Iconic

### TypeScripture™

Chapter 09 — Patterns Catalog; Chapter 12 — Execution Contract; Chapter 14 — Application Workflow; Chapter 16 — Fetcher; Chapter 18 — Server Action; Chapter 20 — Transaction Helper; Chapter 21 — Webhook Processor; Chapter 24 — Route / Feature Orchestration; workflow; operation; command; query; side effect; idempotency; pattern; implementation; acceptance behavior.

### Codependent Coding™

Primary implementation correspondence: **Maximal Template™**, **BusinessLogic Blocks™**, **PureUI Blocks™**, **Arrangement™**.

Execution realizes workflows and implementation patterns including Fetchers, Server Actions, transaction helpers, webhook processors, route/feature orchestration, acceptance criteria, repository work, issues, PRs, and actual code.

### Dashboard / Launcher Actions

Open Code Space; Create Specification; Create Work Package; Start Implementation; Open GitHub Work; Record Progress; Record Implementation Decision; Create Handoff; Run Validation.

## Vibes

### Responsibility

Owns architecture, topology, boundaries, layer structure, dependency direction, infrastructure, environment, deployment, integration architecture, and technical placement.

Execution decides how behavior is implemented. Vibes determines where that behavior belongs and how its environment connects.

### Tags

`hipster-stack`, `runtimes`, `infrastructure`, `vercel`, `neon`, `node`, `pnpm`, `operating-systems`, `local-development`, `ci-cd`, `repositories`, `deployment`, `environments`, `toolchains`, `local-mounts`, `plugin-platform-configuration`, `operational-topology`

### Primary Templates

`Tech-Requirements.md`, `Architecture.md`, `Design.md`, `Design.yaml`, `Auth.md`, `Decision.json`

Consumes product intent from `PRD.md` / `Product.yaml`.

### Primary Properties

Governance; Specification where applicable; Decision.

### Callouts

`boundary`, `contract`, `constraint`, `invariant`, `product-definition`, `risk`, `decision`, `deprecated`

### Plugins

**Primary:** Canvas, Hearth, Bases, Note Toolbar, Callout Studio, Git  
**Supporting:** Templater, Code Space, Meta Bind, Iconic

### TypeScripture™

Chapter 03 — Architecture Contract; Chapter 04 — Engineering System Definition; Chapter 07 — Knowledge/System structural definition; Chapter 11 — Layer Contract; Chapter 15 — Auth/Authz Boundary; Chapter 22 — System Map; Mereology; Topology; Architecture; Boundary; Layer; Dependency; Dependency Direction; Integration; Runtime; Deployment; Environment; Trust Boundary.

### Codependent Coding™

Primary correspondence: **Hipster Stack™ Technology Stack**, **Loaded Vibes™ Codex Plugin architecture**, **Visual Vibes™ Design System**, architectural structure of **Maximal Template™**.

Also owns architectural reasoning around Simples™, layers, provider boundaries, RLS/security topology, repository topology, deployment, CI/CD, and integration architecture.

### Dashboard / Launcher Actions

Create Technical Requirements; Create Architecture; Create Design; Create Auth/Security Model; Create Topology Map; Inspect Repository Architecture; Review Environment; Record ADR.

## DevNotes

### Responsibility

Owns classification and durable recoverability: taxonomy, tags, property-system stewardship, metadata semantics, faceted classification, information architecture, knowledge graph, wikilinks, backlinks, typed relationships, provenance, institutional memory, capture/inbox processing, duplicate/stale/orphan detection, and retrieval.

It does not take ownership of another role's concept merely because that concept appears as a tag.

### Tags

`ontology`, `terminology`, `taxonomy`, `typology`, `mereology`, `nomenclature`, `semantics`, `schemas`, `metadata`, `provenance`, `evidence`, `references`, `research`, `knowledge-graphs`, `raw-captures`

### Primary Templates

`Knowledge-Model.md`, `Research.md`, `Deep-Research.md`, `Reference.md`, `Capture.md`

DevNotes additionally maintains the metadata/template infrastructure surrounding **all** artifact families.

### Properties

DevNotes stewards the shared property vocabulary and Meta Bind implementation. Its own common state families are Research, Knowledge lifecycle, and Authority.

### Callouts

DevNotes co-stewards the entire shared callout system with Prömpter. Frequent role-specific use: `source-of-truth`, `truth`, `evidence`, `decision`, `deprecated`, `spark`.

### Plugins

**Primary:** Bases, Meta Bind, Templater, QuickAdd, Note Toolbar, Callout Studio, Hearth  
**Infrastructure:** Git, Linter, Iconic, Web Clipper  
**Supporting:** Canvas

### TypeScripture™

Chapter 06 — Knowledge Modeling / Ontology-Taxonomy; Chapter 07 — Knowledge System Definition; Chapter 22 — Knowledge/System Map; Chapter 23 — Source Provenance; Taxonomy; Metadata; Folksonomy; Faceted Classification; Information Architecture; Knowledge Graph; Provenance.

### Codependent Coding™

Preserves and exposes relationships among TypeScripture doctrine, Codependent Coding product definitions, specifications, decisions, generation/configuration artifacts, implementation artifacts, validation, evidence, and provenance. It does not redefine their substantive engineering meaning.

### Dashboard / Launcher Actions

Process Inbox; Create Research; Create Reference; Promote Capture; Audit Vault; Find Orphans; Find Stale Material; Find Weak Links; Reconcile Knowledge; Manage Properties; Manage Tags; Manage Template Infrastructure; Review Provenance.

## Schemes

### Responsibility

Owns ontology and modeling: entities, relationships, attributes, cardinality, states, state models, invariants, schemas, domain models, database models, Prisma schemas, enums, DTO/data shapes, entity catalogs, relationship maps, lifecycle models.

### Tags

`entities`, `modules`, `components`, `simples`, `pureui-blocks`, `businesslogic-blocks`, `types`, `attributes`, `domain-models`, `dtos`, `ports-interfaces`, `database-models`, `structural-boundaries`, `part-whole-relationships`

### Primary Templates

`Product.yaml`, `Data-Model.md`, `Specification.md` where model/schema-driven, `Tech-Requirements.md` for structural/data requirements, supporting `Architecture.md`.

### Primary Properties

Governance; Specification.

### Callouts

`entity`, `transition`, `invariant`, `constraint`, `contract`, `boundary`, `product-definition`, `source-of-truth`

### Plugins

**Primary:** Bases, Canvas, Templater, Meta Bind  
**Supporting:** Note Toolbar, Callout Studio, Code Space, Hearth, Iconic

### TypeScripture™

Chapter 05 — Ontology Contract; Chapter 06 — Knowledge Modeling / Ontology-Taxonomy; Chapter 10 — Product Contract / Domain Model; Chapter 11 — Layer Contract / Schema; Chapter 19 — System Lifecycle where modeled state is involved; Ontology; Schema; Domain Model; Entity; Relationship; Cardinality; State; Invariant; Record; DTO; Projection; Mapper.

### Codependent Coding™

Primary correspondence: **Ontology™ Normalized Defaults**, **Simples™ Normalized Blocks**, **Virgule™ Application Definition**.

Also owns structural definitions underlying PureUI Blocks™ and BusinessLogic Blocks™, entity catalogs, application/commercial models, runtime schemas, and lifecycle structures.

### Dashboard / Launcher Actions

Create Data Model; Define Entity; Define Relationship; Define State Model; Define Invariant; Create Schema; Open Model Map; Inspect Live Schema; Validate Model.

## Prömpter

### Responsibility

Owns language, terminology, nomenclature, semantics, controlled vocabulary, requirements normalization, specification language, prompt/instruction grammar, communication contracts, and handoff grammar.

Prömpter defines the grammar. Chief of Staff manages the traffic.

### Tags

`prompts`, `instructions`, `handoffs`, `message-contracts`, `event-vocabulary`, `api-semantics`, `communication-standards`, `chatgpt-project-coordination`, `documentation-style`, `message-board`, `user-agent-protocols`, `interaction-contracts`

### Primary Templates

`Prompt-Contract.md`, `Specification.md`, `Handoff.json`, `PRD.md` where human intent requires formalization, `Product.yaml` where product semantics become machine-readable.

### Primary Properties

Governance; Specification.

### Callouts

`requirement`, `contract`, `boundary`, `product-definition`, `decision`, `handoff`

### Plugins

**Primary:** Templater, QuickAdd, Note Toolbar, Callout Studio  
**Supporting:** Bases, Meta Bind, Hearth, Iconic

### TypeScripture™

Chapter 08 — System Architecture Terminology; Chapter 17 — Governance / Specification Model; Terminology; Nomenclature; Semantics; Contract; Interface; Specification language; controlled vocabulary; symbol/event naming.

### Codependent Coding™

Owns canonical language and semantic contract surrounding Anthimeria™, Ontology™, Simples™, PureUI Blocks™, BusinessLogic Blocks™, Virgule™, Hipster Stack™, Maximal Template™, Arrangement™, Loaded Vibes™, and Visual Vibes™.

Also owns capability names, event names, error-code conventions, agent instructions, prompts, handoff payload grammar, and Application Definition semantics.

### Dashboard / Launcher Actions

Define Term; Normalize Requirement; Create Prompt Contract; Create Specification; Review Naming; Review Semantics; Create Handoff; Review Communication Contract.

## Fuck You Pay Me

### Responsibility

Owns real-world domain and external reality encountered by the system: customers, leads, vendors, payments, subscriptions, billing, invoices, commercial obligations, providers, external authorities, business events, connected accounts, and external relationships.

Schemes owns universal ontology. Fuck You Pay Me supplies actual business-domain substance and external authority.

### Tags

`external-providers`, `customers`, `vendors`, `connected-accounts`, `api-integrations`, `webhooks`, `adapters`, `github-connections`, `email`, `calendars`, `financial-services`, `business-relationships`, `crm-relationships`, `external-connected-systems`, `code-space-mounts`

### Primary Templates

`Business-Operation.md`, `PRD.md`, `Product.yaml`, `Tech-Requirements.md` for external integration requirements, `Auth.md` for external actors/providers/trust, `Specification.md`.

### Primary Properties

Governance; Project/Task where operational work exists; Decision.

### Callouts

`entity`, `contract`, `boundary`, `requirement`, `risk`, `evidence`, `transition`, `decision`, `source-of-truth`

### Plugins

**Primary:** Hearth, Bases, Meta Bind, TaskNotes  
**Supporting:** Note Toolbar, Templater, QuickAdd, Web Clipper, Git, Iconic

### TypeScripture™

Chapter 10 — Product Contract / Domain Model; Chapter 15 — Auth/Authz Boundary; Chapter 16 — Fetcher where external reads occur; Chapter 21 — Webhook Processor; Provider; Adapter; API; Webhook; Authentication; Authorization; Actor; Capability; Policy; Trust Boundary; Reconciliation; external authority.

### Codependent Coding™

External/domain correspondence includes Customer, Subscription, Plan, Price, Entitlement, Checkout Session, Connected Account, Payment, Provider Event, Provider Mirror, and Reconciliation.

These domain facts feed Ontology™, Maximal Template™, BusinessLogic Blocks™, provider integrations, and generated Arrangements™ without transferring universal modeling ownership away from Schemes.

### Dashboard / Launcher Actions

Create Business Operation; Record External Entity; Capture External Source; Define Provider Interaction; Record Commercial Event; Review Obligation; Create Integration Specification; Reconcile External State.

# Canonical Governance Template Shapes

## PRD.md

Product Definition; Problem / Opportunity; Product Goal; Users / Actors; User Needs; Primary Use Cases; Capabilities; Scope — In / Out; Product Constraints; Dependencies / Integrations; UX Requirements; Security / Privacy Requirements; Non-Goals; Success Criteria; Acceptance Criteria; Open Questions; Related Decisions.

## Tech-Requirements.md

Scope; Technical Baseline; Runtime / Platform; Repository Structure; Framework Requirements; Data Requirements; Persistence; Runtime Validation; Type Contracts; Authentication; Authorization; Integrations / Providers; API / HTTP Requirements; Webhooks / Events; Caching; Environment / Configuration; Observability; Performance; Accessibility; Security; Testing; Validation Commands; Deployment Requirements; Destructive / Live Operation Rules; Technical Non-Goals.

## Architecture.md

Architectural Identity; Governing Principles; System Context; Canonical Vocabulary; System Boundaries; Responsibility Ownership; Layer Model; Dependency Direction; Application Structure; Route / Interface Topology; Presentation Architecture; Domain / Feature Architecture; Data Architecture; Persistence Architecture; Authentication Architecture; Authorization Architecture; Integration Architecture; Event / Webhook Architecture; Workflow Architecture; Cache Architecture; Runtime Flow; Deployment Topology; Architectural Invariants; Explicit Anti-Patterns; Reference / Golden Vertical Slice; Architecture Diagram; Related ADRs.

## Design.md

Design Objective; Product Character; Visual Language; Theme Policy; Design Tokens; Primitive System; Component System; Layout System; Navigation; Forms; Tables / Dense Data; Empty / Loading / Error States; Responsive Behavior; Accessibility; Interaction Design; Motion; Content / Copy; Visual References; Screenshots; Moodboard; Design Decisions.

## Auth.md

Purpose; Trust Model; Identity Provider; Sign-In / Sign-Up; Session Model; Local Application Identity; Authentication; Authorization; Roles; Capabilities; RBAC; ABAC; Resource Policies; Tenant / Ownership Model; Protected Read Path; Protected Mutation Path; Database Security; Row-Level Security; API Security; Webhook Security; Provider Security; Secrets; Environment Boundaries; Failure Semantics; Administrative Access; Threats / Abuse Cases; Security Invariants; Security Validation.

## Specification.md

Objective; Context; Problem; Scope; Requirements; Functional Behavior; Technical Behavior; Files / Components Affected; Interfaces / Contracts; Data Changes; Security Considerations; UI / UX Requirements; Edge Cases; Failure Behavior; Dependencies; Non-Goals; Acceptance Criteria; Validation; Definition of Done; Related Requirements; Related ADRs.

# Machine Contract Shapes

## Product.yaml

```yaml
version: 1
product:
  name:
  definition:
  problem:
  goal:
  actors: []
  user_needs: []
  use_cases: []
  capabilities: []
  scope:
    in: []
    out: []
  constraints: []
  dependencies: []
  integrations: []
  ux_requirements: []
  security_privacy_requirements: []
  non_goals: []
  success_criteria: []
  acceptance_criteria: []
  open_questions: []
  related_decisions: []
```

## Validation.yaml

```yaml
version: 1
validation:
  philosophy:
  quality_gates:
    formatting:
    static_analysis:
    type_safety:
    runtime_validation:
    architecture_validation:
    contract_validation:
    build_validation:
    deployment_validation:
    smoke_testing:
  testing:
    unit:
    integration:
    database:
    security:
    e2e:
    accessibility:
  gates:
    fast:
    ci:
    release:
  evidence_semantics:
    executed:
    failed:
    skipped:
    blocked:
    inferred:
  high_risk_validation: []
  acceptance_criteria: []
  definition_of_done: []
```

## Design.yaml

```yaml
version: 1
design:
  objective:
  product_character:
  visual_language:
  theme_policy:
  tokens:
    color: {}
    typography: {}
    spacing: {}
    radius: {}
    borders: {}
    shadows: {}
    motion: {}
  primitives: []
  components: []
  layout: []
  navigation: []
  forms: []
  dense_data: []
  states:
    empty: []
    loading: []
    error: []
  responsive_behavior: []
  accessibility: []
  interaction_design: []
  content_copy: []
  references: []
  decisions: []
```

## Decision.json

```json
{
  "version": 1,
  "decision": "",
  "status": "",
  "decision_date": "",
  "impact": "",
  "context": "",
  "problem": "",
  "options_considered": [],
  "selected_approach": "",
  "rationale": "",
  "consequences": { "positive": [], "negative": [], "risks": [] },
  "dependencies": [],
  "supersedes": [],
  "related_decisions": []
}
```

## Handoff.json

```json
{
  "version": 1,
  "from": "",
  "to": "",
  "objective": "",
  "current_state": "",
  "completed": [],
  "in_progress": [],
  "remaining": [],
  "decisions": [],
  "constraints": [],
  "blockers": [],
  "relevant": { "files": [], "notes": [], "code": [] },
  "exact_next_action": ""
}
```

## Progress.json

```json
{
  "version": 1,
  "current_state": "",
  "completed": [],
  "changed": [],
  "blocked": [],
  "next": [],
  "evidence": []
}
```

# Additional Operational Template Shapes

## Project-Home.md

Project Identity; Purpose / Outcome; Current State; Next Action; Current Milestone; Blockers; Decisions Needed; Governance Documents; Active Specifications; Current Work; Recent Decisions; Research; Code / Repository; Assets; Recent Activity.

## Knowledge-Model.md

Scope; Concepts Used; Canonical Owners; Classification Model; Metadata / State Model; Relationship Model; Authority / Provenance; Retrieval / Facets; Knowledge-Graph Connections; Known Conflicts; Related Canon.

This document applies the shared knowledge model to a project; it does not redefine universally owned concepts.

## Research.md

Question; Why It Matters; Scope; Sources; Evidence; Findings; Contradictions; Unknowns; Analysis; Implications; Recommendations; Related Projects; Related Decisions; Follow-Up.

## Deep-Research.md

Research Question; Decision Context; Scope; Source Criteria; Source Log; Evidence Matrix; Competing Claims; Contradictions; Unknowns; Synthesis; Confidence Assessment; Implications; Recommendations; Citations / Provenance; Follow-Up.

## Reference.md

Source; What It Is; Why It Matters; Key Information; Relevant Concepts; Project Relevance; Related Notes.

## Capture.md

Capture; Context; Related; Disposition.

Disposition supports: Keep; Promote; Attach to Project; Archive.

## Work-Package.md

Objective; Context; Scope; Inputs; Requirements; Constraints; Files / Systems Affected; Tasks; Acceptance Criteria; Validation; Completion Evidence; Result; Follow-Up.

## Task.md

Objective; Context; Responsible Role; Project; Priority; Due / Scheduled; Dependencies; Blocked By; Related Specification; Related Work Package; Acceptance Condition; Next Action; Completion Evidence.

## Prompt-Contract.md

Purpose; Intent; Target Agent / Audience; Inputs; Required Context; Authority / Sources; Instructions; Terminology; Constraints; Tool / Resource Expectations; Output Contract; Failure / Uncertainty Behavior; Handoff Behavior; Acceptance Criteria; Examples where useful.

## Data-Model.md

Model Scope; Domain Context; Entities; Attributes; Identifiers; Relationships; Cardinality; States; Transitions; Invariants; Tenancy / Ownership; Data Lifecycle; Persistence Mapping; DTOs / Projections; Validation Rules; Diagram / Map; Related Decisions.

## Verification-Evidence.md

Claim; Expected Result; Verification Method; Environment; Inputs; Executed Procedure; Observed Evidence; Result; Evidence Status; Limitations; Reproduction; Related Specification; Related Implementation; Follow-Up.

## Business-Operation.md

Business Objective; Actors; Business Entities; Trigger; Preconditions; Workflow; Obligations; External Authority; Providers / Systems; Commercial / Financial Effect; State Transitions; Failure Behavior; Reconciliation; Controls; Evidence; Related Specifications.

## Roadmap.md

Outcome; Planning Horizon; Initiatives; Milestones; Dependencies; Risks; Current Sequence; Decisions; Progress.

## OKR.md

Objective; Key Results; Baseline; Target; Timeframe; Owner; Progress; Evidence; Related Initiatives.

## Milestone.md

Outcome; Target; Exit Criteria; Dependencies; Blockers; Related Work; Evidence of Completion.

## Devlog-Writing.md

Title / Working Title; Stage; Context; Draft; References; Assets; Related Work; Publication Notes; Publish Status.

# Dashboard Compilation Contract

Every role manifest compiles into two interfaces:

**Role Manifest → Hearth Dashboard**

and

**Role Manifest → ChatGPT Project Launcher**

Both consume the same definition of responsibility, templates, tags, properties, callouts, plugins, TypeScripture correspondence, Codependent Coding correspondence, actions, and work projections.

The derivation direction is explicit:

**Role Manifest Specification → machine role registry → Hearth dashboard + ChatGPT Project launcher**

The human role manifest is the canonical definition. Machine registries and rendered interfaces are projections. They must not independently redefine role semantics.

A role dashboard should generally surface role identity, current work, role-scoped Kanban projection, tasks, calendar/schedule where relevant, notes/files in scope, templates, quick actions, relevant Bases, recent decisions, and recent activity.

Role-specific panels emphasize:

- Chief of Staff → lifecycle, projects, blockers, handoffs
- Trust Issues → evidence, validation, contradictions
- Execution → specifications, Code Space, implementation
- Vibes → architecture, topology, environment
- DevNotes → retrieval, inbox, graph health, metadata
- Schemes → models, schemas, relationships, maps
- Prömpter → terminology, prompts, specifications, communication
- Fuck You Pay Me → customers, providers, obligations, commercial state

# Cross-System Invariants

- Chief of Staff owns project/task/Kanban lifecycle state globally.
- GitHub Projects v2 owns repository execution state.
- Execution owns Code Space as the primary live-code workbench.
- Live repository source is authority for actual current implementation behavior.
- DevNotes owns properties, tags, links/backlinks, information architecture, retrieval, and durable graph health.
- Properties represent useful mutable state.
- Tags classify.
- Callouts communicate semantics.
- Prömpter defines communication grammar.
- Chief of Staff manages coordination traffic.
- Receiving roles own the work handed to them.
- Trust Issues decides whether evidence supports claims.
- Schemes owns universal ontology/modeling.
- Fuck You Pay Me supplies external/business reality.
- Vibes owns architecture and technical placement.
- Execution owns behavioral realization.
- TypeScripture supplies doctrine.
- Codependent Coding supplies the engineering system that realizes it.
- Templates instantiate doctrine for a concrete project rather than rewriting universal doctrine into every project document.
- The dashboard is the rendered result of reconciliation.
- The role manifest is the shared source for both Obsidian dashboards and ChatGPT Project launchers.
- The system is an execution interface, not a filing cabinet.

## Protected Content Boundary

Governance refactors do not rename, reorganize, rewrite, migrate, or clean material under:

- `ZETTLECASTEN/`
- `CIGARETTES, REGRETS, & NEURAL NETS/`

Those areas may contain historical naming or metadata and are not active governance sources. Their contents remain untouched unless the user explicitly requests work inside them.
