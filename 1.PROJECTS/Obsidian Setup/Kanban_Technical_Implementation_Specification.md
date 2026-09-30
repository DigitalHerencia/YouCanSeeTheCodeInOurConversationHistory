# Kanban Technical Implementation Specification

## 1. Purpose

Kanban is the vault's project-board layer.

It provides a visual workflow board for individual projects and represents project work as cards organized into workflow columns.

The architectural role is:

```text
Project
   ↓
Project-local Board.md
   ↓
Kanban
   ↓
Visual project workflow
```

Kanban is not the project's database, task manager, documentation system, or dashboard.

Its purpose is to provide a visual execution surface for project work.

---

# 2. Responsibilities

Kanban is responsible for:

- project-local boards
    
- board columns
    
- cards
    
- card movement
    
- visual workflow state
    
- project execution visibility
    
- board-level organization of work
    
- preserving board state within the project

Kanban should provide a visual representation of project execution without becoming a second project-management architecture.

---

# 3. Non-Responsibilities

Kanban does not own:

```text
Project identity
Project documentation
Milestones
Phases
Task identity
Task lifecycle
Task metadata
Templates
Task creation
Dashboard presentation
Knowledge management
Code editing
Publishing
```

Those responsibilities remain with:

```text
QuickAdd   → creation
Templater  → generation
TaskNotes  → tasks
Meta Bind  → interactive properties
Bases      → structured views
Hearth     → dashboards
CodeSpace  → code editing
```

---

# 4. Board Storage Contract

Each project should have its own Kanban board.

The project structure is:

```text
1.PROJECTS/
└── <Project>/
    ├── Project.md
    ├── Board.md
    └── <project artifacts>
```

The board belongs to the project folder.

This preserves the project-local nature of the execution board.

There should not be one global Kanban board representing every project.

---

# 5. Board Identity

The board is associated with a specific project.

The board's identity is therefore derived from:

```text
Project
    ↓
Project folder
    ↓
Board.md
```

The board should not exist as an independent global project-management object.

---

# 6. Board Creation Contract

Board creation belongs to the project creation workflow.

The expected sequence is:

```text
QuickAdd
   ↓
New Project
   ↓
Create project folder
   ↓
Create Project.md
   ↓
Create Board.md
   ↓
Initialize Kanban board
```

QuickAdd orchestrates creation.

Kanban manages the resulting board.

---

# 7. Board Template

The repository contains:

```text
2.AREAS/SYSTEM/Templates/Board.template.md
```

The board template defines the initial Markdown structure for a project board.

The final implementation must establish exactly how this template is consumed.

The preferred boundary is:

```text
QuickAdd
    ↓
create Board.md
    ↓
Templater
    ↓
Board structure
    ↓
Kanban
```

---

# 8. Board Initialization

A newly created board should have a defined initial column structure.

The exact column vocabulary must be frozen before automation.

Conceptually:

```text
Backlog
Ready
In Progress
Review
Done
```

These names are examples of workflow states, not a final assertion about the canonical board.

The actual board specification must establish:

```text
columns
column order
initial cards, if any
card representation
```

---

# 9. Column Contract

Every board column represents a defined visual workflow state.

Each column should have:

```text
Name
Purpose
Allowed card state
Position
Transition behavior
```

For example:

```text
Column:
In Progress

Purpose:
Work currently being executed.

Card state:
Active project work.

Position:
Defined board order.
```

The board should not contain arbitrary columns that have no defined project meaning.

---

# 10. Card Contract

A Kanban card represents a piece of project work.

A card may represent:

```text
Task
Project artifact
Other explicitly defined project work item
```

The final board model must determine which object types are permitted.

The board should not become a general-purpose note organizer.

---

# 11. Task Card Relationship

Where a card represents a task, the card should reference the task record rather than creating a second independent task.

Conceptually:

```text
Kanban Card
      ↓
Task
      ↓
TaskNotes
```

This allows the board to provide visual workflow while the task remains an actual task record.

---

# 12. Card Duplication Rule

A Kanban card should not contain an independent copy of task metadata unless the Kanban plugin requires such information for its own operation.

Avoid maintaining:

```text
Task status A
```

in TaskNotes and:

```text
Task status B
```

