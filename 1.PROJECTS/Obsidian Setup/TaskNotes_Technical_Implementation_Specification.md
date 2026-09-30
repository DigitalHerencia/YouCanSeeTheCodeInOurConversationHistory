# TaskNotes Technical Implementation Specification

## 1. Purpose

TaskNotes is the vault's task-management layer.

It provides the operational task system used by Projects, Project Command Center, Daily Notes, and other workflows that need actionable work items.

The architecture is:

```text
Project / Project Artifact / User
            ↓
         QuickAdd
            ↓
       Create Task
            ↓
        TaskNotes
            ↓
   Task lifecycle + task views
            ↓
     Bases / Hearth / Kanban
```

TaskNotes manages tasks after they have been created.

It does not replace the Project hierarchy, QuickAdd, Templater, Meta Bind, Kanban, Bases, or Hearth.

---

# 2. Responsibilities

TaskNotes is responsible for:

- task records
    
- task metadata required by the task system
    
- task lifecycle management
    
- task-oriented task views
    
- task completion state
    
- task scheduling where configured
    
- task prioritization where configured
    
- task filtering and organization
    
- task interaction from supported task interfaces
    
- exposing task information to the rest of the vault through Markdown metadata

TaskNotes should make tasks operational without turning the rest of the vault into a task-management plugin.

---

# 3. Non-Responsibilities

TaskNotes does not own:

```text
Project hierarchy
Project creation
Project documentation
Project Kanban boards
Markdown template definitions
Interactive property architecture
Dashboard presentation
Knowledge processing
Code editing
Resource management
Blog/Social content models
```

Those responsibilities remain with:

```text
QuickAdd   → creation/orchestration
Templater  → note generation
Meta Bind  → interactive metadata
Kanban     → project board
Bases      → structured views
Hearth     → dashboard/interface
CodeSpace  → code editing
```

---

# 4. Task Storage Contract

Tasks must have one canonical storage location defined by the vault architecture.

The existing vault model requires TaskNotes tasks to live in the designated TaskNotes task folder rather than being scattered arbitrarily throughout project folders.

The architecture is therefore:

```text
1.PROJECTS/
    project documentation
    project artifacts
    Board.md

TaskNotes task folder/
    task notes
```

Project notes reference tasks.

Tasks reference their project context.

This preserves the distinction between:

```text
Project document
```

and:

```text
Actionable task
```

---

# 5. Task Object Model

The canonical task model currently includes:

```text
task_id
project_id
project
status
dependency
deliverable
```

Additional TaskNotes-specific properties may exist if required by the configured task workflow.

Any additional properties must be explicitly documented before automation.

The task model should not accumulate arbitrary metadata simply because TaskNotes can store it.

---

# 6. Task Identity

Every task requires a stable identifier.

```text
task_id
```

The identifier should be generated when the task is created.

It should not normally be manually edited afterward.

The task identifier provides a stable reference for:

```text
Project
Project artifacts
Dependencies
Deliverables
Task relationships
Bases
Hearth
```

---

# 7. Project Identity

Where a task belongs to a project, it should preserve:

```text
project_id
project
```

These values establish the task's project context.

The distinction is intentional:

```text
project_id
    → stable project identity

project
    → human-readable project reference
```

The final implementation should define whether both values are required on every task and how they are initialized.

---

# 8. Task Creation Contract

Task creation belongs to QuickAdd.

The workflow is:

```text
User
  ↓
QuickAdd → New Task
  ↓
Collect task-specific information
  ↓
Resolve project context
  ↓
Templater
  ↓
Create task note
  ↓
TaskNotes
```

TaskNotes begins operating on the resulting task.

TaskNotes should not require users to manually construct task notes when the vault already provides a QuickAdd creation workflow.

---

# 9. Task Creation From Project Context

When a task is created from a Project or Project Command Center, project context should be inherited.

Preferred workflow:

```text
Project
  ↓
New Task
  ↓
Project already known
  ↓
Prompt for task information
  ↓
Create Task
```

The user should not have to manually re-enter:

```text
project
project_id
```

when the originating context already provides them.

---

# 10. Task Creation From Project Artifact

A project artifact may generate one or more tasks.

The workflow is:

```text
Project Artifact
      ↓
Create Task
      ↓
QuickAdd
      ↓
TaskNotes task
```

The resulting task should retain the appropriate project context.

If the task is directly associated with a deliverable, the relationship should be represented explicitly.

---

# 11. Task Status Contract

Task status represents the task's lifecycle state.

The exact status vocabulary must be frozen before implementation.

TaskNotes and Meta Bind must not independently invent competing status vocabularies.

The architecture should have one defined set of task states.

Conceptually:

```text
Not Started
In Progress
Blocked
Complete
```

The exact final values should come from the finalized task model/configuration rather than being hard-coded here.

---

# 12. Status Ownership

TaskNotes owns the operational task lifecycle.

Meta Bind may provide interactive controls for the status property.

The distinction is:

```text
Meta Bind
    ↓
User changes property

TaskNotes
    ↓
Task system reflects/manages that state
```

If TaskNotes provides a native task-state interaction, it should be evaluated against the Meta Bind control before both are implemented for the same field.

There should not be two competing task-status controls with different behavior.

---

# 13. Task Completion

Completion is a task lifecycle operation.

The implementation must define how completion is represented.

Possible representations include:

```text
status
completed date
task checkbox
```

The final configuration must choose one canonical mechanism or explicitly define how multiple representations remain synchronized.

The system should not create separate contradictory notions of completion.

---

# 14. Task Dependency

The canonical task model contains:

```text
dependency
```

A dependency identifies work that must be completed or resolved before the task can proceed.

The dependency should reference an actual task where possible.

The relationship is:

```text
Task A
   ↓
depends on
   ↓
Task B
```

The task system should make that relationship inspectable.

---

# 15. Dependency Creation

Dependency creation may be initiated through:

```text
QuickAdd
```

or:

```text
Meta Bind
```

depending on the user interaction.

The underlying relationship remains task metadata.

A dependency should not be represented only visually on a dashboard.

It must exist in the task record so other systems can consume it.

---

# 16. Dependency Validation

The implementation should prevent:

```text
Task A
   ↓
depends on
   ↓
Task A
```

Self-dependencies should be rejected.

Where practical, invalid or missing dependency references should also be detected.

The system should not silently create references to nonexistent tasks.

---

# 17. Deliverable Contract

The canonical task model contains:

```text
deliverable
```

The deliverable identifies what the task is expected to produce or complete.

A deliverable may be:

```text
Project artifact
Document
Code artifact
Other defined project output
```

The final relationship representation must be standardized.

---

# 18. Task and Project Hierarchy

Tasks exist within the project hierarchy.

The conceptual relationship is:

```text
Project
   ↓
Milestone
   ↓
Phase
   ↓
Task
```

A task should retain enough project context to be located within that hierarchy.

The project hierarchy should not be reconstructed solely from task filenames.

---

# 19. Milestone and Phase Context

If the finalized task model stores milestone and phase properties directly, those properties should be inherited during task creation.

If they are instead derived through the project relationship, they should not be duplicated unnecessarily.

This decision must be made before automation.

The important requirement is that the task can be reliably associated with:

```text
Project
Milestone
Phase
```

without conflicting representations.

---

# 20. TaskNotes and QuickAdd

The division of responsibility is:

```text
QuickAdd
    ↓
"What task do you want to create?"
```

and:

```text
TaskNotes
    ↓
"How do we manage this task?"
```

QuickAdd handles:

- creation;
    
- prompts;
    
- routing;
    
- project selection;
    
- template selection.

TaskNotes handles:

- task operation;
    
- task views;
    
- task lifecycle;
    
- task interaction.

---

# 21. TaskNotes and Templater

Templater establishes the initial task structure.

The relationship is:

```text
QuickAdd
    ↓
Templater
    ↓
Task note
    ↓
TaskNotes
```

The task template should establish required properties before TaskNotes operates on the note.

TaskNotes should not become a replacement for the task template.

---

# 22. TaskNotes and Meta Bind

Meta Bind provides interactive controls for task metadata where appropriate.

Example:

```text
Task
 │
 ├── status      ← Meta Bind control
 ├── dependency  ← Meta Bind control
 └── deliverable ← Meta Bind control
```

