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

Status: `INPUT[inlineSelect(option(backlog), option(ready), option(in-progress), option(in-review), option(blocked), option(done), option(cancelled)):status]`

Priority: `INPUT[inlineSelect(option(low), option(normal), option(high), option(critical)):priority]`

Health: `INPUT[inlineSelect(option(on-track), option(at-risk), option(blocked), option(paused)):health]`

Progress: `INPUT[progressBar:progress]`

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
## Recent Decisions
## Research
## Code / Repository
## Assets
## Recent Activity
