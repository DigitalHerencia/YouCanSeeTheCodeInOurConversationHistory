# Obsidian Vault 

This is the implementation layer for the Obsidian system.

## System scope

The system uses PARA as the organizational foundation and Hearth as the UI layer.

The seven primary dashboards are:

1. Home
2. Command 
3. Project
4. Library
5. Code
6. ZettleKasten
7. Vault 

## Architecture

| Responsibility         | Source of truth      |
| ---------------------- | -------------------- |
| Durable organization   | PARA folders         |
| Daily record           | Daily Notes          |
| Tasks                  | TaskNotes            |
| Project documentation  | Project folders      |
| Structured views       | Bases                |
| Interactive properties | Meta Bind            |
| Guided creation        | QuickAdd             |
| Note generation        | Templater            |
| Dashboard composition  | Hearth               |
| Visual project flow    | Kanban               |
| Web capture            | Obsidian Web Clipper |
| Version control        | Obsidian Git         |
| Code workspace         | CodeSpace            |

A plugin may display or manipulate information owned by another layer, but it should not create a competing source of truth.

## Projects 

A project normally owns:

- Project Hub
- Project KanBan Board
- requirements/specifications
- decisions
- investigations
- implementation plans
- project notes

TaskNotes task records remain in the central task folder.
## Zettlekasten 

The ingestion area is a queue.

The intended lifecycle is:

Capture → Inbox → Triage → Resources

Processed material should not remain indefinitely in the Inbox.

## Code

Code Lab activities connect to real implementation.

Examples include:

- fetchers;
- actions;
- Stripe integrations;
- shared `cn` components;
- feature orchestration;
- production debugging.

Repository code remains in the repository. Markdown notes capture the learning, decisions, patterns, and evidence.

# Obsidian Vault Implementation Guide

This document is the operational implementation guide for the approved Obsidian vault architecture.

It assumes the template files have already been generated and focuses on:

- exact folder placement;
- Obsidian configuration;
- plugin configuration;
- template wiring;
- task wiring;
- Bases;
- Meta Bind;
- QuickAdd;
- Note Toolbar;
- Hearth;
- Kanban;
- Web Clipper;
- Coding Lab;
- Git;
- testing;
- troubleshooting;
- rollback.

The implementation target is:

1. Home
2. Command Center
3. Project Command Center
4. Library
5. Coding Lab
6. Ingestion
7. Git & Vault Stats

---

# Architecture rules

Before configuring anything, establish these rules.

### Rule 1 — TaskNotes owns tasks

A task is one Markdown task record.

Do not create a second task record in:

- a project note;
- a Daily Note;
- Hearth;
- Kanban;
- a dashboard Base.

Those surfaces may display or link to the task.

### Rule 2 — Daily Notes own the daily record

Daily Notes are chronological records of work.

Do not create a separate daily note for every project.

A project can be referenced from the Daily Note and project tasks can be associated with the project.

### Rule 3 — Project folders own project documentation

Project-specific documents belong inside the project folder.

### Rule 4 — Bases is a view layer

Bases should expose existing Markdown properties.

Do not build a hidden database beside the Markdown notes.

### Rule 5 — Meta Bind is an interaction layer

Meta Bind changes properties through controls.

It should not become a database.

### Rule 6 — QuickAdd is the workflow launcher

QuickAdd handles guided creation and capture.

### Rule 7 — Templater generates notes

Templater handles template logic and prompts.

### Rule 8 — Hearth composes dashboards

Hearth should surface existing information.

It should not become another place where information has to be manually maintained.

### Rule 9 — Kanban is visual flow

Kanban is a project visualization layer.

TaskNotes remains the actionable task record.

### Rule 10 — Ingestion is temporary

Anything captured into the Inbox must eventually be:

- retained somewhere durable;
- converted into a task;
- attached to a project;
- archived;
- or discarded.

---
# Implementation

## Phase 1 — Establish the folders

Preserve the existing PARA structure where it already exists.

A practical target is:

```text
0.SYSTEM/
  Dashboards/
  State/
  Templates/
    Daily/
    Projects/
    Tasks/
    Knowledge/
    Ingestion/
    Coding Lab/
  Scripts/

1.PROJECTS/

2.AREAS/
  Coding Lab/

3.RESOURCES/
  Knowledge/
  Reference/

4.ARCHIVE/

5.TASKS/
  Tasks/

6.INGESTION/
  Inbox/
  Processed/

7.DAILY/
````

Do not create duplicate top-level folders if the existing vault already uses equivalent folders.

For example, if the vault already has:

```text
1.PROJECTS/
2.AREAS/
3.RESOURCES/
4.ARCHIVE/
```

keep those folders.

Only add the missing system-specific folders.

---
## Phase 2 — Properties

Open:

`Settings → Properties`

Ensure Properties is enabled.

The system intentionally uses a small metadata vocabulary.

Common properties are:

```yaml
type:
created:
status:
project:
tags:
```

Do not put every property on every note.

Properties exist because a workflow needs them.

Examples:

Project:

```yaml
---
type: project
created: 2026-09-24
status: active
---
```

Concept:

```yaml
---
type: concept
created: 2026-09-24
tags:
  - knowledge
