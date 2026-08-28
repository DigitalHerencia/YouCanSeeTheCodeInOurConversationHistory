---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'task') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: task
status: backlog
authority: operational
priority: normal
scheduled: "<% tp.date.now('YYYY-MM-DD') %>"
due:
projects: []
contexts: []
blockedBy: []
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags:
  - task
---

# <% tp.file.title %>

Status: `INPUT[dn-status-task][:status]` · Priority: `INPUT[dn-priority][:priority]`

Scheduled: `INPUT[date:scheduled]` · Due: `INPUT[date:due]`

## Outcome

## Next action

## Notes
