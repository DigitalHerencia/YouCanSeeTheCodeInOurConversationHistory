# Obsidian
## Backlog
- Finish Meta Bind configuration.
- Normalize Linter.
- Replace Iconize → Iconic.
- Retire Kanban after replacement exists.
- Install TaskNotes.
- Install QuickAdd.
- Install Image Converter.
- Decide Omnisearch/Excalidraw.
- Establish `_MOUNTS`.
- Define CSS/theme foundation.
## **Bases**

### Views

- Active Projects
- At Risk
- Current Work
- Blocked
- Due Soon
- Recent
- Source of Truth
- Governance
- Decisions
- Research
- Captures
- Orphans
- Weakly Linked
- Stale
- Archived

### Tags

| Organization  | What are we trying to accomplish, and how is responsibility organized?               | - Mission<br>- product intent<br>- requirements<br>- goals<br>- objectives<br>- initiatives<br>- roadmaps<br>- project definitions<br>- project manager state<br>- milestones<br>- work allocation<br>- governance roles<br>- ownership<br>- lifecycle of work                                                                 |
| ------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Perspective   | From what viewpoint are we examining the system, and what concerns does that expose? | - epistemology<br>- architecture principles<br>- security perspective<br>- UX perspective<br>- verification perspective<br>- design philosophy<br>- decision records<br>- ADRs<br>- assumptions<br>- risks<br>- tradeoffs<br>- audits<br>- critiques<br>- confidence<br>- unresolved ambiguity                                 |
| Function      | What does the system do?                                                             | - workflows<br>- use cases<br>- features<br>- operations<br>- commands<br>- queries<br>- business behavior<br>- interfaces<br>- lifecycle transitions<br>- acceptance behavior<br>- state-changing functions<br>- implementation specifications                                                                                |
| Information   | What do we know, what does it mean, and what rules describe it?                      | - Ontology<br>- Terminology<br>- Taxonomy<br>- Typology<br>- Mereology<br>- Nomenclature<br>- Semantics<br>- Schemas<br>- Metadata<br>- Provenance<br>- Evidence<br>- References<br>- Research<br>- Knowledge graphs<br>- Raw captures                                                                                         |
| Component     | What parts compose the system?                                                       | - entities<br>- modules<br>- components<br>- Simples™<br>- PureUI Blocks™<br>- BusinessLogic Blocks™<br>- types<br>- attributes<br>- domain models<br>- DTOs<br>- ports/interfaces<br>- database models<br>- compositional structure<br>- part/whole relationships                                                             |
| Communication | How does intent or information travel between actors and components?                 | - prompts<br>- instructions<br>- handoffs<br>- message contracts<br>- event vocabulary<br>- API semantics<br>- communication standards<br>- ChatGPT Project coordination<br>- documentation style<br>- message board<br>- user-agent protocols<br>- interaction contracts                                                      |
| Connector     | What crosses boundaries and connects this system to another system?                  | - external providers<br>- customers<br>- vendors<br>- connected accounts<br>- API integrations<br>- webhooks<br>- adapters<br>- GitHub connections<br>- email<br>- calendars<br>- financial services<br>- business relationships<br>- CRM relationships<br>- repositories as external connected systems<br>- Code Space mounts |
| Environment   | In what technical and operational surroundings does the system exist?                | - Hipster Stack<br>- runtimes<br>- infrastructure<br>- Vercel<br>- Neon<br>- Node<br>- pnpm<br>- operating systems<br>- local development<br>- CI/CD<br>- repositories<br>- deployment<br>- environments<br>- toolchains<br>- local mounts<br>- plugin/platform configuration<br>- operational topology                        |

## **Canvas**

```
DEVNOTES
────────────────────────────────────────────────────

NOW
[ Next Action ] [ Blocked ] [ Due Soon ]

ACTIVE PROJECTS
[ Codependent Coding ] [ RateLtd ] [ … ]

RESUME
Recently edited / recently opened

WORK
My Tasks | Today | This Week

CAPTURE
+ Note
+ Research
+ Decision
+ Project
+ Spec

INBOX
Zettelkasten captures needing processing

STUDIO
Writing | Images | Canvas | Ideas

RESEARCH
Recent | Unresolved | Ready to Promote

VAULT HEALTH
Orphans | Stale Notes | Broken Links | Old Captures

```
## **Git**

- ACTIVITY
- Recent Changes  
- Agent Activity
## **QuickAdd**

+ New Project
+ Capture
+ Research
+ Decision
+ Specification
+ Work Package
+ Handoff
## Code Space

```
# Research

## Question
## Why It Matters
## Scope

## Sources
## Evidence

## Findings
## Contradictions
## Unknowns

## Analysis
## Implications

## Recommendations

## Related Projects
## Related Decisions
## Follow-Up
```
### Codex Work Package 

```
# Work Package

## Objective
## Context
## Scope

## Inputs
## Requirements
## Constraints

## Files / Systems Affected

## Tasks
## Acceptance Criteria
## Validation

## Completion Evidence
## Result
## Follow-Up
```

## Hearth

### Home

```
DEVNOTES

NOW
────────────────────────
Next action
Blocked
Due soon

ACTIVE PROJECTS
────────────────────────
[ visual project cards ]

RESUME
────────────────────────
recent work

WORK
────────────────────────
Today
This week

CREATE
────────────────────────
Capture | Research | Decision
Spec | Project | Handoff

INBOX
────────────────────────
Unprocessed captures

STUDIO
────────────────────────
Writing | Images | Canvas

RESEARCH
────────────────────────
Active | Ready to synthesize

VAULT HEALTH
────────────────────────
Orphans | stale | broken links

ACTIVITY
────────────────────────
Git | recent changes

```

### Dashboard Template

```
# Project

> Project identity / one-sentence description

## Current State
## Next Action
## Current Milestone
## Blockers
## Decisions Needed

## Governance
- PRD
- Technical Requirements
- Architecture
- Design
- Auth & Security
- Knowledge Model
- Validation

## Active Specifications
![[project.specifications.base]]

## Work
![[project.tasks.base]]

## Recent Decisions
![[project.decisions.base]]

## Research
![[project.research.base]]

## Code / Repository
## Assets
## Recent Activity
```

## Meta Bind 

### Example

``` yaml
Status        [ Active ▾ ]
Priority      [ High ▾ ]
Target        [ Sep 1, 2026 ]
Progress      [ ██████████░░░░ 72% ]

Next Action
┌─────────────────────────────────────────┐
  Finish canonical generation workflow     
└─────────────────────────────────────────┘

[ Start Work ] [ Add Decision ] [ Handoff ] [ Complete ]

```

### Project

```
Status
Priority
Health
Phase
Progress
Target
Next Action
```

### Governance

```
Status
Authority
Review State
```

### Spec

```
Status
Priority
Implementation State
Validation State
```

### Decision

```
Status
Impact
Decision Date
```

### Research

```
Status
Confidence
Disposition
```

### Task

```
Status
Priority
Due
Scheduled
Project
Blocked By
```

### Writing

```
Stage
Publish Status
```


### Knowledge lifecycle

