---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'architecture') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "architecture"
status: "draft"
authority: "project-specific"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Architecture

## Architectural Identity
## Governing Principles
## System Context
## Canonical Vocabulary
## System Boundaries
## Responsibility Ownership
## Layer Model
## Dependency Direction
## Application Structure
## Route / Interface Topology
## Presentation Architecture
## Domain / Feature Architecture
## Data Architecture
## Persistence Architecture
## Authentication Architecture
## Authorization Architecture
## Integration Architecture
## Event / Webhook Architecture
## Workflow Architecture
## Cache Architecture
## Runtime Flow
## Deployment Topology
## Architectural Invariants
## Explicit Anti-Patterns
## Reference / Golden Vertical Slice
## Architecture Diagram
## Related ADRs