---
```

Learning:

```yaml
---
type: learning
created: 2026-09-24
status: active
---
```

Task properties are controlled primarily through TaskNotes.

Obsidian Properties supports structured property types including text, lists, numbers, checkboxes, dates, date-times, and tags. When a property contains a note link, use the appropriate quoted link representation in YAML.

---

## Phase 2B — Daily Notes

Open:

`Settings → Daily notes`

Set:

Date format:

```text
YYYY-MM-DD
```

New file location:

```text
7.DAILY/
```

or the corresponding Daily folder in the existing vault.

Template:

Select the approved:

```text
Daily Note
```

template.

Do not create project-specific Daily Notes.

---

## Phase 3 — Templater

Open:

`Settings → Templater`

Set:

`Template folder location`

to:

```text
0.SYSTEM/Templates
```

If your actual template folder is elsewhere, use that path.

Templater supports a template folder, folder-based templates, and prompts/suggesters.

---

## Phase 4 — Template placement

Put the approved templates into:

```text
0.SYSTEM/Templates/
```

organized as:

```text
Daily/
  Daily Note
  Daily Standup
  Weekly Review

Projects/
  Project Hub
  Project Check-in
  Requirements - Feature Specification
  Decision Record
  Technical Investigation
  Implementation Plan

Tasks/
  Task
  Project Task Capture
  Board Setup

Knowledge/
  Concept Note
  Reference - Literature Note
  Evergreen Note
  Reading - Resource Note

Ingestion/
  Web Clipping
  Quick Capture
  AI Conversation
  Inbox Triage

Coding Lab/
  Skill Reference
  Implementation Exercise
  Mastery - Evidence Record
  Debugging - Learning Log
```

Use the actual filenames supplied in the existing template package.

Do not rename files unless necessary.

---
## Phase 5 — Automatic template insertion

Do not immediately enable global automatic template insertion.

First make manual template creation work.

Then, if desired, configure folder-specific templates.

Example:

```text
1.PROJECTS/
```

can automatically receive the Project Hub template.

The folder rule should not automatically create every possible document.

Use automation only where the behavior is deterministic.

Templater supports folder templates and applies the most-specific applicable rule.

---

## Phase 6 — Daily Notes

Create today's Daily Note.

Verify:

```text
7.DAILY/YYYY-MM-DD.md
```

or the equivalent path.

Check:

- correct date;
    
- correct template;
    
- expected headings;
    
- expected properties;
    
- no project-specific Daily Note.

The Daily Note is the canonical daily record.

The Daily Standup template is a workflow document, not a replacement for the Daily Note.

The Weekly Review template is a review document, not a replacement for either.

---

## Phase 7 — TaskNotes

Open:

`Settings → TaskNotes`

TaskNotes should use a central task folder.

Recommended:

```text
5.TASKS/Tasks
```

If the existing vault has another canonical task folder, use it consistently.

TaskNotes uses one Markdown note per task and supports structured task frontmatter. Its current documentation also integrates task views with Bases.

---

## Phase 8 — Task properties

Use the TaskNotes property configuration rather than inventing a parallel task schema.

The representative record is:

```yaml
---
tags:
  - task
title: Example task
status: todo
priority: normal
due:
scheduled:
projects:
  - "[[Example Project]]"
---
```

The exact accepted status and priority values should come from the values configured in your TaskNotes installation.

TaskNotes documentation currently uses a `projects` property containing links to project notes.

---

## Phase 9 — QuickAdd

Open:

`Settings → QuickAdd`

Create these choices:

```text
Capture — Quick Capture
Capture — Project Task

Create — Project
Create — Project Document
Create — Decision Record
Create — Knowledge Note
Create — Learning Note
Create — Weekly Review

Process — Inbox Triage
```

QuickAdd provides Template, Capture, and Macro choices. Captures can write content or properties, while Macros can chain multiple operations.

---

## Phase 10 — Quick Capture

Create a Capture choice.

Purpose:

Capture a short item without building a full note.

Possible destination:

```text
6.INGESTION/Inbox
```

Use the supplied Quick Capture template where appropriate.

---

## Phase 11 — Project Task

Create a task-capture workflow.

Desired sequence:

```text
Prompt for task
      ↓
Select project
      ↓
Create TaskNotes task
      ↓
