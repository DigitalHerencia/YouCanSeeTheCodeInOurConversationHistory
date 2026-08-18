---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\STRUCTURE.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\STRUCTURE.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.acquire-codebase-knowledge.assets.templates.structure.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\STRUCTURE.md'
source_file: 'STRUCTURE.md'
source_sha256: '29a5a387c894135c41c74a1b3e629ece88707c0a56aa9e4153ec9682f5c0c373'
generated: true
---

# `STRUCTURE.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\acquire-codebase-knowledge\assets\templates\STRUCTURE.md`
> SHA-256: `29a5a387c894135c41c74a1b3e629ece88707c0a56aa9e4153ec9682f5c0c373`

```markdown
# Codebase Structure

## Core Sections (Required)

### 1) Top-Level Map

List only meaningful top-level directories and files.

| Path | Purpose | Evidence |
|------|---------|----------|
| [path/] | [purpose] | [source] |

### 2) Entry Points

- Main runtime entry: [FILE]
- Secondary entry points (worker/cli/jobs): [FILES or NONE]
- How entry is selected (script/config): [NOTE]

### 3) Module Boundaries

| Boundary | What belongs here | What must not be here |
|----------|-------------------|------------------------|
| [module/layer] | [responsibility] | [forbidden logic] |

### 4) Naming and Organization Rules

- File naming pattern: [kebab/camel/Pascal + examples]
- Directory organization pattern: [feature/layer/domain]
- Import aliasing or path conventions: [RULE]

### 5) Evidence

- [path/to/root-tree-source]
- [path/to/entry-config]
- [path/to/key-module]

## Extended Sections (Optional)

Add only when repository complexity requires it:

- Subdirectory deep maps by feature/layer
- Middleware/boot order details
- Generated-vs-source layout boundaries
- Monorepo workspace-level structure maps

```