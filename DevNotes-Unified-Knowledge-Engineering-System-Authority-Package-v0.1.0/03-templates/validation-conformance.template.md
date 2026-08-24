---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'validation') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "validation"
status: "draft"
authority: "project-specific"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Validation & Conformance

## Validation Philosophy
## Quality Gates
## Formatting
## Static Analysis
## Type Safety
## Runtime Validation
## Unit Testing
## Integration Testing
## Database Testing
## Security Testing
## E2E Testing
## Accessibility Testing
## Architecture Validation
## Contract Validation
## Build Validation
## Deployment Validation
## Smoke Testing
## Fast Gate
## CI Gate
## Release Gate
## Evidence Semantics
### Executed
### Failed
### Skipped
### Blocked
### Inferred
## High-Risk Validation
## Acceptance Criteria
## Definition of Done
