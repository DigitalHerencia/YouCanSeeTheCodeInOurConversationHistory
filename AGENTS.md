# Vault Contract

## Scope

This repository is an Obsidian vault. Preserve Markdown portability and Obsidian-native behavior.

## Invariants

1. PARA is the durable filing system: Projects, Areas, Resources, Archive.
2. `AMOEBA`, `DAILY`, `HABITS`, `HEARTH`, and `SYSTEM` are workflow infrastructure, not competing taxonomies.
3. `CIGARETTES, REGRETS, & NEURAL NETS`, `ZETTLECASTEN`, and `assets` are preserved collections.
4. Properties are reserved for lifecycle, progress, dates, priority, cadence, relationships required by plugins, and configuration. Do not encode subject classification in arbitrary properties.
5. Tags are for classification, grouping, search, and filtering.
6. Use spaces, never tabs, in authored Markdown/YAML.
7. Do not use emoji as semantic UI. Prefer Lucide/Iconic icons and CSS color semantics.
8. New project work uses Kanban + TaskNotes with milestones, phases, and tasks.
9. LeetCode/school/homework concepts are translated to TypeScript study and stack-syntax writing drills.
10. Do not reintroduce the old role-folder architecture.

## Promotion flow

Capture in Amoeba. Refactor or promote the note into PARA or Zettelkasten when it becomes durable. Archive only through PARA lifecycle state.
