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
