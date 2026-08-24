## Purpose

This repository is a private Obsidian vault named DevNotes.

## Unified system authority

The approved `DevNotes-Unified-Knowledge-Engineering-System-Authority-Package-v0.1.0` controls the target architecture for the unified migration. Its target human-facing bounded contexts are `Chief of Staff/`, `Trust Issues/`, `Execution/`, `Vibes/`, `DevNotes/`, `Schemes/`, `Prömpter/`, and `Fuck You Pay Me/`; cross-cutting support belongs in `.system/`, `_obsidian/`, `_ops/`, `_mounts/`, and `_assets/`.

Role/folder records responsibility ownership. `workspace` records the project, product, or objective. `system` records reusable doctrine. `namespace` records stable semantic identity. Metadata facets and typed wikilinks provide independent classification and graph relationships.

The numbered roots remain compatibility paths during staged migration. Do not move or reclassify their contents merely to fill the unified tree. New unified notes use the package metadata contract; existing legacy metadata remains valid until inspected and intentionally reconciled.

Agents working in this repository must treat it as a source-controlled knowledge system, not as a normal software codebase.

The primary agent responsibility is to help the user capture, organize, maintain, and retrieve notes through the connected GitHub repository so those changes can be synchronized to the user’s local Obsidian vault.

## Core Workflow

The expected workflow is:

1. The user brings a conversation, draft, source, idea, or note into the DevNotes ChatGPT project.
2. The agent determines whether the material should remain a raw capture or become a durable note.
3. The agent classifies the note using the existing DevNotes contracts.
4. The agent chooses the correct folder, filename, note type, properties, and links.
5. The agent creates or updates the note in the connected `DigitalHerencia/DevNotes` GitHub repository.
6. The user synchronizes the repository to the local Obsidian vault.

The agent must maintain the existing system. It must not invent a replacement system unless the user explicitly requests one.

## Governing Contracts

Read and follow these files before creating, renaming, moving, or materially editing durable notes:

1. `90 OBSIDIAN/Contracts/obsidian.contracts.naming-standard.md`
2. `90 OBSIDIAN/Contracts/obsidian.contracts.property-schema.md`
3. `90 OBSIDIAN/Contracts/obsidian.contracts.note-types.md`

These three files govern:

- filename structure
- note classification
- required frontmatter
- allowed property values
- note authority
- lifecycle status

When another note conflicts with these contracts, the contracts control unless the user explicitly changes them.

## Repository Model

Top-level folders:

```text
00 ZETTELKASTEN
10 PROJECTS
20 DOCUMENTATION
30 DEEP RESEARCH
40 ARCHIVE
50 REGRETS, CIGARETTES, & NEURAL NETS
60 CODEPENDENT CODING
70 TODO
90 OBSIDIAN
_OPS
.agent-logs
```

Use each folder according to its purpose.

### `00 ZETTELKASTEN`

Use for:

- raw captures
- conversation extracts
- unfinished thoughts
- unclassified material
- notes that still need processing

A note should not remain here after it has been promoted into a durable note unless the user wants to preserve the original capture.

### `10 PROJECTS`

Use for notes and project-owned supporting material belonging to a specific project.

Do not flatten project folders or invent a different project structure without explicit instruction.

#### Codependent Coding project boundary

`10 PROJECTS/10.PROJECTS.CODEPENDENTCODING` is the active Codependent Coding project workspace. Current project-owned material belongs here, including:

- the active Codependent Coding™ WebApp Architecture;
- Simples™ and their project maps/workbench records;
- the project source mirror;
- active project execution, handoff, and supporting context when placed in the project hierarchy.

This is intentionally separate from the flat knowledge-system corpus in `60 CODEPENDENT CODING`. Do not move active project material back into `60 CODEPENDENT CODING` merely because an older path or document used that location.

### `20 DOCUMENTATION`

Use for external documentation, standards, copied references, platform documentation, and source material.

### `30 DEEP RESEARCH`

Use for substantial investigation, analysis, comparison, or research reports.

### `40 ARCHIVE`

Use for preserved deprecated, superseded, legacy, or historical material.

Material in `40 ARCHIVE` must not silently retain active source-of-truth authority. When archived material remains useful, treat it as historical/reference evidence and link to the current authoritative replacement when one exists.

### `50 REGRETS, CIGARETTES, & NEURAL NETS`

Use for essays, personal writing, creative work, and authored commentary.

### `60 CODEPENDENT CODING`

Use for the canonical flat Obsidian-native Codependent Coding™ Knowledge System corpus, including doctrine, architecture, contracts, patterns, governance, provenance, and maps migrated into the vault as durable knowledge.

Preserve it as a flat dot-notation namespace unless the user explicitly requests restructuring.

This folder is not the active Codependent Coding project workspace and is not the current source-mirror location.

### `70 TODO`

Use for active task, backlog, work-package, and handoff material that intentionally lives in the vault-wide TODO system rather than inside a project folder.

### `90 OBSIDIAN`

Use only for the operating rules, standards, templates, maps, and workflows of DevNotes itself.

### `_OPS`

Use for automation scripts, maintenance utilities, migration tools, and generated operational reports.

Do not place ordinary notes in `_OPS`.

### `.agent-logs`

Treat tracked agent logs as repository history.

Do not delete or rewrite them unless explicitly instructed.

## Note Classification

Before creating a note, determine its `type` and `kind` using the note-types contract.

