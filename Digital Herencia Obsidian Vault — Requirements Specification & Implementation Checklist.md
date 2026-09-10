# Digital Herencia Obsidian Vault
## Requirements Specification & Implementation Checklist

**Document status:** Implementation baseline  
**System:** Personal Obsidian knowledge, learning, project-management, writing, and development environment  
**Repository:** `DigitalHerencia/YouCanSeeTheCodeInOurConversationHistory-`  
**Primary organizational model:** PARA  
**Primary user interface:** Hearth  
**Primary design objective:** A visually distinctive, low-friction personal workspace that is useful enough and attractive enough to use every day.

---

# 1. Product Objective

The vault SHALL function as a personal operating environment rather than merely a collection of Markdown files.

The finished vault MUST provide an integrated way to:

- capture unstructured thoughts quickly;
- take and organize durable notes;
- develop connected knowledge;
- preserve useful AI conversations and external clippings;
- manage projects, milestones, phases, and tasks;
- maintain a daily work cadence;
- track habits and recurring progress;
- study TypeScript and the modern application stack;
- perform stack-syntax writing drills;
- maintain reusable prompts;
- maintain reusable project, design, engineering, operations, marketing, and business resources;
- browse and edit external software repositories;
- perform ordinary Git operations;
- visually navigate the system without relying primarily on folder names;
- search and recover information;
- archive inactive information through one consistent mechanism;
- provide these functions through polished dashboards and contextual controls instead of requiring constant manual YAML editing or command-palette use.

The product SHALL optimize for **actual daily usability** over conceptual purity.

A technically valid implementation that is confusing, visually poor, unnecessarily complicated, or unpleasant to use SHALL NOT be considered complete.

---

# 2. Normative Language

Within this specification:

**MUST / SHALL** means the requirement is mandatory.

**MUST NOT / SHALL NOT** means the behavior is prohibited.

**SHOULD** means the implementation is strongly preferred unless testing establishes a better solution.

**MAY** means the implementation is optional.

Every subsystem SHALL have an observable acceptance test before it is considered complete.

---

# 3. Governing Design Principles

## REQ-GEN-001 — Low Friction

Common operations MUST require as little navigation and manual metadata editing as practical.

Common operations include:

- capturing an idea;
- creating a project;
- creating a task;
- creating a daily note;
- creating a clipping;
- preserving an AI conversation;
- creating a study/drill entry;
- changing status;
- updating progress;
- archiving/unarchiving;
- opening the relevant dashboard.

## REQ-GEN-002 — One Owner Per Kind of State

A fact SHALL have one authoritative owner.

Examples:

- filesystem category → PARA;
- archive state → `archived`;
- task state → TaskNotes;
- project visual planning → Kanban;
- classification → tags;
- operational metadata → properties;
- note-generation automation → Templater;
- universal capture entry point → QuickAdd;
- primary dashboard experience → Hearth.

Two plugins MUST NOT maintain independent copies of the same lifecycle state.

## REQ-GEN-003 — Interface Before Configuration

Where a user-facing control is practical, routine operations SHOULD be performed through buttons, toggles, selects, sliders, menus, dashboards, or commands rather than manual YAML modification.

## REQ-GEN-004 — Portable Markdown

The underlying knowledge MUST remain ordinary Obsidian-compatible Markdown wherever possible.

Plugins SHOULD enhance the Markdown rather than make the vault unintelligible without the plugins.

## REQ-GEN-005 — Personal, Not Corporate

Material transplanted from Notion MUST be adapted for a single-person Digital Herencia workspace.

Fake organizational structure SHALL be removed when it provides no personal utility.

Examples to remove or simplify:

- fictional departments;
- fake employee directories;
- fake Slack channels;
- fake distribution lists;
- artificial approval chains;
- redundant team bureaucracy.

The useful workflow contained inside those systems MUST be preserved.

## REQ-GEN-006 — No Emoji-Based Semantic UI

Emoji MUST NOT be the primary semantic icon system.

Lucide/Iconic/plugin icons SHOULD provide navigation and semantic meaning.

Emoji appearing in source Notion templates SHALL NOT automatically be copied into the Obsidian implementation.

---

# 4. Repository Reform

## REQ-REP-001 — Isolated Development

Major vault reconstruction SHALL begin on a dedicated Git branch.

Changes MUST NOT initially destroy the known-good default branch.

## REQ-REP-002 — Build Cleanly

The new architecture SHALL be constructed intentionally rather than incrementally preserving obsolete folder systems.

Old material MAY be scavenged, but old architecture SHALL NOT control the new architecture.

## REQ-REP-003 — Mandatory Preservation

The following existing material MUST be preserved:

`CIGARETTES, REGRETS, & NEURAL NETS/`

`ZETTLECASTEN/`

`assets/`

Preservation means original user content SHALL NOT be discarded as part of structural cleanup.

## REQ-REP-004 — Asset Reuse

Existing images under `assets/` SHOULD be evaluated and reused for:

- Hearth backgrounds;
- logos;
- visual identity;
- covers;
- dashboard presentation.

Digital Herencia assets SHALL take precedence over generic decorative imagery when appropriate.

## REQ-REP-005 — Legacy Scavenging

The old `obsidian/` content MUST be examined for reusable:

- templates;
- snippets;
- CSS;
- metadata conventions;
- commands;
- plugin configuration;
- notes;
- dashboard concepts;
- scripts.

Useful material MAY be incorporated.

Obsolete architecture MUST NOT be retained merely because it already exists.

---

# 5. Information Architecture

## REQ-IA-001 — PARA Is Primary

PARA SHALL be the principal filesystem classification system.

Canonical categories:

`1.PROJECTS/`

`2.AREAS/`

`3.RESOURCES/`

`4.ARCHIVE/`

## REQ-IA-002 — Project Definition

A Project SHALL represent an active, finite outcome with a meaningful completion condition.

Examples include:

- shipping a software feature;
- completing a portfolio artifact;
- completing a learning program;
- producing a campaign;
- finishing a creative work.

## REQ-IA-003 — Area Definition

An Area SHALL represent an ongoing responsibility, practice, or domain without a defined completion date.

## REQ-IA-004 — Resource Definition

A Resource SHALL represent reusable information, knowledge, reference material, infrastructure, templates, prompts, or subject matter.

## REQ-IA-005 — Archive Definition

Archive SHALL contain inactive material formerly belonging to Projects, Areas, or Resources.

Archive SHALL represent lifecycle state rather than a new information taxonomy.

## REQ-IA-006 — Workflow Directories

Special workflow directories MAY exist outside PARA when they provide an active function rather than a competing classification system.

Required workflow domains are:

- `AMOEBA`
- `DAILY`
- `HABITS`
- `HEARTH`
- `ZETTLECASTEN`
- `SYSTEM`

These directories SHALL NOT create competing definitions of Project, Area, Resource, or Archive.

## REQ-IA-007 — PARA Classification by Location

A note's PARA category SHOULD normally be inferred from filesystem location.

A redundant `para: project`, `para: area`, etc. property SHOULD NOT be required merely to restate the folder containing the note.

---

# 6. Metadata Model

## REQ-META-001 — Properties Own Operational State

Properties SHALL be reserved primarily for machine-readable operational facts such as:

- status;
- phase;
- progress;
- priority;
- due date;
- scheduled date;
- completion date;
- archive state;
- project relationship;
- parent relationship;
- configuration required by a plugin;
- created/updated metadata where applicable.

## REQ-META-002 — Tags Own Classification

Tags SHALL be used for classification, grouping, filtering, discovery, and search.

Example facets MAY include:

- `type/*`
- `domain/*`
- `topic/*`
- `stack/*`
- `source/*`

## REQ-META-003 — No Lifecycle Tags

Operational state MUST NOT be duplicated with tags.

Prohibited examples include using both:

`status: done`

and:

`#done`

to represent the same fact.

## REQ-META-004 — Archive Property

There SHALL be exactly one canonical archive-state property:

`archived`

Its value SHALL be Boolean.

`archived: false` means active/current.

`archived: true` means archived/inactive.

A separate `active` property SHALL NOT be required.

## REQ-META-005 — Archive Toggle

Meta Bind SHALL expose archive/unarchive as one toggle wherever archive controls are appropriate.

No other plugin SHALL independently invent another archive-state field.

## REQ-META-006 — Created and Updated Metadata

Where useful, notes SHOULD maintain:

`created`

`updated`

These values are metadata, not competing lifecycle states.

## REQ-META-007 — Folder Archiving

Because ordinary folders do not contain YAML properties, folder-level archival SHALL be expressed through movement into `4.ARCHIVE`, not through pretending directories themselves possess note properties.

---

# 7. Visual Design System

## REQ-VIS-001 — Community Theme Foundation

The vault SHALL use a maintained Obsidian community theme as its visual foundation.

Custom visual modes SHALL be implemented primarily through CSS snippets layered over that theme.

## REQ-VIS-002 — Required Visual Directions

The system SHALL support exploration of these visual modes:

1. Retro
2. Terminal
3. Dark
4. Vaporwave
5. Neo Modern
6. Hyper Maximal
7. Minimalist

## REQ-VIS-003 — Shared Foundation

A common core CSS layer SHOULD contain behavior shared across all visual modes.

Individual mode snippets SHALL contain style-specific overrides.

## REQ-VIS-004 — Mode Isolation

Visual modes SHOULD be switchable without manually rewriting core CSS.

Normally only one major visual-mode snippet SHOULD be active at a time.

## REQ-VIS-005 — Digital Herencia Identity

The system SHOULD visibly use Digital Herencia identity and assets.

The primary Home experience SHALL NOT look like stock Obsidian.

## REQ-VIS-006 — Readability

Decorative styling MUST NOT reduce:

- text legibility;
- code legibility;
- navigation clarity;
- control visibility;
- contrast;
- information hierarchy.

## REQ-VIS-007 — Visual Acceptance

Every major dashboard MUST be visually reviewed in the actual Obsidian application.

Configuration-file correctness alone SHALL NOT constitute design acceptance.

---

# 8. Hearth — Primary Application Shell

## REQ-HEARTH-001 — Primary Interface

Hearth SHALL be the primary dashboard/interface layer.

The vault SHOULD be operable primarily through Hearth, contextual controls, QuickAdd, and ordinary Obsidian navigation rather than continual filesystem browsing.

## REQ-HEARTH-002 — Required Dashboards

The final system SHALL provide at least these Hearth dashboards:

- Home
- Library
- Learning
- Projects
- Git

The content may use embedded notes, Bases, plugin-native cards, command cards, statistics, search, links, and other Hearth-native capabilities.

## REQ-HEARTH-003 — Home Dashboard

Home SHALL be the Digital Herencia primary landing experience.

It MUST include:

- Digital Herencia title;
- Digital Herencia logo/icon where practical;
- Digital Herencia desert background;
- search;
- important navigation;
- high-value quick actions;
- useful current-work information.

The composition SHOULD be centered and visually balanced.

The page SHOULD fit within the normal viewport without requiring page-level vertical scrolling.

## REQ-HEARTH-004 — Library Dashboard

Library SHALL provide access to reusable knowledge and resources.

It SHOULD surface:

- Resources;
- Zettelkasten knowledge;
- Prompt Library;
- reusable modules;
- reusable templates;
- recent or useful reference material;
- useful filtered Bases views.

## REQ-HEARTH-005 — Learning Dashboard

Learning SHALL combine and reinterpret the useful structure from:

- Computer Science Student Dashboard;
- LeetCode Blind 75 Tracker;
- DSA and LeetCode Journal.

It SHALL be transformed into a TypeScript and Stack Syntax learning environment.

## REQ-HEARTH-006 — Projects Dashboard

Projects SHALL surface active work.

It SHOULD provide:

- active projects;
- current phases;
- progress;
- task state;
- milestones/workstreams;
- due or scheduled work;
- project creation;
- task creation;
- access to full TaskNotes views;
- access to project Kanban planning.

## REQ-HEARTH-007 — Git Dashboard

Git SHALL have a dedicated Hearth dashboard.

It SHALL surface, where supported:

- repository status;
- branch;
- changed files;
- commit controls;
- pull/fetch controls;
- push controls;
- recent history;
- vault statistics;
- contribution/activity/streak-style visualization.

It SHOULD use Git-oriented icons and visual language.

The dashboard MUST be laid out to fit the viewport without page-level scrolling under the normal target window size.

Long histories SHALL be limited rather than making the entire dashboard vertically enormous.

## REQ-HEARTH-008 — Fast Dashboard Switching

Switching between the major dashboards SHALL require minimal interaction.

---

# 9. Amoeba Scratch Workflow

## REQ-AMO-001 — Purpose

Amoeba SHALL be the frictionless scratch-note system.

It SHALL accept incomplete, messy, provisional, and uncategorized thoughts.

## REQ-AMO-002 — Capture Speed

Creating an Amoeba note SHOULD require:

1. invoke capture;
2. type a title or thought;
3. begin writing.

No PARA classification decision SHOULD be required at capture time.

## REQ-AMO-003 — Refactoring

Amoeba notes SHALL expose Note Refactor tools through the contextual Note Toolbar.

Useful portions SHOULD be extractable into separate notes.

## REQ-AMO-004 — Promotion

An Amoeba note SHALL have an understandable path for promotion into:

- Project;
- Area;
- Resource;
- Zettelkasten knowledge.

Promotion SHOULD not require copy/paste reconstruction.

---

# 10. Zettelkasten

## REQ-ZET-001 — Purpose

Zettelkasten SHALL be used for durable connected knowledge rather than general project management.

## REQ-ZET-002 — Clippings

A dedicated clipping workflow SHALL exist for information originating from:

- articles;
- books;
- websites;
- PDFs;
- documentation;
- other external sources.

A clipping SHOULD preserve enough source context to recover where the information came from.

## REQ-ZET-003 — AI Threads

A dedicated AI-thread workflow SHALL exist for useful ChatGPT/Codex/AI conversations worth retaining.

The system SHALL NOT require every AI interaction to become a durable note.

## REQ-ZET-004 — Knowledge Development

Clippings and transcripts MAY be transformed into smaller durable knowledge notes.

Backlinks and links SHOULD be used to build relationships among useful concepts.

## REQ-ZET-005 — Classification

Zettelkasten classification SHOULD use tags and links rather than a large nested folder taxonomy.

---

# 11. Daily Notes and Scrum Cadence

## REQ-DAY-001 — Daily Notes

Daily Notes SHALL provide the recurring operational log.

