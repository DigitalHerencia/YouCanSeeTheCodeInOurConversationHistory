---
title: Digital Herencia No-Delete Migration Manifest
type: migration
entity: migration
status: Active
authority: Source of Truth
created: 2026-08-29
updated: 2026-08-29
tags:
  - digital-herencia
  - migration
  - no-delete
---

# No-Delete Migration Manifest

## Migration rule

The Digital Herencia Notion operating model replaces the active role-based DevNotes shell **without deleting or reorganizing the existing vault**.

## Preserved in place

All pre-existing notes and folders remain at their existing paths.

In particular, no migration edits are made inside:

- `ZETTLECASTEN/`
- `CIGARETTES, REGRETS, & NEURAL NETS/`

## Superseded active files preserved

Exact pre-transition blobs are preserved under `Legacy/System/` for:

- `AGENTS.md`
- `README.md`
- `DevNotes Home.md`
- `DevNotes.base`
- `.obsidian/plugins/hearth/data.json`

## New active layer

The new material lives under `Digital Herencia/` and consists of:

- source-derived entity notes
- Bases
- SOPs
- templates
- operating-model contracts
- navigation

## Retrieval migration

`Digital Herencia/Bases/Library.base` indexes the entire Markdown vault, including notes that retain legacy metadata or live in the old folder structure. This is how current notes participate in the new system without destructive mass-conversion.

## Explicit exclusions

This transition does not add or configure:

- ChatGPT Project orchestration
- Codependent Coding governance
- external application integrations
- repository mounts
- new plugin dependencies

## Deletion count

**0 files deleted.**

## Move count

**0 existing notes moved.**
