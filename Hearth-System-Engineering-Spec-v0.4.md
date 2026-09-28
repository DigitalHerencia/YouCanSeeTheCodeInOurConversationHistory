# Hearth System Engineering Specification v0.4

## 0. Purpose

Hearth is an Obsidian implementation of the Digital Herencia operating model. PARA is the storage foundation; Hearth is the UI shell; frontmatter and linked Markdown are the source of truth; plugin views are projections.

The system intentionally preserves the useful semantics of the current Notion model:

- Project Type replaces Team.
- There is no Portfolio entity in Hearth. Strategic context is absorbed into the Project root and its generated project-context artifacts.
- Cycle → Project → Milestone → Phase → Ticket/Task is the translated Hearth execution hierarchy.
- Work codes remain compatible with the existing Notion convention.
- Meetings become daily/weekly/biweekly operating notes and reviews.
- LeetCode becomes an applied Code Lab overlay on real project work.
- Resources have an explicit lifecycle instead of being an unstructured folder.
- Archive is a lifecycle and retention system, not merely a pile of old files.
- TypeScripture becomes the reusable Knowledge/Contract/Implementation/Golden-Prototype corpus.
- CodependentCoding DevCycles become executable learning/reference patterns.

## 1. Canonical ontology

### Strategic

Project Type → Project → Milestone → Phase → Task

### Engineering documentation

Project → Document → Specification Item → Task → Evidence → Implementation → Validation

### Applied Code Lab

Maximal Template ontology → Code Lab Module → Dev Cycle/Lesson → Task/Applied Drill → Test/Gate → Evidence → Production Application

The nine CodependentCoding application ontologies are the Code Lab curriculum modules. TypeScript/TypeScripture is not a general `3.RESOURCES/` curriculum folder. It is the implementation curriculum corpus used by Code Lab.

### Knowledge

Zettelkasten Capture/Workbench → processed Resource → Knowledge artifact → Project/Code Lab application

### Execution containment

Project → Milestone → Phase → Task

A project is the top-level PARA execution container. Milestones contain phases. Phases contain the executable TaskNotes tasks. There is no Project-as-child-of-Phase structure in Hearth. The original Notion phase/project relationship is translated into project-local milestone/phase organization.

### Lifecycle

Create → Identify → Contextualize → Work → Validate → Review → Close → Archive/Retain

## 2. PARA storage

```text
1.PROJECTS/
├── OPS/
├── PROD/
├── DES/
├── ENG/
├── MKT/
└── RES/

2.AREAS/
├── SYSTEM/
│   ├── _Tasks/
│   ├── Templates/
│   ├── Scripts/templater/
│   ├── QuickAdd/
│   ├── Bases/
│   ├── State/
│   ├── Standards/
│   ├── SOPs/
│   ├── Taxonomy/
│   ├── Migration/
│   └── Indexes/
├── DAILY/
│   ├── Operations/
│   ├── Product/
│   ├── Design/
│   ├── Engineering/
│   ├── Marketing/
│   ├── Research/
│   ├── Standups/
│   ├── Weekly Sync/
│   ├── Sprint Planning/
│   ├── Phase Reviews/
│   ├── Milestone Reviews/
│   └── Postmortems/
├── ZETTLECASTEN/
│   ├── Inbox/
│   ├── Fleeting/
│   ├── Literature/
│   ├── Clippings/
│   ├── AI Threads/
│   ├── Evergreen/
│   ├── MOCs/
│   └── Attachments/
└── CODE LAB/
    ├── Curriculum/
    ├── Modules/
    ├── Lessons/
    ├── Patterns/
    ├── Tests/
    ├── Evidence/
    ├── Progress/
    └── Reviews/

3.RESOURCES/
├── Knowledge/
├── Books/
├── Tech Stack/
├── Patterns/
├── Articles/
├── Media/
├── Documentation/
├── Repositories/
├── Standards/
└── General/

4.ARCHIVE/
├── Projects/
├── Documents/
├── Resources/
├── Knowledge/
├── Code Lab/
├── Reviews/
└── Other/

```

TaskNotes remains authoritative for task notes, but its storage location is moved under `2.AREAS/SYSTEM/_Tasks/`. The implementation must update TaskNotes and Kanban folder settings accordingly rather than retaining a vault-root task folder. Project content is never stored in Hearth dashboards.

## 3. Project Type vocabulary

The former Notion teams become the controlled `project_type` vocabulary:

- OPS — operations, legal, finance, customer operations, governance, OKRs
- PROD — product definition, scope, roadmap, requirements, acceptance
- DES — UX, UI, accessibility, interaction, design systems
- ENG — architecture, implementation, security, performance, observability
- MKT — positioning, messaging, demand, campaigns, growth
- RES — research, knowledge acquisition, technical learning, Code Lab source work

A project may have a `secondary_domains` list, but exactly one `project_type` owns the project.

## 4. Identity and IDs

The system distinguishes stable identity from derived work codes.

### Stable IDs

- Project: `ENG-M1-001`
- Milestone: `ENG-M1-001-M01`
- Phase: `ENG-M1-001-P01.2`
- Task: `ENG-M1-001-T03`
- Document: `PRD-001`, `TR-001`, `ARC-001`, `ADR-001`, `IMP-001`, `TST-001`, `SEC-001`, `VAL-001`, `VRF-001`, `RUN-001`, `SOP-001`, `PM-001`
- Requirement/spec item: `PRD-001.FR-001`, `PRD-001.NFR-001`, `TR-001.TR-001`
- Evidence: `EVD-001`
- Resource: `RES-000001`
- Pattern: `PAT-001`
- Cycle: `C01`
- Sprint: `S01`
- Daily note: `DLY-YYYY-MM-DD`
- Weekly review: `WLY-YYYY-W##`
- Sprint planning block: `SPB-YYYY-MM-DD`
- Code Lab module: `MOD-001`
- Code Lab lesson: `LESS-001.01`
- Code Lab test: `TEST-001.01`
- Code Lab drill: derived from task ID, not a second task database

### Derived Notion-compatible codes

Project work code:
`ENG-M1-P1.2-SCAFF`

Task/ticket code:
`ENG-M1-P1.2-SCAFF-T03`

The project ID remains stable even if the project metadata changes. The work code is recomputed from project type + milestone + phase + project slug.


## 5. Property architecture: minimal human surface, machine-managed state

The system contains properties because Obsidian Bases, TaskNotes, filtering, relationships, reconciliation, and dashboards need machine-readable state. The user is **not** expected to maintain those properties manually.

There are three classes.

### 5.1 User-controlled properties

These are the only properties that should receive visible Meta Bind inputs/buttons. They represent a deliberate human choice or judgment.

| Object | User-controlled fields | Purpose |
|---|---|---|
| Project | `status`, `priority`, `target_end`, `current_focus`, `blocker`, `codelab_enabled` | human execution state and intent |
| Milestone | `status`, `target_end` | gate/workstream state |
| Phase | `status`, `target_end`, `risk` | execution state and risk judgment |
| Task | `status`, `priority`, `due`, `scheduled`, `blocker` | smallest executable unit |
| Document | `status`, `review_status` | drafting/review state |
| Resource | `resource_state`, `resource_role`, `review_due` | knowledge lifecycle judgment |
| Code Lab | `mastery_state`, `confidence`, `next_review` | subjective learning state |
| Daily | `focus_project`, `focus_domain` | today's explicit choice |

The implementation may expose a compact `focus` and `blocker` interaction through buttons rather than raw property inputs where that produces a better UX.

