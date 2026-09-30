# Templater Technical Implementation Specification

## 1. Purpose

Templater is the vault's note-generation and template-execution layer.

Templater is responsible for turning approved Markdown templates into correctly initialized vault notes and for executing controlled template logic when a note requires dynamic values, prompts, file-path logic, linked-note selection, or other deterministic initialization.

Templater does not own:

- project organization;
    
- task management;
    
- dashboards;
    
- structured data views;
    
- interactive property editing;
    
- Kanban state;
    
- publishing calendars;
    
- repository code.

Those responsibilities belong to the appropriate system or plugin.

The repository explicitly assigns:

```text
Note Generation → Templater
Guided Creation → QuickAdd
Interactive Properties → Meta Bind
Tasks → TaskNotes
Structured Views → Bases
Dashboards → Hearth
Visual Project Flow → Kanban
Code Workspace → CodeSpace
```

This separation must remain intact.

---

# 2. Repository Integration

## 2.1 Canonical template directory

The canonical template directory is:

```text
2.AREAS/SYSTEM/Templates/
```

All reusable vault templates belong here unless a specific plugin requires a different location.

The current repository already contains a substantial template catalog in this directory.

Examples include:

```text
Project.template.md
Milestone.template.md
Phase.template.md
Task.template.md

PRD.template.md
Technical Requirements.template.md
Architecture Specification.template.md
Implementation Plan.template.md

ADR.template.md
RFC.template.md
Requirement.template.md

Daily.template.md
Daily Standup.template.md
Weekly Review.template.md
Weekly Sync.template.md

AI Thread.template.md
Clipping.template.md
Web Clipping.template.md
Fleeting Note.template.md
Literature.template.md
Evergreen.template.md

Domain.template.md
Cycle.template.md
Pattern.template.md
Applied Drill.template.md
Evidence.template.md
Drill Evidence.template.md

Board.template.md
Task Bridge.template.md
```

The template catalog must be treated as an implementation inventory, not automatically as the final canonical template architecture.

Duplicate and overlapping templates must be resolved before automation is generated.

---

# 3. Templater Configuration

Open:

```text
Settings
→ Community plugins
→ Templater
```

Configure:

```text
Template folder location:
2.AREAS/SYSTEM/Templates
```

Templater's current settings support a template folder, template hotkeys, folder templates, file-regex templates, startup templates, and automatic cursor behavior.

The vault should use these capabilities selectively.

---

# 4. Required Configuration

## 4.1 Template folder

Set:

```text
2.AREAS/SYSTEM/Templates
```

This makes the approved templates available to Templater.

---

## 4.2 Template matching mode

The preferred matching strategy for this vault is:

```text
Folder templates
```

Folder templates should be used when the destination folder unambiguously determines the note type.

Templater applies the most-specific matching folder rule when multiple folder rules match.

Example:

```text
1.PROJECTS/
```

may establish a broad project rule while:

```text
1.PROJECTS/<Project>/Documentation/
```

may establish a more specific documentation rule.

The deeper rule takes precedence.

---

## 4.3 File-regex templates

File-regex templates should only be used where folder-based matching cannot express the required behavior.

Templater evaluates regex rules from top to bottom and uses the first matching rule.

Therefore:

```text
specific rule
specific rule
specific rule
...
catch-all rule
```

must be the ordering model.

A catch-all regex must never precede a more specific rule.

---

# 5. Automatic Template Execution

Automatic execution should be conservative.

The vault should not automatically execute a template merely because a Markdown file exists.

Automatic creation should occur only when:

1. the destination folder clearly identifies the document type;
    
2. the template is canonical;
    
3. the resulting metadata is deterministic;
    
4. the workflow will not create duplicate or unexpected files.

Templater's automatic trigger modes include no automatic triggering, folder-based triggering, and regex-based triggering.

The default implementation should therefore be:

```text
Automatic trigger:
Only where explicitly configured
```

Manual and QuickAdd-driven creation should remain the primary mechanisms during initial implementation.

---

# 6. Template Responsibilities

Every template must have a clearly defined responsibility.

A template may initialize:

- title;
    
- identifiers;
    
- dates;
    
- metadata;
    
- links;
    
- standard headings;
    
- structural sections;
    
- predictable relationships;
    
- deterministic calculated values.

A template should not attempt to become an application.

Templates should not:

- implement task management;
    
- duplicate a Base;
    
- duplicate a Kanban board;
    
- maintain independent project state;
    
- create competing task records;
    
- maintain dashboard state;
    
- silently modify unrelated notes;
    
- perform uncontrolled filesystem operations.

---

# 7. Metadata Initialization

Templater may initialize properties required by the document model.

For example:

```yaml
---
type: project
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
---
```

The exact property vocabulary must come from the approved vault model and templates.

Templater should not invent properties simply because a plugin can use them.

The property lifecycle is:

```text
Template
   ↓
Initialize property
   ↓
Meta Bind
   ↓
User interaction
   ↓
Bases / Hearth / other views
```

Templater creates the initial state.

Meta Bind modifies interactive state.

Bases reads the state.

Hearth presents the state.

---

# 8. Dynamic Values

Templater may use dynamic values for information that should be generated automatically.

Examples:

```text
Current date
Current time
Current file name
Current file path
Current folder
User-selected values
Generated identifiers
Derived links
```

Templater provides internal variables and functions for these operations.

Dynamic values should be deterministic and explainable.

---

# 9. Date Generation

Date values should use a consistent vault format.

Recommended canonical date format:

```text
YYYY-MM-DD
```

For example:

```text
<% tp.date.now("YYYY-MM-DD") %>
```

Dates should not be generated in multiple incompatible formats across templates.

Where the note represents a date-specific record, the date should normally derive from the note creation context rather than being manually retyped.

---

# 10. File Context

Templates may use the current file context.

Useful context includes:

```text
Current filename
Current folder
Current path
Creation date
Modification date
```

This is particularly important for project documents.

Example relationship:

```text
1.PROJECTS/
└── Example Project/
    ├── Project.md
    ├── Requirements/
    ├── Decisions/
    └── Investigations/
```

A document generated inside the project folder can derive its project context from its location rather than asking the user to manually re-enter the project name.

This reduces metadata duplication.

---

# 11. User Prompts

Templater prompts should be used only for information that cannot be reliably derived from the file context.

Good prompt candidates:

```text
Project selection
Document type
Resource type
Status when creation requires a choice
Title when it differs from filename
```

Bad prompt candidates:

```text
Current date
Current folder
Current project when folder determines it
Static template values
Values that Meta Bind should manage later
```

The principle is:

```text
Derive what the system already knows.
Ask only for what the user must decide.
```

---

# 12. Project Templates

Project templates are especially important because Projects form the primary execution hierarchy.

The repository defines:

```text
Epic
  ↓
Milestone
  ↓
Phase
  ↓
RoadMap
  ↓
Task
```

The Project model must remain consistent with that hierarchy.

At minimum, Templater must support initialization of:

```text
Project
Milestone
Phase
RoadMap
Task
```

The existing repository template inventory currently contains:

```text
Project.template.md
Milestone.template.md
Phase.template.md
Task.template.md
```

A canonical RoadMap template must be established if RoadMaps are represented as individual notes rather than only sections/records within another document.

This is a template-model decision that should be resolved before automation.

---

# 13. Project Context Inheritance

Project documents should derive project context from their location or explicit parent link whenever possible.

Conceptually:

```text
Project
  │
  ├── Milestone
  │      │
  │      └── Phase
  │             │
  │             └── RoadMap
  │                    │
  │                    └── Task
```

A child document should not require the user to manually retype all parent context.

For example, a task created from a project workflow should inherit the relevant project relationship.

This is particularly important because TaskNotes remains the task-management layer.

Templater initializes task context.

TaskNotes owns the resulting task record.

---

# 14. Task Template

The task template must initialize only task information appropriate to TaskNotes.

The division of responsibility is:

```text
Templater
    ↓
Creates task note structure
    ↓
TaskNotes
    ↓
Manages task
    ↓
Bases
    ↓
Displays task
    ↓
Hearth
    ↓
Surfaces task
```

A Daily Note or Project Hub must never create a second task record simply to display the task.

---

# 15. Daily Templates

The current repository contains:

```text
Daily.template.md
Daily Standup.template.md
Weekly Review.template.md
Weekly Sync.template.md
Sprint Planning.template.md
```

These templates serve different purposes.

### Daily

The Daily template creates the chronological daily record.

### Daily Standup

The Daily Standup template provides the stand-up workflow.

