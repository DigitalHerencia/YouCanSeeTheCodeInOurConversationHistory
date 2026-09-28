# Hearth Codex Strict Implementation Contract v0.1

## Purpose

This document removes implementation-time discretion. Codex is the implementer, not the architect.

## Decision authority

The following are already decided and MUST NOT be redesigned:

- PARA roots: `1.PROJECTS`, `2.AREAS`, `3.RESOURCES`, `4.ARCHIVE`.
- No Portfolio entity anywhere in Hearth.
- Project is the top-level execution container.
- Execution hierarchy: `Project -> Milestone -> Phase -> Task`.
- Milestone board is project-local; milestone is the card; phases are represented inside the milestone card.
- TaskNotes is execution truth; Kanban is a planning/projection surface.
- TaskNotes folder: `2.AREAS/SYSTEM/_Tasks`.
- Daily cadence material lives under `2.AREAS/DAILY`.
- Zettelkasten lives under `2.AREAS/ZETTLECASTEN` as the active knowledge workbench.
- Zettelkasten streams are distinct: Inbox, AI Threads, Web Clippings, Fleeting, Literature, and related processing areas.
- Processed Zettelkasten outputs leave the workbench and become durable Resources under `3.RESOURCES`.
- Library is the discovery/control surface over durable knowledge and Resources; it is not a second storage system.
- TypeScript/TypeScripture is Code Lab curriculum material.
- The nine Maximal Template application ontologies are Code Lab starter modules/blueprints.
- Dev Cycles / implementation blocks become Code Lab lessons.
- Real software construction is the Code Lab drill.
- Daily cadence is demand-driven; do not instantiate every recurring meeting automatically.
- Daily Note is a generated operating snapshot, not a manual journal form.
- User-facing property editing is via Meta Bind.
- Machine-owned and computed properties are generated/reconciled by automation and are not routine manual controls.
- No hand-maintained duplicate relationship fields.
- All known Notion projects/tasks/meetings/cadence must be migrated from the supplied export without inventing relationships.
- The six known unlinked tasks remain in the repair queue until a real relationship can be established.
- The nine ontology starter blueprints all ship.
- The Hearth UI must be polished and functional, not a scaffold.

## Allowed implementation discretion

Codex MAY choose:

- exact JavaScript function boundaries inside the required script modules;
- exact file names for generated helper/config files when they do not conflict with the specification;
- exact Base column ordering and dashboard card dimensions when preserving the specified content and behavior;
- exact styling/layout details using the installed Hearth, Callout Studio, Iconic, and Obsidian capabilities;
- whether Templater or QuickAdd performs a specific internal orchestration step when both are capable, provided the resulting behavior and provenance are identical;
- implementation details needed to work around plugin-version-specific API differences, as long as no new user workflow or ontology is invented.

Codex MUST NOT choose:

- a different ontology;
- a different hierarchy;
- a new property taxonomy;
- a new storage topology;
- a Portfolio model;
- a replacement task system;
- a second task database;
- a different cadence model;
- a different Code Lab curriculum model;
- manual maintenance of derived properties;
- a new plugin unless explicitly required by a verified capability gap and already permitted by the source contract.

## Property contract

Human interaction is intentionally small.

Meta Bind controls only the properties classified as `user-controlled` in the property registry. All machine-owned/computed properties are maintained by deterministic scripts and may be displayed with Meta Bind VIEW fields, Bases, or ordinary Markdown, but MUST NOT be presented as routine editable inputs.

A successful implementation must make it possible to operate normal project/task/daily workflows without opening the Properties UI and editing frontmatter manually.

## Automation contract

The automation layer MUST perform the following without routine user bookkeeping:

- ID allocation
- derived work-code generation
- project/milestone/phase/task linkage
- provenance creation
- document/task/evidence linkage
- project and phase progress calculation
- health calculation where defined as computed
- next-action derivation
- task completion timestamps
- output discovery from workflow-generated notes
- daily yesterday/today/deadline/blocker/carry-forward projections
- meeting/review projections
- Code Lab lesson/drill/test/evidence linkage
- Zettelkasten processing transitions
- Resource lifecycle transitions that are objectively derivable
- archive/supersession metadata
- repair queue generation
- audit findings

