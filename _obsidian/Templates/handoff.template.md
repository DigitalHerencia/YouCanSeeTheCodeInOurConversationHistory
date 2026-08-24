---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'handoff') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "handoff"
status: "ready"
authority: "operational"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Handoff

> [!handoff] Transfer
> Make the next action executable.

Status: `INPUT[inlineSelect(option(ready), option(in-progress), option(blocked), option(done), option(cancelled)):status]`

## From
## To
## Objective
## Current State
## Completed
## In Progress
## Remaining
## Decisions
## Constraints
## Blockers
## Relevant Files
## Relevant Notes
## Relevant Code
## Evidence
## Exact Next Action