```
Draft
Review
Active
Superseded
Archived
```

### Work lifecycle

```
Backlog
Ready
In Progress
Blocked
Done
Cancelled
```

### Project health

```
On Track
At Risk
Blocked
Paused
```

### Authority

```
Source of Truth
Working
Reference
Derived
Historical
```


## Callout Studio

| Concept                      | System implementation                                                   |
| ---------------------------- | ----------------------------------------------------------------------- |
| **Epistemology**             | authority registry, provenance, evidence, conflict/reconciliation rules |
| **Ontology**                 | entities, relations, cardinalities, invariants                          |
| **Terminology**              | controlled vocabulary and definitions                                   |
| **Taxonomy**                 | bounded classifications                                                 |
| **Typology**                 | recurring artifact/implementation patterns                              |
| **Mereology**                | `part_of`, `contains`, `composed_of` relations                          |
| **Topology**                 | repository, runtime, folder, connector and environment maps             |
| **Nomenclature**             | folder/file/symbol/event naming rules                                   |
| **Semantics**                | meaning of statuses, relations, states and structures                   |
| **Schema**                   | machine-valid shapes                                                    |
| **Metadata**                 | instance properties                                                     |
| **Folksonomy**               | free tags only                                                          |
| **Faceted classification**   | independent metadata axes surfaced through Bases                        |
| **Information architecture** | Home, navigation, Maps, Bases and reading order                         |
| **Domain model**             | product-specific specialization of the ontology                         |
| **Knowledge graph**          | wikilinks + typed relationship properties                               |

## Note Toolbar

### Note

```
⌂ HOME   ← BACK   PROJECT   + CREATE   RELATED   MORE
```

### Project

```
OVERVIEW
WORK
SPECS
RESEARCH
DECISIONS
CODE
ASSETS
HANDOFF
```

### Governance

```
PROJECT
RELATED CONTRACTS
DECISIONS
EDIT STATUS
VALIDATE
```

### Research

```
PROJECT
SOURCES
RELATED
PROMOTE
DECISION
```

### Writing

```
STUDIO
REFERENCES
ASSETS
FOCUS
PREVIEW
```


## Templater

| Folder              | Behavior                   | Templates                                      |
| ------------------- | -------------------------- | ---------------------------------------------- |
| **Schemes**         | Ontology & Modeling        | Simples / data models / UI blocks              |
| **Prömpter**        | Language & Semantics       | agent prompts / handoffs                       |
| **Chief of Staff**  | Organization & Lifecycle   | goals / roadmap / PM                           |
| **Trust Issues**    | Epistemology & Evidence    | decisions / unresolved concerns / verification |
| **Execution**       | Function & Implementation  | Hipster Stack / repo / CI / deployment         |
| **Vibes**           | Architecture & Topology    | workflows / specs / current implementation     |
| **DevNotes**        | Knowledge & Classification | ontology / terminology / provenance            |
| **Fuck You Pay Me** | Domain & External Reality  | providers / APIs / webhooks                    |

### PRD.md template


```
# Product Requirements

## Product Definition
## Problem / Opportunity
## Product Goal
## Users / Actors
## User Needs
## Primary Use Cases
## Capabilities
## Scope
### In Scope
### Out of Scope

## Product Constraints
## Dependencies / Integrations
## User Experience Requirements
## Security / Privacy Requirements
## Non-Goals
## Success Criteria
## Acceptance Criteria
## Open Questions
## Related Decisions
```

### Tech-Requirements.md template

```
# Technical Requirements

## Scope
## Technical Baseline
## Runtime / Platform
## Repository Structure
## Framework Requirements
## Data Requirements
## Persistence
## Runtime Validation
## Type Contracts
## Authentication
## Authorization
## Integrations / Providers
## API / HTTP Requirements
## Webhooks / Events
## Caching
## Environment / Configuration
## Observability
## Performance
## Accessibility
## Security
## Testing
## Validation Commands
## Deployment Requirements
## Destructive / Live Operation Rules
## Technical Non-Goals
```

### Architecture.md template

```
# Architecture

## Architectural Identity
## Governing Principles
## System Context
## Canonical Vocabulary

## System Boundaries
## Responsibility Ownership

## Layer Model
## Dependency Direction

## Application Structure
## Route / Interface Topology
## Presentation Architecture
## Domain / Feature Architecture

## Data Architecture
## Persistence Architecture

## Authentication Architecture
## Authorization Architecture

## Integration Architecture
## Event / Webhook Architecture

## Workflow Architecture
## Cache Architecture

## Runtime Flow
## Deployment Topology

## Architectural Invariants
## Explicit Anti-Patterns
## Reference / Golden Vertical Slice

## Architecture Diagram
## Related ADRs
```

### Design.md template

```
# Design

## Design Objective
## Product Character
## Visual Language
## Theme Policy

## Design Tokens
### Color
### Typography
### Spacing
### Radius
### Borders
### Shadows
### Motion

## Primitive System
## Component System
## Layout System
## Navigation
## Forms
## Tables / Dense Data
## Empty / Loading / Error States

## Responsive Behavior
## Accessibility
## Interaction Design
## Motion
## Content / Copy

## Visual References
## Screenshots
## Moodboard
## Design Decisions
```

### Auth.md template

```
# Authentication & Security

## Purpose
## Trust Model

## Identity Provider
## Sign-In / Sign-Up
## Session Model
## Local Application Identity

## Authentication
## Authorization
### Roles
### Capabilities
### RBAC
### ABAC
### Resource Policies

## Tenant / Ownership Model
## Protected Read Path
## Protected Mutation Path

## Database Security
## Row-Level Security

## API Security
## Webhook Security
## Provider Security

## Secrets
## Environment Boundaries

## Failure Semantics
## Administrative Access

## Threats / Abuse Cases
## Security Invariants
## Security Validation
```

### Validation.yaml template

```
# Validation & Conformance

## Validation Philosophy
## Quality Gates

## Formatting
## Static Analysis
## Type Safety
## Runtime Validation

## Unit Testing
## Integration Testing
## Database Testing
## Security Testing
## E2E Testing
## Accessibility Testing

## Architecture Validation
## Contract Validation

## Build Validation
## Deployment Validation
## Smoke Testing

## Fast Gate
## CI Gate
## Release Gate

## Evidence Semantics
### Executed
### Failed
### Skipped
### Blocked
### Inferred

## High-Risk Validation
## Acceptance Criteria
## Definition of Done
```

### Specification.md template

```
# Specification

## Objective
## Context
## Problem
## Scope

## Requirements
## Functional Behavior
## Technical Behavior

## Files / Components Affected
## Interfaces / Contracts

## Data Changes
## Security Considerations
## UI / UX Requirements

## Edge Cases
## Failure Behavior

## Dependencies
## Non-Goals

## Acceptance Criteria
## Validation
## Definition of Done

## Related Requirements
## Related ADRs
```

### Decision.json template


```
# Architecture Decision

## Decision
## Status

## Context
## Problem

## Options Considered

### Option A
### Option B
### Option C

## Selected Approach
## Rationale

## Consequences
### Positive
### Negative
### Risks

## Dependencies
## Supersedes
## Related Decisions
```