Open task or return to source
```

If the installed TaskNotes release exposes a supported QuickAdd integration, prefer it.

Do not manually maintain a second task schema if TaskNotes can perform the creation.

QuickAdd supports dynamic capture paths and property capture, making it appropriate for guided creation workflows.

---

## Phase 12 — New Project

Create a Macro.

Desired sequence:

```text
Prompt for project name
        ↓
Create project folder
        ↓
Create Project Hub
        ↓
Optionally create Project Board
        ↓
Open Project Hub
```

Project path:

```text
1.PROJECTS/<Project Name>/
```

Initial project contents:

```text
Project Name/
  Project Hub.md
  Project Board.md
```

---

## Phase 13 — Project Document

This choice should ask which document is needed.

Available document types:

```text
Project Check-in
Requirements / Feature Specification
Decision Record
Technical Investigation
Implementation Plan
```

The choice should then invoke the corresponding Templater template.

The destination should be inside the active project folder.

For example:

```text
1.PROJECTS/
  Example Project/
    Decisions/
      ADR - Example.md
```

or the exact folder convention established by the supplied templates.

---

## Phase 14 — Knowledge Note

Use a Template choice.

Available templates:

```text
Concept Note
Reference / Literature Note
Evergreen Note
Reading / Resource Note
```

The destination should be the appropriate durable resource location.

Do not route permanent knowledge into the ingestion queue unless it still requires triage.

---

## Phase 15 — Learning Note

Use a Template choice.

Available templates:

```text
Skill Reference
Implementation Exercise
Mastery / Evidence Record
Debugging / Learning Log
```

These belong to Coding Lab.

---

## Phase 16 — Bases

Open:

`Settings → Core plugins → Bases`

Create reusable Base views.

Recommended views:

```text
Active Projects
Open Tasks
Tasks by Project
Knowledge Index
Coding Lab
Ingestion Queue
```

Bases views can be configured in Obsidian and saved as `.base` files for reuse and embedding.

---
### Active Projects

Use the project folder and/or property structure as the filter.

A project note can have:

```yaml
---
type: project
status: active
---
```

The Base should return active project records.

Suggested columns:

```text
File
Status
Created
Project
Tags
```

Do not add properties solely to support this view if folder structure already supplies the distinction.

---

### Open Tasks

TaskNotes exposes task properties through Bases.

Common mappings include:

```text
note.status
note.priority
note.due
note.scheduled
note.projects
note.contexts
file.tags
file.tasks
```

TaskNotes' current Base integration documents these property mappings and supports filters/grouping through Bases.

Use:

```text
note.status
note.priority
note.due
note.projects
```

as the initial useful fields.

Filter out completed tasks.

Sort by:

1. due date;
    
2. priority;
    
3. project.

Adjust the exact filter syntax through the Base UI rather than assuming a query string from another version.

---

### Tasks by Project

Create a task view grouped by:

```text
note.projects
```

This provides project-level visibility without duplicating tasks.

The resulting conceptual structure is:

```text
Project A
  Task 1
  Task 2

Project B
  Task 3
  Task 4
```

The underlying files remain in:

```text
5.TASKS/Tasks/
```

---

### Knowledge Index

Use the minimal type property.

Example:

```text
type = concept
OR
type = reference
OR
type = evergreen
```

Do not add an artificial `database_id` or similar identifier.

The Markdown file itself is the record.

---

### Coding Lab

Filter on the Coding Lab location and/or types:

```text
skill
learning
evidence
debugging
```

Use whatever exact values the supplied templates establish.

Suggested fields:

```text
File
Type
Status
Project
Tags
Created
```

---

### Ingestion Queue

Filter:

```text
6.INGESTION/Inbox/
```

or equivalent.

Useful fields:

```text
File
Created
Type
Source
Status
Tags
```

Only unprocessed material should appear.

Processed items should leave the active queue.

---

## Phase 17 - Note Toolbar

Open:

`Settings → Note Toolbar`

Use it as the contextual action surface.

Note Toolbar supports commands, file/folder links, URIs, menus, groups, scripts, and display rules based on folders/properties.

---

### Global toolbar

Useful global actions:

```text
Home
Command Center
Project Command Center
Library
Coding Lab
Ingestion
Git & Vault Stats
```

Do not put every command into every toolbar.

---

### Project toolbar

Project-context toolbar:

```text
Project Hub
Project Board
New Task
Project Check-in
Decision
Investigation
Implementation Plan
```

Configure it so it appears only in project context.

Use folder/property display rules.

---

## Phase 18 - Hearth

Open Hearth.

Create seven dashboards:

```text
Home
Command Center
Project Command Center
Library
Coding Lab
Ingestion
Git & Vault Stats
```

Hearth is the composition layer. Its documented capabilities include multiple dashboards and dashboard cards/views for notes, Bases, Kanban, calendars, tasks, and related plugin views.

---

### Home

Purpose:

```text
Landing page
Navigation
Search
Identity
```

Keep this dashboard visually sparse.

Suggested sections:

```text
Search