## REQ-DAY-002 — Date Structure

Daily notes SHOULD use deterministic chronological storage.

Preferred hierarchy:

`DAILY/YYYY/YYYY-MM/YYYY-MM-DD.md`

## REQ-DAY-003 — Scrum-Inspired Cadence

The Daily template SHOULD support a lightweight personal cadence derived from Scrum concepts without pretending a one-person vault is a Scrum organization.

Useful sections MAY include:

- focus / objective;
- work planned;
- work completed;
- blockers;
- decisions;
- notes;
- learning;
- follow-up;
- links to active projects.

## REQ-DAY-004 — No Duplicate Task System

Daily Notes MAY display or reference tasks.

Daily Notes SHALL NOT become a second authoritative task database.

---

# 12. Habits and Accountability

## REQ-HAB-001 — Habit Tracking

The vault SHALL provide a lightweight habit/accountability system.

## REQ-HAB-002 — Learning Habit Integration

Learning-related habits MAY include:

- TypeScript study;
- stack-syntax drills;
- side-project work;
- reading;
- other intentionally selected recurring practices.

## REQ-HAB-003 — Progress Visibility

Habit history SHOULD be visible through a compact interface suitable for the Learning or Home dashboard.

## REQ-HAB-004 — Minimal Maintenance

The habit system MUST NOT require extensive daily metadata administration.

---

# 13. QuickAdd — Universal Creation Entry Point

## REQ-QA-001 — Purpose

QuickAdd SHALL be the primary universal capture/create launcher.

## REQ-QA-002 — Required Choices

QuickAdd SHALL expose at least:

- Amoeba Capture;
- New Project;
- New Task;
- Zettelkasten Clipping;
- AI Thread;
- Stack Syntax Drill.

Additional choices MAY be added only when they represent recurring workflows.

## REQ-QA-003 — Correct Delegation

QuickAdd SHALL delegate to the authoritative subsystem where appropriate.

Example:

**New Task → TaskNotes**

QuickAdd SHALL NOT independently create a conflicting task model.

## REQ-QA-004 — Universal Shortcut

A single convenient keyboard shortcut SHOULD open the primary QuickAdd menu.

---

# 14. Templater

## REQ-TPL-001 — Folder-Aware Templates

Templater SHALL provide templates mapped to appropriate workflow folders.

## REQ-TPL-002 — Dynamic Context

Templates MAY use JavaScript helpers to retrieve contextual information such as:

- current date/time;
- current project;
- related project;
- related notes;
- relevant paths;
- reusable metadata;
- other deterministic project context.

## REQ-TPL-003 — Automation With Purpose

Templater logic MUST solve an actual repetitive action.

JavaScript SHALL NOT be added merely because Templater supports JavaScript.

## REQ-TPL-004 — No Task Ownership

TaskNotes SHALL own creation of TaskNotes tasks.

Templater SHALL NOT compete with TaskNotes as a second task creator.

## REQ-TPL-005 — Required Template Families

At minimum, template support SHOULD exist for:

- Project;
- Area;
- Resource;
- Daily;
- Amoeba;
- Zettelkasten Clipping;
- AI Thread;
- Stack Syntax Drill;
- Campaign Brief;
- OKR;
- other accepted reusable Notion-derived templates.

---

# 15. TaskNotes

## REQ-TASK-001 — Canonical Task Model

TaskNotes SHALL be the sole authoritative model for actionable tasks.

## REQ-TASK-002 — Task Storage

Tasks SHOULD be stored in a predictable location such as:

`1.PROJECTS/_Tasks/`

## REQ-TASK-003 — Required Task State

The task model SHALL support a coherent status lifecycle.

Initial target statuses:

- Backlog
- Ready
- In Progress
- Blocked
- Done
- Cancelled

## REQ-TASK-004 — Task Metadata

Tasks SHOULD support:

- title;
- status;
- priority;
- project relationship;
- scheduled date;
- due date;
- completion date;
- relevant tags/classification;
- optional parent/subtask relationships.

## REQ-TASK-005 — Project Relationships

A task MUST be capable of belonging to a Project.

A Project MUST be able to display only the tasks related to that Project.

## REQ-TASK-006 — Global Views

The system SHOULD provide useful global TaskNotes views including:

- board;
- open tasks;
- calendar/scheduled work where useful;
- relationships;
- completed tasks.

## REQ-TASK-007 — Completion

Completing a task SHOULD update its completion metadata automatically where TaskNotes supports it.

---

# 16. Kanban

## REQ-KAN-001 — Project Planning

Kanban SHALL provide visual project-management surfaces.

## REQ-KAN-002 — Planning Concepts

Kanban SHALL support representation of:

- milestones;
- phases;
- workstreams;
- major deliverables;
- project flow;
- task links where useful.

## REQ-KAN-003 — No Competing Task Database

A Kanban checkbox/card MUST NOT independently become the canonical task record when a corresponding TaskNotes task exists.

TaskNotes SHALL own task state.

Kanban SHALL own visual project planning.

## REQ-KAN-004 — Project Board

Projects that benefit from visual planning SHOULD have an associated board or equivalent project-planning surface.

---

# 17. Bases

## REQ-BASE-001 — Structured Views

Obsidian Bases SHOULD provide queryable views over Markdown properties.

## REQ-BASE-002 — Required View Domains

Bases SHOULD support useful views for:

- Projects;
- Tasks;
- Library/Resources;
- Learning;
- Archive;
- project-specific tasks;
- Notion-derived structured modules where appropriate.

## REQ-BASE-003 — Contextual Views

A Project SHOULD be capable of embedding a Base that returns only records related to that project.

## REQ-BASE-004 — Presentation

Bases SHALL be chosen for user value, not because every note type needs a database.

---

# 18. Meta Bind

## REQ-MB-001 — Interactive Properties

Meta Bind SHALL provide controls for frequently changed properties.

## REQ-MB-002 — Appropriate Controls

Controls MAY include:

- inline selects;
- buttons;
- toggles;
- date inputs;
- sliders;
- other useful property editors.

## REQ-MB-003 — Project Controls

Projects SHOULD expose useful controls such as:

- status;
- phase;
- progress;
- priority;
- due date;
- archive/unarchive.

## REQ-MB-004 — Single Archive Control

All archive controls MUST manipulate the same canonical `archived` property.

## REQ-MB-005 — No Obsolete Taxonomy

Meta Bind templates/configuration MUST NOT retain stale classifications from abandoned vault architectures unless currently used.

---

# 19. Note Toolbar

## REQ-NTB-001 — Context-Aware Commands

Note Toolbar SHALL expose different controls according to the current note context.

## REQ-NTB-002 — General Navigation

A general navigation toolbar SHOULD expose high-value commands such as:

- Home;
- QuickAdd;
- Daily Note.

## REQ-NTB-003 — Writing/Editing Context

Writing-oriented notes SHOULD expose relevant actions for:

- text formatting;
- links;
- tables;
- code;
- editing/refactoring.

## REQ-NTB-004 — Amoeba Context

Amoeba notes SHOULD expose:

- Note Refactor;
- move/promote actions;
- table editing where useful;
- ordinary writing controls.

## REQ-NTB-005 — Project Context

Project notes SHOULD expose:

- create task;
- project planning/Kanban;
- relevant project commands;
- Git/development controls where appropriate.