on the Kanban card.

If both systems represent the same concept, synchronization must be explicitly defined.

---

# 13. Board State vs Task State

The board's column position is a visual workflow state.

Task metadata is an operational task state.

These should initially be treated as distinct:

```text
Kanban
    ↓
visual board state
```

versus:

```text
TaskNotes
    ↓
task state
```

They may correspond conceptually, but they are not automatically interchangeable.

---

# 14. Synchronization Contract

If board position and task status are eventually synchronized, the synchronization must explicitly define:

```text
Direction
Trigger
Source
Destination
Allowed mappings
Conflict behavior
Failure behavior
```

Example:

```text
Kanban column
    ↓
Task status
```

would require an explicit mapping such as:

```text
In Progress → In Progress
Done        → Complete
```

The mapping should not be inferred from similar names.

---

# 15. Recommended Initial Boundary

Until synchronization has been explicitly specified and tested:

```text
Kanban
    owns board position

TaskNotes
    owns task state
```

This is the safer implementation boundary because it prevents hidden bidirectional state mutations.

---

# 16. Project Scope

A project's board should only contain work belonging to that project.

The board should not become a global task view.

Project filtering is therefore inherent in the board's location:

```text
Project A
└── Board.md
    └── Project A work

Project B
└── Board.md
    └── Project B work
```

---

# 17. Project Command Center Integration

The Project Command Center should expose the project's board.

The architecture is:

```text
Selected Project
      ↓
Project folder
      ↓
Board.md
      ↓
Kanban
```

The Project Command Center should not construct a replacement board.

It should present or link to the project-local Kanban board.

---

# 18. Hearth Integration

Hearth may provide navigation to the project board.

For example:

```text
Project Command Center
    ↓
Open Board
    ↓
Project-local Kanban
```

Hearth provides navigation and presentation.

Kanban provides the board.

---

# 19. QuickAdd Integration

QuickAdd is responsible for creating a board as part of project initialization.

It may also provide:

```text
Open Project Board
Create Project
Create Project Task
```

However, QuickAdd should not manipulate Kanban board state unless a deliberate workflow requires it.

The normal relationship is:

```text
QuickAdd
    ↓
create / locate board

Kanban
    ↓
manage board
```

---

# 20. Templater Integration

Templater generates the initial Board.md structure.

The relationship is:

```text
QuickAdd
    ↓
Templater
    ↓
Board.md
    ↓
Kanban
```

Templater should not become a runtime board-management mechanism.

---

# 21. Project Hierarchy Integration

The board represents project execution.

The project hierarchy remains:

```text
Project
   ↓
Milestone
   ↓
Phase
   ↓
Task
```

Kanban does not replace milestone or phase records.

A board may visually group or label work by milestone or phase where useful, but the underlying hierarchy remains in the project model.

---

# 22. Milestone Representation

If milestone information appears on the board, the representation must come from the project/task model.

It should not create a second milestone system.

Possible implementation:

```text
Card
  ↓
Task
  ↓
Milestone metadata
```

rather than:

```text
Kanban
  ↓
independent milestone record
```

---

# 23. Phase Representation

The same principle applies to phases.

```text
Task
  ↓
Phase
```

The board may visually organize tasks by phase.

It should not create separate phase records that compete with the project model.

---

# 24. Card Creation

The preferred task-card workflow is:

```text
QuickAdd
   ↓
Create Task
   ↓
TaskNotes task
   ↓
Add / associate with project board
```

The exact mechanics depend on the configured Kanban plugin behavior.

The important architectural rule is that the task should exist as a task record rather than only as a card.

---

# 25. Card Movement

Moving a card between columns is a Kanban operation.

The normal contract is:

```text
User
  ↓
Move card
  ↓
Kanban updates board state
```

Unless synchronization has been explicitly configured, moving the card should not silently modify unrelated task properties.

---

# 26. Done Column

The Done column represents board completion.

It does not automatically imply that the underlying TaskNotes task is complete unless that synchronization rule has been explicitly implemented.

This distinction must remain documented.

---

# 27. Review Column

A Review column, if included in the final board model, represents project workflow position.

It should not automatically imply a TaskNotes status such as:

```text
Blocked
```

or:

```text
Complete
```