Command Center
Project Command Center
Library
Coding Lab
Ingestion
Git & Vault Stats
```

Do not put task tables here.

---

### Command Center

Include:

```text
Today
Daily Note
Open Tasks
Due Soon
Scheduled Work
Daily Standup
Weekly Review
```

Use existing Bases/TaskNotes views.

Do not manually type today's tasks into the dashboard.

---

### Project Command Center

Desired sections:

```text
Selected Project
Project Summary

Project Tasks
Project Board
Project Schedule
Project Check-ins

Requirements
Decisions
Investigations
Implementation Plans
Project Notes
```

Build each component independently before embedding it.

---

### Library

Include:

```text
Graph
Backlinks
Tags
Bookmarks
Knowledge Index
Reference Index
```

The Library is for navigating and curating knowledge.

---

### Coding Lab

Include:

```text
Skill Tree
Current Skills
Implementation Exercises
Mastery / Evidence
Debugging Logs
Production Connections
```

Add links to relevant Books of Knowledge and repository implementation work.

---

### Ingestion

Include:

```text
Inbox
Unprocessed Clippings
Quick Capture
Inbox Triage
Processed
```

The Inbox view should contain only active material.

---

### Git & Vault Stats

Include:

```text
Git instructions
Commit
Sync
Repository status
Vault health
Useful property views
Recent changes
```

Keep this dashboard operational rather than decorative.

---

## Phase 19 - Projects 

A normal project can use:

```text
1.PROJECTS/
  Project Name/
    Project Hub.md
    Project Board.md
    Requirements/
    Decisions/
    Investigations/
    Implementation/
    Notes/
```

---

### Project Hub

The Project Hub is the project context layer.

It should expose:

```text
Project summary
Status
Objectives
Current focus
Key decisions
Open tasks
Board
Documentation
Notes
Check-ins
```

It should link to existing records.

It should not become a second task database.

---
### Kanban

Create a Kanban board from the project folder.

Use:

```text
Backlog
Next
In Progress
Blocked
Review
Done
```

Kanban provides a visual board/list/table surface, but do not treat its cards as a replacement for TaskNotes task records.

If the board cannot directly display TaskNotes records:

- keep project-level workflow cards on the board;
    
- link cards to TaskNotes records where needed;
    
- keep the actionable task record in TaskNotes.

Never create a second task database merely to make the Kanban look complete.

---

## Phase 20 - Web Clipper

Install the official Obsidian Web Clipper browser extension.

Configure capture destination:

```text
6.INGESTION/Inbox
```

Use the supplied clipping template.

Obsidian Web Clipper supports templates, variables, filters, properties, folders, and selected/highlighted content and saves captured material as Markdown.

---

### Web Clipper workflow

The intended flow is:

```text
Web page
   ↓
Web Clipper
   ↓
6.INGESTION/Inbox
   ↓
Inbox Triage
   ↓
Decision
 ┌─┼───────────────┐
 ↓ ↓               ↓
Resource Project   Task
 ↓   ↓              ↓
Library Project    TaskNotes

or:

Archive
or
Discard
```

Do not leave processed clippings in Inbox.

---

## Phase 21 - Inbox Triage

The Inbox Triage template should help decide:

```text
Keep?
Where does it belong?
Does it create a task?
Does it belong to a project?
Is it knowledge?
Is it reference material?
Should it be archived?
Should it be discarded?
```

The triage note is temporary workflow documentation.

Once processed, the durable information belongs in its proper location.

---

## Phase 22 - Coding Lab

Use the established Coding Lab location:

```text
2.AREAS/Coding Lab/
```

or the equivalent existing Area.

The four note types are:

```text
Skill Reference
Implementation Exercise
Mastery / Evidence Record
Debugging / Learning Log
```

---

### Skill Reference

Purpose:

Document a skill as a reusable technical reference.

Include:

```text
What it is
Why it matters
Core concepts
Patterns
Common mistakes
Production examples
Related skills
Evidence
```

---

### Implementation Exercise

Exercises should be production-oriented.

Examples:

```text
Build a fetcher
Implement an action
Add a Stripe integration
Create a reusable cn-based component
Orchestrate a feature
Debug a real integration
```

The point is to acquire transferable implementation skill.

Avoid generating a large catalog of toy exercises when production work can supply the evidence.

---

### Mastery / Evidence

Evidence should connect the skill to actual work.

Useful evidence:

```text
Repository path
Project
Implementation
PR/commit
Problem solved
What changed
What was learned
Remaining gaps
```

Do not duplicate repository source code into the vault.

---

### Debugging Log

Use this for real debugging.

Suggested structure:

```text
Problem
Symptoms
Context
Hypotheses
Tests
Evidence
Root cause
Fix
What changed
Reusable lesson
Related skill
```

A debugging log can link back to:

- project;
    
- task;
    
- Skill Reference;
    
- implementation evidence.

---

## Phase 23 - Obsidian Git

Install and enable Obsidian Git.

Initialize/connect the vault repository.

During initial implementation, use manual synchronization.

Obsidian Git supports source control operations including commit, pull, push, history, diffs, and commit-and-sync workflows.

---

### Initial workflow

Use:

```text
Make changes
    ↓
