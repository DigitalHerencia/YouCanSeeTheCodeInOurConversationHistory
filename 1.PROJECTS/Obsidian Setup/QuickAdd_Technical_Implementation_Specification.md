# QuickAdd Technical Implementation Specification

## 1. Purpose

QuickAdd is the vault's workflow orchestration and guided-creation layer.

Where Templater defines what a note looks like, QuickAdd defines how the user creates, locates, connects, and inserts that note.

QuickAdd is responsible for turning the vault's individual templates and operations into usable workflows.

The architectural boundary is:

```text
QuickAdd
    ↓
Select / prompt / route
    ↓
Templater
    ↓
Create structured Markdown
```

QuickAdd does not replace Templater.

QuickAdd does not become the task manager, dashboard, database, Kanban system, or knowledge graph.

---

# 2. Responsibilities

QuickAdd is responsible for:

- guided note creation
    
- choosing the appropriate template
    
- choosing or deriving a destination
    
- prompting for information that cannot be derived automatically
    
- creating project structures
    
- creating project artifacts
    
- creating tasks through the appropriate task workflow
    
- adding information to existing notes
    
- invoking Templater templates
    
- executing controlled capture workflows
    
- providing command menus for repeatable vault operations
    
- connecting otherwise separate plugin capabilities into coherent workflows

QuickAdd should make complex multi-step operations feel like one deliberate command.

---

# 3. Non-Responsibilities

QuickAdd does not own:

- Markdown template definitions
    
- task state
    
- task queries
    
- project Kanban state
    
- interactive property controls
    
- dashboard presentation
    
- structured database views
    
- source-code editing
    
- knowledge graph visualization

Those responsibilities remain with:

```text
Templater → note generation
TaskNotes → tasks
Kanban → project boards
Meta Bind → interactive properties
Bases → structured views
Hearth → dashboards
CodeSpace → code editing
Library → knowledge navigation
```

---

# 4. Relationship to Templater

The primary QuickAdd/Templater relationship is:

```text
USER
  ↓
QuickAdd
  ↓
Choose workflow
  ↓
Collect required decisions
  ↓
Resolve destination
  ↓
Invoke Templater
  ↓
Generate note
```

QuickAdd should not contain large duplicated Markdown templates.

If a note has a reusable structure, that structure belongs in:

```text
2.AREAS/SYSTEM/Templates/
```

QuickAdd invokes it.

---

# 5. QuickAdd Choice Architecture

QuickAdd should use a hierarchy of choices rather than one enormous command list.

Recommended conceptual structure:

```text
QuickAdd
│
├── Create
│   ├── Project
│   ├── Project Artifact
│   ├── Task
│   ├── Resource
│   ├── Zettelkasten Note
│   ├── Code Lab Note
│   ├── Blog Content
│   └── Social Content
│
├── Capture
│   ├── Inbox
│   ├── AI Thread
│   ├── Clipping
│   └── Add to Existing Note
│
├── Project
│   ├── Open Project
│   ├── Create Milestone
│   ├── Create Phase
│   ├── Create Goal
│   ├── Create Task
│   └── Create Artifact
│
├── Knowledge
│   ├── Create Note
│   ├── Add Connection
│   └── Add to Existing Note
│
└── Publishing
    ├── Blog
    ├── Social
    └── Publishing Calendar
```

The exact command names are implementation details.

The functional separation is the important part.

---

# 6. Create Workflow

A standard creation workflow is:

```text
Choose object
    ↓
Collect required information
    ↓
Determine destination
    ↓
Select template
    ↓
Create file
    ↓
Invoke Templater
    ↓
Initialize context
    ↓
Open resulting note
```

QuickAdd should not ask for information that can already be derived from:

- the current folder;
    
- the selected project;
    
- the selected parent note;
    
- the current date;
    
- the selected template.

---

# 7. New Project Workflow

The Project creation workflow is one of the highest-priority QuickAdd workflows.

The expected operation is:

```text
QuickAdd
   ↓
New Project
   ↓
Project type
   ↓
Project name
   ↓
Project folder
   ↓
Project template
   ↓
Create project structure
   ↓
Open Project.md
```