### Handoff.json template

```
# Handoff

## From
## To
## Objective

## Current State
## Completed
## In Progress
## Remaining

## Decisions
## Constraints
## Blockers

## Relevant Files
## Relevant Notes
## Relevant Code

## Exact Next Action
```

### Progress.json template

```
# Progress Update

## Current State
## Completed
## Changed
## Blocked
## Next
## Evidence
```


## Obsidian Web Clipper

```
# Capture

[ Keep ] [ Promote ] [ Attach to Project ] [ Archive ]

## Capture

## Context

## Related
```

```
# Reference

## Source
## What It Is
## Why It Matters

## Key Information
## Relevant Concepts

## Project Relevance
## Related Notes
```

## Linter

- inserts `date created` and `date modified`
- changes heading capitalization
- generates title aliases
- autocorrects prose
- rewrites quote style
- converts spaces to **4-space tabs**
- while Obsidian itself is configured for **2**
- moves tags
- modifies YAML arrays
- modifies headings
- trailing whitespace
- sensible blank lines
- YAML syntax cleanup that does not change semantics
- list-marker consistency
- EOF newline
- duplicate YAML-array entries


---

# ChatGPT Projects

## Schemes — Ontology & Modeling

### Knowledge-model responsibilities

**Primary**

- Ontology
- Schema
- Domain model

**Secondary**

- Mereology
- Typology
- Metadata structure

### Human content

```
Schemes/
├── Canon/
│   ├── Ontology/
│   ├── Domain Models/
│   ├── Entity Catalogs/
│   ├── Relationships/
│   ├── Lifecycles/
│   └── Typologies/
│
├── Workspaces/
├── Reference/
└── Archive/
```

### Machine layer

```
Schemes/
├── .contracts/
│   ├── ontology/
│   ├── entities/
│   ├── relationships/
│   └── lifecycles/
│
├── .schemas/
└── .registries/
```

### Codependent Coding material here

```
Formal ontology
entity catalog
relationship IDs
cardinalities
identity/tenancy model
application entity model
commercial entity model
domain-model definitions
lifecycle structures
runtime/data schemas
Simples™ type models
```

## Prömpter — Language & Semantics

### Knowledge-model responsibilities

**Primary**

- Terminology
- Nomenclature
- Semantics

**Secondary**

- controlled vocabulary
- communication contracts
- specification language

### Human structure

```
Prömpter/
├── Canon/
│   ├── Terminology/
│   ├── Nomenclature/
│   ├── Semantics/
│   ├── Prompt Doctrine/
│   └── Communication Contracts/
│
├── Workspaces/
│   ├── Prompts/
│   ├── Instructions/
│   └── Protocols/
│
├── Reference/
└── Archive/
```

### Codependent Coding material here

```
Terminology and Nomenclature
controlled vocabulary
naming conventions
capability names
event names
error-code conventions
prompt contracts
agent instruction grammar
handoff payload grammar
```


## DevNotes — Knowledge & Classification

### Knowledge-model responsibilities

**Primary**

- Taxonomy
- Faceted classification
- Information architecture
- Knowledge graph

**Secondary**

- Metadata
- Folksonomy
- provenance
- institutional memory

### Human structure

```
DevNotes/
├── Canon/
│   ├── Knowledge System/
│   ├── Classification/
│   ├── Metadata/
│   ├── Information Architecture/
│   ├── Knowledge Graph/
│   └── Provenance/
│
├── Inbox/
├── Research/
├── References/
├── Maps/
├── Workspaces/
└── Archive/
```

`00 ZETTELKASTEN` becomes:

```
DevNotes/Inbox/
```

Zettelkasten remains the **capture workflow**.

It stops being a top-level ontology.

### DevNotes owns

```
How is this classified?
Where is this found?
What links to it?
Where did it come from?
What authority does it have?
Which workspace does it affect?
Which other concepts does it relate to?
```

The current DevNotes role already owns classification, authority, lifecycle, useful links, backlinks, duplicate/stale detection, and durable recovery.

---

## Vibes — Architecture & Topology

### Knowledge-model responsibilities

**Primary**

- Mereology
- Topology

**Secondary**

- architecture
- environment
- boundary structure
- dependency structure

### Human structure

```
Vibes/
├── Canon/
│   ├── Architecture/
│   ├── Topology/
│   ├── Tech Stack/
│   ├── Boundaries/
│   ├── Security/
│   ├── Integrations/
│   └── Environments/
│
├── Workspaces/
│   ├── Repositories/
│   ├── Deployments/
│   ├── Incidents/
│   └── Configuration/
│
├── Reference/
└── Archive/
```

### Codependent Coding material here

This becomes the primary home of:

```
Loaded Vibes™ WebApp Architecture
Hipster Stack™
layer contracts
dependency direction
route/feature topology
provider boundaries
RLS architecture
security architecture
deployment topology
repository topology
integration architecture
```

Your existing Hipster Stack definition is already a system-level architecture model with explicit layer ownership and dependency boundaries.

And Vibes' current ChatGPT role already owns platform architecture, infrastructure, deployment, repositories, CI/CD, and deep technical system diagnosis.

---

## Execution — Function & Implementation

### Knowledge-model responsibilities

**Primary**

- Typology
- behavioral semantics

**Secondary**

- specifications
- workflows
- operations
- patterns
- implementation evidence

### Human structure

```
Execution/
├── Canon/
│   ├── Functional Patterns/
│   ├── Workflow Patterns/
│   ├── Implementation Rules/
│   └── Specification Model/
│
├── Workspaces/
│   ├── Specifications/
│   ├── Work Packages/
│   ├── Issues/
│   ├── Progress/
│   └── Results/
│
├── Reference/
└── Archive/
```

### Codependent Coding material here

```
Application Workflow pattern
Fetcher pattern
Server Action pattern
Transaction Helper pattern
Webhook Processor pattern
route/feature orchestration
implementation specifications
acceptance criteria
work packages
GitHub issue templates
PR templates
```

The Golden Application Workflow already says the workflow owns **use-case sequence** and coordinates policy, persistence, transactions and external providers.

That is pure Execution.

---

## Trust Issues — Epistemology & Evidence

### Primary question

> **Why should we believe the claim?**

Its current role already gives actual repository/runtime state and reproducible evidence precedence over completion summaries.

### Knowledge-model responsibilities

**Primary**

- Epistemology

**Secondary**

- validation semantics
- evidence
- confidence
- reconciliation
- contradictions
- falsification

### Human structure

```
Trust Issues/
├── Canon/
│   ├── Epistemology/
│   ├── Validation/
│   ├── Evidence Semantics/
│   ├── Conformance/
│   └── Reconciliation/
│
├── Workspaces/
│   ├── Reviews/
│   ├── Findings/
│   ├── Evidence/
│   └── Risks/
│
├── Reference/
└── Archive/
```

### Machine artifacts

```
Trust Issues/
├── .contracts/
│   └── validation/
├── .schemas/
│   └── evidence/
└── .state/
```