Review
    ↓
Commit
    ↓
Pull
    ↓
Push
```

Do not enable aggressive automatic synchronization while the architecture is still being built.

First establish a known-good commit.

---
### Git ignore policy

Review:

```text
.gitignore
```

Decide intentionally which Obsidian configuration should be versioned.

Do not blindly ignore all of `.obsidian/` if reproducible configuration is part of the objective.

At the same time, exclude volatile workspace/cache state when appropriate.

The repository should represent the intentional vault system, not transient application state.

---

## Phase 24 - Iconic and Callout Studio


Configure:

- icons;
    
- callout styles;
    
- visual hierarchy;
    
- dashboard navigation;
    
- heading consistency.

---
# Obsidian Vault Configuration Reference

## 1. Canonical responsibilities

| Layer | Responsibility |
|---|---|
| PARA | Durable organization |
| Daily Notes | Daily record |
| Templater | Note generation |
| QuickAdd | Guided workflows |
| TaskNotes | Task records |
| Bases | Structured views |
| Meta Bind | Interactive properties |
| Note Toolbar | Contextual actions |
| Hearth | Dashboard composition |
| Kanban | Visual project flow |
| Web Clipper | Web capture |
| Obsidian Git | Version control |
| Code Space / Codespaces | Code workspace |

---

## 2. Seven dashboards

```text
Home
Command
Projects
Library
Code
Zettlekasten
Vault
````

---

## 3. Folder model

```text
0.SYSTEM/
  Dashboards/
  State/
  Templates/
    Daily/
    Projects/
    Tasks/
    Knowledge/
    Ingestion/
    Coding Lab/
  Scripts/

1.PROJECTS/

2.AREAS/
  Coding Lab/

3.RESOURCES/
  Knowledge/
  Reference/

4.ARCHIVE/

5.TASKS/
  Tasks/

6.INGESTION/
  Inbox/
  Processed/

7.DAILY/
```

Adapt numbering to the existing vault if required.

---

## 4. Template families

### Daily

```text
Daily Note
Daily Standup
Weekly Review
```

### Projects

```text
Project Hub
Project Check-in
Requirements / Feature Specification
Decision Record
Technical Investigation
Implementation Plan
```

### Tasks

```text
Task
Project Task Capture
Board Setup
```

### Knowledge

```text
Concept Note
Reference / Literature Note
Evergreen Note
Reading / Resource Note
```

### Ingestion

```text
Web Clipping
Quick Capture
AI Conversation
Inbox Triage
```

### Coding Lab

```text
Skill Reference
Implementation Exercise
Mastery / Evidence Record
Debugging / Learning Log
```

---

## 5. Minimal metadata

Use only when relevant.

```yaml
type:
created:
status:
project:
tags:
```

Do not require every template to contain every property.

---

## 6. Project metadata

Representative:

```yaml
---
type: project
created: 2026-09-24
status: active
---
```

Folder placement is normally sufficient to establish project ownership.

---

## 7. Task metadata

Representative TaskNotes record:

```yaml
---
tags:
  - task
title: Example task
status: todo
priority: normal
due:
scheduled:
projects:
  - "[[Example Project]]"
---
```

Use the exact TaskNotes status and priority values configured in the installation.

---

## 8. TaskNotes property mappings

Common mappings:

```text
note.status
note.priority
note.due
note.scheduled
note.projects
note.contexts
file.tags
file.tasks
```

These are used when configuring Bases views.

Verify the installed TaskNotes version before treating any mapping as immutable.

---
## 9. Project structure

Normal:

```text
1.PROJECTS/
  Project Name/
    Project Hub.md
    Project Board.md
    Requirements/
    Decisions/
    Investigations/
    Implementation/
    Notes/
```

Minimum:

```text
1.PROJECTS/
  Project Name/
    Project Hub.md
```

Subfolders are created only when useful.

---

## 10. Kanban lanes

Default:

```text
Backlog
Next
In Progress
Blocked
Review
Done
```

Kanban is visual flow.

TaskNotes is actionable task storage.

---

## 11. QuickAdd choices

```text
Capture — Quick Capture
Capture — Project Task

Create — Project
Create — Project Document
Create — Decision Record
Create — Knowledge Note
Create — Learning Note
Create — Weekly Review

Process — Inbox Triage
```

