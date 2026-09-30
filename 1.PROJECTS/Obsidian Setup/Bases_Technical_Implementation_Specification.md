# Bases Technical Implementation Specification

## Purpose

Bases is the structured-view layer for Markdown records in the vault.

Bases reads properties and relationships already present in notes and presents them as tables, cards, filters, and other structured views. It does not create a parallel data store.

The boundary is:

```text
Markdown records + properties
        ↓
      Bases
        ↓
structured views
        ↓
Hearth / user
```

Bases does not own note creation, task lifecycle, Kanban state, interactive property mutation, or project hierarchy.

## Canonical Storage

Base definitions belong in:

```text
2.AREAS/SYSTEM/Bases/
```

Project-specific notes remain in `1.PROJECTS`. TaskNotes remain in `2.AREAS/SYSTEM/_Tasks`. Code Lab remains in `2.AREAS/CODE`.

## Required Views

The existing vault model uses Bases for:

- Active project tasks
- Tasks today
- Tasks overdue
- Tasks blocked
- Recently completed tasks
- Project documents
- Project evidence
- Code Lab objects
- Patterns
- Resources and library records

A Base should answer one useful query. Avoid creating large Bases that reproduce an entire dashboard.

## Data Contract

Bases may filter and display:

```text
project_id
project
milestone
phase
roadmap
task_id
status
dependency
deliverable
type
tags
created
updated
```

The exact property names must match the canonical note model.

## Project Views

Project views filter by the selected project context.

The Project Command Center should use the selected project rather than an "All Projects" mode.

## Task Views

Task views read TaskNotes from:

```text
2.AREAS/SYSTEM/_Tasks
```

They must not read the prototype Tickets directory as the active task database. Tickets are the prototype references used to define generated TaskNotes.

## Relationship to Meta Bind

Meta Bind changes interactive properties.

Bases reads those properties.

```text
Meta Bind → mutation
Bases → query/view
```

## Relationship to Kanban

Kanban owns visual board state.

Bases provides structured views of the underlying notes.

A Base must not attempt to reproduce Kanban board state.

## Relationship to Hearth

Hearth embeds or presents Bases where a structured view is useful.

Hearth is the presentation layer; Bases remains the query/view definition.

## Implementation Rules

1. No Dataview.
2. No duplicate task records.
3. No hidden database.
4. Base filters must use canonical properties.
5. Project filtering must remain project-specific.
6. Bases must remain readable and independently useful.
7. Base names should describe the question they answer.
8. Do not create a Base solely because a property exists.
9. Do not use Bases to mutate workflow state.
10. Preserve source-note links so every row can be opened directly.

## Validation

A Base is implemented when:

- its source folder/query is correct;
- its properties resolve;
- filters match the canonical model;
- rows link to the underlying notes;
- project-specific views isolate the selected project;
- no duplicate task or project data is introduced.
