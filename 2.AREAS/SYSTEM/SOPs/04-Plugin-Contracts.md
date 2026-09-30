# Plugin Contracts SOP

## Templater

Owns template rendering and deterministic user scripts. Template directory: `2.AREAS/SYSTEM/Templates`. User scripts: `2.AREAS/SYSTEM/Scripts/templater`.

## QuickAdd

Owns guided creation and workflow orchestration.

Canonical workflows include Project, Milestone, Phase, RoadMap, Task, project artifacts, capture/processing, Code Lab learning, evidence, resource processing, and Hearth navigation.

Deprecated duplicate workflows are removed rather than hidden.

## Meta Bind

Owns interactive property editing. Use inputs for mutable workflow state such as status, priority, target date, readiness, mastery, and publication state.

Stable identifiers are displayed but not casually edited.

## TaskNotes

Owns task lifecycle, calendar, agenda, and task views. Storage is `2.AREAS/SYSTEM/_Tasks`.

## Kanban

Owns visual milestone flow. One board per Project + Milestone. Phase cards only.

## Bases

Owns structured query/view presentation. No Dataview.

## Hearth

Owns dashboard presentation, cards, search, and navigation surfaces. Hearth does not become a second task manager.

## Note Toolbar

Owns contextual navigation/actions by folder and editing context.

## CodeSpace

Owns editing access to mounted code artifacts. It does not redefine Code Lab knowledge.

## Git

Owns version history, commit, sync, and repository status.

## Note Refactor

Owns extraction and restructuring of captured notes.

## Web Clipper

Owns browser capture into Zettelkasten inbound folders.

## Linter

Owns formatting normalization, not semantic rewriting.

## Iconic

Owns vault-wide visual identity and file/folder icons.

## Callout Studio

Owns semantic visual callouts for status, evidence, decisions, traceability, warnings, and workflow guidance.

## Pretty Properties

Owns property presentation only. It does not change property semantics.

## Table Editor

Owns table editing.

## Conflict rule

When two plugins can perform the same action, the plugin named above owns the workflow. Other plugins may surface the action but must not create competing behavior.


## Approved configuration

Templater:
- Templates folder: `2.AREAS/SYSTEM/Templates`
- User scripts: `2.AREAS/SYSTEM/Scripts/templater`
- Ignore `_Tasks`, `_mounts`, and `4.ARCHIVE` on automatic file creation.

QuickAdd:
- New Project generates the complete project skeleton.
- Milestone, Phase, RoadMap, and Task workflows use the canonical hierarchy.
- Project starter variants are removed.
- Duplicate creation/reconcile workflows are removed.

TaskNotes:
- Task folder: `2.AREAS/SYSTEM/_Tasks`
- Task identity: `type/task`
- Body template: `Task Bridge.template.md`
- TaskNotes manages task views and lifecycle after creation.

Kanban:
- Boards live inside project folders.
- One board per milestone.
- Phase cards only.

Bases:
- All reusable Bases live in `2.AREAS/SYSTEM/Bases`.
- Bases query Markdown properties; they do not create a parallel record store.

Hearth:
- Home is the default dashboard.
- Command Center and Project Command Center remain separate.
- Project Command Center has one selected project.
- Vault is the Git/statistics dashboard.

Git:
- Repository status and history remain available from Hearth and the Git view.
- Git is not used to create or mutate project/task metadata.

Linter:
- Runs on save.
- Formats YAML/Markdown without rewriting semantic content.

Meta Bind:
- Interactive inputs are used for mutable workflow state.
- Stable IDs are not exposed as routine editable controls.

Note Toolbar:
- Folder mappings select contextual toolbars.
- Project, Zettelkasten, System, Blog, Social, Code Lab, Daily, Resources, and Archive contexts have explicit mappings.

Callout Studio:
- Semantic callout catalog is limited to workflow, evidence, decision, traceability, and guidance use cases.

Iconic:
- Top-level PARA folders and active Area folders use explicit semantic icons.