## Daily generation contract

Creating or refreshing a daily note MUST populate all available deterministic context, including:

- previous working day's completed tasks;
- links to outputs produced by those tasks;
- unresolved tasks carried forward;
- today's executable task set, bounded to a small actionable set;
- overdue tasks;
- deadlines and near-term reviews;
- active project, milestone, and phase;
- current next action;
- active blockers and stale blockers;
- scheduled meetings/reviews actually relevant to the date;
- recent project documents/evidence;
- Zettelkasten items awaiting processing;
- Resource review queue items that are due;
- current Code Lab module/lesson/drill/test state;
- relevant Git/vault health warnings.

Generated content MUST be enclosed in stable `HEARTH:BEGIN ...` / `HEARTH:END ...` markers. Refresh may replace only those generated regions. Human-authored prose outside those regions MUST remain untouched.

The system MUST NOT fabricate a narrative summary. For example, “generated PRD” is shown from the completed task plus created document relation, not invented from a free-text guess.

## Source handling contract

Codex MUST use the supplied source corpus. It MUST NOT reconstruct the Notion model from conversation memory when the export is present.

Bounded source locations:

1. current vault repository;
2. the existing Zettelkasten export/input root supplied by the user;
3. the mounted CodependentCoding repository;
4. any explicitly mounted Book of Knowledge / Book of Implementation source directories.

Codex may inventory these roots. It MUST NOT perform open-ended repository spelunking across unrelated directories.

## Plugin capability contract

Only capabilities supported by the installed versions and their actual APIs may be used.

Verified behavior includes:

- Meta Bind: INPUT/VIEW bindings to frontmatter plus button actions including metadata updates and supported command/Templater actions.
- QuickAdd: Template, Capture, Macro, Multi choices; user scripts; branching/conditional macros; access to the Obsidian API and other installed plugins through scripts.
- Templater: user script functions and deterministic file creation through `tp.file.create_new`.
- Obsidian Daily Notes: canonical daily-note creation/opening.
- Obsidian Bases: dynamic views driven by note properties/tags/folders.
- Obsidian Kanban: project-local planning boards.
- TaskNotes: task creation/storage/execution and task-oriented Bases/Kanban views in the existing configuration.

Do not assume native cross-note Meta Bind property binding, automatic Kanban->TaskNotes synchronization, or any other behavior that is not present in the installed plugin/API surface.

## Migration contract

Migration is deterministic and non-destructive.

- Preserve source data.
- Create an explicit migration manifest.
- Record source path and source identity for imported entities.
- Preserve missing relationships as repair records.
- Do not guess orphan task ownership.
- Do not delete source notes as part of migration.

## Verification gate

Codex MUST NOT claim completion unless all of the following have been checked:

- plugin configuration parses;
- required templates exist;
- required scripts exist and load;
- required Base targets exist;
- QuickAdd choices reference real templates/scripts/commands;
- no prohibited Portfolio artifacts exist;
- property registry matches actual generated frontmatter;
- human-editable properties are exposed through Meta Bind controls;
- derived properties update through reconciliation;
- daily generation and refresh preserve human-authored content;
- project -> milestone -> phase -> task linkage is valid;
- milestone board reconciliation works;
- Zettelkasten processing creates/moves durable Resources correctly;
- all nine ontology blueprints exist and instantiate;
- CRM end-to-end fixture passes;
- Notion migration counts and identities reconcile with the export;
- the six known task orphans remain unresolved rather than guessed;
- broken links/IDs/relations are reported by audit tooling;
- a fresh Obsidian reload does not require manual repair.

## Failure behavior

When a runtime capability is impossible with the installed plugins:

1. implement the closest behavior using an already-installed capability;
2. keep the user workflow intact;
3. record the exact limitation and evidence;
4. do not silently invent a fake implementation;
5. do not ask the user to redesign the system unless the contract is mathematically or technically impossible.

## Output

Codex must return a concise implementation report containing:

- changed files;
- migrated entities/counts;
- verification commands/results;
- plugin/runtime limitations proven by evidence;
- any genuinely unavoidable manual action.

No architectural essay. No restatement of the user's history. No design alternatives.