TaskNotes remains the task-management layer.

The two systems must share the same property vocabulary.

---

# 23. TaskNotes and Kanban

Kanban represents project work visually.

TaskNotes represents tasks operationally.

The relationship may be:

```text
TaskNotes task
      ↓
Project Kanban card
```

but this relationship must be explicitly configured.

The system must not assume that every task automatically becomes a Kanban card.

The project model determines which tasks belong on the project board.

---

# 24. Kanban State vs Task State

These are related but not automatically identical.

For example:

```text
Kanban:
In Review
```

does not necessarily mean:

```text
Task status:
Complete
```

unless the project architecture explicitly defines that mapping.

Therefore:

```text
Kanban state
```

and:

```text
Task status
```

must be treated as separate concepts until synchronization rules are deliberately defined.

---

# 25. TaskNotes and Bases

Bases provides structured views of task records.

The relationship is:

```text
TaskNotes
    ↓
Task metadata
    ↓
Bases
    ↓
Task views
```

Bases should query the task metadata rather than maintaining a separate task database.

Possible views include:

```text
My Tasks
Project Tasks
Active Tasks
Blocked Tasks
Upcoming Tasks
Completed Tasks
```

The exact Base definitions belong to the Bases implementation specification.

---

# 26. TaskNotes and Hearth

Hearth provides the task interface.

The architecture is:

```text
Hearth
   ↓
Task view
   ↓
TaskNotes-managed records
```

Hearth should not copy task records into another system.

A task displayed on Hearth should remain the same task record managed by TaskNotes.

---

# 27. Command Center Task View

The Command Center should be able to expose task information such as:

```text
Task
Status
Project
Deadline
Dependency
Deliverable
```

where those fields are part of the finalized task model.

The Command Center should provide navigation and interaction rather than maintaining its own task state.

---

# 28. Project Command Center Task View

The Project Command Center should filter tasks by selected project.

Conceptually:

```text
Selected Project
       ↓
Project Tasks
       ↓
TaskNotes
       ↓
Task records
```

The view should not require a separate copy of each task.

---

# 29. Daily Note Integration

Daily Notes may surface tasks relevant to the current day.

The relationship is:

```text
Daily Note
    ↓
Task view
    ↓
TaskNotes
```

The Daily Note is not the task record.

It is a working context that references or displays tasks.

This distinction prevents task duplication.

---

# 30. Task Scheduling

If scheduling is part of the TaskNotes configuration, scheduled task information should be stored according to the finalized TaskNotes configuration.

The vault should establish a consistent representation for:

```text
scheduled date
deadline
due date
completed date
```

where these are required.

Do not introduce multiple synonyms for the same temporal concept without a defined reason.

---

# 31. Task Priority

If priority is used, it must be explicitly added to the finalized task model.

A plugin capability alone does not make a property part of the vault architecture.

If priority is adopted, its:

```text
property name
allowed values
default
display
sorting behavior
```

must be specified before implementation.

---

# 32. Task Filtering

Task views should be based on meaningful task properties.

Examples:

```text
Project
Status
Schedule
Dependency
Deliverable
```

Filtering logic should be documented with the view itself.

A task view should not depend on filename conventions when structured metadata already exists.

---

# 33. Task Sorting

Sorting should use defined task properties.

Typical dimensions may include:

```text
status
scheduled date
deadline
priority
project
```

The final ordering is a view-level decision.

It should not modify the underlying task record.

---

# 34. Task Archival

Completed or inactive tasks should remain available according to the vault's archival policy.

Task completion should not automatically mean:

```text
delete
```

or:

```text
move to 4.ARCHIVE
```

unless that behavior is explicitly defined.

Task lifecycle and vault archival are separate concerns.

---

# 35. Task Deletion

Deleting a task should be treated as a destructive operation.

Before implementing automated deletion, the system must define:

```text
What happens to dependencies?
What happens to project references?
What happens to Kanban references?
What happens to historical records?
```

Until those behaviors are defined, task deletion should remain a deliberate manual operation.

---

# 36. Task ID Generation

Task IDs must be unique.

The generation mechanism should be deterministic enough to prevent collisions.

The final implementation must define:

```text
prefix
format
sequence behavior
collision behavior
```