### 5.2 Machine-owned properties

These are generated by templates or reconciliation and are not surfaced as daily controls:

```yaml
id:
type:
title:
created:
updated:
version:
project:
project_type:
project_code:
cycle:
milestone:
phase:
ticket_code:
ontology:
module:
lesson:
source_task:
source_note:
created_from:
derived_from:
traces_to:
implements:
satisfies:
validated_by:
produced:
archive_state:
archived_at:
archived_from:
archive_reason:
superseded_by:
last_reconciled:
schema_version:
```

These properties exist so the system can reason about relationships without asking the user to re-enter them.

### 5.3 Computed properties

These are written by reconciliation and are safe to regenerate:

```yaml
progress:
health:
current_milestone:
current_phase:
next_action:
open_blocker_count:
open_task_count:
completed_task_count:
phase_count:
milestone_count:
completion_date:
last_activity:
next_review:
codelab_progress:
mastery:
```

The rule is simple: **if a value can be derived from another authoritative value, the user does not maintain it.**

### 5.4 Meta Bind rule

Meta Bind controls every **user-editable** property. It does not need to expose machine-owned or computed metadata as controls. Computed values may be displayed read-only in the interface.

This prevents the property model from becoming a second job. Frontmatter is the machine state layer; Meta Bind is the human control surface; Templater/QuickAdd scripts are the reconciliation engine.

### 5.5 Property registry is configuration, not scattered literals

The implementation must maintain a single machine-readable property registry under `2.AREAS/SYSTEM/Config/` and generate/validate property use from that registry. Templates and dashboards must not independently invent property names.

## 10. Documentation types

Core managed document types:

- `PRD` — Product Requirements Document
- `TR` — Technical Requirements
- `ARC` — Architecture Specification
- `ADR` — Architecture Decision Record
- `UXD` — UX/UI Design Specification
- `DCS` — Data Contract/Schema Specification
- `SEC` — Security Specification
- `TST` — Test Strategy / Test Plan
- `IMP` — Implementation Plan
- `VAL` — Validation Report
- `VRF` — Verification Report
- `DEP` — Deployment/Release Plan
- `RUN` — Runbook
- `SOP` — Standard Operating Procedure
- `PM` — Post-mortem
- `RFC` — Request for Comments
- `PAT` — Pattern / reusable implementation pattern

Every project document has:

```yaml
id: "PRD-001"
type: document
doc_type: PRD
project: "[[ENG-M1-001...]]"
milestone: "[[...M01]]"
phase: "[[...P01.1]]"
status: draft
version: "0.1"
authority: project
owner_role: Product
reviewers: []
review_due: null
supersedes: null
superseded_by: null
traces_to: []
implements: []
validated_by: []
evidence: []
```

Document status: `draft`, `review`, `approved`, `superseded`, `archived`.

## 11. Specification item system

Requirements live inside their parent document and have stable hierarchical IDs.

Example:

```md
### PRD-001.FR-001 — Tenant Isolation

The system SHALL prevent a user from accessing records belonging to a tenant outside the active tenant context.

**Priority:** P0
**Acceptance:** ...
**Verification:** [[TST-001]]
**Implementation:** [[IMP-004]]
```

Allowed requirement classes:

- `FR` functional requirement
- `NFR` non-functional requirement
- `SEC` security requirement
- `DAT` data requirement
- `UX` UX requirement
- `OPS` operational requirement
- `CMP` compliance requirement
- `INT` integration requirement

A requirement becomes a task through QuickAdd. The task inherits the exact source requirement link, project, milestone, phase, acceptance criteria, and intended evidence.

## 12. Traceability relations

Controlled relation vocabulary:

- `traces_to` — provenance/lineage
- `implements` — concrete realization of a requirement/decision
- `satisfies` — evidence proving a requirement
- `validated_by` — validation artifact
- `verified_by` — structural/technical verification artifact
- `informed_by` — source/decision/context
- `depends_on` — prerequisite
- `blocks` — inverse dependency
- `supersedes` — replacement lineage
- `superseded_by` — replacement link
- `derived_from` — extraction/projection lineage
- `evidence_for` — evidence target

## 13. Resource system

Resources are not "miscellaneous notes." They are a controlled lifecycle.

### Resource properties

```yaml
id: "RES-000001"
type: resource
resource_type: article
resource_state: triage
source_kind: official
authority: authoritative
resource_role: reference
title: ""
source_url: null
creator: null
published: null
accessed: null
version: null
license: null
project_links: []
knowledge_links: []
codelab_links: []
related_patterns: []
last_verified: null
review_due: null
supersedes: null
superseded_by: null
capture_source: web-clipper
```

Resource type vocabulary:

`book`, `article`, `paper`, `video`, `podcast`, `documentation`, `repository`, `course`, `standard`, `specification`, `tool`, `template`, `dataset`, `example`, `reference`, `snippet`, `bookmark`, `screenshot`, `person`, `newsletter`.

Resource state:

`inbox`, `triage`, `active`, `reference`, `retained`, `superseded`, `archived`.

Source kind:

`official`, `primary`, `secondary`, `community`, `personal`.

Authority:

`canonical`, `authoritative`, `supporting`, `exploratory`.

Resource role:

`evidence`, `reference`, `tutorial`, `pattern`, `inspiration`, `source`, `dependency`, `example`.

### Resource lifecycle

Capture → Triage → Classify → Link → Extract → Apply → Retain/Promote → Supersede/Archive.

QuickAdd decisions:

- Keep as Reference
- Extract Knowledge
- Create Evergreen
- Convert to Pattern
- Attach to Project
- Attach to Code Lab Lesson
- Add to Tech Stack
- Send to Zettelkasten Literature
- Create Clipping
- Archive
- Discard

A resource can be useful without being turned into an evergreen note. The resource record remains the provenance source.

## 14. Knowledge layers

The CodependentCoding repository establishes a four-level model. Hearth preserves it:

1. Knowledge — meaning, authority, definitions, relationships, invariants, decision rules, evidence semantics.
2. Contract — what must/must not be true.
3. Implementation — concrete placement, interfaces, schemas, workflows, configuration, executable validation.
4. Golden Prototype — canonical concrete code that demonstrates the implementation.

Use `resource_layer` on TypeScripture resources:

`knowledge`, `contract`, `implementation`, `golden-prototype`.

The Books live in `3.RESOURCES/TypeScripture-The-Book-of-Knowledge/` and can be linked into Code Lab lessons and project documentation.

## 15. Archive system

Archive is a lifecycle state plus a physical storage location.

### Archive properties

```yaml
archive_state: archived
archived_at: 2026-09-24
archived_from: "3.RESOURCES/Documentation/..."
archive_reason: superseded
retention_class: long-term
restore_target: "3.RESOURCES/Documentation/..."
superseded_by: "[[RES-000245...]]"
```

Archive reasons:

- `completed`
- `superseded`
- `obsolete`
- `duplicate`
- `cancelled`
- `inactive`
- `migrated`
- `reference-only`

Retention classes:

- `permanent`
- `long-term`
- `temporary`

No `archive/*` tag is used. Archive is a property/state because it is machine state, not semantic topic.

### Archive command behavior

`Archive Current Note`:

1. validates `type` and current path;
2. prompts for reason and retention class;
3. stamps archive metadata;
4. computes destination under `4.ARCHIVE/<artifact-class>/`;
5. moves note and updates links;
6. writes a provenance record;
7. refreshes archive indexes and dashboard counts.