The project system requires the project hierarchy to remain intact.

```text
Project
   ↓
Milestone
   ↓
Phase
   ↓
Goal
   ↓
Task
```

The project creation workflow must not flatten this hierarchy.

---

# 8. Project Structure Creation

A new Project workflow may need to create multiple files rather than one note.

The expected conceptual result is:

```text
1.PROJECTS/
└── <Project>/
    ├── Project.md
    ├── Board.md
    └── <project documentation>
```

The exact project artifact structure must follow the finalized Project Model.

QuickAdd is the appropriate orchestration layer because it can coordinate:

```text
folder creation
    +
template creation
    +
project context
    +
board creation
```

Templater alone should not be responsible for orchestrating the entire project.

---

# 9. Project Type

The Project Model defines project types including:

```text
Operations
Product
Design
Engineering
Marketing
```

The creation workflow should allow the user to select a project type when it cannot be derived from context.

The selected type should be passed into the generated Project note.

The workflow should not attempt to infer a type from the project name.

---

# 10. Project Artifact Workflow

Project artifacts should be created through a guided workflow.

Conceptually:

```text
QuickAdd
   ↓
Project Artifact
   ↓
Select Project
   ↓
Select Artifact Type
   ↓
Select / derive Milestone
   ↓
Select / derive Phase
   ↓
Create Artifact
   ↓
Apply Templater template
```

Possible artifact templates already represented in the repository include:

```text
PRD
Technical Requirements
Architecture Specification
Implementation Plan
ADR
RFC
Requirement
Design Contract
UX Design
Test Plan
Security Review
Validation Report
Verification Report
```

The final menu should include only canonical templates.

---

# 11. Parent Context

QuickAdd should prefer selection over manual typing.

For example:

```text
Select Project
    ↓
Select Milestone
    ↓
Select Phase
    ↓
Create Task
```

The resulting task should inherit the selected context.

The workflow should therefore reduce duplicated metadata entry.

---

# 12. Task Creation

Task creation must respect TaskNotes as the task-management layer.

The workflow is:

```text
QuickAdd
   ↓
New Task
   ↓
Select Project
   ↓
Select Milestone / Phase where applicable
   ↓
Enter task title
   ↓
Create task note
   ↓
TaskNotes manages task
```

QuickAdd creates the task.

TaskNotes manages the task.

QuickAdd should not implement an independent task database.

---

# 13. Task Context

Where the task originates from a project or project artifact, QuickAdd should preserve that relationship.

The task model includes properties such as:

```text
task_id
project_id
project
status
dependency
deliverable
```

QuickAdd should populate values that are known at creation time.

Values that are intended to remain user-controlled should not be repeatedly overwritten by creation scripts.

---

# 14. Task Creation from a Project

The preferred workflow is:

```text
Project
   ↓
Create Task
   ↓
Project context already known
   ↓
Prompt only for task-specific information
   ↓
TaskNotes task created
```

The user should not have to reselect the project if the workflow was launched from a project context where that information is already available.

---

# 15. Add to Existing Note

QuickAdd is also responsible for rapid insertion into an existing note.

This is particularly important for the Zettelkasten.

Example:

```text
QuickAdd
   ↓
Add to Existing Note
   ↓
Select destination note
   ↓
Enter / select content
   ↓
Insert content
```

This workflow should not create a new note when the intended operation is integration into an existing note.

---

# 16. Zettelkasten Capture

QuickAdd should provide direct capture paths into the Zettelkasten.

The inbound architecture is:

```text
inbox
ai threads
clippings
```

QuickAdd should therefore support workflows that deliberately place material into the correct inbound location.

Example:

```text
QuickAdd
   ↓
Capture
   ├── Inbox
   ├── AI Thread
   └── Clipping
```

The processing of those notes occurs separately.

---

# 17. AI Thread Workflow

AI thread exports should be treated as source material.

The workflow is:

```text
AI conversation export
        ↓
AI Threads
        ↓
Open / process
        ↓
Note Refactor
        ↓
Extract useful material
        ↓
Destination
```

QuickAdd may assist with adding extracted material to existing notes, but it should not attempt to automatically determine what portions of an AI conversation are valuable.

