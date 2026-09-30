# Meta Bind Technical Implementation Specification

## 1. Purpose

Meta Bind is the vault's interactive metadata and control layer.

Its purpose is to make structured Markdown properties directly editable and actionable from within notes and dashboards.

The architectural role is:

```text
Markdown properties
        ↓
Meta Bind
        ↓
Interactive controls
        ↓
Updated metadata
        ↓
Bases / Hearth / other consumers
```

Meta Bind does not create the underlying information architecture.

It exposes controlled interaction with information that has already been defined by the vault's models.

The primary distinction is:

```text
QuickAdd   → create and orchestrate
Templater  → generate and initialize
Meta Bind   → interactively edit
TaskNotes  → manage tasks
Kanban     → manage project board state
Bases      → query and display structured data
Hearth     → present the system
```

---

# 2. Responsibilities

Meta Bind is responsible for:

- interactive property editing
    
- property selection controls
    
- boolean controls
    
- text inputs where appropriate
    
- numeric inputs where appropriate
    
- date inputs where appropriate
    
- controlled metadata selection
    
- displaying metadata-derived values where useful
    
- providing interactive controls inside notes
    
- providing interactive controls inside Hearth interfaces
    
- allowing users to change permitted state without manually editing frontmatter
    
- preserving the vault's property vocabulary through controlled inputs

Meta Bind should make structured metadata usable without requiring the user to edit YAML manually.

---

# 3. Non-Responsibilities

Meta Bind does not own:

- note creation
    
- project creation
    
- template rendering
    
- task storage
    
- task lifecycle logic
    
- Kanban board state
    
- project hierarchy
    
- resource taxonomy
    
- dashboard architecture
    
- code editing
    
- knowledge ingestion
    
- publishing-calendar architecture

Those remain the responsibility of their respective systems.

---

# 4. Core Architectural Contract

The fundamental relationship is:

```text
USER INTENT
    ↓
QuickAdd
    ↓
Templater
    ↓
Initial Markdown + properties
    ↓
Meta Bind
    ↓
Interactive property changes
    ↓
Bases / Hearth / plugins consume updated state
```

Meta Bind should generally operate on properties that already exist in the note.

It should not become the mechanism by which the vault invents new properties during ordinary interaction.

---

# 5. Property Ownership

Every interactive property must have an identified owner.

For example:

```text
Project
    project_id        → initialized by creation workflow
    project           → initialized by creation workflow
    milestone         → interactive project context
    phase             → interactive project context
    inputs            → project metadata
    outputs           → project metadata
    downstream_consumers → project metadata
```

Task:

```text
task_id
project_id
project
status
dependency
deliverable
```

The important distinction is:

```text
Property existence
    ↓
Template / creation workflow

Property modification
    ↓
Meta Bind
```

---

# 6. Interactive Property Rule

A property should receive a Meta Bind control only when the user is expected to change it interactively.

Not every property needs a visible control.

For example:

```text
project_id
```

should normally be initialized once and then treated as stable.

Whereas:

```text
status
```

is inherently interactive.

Therefore:

```text
Stable identity
    → no ordinary editing control

Workflow state
    → interactive control

Classification
    → interactive control where appropriate

Relationships
    → interactive control where appropriate
```

---

# 7. Control Contract

Every Meta Bind control should have a defined contract:

```text
Control
    ↓
Target property
    ↓
Allowed values
    ↓
Initial value
    ↓
Mutation behavior
    ↓
Consumers
```

Example:

```text
Control:
Task Status

Target:
status

Allowed values:
Defined task statuses

Initial value:
Creation workflow default

Mutation:
Update task status property

Consumers:
TaskNotes
Bases
Hearth
```

No control should exist merely because a property happens to exist.

---

# 8. Workflow Contract Format

Every Meta Bind workflow should be specified using:

```text
Workflow
Purpose
Trigger
Context
Inputs
Target
Allowed values
Mutation
Side effects
Consumers
Failure behavior
```

This becomes the implementation contract for the actual Meta Bind controls.

---

# 9. Project Creation Workflow

## Purpose

Initialize project metadata during project creation.

## Trigger

```text
QuickAdd → New Project
```

## Context

A new Project note is being created.

## Inputs

```text
project
project type
```

Additional values may be initialized by the creation workflow.