## REQ-NTB-006 — System Context

System/configuration notes MAY expose:

- file operations;
- Git;
- command palette;
- maintenance functions.

## REQ-NTB-007 — Plugin Integration

Where command APIs permit, Note Toolbar SHOULD surface commands from:

- Table Editor;
- Note Refactor;
- TaskNotes;
- Kanban;
- Git;
- Code Space;
- Obsidian core commands.

---

# 20. Table Editor

## REQ-TABLE-001

Table Editor SHALL make Markdown tables practically editable.

## REQ-TABLE-002

Relevant Table Editor commands SHALL be accessible from contextual Note Toolbar menus.

## REQ-TABLE-003

Routine table editing SHOULD NOT require manually counting Markdown pipes and spacing.

---

# 21. Note Refactor

## REQ-REF-001

Note Refactor SHALL support the Amoeba scratch-note workflow.

## REQ-REF-002

Useful content SHOULD be extractable into a new note through contextual commands.

## REQ-REF-003

Refactoring controls SHOULD be available from the Amoeba Note Toolbar without opening the global command palette.

---

# 22. Markdown Linter

## REQ-LINT-001 — Purpose

Linter SHALL keep Markdown deterministic and consistent.

## REQ-LINT-002 — Formatting

Linter SHOULD normalize appropriate:

- headings;
- heading spacing;
- blank lines;
- YAML formatting;
- tag formatting;
- list formatting;
- trailing whitespace;
- spaces;
- final newline;
- callout/block formatting where safely supported.

## REQ-LINT-003 — Spaces, Not Tabs

Indentation conventions SHALL prefer spaces rather than converting content into tabs.

## REQ-LINT-004 — No Useless Metadata

Linter MUST NOT generate unnecessary YAML properties solely because it has a rule capable of doing so.

In particular, redundant `title` frontmatter SHOULD remain disabled unless another accepted subsystem requires it.

## REQ-LINT-005 — Protected Content

Infrastructure and asset directories SHOULD be excluded where linting could damage non-note content.

---

# 23. Obsidian Git

## REQ-GIT-001 — Vault Version Control

Obsidian Git SHALL provide version-control access for the vault.

## REQ-GIT-002 — Deliberate Operations

Automatic commit, push, and pull SHALL remain disabled unless intentionally enabled later.

The preferred default is deliberate user-triggered Git operations.

## REQ-GIT-003 — Pull Before Push

The configured workflow SHOULD reduce accidental divergence, including pull-before-push behavior where appropriate.

## REQ-GIT-004 — Hearth Integration

Common Git actions and Git state SHALL be accessible through the dedicated Git Hearth dashboard.

## REQ-GIT-005 — External Repository Exclusion

Code repositories mounted through Code Space MUST NOT accidentally become part of the vault Git repository.

---

# 24. Code Space

## REQ-CODE-001 — Purpose

Code Space SHALL allow software projects to be accessed and edited from Obsidian without requiring VS Code for ordinary file editing.

## REQ-CODE-002 — External Projects

External repositories SHOULD be mounted into an ignored local directory such as:

`_mounts/<repository-name>`

## REQ-CODE-003 — No Duplication

External code SHOULD be mounted/referenced rather than copied into the knowledge vault.

## REQ-CODE-004 — Modern Stack File Types

The editing environment SHOULD handle the common file types used in the modern stack, including:

- `.ts`
- `.tsx`
- `.js`
- `.jsx`
- `.json`
- `.css`
- `.md`
- `.sql`
- `.prisma`
- `.yaml`
- `.yml`

## REQ-CODE-005 — Editor Conveniences

Where supported, Code Space SHOULD provide:

- syntax highlighting;
- line numbers;
- usable editor font sizing;
- code-file embeds;
- external-folder support;
- reasonable editing/navigation behavior.

## REQ-CODE-006 — Local Configuration

Machine-specific absolute repository paths SHOULD NOT be committed when doing so would make the vault non-portable.

---

# 25. Callout Studio

## REQ-CALL-001 — Standard Markdown Callouts

Callout Studio SHALL provide polished versions of the standard GitHub-style semantic alerts:

- Note
- Tip
- Important
- Warning
- Caution

## REQ-CALL-002 — Knowledge-System Callouts

The vault SHALL additionally support semantic callouts for:

- Epistemology
- Ontology
- Terminology
- Taxonomy
- Typology
- Mereology
- Topology
- Nomenclature
- Semantics
- Schema
- Metadata
- Folksonomy
- Faceted Classification
- Information
- Domain
- Knowledge

## REQ-CALL-003 — Icons

Callouts SHALL use a consistent icon system rather than emoji.

## REQ-CALL-004 — Visual Consistency

Callouts SHALL remain readable across supported visual modes.

## REQ-CALL-005 — Restraint

The existence of a semantic callout SHALL NOT require its use.

Callouts should communicate meaning, not decorate every paragraph.

---

# 26. Iconic

## REQ-ICON-001 — Semantic Navigation

Iconic SHALL provide visually meaningful icons for important folders and note classes.

## REQ-ICON-002 — Color Coordination

Icons MAY use coordinated colors to distinguish major functional domains.

## REQ-ICON-003 — Required Folder Coverage

At minimum, visually distinguish:

- Projects;
- Areas;
- Resources;
- Archive;
- Amoeba;
- Daily;
- Habits;
- Hearth;
- System;
- Zettelkasten.

## REQ-ICON-004 — No Emoji Mode

Emoji mode SHALL NOT be the semantic icon system.

---

# 27. Notion Transplant — General Rules

## REQ-NOT-001 — Rebuild, Do Not Literally Clone

The supplied Notion systems SHALL be treated as interaction and information-design references.

They SHALL be rebuilt using native Obsidian capabilities.

## REQ-NOT-002 — Preserve Useful Structure

Useful structure, views, workflows, information hierarchy, and interaction ideas SHOULD be preserved.

Notion-specific implementation details SHALL NOT be copied when Obsidian has a better native/plugin-native equivalent.

## REQ-NOT-003 — LeetCode Translation Rule

Anything referring to LeetCode SHALL be reinterpreted as **Stack Syntax Writing Drills**.

## REQ-NOT-004 — School Translation Rule

Anything referring to:

- school;
- classes;
- coursework;
- homework;

SHALL be reinterpreted as:

- TypeScript study;
- modern-stack study;
- Stack Syntax drills;
- practical coding learning.

## REQ-NOT-005 — Visual Quality

The visual composition of transplanted systems SHALL be treated as part of the requirement.

A technically complete but ugly transplant SHALL NOT pass acceptance.

---

# 28. Notion Transplant — PARA Vault

The Notion PARA source uses quick actions, navigation, Projects, Areas, Resources, Tasks, Topics, and Notes as a unified home interface.

## REQ-PARA-UI-001

An equivalent Obsidian experience SHOULD provide quick access to:

- Projects;
- Areas;
- Resources;
- Archive;
- Tasks;
- topics/classification;
- notes;
- capture commands.

## REQ-PARA-UI-002

The PARA overview SHOULD be constructed from Hearth, Bases, links, commands, and appropriate native Obsidian/plugin views.

## REQ-PARA-UI-003

Active versus archived SHALL be derived exclusively from the PARA/archive model.

No parallel lifecycle system SHALL be introduced.

---

# 29. Notion Transplant — Learning System