That remains a human processing decision.

---

# 18. Clipping Workflow

The clipping workflow should preserve the distinction between capture and processing.

```text
Web Clipper
    ↓
Clippings
    ↓
QuickAdd / Note Refactor
    ↓
Process
    ↓
Resource / Knowledge / other destination
```

QuickAdd should not silently convert every clipping into a permanent resource.

---

# 19. Resource Creation

The Resource system requires the following conceptual types:

```text
Articles
Books
Documentation
General
Knowledge
Media
Repositories
```

The QuickAdd resource workflow should therefore be:

```text
QuickAdd
   ↓
New Resource
   ↓
Select resource type
   ↓
Select corresponding template
   ↓
Create resource
   ↓
Templater initializes note
```

The final menu should only expose resource types whose templates have been approved and finalized.

---

# 20. Code Lab Creation

QuickAdd should provide guided creation for Code Lab objects.

The Code Lab model is:

```text
Domain
   ↓
Development Cycle
   ↓
Standard
   ↓
Pattern
   ↓
Code Artifact
```

Relevant current templates include:

```text
Domain.template.md
Cycle.template.md
Pattern.template.md
```

QuickAdd can provide:

```text
Code Lab
├── New Domain
├── New Cycle
└── New Pattern
```

Educational Code Lab objects can have their own creation branch.

---

# 21. Blog Creation

Blog content should have a guided creation workflow.

```text
QuickAdd
   ↓
New Blog Content
   ↓
Select content template
   ↓
Create note
   ↓
Add to publishing planning
```

The workflow should integrate with the shared Blog/Social calendar without duplicating calendar systems.

---

# 22. Social Creation

Social content should have a parallel workflow:

```text
QuickAdd
   ↓
New Social Content
   ↓
Select platform/content template
   ↓
Create note
   ↓
Add to shared publishing planner
```

Blog and Social should remain separate content models while sharing the planning layer.

---

# 23. Metadata Operations

QuickAdd can provide commands for metadata-oriented operations where those operations require guided selection.

However, interactive metadata editing belongs to Meta Bind.

The boundary is:

```text
QuickAdd
    ↓
Guided creation / selection
```

versus:

```text
Meta Bind
    ↓
Interactive property editing
```

QuickAdd should not duplicate Meta Bind controls.

---

# 24. Link Operations

QuickAdd may provide workflows for creating relationships between notes.

Examples:

```text
Select source note
    ↓
Select related note
    ↓
Create link
```

or:

```text
Select existing note
    ↓
Add related project
    ↓
Update relationship
```

The resulting relationship should remain ordinary Markdown/link/property data that other vault systems can consume.

---

# 25. QuickAdd and Library

The Library uses QuickAdd for rapid knowledge operations.

The intended relationship is:

```text
Library
   ↓
QuickAdd
   ↓
Create / connect / update
   ↓
Markdown knowledge
   ↓
Bases / Links / Graph / Backlinks
```

QuickAdd provides the action.

Library provides the navigation and discovery surface.

---

# 26. QuickAdd Macros

Macros should be used for workflows involving multiple deterministic operations.

A macro may conceptually perform:

```text
Select project
    ↓
Create folder
    ↓
Create Project.md
    ↓
Create Board.md
    ↓
Create required documentation
    ↓
Open Project.md
```

The macro should remain readable enough that its operations can be understood and maintained manually.

Do not create one giant macro containing the entire vault.

---

# 27. Macro Boundaries

A macro should represent one user-intent-level action.

Good:

```text
New Software Project
New Resource
New Task
New Blog Post
Capture to Inbox
Create Project Artifact
```

Poor:

```text
Initialize Entire Vault
Run Everything
Update All Notes
Rebuild Database
Synchronize Everything
```

Large destructive or opaque workflows are difficult to debug and unsuitable as foundational vault commands.

---

# 28. QuickAdd and Note Refactor

The Zettelkasten processing architecture uses both tools.

Their responsibilities are distinct:

```text
QuickAdd
    ↓
Choose / insert / route

Note Refactor
    ↓
Split / combine / extract
```

Example:

```text
AI Thread
    ↓
Note Refactor
    ↓
Extract code section
    ↓
QuickAdd
    ↓
Add to existing Code Lab note
```

Neither plugin should duplicate the other's function.

---

# 29. QuickAdd and Templater

The canonical relationship is:

```text
QuickAdd
    ↓
Select workflow
    ↓
Templater
    ↓
Render template
```

QuickAdd determines:

- what is being created;
    
- where it goes;
    
- what choices are required.

Templater determines:

- how the resulting note is structured;
    
- which dynamic values are generated;
    
- how metadata is initialized.

---

# 30. QuickAdd and Meta Bind

QuickAdd should create the initial record.

Meta Bind should provide ongoing interactive property controls.

```text
Create
  ↓
QuickAdd
  ↓
Templater
  ↓
Initial state
  ↓
Meta Bind
  ↓
Interactive state
```

QuickAdd should not become a substitute for interactive controls.

---

# 31. QuickAdd and TaskNotes

QuickAdd creates or routes into task workflows.

TaskNotes manages the resulting task.

```text
QuickAdd
   ↓
Create Task
   ↓
TaskNotes
   ↓
Task lifecycle
```

Task views should not be implemented as QuickAdd menus.

---

# 32. QuickAdd and Kanban

QuickAdd can create or initialize a project board.

Kanban manages the board afterward.

```text
QuickAdd
   ↓
New Project
   ↓
Create Board
   ↓
Kanban
   ↓
Project workflow
```

QuickAdd should not maintain a parallel representation of Kanban state.

---

# 33. QuickAdd and Hearth

Hearth is the presentation layer.

QuickAdd is an action layer.

```text
HEARTH
   │
   ├── displays information
   └── exposes actions
             │
             ▼
         QUICKADD
             │
             ▼
          CREATE /
          UPDATE /
          CAPTURE
```

Where Hearth provides a button or command to create something, the action should invoke the existing QuickAdd workflow rather than implementing a second creation mechanism.

---

# 34. QuickAdd and CodeSpace

CodeSpace is the editing environment for code artifacts.

QuickAdd can create or locate the corresponding knowledge note.

It should not attempt to replace CodeSpace as the editing environment.

```text
QuickAdd
   ↓
Code Lab knowledge
   ↓
CodeSpace
   ↓
Code artifact
```

---

# 35. Required QuickAdd Workflows

The initial implementation should support, at minimum:

```text
CREATE
├── New Project
├── New Milestone
├── New Phase
├── New Goal
├── New Task
├── New Project Artifact
├── New Resource
├── New Code Lab Domain
├── New Code Lab Cycle
├── New Code Lab Pattern
├── New Blog Content
└── New Social Content

CAPTURE
├── Inbox
├── AI Thread
├── Clipping
└── Add to Existing Note

PROJECT
├── Select Project
├── Create Project Artifact
├── Create Task
└── Create Project Note

KNOWLEDGE
├── New Knowledge Note
├── Add to Existing Note
└── Connect Notes

PUBLISHING
├── New Blog Content
└── New Social Content
```

This is the required functional inventory, not necessarily the final visible command names.

---

# 36. QuickAdd Configuration Rules

Each QuickAdd choice should have:

```text
Name
Purpose
Input requirements
Destination
Template
Result
Dependencies
```

Example:

```text
Name:
New Project

Purpose:
Create a complete project workspace.

Inputs:
Project name
Project type

Destination:
1.PROJECTS/<Project Name>/

Templates:
Project
Board
Required project artifacts

Result:
Initialized project workspace.
```

This format should be used when implementing each individual QuickAdd choice.

---

# 37. Error Handling

QuickAdd workflows must stop when required context cannot be resolved.

Examples:

```text
No project selected
No canonical template
Invalid destination
Duplicate project
Missing required parent
Invalid resource type
```

The workflow should not silently substitute arbitrary defaults.

Defaults are appropriate only where the vault architecture explicitly defines one.

---

# 38. Duplicate Prevention

Creation workflows must avoid accidental duplicate records.

Before creating an object where uniqueness matters, QuickAdd should verify whether the destination already exists.

Especially important:

```text
Project
Project ID
Task ID
Resource
Board
```

A failed duplicate check should stop creation rather than create a second competing record.

---

# 39. Configuration Naming

QuickAdd choice names should describe user intent.

Preferred:

```text
New Project
New Task
New Resource
Capture to Inbox
New Blog Post
Create Project Artifact
```

Avoid implementation-oriented names such as:

```text
Run Macro 7
Templater Project Script
Execute CreateProjectJS
```

The user should interact with the vault's domain model, not its implementation internals.

---

# 40. Testing Requirements

Every QuickAdd workflow should be tested independently.

### Test 1 — Creation

```text
Run workflow
↓
Expected file created
```

### Test 2 — Destination

```text
Verify file is in correct folder.
```

### Test 3 — Template

```text
Verify correct Templater template executed.
```

### Test 4 — Metadata

```text
Verify required properties.
```

### Test 5 — Relationships

```text
Verify project / parent / related-note links.
```

### Test 6 — Plugin integration

```text
Verify TaskNotes / Bases / Hearth / Kanban sees the result where applicable.
```

### Test 7 — Duplicate execution

```text
Run workflow twice.
Verify duplicate protection.
```

### Test 8 — Cancellation

```text
Cancel during a prompt.
Verify no malformed record remains.
```

---

# 41. Automation Readiness

QuickAdd is ready for programmatic configuration only when:

```text
[ ] Canonical templates finalized
[ ] Canonical folders finalized
[ ] Project hierarchy finalized
[ ] Resource taxonomy finalized
[ ] Property vocabulary finalized
[ ] Required workflows identified
[ ] Workflow inputs identified
[ ] Workflow destinations identified
[ ] Workflow templates identified
[ ] Duplicate behavior defined
[ ] Cancellation behavior defined
[ ] Plugin dependencies identified
[ ] Individual workflows tested
```

Until then, configuration should be treated as specification work rather than automation work.

---

# 42. Implementation Sequence

```text
1. Freeze canonical templates
        ↓
2. Freeze folder structure
        ↓
3. Freeze object hierarchy
        ↓
4. Define QuickAdd choices
        ↓
5. Define required inputs
        ↓
6. Define destinations
        ↓
7. Connect Templater templates
        ↓
8. Implement simple creation workflows
        ↓
9. Implement project orchestration
        ↓
10. Implement capture workflows
        ↓
11. Implement resource workflows
        ↓
12. Implement publishing workflows
        ↓
13. Integrate TaskNotes / Kanban / Meta Bind
        ↓
14. Integrate Hearth actions
        ↓
15. Test every workflow
        ↓
16. Automate configuration
```

---

# 43. Final Technical Contract

QuickAdd's contract is:

```text
INPUT
    User intent
    User-selected context
    Existing vault context

PROCESS
    Prompt
    Select
    Route
    Create
    Invoke Templater
    Connect existing records
    Execute controlled macros

OUTPUT
    Correctly initialized vault object
    Correct destination
    Correct relationships
    Correct template
    Correct downstream plugin integration

DOES NOT OWN
    Template definitions
    Task lifecycle
    Interactive properties
    Kanban state
    Dashboard presentation
    Structured data views
    Code editing
```

The resulting architecture is:

```text
                    USER
                      │
                      ▼
                  HEARTH
               / dashboard \
                      │
                      ▼
                  QUICKADD
                      │
          ┌───────────┼───────────┐
          │           │           │
       SELECT       ROUTE       CREATE
          │           │           │
          └───────────┼───────────┘
                      ▼
                  TEMPLATER
                      │
                      ▼
                  MARKDOWN
                      │
       ┌──────────────┼─────────────────┐
       │              │                 │
   TASKNOTES        KANBAN          META BIND
       │              │                 │
       ▼              ▼                 ▼
    Tasks          Projects          Properties
       │              │                 │
       └──────────────┼─────────────────┘
                      ▼
                    BASES
                      │
                      ▼
                   HEARTH
```

QuickAdd is therefore the vault's orchestration layer: it turns the underlying Markdown, templates, and plugins into deliberate user workflows without taking ownership of the systems those workflows operate.