`Restore Archived Note` uses `archived_from` and `restore_target`.

`Supersede Current Note` creates the replacement relationship before archiving the old note.

Completed TaskNotes tasks are NOT physically moved out of `/_Tasks`; TaskNotes status is the task lifecycle source of truth. The archive system filters them out of active views.

## 16. Tag taxonomy

Tags are semantic discovery labels. Properties are machine state.

### Type tags

```text
type/project
type/milestone
type/phase
type/task
type/document
type/requirement
type/evidence
type/resource
type/knowledge
type/daily
type/review
type/sop
type/pattern
type/codelab
type/module
type/lesson
type/test
type/moc
type/clipping
type/ai-thread
type/kanban
```

### Domain tags

```text
domain/ops
domain/prod
domain/des
domain/eng
domain/mkt
domain/res
domain/codelab
domain/knowledge
domain/system
```

### Technology tags

Use lowercase normalized technology slugs:

```text
tech/typescript
tech/javascript
tech/nextjs
tech/react
tech/node
tech/prisma
tech/neon
tech/postgresql
tech/clerk
tech/rbac
tech/abac
tech/svix
tech/tailwind
tech/shadcn
tech/radix
tech/zod
tech/rhf
tech/recharts
tech/tanstack-table
tech/vitest
tech/playwright
tech/redis
tech/qstash
tech/vercel
tech/github-actions
tech/sentry
tech/opentelemetry
tech/stripe
tech/cloudinary
tech/blob-storage
```

### Topic tags

Topic tags are created only when the concept is reused across notes. Examples:

```text
topic/multitenancy
topic/tenant-isolation
topic/authorization
topic/permissions
topic/rate-limiting
topic/webhooks
topic/idempotency
topic/observability
topic/caching
topic/server-actions
topic/rsc
topic/data-contracts
topic/testing
```

### Source tags

```text
source/official
source/primary
source/community
source/personal
source/project
source/codelab
```

Do not encode status, priority, due dates, project IDs, or archive state in tags.

## 17. Project context replaces Portfolio

The Notion Portfolio concept is absorbed into the Project folder. A project is the strategic container and artifact container. No separate portfolio note, database, dashboard, ID class, or relation exists.

Every generated project receives these root artifacts when applicable:

- `Project.md` — purpose, outcome, scope, health, roadmap, inputs, outputs, consumers, dependencies, decisions, ownership, links.
- `Project Charter.md` — business/product context previously represented by Portfolio/Project-level strategic context.
- `Roadmap.md` — milestones, phases, dependencies, release checkpoints.
- `Project Index.md` — generated register of all documents, requirements, tasks, evidence, resources, reviews, and code-lab artifacts.

Project creation therefore replaces the old Portfolio → Team/Project composition with a single self-contained project workspace.

## 17A. Starter Ontology Registry

The CodependentCoding Maximal Template declares exactly nine application ontologies. Hearth treats each as a project starter blueprint. A project has one `starter_ontology` when it is software-oriented; this is independent of `project_type` (ENG/PROD/etc.).

| ID | Starter ontology | Default use |
|---|---|---|
| `CRM` | CRM / Pipeline Tracker | Pipeline, contacts, accounts, analytics |
| `PM` | Project Management / Task Tracker | Projects, backlog, dependencies, timelines |
| `SUPPORT` | Customer Support / Ticketing | Inbox, tickets, SLA, escalation, knowledge |
| `MKT-AUTO` | Marketing Automation & Analytics | Campaigns, audiences, attribution, analytics |
| `BILLING` | Invoicing & Expense Tracker | Invoices, expenses, billing workflows |
| `SOCIAL` | Social Media Scheduler | Calendar, composer, publishing lifecycle |
| `AI` | AI-Powered Wrapper / Micro-SaaS | Generation, usage, credits, model selection |
| `PORTAL` | B2B Client Portal | Shared dashboard, documents, approvals, billing |
| `ADMIN` | Internal Tools / Admin Portal | Records, users, audit, bulk operations |

Each starter blueprint provides:

1. Project root template.
2. Initial milestone/phase topology.
3. Default document pack.
4. Default task catalog.
5. Default Code Lab Module/Lesson structure.
6. Applicable TypeScripture implementation references.
7. Acceptance/test gate defaults.
8. Suggested resource/pattern links.
9. Code Space entry/mount assumptions.

Loading a starter must create the project workspace from the blueprint; the user should not recreate the SaaS architecture manually. The starter is a seed constitution. Project-specific decisions can extend or replace it, but those changes must be represented as explicit project documents/ADRs rather than silently mutating the starter source.

## 18. Operating cadence

### Daily

The Obsidian Daily Notes plugin creates exactly one master daily note. Templater immediately creates domain child notes:

```text
DLY-2026-09-24
├── Engineering
├── Product
├── Design
├── Marketing
├── Operations
└── Research-CodeLab
```

The master daily note replaces the shared Daily Standup meeting and provides the command center snapshot.

### Engineering daily

Sections from the Notion Engineering Meeting template are preserved:

- Stretch
- Tasks
- Questions
- Notes

Each task item includes owner, definition, why, testing plan, success criteria.

### Design daily

- Goals / agenda
- Discussion notes
- Action items

### Operations daily

- Progress Updates
- Metrics Dashboard Review
- KPIs
- Financials
- Topics to discuss
- Decisions / approvals
- Notes
- Follow-up Actions

### Product daily

Added to preserve the product-team role:

- Scope / requirement movement
- Decisions required
- User/problem evidence
- Acceptance criteria changes
- Action items

### Marketing daily

- Campaign progress
- Signals / audience feedback
- Experiments
- Messaging changes
- Action items

### Research / Code Lab daily

- Current module
- Current lesson
- Applied drill
- Learning evidence
- Open questions
- Pattern discovered
- Next drill

### Weekly Sync

- What happened last week?
- What are we doing this week?
- Potential blockers
- Action items

### Sprint Planning

- Sprint Goal
- Sprint Backlog
- Team & Roles
- Dependencies / risks
- Notes

### Phase Review

- Phase objective
- Planned outputs
- Completed work
- Evidence
- Variance
- Open risks
- Acceptance/exit criteria
- Next phase recommendation

### Milestone Review

- Outcome achieved
- Product state
- Engineering state
- Design state
- Operations state
- Marketing state
- Open risks
- Decisions
- Next milestone

### Post-mortem

Preserve the Notion structure:

- User Facing Impact
- Timeline
- Relevant Metrics
- Cause Analysis
- Resolution
- Future Work
- Action Items

## 19. Next Action Engine

The system is designed to answer "what do I do next?" automatically.

The derived state machine is:

1. Project not started → create/complete entry criteria.
2. Entry criteria complete but required document missing → create document.
3. Required document in draft → finish draft.
4. Document in review → create review task.
5. Approved document but phase tasks missing → generate task set from requirements/project blueprint.
6. Tasks ready → surface highest priority scheduled/blocked-independent ticket.
7. All phase tasks done but review missing → create Phase Review.
8. Phase review passed but next phase not created → create next Phase.
9. All milestone phases done but milestone review missing → create Milestone Review.
10. Milestone review passed → advance milestone and Code Lab module.
11. Project completed → close, capture evidence, archive project or keep as active reference.

`next_action` is therefore a derived convenience field, not a second task database.

## 20. Code Lab model

Code Lab is an applied learning overlay. It does not compete with TaskNotes.

### Mapping

