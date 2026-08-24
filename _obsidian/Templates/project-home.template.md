---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'project') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "project"
status: "active"
authority: "project-specific"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# <% tp.file.title %>

> [!truth] Project Definition
> One sentence defining the outcome.

## Control Surface

Status: `INPUT[dn-status][:status]`

Priority: `INPUT[dn-priority][:priority]`

Health: `INPUT[dn-health][:health]`

Progress: `INPUT[dn-progress][:progress]`

Target: `INPUT[date:target]`

Repository: `INPUT[text:repository]`

## Current State
## Next Action
## Current Milestone
## Blockers
## Decisions Needed
## Governance
## Active Specifications
## Work

![[_obsidian/Bases/TaskNotes/kanban-default.base#Kanban]]

![[_obsidian/Bases/TaskNotes/agenda-default.base#Agenda]]

## Recent Decisions
## Research
## Code / Repository
## Assets
## Recent Activity
