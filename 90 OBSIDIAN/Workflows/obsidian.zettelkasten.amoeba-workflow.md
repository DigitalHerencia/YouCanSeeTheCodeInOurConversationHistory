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