without an explicit mapping.

---

# 28. Backlog

A Backlog column represents work that has not yet entered active execution.

It should not be interpreted as a separate task status unless the task model explicitly defines such a state.

The board remains the visual representation.

---

# 29. Board Ordering

Column order should reflect the defined project workflow.

Card ordering within columns may represent:

```text
priority
sequence
manual ordering
```

depending on the configured Kanban behavior.

The board should not automatically reinterpret card order as task priority unless that relationship is explicitly defined.

---

# 30. Board and Task Priority

If task priority exists, the board should not assume that:

```text
top card
```

means:

```text
highest priority
```

unless the project model deliberately defines that convention.

Visual order and metadata priority are distinct until synchronized.

---

# 31. Board Navigation

Each Project Command Center should provide a direct route to its project board.

The intended interaction is:

```text
Project Command Center
   ↓
Board
   ↓
Board.md
```

No global board is required for project execution.

---

# 32. Board and Daily Workflow

The Daily Note may reference project boards or project tasks.

However:

```text
Daily Note
```

does not become a second Kanban board.

The daily workflow consumes project/task state.

---

# 33. Board and Archive

A completed project may eventually move into:

```text
4.ARCHIVE
```

according to the archive model.

The board should remain part of the project record unless the archive workflow explicitly specifies otherwise.

Archiving the project and deleting the board are separate operations.

---

# 34. Board Preservation

Completed boards should remain historically inspectable when the project is archived.

This preserves:

```text
project execution history
card organization
workflow progression
```

The board should not be destroyed merely because active work has ended.

---

# 35. Board Duplication

A project should have one canonical board.

The system should prevent accidental creation of multiple competing:

```text
Board.md
Board 2.md
Project Board.md
```

files within the same project.

Project initialization should check whether the board already exists.

---

# 36. Board Recovery

If a board is accidentally deleted or damaged, the project should remain intact.

Tasks and project documentation must not depend exclusively on the board.

This is another reason Kanban should remain a visual execution layer rather than the entire project-management system.

---

# 37. Board Template Contract

The Board template should define only the information necessary to initialize the board.

It should not duplicate:

```text
Project.md
Task.template.md
Project artifact templates
```

The board should remain lightweight.

---

# 38. Board Metadata

If Board.md requires metadata, the final board model must define:

```text
board properties
project relationship
board type
configuration
```

Meta Bind should only be used for board metadata that actually requires interactive editing.

The Kanban plugin remains responsible for board state.

---

# 39. Board Actions

The Project Command Center may expose actions such as:

```text
Open Board
Create Task
Open Project
```

Creation actions should delegate to QuickAdd.

Board actions should delegate to Kanban.

Property editing should delegate to Meta Bind.

This creates a consistent command boundary:

```text
Create → QuickAdd
Edit property → Meta Bind
Move card → Kanban
View → Hearth / Bases
```

---

# 40. Board and Bases

Bases should not replace Kanban.

Bases can provide structured task/project views.

Kanban provides visual board workflow.

The relationship is:

```text
Bases
    ↓
structured query/view

Kanban
    ↓
visual execution board
```

They are complementary.

---

# 41. Board and TaskNotes

The relationship is:

```text
TaskNotes
    ↓
task record

Kanban
    ↓
visual board representation
```

A task should remain useful even when it is not currently displayed on a board.

---

# 42. Board and Project Artifacts

Project artifacts may appear on the board when the project workflow requires artifact-level tracking.

The artifact itself remains a project document.

The card is a visual representation.

Therefore:

```text
Artifact
   ↓
Project record

Card
   ↓
Visual workflow representation
```

Do not turn every project document into a Kanban card automatically.

---

# 43. Board Card Types

Before implementation, the board model must explicitly define permitted card types.

At minimum, the implementation should answer:

```text
Can a card represent only tasks?
Can a card represent project artifacts?
Can a card represent milestones?
Can a card represent arbitrary notes?
```

The default implementation should favor tasks as the primary executable card type.

---

# 44. Board State Contract

The board state consists of:

```text
columns
cards
card positions
column positions
board configuration
```

This state belongs to Kanban.

Task metadata does not automatically become board state.

---

# 45. Project Board Contract

Every project board must have:

```text
Project association
Canonical location
Canonical Board.md
Defined columns
Defined card representation
Defined workflow
Defined creation mechanism
Defined archive behavior
```

---

# 46. Board Creation Contract

The canonical board creation workflow is:

```text
INPUT
    Project context

PROCESS
    QuickAdd creates project folder
    Templater creates Board.md
    Kanban initializes board

OUTPUT
    Project-local Board.md
    Configured Kanban board
```

---

# 47. Board Update Contract

The canonical board update workflow is:

```text
INPUT
    Existing project board
    User card movement / organization

PROCESS
    Kanban modifies board state

OUTPUT
    Updated board state
```

The operation should not modify task metadata unless synchronization is explicitly defined.

---

# 48. Board/Task Synchronization Contract

If synchronization is eventually implemented, the contract must be explicit:

```text
Source:
Kanban column

Trigger:
Card moved

Mapping:
Column → task status

Mutation:
Update task status

Conflict behavior:
Defined

Reverse synchronization:
Defined or disabled
```

Bidirectional synchronization should not be implemented until the one-way behavior is proven.

---

# 49. Failure Behavior

The board workflow should stop or preserve existing state when:

```text
Project folder is missing
Board file is missing
Invalid card reference
Invalid column
Invalid synchronization target
Duplicate board
```

The system should not silently create a second project board.

---

# 50. Testing Requirements

### Test 1 — Project creation

```text
Create project
↓
Board.md exists
```

### Test 2 — Board initialization

```text
Open Board.md
↓
Kanban recognizes board
```

### Test 3 — Columns

```text
Verify canonical columns
Verify order
```

### Test 4 — Card creation

```text
Create project task
↓
Associate with board
```

### Test 5 — Card movement

```text
Move card
↓
Board state persists
```

### Test 6 — Task preservation

```text
Move card
↓
Task remains intact
```

### Test 7 — Project isolation

```text
Project A board
↓
Contains Project A work

Project B board
↓
Contains Project B work
```

### Test 8 — Command Center

```text
Open Project Command Center
↓
Open correct project board
```

### Test 9 — Archive

```text
Archive project
↓
Board remains with project history
```

### Test 10 — Duplicate prevention

```text
Attempt second board
↓
Existing board detected
```

---

# 51. Automation Readiness

Kanban configuration should not be automated until:

```text
[ ] Project folder model finalized
[ ] Board location finalized
[ ] Board template finalized
[ ] Column vocabulary finalized
[ ] Column order finalized
[ ] Card type finalized
[ ] Task/card relationship finalized
[ ] Board/task synchronization decision finalized
[ ] Project Command Center integration finalized
[ ] Archive behavior finalized
[ ] Duplicate behavior finalized
[ ] Failure behavior finalized
[ ] Board creation tested
[ ] Card movement tested
[ ] Task relationship tested
```

Only after these are frozen should PowerShell or Obsidian CLI be considered for programmatic board generation.

---

# 52. Final Technical Contract

Kanban's contract is:

```text
INPUT
    Project-local board
    Project work
    User board actions

PROCESS
    Maintain columns
    Maintain cards
    Maintain card positions
    Maintain visual workflow state

OUTPUT
    Project-local visual execution board
    Persistent board state
    Project workflow visibility

DOES NOT OWN
    Project hierarchy
    Task lifecycle
    Task identity
    Template generation
    Metadata architecture
    Dashboard architecture
    Knowledge management
    Code editing
```

The resulting architecture is:

```text
                         PROJECT
                            │
                 ┌──────────┴──────────┐
                 │                     │
                 ▼                     ▼
             Project.md             Board.md
                 │                     │
                 │                  KANBAN
                 │                     │
                 ▼                     ▼
          Project hierarchy       Board state
                 │                     │
                 ▼                     │
               TASKS ◄────────────────┘
                 │
              TASKNOTES
                 │
        ┌────────┼────────┐
        ▼        ▼        ▼
    META BIND  BASES    HEARTH
        │        │        │
        └────────┴────────┘
                 │
                 ▼
               USER
```

Kanban is therefore the project-local visual execution layer. It gives each project its own board, represents work through cards and columns, and preserves board state independently from the underlying task-management system until an explicit synchronization contract is defined.