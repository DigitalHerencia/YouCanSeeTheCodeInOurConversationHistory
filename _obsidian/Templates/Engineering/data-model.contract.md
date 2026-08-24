---
title: "<% tp.file.title %>"
type: contract
scope: project
project:
domain:
artifact:
kind: contract
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/data-model
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Contract Kind

data-model

## Purpose

Defines entities, fields, relationships, enums, indexes, constraints, DTO mappings, and persistence rules.

## Use This Template When

Database shape, transport shape, and business rules need to agree before implementation.

## Authority

This document is a contract. It defines source-of-truth rules that implementation, prompts, tests, and future documentation must obey until this contract is superseded.

## Scope

### Governs

-
-
-

### Does Not Govern

-
-
-

## Non-Negotiable Rules

1.
2.
3.

## Required Invariants

-
-
-

## Entities

-

## Fields

-

## Enums

-

## Relationships

-

## Indexes

-

## Constraints

-

## DTO Mapping

-

## Migration Notes

-

## Dependencies

| Dependency | Type | Reason |
|---|---|---|
|  |  |  |

## Implementation References

| Area | Path / Link | Notes |
|---|---|---|
| Routes |  |  |
| Actions |  |  |
| Fetchers |  |  |
| Components |  |  |
| Schemas |  |  |
| Types |  |  |
| Data |  |  |
| Tests |  |  |

## Failure Modes

| Failure | Cause | Required Handling |
|---|---|---|
|  |  |  |

## Acceptance Criteria

- [ ] Entities are listed.
- [ ] Critical fields are defined.
- [ ] Relationships are explicit.
- [ ] DTO mapping is included.

## Verification Checklist

- [ ] Namespace is correct.
- [ ] Scope is explicit.
- [ ] Domain boundary is clear.
- [ ] Rules are testable.
- [ ] Forbidden behavior is documented.
- [ ] Dependencies are linked.
- [ ] Implementation references are listed.
- [ ] This contract does not duplicate another active source-of-truth note.

## Open Questions

-

## Changelog

| Date | Change | Reason |
|---|---|---|
| <% tp.date.now("YYYY-MM-DD") %> | Created | Initial draft |