## Target

Project properties.

## Meta Bind responsibility

Meta Bind does not create the project.

It becomes responsible for subsequent interactive project metadata.

## Mutation

After creation, permitted project metadata may be changed through controls.

## Side effects

Changing project metadata must not silently recreate the project.

## Consumers

```text
Project Command Center
Bases
Project artifacts
Tasks
Hearth
```

---

# 10. Project Context Workflow

## Purpose

Allow the user to change the project's current milestone or phase context.

## Trigger

User opens Project.md.

## Context

The project already exists.

## Inputs

```text
milestone
phase
```

## Target

The corresponding project properties.

## Allowed values

Values must come from the project's actual hierarchy.

The control should not permit arbitrary milestone or phase names if the architecture requires controlled project structure.

## Mutation

```text
milestone → selected milestone
phase     → selected phase
```

## Side effects

Changing context must not automatically modify historical tasks or artifacts unless a separate workflow explicitly defines that behavior.

## Consumers

```text
Project Command Center
Bases
Project-local views
QuickAdd project actions
```

---

# 11. Milestone Management Workflow

## Purpose

Provide interactive milestone selection within project context.

## Trigger

Project Command Center or Project.md.

## Context

A project has an established milestone structure.

## Inputs

Existing milestone options.

## Target

```text
milestone
```

## Allowed values

Canonical project milestones.

The standard model currently includes:

```text
M1 Foundation & Architecture
M2 MVP Build & Launch
M3 Expansion & Hardening
```

with their corresponding phases.

## Mutation

Update the selected project context.

## Side effects

No automatic migration of existing tasks should occur unless explicitly implemented as a separate operation.

---

# 12. Phase Management Workflow

## Purpose

Provide controlled phase selection within the current project milestone.

## Trigger

Project context control.

## Context

A milestone has been selected.

## Input

```text
phase
```

## Allowed values

Only phases belonging to the selected milestone should be presented.

For example:

```text
M1
├── 1.1 Product Discovery & Definition
├── 1.2 Platform Scaffolding & Systems Setup
└── 1.3 Internal Alpha Validation
```

## Mutation

```text
phase → selected phase
```

## Validation

The selected phase must belong to the selected milestone.

This relationship is important.

The control should not permit:

```text
milestone = M1
phase = M2 phase
```

---

# 13. Task Creation Workflow

## Purpose

Initialize task metadata when a task is created.

## Trigger

```text
QuickAdd → New Task
```

## Context

The task is being created within a project or other task context.

## Inputs

```text
task title
project
milestone / phase where applicable
deliverable
dependency where applicable
```

## Target

Task properties.

## Meta Bind responsibility

Meta Bind is not responsible for task creation.

It becomes responsible for interactive task metadata after creation.

## Consumers

```text
TaskNotes
Project Command Center
Bases
Hearth
Kanban where applicable
```

---

# 14. Task Status Workflow

## Purpose

Provide the primary interactive control for task lifecycle state.

## Trigger

Task note or task-oriented dashboard.

## Target

```text
status
```

## Allowed values

The final task status vocabulary must be frozen before automation.

Meta Bind must not permit arbitrary status strings when downstream systems depend on a controlled vocabulary.

## Mutation

```text
status → selected status
```

## Consumers

```text
TaskNotes
Bases
Hearth
project views
```

## Boundary

Meta Bind changes the property.

TaskNotes remains responsible for task management behavior associated with that state.

---

# 15. Task Dependency Workflow

## Purpose

Allow a task's dependency relationship to be edited.

## Trigger

Task note.

## Target

```text
dependency
```

## Input

An existing task or permitted dependency reference.

## Mutation

Update the task's dependency metadata.

## Validation

The workflow should prevent invalid or self-referential dependency values where the task architecture prohibits them.

## Side effects

Changing a dependency must not automatically change task status unless that behavior is explicitly defined elsewhere.

---

# 16. Task Deliverable Workflow

## Purpose

Allow the user to associate a task with its expected deliverable.

## Target

```text
deliverable
```

## Input

Project artifact or other permitted deliverable reference.

## Mutation

Update the task metadata.

## Consumers

```text
Project Command Center
Bases
Task views
```

---

# 17. Project Artifact Workflow

## Purpose

Provide interactive project-context controls on project artifacts.

