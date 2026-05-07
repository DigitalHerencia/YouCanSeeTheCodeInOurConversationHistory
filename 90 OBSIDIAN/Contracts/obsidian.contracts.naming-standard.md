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