### Codependent Coding's distinction between:

```
passed
failed
skipped
blocked
inferred
```

### Chief of Staff — Organization & Lifecycle

### Knowledge-model responsibilities

Chief of Staff primarily _uses_:

- Metadata
- Information architecture
- lifecycle semantics
- classification state

It does not redefine their universal meanings.

### Human structure

```
Chief of Staff/
├── Canon/
│   ├── Governance/
│   ├── Operating Model/
│   ├── Project Lifecycle/
│   ├── Priority Model/
│   └── Coordination/
│
├── Workspaces/
│   ├── Projects/
│   ├── Roadmaps/
│   ├── Milestones/
│   ├── Active Work/
│   ├── Waiting/
│   └── Completed/
│
├── Reference/
└── Archive/
```

### Machine layer:

```
Chief of Staff/
├── .state/
│   ├── projects/
│   ├── priorities/
│   ├── milestones/
│   └── work/
│
└── .contracts/
    └── lifecycle/
```

## Fuck You Pay Me — Domain & External Reality

### Knowledge-model responsibilities

FYPM contributes **real business-domain instances and specialization**:

- customers
- leads
- vendors
- invoices
- payments
- subscriptions
- obligations
- correspondence
- jobs
- contracts
- financial events

It also contributes **external source authority**.

### Human structure

```
Fuck You Pay Me/
├── Canon/
│   ├── Business Domain/
│   ├── Commercial Semantics/
│   ├── Revenue Operations/
│   └── External Authority/
│
├── Workspaces/
│   ├── Customers/
│   ├── Pipeline/
│   ├── Revenue/
│   ├── Billing/
│   ├── Vendors/
│   └── Obligations/
│
├── Reference/
└── Archive/
```

### Codependent entity catalog:

```
Customer
Subscription
Plan
Price
Entitlement
Checkout Session
Connected Account
Payment
Provider Event
Provider Mirror
Reconciliation
```

---


---

# The TypeScripture™ Canonical Doctrine

| Canonical Entity                          | Canonical Definition                                                                                                                                                                                                                                                                                 |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **The TypeScripture™ Canonical Doctrine** | The canonical documentation authority for Codependent Coding™, organized as two paired bodies of doctrine: **The Book of Knowledge™**, which defines the meaning and conceptual authority of the system, and **The Book of Implementation™**, which defines its concrete software realization.       |
| **The Book of Knowledge™**                | The conceptual authority that defines **what exists, why it exists, what it means, how it relates, how it is classified, what constraints apply, what constitutes valid evidence, and what forms the system permits**.                                                                               |
| **The Book of Implementation™**           | The implementation authority that defines **how the concepts established by the Book of Knowledge become concrete architectures, contracts, interfaces, schemas, patterns, workflows, transactions, routes, authorization boundaries, infrastructure, runtime configurations, and executable code**. |

## Paired Chapter Map

| Chapter | Knowledge source chapter(s)                                                                                                                                                                                                                                                                                                                                                                                                                                     | Implementation source chapter                                              |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| 01      | `60.CODEPENDENTCODING.Docs.Reference-Implementations.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                              | `40.ARCHIVE.TECHSTACK.Engineering-Practice.Descriptive-Model.Reference.md` |
| 02      | `60.CODEPENDENTCODING.Docs.Epistemology.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                                           | `40.ARCHIVE.TECHSTACK.Engineering-Practice.Stupid-Lesson.Reference.md`     |
| 03      | `60.CODEPENDENTCODING.Agents.Contracts.Architecture.Contract.md`                                                                                                                                                                                                                                                                                                                                                                                                | `40.ARCHIVE.TECHSTACK.Contracts.Architecture.Contract.md`                  |
| 04      | `60.CODEPENDENTCODING.Docs.Hipster-Stack-Tech.Map.md`  <br>`60.CODEPENDENTCODING.Docs.Loaded-Vibes-Architecture.Source-Document.md`  <br>`60.CODEPENDENTCODING.Docs.System-Map.Map.md`  <br>`60.CODEPENDENTCODING.Docs.Engineering-Doctrine.Source-Document.md`  <br>`60.CODEPENDENTCODING.Patterns.Infrastructure-Integration-Patterns.Reference.md`                                                                                                           | `40.ARCHIVE.TECHSTACK.Engineering-System.Definition.Source-Document.md`    |
| 05      | `60.CODEPENDENTCODING.Agents.Contracts.Ontology.Contract.md`  <br>`60.CODEPENDENTCODING.Provenance.Ontology-Traceability.Reference.md`                                                                                                                                                                                                                                                                                                                          | `40.ARCHIVE.TECHSTACK.Contracts.Ontology.Contract.md`                      |
| 06      | `60.CODEPENDENTCODING.Docs.Knowledge-Modeling.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                                     | `40.ARCHIVE.TECHSTACK.Knowledge-Modeling.Ontology-Taxonomy.Reference.md`   |
| 07      | `60.CODEPENDENTCODING.Provenance.Conflict-Resolution.Reference.md`  <br>`60.CODEPENDENTCODING.Docs.Knowledge-System-Definition.Source-Document.md`  <br>`60.CODEPENDENTCODING.Provenance.Coverage-Matrix.Reference.md`  <br>`60.CODEPENDENTCODING.Provenance.Synthesis-Decisions.Reference.md`  <br>`60.CODEPENDENTCODING.Agents.Execution.md`  <br>`60.CODEPENDENTCODING.Provenance.Readme.Reference.md`  <br>`60.CODEPENDENTCODING.Readme.Source-Document.md` | `40.ARCHIVE.TECHSTACK.Knowledge-System.Definition.Source-Document.md`      |
| 08      | `60.CODEPENDENTCODING.Docs.Terminology-Nomenclature.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                               | `40.ARCHIVE.TECHSTACK.System-Architecture.Terminology.Reference.md`        |
| 09      | `60.CODEPENDENTCODING.Patterns.Catalog.Map.md`  <br>`60.CODEPENDENTCODING.Patterns.Supporting-Patterns.Reference.md`  <br>`60.CODEPENDENTCODING.Provenance.Pattern-Traceability.Reference.md`                                                                                                                                                                                                                                                                   | `40.ARCHIVE.TECHSTACK.Patterns.Catalog.Map.md`                             |
| 10      | `60.CODEPENDENTCODING.Agents.Contracts.Product.Contract.md`  <br>`60.CODEPENDENTCODING.Provenance.Contract-Traceability.Reference.md`                                                                                                                                                                                                                                                                                                                           | `40.ARCHIVE.TECHSTACK.Contracts.Product.Contract.md`                       |
| 11      | `60.CODEPENDENTCODING.Docs.Layer-Contracts.Contract.md`  <br>`60.CODEPENDENTCODING.Patterns.Layer-Contract.Reference.md`                                                                                                                                                                                                                                                                                                                                        | `40.ARCHIVE.TECHSTACK.Patterns.Layer-Contract.Reference.md`                |
| 12      | `60.CODEPENDENTCODING.Docs.Agent-Execution.Execution.md`  <br>`60.CODEPENDENTCODING.Agents.Contracts.Execution.Contract.md`                                                                                                                                                                                                                                                                                                                                     | `40.ARCHIVE.TECHSTACK.Contracts.Execution.Contract.md`                     |
| 13      | `60.CODEPENDENTCODING.Docs.Validation-Conformance.Contract.md`  <br>`60.CODEPENDENTCODING.Agents.Contracts.Validation.Contract.md`                                                                                                                                                                                                                                                                                                                              | `40.ARCHIVE.TECHSTACK.Contracts.Validation.Contract.md`                    |
| 14      | `60.CODEPENDENTCODING.Patterns.Application-Workflow.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                               | `40.ARCHIVE.TECHSTACK.Patterns.Application-Workflow.Reference.md`          |
| 15      | `60.CODEPENDENTCODING.Docs.Security-Model.Contract.md`  <br>`60.CODEPENDENTCODING.Patterns.Auth-Authz-Policy.Reference.md`  <br>`60.CODEPENDENTCODING.Patterns.Quality-Policy-Patterns.Reference.md`                                                                                                                                                                                                                                                            | `40.ARCHIVE.TECHSTACK.Patterns.Auth-Authz-Boundary.Reference.md`           |
| 16      | `60.CODEPENDENTCODING.Patterns.Data-Contract-Patterns.Reference.md`  <br>`60.CODEPENDENTCODING.Patterns.Fetcher.Reference.md`                                                                                                                                                                                                                                                                                                                                   | `40.ARCHIVE.TECHSTACK.Patterns.Fetcher.Reference.md`                       |
| 17      | `60.CODEPENDENTCODING.Docs.Governance-Model.Contract.md`  <br>`60.CODEPENDENTCODING.Docs.Specification-Model.Contract.md`  <br>`60.CODEPENDENTCODING.Patterns.Governance-System.Reference.md`  <br>`60.CODEPENDENTCODING.Github.Issue-Template.Config.Reference.md`  <br>`60.CODEPENDENTCODING.Github.Issue-Template.Defect.Template.md`  <br>`60.CODEPENDENTCODING.Github.Pull-Request.Template.md`                                                            | `40.ARCHIVE.TECHSTACK.Patterns.Governance-System.Reference.md`             |
| 18      | `60.CODEPENDENTCODING.Patterns.Server-Action.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                                      | `40.ARCHIVE.TECHSTACK.Patterns.Server-Action.Reference.md`                 |
| 19      | `60.CODEPENDENTCODING.Docs.System-Lifecycles.Contract.md`  <br>`60.CODEPENDENTCODING.Patterns.System-Lifecycle.Reference.md`  <br>`60.CODEPENDENTCODING.Provenance.Lifecycle-Traceability.Reference.md`                                                                                                                                                                                                                                                         | `40.ARCHIVE.TECHSTACK.Patterns.System-Lifecycle.Reference.md`              |
| 20      | `60.CODEPENDENTCODING.Patterns.Transaction-Helper.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                                 | `40.ARCHIVE.TECHSTACK.Patterns.Transaction-Helper.Reference.md`            |
| 21      | `60.CODEPENDENTCODING.Patterns.Webhook-Processor.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                                  | `40.ARCHIVE.TECHSTACK.Patterns.Webhook-Processor.Reference.md`             |
| 22      | `60.CODEPENDENTCODING.Manifest.Map.md`                                                                                                                                                                                                                                                                                                                                                                                                                          | `40.ARCHIVE.TECHSTACK.Knowledge-System.Map.md`                             |
| 23      | `60.CODEPENDENTCODING.Provenance.Source-Provenance-Ledger.Reference.md`                                                                                                                                                                                                                                                                                                                                                                                         | `40.ARCHIVE.TECHSTACK.Map.md`                                              |
| 24      | `60.CODEPENDENTCODING.Patterns.Presentation-Patterns.Reference.md`  <br>`60.CODEPENDENTCODING.Patterns.Route-Feature-Orchestration.Reference.md`                                                                                                                                                                                                                                                                                                                | `40.ARCHIVE.TECHSTACK.Patterns.Route-Feature-Orchestration.Reference.md`   |

