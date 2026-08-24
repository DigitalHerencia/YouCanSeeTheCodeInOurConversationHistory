# DevNotes Agent Instructions

## Purpose

DevNotes is a private, source-controlled Obsidian knowledge and project-management vault. Treat it as a knowledge system, not a normal software repository.

## Authority

The unified system is authoritative. Read the relevant human contracts under `DevNotes/Canon/Unified System/` and their machine projections under `.system/` before changing note structure, metadata, templates, or automation.

Responsibility is represented by the role folder. `workspace` identifies a project or objective. `system` identifies reusable doctrine. `namespace` is stable semantic identity. Properties and typed wikilinks supply independent classification and relationships.

The retired numbered roots and generated Source Mirror must not be recreated. Live source belongs in Code Space, not copied into Markdown wrappers.

## Human-facing roots

```text
Chief of Staff/
Trust Issues/
Execution/
Vibes/
DevNotes/
Schemes/
Prömpter/
Fuck You Pay Me/
```

Support lives in `.system/`, `_obsidian/`, `_ops/`, `_mounts/`, and `_assets/`.

Within a role, use `Canon/`, `Workspaces/`, `Reference/`, and `Archive/` only when the responsibility exists.

## Note workflow

1. Decide whether material is raw capture or durable knowledge.
2. Check existing notes to avoid duplication or silent replacement.
3. Choose the responsibility owner and applicable workspace/system facets.
4. Create or update the smallest useful durable note.
5. Use wikilinks for vault notes and Markdown links for external URLs.
6. Keep volatile provider/repository facts linked to live evidence instead of copying them repeatedly.

Raw material goes to `DevNotes/Inbox`. Project work goes to the applicable role’s `Workspaces/<workspace>/`. Shared doctrine goes to the applicable role’s `Canon/`. Historical material goes to `DevNotes/Archive` or the responsible role’s `Archive/`.

## Unified properties

New durable notes use these properties:

```yaml
---
title:
namespace:
role:
system:
workspace:
type:
status:
authority:
created:
updated:
tags:
---
```

Keep the keys present. `system` and `workspace` may be empty when they do not apply. Add project, research, decision, validation, or relationship properties only when useful.

Do not silently promote captures, research, archived material, or generated evidence to canonical authority. Preserve superseded knowledge only when it still has retrieval or provenance value.

## Obsidian interaction layer

- Hearth is the command center, not a second source of truth.
- TaskNotes and Bases own task, Kanban, agenda, and calendar views.
- Meta Bind edits properties.
- Note Toolbar executes context commands.
- QuickAdd chooses note type and destination.
- Templater supplies deterministic document shape only after the context is known.
- Callouts annotate semantics; they do not replace lifecycle or authority properties.
- Code Space exposes only `D:\TheCodependentCodingWebAppArchitecture` through `_mounts/CodependentCoding`.

Favor changes the user directly interacts with. Do not add taxonomies, naming churn, dashboards, plugins, or automation that do not improve capture, retrieval, project execution, or daily use.

## Repository operations

Inspect status and existing files before editing. Preserve unrelated work. Use focused checks and report unrun checks honestly. Do not start watchers, broad builds, migrations, deployments, or destructive jobs unless required by the request.

Deletion is allowed when explicitly requested. Resolve exact targets, check references, and do not delete unrelated material. Keep `.agent-logs` history intact.

Use `DigitalHerencia/DevNotes` as the remote source of truth. Do not expose secrets or private content in logs, commits, Issues, or pull requests.