```text
Project Type             -> project_type
Starter Ontology         -> Code Lab Track Blueprint
Project                  -> applied curriculum root
Milestone                -> Code Lab Module
Phase / Sprint           -> Lesson / execution block
Task / Ticket            -> Applied Drill
Run / successful task    -> Drill Evidence
Phase Review             -> Lesson Test / Gate
Milestone Review         -> Module Assessment
Project Release          -> Production Assessment / Capstone
Pattern extracted       -> Pattern Library
```

A Code Lab-enabled software project automatically produces a learning track.

Example:

```text
MOD-003 — Foundation & Architecture
└── LESS-003.01 — Product Discovery & Definition
    ├── ENG-M1-001-T01 — Applied Drill: repository/project framing
    ├── ENG-M1-001-T02 — Applied Drill: requirements/tenant assumptions
    └── ...
└── LESS-003.02 — Platform Scaffolding
    ├── ENG-M1-001-T03 — Applied Drill: Next.js/App Router baseline
    ├── ENG-M1-001-T04 — Applied Drill: Prisma/Neon schema
    └── ...
```

The user learns by writing the implementation by hand inside Code Space. The application being built is the drill. A task is not a toy exercise; it is an executable learning objective attached to production work. A passing test, successful runtime behavior, or explicit validation result becomes evidence. Code Lab does not generate beginner exercises unless a project explicitly requires them.

### Code Lab properties

On drill tasks:

```yaml
codelab_enabled: true
codelab_module: "[[MOD-003...]]"
codelab_lesson: "[[LESS-003.02...]]"
drill_mode: applied
learning_objective: ""
pattern_target: []
difficulty: 1
confidence: 0
mastery: 0
attempt_count: 0
last_attempted: null
production_evidence: []
reflection: null
```

Difficulty is `1..5`. Confidence and mastery are `0..100`.

Mastery states:

`not-started`, `attempting`, `assisted`, `independent`, `demonstrated`, `mastered`, `rusty`.

### Pattern extraction

When a project task reveals a reusable implementation pattern, QuickAdd creates a `PAT-###` note in `2.AREAS/CODE LAB/Patterns/` and links it to the TypeScripture implementation/knowledge source.

## 21. Code Lab curriculum source

The CodependentCoding repository is the canonical source for starter project architectures, implementation patterns, and the Code Lab curriculum. The nine declared application ontologies are starter blueprints, not nine separate vault databases.

Its current canonical concepts include:

- Routes adapt
- Features orchestrate
- Components render
- Fetchers read
- Server Actions write
- Schemas validate
- Authorization decides
- Workflows coordinate use cases
- Transactions preserve invariants
- Integration adapters own provider semantics
- Webhooks reconcile external truth

DevCycle notes are stored under `2.AREAS/SYSTEM/SOPs/DevCycles/` and surfaced in Code Lab as reference lessons.

Key DevCycle families:

- Initialization
- Scaffolding
- Configuration
- Verification
- Data
- Auth
- Features
- Testing
- Validation
- Debug
- Security
- Performance
- Observability
- CI/CD
- Code Review
- Documentation
- Deploy
- Updates

## 22. TypeScripture resource architecture

`3.RESOURCES/TypeScripture-The-Book-of-Knowledge/` stores conceptual doctrine.

`3.RESOURCES/TypeScripture-The-Book-of-Implementation/` stores implementation realization.

Project docs reference these resources rather than copying generic doctrine into every PRD/TR/ADR.

The user's future improved Book of Knowledge and Book of Implementation should be imported as canonical resources and incrementally promoted into patterns, not duplicated across projects.

## 23. Project folder contract

Every project created by QuickAdd receives:

```text
<PROJECT FOLDER>/
├── Project.md
├── Milestones/
│   └── M01 — Foundation & Architecture.md
├── Phases/
│   └── P01.1 — Product Discovery & Definition.md
├── Docs/
│   ├── Product/
│   ├── Technical/
│   ├── Architecture/
│   ├── Decisions/
│   ├── Testing/
│   ├── Operations/
│   └── Review/
├── Evidence/
├── Board.md
├── Assets/
└── CodeLab/
    └── Track.md
```

Tasks stay in `/_Tasks` and relate back through `projects` + provenance.

## 24. Templates inventory

### Core object templates

```text
Project.template.md
Milestone.template.md
Phase.template.md
Task.template.md
Document.template.md
Requirement.template.md
Evidence.template.md
Resource.template.md
Pattern.template.md
Daily.template.md
Daily.Domain.template.md
Weekly-Sync.template.md
Sprint-Planning.template.md
Phase-Review.template.md
Milestone-Review.template.md
Postmortem.template.md
SOP.template.md
```

### Document templates

```text
PRD.template.md
TR.template.md
ARC.template.md
ADR.template.md
UXD.template.md
DCS.template.md
SEC.template.md
TST.template.md
IMP.template.md
VAL.template.md
VRF.template.md
DEP.template.md
RUN.template.md
RFC.template.md
```

### Zettelkasten templates

```text
Fleeting.template.md
Literature.template.md
Clipping.template.md
Evergreen.template.md
AI-Thread.template.md
MOC.template.md
```

### Code Lab templates

```text
Module.template.md
Lesson.template.md
Pattern.template.md
Test.template.md
Review.template.md
```

## 25. QuickAdd inventory

### Project / delivery

- `New Project`
- `Add Milestone`
- `Add Phase`
- `Start Cycle`
- `Start Sprint`
- `Create Project Board`
- `Refresh Project Context`

### Documentation

- `New Document`
- `New PRD`
- `New Technical Requirements`
- `New Architecture Spec`
- `New ADR`
- `New Test Plan`
- `New Implementation Plan`
- `New Review Report`
- `Add Requirement`
- `Create Task from Requirement`
- `Create Evidence from Requirement`

### Task execution

- `New Task`
- `Task from Current Project`
- `Task from Current Phase`
- `Task from Current Requirement`
- `Log Evidence`
- `Mark Task Blocked`
- `Resolve Blocker`
- `Complete Task`

### Cadence

- `Open Today's Command Center`
- `Create Domain Daily Note`
- `Refresh Daily Rollup`
- `New Weekly Sync`
- `New Sprint Planning`
- `New Phase Review`
- `New Milestone Review`
- `New Postmortem`
- `Weekly System Review`

### Resources / Zettelkasten

- `Capture Resource`
- `Process Inbox Resource`
- `Extract Knowledge`
- `Create Evergreen`
- `Create Pattern`
- `Attach Resource to Project`
- `Attach Resource to Code Lab`
- `Convert to Literature`
- `Create Clipping`
- `Create AI Thread`

### Starter ontologies

- `New Project from CRM Starter`
- `New Project from Project Management Starter`
- `New Project from Customer Support Starter`
- `New Project from Marketing Automation Starter`
- `New Project from Invoicing Starter`
- `New Project from Social Scheduler Starter`
- `New Project from AI Wrapper Starter`
- `New Project from B2B Portal Starter`
- `New Project from Internal Tools Starter`

### Code Lab

- `Enable Code Lab on Project`
- `Create Code Lab Module`
- `Create Code Lab Lesson`
- `Convert Task to Applied Drill`
- `Log Drill Attempt`
- `Log Production Evidence`
- `Mark Mastery`
- `Generate Lesson Test`
- `Extract Pattern from Task`
- `Open Code Space`

### Lifecycle

- `Archive Current Note`
- `Supersede Current Note`
- `Restore Archived Note`
- `Move to Resource State`
- `Repair Provenance`
- `Repair IDs`

## 26. Templater user scripts

