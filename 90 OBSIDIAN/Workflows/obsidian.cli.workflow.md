---
title: Obsidian CLI Workflow
type: workflow
scope: vault
project:
domain: obsidian
artifact: cli
kind: workflow
namespace: obsidian.cli.workflow
status: active
authority: source-of-truth
parent:
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - obsidian/cli
  - obsidian/workflows
  - status/active
---

# Obsidian CLI Workflow

## Common Inventory Commands

    obsidian files
    obsidian folders
    obsidian folders total
    obsidian files total
    obsidian tags counts sort=count
    obsidian properties counts sort=count
    obsidian orphans total
    obsidian deadends total
    obsidian unresolved counts

## Search

    obsidian search query="rateltd.commands"
    obsidian search query=".contract"
    obsidian search query="vouch.payments"

## Read

    obsidian read path="10 PROJECTS/RateLtd/00 PROJECT MAP/rateltd.project.map.md"

## Move

    obsidian move path="old/path.md" to="new/path.md"

## Properties

    obsidian property:set path="note.md" name="status" value="active" type=text
    obsidian property:set path="note.md" name="type" value="contract" type=text
    obsidian property:read path="note.md" name="namespace"

## Daily Operating Loop

1. Capture quickly.
2. Extract good sections.
3. Promote durable rules into contracts.
4. Link contracts to project maps.
5. Use Dataview dashboards to inspect the system.