---

## 12. QuickAdd responsibilities

### Capture

Small additions.

### Template

Simple note creation.

### Macro

Multi-step workflows.

Project creation is a Macro.

---

## 13. Project creation sequence

```text
Prompt project name
       ↓
Create project folder
       ↓
Create Project Hub
       ↓
Create Project Board 
       ↓
Open Project Hub
```


---

## 14. Project document sequence

```text
Project
  ↓
Project Document
  ↓
Select document type
  ↓
Apply Templater template
  ↓
Save inside project folder
```

Types:

```text
Project Check-in
Requirements / Feature Specification
Decision Record
Technical Investigation
Implementation Plan
```

---

## 15. Bases views

Required:

```text
Active Projects
Open Tasks
Tasks by Project
Knowledge Index
Coding Lab
Ingestion Queue
```

Optional:

```text
Recent Notes
Recently Modified Projects
Upcoming Deadlines
Learning by Status
```

Only add optional views when they solve a real workflow problem.

---

## 16. Active Projects Base

Primary discriminator:

```text
type = project
```

Secondary:

```text
status = active
```

Suggested fields:

```text
File
Status
Created
Tags
```

---

## 17. Open Tasks Base

Suggested fields:

```text
note.status
note.priority
note.due
note.scheduled
note.projects
```

Filter out completed tasks.

Sort:

```text
Due
Priority
Project
```

---

## 18. Tasks by Project Base

Group:

```text
note.projects
```

The task files remain in:

```text
5.TASKS/Tasks/
```

---

## 19. Knowledge Base

Possible types:

```text
concept
reference
evergreen
reading
```

Use the exact values established by the supplied templates.

---

## 20. Coding Lab Base

Possible types:

```text
skill
exercise
evidence
debugging
```

Suggested fields:

```text
File
Type
Status
Project
Tags
Created
```

---

## 21. Ingestion Base

Scope:

```text
6.INGESTION/Inbox/
```

Only active/unprocessed items.

---

## 22. Meta Bind

Primary purpose:

Interactive property editing.

Initial proof:

```text
selected_project
```

Target:

```text
0.SYSTEM/State/Project Dashboard State.md
```

Success condition:

Changing the control changes and persists the frontmatter value.

---

## 23. Note Toolbar

### Global

```text
Home
Command Center
Project Command Center
Library
Coding Lab
Ingestion
Git & Vault Stats
```

### Project

```text
Project Hub
Project Board
New Task
Project Check-in
Decision
Investigation
Implementation Plan
```

Use folder/property rules.

---

## 25. Hearth — Home

```text
Navigation
Search
Identity
```

Sparse.

---

## 26. Hearth — Command Center

```text
Today
Daily Note
Open Tasks
Due Soon
Scheduled Work
Daily Standup
Weekly Review
```

---

## 27. Hearth — Project Command Center

```text
Project Selector
Selected Project
Project Summary
Project Tasks
Project Board
Project Schedule
Project Check-ins
Requirements
Decisions
Investigations
Implementation Plans
Project Notes
```

---

## 28. Hearth — Library

```text
Graph
Backlinks
Tags
Bookmarks
Knowledge Index
Reference Index
```

---

## 29. Hearth — Coding Lab

```text
Skill Tree
Current Skills
Implementation Exercises
Mastery / Evidence
Debugging
Production Connections
```

---

## 30 Hearth — Ingestion

```text
Inbox
Unprocessed Clippings
Quick Capture
Inbox Triage
Processed
```

---

## 31. Hearth — Git & Vault Stats

```text
Git instructions
Commit
Sync
Repository status
Vault health
Recent changes
Useful views
```

---

## 32. Web Clipper

Destination:

```text
6.INGESTION/Inbox
```

Workflow:

```text
Capture
  ↓
Inbox
  ↓
Triage
  ↓
Durable home
Task
Archive
Discard
```

---

## 33. Coding Lab location

Recommended:

```text
2.AREAS/Coding Lab/
```

---

## 34. Coding Lab types

```text
Skill Reference
Implementation Exercise
Mastery / Evidence Record
Debugging / Learning Log
```

---

## 35. Coding Lab evidence

Evidence should connect to real implementation.

Examples:

```text
Fetcher
Action
Stripe integration
cn component
Feature orchestration
Production debugging
```

---

## 36. Git

Initial mode:

```text
Manual
```

Workflow:

```text
Review
  ↓
Commit
  ↓
Pull
  ↓
Push
```

Do not enable aggressive automatic synchronization until the vault is stable.

---

## 37. Visual plugins

Configure last:

```text
Iconic
Callout Studio
Hearth styling
```

---

# Obsidian Checklist

## 0. Backup