### Weekly Review

The Weekly Review template provides the review workflow.

### Weekly Sync

The Weekly Sync template provides recurring synchronization/review structure.

### Sprint Planning

The Sprint Planning template supports planning around project execution.

They should not be collapsed into one giant template.

---

# 16. Zettelkasten Templates

The repository already contains:

```text
AI Thread.template.md
Clipping.template.md
Web Clipping.template.md
Fleeting Note.template.md
Literature.template.md
Zettel Workbench.template.md
```

These correspond directly to the ingestion architecture.

The intended relationship is:

```text
AI Thread
Clipping / Web Clipping
        ↓
Zettelkasten processing
        ↓
Fleeting / Literature / processed knowledge
```

Templater should initialize these documents but should not determine their final destination by itself unless the workflow explicitly supplies that destination.

QuickAdd and Note Refactor are responsible for orchestrating the processing workflow.

---

# 17. Resource Templates

The Resources model requires templates for:

```text
Articles
Books
Documentation
General
Knowledge
Media
Repositories
```

The current repository template inventory contains broader resource-oriented templates such as:

```text
Resource.template.md
Literature.template.md
Evergreen.template.md
Document.template.md
```

This means the existing template catalog does not yet prove that seven distinct resource templates have been finalized.

Therefore:

```text
Resource template taxonomy
        ↓
Canonical template definitions
        ↓
Templater implementation
```

must occur in that order.

Do not create seven automated choices merely because seven resource folders exist.

---

# 18. Code Lab Templates

The existing Code Lab template inventory includes:

```text
Domain.template.md
Cycle.template.md
Pattern.template.md

Code Lab Lesson.template.md
Code Lab Module.template.md
Code Lab Test.template.md

Applied Drill.template.md
Drill Evidence.template.md
Evidence.template.md
Lesson.template.md
Lesson Test.template.md
Module.template.md
Module Assessment.template.md
```

These templates should be assigned to specific Code Lab objects rather than treated as interchangeable templates.

The Code Lab model remains:

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

The educational/skill-development templates form a related learning layer.

Templater should initialize both layers without conflating them.

---

# 19. Engineering Documentation Templates

The current repository contains templates including:

```text
PRD.template.md
Technical Requirements.template.md
Architecture Specification.template.md
Implementation Plan.template.md

ADR.template.md
RFC.template.md
Requirement.template.md

Design Contract.template.md
UX Design.template.md
UXD.template.md

Test Plan.template.md
Validation Report.template.md
Verification Report.template.md
Security Review.template.md
```

These should be treated as project artifacts.

Their creation should normally occur through a Project-context QuickAdd workflow that invokes the appropriate Templater template.

Conceptually:

```text
Project
   ↓
QuickAdd
   ↓
Select artifact type
   ↓
Templater
   ↓
Create artifact
   ↓
Project folder
```

Templater should not decide which document the user needs.

QuickAdd provides the decision interface.

---

# 20. Template Naming

Template filenames must be normalized before automated installation.

The current repository contains inconsistent naming patterns:

```text
Milestone Review.template.md
Milestone-Review.template.md

Phase Review.template.md
Phase-Review.template.md

Sprint Planning.template.md
Sprint-Planning.template.md

Post-mortem Meeting.template.md
Postmortem Meeting.template.md
Postmortem.template.md
Post-mortem.template.md
```

These are not safe to treat as independent canonical templates without review.

Before scripting:

```text
Inventory
   ↓
Deduplicate
   ↓
Select canonical names
   ↓
Remove/rename obsolete variants
   ↓
Build automation
```

This is a prerequisite to reliable PowerShell or CLI automation.

---

# 21. Template Dependency Model

Templates should have dependencies only where those dependencies are intentional.

Example:

```text
Project Template
    │
    ├── Project metadata
    └── Project structure

Project Document Template
    │
    └── Project context

Task Template
    │
    └── Project context
```

A template should not directly depend on a Hearth dashboard.

Dashboards consume notes.

The dependency direction should therefore remain:

```text
Templates
    ↓
Markdown records
    ↓
Plugin views
    ↓
Hearth
```

not:

```text
Hearth
    ↓
Template
    ↓
Markdown
```

---

# 22. Templater + QuickAdd Boundary

This boundary is critical.

## Templater

Templater answers:

> What should the newly created note look like?