The source systems contain:

- Quick Access;
- habit tracking;
- coursework;
- homework;
- personal projects;
- code snippets;
- resources;
- topic progress;
- learning modules;
- learning calendar;
- problem/drill tracker;
- status views;
- topic/group views;
- difficulty views.

These SHALL become one coherent TypeScript/Stack Syntax environment.

## REQ-LEARN-001 — Quick Access

Learning SHALL contain one-click access to the most frequently used study resources and drills.

## REQ-LEARN-002 — Study Topics

The system SHALL support study domains relevant to the user's actual stack.

Initial domains SHOULD include:

- TypeScript typed functions;
- type inference;
- generics;
- fetchers;
- server actions;
- Zod schemas;
- inferred Zod types;
- React components;
- React props;
- React hooks;
- event handlers;
- forms;
- Next.js App Router;
- Server/Client boundaries;
- Prisma;
- Neon/Postgres interactions;
- Clerk/auth patterns;
- validation;
- error/result shapes.

## REQ-LEARN-003 — Stack Syntax Drill Record

Each drill SHOULD be capable of recording:

- drill/problem title;
- study domain/group;
- difficulty;
- status;
- practice date;
- attempt/result;
- notes;
- related learning module.

## REQ-LEARN-004 — Drill Status

The learning system SHALL support at least:

- Not Started;
- In Progress;
- Done.

Additional useful practice states MAY later be added.

## REQ-LEARN-005 — Difficulty

Drills SHOULD support:

- Easy;
- Medium;
- Hard.

## REQ-LEARN-006 — Required Views

The Stack Syntax tracker SHOULD provide equivalents of the Notion tracker:

- All Drills table/list;
- Status board;
- Domain/Topic board;
- Difficulty board.

## REQ-LEARN-007 — Learning Modules

The system SHALL support Learning Modules that group related instruction and practice.

## REQ-LEARN-008 — Learning Calendar

Scheduled study/drill work SHOULD be viewable chronologically or through a calendar.

## REQ-LEARN-009 — Practice From Memory

Drills SHALL require writing syntax rather than merely selecting an answer.

Multiple-choice trivia SHALL NOT be the primary training method.

## REQ-LEARN-010 — Real Stack Relevance

Exercises SHOULD resemble the kinds of functions, boundaries, schemas, types, handlers, and data operations actually encountered in modern TypeScript/Next.js development.

---

# 30. Vibe Coding Prompt Library

The Notion source separates explanatory material, Output Type, and the actual Prompts collection.

## REQ-PROMPT-001

A reusable Prompt Library SHALL exist under Resources/Library infrastructure.

## REQ-PROMPT-002

Prompts SHALL be independently reusable records rather than one enormous prompt document.

## REQ-PROMPT-003

Prompts SHOULD be classifiable by useful dimensions such as:

- output type;
- purpose;
- development phase;
- stack/domain;
- tool/agent;
- topic.

Classification SHALL use tags where appropriate.

## REQ-PROMPT-004

The library SHOULD provide filtered views so prompts can be found by output type or purpose.

## REQ-PROMPT-005

The presentation SHOULD make the actual prompt text easy to copy and reuse.

## REQ-PROMPT-006

The Prompt Library SHALL be reachable directly from Hearth.

---

# 31. Reusable Modules

Modules SHALL represent reusable infrastructure larger than one template but smaller than an entire top-level system.

Modules SHALL live under the Resource layer of PARA.

Required modules include:

1. Campaign Brief
2. Simple Notebook
3. OKR Tracker
4. Wiki
5. Stack Syntax Journal, adapted from DSA/LeetCode Journal

---

# 32. Campaign Brief Module

The transplanted Campaign Brief SHALL preserve the useful structure of the Notion source.

## REQ-CAMP-001 — Overview

Include:

- campaign summary;
- what;
- why;
- why now.

## REQ-CAMP-002 — Strategy

Include:

- goals/objectives;
- target audience;
- audience insight;
- communication framework;
- key message;
- message priorities;
- risks/considerations.

## REQ-CAMP-003 — Communication Framework

Support a clear:

**Get → To → By**

model or equivalent.

## REQ-CAMP-004 — Channels

Include:

- channel strategy;
- campaign moments;
- major deliverables;
- relevant channel briefs.

## REQ-CAMP-005 — Execution

Include:

- deliverables;
- actions;
- dates;
- relationships to relevant projects/tasks where useful.

## REQ-CAMP-006 — Performance

Provide sections for:

- overall goal;
- executive summary;
- conversions;
- impressions;
- web traffic;
- email;
- social/influencer performance where relevant;
- retrospective.

The module MAY omit fields irrelevant to a specific campaign.

---

# 33. Simple Notebook Module

## REQ-NOTEBOOK-001

Provide a generic lightweight collection of notes.

## REQ-NOTEBOOK-002

Notes SHOULD carry classification tags.

## REQ-NOTEBOOK-003

Provide:

- general list/table view;
- filtered visual views where useful.

## REQ-NOTEBOOK-004

The original Home/Work Notion filters SHALL be treated as examples, not mandatory classifications.

The Obsidian implementation SHALL use classifications relevant to the actual vault.

---

# 34. OKR Module

## REQ-OKR-001

Objectives and Key Results SHALL be modeled as distinct concepts.

## REQ-OKR-002

An Objective SHALL express a meaningful outcome.

## REQ-OKR-003

A Key Result SHALL express measurable evidence of progress toward an Objective.

## REQ-OKR-004

Objectives SHOULD be capable of relating to contributing Projects.

## REQ-OKR-005

Progress SHOULD be visible without manually assembling a report each time.

---

# 35. Wiki / Durable Resource Module

## REQ-WIKI-001

The Resource system SHALL support durable reference/knowledge pages analogous to the Notion Wiki.

## REQ-WIKI-002

Wiki/resource records SHOULD expose:

- title;
- tags/classification;
- creation metadata;
- modification metadata.

## REQ-WIKI-003

Recent/updated resources SHOULD be recoverable through a useful Library view.

## REQ-WIKI-004

Notion's corporate owner/verification mechanics SHALL NOT be copied unless they solve a real personal requirement.

---

# 36. Stack Syntax Journal Module

Adapted from the DSA and LeetCode Journal.

## REQ-SSJ-001

The module SHALL include:

- Study Topics;
- Learning Modules;
- Learning Calendar;
- Stack Syntax Drills.

## REQ-SSJ-002

Topic progress SHOULD be visible.

## REQ-SSJ-003

Learning modules SHOULD link to their study topics and relevant drills.

## REQ-SSJ-004

Practice history SHOULD allow the user to see what has been studied and what remains weak.

---

# 37. Notion-Derived Template Library

The following supplied systems MUST be converted into reusable Obsidian resource/template infrastructure:

1. Software Product Development in-a-Box
2. Design Team in-a-Box
3. Operations Team in-a-Box
4. Product Team in-a-Box
5. Marketing Team in-a-Box
6. Engineering Team in-a-Box
7. Startup in a Box

These SHOULD NOT become seven giant fake departments.

Their useful document and workflow patterns SHALL be extracted and adapted.

---

# 38. Software Product Development Template Family

The source combines Product, Design, Engineering, Research, Experimentation, and Analytics around a common roadmap.

The Obsidian adaptation SHOULD support reusable structures for:

- product/project roadmap;
- project/feature specification;
- technical specification;
- OKRs;
- milestones/sprints where useful;
- engineering tasks;
- design tasks;
- engineering documentation;
- design documentation;
- experiments;
- user research;
- data-analysis projects;
- experiment/research/analysis reports;
- decisions;
- retrospectives.

The active Project SHALL remain the organizing center rather than rebuilding fake departments.

---

# 39. Design Template Family

Useful source structures to preserve include:

- Design Roadmap;
- User Research;
- Experiments;
- Design Requests;
- UI Design System;
- Brand Guidelines;
- Design Tasks;
- Design Docs;
- Research Docs;
- Design Wiki.

Reusable design-document templates SHOULD include:

- Creative Brief;
- Design Brief;
- Moodboard;
- Design RFC;
- Design Critique;
- Brainstorm;
- Post-mortem;
- Retrospective.

Fake team-member infrastructure SHALL be omitted unless deliberately needed.

---

# 40. Operations Template Family

Useful source structures to preserve include:

- annual planning;
- OKRs;
- vendor management;
- operational projects;
- operational tasks;
- operational documentation;
- operational knowledge;
- post-mortems;
- reviews;
- SOPs.

The adaptation SHOULD be suitable for personal/business operations rather than a fictional operations department.

---

# 41. Product Template Family

Useful source structures include:

- OKRs;
- experiments;
- user research;
- launch tracking;
- feature requests;
- roadmap;
- Product Spec;
- tasks;
- product documentation;
- user journey;
- standup notes;
- sprint planning;
- retrospective;
- post-mortem;
- brainstorm;
- product knowledge/wiki.

These SHALL be exposed as reusable resources/templates, not as an independent duplicate project-management system.

---

# 42. Marketing Template Family

Useful source structures include:

- Editorial Calendar;
- Brand Assets;
- Brand Guidelines;
- Media List;
- Product Launch Tracker;
- Social Media Planner;
- Press Kit;
- Marketing Docs;
- Campaign Brief;
- Project Launch Plan;
- Agency RFP;
- Event Plan;
- campaign/marketing retrospective.

These MAY become independent resource templates/modules where genuinely useful.

---

# 43. Engineering Template Family

Useful source structures include:

- Engineering Roadmap;
- Engineering Tasks;
- Kanban;
- Sprint Board;
- Sprints;
- Release Manager;
- UI Component Library;
- Bug Tracker;
- Tech Spec;
- Post-mortem;
- Retrospective;
- API Reference;
- Changelog;
- Engineering Wiki.

TaskNotes SHALL remain the canonical task model.

The Engineering templates MUST integrate with rather than replace the main project/task system.

---

# 44. Startup Template Family

The Startup source organizes information around stages of a founder/startup journey.

The Obsidian adaptation SHOULD preserve useful stage-oriented business infrastructure where it provides actual value.

It SHALL NOT import promotional Notion material, generic community advertising, or irrelevant SaaS boilerplate.

Only actionable founder/business structures SHALL be retained.

---

# 45. Integration Ownership Matrix

| Concern | Authoritative subsystem |
|---|---|
| Primary filesystem | PARA |
| Scratch capture | Amoeba |
| Durable connected knowledge | Zettelkasten |
| Daily operating log | Daily Notes |
| Habit/accountability tracking | Habits |
| Universal creation menu | QuickAdd |
| Note generation | Templater |
| Tasks | TaskNotes |
| Project visual planning | Kanban |
| Structured Markdown views | Bases |
| Interactive properties | Meta Bind |
| Contextual commands | Note Toolbar |
| Table manipulation | Table Editor |
| Scratch-note extraction | Note Refactor |
| Primary dashboards | Hearth |
| Markdown normalization | Linter |
| Vault version control | Obsidian Git |
| External code editing | Code Space |
| Semantic callouts | Callout Studio |
| Semantic/navigation icons | Iconic |
| Classification | Tags |
| Operational/lifecycle state | Properties |
| Archive state | `archived` + PARA Archive |

---

# 46. Quality Requirements

## REQ-QUAL-001 — No Broken UI

Major pages MUST be tested in actual Reading/Preview mode where relevant.

Visible plugin errors SHALL fail acceptance.

## REQ-QUAL-002 — No Dead Controls

Buttons, toolbar items, QuickAdd actions, Meta Bind controls, and Hearth commands SHALL execute their intended action.

## REQ-QUAL-003 — No Duplicate Workflows

The finished system SHALL NOT expose multiple equally plausible ways to create the same authoritative object unless there is a deliberate reason.

## REQ-QUAL-004 — Discoverability

The user SHOULD be able to determine how to perform common actions by looking at the interface rather than memorizing plugin internals.

## REQ-QUAL-005 — Persistence

Changes made through plugin UI SHALL persist to the underlying Markdown/configuration after closing and reopening Obsidian.

## REQ-QUAL-006 — Searchability

Projects, resources, learning material, prompts, tasks, and Zettelkasten material SHALL be findable through search and/or dedicated views.

## REQ-QUAL-007 — Performance

Dashboards SHALL avoid unnecessarily expensive or enormous queries.

The vault SHOULD remain responsive at normal scale.

## REQ-QUAL-008 — Maintainability

Plugin configuration SHOULD have one understandable purpose.

Stale configuration MUST be removed when discovered.

---

# 47. Definition of Done

The vault SHALL be considered complete only when all of the following are true:

- Opening Obsidian presents a polished Digital Herencia experience.
- Home is immediately useful without navigating the file tree.
- Home fits its intended viewport without unwanted page scrolling.
- Projects, Library, Learning, and Git have distinct useful dashboards.
- A thought can be captured quickly into Amoeba.
- Amoeba material can be refactored/promoted.
- A new Project can be created predictably.
- A Project displays its own tasks.
- A new Task is created through TaskNotes.
- Task status changes persist correctly.
- Kanban provides project-planning value without duplicating task authority.
- A Daily Note can be created with the intended structure.
- Habit/progress information can be recorded and viewed.
- A clipping can be created.
- An AI transcript note can be created.
- Useful Zettelkasten linking works.
- A Stack Syntax Drill can be created.
- Learning material is organized around TypeScript and the actual stack.
- Learning supports topic, status, difficulty, and calendar/progress views.
- Prompt Library entries can be found and reused quickly.
- Campaign Brief works as reusable infrastructure.
- OKR tracking works.
- Notion-derived template families exist as practical personal resources.
- Meta Bind provides useful interactive lifecycle controls.
- Archive/unarchive uses one canonical mechanism.
- Tags and properties obey their separate responsibilities.
- Contextual Note Toolbars expose appropriate commands.
- Table editing works.
- Note Refactor works.
- Callout Studio contains the requested semantic set.
- Iconic provides a coherent non-emoji navigation language.
- Markdown linting behaves predictably and does not add garbage metadata.
- Code Space can access an external repository without copying it into vault Git.
- Git operations are accessible and understandable.
- The Git Hearth dashboard fits its intended viewport.
- CSS modes can be switched and visually evaluated.
- No major plugin errors appear during ordinary use.
- The system survives an Obsidian restart with configuration and behavior intact.
- A user can actually understand and use the system without having to administer fourteen plugins every time they want to write a note.

---

# 48. Sequential Implementation Checklist

This is the order in which the system SHOULD be configured and verified.