## One-to-one chapter paths

| Chapter | Book of Knowledge                                                                                                         | Book of Implementation                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| 01      | `01-The-Book-of-Knowledge/01-Identification-Abstract/Epistemology/Chapter-01.Engineering-Practice-Descriptive-Model.md`   | `02-The-Book-of-Implementation/01-Identification-Abstract/Epistemology/Chapter-01.Engineering-Practice-Descriptive-Model.md`   |
| 02      | `01-The-Book-of-Knowledge/01-Identification-Abstract/Epistemology/Chapter-02.Engineering-Practice-Stupid-Lesson.md`       | `02-The-Book-of-Implementation/01-Identification-Abstract/Epistemology/Chapter-02.Engineering-Practice-Stupid-Lesson.md`       |
| 03      | `01-The-Book-of-Knowledge/01-Identification-Abstract/Topology/Chapter-03.Architecture-Contract.md`                        | `02-The-Book-of-Implementation/01-Identification-Abstract/Topology/Chapter-03.Architecture-Contract.md`                        |
| 04      | `01-The-Book-of-Knowledge/01-Identification-Abstract/Topology/Chapter-04.Engineering-System-Definition.md`                | `02-The-Book-of-Implementation/01-Identification-Abstract/Topology/Chapter-04.Engineering-System-Definition.md`                |
| 05      | `01-The-Book-of-Knowledge/02-Definition-Conceptual/Ontology/Chapter-05.Ontology-Contract.md`                              | `02-The-Book-of-Implementation/02-Definition-Conceptual/Ontology/Chapter-05.Ontology-Contract.md`                              |
| 06      | `01-The-Book-of-Knowledge/02-Definition-Conceptual/Ontology/Chapter-06.Knowledge-Modeling-Ontology-Taxonomy.md`           | `02-The-Book-of-Implementation/02-Definition-Conceptual/Ontology/Chapter-06.Knowledge-Modeling-Ontology-Taxonomy.md`           |
| 07      | `01-The-Book-of-Knowledge/02-Definition-Conceptual/Mereology/Chapter-07.Knowledge-System-Definition.md`                   | `02-The-Book-of-Implementation/02-Definition-Conceptual/Mereology/Chapter-07.Knowledge-System-Definition.md`                   |
| 08      | `01-The-Book-of-Knowledge/03-Representation-Logical/Terminology/Chapter-08.System-Architecture-Terminology.md`            | `02-The-Book-of-Implementation/03-Representation-Logical/Terminology/Chapter-08.System-Architecture-Terminology.md`            |
| 09      | `01-The-Book-of-Knowledge/03-Representation-Logical/Taxonomy/Chapter-09.Patterns-Catalog.md`                              | `02-The-Book-of-Implementation/03-Representation-Logical/Taxonomy/Chapter-09.Patterns-Catalog.md`                              |
| 10      | `01-The-Book-of-Knowledge/04-Specification-Physical/Domain-Model/Chapter-10.Product-Contract.md`                          | `02-The-Book-of-Implementation/04-Specification-Physical/Domain-Model/Chapter-10.Product-Contract.md`                          |
| 11      | `01-The-Book-of-Knowledge/04-Specification-Physical/Schema/Chapter-11.Layer-Contract.md`                                  | `02-The-Book-of-Implementation/04-Specification-Physical/Schema/Chapter-11.Layer-Contract.md`                                  |
| 12      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-12.Execution-Contract.md`                            | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-12.Execution-Contract.md`                            |
| 13      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-13.Validation-Contract.md`                           | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-13.Validation-Contract.md`                           |
| 14      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-14.Application-Workflow.md`                          | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-14.Application-Workflow.md`                          |
| 15      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-15.Auth-Authz-Boundary.md`                           | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-15.Auth-Authz-Boundary.md`                           |
| 16      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-16.Fetcher.md`                                       | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-16.Fetcher.md`                                       |
| 17      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-17.Governance-System.md`                             | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-17.Governance-System.md`                             |
| 18      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-18.Server-Action.md`                                 | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-18.Server-Action.md`                                 |
| 19      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-19.System-Lifecycle.md`                              | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-19.System-Lifecycle.md`                              |
| 20      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-20.Transaction-Helper.md`                            | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-20.Transaction-Helper.md`                            |
| 21      | `01-The-Book-of-Knowledge/04-Specification-Physical/Typology/Chapter-21.Webhook-Processor.md`                             | `02-The-Book-of-Implementation/04-Specification-Physical/Typology/Chapter-21.Webhook-Processor.md`                             |
| 22      | `01-The-Book-of-Knowledge/06-Instantiation-User-Layer/Information-Architecture/Chapter-22.Knowledge-System-Map.md`        | `02-The-Book-of-Implementation/06-Instantiation-User-Layer/Information-Architecture/Chapter-22.Knowledge-System-Map.md`        |
| 23      | `01-The-Book-of-Knowledge/06-Instantiation-User-Layer/Information-Architecture/Chapter-23.Tech-Stack-Map.md`              | `02-The-Book-of-Implementation/06-Instantiation-User-Layer/Information-Architecture/Chapter-23.Tech-Stack-Map.md`              |
| 24      | `01-The-Book-of-Knowledge/06-Instantiation-User-Layer/Information-Architecture/Chapter-24.Route-Feature-Orchestration.md` | `02-The-Book-of-Implementation/06-Instantiation-User-Layer/Information-Architecture/Chapter-24.Route-Feature-Orchestration.md` |


