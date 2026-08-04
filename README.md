# DevNotes

DevNotes is a private, Git-backed Obsidian vault for project knowledge, technical references, research, writing, and AI-assisted note management.

Its purpose is simple:

> Bring useful material into the DevNotes ChatGPT project, organize it according to a consistent system, save it to the connected GitHub repository, and synchronize it to the local Obsidian vault.

## How DevNotes Works

The operating flow is:

```text
Conversation or source material
        ↓
DevNotes ChatGPT project
        ↓
Classification and organization
        ↓
DigitalHerencia/DevNotes on GitHub
        ↓
Local Git synchronization
        ↓
Obsidian vault
```

ChatGPT is used as the organizational interface.

GitHub is the remote repository.

Git synchronizes the remote repository with the local vault.

Obsidian is the local reading, writing, linking, and navigation environment.

## What DevNotes Stores

DevNotes contains:

- project source-of-truth notes
    
- product and architecture contracts
    
- technical references
    
- research reports
    
- active execution notes
    
- agent work packages
    
- documentation clippings
    
- raw captures
    
- personal and technical writing
    
- vault standards and templates
    
- operational scripts and logs
    

## Vault Structure

```text
00 ZETTELKASTEN
10 PROJECTS
20 DOCUMENTATION
30 DEEP RESEARCH
40 TECH STACK
50 REGRETS, CIGARETTES, & NEURAL NETS
90 OBSIDIAN
_OPS
.agent-logs
```

### `00 ZETTELKASTEN`

Raw capture and unfinished material.

This includes conversation extracts, ideas, fragments, and notes that have not yet become durable knowledge.

### `10 PROJECTS`

Knowledge owned by a specific project.

This includes product definitions, contracts, architecture, features, execution notes, research, agent instructions, and legal material.

### `20 DOCUMENTATION`

External documentation and reference material.

### `30 DEEP RESEARCH`

Long-form research, investigations, comparisons, and analytical reports.

### `40 TECH STACK`

Reusable technical knowledge about tools, frameworks, libraries, services, and implementation patterns.

### `50 REGRETS, CIGARETTES, & NEURAL NETS`

Essays, personal writing, creative work, and authored commentary.

### `90 OBSIDIAN`

The operating layer for the vault itself.

This contains DevNotes standards, contracts, maps, templates, and workflows.

### `_OPS`

Automation scripts, maintenance tools, migration utilities, and generated operational reports.

### `.agent-logs`

Tracked agent operation history.

## Core Standards

DevNotes is governed by three contracts:

```text
90 OBSIDIAN/Contracts/obsidian.contracts.naming-standard.md
90 OBSIDIAN/Contracts/obsidian.contracts.property-schema.md
90 OBSIDIAN/Contracts/obsidian.contracts.note-types.md
```

Together they define:

- how durable notes are named
    
- what properties they contain
    
- how notes are classified
    
- how authority and lifecycle are represented
    

## Naming Standard

Durable notes use dot notation:

```text
<scope-or-project>.<domain>.<artifact>.<kind>.md
```

Examples:

```text
vouch.payments.lifecycle.contract.md
rateltd.commands.registry.contract.md
obsidian.contracts.naming-standard.md
nextjs.app-router.caching.reference.md
```

Folders provide broad placement.

Filenames provide stable semantic identity.

## Note Types

Standard note types and kinds include:

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
```

Not every note is a contract.

Raw ideas remain captures until they are ready to become durable notes.

## Durable Note Properties

Durable notes use this frontmatter structure:

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

Frontmatter must be the first thing in the file.

Internal vault relationships use Obsidian wikilinks.

External websites use Markdown links.

## Authority

The `authority` property describes how a note should be treated:

```text
source-of-truth
working-note
reference
derived
legacy
archive
```

The `status` property describes its lifecycle:

```text
draft
active
review
deprecated
superseded
archived
legacy
```

This prevents raw captures, research, and old notes from being mistaken for active source-of-truth material.

## Capture and Promotion

New material may begin as a capture in `00 ZETTELKASTEN`.

When it becomes durable, it is classified, renamed, given valid frontmatter, linked appropriately, and moved into its correct destination.

The inbox is temporary.

It is not intended to become a permanent archive of unprocessed material.

## Repository Role

The connected GitHub repository is:

```text
DigitalHerencia/DevNotes
```

ChatGPT may create, update, rename, move, or delete notes in that repository when instructed by the user.

The local Obsidian vault is updated by synchronizing the Git repository.

## Operating Principles

DevNotes follows these principles:

- preserve the numbered top-level folder structure
    
- use dot-notation filenames for durable notes
    
- keep raw capture separate from durable knowledge
    
- keep source-of-truth material clearly identified
    
- preserve internal relationships with wikilinks
    
- avoid unnecessary duplication
    
- avoid inventing new systems when the existing contracts already apply
    
- make the smallest change that satisfies the task
    
- keep the vault understandable for one person
    

## File Format Roles

```text
Markdown = human-readable notes and explanation
YAML     = structured metadata and contracts
JSON     = execution state and logs
```

## Basic Git Workflow

From the vault root:

```powershell
git status --short
git pull
git add -A
git commit -m "describe the DevNotes change"
git push
```

Open the vault homepage:

```powershell
obsidian open path="devnotes.home.md"
```

## Final Rule

DevNotes is not a team documentation platform or a corporate knowledge-management program.

It is a personal, source-controlled knowledge system maintained by the user with assistance from ChatGPT.

Its purpose is to keep useful information organized, durable, searchable, linked, and synchronized without creating unnecessary maintenance work.