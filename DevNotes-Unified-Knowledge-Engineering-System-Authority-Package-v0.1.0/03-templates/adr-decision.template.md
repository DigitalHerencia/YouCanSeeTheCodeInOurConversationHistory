---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'decision') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "decision"
status: "proposed"
authority: "project-specific"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Decision

> [!decision] Proposed Decision
> State the consequential choice.

## Status
## Context
## Problem
## Options Considered
## Selected Approach
## Rationale
## Consequences
### Positive
### Negative
### Risks
## Dependencies
## Supersedes
## Related Decisions