Canonical scripts under `2.AREAS/SYSTEM/Scripts/templater/`:

```text
ids.js
context.js
project.js
milestone.js
phase.js
document.js
requirement.js
task.js
provenance.js
resource.js
archive.js
daily.js
review.js
codelab.js
pattern.js
insertion.js
nextAction.js
baseController.js
vaultHealth.js
taxonomy.js
```

### Responsibilities

`ids.js` — allocates stable sequential IDs.

`context.js` — resolves current file/project/milestone/phase/cycle/sprint context.

`project.js` — creates/updates projects and derives work codes.

`milestone.js` — creates milestone notes and validates entry/exit criteria.

`phase.js` — creates phase notes and generates Code Lab lesson links.

`document.js` — creates typed documents and registers them with project.

`requirement.js` — inserts hierarchical requirement IDs into documents.

`task.js` — creates TaskNotes tasks with full provenance and context.

`provenance.js` — normalizes traceability links.

`resource.js` — classifies resource and routes it to the proper state/folder.

`archive.js` — archive/restore/supersede operations.

`daily.js` — daily rollups from TaskNotes/project/document state.

`review.js` — phase/milestone/weekly/postmortem review generation.

`codelab.js` — generates Module/Lesson relationships and drill metadata.

`pattern.js` — extracts reusable patterns.

`insertion.js` — inserts sections under deterministic headings.

`nextAction.js` — derived next-action logic.

`baseController.js` — rewrites the small set of active-project `.base` filters.

`vaultHealth.js` — checks orphaned IDs, missing relations, invalid statuses, broken templates, and stale state.

## 27. Meta Bind contract

Meta Bind is the primary human state-control surface, not the ontology engine.

### 27.1 Design rule

A user should be able to operate the system by clicking controls and entering a small number of intentional decisions. They should not edit IDs, work codes, relationship arrays, progress rollups, or derived lifecycle state by hand.

### 27.2 Required controls

Project:
- status
- priority
- target end
- current focus
- blocker
- Code Lab enabled

Milestone:
- status
- target end

Phase:
- status
- target end
- risk

Task:
- status
- priority
- due
- scheduled
- blocker

Document:
- status
- review status

Resource:
- resource state
- resource role
- review due

Code Lab:
- mastery state
- confidence
- next review

Daily:
- focus project
- focus domain

### 27.3 System-owned fields

System-owned and computed fields must not be exposed as editing controls merely because they exist in frontmatter. They may be rendered as labels, badges, progress bars, or read-only text.

### 27.4 Reconciliation buttons

Every important control surface should expose one-click reconciliation actions appropriate to its context:

- Refresh Project
- Refresh Phase
- Refresh Daily
- Reconcile Board
- Reconcile Task
- Reconcile Resource
- Reconcile Code Lab
- Repair Provenance

A property change should therefore feel immediate even when the underlying operation is implemented by a reusable script.

## 28. Note Toolbar contract

### Global toolbar

`Home`, `Command Center`, `Project Command Center`, `New Task`, `Capture`, `Search`, `Archive`.

### Project toolbar

`New Milestone`, `New Phase`, `New PRD`, `New TR`, `New ADR`, `New Task`, `Create Board`, `Open Code Lab`, `Refresh Project`.

### Milestone toolbar

`New Phase`, `Generate Phase Checklist`, `Milestone Review`, `Open Tasks`, `Open Code Lab Module`.

### Phase toolbar

`Add Task`, `New Requirement`, `Create Task from Requirement`, `Phase Review`, `Open Lesson`, `Refresh Next Action`.

### Document toolbar

`Add Requirement`, `Create Task`, `Create Evidence`, `Add Acceptance Criteria`, `Traceability`, `Supersede`, `Archive`.

### Resource toolbar

`Link to Project`, `Extract Knowledge`, `Create Evergreen`, `Create Pattern`, `Add to Code Lab`, `Archive`, `Restore`.

### Daily toolbar

`Refresh Rollup`, `Open Engineering`, `Open Product`, `Open Design`, `Open Marketing`, `Open Operations`, `Open Research/Code Lab`, `Create Task`, `Log Blocker`.

### Code Lab toolbar

`Open Code Space`, `Start Drill`, `Log Attempt`, `Log Evidence`, `Mark Mastery`, `Review Pattern`, `Generate Test`.

## 29. Callout Studio vocabulary

```text
trace
requirement
acceptance
decision
risk
blocker
evidence
implementation
learning
reflection
review
handoff
resource
next
archive
warning
```

Each callout is semantic. No callout type is allowed to be used as a hidden state machine.

## 30. Hearth dashboards

### Home

Only:

- background
- search
- minimal launch/navigation

### Command Center

Cards, in order:

1. Current Day / date
2. Next Action
3. Today's Priority Tasks
4. Overdue Tasks
5. Deadlines / Calendar
6. Daily Standup Rollup
7. Blockers
8. Active Projects
9. Current Focus
10. Daily Domain Links
11. Recent Work
12. Weekly/Sprint cadence

### Project Command Center

Cards:

1. Persistent project picker
2. Project status/health/progress
3. Current milestone
4. Current phase
5. Next action
6. Phase calendar
7. Task execution Kanban
8. Task list
9. Project-local planning board
10. Document register
11. Requirements traceability
12. Evidence/recent implementation
13. Project-specific daily/standup context
14. Code Lab module/lesson/drill progress
15. Dependencies/blockers

The project picker writes `active_project` and `active_project_id` to `2.AREAS/SYSTEM/State/Project Context.md`. A Templater controller rewrites the fixed active-project `.base` files.

### ZETTLECASTEN

Cards:

1. Inbox count
2. Oldest inbox item
3. Triage queue
4. Fleeting notes
5. Literature
6. Clippings
7. AI Threads
8. Evergreen notes
9. MOCs
10. Resources linked to active project
11. Processing actions

### Library

Cards:

1. Recent resources
2. Recent knowledge notes
3. Tech Stack
4. Tags
5. Backlinks / orphans
6. Bookmarks
7. Images/media
8. MOCs
9. Graph
10. Project-connected resources
11. Archived resources

### Code Lab

Cards:

1. Current Module
2. Current Lesson
3. Next Applied Drill
4. Mastery progress
5. Recent attempts
6. Needs-review / rusty patterns
7. Curriculum tree
8. Pattern library
9. Production evidence
10. Code Space entry point
11. Current project application
12. Recent learning journal

### Git & Vault Stats

Cards:

1. Git status
2. Recent commits
3. Current branch
4. Changed files
5. Vault health
6. Missing relations
7. Orphaned managed notes
8. Broken-template checks
9. Archive statistics
10. System version/config

## 31. Bases

Central Bases under `2.AREAS/SYSTEM/Bases/`:

```text
Active Project Tasks.base
Active Project Calendar.base
Active Project Documents.base
Active Project Resources.base
Active Project Evidence.base
Active Project Notes.base
Projects Active.base
Projects Review.base
Tasks Today.base
Tasks Overdue.base
Tasks Blocked.base
Tasks Recently Completed.base
Requirements Untested.base
Documents Review.base
Resources Inbox.base
Resources Active.base
Resources Superseded.base
Archive Index.base
CodeLab Current.base
CodeLab Mastery.base
CodeLab Review Queue.base
Patterns by Technology.base
Daily Notes Recent.base
Weekly Reviews.base
```

TaskNotes-specific views remain under `2.AREAS/SYSTEM/Bases/TaskNotes/` and are preserved for plugin commands.

## 32. Active-project controller

