# Hearth Technical Implementation Specification

## Purpose

Hearth is the vault's navigation and presentation layer.

It surfaces existing Project, TaskNotes, Kanban, Bases, Code Lab, Library, Zettelkasten, Blog, Social, and Git information without becoming another data model.

The architecture is:

```text
Vault records
    ↓
Plugins / Bases / Kanban
    ↓
Hearth
    ↓
User
```

## Canonical Destinations

Hearth provides these primary destinations:

- Home
- Command Center
- Project Command Center
- Library
- Coding Lab
- Git & Vault Stats

Home remains the clean default screen with its header, search, and background presentation. It is not replaced by the denser Command Center.

## Command Center

The Command Center is the daily-driver workspace.

It presents:

- today's plan;
- yesterday's review;
- deadlines;
- calendar context;
- focus and next action;
- daily standup;
- active task context.

It consumes TaskNotes and Bases data rather than creating task records.

## Project Command Center

The Project Command Center represents one selected project at a time.

It must not provide an "All Projects" mode.

The selected project should persist across visits when the Hearth implementation supports persistent state.

The selected project view surfaces:

- project status;
- milestone and phase context;
- milestone-specific Kanban boards;
- active tasks;
- deadlines;
- Daily Note / standup context;
- project documentation;
- project notes;
- resources;
- Code Lab references;
- mounted codebase references;
- Blog and Social references.

## Project Filtering

The selected project is the primary filter.

Conceptually:

```text
Project selector
      ↓
selected project
      ↓
Project Command Center
      ├── milestones
      ├── phase boards
      ├── TaskNotes
      ├── documents
      ├── resources
      ├── codebase
      └── posts
```

No second project-selection mechanism should silently override it.

## Hearth Boundaries

Hearth does not own:

- task creation;
- task status lifecycle;
- Kanban card movement;
- template rendering;
- interactive property mutation;
- Code Lab classification;
- Git history;
- repository editing.

Those operations delegate to the owning system.

## Actions

Hearth actions should call the appropriate owner:

```text
Create → QuickAdd
Edit property → Meta Bind
Move board card → Kanban
Structured query → Bases
Edit source → CodeSpace
Version control → Git
```

## Home

Home is intentionally sparse.

It should not become a dashboard containing every available metric.

The Home screen should provide:

- visual header;
- search;
- primary navigation;
- optional minimal quick actions.

## Library

Library presents:

- notes;
- images;
- backlinks;
- bookmarks;
- tags;
- graph;
- related resources;
- saved web material;
- AI thread archives.

Rediscovery is the goal; Hearth does not own the notes themselves.

## Coding Lab

Coding Lab presents the Code Lab hierarchy:

```text
Domain
  ↓
Dev Cycle
  ↓
Standard
  ↓
Pattern
  ↓
Code Artifact
```

Learning views may additionally present lessons, drills, tests, and evidence.

## Git & Vault Stats

The existing Git dashboard remains the starting point.

Hearth may surface:

- recent commits;
- repository changes;
- vault statistics;
- relevant project repository state.

It must not become a replacement for Git.

## Implementation Rules

1. Hearth presents data; it does not duplicate data.
2. Home and Command Center remain distinct.
3. Project Command Center always operates on one selected project.
4. Actions delegate to owning plugins.
5. Hearth views must link back to underlying notes.
6. No hidden project state may exist only inside Hearth.
7. Dashboard calculations should derive from canonical records.
8. Avoid presentation logic that silently mutates records.

## Validation

Hearth is implemented when each destination opens reliably, Project Command Center isolates one project, actions delegate correctly, and every displayed record can be traced back to its underlying note or plugin-owned state.
