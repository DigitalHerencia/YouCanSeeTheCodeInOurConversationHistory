# Vault Operating Model

## Purpose

This SOP defines the implemented Obsidian vault as a single operating system. It governs storage, object ownership, creation, interaction, navigation, and archival.

## Storage

`1.PROJECTS` contains active project execution.
`2.AREAS` contains ongoing workbenches and operating systems.
`3.RESOURCES` contains reusable external knowledge and references.
`4.ARCHIVE` contains inactive, completed, or superseded material.

## Core object model

Project → Milestone → Phase → RoadMap → Task

Code Lab: Domain → Dev Cycle → Standard → Pattern → Code Artifact

Zettelkasten: Inbox / AI Threads / Clippings → Fleeting / Literature → Resources

## Ownership

- QuickAdd creates and routes workflow objects.
- Templater renders approved templates and deterministic user scripts.
- Meta Bind edits interactive metadata.
- TaskNotes owns task lifecycle and task views.
- Kanban owns milestone board state; cards are phases only.
- Bases provides structured vault views.
- Hearth presents dashboards and cards.
- Note Toolbar provides contextual navigation and actions.
- CodeSpace edits mounted code.
- Git versions the vault and mounted repository state.
- Linter normalizes Markdown/YAML formatting.
- Iconic controls visual file/folder identity.
- Callout Studio provides standardized semantic callouts.

No plugin silently assumes another plugin's ownership.

## Interaction rule

Creation follows QuickAdd → Templater → object storage. Editing follows Meta Bind / native editor. Presentation follows Bases / Hearth. Versioning follows Git.

## Naming rule

Stable identifiers are generated once and then preserved. Human-readable names may change without changing the object's identifier.

## Archive rule

Archive moves inactive material out of active workflows. Archived material is not used by active dashboards unless explicitly queried.

## Exclusions

Dataview is not used. Generic Kanban boards are not used. Goal is not a project hierarchy object. Obsidian Setup.md is not part of the operating model.
