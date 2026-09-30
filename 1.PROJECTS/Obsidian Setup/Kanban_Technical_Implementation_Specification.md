# Kanban Technical Implementation Specification

## Purpose

Kanban is the visual project-flow layer.

It represents Project Phases as cards on milestone-specific boards. It does not manage TaskNotes and does not create a second task system.

The model is:

```text
Project
├── Milestone 1 → Board
│   ├── Phase 1.1 card
│   ├── Phase 1.2 card
│   └── Phase 1.3 card
├── Milestone 2 → Board
│   ├── Phase 2.1 card
│   ├── Phase 2.2 card
│   └── Phase 2.3 card
└── Milestone 3 → Board
    ├── Phase 3.1 card
    ├── Phase 3.2 card
    └── Phase 3.3 card
```

Tasks remain TaskNotes in `2.AREAS/SYSTEM/_Tasks`.

## Board Contract

There is no generic project board.

Each generated board corresponds to:

```text
Project + Milestone
```

The board name and metadata identify both.

The board contains Phase cards only.

## Board Location

Boards live inside the generated project folder.

Recommended structure:

```text
1.PROJECTS/
└── <Project>/
    └── Kanban/
        ├── M1 — Foundation & Architecture.md
        ├── M2 — MVP Build & Launch.md
        └── M3 — Expansion & Hardening.md
```

The exact project folder name is user-selected.

## Card Contract

A card represents a Phase.

A card should link directly to the Phase note:

```text
- [[P1.1 — Product Discovery & Business Definition]]
```

Cards must not represent:

- Tasks;
- TaskNotes;
- arbitrary documents;
- RoadMaps;
- code files;
- resources.

## Board Columns

The default columns are:

```text
Backlog
Ready
In Progress
Review
Done
Cancelled
```

Column state describes the Phase's visual execution state.

The board does not automatically change TaskNotes status.

## Phase Relationship

The relationship is:

```text
Milestone
   ↓
Kanban Board
   ↓
Phase Card
   ↓
Phase Note
   ↓
RoadMap
   ↓
TaskNotes
```

The board is a visual surface over the Project hierarchy.

## RoadMap and Task Boundary

RoadMaps define the concrete execution plan for a Phase.

Tasks execute the RoadMap.

Kanban stops at the Phase level.

Therefore:

```text
Kanban → Phase
TaskNotes → Task
```

No task card is required for normal task execution.

## Creation Workflow

The complete creation flow is:

```text
QuickAdd: Create Project
        ↓
Create Project folder
        ↓
Create Milestones / Phases / RoadMaps
        ↓
Create one Board per Milestone
        ↓
Populate each Board with its Phase cards
```

Templater provides the initial board document structure.

QuickAdd supplies the project and milestone context.

Kanban owns the resulting board state.

## Board Updates

Users may move Phase cards between columns.

The Kanban plugin owns:

- column order;
- card order;
- card position;
- board state.

A card move does not automatically complete a Phase or its Tasks unless an explicit synchronization workflow is implemented.

## Synchronization

No automatic Phase/Task synchronization is required for the initial implementation.

If synchronization is added later, it must be explicit:

```text
Kanban column
    ↓
Phase state
    ↓
optional TaskNotes consequences
```

Bidirectional synchronization is not part of the initial contract.

## Project Command Center

The Project Command Center displays the selected project's milestone boards.

It should show:

- selected project;
- milestone;
- phase boards;
- active Phase;
- links to Phase notes;
- related TaskNotes.

It must not present an "All Projects" board.

## Daily Workflow

Daily Notes and Command Center views may link to the active Phase or its board.

They do not create another board.

## Archive

When a Project is archived, its milestone boards remain inside the project record unless an explicit archive workflow moves the complete project.

Board history should remain inspectable.

## Duplicate Prevention

Project creation must not create a second board for the same Project + Milestone.

If the expected board already exists, the creation workflow should reuse it or stop with a clear message.

## Board Template

`2.AREAS/SYSTEM/Templates/Board.template.md` is a structural template for generated milestone boards.

It is not a generic standalone project board.

QuickAdd supplies:

- Project;
- Milestone;
- Phase links;
- Board title.

The generated board is then managed by Kanban.

## Plugin Boundaries

```text
QuickAdd  → creation/orchestration
Templater → initial document generation
Kanban   → board state
TaskNotes → task lifecycle
Meta Bind → interactive properties
Bases    → structured queries
Hearth   → presentation
```

## Validation

Implementation is complete when:

1. A new project creates one board per milestone.
2. Each board contains only its milestone's phases.
3. No task appears as a board card.
4. Each card links to the corresponding Phase.
5. Board state persists after card movement.
6. Tasks remain usable in `2.AREAS/SYSTEM/_Tasks`.
7. Project Command Center can reach each milestone board.
8. Duplicate boards are prevented.
9. Archived projects retain their boards.