## QuickAdd

QuickAdd answers:

> What creation workflow should happen?

Therefore:

```text
QuickAdd
    │
    ├── ask user
    ├── select workflow
    ├── select destination
    └── invoke template
             │
             ▼
         Templater
             │
             ├── generate metadata
             ├── generate structure
             ├── derive context
             └── initialize note
```

QuickAdd should not duplicate template bodies.

Templater should not become the entire workflow engine.

---

# 23. Templater + Meta Bind Boundary

Meta Bind is the interactive property layer.

Templater initializes values.

Meta Bind changes values.

Example:

```text
Template
   ↓
status: active
   ↓
Meta Bind control
   ↓
User changes status
   ↓
Bases/Hearth reflect new value
```

A template should not repeatedly overwrite user-controlled properties when the note is subsequently edited.

This is one reason automatic re-execution of templates must be controlled.

---

# 24. Templater + Bases Boundary

Bases reads the resulting Markdown records.

Templater does not generate a Base.

Correct:

```text
Templater
   ↓
Markdown + properties
   ↓
Bases
```

Incorrect:

```text
Templater
   ↓
hidden database
   ↓
Bases
```

The vault's architecture explicitly assigns structured views to Bases.

---

# 25. Templater + TaskNotes Boundary

TaskNotes owns task management.

Templater can create a task note from a template.

It should not implement:

- task status synchronization;
    
- task filtering;
    
- task dashboards;
    
- due-date calculations beyond initial values;
    
- task completion logic.

Those belong to TaskNotes and the surfaces consuming TaskNotes.

---

# 26. Templater + Kanban Boundary

Kanban owns visual project flow.

Templater does not own Kanban board creation. QuickAdd generates milestone-specific board files directly.

Templater does not manage the board after creation.

The resulting Kanban board remains a project workflow surface.

---

# 27. Templater + Hearth Boundary

Hearth consumes the results of template execution.

Templater must never contain Hearth-specific presentation logic unless that logic is required to create a note that Hearth intentionally renders.

The normal direction is:

```text
Templater
   ↓
Markdown
   ↓
Hearth
```

---

# 28. User Scripts

Templater supports user scripts and arbitrary JavaScript execution. The plugin documentation explicitly warns that Templater can execute arbitrary JavaScript and system commands.

For this vault:

```text
User scripts:
Allowed only when deterministic and reviewed
```

Scripts should be used when normal template expressions are insufficient.

Good candidates:

```text
Project-context resolution
Controlled identifier generation
Complex linked-note selection
Reusable metadata construction
```

Bad candidates:

```text
Large application logic
Task database synchronization
Unbounded filesystem automation
External network operations
Secrets handling
Destructive cleanup
```

A script should perform one well-defined operation.

---

# 29. Security Boundary

Templater scripts are executable code.

Therefore:

```text
Only trusted scripts
No copied arbitrary scripts
No unexplained shell commands
No external code execution without review
```

The plugin itself warns that arbitrary JavaScript and system commands can be dangerous.

For this reason, any future automated installation script should create only known Templater configuration and known local scripts.

---

# 30. Template Hotkeys

Templater supports binding individual templates to Obsidian commands and then assigning hotkeys through Obsidian's Hotkeys settings.

Use template hotkeys only for high-frequency deterministic actions.

Candidates:

```text
Daily Note
Quick Capture
Task
Project
Knowledge Note
AI Thread
Clipping
```

Do not assign hotkeys to every template.

QuickAdd should remain the primary menu-driven workflow for templates requiring choices.

---

# 31. Cursor Management

Templater supports automatic cursor placement through `tp.file.cursor` and an automatic-jump setting.

Templates should place the cursor at the first meaningful user-input location.

For example:

```text
# Title

## Purpose

<cursor>
```

The cursor should not land inside metadata unless metadata itself requires immediate manual editing.

---

# 32. Folder Template Rules

The final folder-template map should be generated from the approved vault architecture.

The implementation model is:

```text
Folder
    ↓
Template rule
    ↓
Templater
```

Potential mappings should be based on actual folders, for example:

```text
1.PROJECTS/
2.AREAS/Zettelkasten/
2.AREAS/Code Lab/
3.RESOURCES/
```

but the exact rules must be created only after the actual final folder tree and canonical templates are frozen.

Do not automate folder-template rules from a hypothetical folder structure.

