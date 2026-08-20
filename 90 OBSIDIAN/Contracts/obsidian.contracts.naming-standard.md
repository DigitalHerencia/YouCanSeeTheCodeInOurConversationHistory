---
title: Obsidian Contract Naming Standard
type: standard
scope: vault
project:
domain: obsidian
artifact: naming
kind: standard
namespace: obsidian.contracts.naming-standard
status: active
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - obsidian/contracts
  - obsidian/naming
  - status/active
created:
updated: 2026-08-19
---
# Obsidian Contract Naming Standard

## Core Standard

DevNotes uses:

- Numbered top-level folders for navigation.
- Dot-notation filenames for durable note identity.
- Zettelkasten capture for unfinished notes.
- Contract notes for durable source-of-truth rules.
- Obsidian properties for structured metadata.
- Wikilinks for relationships between vault notes.

## Naming Formula

```
<scope-or-project>.<domain>.<artifact>.<kind>.md
```

Examples:

```
rateltd.commands.registry.contract.md
rateltd.tui-shell.layout.contract.md
vouch.payments.lifecycle.contract.md
vouch.authz.roles.contract.md
ctrlplus.visualizer.pipeline.contract.md
obsidian.contracts.naming-standard.md
obsidian.zettelkasten.amoeba-workflow.md
devnotes.home.map.md
```

## Folder Rule

Folders provide broad placement.

File names provide durable semantic identity.

Top-level folders:

```
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

### Codependent Coding placement rule

The current Codependent Coding organization intentionally uses two different vault areas for two different responsibilities:

```text
60 CODEPENDENT CODING
  = canonical flat knowledge-system corpus

10 PROJECTS/10.PROJECTS.CODEPENDENTCODING
  = active project-owned architecture, Simples, source mirror, and execution/context
```

Do not move active project material back into `60 CODEPENDENT CODING` merely because older paths or documents used that location. Do not move the flat canonical corpus into the project folder unless the user explicitly requests a further restructuring.

`40 ARCHIVE` is preserved historical/deprecated material and must not silently carry active source-of-truth authority.

## File Identity Rule

A durable note filename should answer:

1. What project or scope owns it?
2. What domain does it belong to?
3. What artifact does it describe?
4. What kind of note is it?

## Good Names

```
vouch.readiness.gates.contract.md
vouch.payments.lifecycle.contract.md
rateltd.commands.execution.contract.md
ctrlplus.architecture.boundaries.contract.md
obsidian.contracts.property-schema.md
```

## Bad Names

```
Notes.md
Plan.md
New Spec.md
Random Thoughts.md
```

## Numbering Rule

Use numbers for folder ordering.

Do not use numbers as the primary identity of durable notes unless the number is meaningful to the document itself.

## Standard Note Values

The standard values used by `type` and `kind` are:

```
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

The `type` property identifies the broad note class.

The `kind` property identifies the specific document shape. It may match `type` when no narrower distinction is needed. `simple` is reserved for first-class Codependent Coding Simple records as defined by the property-schema and note-types contracts.

## Standard Statuses

```
draft
active
review
deprecated
superseded
archived
legacy
```

## Standard Authority Levels

```
source-of-truth
working-note
reference
derived
legacy
archive
```