The task ID should be created once and retained.

---

# 37. Task Filename

The task filename should be determined by the task template / creation workflow.

TaskNotes should not become the authority for arbitrary filename conventions unless its configuration requires it.

The filename should remain understandable to the user.

---

# 38. Task Relationships

Tasks may relate to:

```text
Project
Milestone
Phase
Dependency
Deliverable
Project Artifact
```

The final implementation should use consistent link/reference semantics.

A relationship should not be represented one way in one task and another way elsewhere without an explicit reason.

---

# 39. Task Creation Contract

The canonical task creation contract is:

```text
INPUT
    User task intent
    Project context
    Optional milestone / phase
    Task title
    Deliverable
    Dependency

PROCESS
    QuickAdd prompts
    Resolve project context
    Invoke Templater
    Create task
    Initialize metadata

OUTPUT
    Task note in TaskNotes task folder
    Stable task_id
    Project relationship
    Initial task state
    Optional dependency / deliverable references
```

---

# 40. Task Update Contract

The canonical update contract is:

```text
INPUT
    Existing task
    User interaction

PROCESS
    TaskNotes / Meta Bind interaction
    Validate permitted values
    Update task metadata

OUTPUT
    Updated task record
    Updated task views
    Updated Hearth / Bases representations
```

The operation should not recreate the task.

---

# 41. Task Completion Contract

The canonical completion operation is:

```text
INPUT
    Existing active task

PROCESS
    User marks task complete
    TaskNotes updates task state
    Required completion metadata is recorded

OUTPUT
    Task is represented as complete
    Dependent views update
    Historical task remains available
```

Any additional automation must be explicitly defined.

---

# 42. Task Dependency Contract

The canonical dependency operation is:

```text
INPUT
    Existing task
    Existing dependency task

PROCESS
    Validate dependency
    Write relationship

OUTPUT
    Task references dependency
    Dependency is visible to relevant views
```

The operation must reject self-dependencies.

---

# 43. Task Deliverable Contract

The canonical deliverable operation is:

```text
INPUT
    Existing task
    Existing or defined deliverable

PROCESS
    Associate task with deliverable

OUTPUT
    Task contains deliverable relationship
```

The relationship should remain available to Project Command Center and project documentation.

---

# 44. Task View Contract

Every TaskNotes view should define:

```text
Purpose
Source
Filters
Grouping
Sorting
Displayed fields
Available actions
```

For example:

```text
View:
Project Tasks

Source:
TaskNotes task folder

Filter:
project_id = selected project

Group:
status

Sort:
scheduled date

Displayed:
task
status
dependency
deliverable
```

This makes each view inspectable and reproducible.

---

# 45. Project Task View

The Project Command Center requires a project-specific task view.

Contract:

```text
Purpose:
Show actionable work for selected project.

Source:
TaskNotes task records.

Filter:
Selected project.

Display:
Task
Status
Schedule
Dependency
Deliverable

Actions:
Open task
Change task state
Create task
```

Creation delegates to QuickAdd.

Property editing delegates to Meta Bind or the configured TaskNotes interaction.

---

# 46. Daily Task View

Contract:

```text
Purpose:
Show tasks relevant to today's work.

Source:
TaskNotes records.

Filter:
Current-day / active criteria defined by task configuration.

Display:
Task
Project
Status
Schedule
```

The Daily Note should not copy the task contents into itself.

---

# 47. Global Task View

The vault may provide a global task view.

Contract:

```text
Purpose:
Find and manage tasks across projects.

Source:
TaskNotes task folder.

Display:
Task
Project
Status
Schedule
Dependency
```

This is a task-management view, not an All Projects project dashboard.

---

# 48. TaskNotes Configuration Contract

The TaskNotes configuration must document:

```text
Task folder
Task filename behavior
Required task properties
Status vocabulary
Completion behavior
Scheduling fields
Priority behavior if used
Task view definitions
Creation integration
Property integration
```

These values must be frozen before programmatic configuration.

---

# 49. Required Plugin Boundaries

The task architecture must maintain these boundaries:

```text
QuickAdd
    creates task

Templater
    generates task structure

TaskNotes
    manages task

Meta Bind
    provides interactive metadata controls

Bases
    queries task metadata

Kanban
    manages project board state

Hearth
    presents task information and actions
```