---

# 33. Failure Handling

A template must fail visibly rather than silently producing malformed notes.

Examples of failure conditions:

```text
Missing required project
Invalid destination
Missing required template
Unresolved parent note
Invalid property value
Missing required script
```

A failed creation should not leave behind a misleading partially initialized record.

Where a script is used, errors should be explicit enough to identify the failing operation.

---

# 34. Testing Requirements

Before automation, every canonical template must pass:

### Test 1 — Manual execution

Create the note manually through Templater.

Verify:

```text
File created
Template rendered
No unresolved Templater commands
```

### Test 2 — Metadata

Verify:

```text
Properties are valid
Dates are valid
Links resolve
No unintended properties appear
```

### Test 3 — Context

Verify:

```text
Project context is correct
Folder-derived values are correct
Parent links are correct
```

### Test 4 — Repeat creation

Create two instances.

Verify:

```text
No duplicate IDs
No shared mutable state
No overwritten notes
```

### Test 5 — QuickAdd invocation

Invoke the same template through its intended QuickAdd workflow.

Verify:

```text
Correct template
Correct destination
Correct prompts
Correct resulting metadata
```

### Test 6 — Bases visibility

Open the relevant Base.

Verify:

```text
New note appears
Properties are readable
Filters work
Links resolve
```

### Test 7 — Hearth visibility

Open the relevant Hearth dashboard.

Verify:

```text
New record appears
Expected information is displayed
No manually duplicated data is required
```

---

# 35. Automation Readiness Criteria

Templater is ready for programmatic installation only when all of the following are true:

```text
[ ] Canonical template directory confirmed
[ ] Canonical template names confirmed
[ ] Duplicate templates resolved
[ ] Property vocabulary finalized
[ ] Project hierarchy finalized
[ ] Folder hierarchy finalized
[ ] Template → folder mappings finalized
[ ] Template → QuickAdd workflows finalized
[ ] Required user scripts identified
[ ] Scripts reviewed
[ ] Template hotkeys identified
[ ] Folder templates identified
[ ] Regex templates identified, if any
[ ] Automatic execution rules identified
[ ] Manual creation tested
[ ] QuickAdd creation tested
[ ] Bases visibility tested
[ ] Hearth visibility tested
```

Until these conditions are met, automation would be encoding assumptions rather than implementing a specification.

---

# 36. Implementation Sequence

The actual Templater implementation should occur in this order:

```text
1. Freeze vault folders
        ↓
2. Freeze canonical template inventory
        ↓
3. Resolve duplicate templates
        ↓
4. Freeze property vocabulary
        ↓
5. Normalize template filenames
        ↓
6. Configure Templater template directory
        ↓
7. Test templates manually
        ↓
8. Configure folder templates
        ↓
9. Configure file-regex templates where necessary
        ↓
10. Configure template hotkeys
        ↓
11. Add reviewed user scripts
        ↓
12. Connect QuickAdd
        ↓
13. Test Bases
        ↓
14. Test Hearth
        ↓
15. Automate installation
```

The PowerShell/Obsidian CLI phase belongs after step 15 has been specified, not before.

---

# 37. Final Technical Contract

Templater's implementation contract is:

```text
INPUT
    Approved template
    Current file context
    User-supplied decisions
    Approved dynamic values

PROCESS
    Resolve template
    Resolve context
    Generate deterministic values
    Render Markdown
    Initialize properties
    Initialize links
    Position cursor

OUTPUT
    Valid Markdown note
    Correct location
    Correct metadata
    Correct relationships

DOES NOT OWN
    Tasks
    Dashboards
    Bases
    Kanban state
    Interactive property state
    Project execution
    Repository code
```

The architectural dependency is:

```text
                  QUICKADD
                     │
              chooses workflow
                     │
                     ▼
                 TEMPLATER
                     │
              creates Markdown
                     │
        ┌────────────┼─────────────┐
        │            │             │
   META BIND       TASKNOTES     KANBAN
        │            │             │
   edits state   manages tasks   visual flow
        │            │             │
        └────────────┼─────────────┘
                     │
                     ▼
                  MARKDOWN
                     │
              ┌──────┴──────┐
              │             │
            BASES         HEARTH
              │             │
         structured       dashboard
            views          UI
```

This is the boundary that should be preserved when the implementation is later automated.