# Hearth Source Asset Manifest

## Purpose

This file tells Codex what source material is expected to be present before implementation.

## Required inputs

### 1. Notion export

The exported Markdown/CSV/assets for the Digital Herencia workspace.

Required content:

- Projects database/pages
- Tasks database/pages
- Meetings database/pages/templates
- SOPs: Cycles, Procedures, Ticketing, Tech Stack, Dev, Teams
- any attached images/assets used by the dashboard/templates

The export is the migration source. Do not reconstruct it from memory once the export is present.

### 2. CodependentCoding

Repository containing:

- Maximal Template
- nine application ontologies
- Book of Knowledge
- Book of Implementation
- AGENTS/contracts/execution material
- implementation code/templates/tests

The existing repo is expected to be mounted in Code Space. If an additional mount is provided, prefer the freshest complete source and record which source was selected.

### 3. Existing Hearth vault

The Git repository being modified by Codex, including `.obsidian` and the existing system assets.

### 4. Hearth implementation package

- `Hearth-System-Engineering-Spec-v0.4.md`
- `Hearth-Property-Registry-v0.1.md`
- `Hearth-Codex-AGENTS.md`
- `Hearth-Codex-GOAL.md`
- `Hearth-Implementation-Work-Package-v0.2.md`

## Source selection rule

When two sources disagree:

1. current live vault/plugin behavior beats an old planning artifact for implementation details;
2. explicit current user decisions encoded in Hearth spec beat legacy vault conventions;
3. the supplied Notion export beats reconstructed memories of Notion data;
4. CodependentCoding Book/contract material beats generic coding conventions for the Code Lab and engineering documentation model.

## Source integrity rule

Codex must record the source files actually used in the implementation report. Do not silently substitute summaries for the full source corpus when the corpus is present.
