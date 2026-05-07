Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path ".obsidian")) {
  throw "Run this from the DevNotes vault root."
}

function Ensure-Dir {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    New-Item -ItemType Directory -Force -Path $Path | Out-Null
    Write-Host "DIR + $Path" -ForegroundColor Green
  }
}

function Write-Note {
  param(
    [string]$Path,
    [string]$Content
  )

  $parent = Split-Path -Path $Path -Parent
  if ($parent) { Ensure-Dir $parent }

  if (Test-Path -LiteralPath $Path) {
    Write-Host "SKIP exists: $Path" -ForegroundColor Yellow
    return
  }

  $Content | Set-Content -LiteralPath $Path -Encoding UTF8
  Write-Host "WRITE $Path" -ForegroundColor Cyan
}

Ensure-Dir "90 OBSIDIAN/Contracts"
Ensure-Dir "90 OBSIDIAN/Workflows"
Ensure-Dir "90 OBSIDIAN/Dashboards"
Ensure-Dir "90 OBSIDIAN/OB-Templates/Contracts"

$naming = @'
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
---

# Obsidian Contract Naming Standard

## Core Standard

This vault uses a hybrid knowledge architecture:

- Numbered all-caps folders for top-level navigation.
- Dendron-style dot notation for semantic file identity.
- Zettelkasten extraction for atomic note growth.
- Contract-style notes for source-of-truth project rules.
- Obsidian properties for machine-readable metadata.
- Links for graph relationships.

## Naming Formula

    project.domain.artifact.kind.md

Examples:

    rateltd.commands.registry.contract.md
    rateltd.tui-shell.layout.contract.md
    vouch.payments.lifecycle.contract.md
    vouch.authz.roles.contract.md
    ctrlplus.visualizer.pipeline.contract.md
    obsidian.zettelkasten.amoeba-workflow.md

## Folder Rule

Folders are neighborhoods. File names carry identity.

Top-level folders:

    00 ZETTELKASTEN
    10 PROJECTS
    20 DOCUMENTATION
    30 DEEP RESEARCH
    40 TECH STACK
    50 REGRETS, CIGARETTES, & NEURAL NETS
    90 OBSIDIAN

## File Identity Rule

A durable note name should answer:

1. What project or scope owns this?
2. What domain does it belong to?
3. What artifact is it describing?
4. What kind of note is it?

## Good Names

    vouch.readiness.gates.contract.md
    vouch.payments.lifecycle.contract.md
    rateltd.commands.execution.contract.md
    ctrlplus.architecture.boundaries.contract.md

## Bad Names

    Notes.md
    Plan.md
    New Spec.md
    Random Thoughts.md

## Numbers

Use numbers for folder ordering only.

Use dot notation for semantic identity.

## Standard Kinds

- contract
- map
- workflow
- reference
- research
- checklist
- work-package
- handoff
- standard
- dashboard
- legacy

## Standard Statuses

- draft
- active
- review
- deprecated
- superseded
- archived

## Standard Authority Levels

- source-of-truth
- working-note
- reference
- derived
- legacy
- archive
'@

Write-Note "90 OBSIDIAN/Contracts/obsidian.contracts.naming-standard.md" $naming

$properties = @'
---
title: Obsidian Contract Property Schema
type: standard
scope: vault
project:
domain: obsidian
artifact: properties
kind: schema
namespace: obsidian.contracts.property-schema
status: active
authority: source-of-truth
parent: "[[obsidian.contracts.naming-standard]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - obsidian/contracts
  - obsidian/properties
  - status/active
---

# Obsidian Contract Property Schema

## Required Properties for Durable Notes

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

## Property Meanings

| Property | Meaning |
|---|---|
| title | Human-readable title. |
| type | Broad note class: contract, map, workflow, reference, research, writing, execution. |
| scope | Boundary: vault, project, domain, feature, module, operation, reference. |
| project | Owning project when applicable. |
| domain | Rule boundary or topic area. |
| artifact | Specific thing inside the domain. |
| kind | Specific note kind. |
| namespace | Dot-notation semantic address. |
| status | Lifecycle state. |
| authority | Whether the note is source-of-truth, reference, draft, legacy, etc. |
| parent | Primary parent note or map. |
| depends_on | Notes this note relies on. |
| supersedes | Older notes replaced by this note. |
| tags | Search and filter labels. |

## Example

    ---
    title: RateLtd Commands Registry Contract
    type: contract
    scope: project
    project: RateLtd
    domain: commands
    artifact: registry
    kind: contract
    namespace: rateltd.commands.registry.contract
    status: active
    authority: source-of-truth
    parent: "[[rateltd.project.map]]"
    depends_on:
      - "[[rateltd.product.vision]]"
    supersedes: []
    tags:
      - projects/rateltd
      - contracts/commands
      - status/active
    ---

## Rule

Every serious note should be findable by:

- folder
- namespace
- project
- domain
- kind
- status
- authority
'@

Write-Note "90 OBSIDIAN/Contracts/obsidian.contracts.property-schema.md" $properties

$noteTypes = @'
---
title: Obsidian Contract Note Types
type: standard
scope: vault
project:
domain: obsidian
artifact: note-types
kind: standard
namespace: obsidian.contracts.note-types
status: active
authority: source-of-truth
parent: "[[obsidian.contracts.naming-standard]]"
depends_on:
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - obsidian/contracts
  - obsidian/note-types
  - status/active