If two plugins appear capable of performing the same operation, the implementation must explicitly assign ownership rather than allowing both to operate independently.

---

# 50. Error Handling

Task creation should stop when required information is unavailable.

Examples:

```text
Missing task title
Missing project context when required
Invalid project
Duplicate task ID
Invalid dependency
Invalid deliverable
Invalid status
Invalid destination
```

The system should not silently create incomplete tasks.

---

# 51. Duplicate Prevention

Task creation must protect against duplicate identifiers.

If a generated task ID already exists:

```text
STOP
    ↓
Regenerate / request resolution
```

Do not create two tasks with the same stable identifier.

Where task creation is accidentally executed twice, the system should not silently create a second representation of the same intended task if duplicate detection can reasonably identify it.

---

# 52. TaskNotes Testing Requirements

### Test 1 — Creation

```text
QuickAdd → New Task
↓
Task note created
```

### Test 2 — Location

```text
Verify task is in the configured TaskNotes folder.
```

### Test 3 — Identity

```text
Verify task_id exists and is unique.
```

### Test 4 — Project

```text
Verify project_id / project relationship.
```

### Test 5 — Status

```text
Verify initial status.
Change status.
Verify persistence.
```

### Test 6 — Dependency

```text
Assign dependency.
Verify relationship.
Reject self-dependency.
```

### Test 7 — Deliverable

```text
Assign deliverable.
Verify relationship.
```

### Test 8 — Views

```text
Verify task appears in expected TaskNotes views.
```

### Test 9 — Bases

```text
Verify Bases sees the task correctly.
```

### Test 10 — Hearth

```text
Verify Command Center displays the task.
```

### Test 11 — Project filtering

```text
Select project.
Verify only appropriate project tasks appear.
```

### Test 12 — Completion

```text
Complete task.
Verify lifecycle state and dependent views.
```

---

# 53. Automation Readiness

TaskNotes should not be programmatically configured until:

```text
[ ] Task folder finalized
[ ] Task template finalized
[ ] Task ID format finalized
[ ] Task property vocabulary finalized
[ ] Status vocabulary finalized
[ ] Completion behavior finalized
[ ] Dependency model finalized
[ ] Deliverable model finalized
[ ] Scheduling model finalized
[ ] Priority model finalized, if used
[ ] Task views defined
[ ] Project relationship defined
[ ] Kanban relationship defined
[ ] Meta Bind relationship defined
[ ] Bases views defined
[ ] Hearth views defined
[ ] Creation workflow tested
[ ] Update workflow tested
[ ] Completion workflow tested
```

Only after these conditions are satisfied should PowerShell or Obsidian CLI be considered for configuration generation.

---

# 54. Final Technical Contract

TaskNotes' contract is:

```text
INPUT
    Task created by approved workflow
    Task metadata
    User task actions

PROCESS
    Manage task lifecycle
    Manage task-oriented views
    Persist task state
    Expose task information

OUTPUT
    Operational task records
    Task views
    Updated task state
    Task information consumable by other vault systems

DOES NOT OWN
    Project creation
    Project hierarchy
    Template generation
    General metadata controls
    Project Kanban state
    Dashboard architecture
    Knowledge processing
    Code editing
```

The resulting architecture is:

```text
                         USER
                           │
                           ▼
                        HEARTH
                           │
                ┌──────────┴──────────┐
                │                     │
           create task            manage task
                │                     │
                ▼                     ▼
             QUICKADD             TASKNOTES
                │                     │
                ▼                     │
            TEMPLATER                  │
                │                     │
                └──────────┬──────────┘
                           ▼
                       TASK NOTE
                           │
             ┌─────────────┼─────────────┐
             │             │             │
             ▼             ▼             ▼
         META BIND       BASES        KANBAN
             │             │             │
             │             │             │
             └─────────────┼─────────────┘
                           ▼
                         HEARTH
```

TaskNotes is therefore the operational task layer. QuickAdd creates tasks, Templater establishes their structure, Meta Bind provides controlled metadata interaction, Bases provides structured task views, Kanban provides project-board representation, and Hearth presents the resulting task system to the user.