Standard values are:

```text
contract
map
workflow
reference
research
writing
execution
template
dashboard
standard
legacy
capture
source-document
work-package
handoff
checklist
schema
simple
```

Do not force every useful note to become a contract.

Use:

- `capture` for unfinished material
- `reference` for stable supporting knowledge
- `research` for investigation
- `writing` for authored prose
- `execution` for active work state
- `contract` for durable rules
- `map` for navigation
- `workflow` for repeatable procedures
- `simple` for one-file Codependent Coding knowledge records
- `legacy` for preserved but non-authoritative material

## Naming Rules

Durable notes use:

```text
<scope-or-project>.<domain>.<artifact>.<kind>.md
```

Examples:

```text
vouch.payments.lifecycle.contract.md
rateltd.commands.registry.contract.md
obsidian.contracts.property-schema.md
nextjs.app-router.caching.reference.md
```

Do not create vague durable filenames such as:

```text
Notes.md
Plan.md
Ideas.md
New Document.md
Random Thoughts.md
```

Raw captures may temporarily use less formal names, but promoted notes must follow the naming contract.

## Frontmatter Rules

Durable notes must begin with frontmatter.

Nothing may appear before the opening `---`.

Use this property shape:

```yaml
---
title:
type:
scope:
project:
domain:
artifact:
kind:
namespace:
status:
authority:
parent:
depends_on:
supersedes:
tags:
created:
updated:
---
```

Keep all properties present even when a value is empty.

Use YAML list syntax:

```yaml
tags:
  - example
  - status/active
```

Do not use Markdown bullet syntax inside YAML frontmatter.

## Linking Rules

Use Obsidian wikilinks for notes inside the vault:

```text
[[obsidian.contracts.naming-standard]]
```

Use Markdown links only for external URLs.

Add links when they improve navigation, ownership, dependency tracking, or context.

Do not add links merely to increase backlink count.

When a relationship is path-sensitive — for example a Dataview folder source, Base `file.inFolder()` filter, embed, or path-qualified source-mirror wikilink — verify the current vault path rather than relying on an older physical layout. Stable namespace wikilinks are preferred for durable note relationships when a path-qualified target is unnecessary.

## Authority and Status

Use `authority` to describe how strongly a note should be trusted:

```text
source-of-truth
working-note
reference
derived
legacy
archive
```

Use `status` to describe lifecycle state:

```text
draft
active
review
deprecated
superseded
archived
legacy
```

Do not silently treat a research note, capture, working note, or archived note as source-of-truth.

Do not silently replace an existing source-of-truth note.

When a new note supersedes an older note:

- set the old note to `status: superseded`
- update its `authority` if appropriate
- link the new note through `supersedes`
- preserve the old note unless the user explicitly requests deletion

## Inbox and Capture Handling

The inbox is a temporary processing area, not an archive.

When the user asks to save material:

1. Determine whether it is still raw.
2. If raw, create a `capture` note in `00 ZETTELKASTEN`.
3. If already durable, place it directly in the correct destination.
4. Do not duplicate the same material into both inbox and archive.
5. Do not leave processed notes in the inbox without a reason.
6. Do not archive unprocessed inbox material merely to make the inbox look clean.

When promoting a capture:

- create or update the durable note
- link the original capture to the promoted note when useful
- remove or retain the capture only according to the user’s instruction

## GitHub Operations

Use the connected `DigitalHerencia/DevNotes` repository as the remote source of truth for repository changes.

Before changing files:

- inspect the current repository state
- confirm the current path exists
- check for same-name destination files
- identify references that would break

For routine single-note creation or editing, make the smallest necessary change.

For structural changes involving multiple moves, renames, or deletions:

- explain the exact scope first
- do not broaden the task
- preserve meaning and links
- use Git checkpoints when possible
- report what changed

Do not create unnecessary branches, issues, pull requests, migration scripts, dashboards, or governance files unless the task requires them.

## Editing Rules

When the user asks to organize notes:

- follow the existing contracts
- use the current repository state as the baseline
- do not assume an older layout is more correct merely because prior documentation describes it
- make the smallest useful change
- do not redesign the vault
- do not introduce a new taxonomy
- do not add tooling merely because it exists
- do not modify Obsidian plugins or settings unless the task specifically requires it

When the user asks for analysis only, do not make repository changes.

When the user asks for a change, do not substitute a recommendation for the requested edit.

## Deletion Rules

Deletion is allowed when the user explicitly requests it.

Before deleting:

- verify the exact file
- determine whether it is referenced
- distinguish duplicate, obsolete, generated, and unique content
- do not preserve material merely because deletion feels risky
- do not delete unrelated files as part of cleanup

The user is the final authority on what should be retained.

## Response Rules

The user values speed and direct execution.

Agents must:

- stay within the requested scope
- avoid repetitive recaps
- avoid unnecessary preliminary checks
- avoid proposing unrelated improvements
- avoid turning small cleanup tasks into migrations
- state uncertainty plainly
- report concrete file paths and changes

In voice-mode conversations:

- avoid long lists
- avoid reading file trees unless requested
- speak in short, direct sentences
- confirm alignment before beginning broad work

## Final Rule

DevNotes exists so the user can bring useful material into this ChatGPT project, have it correctly organized in the GitHub-backed vault, and synchronize it into local Obsidian.

The agent’s job is to maintain that system accurately, consistently, and with minimal friction.
