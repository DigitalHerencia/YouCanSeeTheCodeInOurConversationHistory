# DevNotes Agent Instructions

## Purpose

DevNotes is a private, Git-backed Obsidian workspace whose active operating model is **Digital Herencia**.

The active system is an Obsidian-native rebuild of the Digital Herencia Notion workspace. It organizes work around **Teams, Projects, Tasks, Meetings, Portfolio, Schedule, SOPs, Tech Stack, and authored material**.

Do not reintroduce ChatGPT Project roles, Codependent Coding ownership, role folders, inter-project handoffs, or other superseded orchestration as active governance.

## Governing sources

The active operational contract is:

- `Digital Herencia/System/Operating Model.md`
- `Digital Herencia/System/Cadence.md`
- the migrated SOPs in `Digital Herencia/SOPs/`

The Notion workspace is the migration source. The Obsidian vault is the durable operating environment after migration.

When migrated SOPs conflict, preserve the conflict and source wording. Do not silently reconcile doctrine.

## Core entities

### Teams

The operating workspace contains these current teams:

- Operations Team
- Product Team
- Design Team
- Engineering Team
- Marketing Team
- Research Team

The migrated SOPs define Operations, Product, Design, Engineering, and Marketing as the canonical studio functions. Research exists as an operational team in the Notion data model and is preserved as such without rewriting the SOPs.

### Projects

Projects carry:

- `domain`: OPS, PROD, DES, ENG, MKT, RES
- `milestone`: M1, M2, M3
- `phase`: P1.1 through P3.3
- `status`: Backlog, Ready, In progress, Review, Done
- work date range
- team relationship
- task relationships
- meeting relationships
- archive state

### Tasks

Tasks are daily execution units related to a project and team. Imported task state is preserved from Notion.

TaskNotes-compatible mutable state uses:

`backlog → ready → in-progress → blocked → done / cancelled`

### Meetings

Meeting series preserve explicit `type` and `cadence`.

Supported cadence values migrated from Notion:

- Daily
- Weekly
- Biweekly
- Ad Hoc

Supported meeting types migrated from Notion:

- Operations
- Standup
- Weekly Sync
- Post-mortem
- Sprint Planning
- Design
- Engineering

### Portfolio

Portfolio items preserve parent/child relationships and links to teams, projects, tasks, and meetings.

## Delivery model

The migrated SOP model is:

`Milestone → Phase → Project → Task/Ticket`

The fuller Notion framework also expresses:

`Portfolio → Milestone → Phase → Project → Task`

Milestones and phases are preserved exactly as source concepts. Do not replace them with a different project-management taxonomy.

## Obsidian interaction layer

Use the installed plugins instead of inventing another interface:

- **Hearth**: primary dashboard shell
- **Bases**: projects, tasks, teams, meetings, schedule, portfolio, SOPs, tech stack, library
- **Meta Bind**: routine mutable-state controls where useful
- **Note Toolbar**: context actions
- **Templater**: deterministic creation shapes
- **QuickAdd**: creation commands when configured
- **TaskNotes**: task lifecycle/calendar/agenda when compatible with the Digital Herencia task schema
- **Kanban**: optional board presentation
- **Callout Studio**: semantic visual markers
- **Iconic**: wayfinding
- **Git**: provenance and synchronization

Do not add external integrations merely because they exist.

Routine work must not require manual YAML editing.

## No-delete migration rule

This migration is additive and non-destructive.

- Do not delete existing notes.
- Do not mass-move existing notes.
- Do not mass-rename existing notes.
- Existing material outside `Digital Herencia/` remains valid historical/reference content unless explicitly reclassified later.
- `ZETTLECASTEN/` and `CIGARETTES, REGRETS, & NEURAL NETS/` remain untouched unless separately requested.
- Superseded active system files are preserved under `Legacy/System/` before replacement.

The vault-wide `Digital Herencia/Bases/Library.base` is the transition layer that makes old material retrievable inside the new system without relocating it.

## Editing rules

Inspect current state before edits. Make the smallest useful change. Preserve unrelated work.

When creating new operational records, use human-readable filenames and valid Obsidian Properties. Internal relationships use wikilinks.

Do not silently convert old notes to the new schema. New Digital Herencia records use the new schema; legacy records remain readable through the Library base.

## Final rule

The system succeeds when the Digital Herencia dashboard is the useful front door, current work is visible, SOPs remain recoverable, recurring cadence is explicit, and the old vault remains intact behind it.