- [ ] Full vault backup exists.
- [ ] Backup is independent of the working vault.
- [ ] Backup can be reopened.
- [ ] Existing notes are not being overwritten.
- [ ] Existing folder structure has been preserved.
- [ ] Current Git state is known.

---

## 1. Core Obsidian

- [ ] Daily Notes enabled.
- [ ] Properties enabled.
- [ ] Bases enabled.
- [ ] Search works.
- [ ] Backlinks work.
- [ ] Bookmarks work.
- [ ] Graph view works.
- [ ] Attachment destination is correct.

---

## 2. Folder structure

- [ ] System folder exists.
- [ ] Template folder exists.
- [ ] State folder exists.
- [ ] Projects folder exists.
- [ ] Tasks folder exists.
- [ ] Ingestion folder exists.
- [ ] Daily folder exists.
- [ ] Coding Lab location exists.
- [ ] Existing PARA folders remain intact.

---

## 3. Templater

- [ ] Templater enabled.
- [ ] Template folder is correct.
- [ ] Daily Note generates.
- [ ] Daily Standup generates.
- [ ] Weekly Review generates.
- [ ] Project Hub generates.
- [ ] Project Check-in generates.
- [ ] Feature Specification generates.
- [ ] Decision Record generates.
- [ ] Technical Investigation generates.
- [ ] Implementation Plan generates.
- [ ] Task generates.
- [ ] Project Task Capture generates.
- [ ] Concept Note generates.
- [ ] Reference Note generates.
- [ ] Evergreen Note generates.
- [ ] Reading Note generates.
- [ ] Web Clipping generates.
- [ ] Quick Capture generates.
- [ ] AI Conversation generates.
- [ ] Inbox Triage generates.
- [ ] Skill Reference generates.
- [ ] Implementation Exercise generates.
- [ ] Mastery/Evidence generates.
- [ ] Debugging Log generates.
- [ ] Prompts appear.
- [ ] Prompt values persist.
- [ ] No raw Templater syntax remains.

---

## 4. Daily Notes

- [ ] Daily Note uses the approved template.
- [ ] Date format is correct.
- [ ] Daily Note lands in the correct folder.
- [ ] No duplicate project Daily Note is created.
- [ ] Project tasks can be associated from the Daily Note workflow.

---

## 5. TaskNotes

- [ ] TaskNotes enabled.
- [ ] Central task folder configured.
- [ ] Task note can be created.
- [ ] Task has status.
- [ ] Task has priority.
- [ ] Task has due date where required.
- [ ] Task has scheduled date where required.
- [ ] Task has project link where required.
- [ ] Task is recognized by TaskNotes.
- [ ] Task appears in TaskNotes list.
- [ ] Changing project changes project association.
- [ ] Completed tasks can be filtered.
- [ ] No duplicate task record exists elsewhere.

---

## 6. Project integration

Create a test project:

```text
Test Project
````

Verify:

-  Project folder exists.
    
-  Project Hub exists.
    
-  Project Board exists where intended.
    
-  Project has correct type/status.
    
-  Project task points to the project.
    
-  Project Base finds the project.
    
-  Task Base finds the project task.
    
-  Tasks by Project groups the task correctly.

---

## 7. QuickAdd

-  Quick Capture works.
    
-  Project Task works.
    
-  New Project works.
    
-  New Project Document works.
    
-  Decision Record works.
    
-  Knowledge Note works.
    
-  Learning Note works.
    
-  Weekly Review works.
    
-  Inbox Triage works.

---

## 8. QuickAdd — project creation

Run New Project.

Verify:

-  Project name prompt appears.
    
-  Project folder is created.
    
-  Project Hub is created.
    
-  Project Board is created only if intended.
    
-  Project Hub opens.
    
-  No unnecessary launch documentation is generated.
    
-  No duplicate project is created.

---

## 9. Meta Bind

-  Meta Bind enabled.
    
-  Test input is visible.
    
-  Input changes frontmatter.
    
-  Property persists after reopening.
    
-  Invalid values are prevented or handled appropriately.

---

## 10. Note Toolbar

-  Global toolbar appears where intended.
    
-  Project toolbar appears in project context.
    
-  Project Hub command works.
    
-  Project Board command works.
    
-  New Task command works.
    
-  Project Check-in command works.
    
-  Decision command works.
    
-  Investigation command works.
    
-  Implementation Plan command works.
    
-  Dashboard links work.
    
-  Irrelevant commands are not shown everywhere.

---

## 11. Bases

### Active Projects

-  Returns projects.
    
-  Excludes irrelevant notes.
    
-  Status filtering works.

### Open Tasks

-  Returns active tasks.
    
-  Excludes completed tasks.
    
-  Due date displays correctly.
    
-  Project displays correctly.

### Tasks by Project

-  Tasks group correctly.
    
-  Unassigned tasks remain visible where intended.

### Knowledge

-  Concept notes appear.
    
-  Reference notes appear.
    
-  Evergreen notes appear.
    
-  Reading/resource notes appear.

### Coding Lab

-  Skill notes appear.
    
-  Exercise notes appear.
    
-  Evidence notes appear.
    
-  Debugging notes appear.

### Ingestion

-  Inbox items appear.
    
-  Processed items are excluded.
    
-  Archive items are excluded.

---

## 12. Hearth

### Home

-  Dashboard opens.
    
-  Navigation works.
    
-  Search works.

### Command Center

-  Daily Note visible.
    
-  Open Tasks visible.
    
-  Due work visible.
    
-  Standup link works.
    
-  Weekly Review link works.

### Project Command Center

-  Project context opens.
    
-  Project summary works.
    
-  Tasks appear.
    
-  Board opens.
    
-  Documentation links work.
    
-  Check-in context works.
    
-  Project selector proof passes or fallback is documented.

### Library

-  Graph works.
    
-  Backlinks work.
    
-  Tags work.
    
-  Bookmarks work.
    
-  Knowledge Base works.

### Coding Lab

-  Skill view works.
    
-  Exercise view works.
    
-  Evidence view works.
    
-  Debugging view works.

### Ingestion

-  Inbox visible.
    
-  Clippings visible.
    
-  Triage available.
    
-  Processed area accessible.

### Git & Vault Stats

-  Git instructions visible.
    
-  Repository workflow documented.
    
-  Vault health views work.

---

## 14. Kanban

-  Project Board opens.
    
-  Backlog lane exists.
    
-  Next lane exists.
    
-  In Progress lane exists.
    
-  Blocked lane exists.
    
-  Review lane exists.
    
-  Done lane exists.
    
-  Cards can move.
    
-  Board is stored in the project folder.
    
-  Actionable tasks remain TaskNotes records.
    
-  No second task database exists.

---

## 15. Web Clipper

-  Browser extension installed.
    
-  Capture works.
    
-  Capture destination is Inbox.
    
-  Template is applied.
    
-  Source information is retained.
    
-  Selected/highlighted content behaves as intended.
    
-  Captured note appears in Ingestion Base.

---

## 16. Ingestion

Run:

```text
Capture
  ↓
Inbox
  ↓
Triage
```

Verify every disposition works:

-  Durable resource.
    
-  Project note.
    
-  Task.
    
-  Archive.
    
-  Discard.

Then verify:

-  Processed item leaves active Inbox.
    
-  No duplicate permanent clipping library is created.

---

## 17. Coding Lab

-  Skill Reference opens.
    
-  Implementation Exercise opens.
    
-  Mastery/Evidence opens.
    
-  Debugging Log opens.
    
-  Skill can link to production work.
    
-  Evidence can reference repository implementation.
    
-  Repository source code is not duplicated into the vault unnecessarily.

---

## 18. Git

-  Repository exists.
    
-  Vault is connected.
    
-  Initial known-good commit exists.
    
-  Commit works.
    
-  Pull works.
    
-  Push works.
    
-  Restore from Git is understood.
    
-  `.gitignore` is intentional.
    
-  Automatic sync is not causing unwanted churn.

---

# Final completion checklist

## Architecture

-  PARA remains the organizational foundation.
    
-  Seven dashboards exist.
    
-  Sources of truth remain distinct.
    
-  No unnecessary plugin has been added.

## Daily workflow

-  Daily Note works.
    
-  Daily Standup works.
    
-  Weekly Review works.

## Projects

-  Project creation works.
    
-  Project Hub works.
    
-  Project Board works.
    
-  Project documentation works.
    
-  Project tasks associate correctly.

## Tasks

-  TaskNotes is the only actionable task source of truth.
    
-  Bases exposes tasks.
    
-  Project grouping works.

## Knowledge

-  Library works.
    
-  Knowledge Base works.
    
-  Backlinks work.
    
-  Graph works.
    
-  Tags work.
    
-  Bookmarks work.

## Coding Lab

-  Skill Reference works.
    
-  Implementation Exercise works.
    
-  Mastery/Evidence works.
    
-  Debugging Log works.
    
-  Production evidence can be linked.

## Ingestion

-  Web Clipper works.
    
-  Quick Capture works.
    
-  Inbox works.
    
-  Triage works.
    
-  Processed items leave Inbox.

## Interaction

-  Meta Bind works.
    
-  Note Toolbar works.
    
-  QuickAdd works.

## Dashboards

-  Home works.
    
-  Command Center works.
    
-  Project Command Center works.
    
-  Library works.
    
-  Coding Lab works.
    
-  Ingestion works.
    
-  Git & Vault Stats works.

## Version control

-  Git works.
    
-  Commit works.
    
-  Pull works.
    
-  Push works.