---


# The Codependent Coding™ Web App Architecture

| Canonical Entity                          | Definition                                                                                                                                                                                                                                                                               |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **The Hipster Stack™ Technology Stack**   | The concrete technology stack together with the deterministic constitution and generation system, resolver, and CLI that transform a normalized Application Definition into a materialized software project.                                                                             |
| **The Maximal Template™ Domain Library**  | The single runnable superset application containing every supported implementation that the generation system may retain, remove, configure, or transform when producing a generated application.                                                                                        |
| **The Ontology™ Normalized Defaults**     | The canonical set of nine normalized starter Application Definitions that encode the supported default domain structures and configuration choices supplied to the shared resolver.                                                                                                      |
| **The Anthimeria™ Workbench**             | The stateless web configuration workbench operating over the shared Application Definition and resolver to construct, modify, resolve, and preview application configurations without becoming the persistent authority for application state.                                           |
| **The Simples™ Normalized Blocks**        | The maximal normalized library of supported reusable implementation blocks from which application capabilities are selected and constituted.                                                                                                                                             |
| **The BusinessLogic Blocks™ Workflows**   | The reusable domain and business-logic workflow layer that orchestrates application behavior through the appropriate server operations, helpers, contracts, types, and supporting implementation boundaries.                                                                             |
| **The PureUI Blocks™ Presentation Layer** | The reusable pure-presentation layer that composes UI primitives, component variants, semantic design tokens, and presentation structures without owning domain or business logic.                                                                                                       |
| **The Virgule™ Application Definition**   | The dependency-closed resolved Application Definition that serves as the authoritative machine-readable input for preview and materialization.                                                                                                                                           |
| **The Arrangement™ Generated Artifact**   | The standalone white-label application materialized by the generation system from a resolved Virgule™ Application Definition.                                                                                                                                                            |
| **The Loaded Vibes™ Codex Plugin**        | The Codex-oriented architecture-enforcement and software-operations layer comprising governance, agents, skills, instructions, prompts, validators, smoke tests, and developer-environment assets used to enforce and execute Codependent Coding doctrine.                               |
| **The Visual Vibes™ Design System**       | The concrete design system implementing the Codependent Coding visual language through semantic design tokens, presentation primitives, component variants, composition rules, and interface conventions for a dark industrial neo-brutalist technical aesthetic with restrained signal. |


---


# Reconciliation 

## Vocabulary

1. philosophical/knowledge-model vocabulary:

**Epistemology → Ontology → Terminology → Taxonomy → Typology → Mereology → Topology → Nomenclature → Schema → Metadata → Information Architecture → Knowledge Graph.**

Those terms answer different questions about knowledge: how truth is established, what exists, what things mean, how they're classified, what constitutes what, how things connect, what valid representations look like, and how knowledge is recovered.  

2. engineering vocabulary:

**Role → Responsibility → Concern → Boundary → Interface → Contract → Constraint → Invariant → Module → Layer → Workflow → Pattern → Implementation → Evidence.**

That's the vocabulary for **turning the conceptual model into an operating system**.

3. Codependent Coding:

**Ontology™, Simples™, PureUI Blocks™, BusinessLogic Blocks™, Anthimeria™, Virgule™, Hipster Stack™, Maximal Template™, Arrangement™, Loaded Vibes™, TypeScripture**, etc.

My _domain-specific language_ on top of those foundations.

**Ontology → Anthimeria/CLI → Virgule → normalize → validate → dependency closure → Hipster Stack + Maximal Template → Arrangement → Loaded Vibes.**

Those nouns have **roles, responsibilities, boundaries, contracts, constraints, invariants, interfaces, states, and transitions.**

> [!Ownership]
> 
> **Roles own responsibilities. Modules implement roles. Interfaces expose modules. Contracts govern interfaces. Boundaries separate concerns. Constraints and invariants limit behavior. Patterns provide repeatable implementations. Evidence establishes conformance.**
> 
> And _that_ grammar travels.
> 
> - It works for a Next.js application.
> 
> - It works for Codependent Coding itself.
> 
> - It works for an Obsidian vault.
> 
> - It works for the eight ChatGPT Projects.

## Normalized Section Inventory

