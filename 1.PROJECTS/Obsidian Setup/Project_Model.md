# Project Model

## Project Model Overview

The Project Model defines how work is organized from the level of a business or software project down to executable tickets and the artifacts produced by that work.

The hierarchy is:

```text
Project
└── Milestone
    └── Phase
        └── RoadMap
            └── Task / Ticket
                └── Project Artifact
```

A Project is the container for a body of work. A Milestone is a major stage of that work. A Phase is a defined segment of work within a Milestone. A RoadMap is the concrete execution plan for a Phase. A Task or Ticket is an executable unit of work within a RoadMap. Project artifacts are the documents and other outputs produced while completing that work.

The model is intentionally separate from the Code Lab model. Projects describe work being performed. Code Lab describes the engineering knowledge and reusable implementation patterns used to perform that work.

## Project Types

Every Project has one of five types:

| Type | Purpose |
|---|---|
| Operations | Business, legal, financial, administrative, customer, and operational work |
| Product | Product definition, scope, requirements, roadmap, and product decisions |
| Design | UX, interface, visual system, interaction, and design work |
| Engineering | Architecture, implementation, infrastructure, security, testing, and software operations |
| Marketing | Positioning, content, campaigns, demand generation, and growth |

Anything that is not clearly Product, Design, Engineering, or Marketing defaults to Operations.

## Canonical Object Model

### Project

A Project defines the overall body of work and provides the context in which Milestones, Phases, RoadMaps, Tasks, and project artifacts exist.

Canonical Project properties:

```text
project_id
project
milestone
phase
inputs
outputs
downstream_consumers
```

Project implementation:

- A project folder is created under `1.PROJECTS`.
- QuickAdd creates the project structure.
- Templater generates project documents from templates in `2.AREAS/SYSTEM/Templates`.
- The project note maps the project hierarchy and links to its related objects and artifacts.
- Each Milestone has its own project-local Kanban board, and each board contains Phase cards only.
- A Resources note maps related material from `3.RESOURCES`.
- A Codebase note maps the Code Lab material and mounted repository files used by the project.
- A Posts note maps related material from `2.AREAS/BLOG` and `2.AREAS/SOCIAL`.
- Project artifacts live inside the project folder and are generated from templates where applicable.

### Milestone

A Milestone is a major stage of project execution.

Each Milestone has a dedicated Kanban board. The board contains that Milestone's Phase cards only. RoadMaps and Tasks remain below the Phase level.

### Phase

A Phase is a defined segment of work within a Milestone.

Phases contain one or more RoadMaps that define the concrete execution plan for the phase.

### RoadMap

A RoadMap is the concrete execution plan for a Phase. The canonical RoadMap files in `2.AREAS/SYSTEM/RoadMaps` are the prototype references used to define the shape, purpose, key activities, primary outputs, and task sequence of project work.

A RoadMap is identified by the project/milestone/phase/roadmap code used by the Ticketing SOP.

### Task / Ticket

A Task or Ticket is an executable unit of project work within a RoadMap.

Every ticket is represented by a TaskNote in:

```text
2.AREAS/SYSTEM/_Tasks
```

TaskNotes carry the project, Milestone, Phase, RoadMap, status, dependency, and deliverable context needed to execute the ticket.

Canonical Task properties:

```text
task_id
project_id
project
status
dependency
deliverable
```

### Project Artifact

A Project Artifact is a document or other durable output produced by project work.

Artifacts are generated from templates and live inside the project folder. An artifact links back to the TaskNotes and to the relevant Project, Milestone, and Phase context.

## Standard Project Lifecycle

```text
Project Definition
        ↓
Milestone Definition
        ↓
Phase Definition
        ↓
RoadMap Definition
        ↓
Task / Ticket Creation
        ↓
Task Execution
        ↓
Artifact Creation
        ↓
Milestone / Phase Completion
        ↓
Project Progression
```

The system does not require every project to use the same number of Tasks or artifacts. The hierarchy remains stable while the amount of work inside each level varies.

# Canonical Milestone and Phase Model

The following model defines the standard development lifecycle used by the Project system.

## Milestone 1 — Foundation & Architecture

### Phase 1.1 — Product Discovery & Definition

This phase establishes the problem, customer, commercial assumptions, constraints, and initial product definition.

Work includes:

- Market/customer problem synthesis
- ICP/persona definition
- Pricing and packaging hypotheses
- Risk and compliance analysis
- Success criteria

Outputs:

- PRD
- Initial roadmap
- Feature-gating assumptions
- Business constraints

### Phase 1.2 — Platform Scaffolding & Systems Setup

This phase establishes the technical and operational foundation required to build the product.

Work includes:

- Repository and CI/CD setup
- Authentication and tenant model
- Database schema baseline
- Design-system alignment
- Operational tooling

Outputs:

- Running development environment
- Core integrations
- Design primitives
- Operational readiness baseline

### Phase 1.3 — Internal Alpha Validation

This phase validates the foundation before public release.

