# Hearth Implementation Work Package v0.2

## 1. Mission

Build the full Hearth system in the existing vault repository. This is an implementation package, not a design exercise. The repository already contains a useful but incomplete Hearth foundation; retain good existing configuration and replace thin scaffolding.

## 2. Known baseline

The current `master` repository already includes Hearth, TaskNotes, Meta Bind, QuickAdd, Templater, Note Toolbar, Callout Studio, Kanban, Bases, Obsidian Git, Code Space, Note Refactor, and existing dashboards/templates.

The current baseline is insufficient in several obvious ways:

- Daily template is minimal and manual.
- Project template is generic and underspecified.
- QuickAdd has only a few substantive workflows.
- Existing dashboard configuration contains multiple copies/experiments that need consolidation into the agreed Hearth destinations.

The implementation must upgrade the baseline instead of recreating a toy vault.

## 3. Canonical storage

```text
1.PROJECTS/
2.AREAS/
  SYSTEM/
    _Tasks/
    Templates/
    Scripts/templater/
    Config/
    Registry/
    Bases/
    State/
    SOPs/
  DAILY/
    Operations/
    Product/
    Design/
    Engineering/
    Marketing/
    Research/
  ZETTLECASTEN/
    Inbox/
    AI Threads/
    Web Clippings/
    Fleeting/
    Literature/
3.RESOURCES/
4.ARCHIVE/
```

Names may be adjusted to match existing canonical paths, but semantics must remain.

## 4. Required registries

Create machine-readable definitions under `2.AREAS/SYSTEM/Config` (JSON preferred for deterministic parsing):

- property-registry.json
- project-types.json
- ontology-blueprints.json
- artifact-types.json
- lifecycle-definitions.json
- meeting-definitions.json
- dashboard-definitions.json
- base-definitions.json
- tag-taxonomy.json
- migration-map.json

The scripts must consume these registries rather than hard-coded lists.

## 5. Property implementation

Implement the property model from `Hearth-Property-Registry-v0.1.md`.

Hard requirement: the user should not manually maintain derived properties.

Meta Bind must expose only user-controlled values. The machine layer generates the rest.

## 6. Core scripts

Build reusable Templater user scripts, split by responsibility:

```text
SYSTEM/Scripts/templater/
  core/
    config.js
    registry.js
    ids.js
    paths.js
    yaml.js
    links.js
    provenance.js
    reconcile.js
  project.js
  milestone.js
  phase.js
  task.js
  document.js
  daily.js
  resource.js
  zettelkasten.js
  codelab.js
  board.js
  migration.js
  audit.js
```

Do not create one monolithic script.

## 7. Daily engine

Create the Daily Note from the Daily Notes plugin through a canonical Templater template.

The template must:

- initialize the daily ID;
- compute previous working day;
- generate all derivable operating context;
- create generated regions with markers;
- preserve user-authored regions;
- expose compact Meta Bind controls;
- expose a `Refresh Daily` action;
- never instantiate the full meeting cadence merely because it exists.

## 8. Task integration

TaskNotes remains authoritative.

The task workflow must establish:

`Task → Project → Milestone → Phase → Ticket Code → Source Requirement/Document → Produced Artifact → Evidence → Code Lab Drill (when applicable)`

Task creation should inherit current project/phase context automatically and default to one executable unit of work.

## 9. Milestone Board

Every project receives a project-local `Board.md` representing milestones.

Board columns:

- Backlog
- Ready
- In Progress
- Review
- Done
- Cancelled

Milestone cards contain the linked phases and current phase/task summary.

Implement a reconciliation action that reads board placement and updates milestone state deterministically. Do not pretend Kanban itself is the source of truth.

## 10. Templates

Replace thin templates with substantive ones.

Required minimum families:

- Project
- Project Charter
- Project Index
- Roadmap
- Milestone
- Phase
- Board
- Daily
- Daily Domain
- Phase Review
- Milestone Review
- Weekly Sync
- Sprint Planning
- Post-mortem
- PRD
- Technical Requirements
- Architecture
- ADR
- Implementation Plan
- Test Plan
- Validation Report
- Verification Report
- Evidence
- Task
- Resource
- AI Thread
- Web Clipping
- Fleeting
- Literature
- Pattern
- Code Lab Module
- Code Lab Lesson
- Applied Drill
- Lesson Test
- Module Assessment
- Learning Journal

Each template must be context-aware and include actual prompts/examples/checklists appropriate to its purpose.

## 11. Nine starter ontologies

Implement all nine as data-driven starter blueprints:

1. CRM / Pipeline Tracker
2. Project Management / Task Tracker
3. Customer Support / Ticketing
4. Marketing Automation & Analytics
5. Invoicing & Expense Tracker
6. Social Media Scheduler
7. AI-Powered Wrapper / Micro-SaaS
8. B2B Client Portal
9. Internal Tools / Admin Portal

These are application ontologies over the shared Maximal Template foundation, not nine independent product repositories.

Each blueprint must produce a usable project documentation/implementation pack and Code Lab track.

## 12. Code Lab

The Code Lab is applied software construction.

Mapping:

```text
Ontology Blueprint → Module
Milestone → Module gate
Phase / Dev Cycle → Lesson
Task → Applied Drill
Task execution → Drill evidence
Phase Review → Lesson Test
Milestone Review → Module Assessment
Project completion → Capstone evidence
```

The user writes the code in Code Space. The system tracks the learning state from real implementation evidence.

Do not add beginner LeetCode filler as the primary curriculum.

## 13. Zettelkasten / Resource pipeline

```text
Capture
  ↓
ZETTLECASTEN workbench
  ├─ Inbox
  ├─ AI Threads
  ├─ Web Clippings
  ├─ Fleeting
  └─ Literature
  ↓ process
Durable Resource
  ↓
3.RESOURCES/
```

Processing must preserve provenance and then move/archive the workbench note according to lifecycle policy. The Library dashboard is the discovery layer over durable resources and linked knowledge.

## 14. Meeting/cadence migration

Retain the seven canonical meeting definitions:

- Daily Standup
- Engineering Meeting
- Design Meeting
- Operations Meeting
- Weekly Sync
- Sprint Planning
- Post-mortem

Their canonical content comes from the Notion export. They are created on demand or when explicitly scheduled. The Daily Note only shows meetings that actually apply to that day.

## 15. Notion migration

Current verified live inventory before the export is processed:

- 11 current projects
- 40 current tasks
- 7 canonical recurring meeting types
- 6 tasks without a Project relation

The six orphan tasks must enter an explicit repair queue. Do not infer projects from names.

The current live project types observed are `OPS`, `PROD`, `DES`, `ENG`, `MKT`, `RES`.

The SOP catalog becomes starter blueprints/project-type data, while live database rows become instantiated projects/tasks.

## 16. Hearth dashboards

Implement exactly these destinations:

- Home
- Command Center
- Project Command Center
- ZETTLECASTEN
- Library
- Code Lab
- Git & Vault Stats

No Portfolio dashboard.

Project Command Center must use a persistent selected-project context. No All Projects project detail view.

## 17. Dashboard design bar

Use the existing Hearth assets and actual plugin card capabilities.

The dashboard must be visually coherent:

- one clear visual hierarchy;
- 12-column layout where supported;
- restrained card count;
- consistent iconography;
- consistent empty states;
- compact command clusters;
- no giant tables where a Base can provide filtering;
- no repeated nav links in every panel;
- no dead cards;
- no placeholder text.

## 18. QuickAdd command surface

Implement the full command inventory defined in the v0.4 specification, grouped by context. Use macros to chain prompts, template creation, provenance, and reconciliation.

High-frequency actions must be one or two clicks after context is known.

## 19. Note Toolbar

Implement contextual toolbars for project, milestone, phase, task, document, resource, daily, Code Lab, and archive contexts.

## 20. Audit / verification

Create a repeatable audit command/report that checks:

- required folders
- required templates
- plugin configuration paths
- Base targets
- QuickAdd target IDs
- missing properties
- invalid controlled vocabulary values
- broken typed relationships
- duplicate IDs
- orphan tasks
- missing provenance
- stale derived state
- missing Code Lab mappings
- missing ontology blueprints
- missing migration records
- accidental Portfolio artifacts

## 21. Required CRM fixture

Use CRM / Pipeline Tracker as the end-to-end fixture.

Instantiate a realistic project pack including:

- Project.md
- Charter
- Roadmap
- Milestone(s)
- Phase(s)
- PRD
- Technical Requirements
- Architecture
- ADR
- Implementation Plan
- Test Plan
- Validation/Verification evidence
- TaskNotes tasks
- Code Lab module/lesson/drill mapping
- Project-local Milestone Board

Use the CodependentCoding Maximal Template to make the example structurally meaningful.

## 22. Tests

Provide fixtures/tests for:

- project creation
- task creation/inheritance
- completion reconciliation
- artifact provenance
- daily creation
- daily refresh without destroying human text
- milestone board reconciliation
- Zettelkasten processing
- resource lifecycle
- ontology starter creation
- Code Lab evidence/mapping
- migration/orphan handling
- audit/reporting

## 23. Implementation order

1. Inventory sources and current repo.
2. Registry/config layer.
3. Folder/path contract.
4. Core scripts and YAML/frontmatter handling.
5. Meta Bind controls.
6. Templates.
7. Task/project/phase/milestone engine.
8. Daily engine.
9. Zettelkasten/Resource engine.
10. Code Lab engine.
11. Hearth dashboards.
12. QuickAdd/Toolbar.
13. Migration.
14. Audit/tests.
15. Final cleanup and verification.

Do not skip ahead to visual polish while core semantics are broken, but do not leave visual polish unfinished either.

## 24. Completion criteria

The package is complete only when:

- all specified destinations exist;
- all required templates are substantive;
- all high-frequency actions work;
- derived state updates automatically;
- Daily Notes are genuinely useful on creation;
- the nine ontologies can be instantiated;
- CRM fixture passes end-to-end;
- Notion migration is deterministic;
- no Portfolio semantics remain;
- tests/audit pass or clearly report known plugin limitations;
- no placeholder/TODO implementation remains in required paths.