| #   | Section                                  | What belongs here                                                                              |
| --- | ---------------------------------------- | ---------------------------------------------------------------------------------------------- |
| 1   | **System Identity & Principles**         | What DevNotes is, Markdown/Git substrate, “interface operates schema,” proportional complexity |
| 2   | **Role Model & Ownership**               | Eight ChatGPT roles, bounded contexts, responsibilities, canonical ownership                   |
| 3   | **Knowledge Model**                      | Epistemology → ontology → terminology → taxonomy → topology → implementation → evidence        |
| 4   | **Information Architecture**             | Root folders, role folders, Canon/Workspaces/Reference/Archive, system/workspace facets        |
| 5   | **Metadata Model**                       | Properties, tags, status, authority, mutable state, relationships, facets                      |
| 6   | **Knowledge Graph**                      | Wikilinks, backlinks, typed relationships, provenance, derived relationships                   |
| 7   | **Artifact & Template System**           | PRD, Tech Requirements, Architecture, Design, Auth, specs, ADRs, research, handoffs, etc.      |
| 8   | **Project & Task Management**            | Chief of Staff ownership, TaskNotes, Kanban, roadmaps, OKRs, milestones, calendars             |
| 9   | **Workbench / Dashboard UX**             | Hearth global + role dashboards, project cockpits, navigation                                  |
| 10  | **Interaction & Commands**               | Meta Bind, Note Toolbar, QuickAdd, Templater, folder/template routing                          |
| 11  | **Semantic Visual Language**             | Callout Studio vocabulary, semantic demarcation, icons                                         |
| 12  | **Code / Engineering Workspace**         | Code Space, `_mounts`, live repositories, Source Mirror replacement                            |
| 13  | **Bases & Retrieval**                    | `.base` views, role/workspace views, search, dynamic indexes                                   |
| 14  | **Visual Design System**                 | CSS, Codependent Coding visual identity, typography, colors, Iconic                            |
| 15  | **Migration, Automation & Verification** | no-delete migration, plugin migration, automation, validation, governance update               |
## Reification Classification 

### Knowledge Model 

1. Architectural & Data Modeling Frameworks

	These terms define how complete systems, real-world domains, and large datasets are structured.

- Information Architecture: The structural blueprint used to organize, label, and navigate websites, apps, and software interfaces to optimize usability.
- Domain Model: A visual or conceptual representation of a specific business problem, mapping out real-world entities, behaviors, and rules into code objects.
- Schema: A rigid, formal blueprint that dictates the exact structure, data types, and constraints of a database or file format.
- Knowledge Graph: A network of real-world entities (nodes) and their data relationships (edges), used by search engines and AI to understand context.

2. Foundations of Logic & Reality

	These philosophical concepts serve as the underlying theory for how computers represent existence and knowledge.

- Ontology: In computer science, this is a formal, machine-readable specification of a shared conceptualization. It defines the types of things that can exist in a system and how they relate.
- Epistemology: The theory of knowledge. In computer science, it drives AI and machine learning, defining how software validates data, updates its "beliefs," and derives certainty.
- Mereology: The study of parts and wholes. In software development, it underpins object composition (e.g., a "Car" object _has-a_ "Wheel" object) and system modularity.
- Topology: The study of geometric properties unaffected by continuous deformation. In computing, it defines network layouts (how devices connect) and data shapes in advanced analytics.

 3. Structural Classification & Hierarchy

	These terms describe systems used to group, sort, and organize data or concepts based on shared characteristics.

- Taxonomy: A strict, hierarchical structure used to classify data or code concepts into parent-child relationships (e.g., class inheritance in object-oriented programming).
- Typology: A classification system based on structural or functional "types" rather than hierarchy. In development, it relates to type systems (e.g., string, integer, boolean) that prevent code errors.
- Faceted Classification: A flexible labeling system that allows an object to be categorized along multiple independent axes simultaneously (e.g., e-commerce sidebar filters for size, color, and price).

4. Meaning, Metadata, & Communication

	These terms deal with the definitions, names, and context assigned to data so that humans and machines can interpret them.

- Semantics: The study of meaning. In software, it ensures code or data is interpreted correctly (e.g., Semantic HTML tags tell a browser exactly what a piece of text _is_, not just how it looks).
- Metadata: Structural data that describes other data, providing essential context like creation dates, file sizes, or author permissions.
- Terminology: The specialized vocabulary used within a specific technical field or business domain to ensure all engineers and stakeholders speak the same language.
- Nomenclature: A systematic, standardized set of rules used for naming things, such as naming conventions for variables (e.g., `camelCase` vs `snake_case`) or API endpoints.
- Folksonomy: A user-generated, collaborative classification system created by tagging content with keywords (e.g., social media hashtags or public blog tags), completely bypassing rigid hierarchies.


Architectural Hierarchy
 ├── Pure Philosophical Framework (The Universe Rules)
 │    │
 │    ├── Epistemology (The global rulebook for validating truth)
 │    └── Topology (The global geometric layout of the system)
 │		      │
 │		      └── Mereology (The specific structural "part-of" math inside Topology)
 ├── Domain Ontology (The Complete Domain Blueprint Folder)
 │    │
 │    ├── Semantics (The dictionary of meanings inside the Ontology)
 │    │    │
 │    │    └── Terminology (The actual words chosen to represent those meanings)
 │    │         │
 │    │         └── Nomenclature (The strict naming rules for those words)
 │    │
 │    ├── Taxonomy (The hierarchical family tree of categories inside the Ontology)
 │    ├── Typology (The flat, non-hierarchical categorization tags inside the Ontology)
 │    └── Domain Model (The code translation file inside the Ontology)
 │		      │
 │		      └── Schema (The database table blueprint generated by the Domain Model)
 └── Data Instance & Interface Environment (The Runtime App)
      │
      ├── Knowledge Graph (The live web of actual data points)
      │    │
      │    └── Metadata (The hidden context headers stamped onto each data point)
      │
      └── Information Architecture (The UI structural navigation layout)
    		    │
  	  	    └── Faceted Classification (The search filter matrix built into the IA)
 	  			      │
      		  	  └── Folksonomy (The loose user-generated tags permitted within the filters)
### The Zachman Framework 

| Zachman Reification Stage     | Engineering Action                                 |
| ----------------------------- | -------------------------------------------------- |
| 1. Identification (Abstract)  | Establishes the rules of truth and space.          |
| 2. Definition (Conceptual)    | Defines what categories exist and mean.            |
| 3. Representation (Logical)   | Standardizes vocabulary and structural trees.      |
| 4. Specification (Physical)   | Writes the actual code blueprints and constraints. |
| 5. Configuration (Runtime)    | Deploys the living data instances and headers.     |
| 6. Instantiation (User Layer) | Renders the searchable screen interface.           |

### Canonical Relationship

1. Identification — Abstract

	Establishes the global rules governing truth, authority, boundaries, and structural possibility.

	* **Epistemology** — what constitutes knowledge, evidence, authority, validity, and truth.
	* **Topology** — what boundaries, regions, connections, and permitted paths exist within the system.

2. Definition — Conceptual

	Defines what kinds of things exist and what those things mean.

	* **Ontology** — the categories of entities, concepts, relationships, states, and properties that may exist.
	* **Mereology** — the rules governing parts, wholes, containment, constituency, and decomposition.
	* **Semantics** — the meanings assigned to concepts, relationships, states, and expressions.

