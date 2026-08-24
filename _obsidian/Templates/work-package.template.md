---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'work-package') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "work-package"
status: "ready"
authority: "operational"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Work Package

Status: `INPUT[inlineSelect(option(backlog), option(ready), option(in-progress), option(in-review), option(blocked), option(done), option(cancelled)):status]`

Priority: `INPUT[inlineSelect(option(low), option(normal), option(high), option(critical)):priority]`

## Objective
## Context
## Scope
## Inputs
## Requirements
## Constraints
## Files / Systems Affected
## Tasks
## Acceptance Criteria
## Validation
## Completion Evidence
## Result
## Follow-Up