## Trigger

Artifact note.

## Context

The artifact belongs to a project.

## Inputs

```text
project
milestone
phase
```

where those properties are part of the finalized artifact model.

## Mutation

Update permitted context properties.

## Boundary

Meta Bind does not determine what type of artifact the note is.

That is established by the template and creation workflow.

---

# 18. Resource Metadata Workflow

## Purpose

Provide interactive metadata controls for durable resources.

## Trigger

Resource note.

## Context

A resource has already been created using the appropriate resource template.

## Possible metadata

The final resource model determines the exact property set.

Meta Bind may expose:

```text
resource type
status
classification
relationships
tags
```

where those properties are explicitly part of the resource model.

## Boundary

Meta Bind does not determine whether something should become a resource.

That decision belongs to the processing workflow.

---

# 19. Zettelkasten Processing Workflow

## Purpose

Provide interactive controls during knowledge processing.

## Inbound sources

```text
inbox
ai threads
clippings
```

## Processing destinations

```text
fleeting
lit
attachments
resource destinations
```

## Meta Bind responsibility

Meta Bind may expose processing metadata where that metadata has been defined.

It should not independently decide:

```text
"This note should become permanent."
"This clipping is important."
"This AI passage should become a zettel."
```

Those remain human processing decisions.

---

# 20. Inbox Processing Workflow

## Purpose

Support the processing state of captured inbox material.

## Trigger

User opens an inbox note.

## Target

Only explicitly defined processing properties.

## Mutation

The user selects the appropriate state or classification.

## Integration

```text
Inbox
  ↓
Meta Bind
  ↓
Human classification
  ↓
QuickAdd / Note Refactor
  ↓
Destination
```

Meta Bind provides the control.

QuickAdd and Note Refactor perform the resulting operation.

---

# 21. AI Thread Processing Workflow

## Purpose

Provide metadata controls while processing exported AI conversations.

## Trigger

AI Thread note.

## Context

The note contains source material from an AI conversation.

## Meta Bind responsibility

Expose defined metadata such as processing state or destination where the final model requires it.

## Boundary

Meta Bind must not automatically extract knowledge from the conversation.

Extraction remains a separate processing operation.

---

# 22. Clipping Processing Workflow

## Purpose

Support processing of Web Clipper output.

## Trigger

A clipping enters the Zettelkasten.

## Target

Defined clipping metadata.

## Mutation

The user may classify or route the clipping.

## Boundary

Web Clipper captures.

Meta Bind edits metadata.

QuickAdd routes.

Note Refactor transforms.

---

# 23. Code Lab Classification Workflow

## Purpose

Provide interactive classification of Code Lab knowledge.

## Model

```text
Domain
   ↓
Cycle
   ↓
Standard
   ↓
Pattern
   ↓
Code Artifact
```

## Target properties

Only properties defined by the finalized Code Lab model.

## Example

A pattern note may expose controls for its relevant:

```text
domain
cycle
standard
```

where those relationships are represented as metadata.

## Mutation

The selected relationships are written to the note.

## Consumers

```text
Bases
Code Lab navigation
Hearth
related notes
```

---

# 24. Library Relationship Workflow

## Purpose

Provide interactive controls for connecting knowledge objects.

## Context

Library notes should remain connected rather than becoming isolated documents.

## Possible targets

```text
related resource
related project
related concept
related note
```

Only relationships defined by the Library model should receive controls.

## Mutation

Update the relevant property or link representation.

## Boundary

Meta Bind manages the interaction.

It does not replace Markdown links, backlinks, graph relationships, or Bases.

---

# 25. Blog Publishing Workflow

## Purpose

Allow publishing metadata to be changed interactively.

## Trigger

Blog content note.

## Context

The content item already exists.

## Possible metadata

The final Blog model determines the exact fields, but may include:

```text
publication status
planned date
publication channel
content classification
```

## Mutation

Update the selected metadata.

## Consumers

```text
Blog planner
calendar
Hearth
Bases
```

## Boundary

Meta Bind does not publish the content.

It changes publishing metadata.

---

# 26. Social Publishing Workflow

## Purpose

Provide interactive publishing controls for Social content.

## Context

Social content has already been created.

## Possible controls

```text
status
planned date
platform
content type
```

Only finalized properties should become controls.

