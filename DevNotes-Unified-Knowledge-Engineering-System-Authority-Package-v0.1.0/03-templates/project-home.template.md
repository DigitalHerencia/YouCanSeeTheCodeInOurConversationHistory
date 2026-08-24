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
Status · Priority · Health · Phase · Progress · Target · Repository

## Current State
## Next Action
## Current Milestone
## Blockers
## Decisions Needed
## Governance
## Active Specifications
## Work
## Recent Decisions
## Research
## Code / Repository
## Assets
## Recent Activity
