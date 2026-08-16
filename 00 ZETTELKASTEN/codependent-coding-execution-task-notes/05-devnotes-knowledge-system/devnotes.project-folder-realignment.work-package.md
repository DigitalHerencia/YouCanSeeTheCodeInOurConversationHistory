---
title: "Realign DevNotes Project Folders to the New Product Topology"
type: work-package
scope: project
project: "DevNotes Knowledge System"
domain: "knowledge-migration"
artifact: "project-folder-realignment"
kind: work-package
namespace: devnotes.project-folder-realignment.work-package
status: active
authority: working-note
parent: "[[devnotes.execution.tasks.map]]"
depends_on:
  - "[[devnotes.deprecate-old-knowledge-system.work-package]]"
supersedes: []
tags:
  - projects/devnotes
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Knowledge Migration"
---

# Realign DevNotes Project Folders to the New Product Topology

**Priority:** P0  
**Phase:** Knowledge Migration  
**Task status:** Backlog

## Outcome

Make project definitions and maps reflect the actual current projects: Codependent Coding WebApp Architecture, Hipster Stack/Constituter, Maximal Template, and Loaded Vibes plugin.

## Why This Exists

Existing project folders still describe Codependent Coding as the adaptive software product and Loaded Vibes as the generator.

## Execution Checklist

- [ ] Rewrite `10 PROJECTS/CodependentCoding` project definition/map around the governing WebApp Architecture and its canonical-source role.
- [ ] Rewrite `10 PROJECTS/LoadedVibes` around the Codex plugin, moving generator-era documents to superseded/archive status.
- [ ] Create or normalize a `TheHipsterStack` project folder for generator/CLI/Constituter execution material if one does not already exist.
- [ ] Create or normalize a `TheMaximalTemplate` project folder for showroom/hardening/backlog execution material if one does not already exist.
- [ ] Link each project to its canonical source owners rather than duplicating doctrine.
- [ ] Update `devnotes.projects.map.md`.
- [ ] Ensure repository URLs and redirects are represented accurately.

## Acceptance Criteria

- [ ] Project folder identity matches the new master topology.
- [ ] Generator work is owned by Hipster Stack, plugin work by Loaded Vibes, template work by Maximal Template.
- [ ] Project maps point to canonical architecture rather than re-explaining it.

## Dependencies

- [[devnotes.deprecate-old-knowledge-system.work-package]]

## Source Basis

- 10 PROJECTS/CodependentCoding/*
- 10 PROJECTS/LoadedVibes/*
- `devnotes.projects.map.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
