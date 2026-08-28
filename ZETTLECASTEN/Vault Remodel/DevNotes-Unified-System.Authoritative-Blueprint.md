---
title: DevNotes Unified Knowledge & Engineering System
namespace: devnotes.system.unified.authoritative-blueprint
role: devnotes
system: devnotes
workspace:
type: source-document
status: active
authority: canonical
created: 2026-08-23
updated: 2026-08-23
tags:
  - devnotes/system
  - authority/canonical
---

# DevNotes Unified Knowledge & Engineering System

## Definition

DevNotes is a source-controlled knowledge-and-engineering operating system whose durable substrate is Markdown, Properties, links, Git history, machine contracts, and connected evidence, and whose primary human interface is Obsidian.

It unifies:

```text
8 ChatGPT responsibility domains
+ philosophical/computer-science knowledge model
+ Codependent Coding engineering doctrine
+ project/workspace state
+ live repository/provider evidence
+ Obsidian interaction surfaces
```

## Root bounded contexts

```text
DevNotes/
├── Chief of Staff/
├── Trust Issues/
├── Execution/
├── Vibes/
├── DevNotes/
├── Schemes/
├── Prömpter/
├── Fuck You Pay Me/
├── .system/
├── _obsidian/
├── _ops/
├── _mounts/
└── _assets/
```

The physical folder answers **who owns this knowledge by responsibility**.

The `workspace` property answers **which project/product/objective it belongs to**.

The `system` property answers **which reusable doctrine/system it instantiates**.

## Role model

| Role | Formal responsibility | Core question |
|---|---|---|
| Chief of Staff | Organization & Lifecycle | What are we trying to accomplish and what state is the work in? |
| Trust Issues | Epistemology & Evidence | How do we know this is true? |
| Execution | Function & Implementation | What does the system do and how is behavior realized? |
| Vibes | Architecture & Topology | How is the system constructed, connected, and operated? |
| DevNotes | Knowledge & Classification | What do we know and how can it be recovered? |
| Schemes | Ontology & Modeling | What exists, relates, and is valid? |
| Prömpter | Language & Semantics | What do we call it and how is intent communicated? |
| Fuck You Pay Me | Domain & External Reality | What real-world entities, obligations, and external authorities matter? |

## Knowledge-model grammar

```text
Trust Issues
  Epistemology
      ↓
Schemes
  Ontology + Domain Model
      ↓
Prömpter
  Terminology + Nomenclature + Semantics
      ↓
DevNotes
  Taxonomy + Metadata + Facets + IA + Knowledge Graph
      ↓
Vibes
  Mereology + Topology + Architecture
      ↓
Schemes + Execution
  Schema + Typology + Domain Implementation
      ↓
Trust Issues
  Validation + Evidence
```

This is a dependency model, not a mandatory chronological workflow.

## Software development loop

```text
Chief of Staff
  objective / requirement
      ↓
Schemes
  ontology / domain model
      ↓
Prömpter
  precise specification language
      ↓
Vibes
  architecture / technical placement
      ↓
Execution
  implementation
      ↓
Trust Issues
  verification / evidence
      ↓
DevNotes
  durable knowledge
      ↓
Chief of Staff
  advance project state
```

Fuck You Pay Me participates when customer, vendor, billing, payment, obligation, or other external business truth matters.

## Codependent Coding kernel

Codependent Coding is not a new root filing category.

Reusable doctrine:

```yaml
system: codependent-coding
workspace:
```

The active project building the architecture:

```yaml
system: codependent-coding
workspace: codependent-coding
```

The role folder owns the artifact according to responsibility.

## Human structure inside a role

```text
<Role>/
├── Canon/
├── Workspaces/
├── Reference/
└── Archive/
```

Create only directories that have a real responsibility.

## Cross-cutting machine structure

```text
.system/
├── contracts/
├── schemas/
├── registries/
├── authority/
├── validation/
├── provenance/
└── state/
```

## Prefix semantics

```text
.name    machine-readable deterministic representation
Name     human-readable durable knowledge
_name    operational / interface / support artifact
```

Prefix does not establish epistemic authority.

A human canonical owner and its machine contract represent the same doctrine. If they disagree, the system has **governance drift**.

## Information architecture

Folders provide one primary home.

Properties provide independent facets.

Links provide semantic graph edges.

Bases provide dynamic collections.

Hearth provides the operating shell.

Code Space provides a live-code portal.

## Obsidian UX contract

```text
Hearth         shell / dashboard
Bases          taxonomy + facets + retrieval
Meta Bind      property controls
Templater      deterministic note generation
QuickAdd       friendly commands (recommended addition)
Note Toolbar   context commands
Callout Studio semantic signaling
Code Space     live implementation access
Canvas         spatial topology/ontology views
Git            provenance/version history
```

The user should not have to manually operate the schema.

## Epistemic contract

No global source owns every fact.

```text
user intent / genuine decision → user
engineering doctrine           → accepted Codependent Coding canon
project behavior               → accepted workspace spec / decision
actual implementation          → live repository
GitHub state                   → GitHub
deployment state               → deployment platform
financial fact                 → financial provider
mail/calendar fact             → corresponding live system
validation result              → executed evidence
durable institutional memory   → DevNotes canonical artifact
```

## Migration invariant

Adoption is overlay-first and no-delete.

No note moves merely to make the new tree look complete.

## Governing sentence

> **Role determines primary ownership. Workspace and system are facets. The knowledge model defines meaning. Codependent Coding governs software work. Obsidian recomposes the graph into the view needed. Live systems remain authority for their own volatile facts.**