---

# Obsidian Contract Note Types

## Contract

A source-of-truth rule document. Contracts define what must be true, what must not happen, and how work is judged.

## Map

A navigation note. Maps gather links, dashboards, and summaries for a project, domain, or workflow.

## Workflow

A repeatable operating procedure.

## Reference

Stable supporting knowledge. Reference notes explain tools, APIs, libraries, standards, or concepts.

## Research

Exploratory or investigative material. Research notes may become contracts later.

## Work Package

A bounded implementation job for Codex, ChatGPT, or a human operator.

## Handoff

A state-transfer note that lets the next operator resume work without re-discovery.

## Dashboard

A Dataview-powered operating surface.

## Legacy

A preserved note that may still contain useful information but is no longer the active source of truth.

## Rule

Do not force every note to become a contract.

Contracts are for durable truth.
Zettelkasten notes are for growth.
Research notes are for discovery.
Work packages are for execution.
'@

Write-Note "90 OBSIDIAN/Contracts/obsidian.contracts.note-types.md" $noteTypes

$workflow = @'
---
title: Obsidian Zettelkasten Amoeba Workflow
type: workflow
scope: vault
project:
domain: obsidian
artifact: zettelkasten
kind: workflow
namespace: obsidian.zettelkasten.amoeba-workflow
status: active
authority: source-of-truth
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - obsidian/zettelkasten
  - obsidian/workflows
  - status/active
---

# Obsidian Zettelkasten Amoeba Workflow

## Purpose

Turn messy scratch notes into durable atomic notes without killing flow.

## Capture

Raw thoughts go in:

    00 ZETTELKASTEN

Capture notes may be messy. They are not required to follow contract structure.

## Extract

When a section becomes useful:

1. Highlight the useful section.
2. Use Note Composer or Note Refactor to extract it.
3. Give the new note a semantic dot-name.
4. Add basic properties.
5. Replace the source section with a link.

## Example

Source idea:

    RateLtd needs one canonical command registry. Commands should be searchable, executable, logged, and tied to PowerShell handlers.

Extracted note:

    10 PROJECTS/RateLtd/20 CONTRACTS/commands/rateltd.commands.registry.contract.md

Source note becomes:

    See [[rateltd.commands.registry.contract]]

## Rule

Scratch notes are allowed to be messy.

Contract notes are not.
'@

Write-Note "90 OBSIDIAN/Workflows/obsidian.zettelkasten.amoeba-workflow.md" $workflow

$cli = @'
---
title: Obsidian CLI Workflow
type: workflow
scope: vault
project:
domain: obsidian
artifact: cli
kind: workflow
namespace: obsidian.cli.workflow
status: active
authority: source-of-truth
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - obsidian/cli
  - obsidian/workflows
  - status/active
---

# Obsidian CLI Workflow

## Common Inventory Commands

    obsidian files
    obsidian folders
    obsidian folders total
    obsidian files total
    obsidian tags counts sort=count
    obsidian properties counts sort=count
    obsidian orphans total
    obsidian deadends total
    obsidian unresolved counts

## Search

    obsidian search query="rateltd.commands"
    obsidian search query=".contract"
    obsidian search query="vouch.payments"

## Read

    obsidian read path="10 PROJECTS/RateLtd/00 PROJECT MAP/rateltd.project.map.md"

## Move

    obsidian move path="old/path.md" to="new/path.md"

## Properties

    obsidian property:set path="note.md" name="status" value="active" type=text
    obsidian property:set path="note.md" name="type" value="contract" type=text
    obsidian property:read path="note.md" name="namespace"

## Daily Operating Loop

1. Capture quickly.
2. Extract good sections.
3. Promote durable rules into contracts.
4. Link contracts to project maps.
5. Use Dataview dashboards to inspect the system.
'@

Write-Note "90 OBSIDIAN/Workflows/obsidian.cli.workflow.md" $cli

$dashboard = @'
---
title: Contract Dashboard
type: dashboard
scope: vault
project:
domain: obsidian
artifact: contracts
kind: dashboard
namespace: obsidian.dashboard.contracts
status: active
authority: reference
parent:
depends_on:
  - "[[obsidian.contracts.property-schema]]"
supersedes: []
tags:
  - obsidian/dashboard
  - contracts
  - status/active
---

# Contract Dashboard

## Active Contracts

    TABLE project, domain, artifact, kind, status, authority
    FROM "10 PROJECTS" OR "90 OBSIDIAN"
    WHERE type = "contract" AND status = "active"
    SORT project ASC, domain ASC, artifact ASC

## Draft Contracts

    TABLE project, domain, artifact, kind, updated
    FROM "10 PROJECTS" OR "90 OBSIDIAN"
    WHERE type = "contract" AND status = "draft"
    SORT updated DESC

## Source-of-Truth Notes

    TABLE type, project, domain, artifact, status
    FROM ""
    WHERE authority = "source-of-truth"
    SORT project ASC, domain ASC

## Work Packages

    TABLE project, domain, status, updated
    FROM "10 PROJECTS"
    WHERE kind = "work-package"
    SORT updated DESC

## Note

Convert the indented Dataview queries into Dataview code blocks inside Obsidian if needed.
'@

Write-Note "90 OBSIDIAN/Dashboards/obsidian.dashboard.contracts.md" $dashboard

Write-Host ""
Write-Host "PASS 3A COMPLETE" -ForegroundColor Green
git status --short