---
title: Digital Herencia Source Inventory
type: migration-evidence
entity: source-inventory
status: Active
authority: Reference
created: 2026-08-29
updated: 2026-08-29
tags:
  - digital-herencia
  - migration
  - source-inventory
---

# Source Inventory

## Notion collections inspected

| Collection | Migrated shape |
|---|---|
| Meetings | Meeting-series notes + cadence Base |
| Teams | Team notes + Teams Base |
| Projects | Project notes + Status / By Team / All views |
| Tasks | Task notes + Open / Done views |
| Portfolio | Project-level portfolio items + Portfolio Base |
| Schedule | Project work-date projection |
| SOPs | Six source-derived SOP notes + SOP index |
| Tech Stack | Individual tech-stack records + grouped Base |
| Regrets, Cigarettes, & Neural Nets | Catalog + existing Obsidian writing folder surfaced without modification |

## Source schemas preserved

### Projects

`Name`, `Archive`, `Domain`, `Milestone`, `Phase`, `Status`, `Work dates`, `Team`, `Tasks`, `Meetings`.

### Tasks

`Name`, `Task Code`, `Done`, `Created time`, `Project`, `Team`, `Meetings`.

### Meetings

`Name`, `Created`, `Archived`, `Team`, `Projects`, `Cadence`, `Type`.

### Teams

`Team name`, `Projects`, `Tasks`, `Meetings`, completion formulas.

### Portfolio

`Name`, `Status`, parent/sub-item relations, Teams, Projects, Tasks, Meetings.

## Fidelity notes

- Existing vault notes were not mass-converted to Digital Herencia Properties. They are exposed through Library views.
- Historical dated meeting instances were not duplicated into dozens of new Markdown files; the recurring series/cadence and relationship model were migrated as the durable operating model.
- Several task rows were retrieved before Notion's query allowance was exhausted, but the compact response did not expose the final `Done` value for every row. Those records carry `source_done: unknown` and `status: backlog` rather than fabricated completion state.
- Source `Task Code` values `TO2` and `TO3` are preserved where retrieved.
- The large `Dev` SOP was represented by its recovered DevCycle semantics and original source URL rather than silently inventing missing sections.

These are explicit fidelity boundaries, not hidden guesses.
