---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'progress') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "progress"
status: "in-progress"
authority: "operational"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Progress Update

Status: `INPUT[inlineSelect(option(in-progress), option(in-review), option(blocked), option(done)):status]`

Progress: `INPUT[slider(addLabels, minValue(0), maxValue(100)):progress]`

## Current State
## Completed
## Changed
## Blocked
## Next
## Evidence