Work includes:

- Internal-only deployment
- Integration testing
- Security validation
- UX flow validation
- Observability

Outputs:

- Internal alpha environment
- Known-risk register
- Go/No-Go recommendation

## Milestone 2 — MVP Build & Launch

### Phase 2.1 — Core Feature Implementation

This phase implements the core product workflows and MVP experience.

Work includes:

- Core workflows
- RBAC and billing enforcement
- MVP UI
- Feature flagging
- Critical-path tests

Outputs:

- Feature-complete MVP
- Deployment-ready builds
- Release notes

### Phase 2.2 — QA & Launch Readiness

This phase establishes confidence and operational readiness for release.

Work includes:

- Regression testing
- Performance/load testing
- Billing edge cases
- Accessibility
- Incident readiness

Outputs:

- Launch approval
- Rollback plan
- Monitoring dashboards

### Phase 2.3 — Soft Launch & Feedback Loop

This phase releases the MVP to a controlled public audience and turns real usage into product feedback.

Work includes:

- Controlled public release
- Onboarding
- CRM feedback
- Usage analytics
- Rapid blocker iteration

Outputs:

- Feedback reports
- Conversion metrics
- MVP validation assessment

## Milestone 3 — Expansion & Hardening

### Phase 3.1 — Feature Expansion

This phase expands the product beyond the initial MVP.

Work includes:

- Advanced features
- Enterprise readiness
- Configuration/admin tooling
- Export/reporting

Outputs:

- Expanded feature set
- Updated documentation
- Upsell-ready capabilities

### Phase 3.2 — Platform Hardening

This phase improves reliability, security, performance, and operational efficiency.

Work includes:

- Performance improvements
- Security patching
- Permission audits
- Observability
- Cost optimization

Outputs:

- Hardened platform
- Security/performance reports
- Reduced operational risk

### Phase 3.3 — Growth Enablement

This phase establishes the systems required for sustained customer acquisition, retention, and expansion.

Work includes:

- Marketing automation
- Sales enablement
- Customer lifecycle
- Retention/expansion

Outputs:

- Growth campaigns
- Refined positioning
- Scalable operating model

# Standard Project Types

## Operations

**Title:** Business, Legal, Revenue & Customer Control Plane

**Description:** Owns all non-product business reality.

### Milestone 1

#### OPS-M1-001 — LLC & Governance Initialization

- Draft/execute operating agreement
- Establish IP ownership
- Banking/accounting
- Vendor approval authority
- Archive signed documents

#### OPS-M1-002 — OKRs & Business Constraints

- Define company Objectives
- Define measurable Key Results
- Publish OKRs
- Tie budgets to KRs
- Lock OKRs

### Milestone 2

#### OPS-M2-001 — Revenue & Customer Operations

- CRM pipelines
- Customer lifecycle
- Clerk billing
- Refund/cancellation policy
- Train stakeholders

### Milestone 3

#### OPS-M3-001 — Risk, Compliance & Scale

- Audit administrative access
- Data retention
- Enterprise contracts
- Forecasts
- Executive operational report

## Product

**Title:** Product Truth & Decision Authority

**Description:** Defines what exists, why, and what does not.

### Milestone 1

#### PROD-M1-001 — Problem Definition & PRDs

- Synthesize market and operations inputs
- Define tenant/RBAC assumptions
- Author PRDs
- Define pricing tiers and feature gates
- Validate with Engineering

### Milestone 2

#### PROD-M2-001 — MVP Scope Enforcement

- Lock MVP
- Resolve ambiguity
- Groom backlog
- Accept/reject scope changes
- Define release acceptance criteria

### Milestone 3

#### PROD-M3-001 — Advanced Feature Roadmap

- Incorporate CRM/Ops feedback
- Prioritize advanced features
- Define non-functional requirements
- Update roadmap
- Produce next-cycle PRDs

## Design

**Title:** UX & Interface Translation Layer

**Description:** Converts product decisions into usable systems.

### Milestone 1

#### DES-M1-001 — UX Architecture & Design System Alignment

- Core user flows
- Layout primitives
- shadcn/ui alignment
- Low-fidelity prototypes
- Handoff

### Milestone 2

#### DES-M2-001 — MVP Interface Delivery

- High-fidelity designs
- Implemented UI review
- UX defects
- Accessibility
- Launch UI approval

### Milestone 3

#### DES-M3-001 — Advanced UX & Design Debt

- Advanced dashboards
- Data density
- Usability feedback
- Mobile
- Design documentation

## Engineering

**Title:** System Architecture & Execution Engine

**Description:** Builds, secures, and operates software.

### Milestone 1

#### ENG-M1-001 — Architecture & Scaffolding

- Initialize repository/monorepo
- Next.js App Router
- Prisma schema
- Clerk authentication
- CI/CD

### Milestone 2

#### ENG-M2-001 — MVP Feature Implementation

- Tenant isolation
- RBAC
- Webhook handlers
- MVP UI
- Tests/deployment