Because Obsidian Bases does not provide a verified generic cross-note Meta Bind parameter binding, the system uses a persistent context note plus deterministic `.base` rewriting.

`2.AREAS/SYSTEM/State/Project Context.md`:

```yaml
active_project: "[[ENG-M1-001 — Project Name/Project]]"
active_project_id: ENG-M1-001
active_milestone: "[[...M01]]"
active_phase: "[[...P01.2]]"
active_cycle: "[[C01]]"
active_sprint: "[[S01]]"
active_codelab_lesson: "[[LESS-...]]"
```

The project picker updates this note and calls `baseController.refreshActiveProjectViews()`.

## 33. Obsidian Kanban role

Project-local `Board.md` is the project planning/workstream board.

TaskNotes/Bases Kanban is the task execution projection.

The two are linked but are not two independent task-state authorities.

A project board card may represent:

- milestone
- phase
- workstream
- dependency
- key deliverable
- review gate

Task execution state remains in TaskNotes.

## 34. Resource + archive dashboard behavior

Resource dashboard filters by `resource_state`, source authority, technology tags, and project/Code Lab links.

Archive dashboard filters by `archive_state`, artifact class, archive reason, retention class, and archived date.

A resource can be:

- active and linked to a project;
- retained as a long-term technical reference;
- superseded by a newer resource;
- archived but restorable.

A project can be done while its reusable documents/resources remain active. Completion and archival are therefore distinct states.

## 35. Vault governance standards

Create these standards under `2.AREAS/SYSTEM/Standards/`:

```text
Metadata Standard.md
Identifier Standard.md
Project Type Standard.md
Traceability Standard.md
Tag Standard.md
Resource Standard.md
Archive Standard.md
Daily Cadence Standard.md
Review Cadence Standard.md
Code Lab Standard.md
TypeScripture Standard.md
Evidence Standard.md
Task Standard.md
Document Standard.md
Kanban Standard.md
Dashboard Standard.md
```

## 36. SOPs to recreate from Notion

The existing Notion SOP corpus becomes canonical Markdown under `2.AREAS/SYSTEM/SOPs/`:

```text
Cycles.md
Tech Stack.md
Ticketing.md
Procedures.md
Project Types.md
Dev/
├── Initialization.md
├── Scaffolding.md
├── Configuration.md
├── Verification.md
├── Data.md
├── Auth.md
├── Features.md
├── Testing.md
├── Validation.md
├── Debug.md
├── Security.md
├── Performance.md
├── Observability.md
├── CI-CD.md
├── Code Review.md
├── Documentation.md
├── Deploy.md
└── Updates.md
```

## 37. Example project pack

The canonical example pack should use one of the actual CodependentCoding ontologies. Use `CRM / Pipeline Tracker` as the first reference implementation because it is one of the repo's declared application ontologies.

The example should be fully populated, not skeletal:

- complete Project note
- M1/M2/M3 milestone notes
- P1.1–P3.3 phase notes
- PRD with FR/NFR requirements
- Technical Requirements using Next.js/React/TypeScript/Prisma/Neon/Clerk/custom RBAC
- Architecture spec following the CodependentCoding route/feature/fetcher/action/workflow/db/integration boundaries
- ADRs for tenant model, authorization, RLS, billing/provider boundaries, webhook idempotency
- test strategy and representative test cases
- implementation plan
- validation/verification examples
- evidence records
- complete project tasks using the actual ticket code pattern
- Code Lab module/lesson/drill records
- Pattern extraction examples
- daily/weekly/review notes

This example pack becomes the acceptance fixture for the vault automation.

## 38A. Current Notion migration inventory (verified 2026-09-24)

The connected Notion workspace currently exposes:

- 11 live Project rows.
- 40 live Task rows.
- 34 completed tasks and 6 incomplete tasks.
- 6 tasks currently have no Project relation; these are imported as migration-orphan tasks and placed in a repair queue rather than dropped.
- 7 canonical recurring meeting types: Daily Standup, Engineering Meeting, Design Meeting, Operations Meeting, Weekly Sync, Sprint Planning, Post-mortem.

The SOP corpus separately defines the canonical project/task catalog and the three-milestone delivery model. That catalog becomes the Project Type/Starter Blueprint layer; the 11 live Project rows become instantiated projects; the 40 live Task rows become actual TaskNotes tasks.

Migration must preserve the original work code/name, status, work dates, completed state, project relation when present, team/project-type relation, and meeting relation where present. Null project relations are never guessed.

## 38. Migration mapping from Notion

| Notion | Hearth |
|---|---|
| Team | `project_type` |
| Project | Project folder + Project.md |
| Team | `project_type` |
| Starter ontology | project starter blueprint + Code Lab track |
| Milestone | Milestone note |
| Phase | Phase note |
| Task | TaskNotes task |
| Task Code | `ticket_code` |
| Work dates | `scheduled` / `due` |
| Archive | `archive_state` + physical archive |
| Meetings | Daily/Weekly/Sprint/Review notes |
| Portfolio | Absorbed into Project.md + project context artifacts |
| SOP | System SOP Markdown |
| Tech Stack | Tech Stack resource notes |
| LeetCode | Code Lab drills/patterns/tests |

## 38B. Migration queues

The migration package creates three explicit queues:

`2.AREAS/SYSTEM/Migration/Projects/` — imported project manifests.

`2.AREAS/SYSTEM/Migration/Tasks/` — imported TaskNotes records.

`2.AREAS/SYSTEM/Migration/Orphans/` — tasks/resources/meeting references whose parent relation cannot be proven from source data.

Each imported artifact retains `migration_source`, `migration_source_id`, and `migration_imported_at`. These are provenance fields, not user-facing taxonomy.

## 39. Automation rules

Automation may generate or maintain:

- IDs
- work codes
- project/phase/milestone links
- timestamps
- status defaults
- derived links
- document registers
- task provenance
- daily/weekly rollups
- Code Lab mappings
- archive metadata
- active-project Base filters
- health counts and missing-gate diagnostics

Automation must not fabricate:

- business requirements
- architectural rationale
- risk acceptance
- acceptance decisions
- mastery claims
- incident cause conclusions
- subjective reflections

## 40. Acceptance tests for the system itself

The first vertical slice is a full end-to-end proof:

1. Create a project from the CRM starter through QuickAdd, producing the complete starter workspace and Code Lab track.
2. Verify Project/Milestone/Phase notes and work code generation.
3. Create `PRD-001`.
4. Insert `PRD-001.FR-001`.
5. Create a task from that requirement.
6. Verify TaskNotes contains project, milestone, phase, ticket code, provenance, and acceptance context.
7. Create a project planning board.
8. Confirm Project Command Center switches to the project and all active-project Bases update.
9. Complete the task.
10. Generate an Evidence note and link it to the requirement.
11. Confirm the daily rollup records the completed task.
12. Convert the task to an Applied Drill and verify Code Lab module/lesson linkage.
13. Create a Phase Review and verify exit criteria/next action behavior.
14. Create a resource through Web Clipper and process it through the resource lifecycle.
15. Archive and restore a resource.
16. Run vault health checks and confirm zero broken managed relations.

No dashboard is considered complete until the vertical slice passes.


## 41. Automation architecture: properties are managed state, not manual bookkeeping

The large property model is intentional, but the user must not be expected to maintain it manually. Frontmatter is the machine-readable state layer; Meta Bind is the primary human control surface; Templater, QuickAdd, Note Toolbar, and reusable scripts are the automation layer that computes and reconciles derived state.