Do not advance to the next major subsystem until the current one passes its acceptance test.

## Phase 0 — Protect the Work

- [ ] Confirm repository and working branch.
- [ ] Confirm clean/understood Git status.
- [ ] Confirm preservation of `CIGARETTES, REGRETS, & NEURAL NETS`.
- [ ] Confirm preservation of `ZETTLECASTEN`.
- [ ] Confirm preservation of `assets`.
- [ ] Confirm external code mounts are Git-ignored.
- [ ] Make a recovery commit or backup before manual configuration changes.

## Phase 1 — Core Obsidian

- [ ] Verify required core plugins.
- [ ] Configure Daily Notes.
- [ ] Configure Templates folder.
- [ ] Configure Properties.
- [ ] Configure Bases.
- [ ] Confirm vault opens without core errors.

## Phase 2 — Community Theme

- [ ] Select/install community base theme.
- [ ] Configure fonts.
- [ ] Configure base dark/light behavior.
- [ ] Establish Digital Herencia accent treatment.
- [ ] Verify readability before custom modes.

## Phase 3 — CSS Foundation

- [ ] Enable shared/core snippet.
- [ ] Verify typography.
- [ ] Verify layout spacing.
- [ ] Verify code blocks.
- [ ] Verify callouts.
- [ ] Verify Hearth cards.
- [ ] Create/test Retro mode.
- [ ] Create/test Terminal mode.
- [ ] Create/test Dark mode.
- [ ] Create/test Vaporwave mode.
- [ ] Create/test Neo Modern mode.
- [ ] Create/test Hyper Maximal mode.
- [ ] Create/test Minimalist mode.
- [ ] Ensure only intended visual mode is active.
- [ ] Choose/refine default mode.

## Phase 4 — PARA

- [ ] Verify Projects location.
- [ ] Verify Areas location.
- [ ] Verify Resources location.
- [ ] Verify Archive location.
- [ ] Verify no obsolete root taxonomy competes with PARA.
- [ ] Verify workflow directories have clear non-PARA responsibilities.

## Phase 5 — Metadata Rules

- [ ] Define canonical operational properties.
- [ ] Define tag facets.
- [ ] Remove lifecycle tags.
- [ ] Establish `archived` Boolean.
- [ ] Confirm no redundant `active` state.
- [ ] Configure created/updated metadata behavior.
- [ ] Verify PARA category does not need duplicate metadata.

## Phase 6 — Linter

- [ ] Enable lint-on-save if desired.
- [ ] Configure spaces rather than tabs.
- [ ] Configure YAML normalization.
- [ ] Configure headings/blank lines.
- [ ] Configure tag normalization.
- [ ] Disable useless YAML title generation.
- [ ] Protect infrastructure/assets.
- [ ] Test against representative notes.

## Phase 7 — Templater

- [ ] Configure Templates folder.
- [ ] Configure script folder.
- [ ] Configure folder-specific mappings.
- [ ] Test Project template.
- [ ] Test Area template.
- [ ] Test Resource template.
- [ ] Test Amoeba template.
- [ ] Test Daily template.
- [ ] Test Clipping template.
- [ ] Test AI Thread template.
- [ ] Test Stack Syntax template.
- [ ] Verify JavaScript helpers resolve correctly.
- [ ] Verify no automatic-template recursion/conflicts.

## Phase 8 — TaskNotes

- [ ] Configure canonical task folder.
- [ ] Configure task identification.
- [ ] Configure statuses.
- [ ] Configure priorities.
- [ ] Configure project relationships.
- [ ] Configure completion behavior.
- [ ] Configure generated Bases/views.
- [ ] Exclude infrastructure folders.
- [ ] Create a test task.
- [ ] Change test task through statuses.
- [ ] Verify completion metadata.
- [ ] Verify task persists after restart.

## Phase 9 — QuickAdd

- [ ] Create/configure Amoeba Capture.
- [ ] Create/configure New Project.
- [ ] Configure New Task to invoke TaskNotes.
- [ ] Create/configure Clipping.
- [ ] Create/configure AI Thread.
- [ ] Create/configure Stack Syntax Drill.
- [ ] Assign universal QuickAdd shortcut.
- [ ] Test every capture path.

## Phase 10 — Meta Bind

- [ ] Remove obsolete input templates/configuration.
- [ ] Configure project status control.
- [ ] Configure phase control.
- [ ] Configure progress control.
- [ ] Configure priority control.
- [ ] Configure due-date control where useful.
- [ ] Configure archive toggle.
- [ ] Verify all controls write valid YAML.
- [ ] Restart Obsidian and verify persistence.

## Phase 11 — Project Workspace

- [ ] Finalize Project template.
- [ ] Add project summary/context.
- [ ] Add lifecycle controls.
- [ ] Add milestone/phase planning area.
- [ ] Embed project-specific TaskNotes view.
- [ ] Link project board.
- [ ] Verify task query returns only related tasks.
- [ ] Verify archived projects disappear from active views.

## Phase 12 — Kanban

- [ ] Configure project Kanban convention.
- [ ] Define phase/milestone/workstream usage.
- [ ] Prevent checkbox cards from becoming a second task system.
- [ ] Link canonical TaskNotes tasks where needed.
- [ ] Verify project board works in actual UI.

## Phase 13 — Note Toolbar

- [ ] Configure Navigation toolbar.
- [ ] Configure Writing/Editing toolbar.
- [ ] Configure Amoeba toolbar.
- [ ] Configure Project toolbar.
- [ ] Configure System toolbar.
- [ ] Add Table Editor actions.
- [ ] Add Note Refactor actions.
- [ ] Add TaskNotes actions.
- [ ] Add Kanban actions.
- [ ] Add Git actions.
- [ ] Add relevant Code Space/core commands.
- [ ] Verify contextual toolbar selection for representative notes.
- [ ] Verify every toolbar control works.

## Phase 14 — Amoeba

- [ ] Verify one-command capture.
- [ ] Verify scratch template remains lightweight.
- [ ] Verify refactor/extract workflow.
- [ ] Verify move/promote workflow.
- [ ] Verify no classification is required at capture time.

## Phase 15 — Zettelkasten

- [ ] Configure Clippings.
- [ ] Configure AI Threads.
- [ ] Define durable-note convention.
- [ ] Define source metadata.
- [ ] Verify backlinks.
- [ ] Verify links.
- [ ] Verify classification tags.
- [ ] Verify promotion from clipping/thread to durable knowledge.

## Phase 16 — Daily Notes

- [ ] Configure chronological folder format.
- [ ] Build lightweight Daily template.
- [ ] Add personal Scrum-style cadence.
- [ ] Link active projects where useful.
- [ ] Surface tasks without duplicating them.
- [ ] Test today's note.
- [ ] Test date rollover.

## Phase 17 — Habits

- [ ] Decide minimal recurring habits.
- [ ] Add TypeScript/Stack Syntax practice.
- [ ] Add only genuinely useful additional habits.
- [ ] Create progress visualization.
- [ ] Ensure recording a habit is low-friction.

## Phase 18 — Learning Data Model

- [ ] Define Study Topics.
- [ ] Define Learning Modules.
- [ ] Define Stack Syntax Drill fields.
- [ ] Define status.
- [ ] Define difficulty.
- [ ] Define topic/domain classification.
- [ ] Define practice date/history.
- [ ] Create All Drills view.
- [ ] Create Status view.
- [ ] Create Domain view.
- [ ] Create Difficulty view.
- [ ] Create Learning Calendar.
- [ ] Create Topic Progress view.