## Shared planner

Blog and Social may use the same planning surface, but their content models remain distinct.

---

# 27. Publishing Calendar Workflow

## Purpose

Allow content scheduling metadata to be changed from the content note or planning interface.

## Target

The finalized scheduling properties.

## Mutation

Changing a date or publishing state updates the underlying note.

## Consumers

```text
shared Blog/Social calendar
Hearth
Bases
```

The calendar should read the metadata rather than maintain a second independent schedule.

---

# 28. Hearth Command Center Workflow

## Purpose

Provide interactive controls inside Hearth without duplicating business logic.

## Architecture

```text
Hearth
   ↓
Meta Bind control
   ↓
Underlying property
```

Where a control requires a creation operation:

```text
Hearth
   ↓
QuickAdd action
```

## Rule

Meta Bind should handle property interaction.

QuickAdd should handle multi-step creation workflows.

This distinction prevents the Hearth interface from becoming a second application layer.

---

# 29. Project Command Center Workflow

The Project Command Center should expose project context controls such as:

```text
Selected Project
Selected Milestone
Selected Phase
```

where these are implemented as actual vault metadata or explicitly defined interface state.

The important distinction is:

```text
Project selection
    ↓
Interface context

Project property editing
    ↓
Meta Bind
```

The implementation must not accidentally turn a temporary dashboard selection into permanent project metadata.

If a selector is merely UI state, it should not be written into Project.md.

---

# 30. Command Center Task Workflow

The Project Command Center may expose task controls.

Examples:

```text
Status
Dependency
Deliverable
```

The control should modify the task record directly.

The Command Center should not maintain a duplicate task state.

---

# 31. Property Initialization Workflow

Meta Bind controls should assume that required properties have already been initialized.

The expected lifecycle is:

```text
Template
    ↓
Initial property exists
    ↓
Meta Bind exposes control
    ↓
User modifies property
```

If a required property does not exist, the implementation should either:

1. initialize it through the appropriate template; or
    
2. explicitly define Meta Bind's initialization behavior.

Do not rely on accidental property creation.

---

# 32. Select Control Contract

Selection controls must have:

```text
Property
Allowed values
Initial value
Empty-state behavior
Invalid-value behavior
```

Example:

```text
Property:
phase

Allowed values:
phases belonging to selected milestone

Initial value:
template-defined default

Empty state:
defined explicitly

Invalid value:
must not be silently accepted
```

---

# 33. Boolean Control Contract

Boolean controls should be used only for actual boolean properties.

```text
false
↕
true
```

Do not encode boolean state as:

```text
yes
no
maybe
```

unless the property is intentionally modeled as an enumeration instead.

---

# 34. Date Control Contract

Date controls should write dates in the format expected by the vault's metadata consumers.

The date representation must be standardized before implementation.

The control should not produce multiple incompatible date formats across Blog, Social, Project, and task workflows.

---

# 35. Text Input Contract

Text inputs should be used where free-form text is genuinely required.

They should not be used when the field is actually a controlled vocabulary.

Prefer:

```text
select
```

for:

```text
status
type
classification
```

and:

```text
text input
```

for:

```text
free-form description
label
user-entered value
```

where appropriate.

---

# 36. Relationship Control Contract

A relationship control should point to an existing vault object where possible.

For example:

```text
Task
    ↓
Project
```

should resolve to an actual project reference rather than arbitrary text.

The control should preserve the representation required by Bases, links, and other consumers.

---

# 37. Protected Properties

Some properties should not normally be manually edited.

Examples include identity fields such as:

```text
project_id
task_id
```

These should be initialized by creation workflows and treated as stable identifiers.

Meta Bind should not expose casual editing controls for protected identity properties.

---

# 38. Derived Properties

A property that is calculated from other information should not be presented as an ordinary editable field.

The architecture should distinguish:

```text
User-controlled property
```

from:

```text
Derived value
```

A derived value should be calculated or displayed by the appropriate system rather than allowing the user to create contradictory state.

---

# 39. Interactive Control Placement

Controls should be placed where they are useful to the user.

Possible locations include:

```text
Project.md
Task note
Resource note
Code Lab note
Blog note
Social note
Hearth Command Center
Project Command Center
```

Controls should not be added indiscriminately to every note.