The system distinguishes three property classes:

### 41.1 Human-controlled properties

These are values that require a deliberate user decision or observation and therefore expose Meta Bind controls:

- status
- priority
- health override when needed
- current focus
- blocker
- next action override
- target dates
- acceptance decisions
- risk acceptance
- review decisions
- confidence
- mastery
- reflection
- meeting notes

### 41.2 System-owned properties

These are generated or reconciled by scripts and should normally be read-only in practice:

- id
- created_at
- updated_at
- work code / ticket code
- relationship fields that can be proven from context
- project_type derived tags
- milestone/phase provenance
- completion timestamps
- archive metadata
- migration provenance
- source/derived-from links
- daily rollup references
- counts and health diagnostics
- Code Lab mappings derived from project/task structure

### 41.3 Computed properties

These should be generated on demand or refreshed, not manually maintained:

- progress percentages
- overdue state
- active/blocked counts
- current phase
- current milestone
- next executable task
- yesterday completed work
- unresolved carry-forward work
- upcoming deadlines
- relevant meetings for the current day
- requirement/test/evidence coverage
- Code Lab lesson/drill state
- review queue membership

A computed value may be written back to frontmatter when persistence is useful, but the source of truth remains the underlying notes/tasks. The renderer must never depend on stale copies when it can calculate from current relations.

### 41.4 Reconciliation principle

Every user action that can change system state should have a deterministic reconciliation path. Examples:

- completing a TaskNotes task updates completion metadata, project rollups, phase counts, and the next-action candidate;
- changing a task's phase/project relationship updates provenance and project indexes;
- completing the last executable task in a phase surfaces Phase Review;
- passing Phase Review surfaces the next phase and next project action;
- archiving a project cascades archive metadata to generated project artifacts without deleting authoritative task history;
- processing a Zettelkasten capture creates or links its durable Resource artifact and records the provenance before the workbench note is archived/deleted according to retention policy.

No workflow should require the user to edit five related notes to keep the system coherent.

## 42. Daily note generation contract

The Daily Note is a **generated operating snapshot**. It is not a journal page with a few prefilled fields. The note should be substantially populated from existing system state on creation and refresh.

### 42.1 Daily note identity

```yaml
id: "DLY-YYYY-MM-DD"
type: daily
date: YYYY-MM-DD
status: open
focus_project: null
focus_domain: null
created: ""
updated: ""
```

### 42.2 Generated sections

The template must generate these sections when relevant data exists:

1. **Operating Context** — current date, week/cycle, active project, current milestone, current phase, current focus, and the next executable task.
2. **What happened yesterday** — completed tasks from the previous working day, their project/phase context, and actual linked outputs/evidence.
3. **What is happening today** — a small ranked executable set, not the entire task backlog.
4. **Deadlines & overdue work** — due today, overdue, and near-term review gates.
5. **Blockers** — open task/project blockers and unresolved carry-forward blockers.
6. **Reviews & gates** — Phase Review, Milestone Review, Post-mortem, or other review events that are actually due.
7. **Meetings** — only meetings that exist for the day or are explicitly scheduled/created; never create a full recurring meeting schedule automatically.
8. **Recent outputs** — documents, evidence, implementation notes, and other artifacts actually created or completed since the previous working day.
9. **Zettelkasten workbench** — new captures awaiting processing, separated into Inbox, AI Threads, Web Clippings, and Fleeting where relevant.
10. **Resource review queue** — resources whose lifecycle state or review date requires attention.
11. **Code Lab** — current ontology/module/lesson, next applied drill, recent attempt, confidence/mastery, and next evidence target.
12. **Repository / vault signal** — recent Git changes, failed checks, orphaned relations, broken IDs, missing required artifacts, or other warnings when available.
13. **Weekly / sprint context** — current weekly sync, sprint/phase objective, and upcoming cycle boundary when relevant.
14. **Carry-forward** — unresolved items from previous daily notes that have not been completed, dismissed, or rescheduled.

### 42.3 Human-input sections

Only information that cannot be derived safely remains manual:

- today's focus override;
- intentional priority change;
- qualitative blocker context;
- decisions made today;
- meeting discussion notes;
- learning reflection;
- end-of-day reflection / exceptions.

### 42.4 Generated-region contract

Dynamic sections must be wrapped in stable markers so refresh does not destroy human-authored notes:

```markdown
<!-- HEARTH:BEGIN daily.operating_context -->
...
<!-- HEARTH:END daily.operating_context -->

<!-- HEARTH:BEGIN daily.yesterday -->
...
<!-- HEARTH:END daily.yesterday -->
```

The same pattern is used for every generated region. User-authored content outside generated regions is preserved byte-for-byte whenever practical.

### 42.5 Yesterday derivation

The system may only report facts supported by source notes:

- a completed TaskNotes task;
- an explicitly linked output/evidence artifact;
- a Git commit or vault change actually present in the repository;
- an explicitly recorded meeting or decision.

The system must not invent narrative descriptions. If a completed task has no linked output, the daily note reports the completed task only.

### 42.6 Task → output provenance

When a document, evidence note, review, or other artifact is created from a task using QuickAdd/Note Toolbar, the automation records the task as `source_task` and the produced artifact as `produced` on the appropriate object. This is what allows the next Daily Note to say, for example:

```markdown
- [x] [[ENG-M1-P1.2-SCAFF-T03]] Generate PRD → [[PRD-001]]
```

without asking the user to retype that relationship.

### 42.7 Today ranking

Today’s work is ranked from authoritative state using:

1. explicit user focus;
2. ready and unblocked status;
3. due date / overdue state;
4. project and milestone priority;
5. dependency readiness;
6. phase position;
7. recent carry-forward;
8. Code Lab application relevance.

The system should surface a deliberately small working set. Additional work remains available through project and task views.

### 42.8 Refresh semantics

Daily Note creation runs the full generation pipeline. A `Refresh Daily` command reruns the same pipeline and updates generated regions in place. No manual copying between yesterday/today sections is permitted as a normal workflow.

## 43. Cadence generation is demand-driven

The Notion model contains Daily Standup, Engineering Meeting, Design Meeting, Operations Meeting, Weekly Sync, Sprint Planning, and Post-mortem templates. Hearth retains all of them but does not instantiate them on every day by default.

Meeting note creation is an explicit action or a schedule-driven event. The Daily Note shows the meetings relevant to the date. When the user chooses to create a meeting, the corresponding domain template is instantiated inside `2.AREAS/DAILY/<meeting-domain>/` or the appropriate review folder.

The system therefore preserves the full cadence without forcing a one-person operator to maintain all cadence artifacts continuously.

## 44. Zettelkasten and Resources are two lifecycle stages of one knowledge pipeline

Zettelkasten is the active workbench for producing and processing knowledge. Resources are the durable library of retained, classified outputs.

```text
ZETTELKASTEN WORKBENCH
Capture → Inbox → Fleeting / AI Thread / Web Clipping / Literature → Process
                                                      │
                                                      ▼
                                            durable Resource artifact
                                                      │
                                                      ▼
3.RESOURCES/
Books / Articles / Documentation / Repositories / Standards / Media / General / Patterns / Tech Stack
```

A processed Zettelkasten note is not required to remain in `2.AREAS/ZETTLECASTEN/`. Its durable result moves into `3.RESOURCES/` (or becomes a linked knowledge artifact under the appropriate resource family). The workbench retains only active processing material and temporary capture state.

AI Threads remain a distinct intake stream because their provenance and extraction workflow differ from web clippings and fleeting notes. They should have their own capture and processing commands.