3. Representation — Logical

	Defines how conceptual meaning is represented consistently.

	* **Terminology** — the canonical words and expressions chosen to represent established meanings.
	* **Nomenclature** — the formal rules governing how canonical names are constructed and applied.
	* **Taxonomy** — the hierarchical classification of concepts into parent-child categorical structures.

4. Specification — Physical

	Translates conceptual and logical definitions into implementable structural forms.

	* **Domain Model** — the software-oriented representation of domain entities, relationships, behaviors, and invariants.
	* **Schema** — the explicit structural contract governing the shape, fields, relationships, constraints, or persistence representation of information.
	* **Typology** — the classification of recurring structural or behavioral forms by type rather than hierarchy.

5. Configuration — Runtime

	Represents resolved, contextualized, or instantiated information used by a living system.

	* **Knowledge Graph** — the network of instantiated entities and explicitly represented relationships among them.
	* **Metadata** — contextual information describing, qualifying, governing, locating, or providing provenance for another data object or artifact.

6. Instantiation — User Layer

	Organizes the realized system for human navigation, discovery, interaction, and classification.

	* **Information Architecture** — the structural organization of information and interaction across user-facing surfaces.
	* **Faceted Classification** — multidimensional classification that allows information to be filtered or navigated through independent attributes.
	* **Folksonomy** — emergent classification produced through user-created or community-created tags rather than exclusively controlled vocabularies.

##3 The W3C Semantic Web Stack

W3C Stack Layer                Terms 
────────────────────────────────────────────────────────────────
User Interface                 ► Information Architecture, Faceted Classification
Data Interchange (Graph)       ► Knowledge Graph, Folksonomy
Schemas & Taxonomies           ► Schema, Taxonomy, Typology, Metadata
Ontology                       ► Ontology, Mereology
Logic & Meaning                ► Semantics, Terminology, Nomenclature

### MBED

| View              | Default ChatGPT steward                                                                       | Meaning in this system                                                                          |
| ----------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| **Organization**  | **Chief of Staff** — schedule, priorities, task state, commitments and sequencing             | mission, goals, requirements, priorities, initiatives, lifecycle and allocation of work         |
| **Perspective**   | **Trust Issues** — independent verification, evidence and exposing unresolved concerns        | viewpoints, concerns, evaluation, epistemology, decisions, assurance                            |
| **Function**      | **Execution** — implements bounded behavior from approved specifications                      | behaviors, use cases, workflows, operations, interfaces and constraints                         |
| **Information**   | **DevNotes** — institutional memory and knowledge architecture                                | knowledge, data, metadata, rules, provenance and semantic relationships                         |
| **Component**     | **Schemes / Data Modeler** — entities, relationships, cardinality, schema and data boundaries | types, attributes, models, modules, composition and structural boundaries                       |
| **Communication** | **Prömpter** — transforms intent into reliable communication/instruction contracts            | protocols, messages, language, prompts, handoffs and interaction contracts                      |
| **Connector**     | **Fuck You Pay Me** — commercial/external operational relationships and live external systems | relations crossing system boundaries: providers, customers, integrations, commercial interfaces |
| **Environment**   | **Vibes** — platform engineering, DevOps and system environment                               | infrastructure, tools, repositories, runtime, deployment and operational surroundings           |

---

## Ownership Matrix

| Concept                      | Canonical owner | Major consumers              |
| ---------------------------- | --------------- | ---------------------------- |
| **Epistemology**             | Trust Issues    | DevNotes, Vibes, FYPM        |
| **Ontology**                 | Schemes         | everyone                     |
| **Terminology**              | Prömpter        | everyone                     |
| **Taxonomy**                 | DevNotes        | Chief of Staff, Schemes      |
| **Typology**                 | Execution       | Schemes, Vibes               |
| **Mereology**                | Vibes           | Schemes                      |
| **Topology**                 | Vibes           | Execution, Schemes           |
| **Nomenclature**             | Prömpter        | DevNotes, Execution          |
| **Semantics**                | Prömpter        | Schemes, Execution           |
| **Schema**                   | Schemes         | Execution, Trust Issues      |
| **Metadata**                 | DevNotes        | Chief of Staff, Trust Issues |
| **Folksonomy**               | DevNotes        | everyone                     |
| **Faceted classification**   | DevNotes        | Hearth/Bases/every role      |
| **Information architecture** | DevNotes        | Chief of Staff               |
| **Domain model**             | Schemes         | Execution, FYPM              |
| **Knowledge graph**          | DevNotes        | everyone                     |

| Obsidian Plugin    | Ontological role                                             |
| ------------------ | ------------------------------------------------------------ |
| **Hearth**         | unified system shell                                         |
| **Bases**          | taxonomy + faceted classification + information architecture |
| **Meta Bind**      | metadata/control surface                                     |
| **TaskNotes**      | Organization/execution lifecycle                             |
| **QuickAdd**       | Communication / command creation                             |
| **Templater**      | deterministic artifact generation                            |
| **Callout Studio** | semantic/epistemic signaling                                 |
| **Note Toolbar**   | context-sensitive Function commands                          |
| **Canvas**         | topology/ontology visualization                              |
| **Code Space**     | Connector to live implementation                             |
| **Obsidian CLI**   | Environment automation                                       |
| **Git**            | provenance/version history                                   |

| ChatGPT Project     | Formal role                | Core question                                                                                           |
| ------------------- | -------------------------- | ------------------------------------------------------------------------------------------------------- |
| **Chief of Staff**  | Organization & Lifecycle   | What are we trying to accomplish and what state is the work in?                                         |
| **Trust Issues**    | Epistemology & Evidence    | How do we know this is true?                                                                            |
| **Execution**       | Function & Implementation  | What does the system do and how is that behavior realized?                                              |
| **Vibes**           | Architecture & Topology    | How is the system constructed and connected?                                                            |
| **DevNotes**        | Knowledge & Classification | What do we know and how can we recover it?                                                              |
| **Schemes**         | Ontology & Modeling        | What exists, relates, and is valid?                                                                     |
| **Prömpter**        | Language & Semantics       | What do we call things and how is intent communicated?                                                  |
| **Fuck You Pay Me** | Domain & External Reality  | What real-world business entities, obligations, and external authorities does the system interact with? |


| Notes Folder        | Formal role                | Core question                                                                                           |
| ------------------- | -------------------------- | ------------------------------------------------------------------------------------------------------- |
| **Schemes**         | Ontology & Modeling        | What exists, relates, and is valid?                                                                     |
| **Prömpter**        | Language & Semantics       | What do we call things and how is intent communicated?                                                  |
| **Chief of Staff**  | Organization & Lifecycle   | What are we trying to accomplish and what state is the work in?                                         |
| **Trust Issues**    | Epistemology & Evidence    | How do we know this is true?                                                                            |
| **Execution**       | Function & Implementation  | What does the system do and how is that behavior realized?                                              |
| **Vibes**           | Architecture & Topology    | How is the system constructed and connected?                                                            |
| **DevNotes**        | Knowledge & Classification | What do we know and how can we recover it?                                                              |
| **Fuck You Pay Me** | Domain & External Reality  | What real-world business entities, obligations, and external authorities does the system interact with? |