## Phase 19 — Learning Content

- [ ] Typed-function drills.
- [ ] Generics drills.
- [ ] Fetcher drills.
- [ ] Server-action drills.
- [ ] Zod/schema drills.
- [ ] React component/props drills.
- [ ] Hooks drills.
- [ ] Event-handler drills.
- [ ] Next.js boundary drills.
- [ ] Prisma/Neon drills.
- [ ] Clerk/auth drills.
- [ ] Validation/result/error drills.
- [ ] Verify drills require written syntax.

## Phase 20 — Prompt Library

- [ ] Create Prompt Library resource structure.
- [ ] Create individual reusable prompt records.
- [ ] Add output-type classification.
- [ ] Add purpose/domain classification.
- [ ] Add filtered views.
- [ ] Make prompt text easy to copy.
- [ ] Surface Prompt Library from Hearth.

## Phase 21 — Reusable Modules

- [ ] Campaign Brief.
- [ ] Simple Notebook.
- [ ] OKR Tracker.
- [ ] Wiki/Resource module.
- [ ] Stack Syntax Journal.
- [ ] Verify modules live under Resources.
- [ ] Verify modules are reusable rather than one-off examples.

## Phase 22 — Template Families

- [ ] Software Product Development templates.
- [ ] Design templates.
- [ ] Operations templates.
- [ ] Product templates.
- [ ] Marketing templates.
- [ ] Engineering templates.
- [ ] Startup templates.
- [ ] Remove fake organization/team boilerplate.
- [ ] Preserve useful workflows.
- [ ] Integrate templates with existing Projects/Tasks/Resources rather than duplicating systems.

## Phase 23 — Callout Studio

- [ ] Note.
- [ ] Tip.
- [ ] Important.
- [ ] Warning.
- [ ] Caution.
- [ ] Epistemology.
- [ ] Ontology.
- [ ] Terminology.
- [ ] Taxonomy.
- [ ] Typology.
- [ ] Mereology.
- [ ] Topology.
- [ ] Nomenclature.
- [ ] Semantics.
- [ ] Schema.
- [ ] Metadata.
- [ ] Folksonomy.
- [ ] Faceted Classification.
- [ ] Information.
- [ ] Domain.
- [ ] Knowledge.
- [ ] Verify icons.
- [ ] Verify colors/readability across visual modes.

## Phase 24 — Iconic

- [ ] Projects icon.
- [ ] Areas icon.
- [ ] Resources icon.
- [ ] Archive icon.
- [ ] Amoeba icon.
- [ ] Daily icon.
- [ ] Habits icon.
- [ ] Hearth icon.
- [ ] System icon.
- [ ] Zettelkasten icon.
- [ ] Configure coherent colors.
- [ ] Confirm emoji mode is not being used.

## Phase 25 — Code Space

- [ ] Enable external-folder capability.
- [ ] Create ignored `_mounts`.
- [ ] Mount actual development repository.
- [ ] Verify mount survives restart.
- [ ] Configure TypeScript/TSX.
- [ ] Configure JavaScript/JSX.
- [ ] Configure JSON.
- [ ] Configure CSS.
- [ ] Configure SQL.
- [ ] Configure Prisma.
- [ ] Configure YAML.
- [ ] Configure Markdown.
- [ ] Enable useful line-number/editor settings.
- [ ] Open representative source file.
- [ ] Edit and save representative source file.
- [ ] Verify external repository is not tracked by vault Git.

## Phase 26 — Hearth Home

- [ ] Digital Herencia title.
- [ ] Digital Herencia logo.
- [ ] Desert background.
- [ ] Search.
- [ ] Quick actions.
- [ ] Active-work information.
- [ ] Useful navigation.
- [ ] Balanced card layout.
- [ ] No unnecessary duplication.
- [ ] Fit normal viewport.
- [ ] No page-level vertical scrolling.
- [ ] Visual review.

## Phase 27 — Hearth Library

- [ ] Resource views.
- [ ] Zettelkasten access.
- [ ] Prompt Library access.
- [ ] Modules.
- [ ] Templates.
- [ ] Recent/useful knowledge.
- [ ] Search/navigation.
- [ ] Visual review.

## Phase 28 — Hearth Learning

- [ ] Quick Access.
- [ ] Study Topics.
- [ ] Learning Modules.
- [ ] Stack Syntax tracker.
- [ ] Habit/progress display.
- [ ] Study calendar.
- [ ] Project/code shortcuts where useful.
- [ ] Resources/snippets.
- [ ] Visual review.
- [ ] Confirm nothing is framed as school/homework/LeetCode.

## Phase 29 — Hearth Projects

- [ ] Active Projects view.
- [ ] Progress/status.
- [ ] TaskNotes board/view.
- [ ] New Project action.
- [ ] New Task action.
- [ ] Full Task Board shortcut.
- [ ] Kanban/project planning access.
- [ ] Deadlines/upcoming work where useful.
- [ ] Visual review.

## Phase 30 — Hearth Git

- [ ] Branch/status.
- [ ] Git actions.
- [ ] Changed files.
- [ ] Recent history.
- [ ] Vault stats.
- [ ] Activity/heatmap/streak visualization.
- [ ] Git icons.
- [ ] Limit rows/logs to usable amount.
- [ ] Fit viewport.
- [ ] No page-level vertical scrolling.
- [ ] Execute harmless runtime Git check.
- [ ] Visual review.

## Phase 31 — Full Acceptance Test

- [ ] Restart Obsidian.
- [ ] Home opens correctly.
- [ ] Dashboard switching works.
- [ ] QuickAdd works.
- [ ] New Project works.
- [ ] New Task works.
- [ ] Project-task relationship works.
- [ ] Task status works.
- [ ] Kanban works.
- [ ] Meta Bind works.
- [ ] Archive/unarchive works.
- [ ] Daily Note works.
- [ ] Amoeba works.
- [ ] Note Refactor works.
- [ ] Clipping works.
- [ ] AI Thread works.
- [ ] Stack Syntax Drill works.
- [ ] Learning views work.
- [ ] Prompt Library works.
- [ ] Note Toolbar contexts work.
- [ ] Tables can be edited.
- [ ] Callouts render.
- [ ] Icons render.
- [ ] Code Space opens mounted code.
- [ ] Mounted code remains excluded from vault Git.
- [ ] Git dashboard works.
- [ ] Linter behaves correctly.
- [ ] No visible plugin errors.
- [ ] No obsolete architecture remains active.
- [ ] No duplicate lifecycle/task/archive systems remain.
- [ ] Default visual mode looks deliberately designed.
- [ ] Major dashboards pass visual review.
- [ ] Vault is understandable without reading plugin configuration files.
- [ ] Vault is enjoyable enough to actually use for taking notes.

---

# 49. Final Product Acceptance Statement

The system is finished when Obsidian behaves like a cohesive **Digital Herencia personal workspace**, not a collection of individually configured plugins.

The user must be able to open the vault and immediately:

**orient → capture → think → write → learn → plan → execute → recover**

without needing to understand which plugin is responsible for every operation.

Plugin complexity belongs underneath the interface.

The finished interface is the product.