The Library dashboard is the discovery/management surface over both systems: it should expose resource state, backlinks, tags, properties, MOCs, connected projects, Code Lab links, and graph views without becoming a second source-of-truth database.

## 45. Milestone / Phase / Task boards

The execution model is:

```text
Project
  ├── Milestone Board
  │     ├── Milestone card: Backlog
  │     │      ├── Phase P01
  │     │      └── Phase P02
  │     ├── Milestone card: Ready
  │     ├── Milestone card: In Progress
  │     ├── Milestone card: Review
  │     └── Milestone card: Done
  │
  └── Phase-local execution
         └── TaskNotes tasks (one executable unit, ≤ one workday)
```

The project-local Milestone Board is the strategic/workstream board. A milestone card links its phase notes. A phase contains the TaskNotes execution set. TaskNotes is the execution truth; Kanban is a planning/progress projection. There is no requirement for native Kanban metadata to become the authoritative task database.

## 46. SOLID-style extensibility contract

The system must not hard-code business meaning into individual templates or dashboard files.

The implementation should depend on stable interfaces such as:

```text
ProjectTypeDefinition
OntologyBlueprint
ArtifactDefinition
PropertyDefinition
LifecycleDefinition
MeetingDefinition
BaseDefinition
DashboardCardDefinition
WorkflowDefinition

createProject(definition, context)
createArtifact(definition, context)
reconcileProject(project)
reconcileTask(task)
reconcileDaily(date)
processResource(note)
archiveArtifact(note)
```

The concrete nine Code Lab ontologies, meeting types, property vocabularies, and document packs should be configuration/data objects consumed by reusable scripts. Adding or modifying an ontology should therefore mean editing its definition and blueprint rather than forking the automation engine.

No script may depend on a hard-coded project name, literal folder path, or a fixed list of one-off project IDs when the same behavior can be expressed through typed metadata or a definition registry.

## 47. Work-package architecture for implementation

The implementation work should be performed in Codex, not Work, because the authoritative target is a Git repository containing Obsidian configuration, templates, scripts, plugin settings, and test fixtures. OpenAI currently describes Codex as the dedicated software-development surface for writing/debugging code, running tests/commands, reviewing changes, and working with repositories. Work is positioned for longer multi-step research and finished deliverables. citeturn838246search5turn838246search4

Do not spend the scarce implementation allowance on planning conversations. The implementation package should be assembled first and then handed to Codex as a bounded repository task with:

- the exported Notion Markdown/CSV/asset corpus;
- the current Hearth vault repository;
- CodependentCoding repo snapshot;
- Book of Knowledge;
- Book of Implementation;
- the v0.3 Hearth specification;
- explicit acceptance tests;
- migration manifests;
- ontology definition files;
- property/taxonomy definitions;
- plugin configuration targets;
- test fixtures;
- a final verification checklist.

Work/Codex usage is shared in applicable credit-based configurations, so there is no reliable “save Work credits but freely use Codex” separation to plan around. OpenAI's current documentation says eligible plans can share the same agentic usage/credit pool across Work and Codex, and credits can apply across supported features. citeturn838246search2turn838246search10

## 48. Required implementation sequence

The first Codex implementation pass should not attempt to improvise the ontology while simultaneously migrating live data. It should implement the engine and fixtures in dependency order:

1. System contract, controlled vocabularies, property registry, and definition registries.
2. Folder topology and plugin configuration changes.
3. Reusable Templater/QuickAdd/Meta Bind integration scripts.
4. Daily Note generation/reconciliation engine.
5. Project/Milestone/Phase/Task execution model and Milestone Board.
6. Zettelkasten → Resource processing pipeline.
7. Library discovery Bases and Hearth dashboard projections.
8. Code Lab ontology/module/lesson/drill mapping to the nine Maximal Template ontologies.
9. Complete project/document/task templates and starter blueprints.
10. CRM reference fixture and end-to-end acceptance test.
11. Notion migration of the 11 projects, 40 tasks, meeting templates/cadence, and explicit orphan repair queue.
12. Full vault audit, broken-link/property/ID checks, and migration report.

No step may silently reduce the nine-ontology scope or omit the current Notion data because of implementation convenience.

## 49. Definition of done for automation

The system is not considered implemented merely because templates contain the right fields. The following behaviors must be demonstrated in a live vault:

- Creating a project produces all required system state without manual property filling.
- Changing a user-controlled property through Meta Bind updates the authoritative note and triggers reconciliation where required.
- Completing a task updates dependent project/phase/daily projections.
- Creating an artifact from a task records the task→artifact provenance automatically.
- Daily Note creation produces a populated operating context from existing data.
- Refreshing the Daily Note after completing work changes the derived sections without requiring hand edits.
- Meeting templates remain available but are only instantiated when needed.
- Zettelkasten processing creates a durable resource and clears/moves the workbench item according to policy.
- Project Milestone Board reflects milestone state while phase/task execution remains grounded in underlying notes/tasks.
- Code Lab progress follows real implementation evidence, not manually asserted curriculum completion.
- Adding a new Project Type/Ontology requires configuration and template data changes, not edits across a pile of hard-coded scripts.
- Vault audit reports identify stale or inconsistent derived state rather than silently masking it.



## 50. Implementation quality gate: no template slop

The current repository is an explicit baseline to replace, not a quality target. The implementation must not preserve thin placeholder templates merely because they already exist.

Observed current baseline in `master`:

- `2.AREAS/SYSTEM/Templates/Daily.template.md` contains a minimal Scrum section, Stack Syntax drills, Habits, Notes, and Shutdown prompts; it does not implement the generated operating snapshot defined above.
- `2.AREAS/SYSTEM/Templates/Project.template.md` contains generic Outcome / Why Now / Context / Milestones / Tasks / Evidence / Roadmap sections but does not implement the complete project execution/documentation pack.
- `.obsidian/plugins/quickadd/data.json` currently exposes only New Project, New Task, and Stack Syntax Drill as substantive QuickAdd choices.
- Existing Hearth configuration already contains multiple dashboards and useful visual assets; the implementation should refine and expand that foundation rather than throw it away.

### 50.1 Template quality standard

Every system template must be useful on first creation. A template is not accepted if it is only a list of headings with blank placeholders.

Templates must provide:

- meaningful starter prose or instructions;
- dynamic context pulled from the current object/project;
- real tables/checklists where appropriate;
- acceptance criteria or completion gates where applicable;
- linked source/provenance placeholders that the system can fill;
- generated sections separated from human-authored sections;
- contextual Meta Bind controls;
- contextual Note Toolbar actions;
- enough structure that the note can immediately support the work without a second redesign.

### 50.2 Dashboard quality standard

Every Hearth dashboard must be tested for:

- no dead cards;
- no missing Base targets;
- no broken command IDs;
- no duplicate navigation surfaces;
- consistent visual hierarchy;
- readable density;
- useful empty states;
- compact but obvious actions;
- actual live data rather than mock content;
- a clear distinction between source-of-truth data and projections.

Use the existing background assets and the Hearth plugin's actual card capabilities. Do not invent unsupported card types.

### 50.3 Automation quality standard

No routine workflow should require synchronized manual edits in multiple notes. Where a relation can be established by the workflow that created it, the workflow must establish it.

### 50.4 Migration safety

The implementation must be overlay-first and no-delete until verification passes. Existing high-value notes are preserved. The Notion export is imported through a migration manifest, with explicit orphan/repair queues rather than guessed relationships.