The presence of a property does not automatically require a visible control.

---

# 40. Metadata Display

Meta Bind may also be used to display metadata-derived information where appropriate.

The distinction is:

```text
Display
    → read existing state

Input
    → modify existing state
```

Display controls should not imply that the displayed value is editable.

---

# 41. Hearth Interaction Contract

Hearth should consume the same metadata used by the underlying notes.

The architecture should remain:

```text
Markdown
   ↓
Properties
   ↓
Meta Bind / Bases
   ↓
Hearth
```

not:

```text
Hearth database
    ↕
Markdown database
```

There should not be two competing states for the same information.

---

# 42. Bases Integration

Bases should read the metadata that Meta Bind edits.

Therefore:

```text
Meta Bind
    ↓
Property
    ↓
Bases
    ↓
View
```

A Base should not require a second manually maintained representation of the same property.

---

# 43. TaskNotes Integration

TaskNotes should consume task properties according to its configured task model.

The relationship is:

```text
Meta Bind
    ↓
Task property
    ↓
TaskNotes
```

Meta Bind should not recreate TaskNotes functionality.

If TaskNotes provides its own task-state interaction that is preferable for a particular workflow, the two systems should not fight over the same UI interaction.

The final implementation must define which interface is used for each task operation.

---

# 44. Kanban Integration

Kanban owns board state.

Meta Bind owns ordinary note properties.

Therefore:

```text
Kanban card movement
    ↓
Kanban state
```

is distinct from:

```text
Meta Bind
    ↓
Project/task metadata
```

If the two are intentionally synchronized, that synchronization must be explicitly specified.

It should not emerge accidentally from both systems editing the same fields.

---

# 45. QuickAdd Integration

The relationship is:

```text
QuickAdd
    ↓
Creation / orchestration

Meta Bind
    ↓
Interactive editing
```

Example:

```text
QuickAdd → New Task
    ↓
Templater → creates task
    ↓
Meta Bind → status control
```

The creation workflow should not be duplicated as a Meta Bind button.

---

# 46. Templater Integration

Templater establishes the initial metadata schema.

Example:

```text
Project.template.md
    ↓
project_id
project
milestone
phase
...
```

Meta Bind then exposes permitted fields interactively.

If the property is required for the model, the template should establish it before the Meta Bind control is used.

---

# 47. Control Naming

Control labels should describe the domain concept.

Preferred:

```text
Status
Project
Milestone
Phase
Dependency
Deliverable
Publication Date
Publishing Status
```

Avoid:

```text
Set YAML
Modify Property
Write Frontmatter
Execute Metadata Action
```

The user should interact with the model, not the implementation mechanism.

---

# 48. Workflow Failure Behavior

A Meta Bind control should fail predictably when its expected metadata context is unavailable.

Examples:

```text
Missing property
Invalid selected value
Missing related note
Invalid relationship
Unavailable parent context
```

The system should not silently write malformed metadata.

Where a control depends on another property:

```text
milestone
    ↓
phase options
```

the dependent control must respond appropriately when the parent changes.

---

# 49. Dependency Contract

Dependent controls must define their dependency.

Example:

```text
Milestone
    ↓
Phase
```

Contract:

```text
IF milestone changes
THEN
    phase options are recalculated
```

The system must not leave a previously selected phase that is invalid under the new milestone without explicitly handling that state.

---

# 50. State Mutation Rules

Meta Bind controls should make the smallest necessary mutation.

Changing:

```text
status
```

should modify the status property.

It should not automatically modify:

```text
project
milestone
phase
dependency
deliverable
```

unless those side effects are explicitly part of the workflow contract.

This keeps metadata changes predictable.

---

# 51. No Hidden Automation

Meta Bind controls should not contain hidden multi-step business logic unless that behavior has been deliberately specified.

For example:

```text
Change status
```

should not secretly:

```text
move Kanban card
create task
archive note
change project phase
create journal entry
```

unless the workflow explicitly defines those operations.

Complex orchestration belongs in QuickAdd or another appropriate workflow layer.

---

# 52. Required Workflow Inventory

The initial Meta Bind implementation should account for:

```text
PROJECT
├── Project context
├── Milestone selection
└── Phase selection

TASK
├── Status
├── Dependency
└── Deliverable

PROJECT ARTIFACT
├── Project context
├── Milestone
└── Phase

RESOURCE
└── Defined resource metadata

ZETTELKASTEN
├── Processing state
├── Classification
└── Destination metadata where defined

CODE LAB
├── Domain
├── Cycle
└── Standard / Pattern relationships where modeled

BLOG
├── Publishing state
├── Publishing date
└── Planning metadata

SOCIAL
├── Publishing state
├── Publishing date
└── Platform/content metadata

HEARTH
├── Context selectors
├── Property controls
└── Action controls that delegate creation to QuickAdd

LIBRARY
└── Defined relationship metadata
```

This is the functional inventory.

The actual controls should only be implemented after the corresponding property models are frozen.

---

# 53. Implementation Contract Matrix

Each control should ultimately be documented using this structure:

```text
Workflow:
Task Status

Trigger:
Task note / task view

Property:
status

Control:
Select

Allowed values:
Canonical task statuses

Initial value:
Template-defined

Mutation:
Update status

Consumers:
TaskNotes, Bases, Hearth

Dependencies:
None

Side effects:
None

Failure behavior:
Do not write invalid status
```

This matrix should exist for every implemented control.

---

# 54. Testing Requirements

Every Meta Bind workflow must be tested against the underlying Markdown state.

### Test 1 — Render

```text
Open note
↓
Control appears
```

### Test 2 — Read

```text
Existing property
↓
Control displays current value
```

### Test 3 — Write

```text
Change control
↓
Property changes
```

### Test 4 — Persistence

```text
Close note
↓
Reopen note
↓
Value remains correct
```

### Test 5 — Consumer

```text
Change property
↓
Bases / TaskNotes / Hearth reflects new value
```

### Test 6 — Invalid state

```text
Attempt invalid value
↓
Invalid state is rejected or explicitly handled
```

### Test 7 — Dependency

```text
Change parent property
↓
Dependent controls update correctly
```

### Test 8 — Creation integration

```text
QuickAdd creates note
↓
Templater initializes properties
↓
Meta Bind controls render correctly
```

---

# 55. Automation Readiness

Meta Bind configuration should not be programmatically generated until:

```text
[ ] Property vocabulary finalized
[ ] Property types finalized
[ ] Project hierarchy finalized
[ ] Task model finalized
[ ] Resource model finalized
[ ] Code Lab model finalized
[ ] Blog model finalized
[ ] Social model finalized
[ ] Protected properties identified
[ ] Derived properties identified
[ ] Interactive properties identified
[ ] Allowed values finalized
[ ] Dependent-property relationships defined
[ ] Control placement defined
[ ] Plugin ownership defined
[ ] Side effects defined
[ ] Failure behavior defined
[ ] Individual controls tested
```

Only then should PowerShell or Obsidian CLI automation generate or modify Meta Bind configuration.

---

# 56. Final Technical Contract

Meta Bind's contract is:

```text
INPUT
    Existing Markdown properties
    User interaction
    Defined allowed values

PROCESS
    Display
    Select
    Edit
    Validate
    Persist metadata

OUTPUT
    Updated Markdown properties
    Updated downstream views
    Updated interactive state

DOES NOT OWN
    Note creation
    Template generation
    Project orchestration
    Task management
    Kanban state
    Dashboard architecture
    Knowledge extraction
    Code editing
```

The resulting architecture is:

```text
                         USER
                           │
                           ▼
                        HEARTH
                           │
              ┌────────────┴────────────┐
              │                         │
        property interaction       creation action
              │                         │
              ▼                         ▼
          META BIND                 QUICKADD
              │                         │
              ▼                         ▼
         MARKDOWN                  TEMPLATER
         PROPERTIES                   │
              │                       ▼
              │                    MARKDOWN
              │                       │
              └──────────────┬────────┘
                             ▼
                    ┌─────────────────┐
                    │   VAULT STATE   │
                    └─────────────────┘
                       │      │      │
                       ▼      ▼      ▼
                    BASES  TASKNOTES KANBAN
                       │      │      │
                       └──────┼──────┘
                              ▼
                            HEARTH
```

Meta Bind is therefore the vault's interactive metadata layer. It provides controlled human interaction with established Markdown state while leaving creation, orchestration, task management, board management, querying, and presentation to the systems designed for those responsibilities.