### Milestone 3

#### ENG-M3-001 — Advanced Features & Security

- Advanced permissions
- Database optimization
- Vulnerability remediation
- Bug resolution
- Observability

## Marketing

**Title:** Narrative, Demand & Market Signal Generation

**Description:** Creates awareness, interest, and demand.

### Milestone 1

#### MKT-M1-001 — Positioning & Narrative

- Positioning
- Educational content
- Messaging tests
- Audience definition
- Feed Product

### Milestone 2

#### MKT-M2-001 — MVP Launch Campaign

- Launch assets
- Announcements
- Traffic
- Engagement
- Adjust messaging

### Milestone 3

#### MKT-M3-001 — Growth & Retention Campaigns

- Advanced-feature promotion
- Case studies
- Funnels
- Upsells
- CAC/ROI

# Project Implementation Model

## Project Creation

QuickAdd creates a new project under:

```text
1.PROJECTS/
```

The generated project contains the project map, project-local Kanban, project documentation, and supporting project notes.

Templater supplies the reusable document structures used during creation.

The intended relationship is:

```text
QuickAdd
    ↓
Project Folder
    ├── Project Map
    ├── Kanban
    ├── Resources
    ├── Codebase
    ├── Posts
    └── Artifacts
```

## Task Creation

Tasks are created as TaskNotes in:

```text
2.AREAS/SYSTEM/_Tasks
```

A TaskNote is associated with:

```text
Project
Milestone
Phase
```

and records its own:

```text
Task ID
Status
Dependency
Deliverable
```

## Kanban

Each Project has one Kanban Board for each Milestone.

Each milestone board contains cards for that milestone's Phases only. Tasks are never Kanban cards.

Conceptually:

```text
Project
├── M1 Board
│   ├── P1.1 Phase card
│   ├── P1.2 Phase card
│   └── P1.3 Phase card
├── M2 Board
│   ├── P2.1 Phase card
│   ├── P2.2 Phase card
│   └── P2.3 Phase card
└── M3 Board
    ├── P3.1 Phase card
    ├── P3.2 Phase card
    └── P3.3 Phase card
```

Tasks remain individual TaskNotes beneath their corresponding RoadMap.

## Project Map

The Project note is the navigation map for the project.

It links to:

- Project metadata
- Milestones
- Phases
- Tickets/Tasks
- Project artifacts
- Resources
- Code Lab material
- Mounted repository files
- Related blog posts
- Related social posts

The Project map should make the complete project structure navigable without requiring the user to infer relationships from filenames.

## Resources Note

The Resources note maps files and references related to the project from:

```text
3.RESOURCES/
```

The note uses links/backlinks to make project-relevant resources discoverable from the Project.

## Codebase Note

The Codebase note maps the engineering knowledge and implementation material relevant to the Project.

It links to:

```text
2.AREAS/CODE/
2.AREAS/SYSTEM/_mounts/
```

Code Lab material is organized by Domain, Dev Cycle, Standard, and Pattern.

Mounted repository files provide the actual code artifacts associated with the project.

## Posts Note

The Posts note maps project-related publishing material from:

```text
2.AREAS/BLOG/
2.AREAS/SOCIAL/
```

It provides navigation from the Project to its related public-facing content.

## Artifacts

Project artifacts are generated from templates and stored inside the project folder.

Artifacts should link back to:

```text
Task
Phase
Milestone
Project
```

This makes the output of a task discoverable from the work that produced it and from the project hierarchy that contains it.

# Project Relationship Model

```text
Project
│
├── Milestones
│   │
│   ├── Phases
│   │   │
│   │   └── Tasks / Tickets
│   │       │
│   │       └── Project Artifacts
│   │
│   └── ...
│
├── Resources
│   └── 3.RESOURCES references
│
├── Codebase
│   ├── Code Lab references
│   └── 2.AREAS/SYSTEM/_mounts references
│
└── Posts
    ├── 2.AREAS/BLOG references
    └── 2.AREAS/SOCIAL references
```

# Project / Code Lab Boundary

Projects answer:

> What work are we doing?

Code Lab answers:

> How do we build the software involved in that work?

The Project hierarchy is:

```text
Project → Milestone → Phase → Task
```

The Code Lab hierarchy is:

```text
Domain → Dev Cycle → Standard → Pattern
```

The two systems are related through the Project Codebase note and the project artifacts that use Code Lab material.

A project Task may reference a Pattern or Standard when that engineering knowledge is relevant to the work. A Project artifact may document how Code Lab material was applied.

The two hierarchies should not be collapsed into one.

# Project System Outputs

A complete project can produce:

- Project map
- Milestone notes
- Phase notes
- TaskNotes
- Project Kanban
- PRDs
- Technical requirements
- Architecture documents
- Authentication/authorization documentation
- Design documentation
- Roadmaps
- Launch documentation
- Resources map
- Codebase map
- Posts map
- Project-specific artifacts

The exact artifact set depends on the Project type and the work being performed.
