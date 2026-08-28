---
title: "roles.contract"
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
  - contracts/route-map
  - status/draft
created: 2026-08-27
updated: 2026-08-27
role: devnotes
system: devnotes
workspace:
---

# roles.contract

## Contract Kind

route-map

## Purpose

Defines application routes, ownership, page intent, auth requirements, params, search params, and data dependencies.

## Use This Template When

Routes need to remain thin, intentional, protected, and aligned with feature/domain ownership.

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

## Route Catalog

-

## Route Ownership

-

## Auth Requirements

-

## Params

-

## Search Params

-

## Data Dependencies

-

## Redirect Rules

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

- [ ] Each route has an owner.
- [ ] Auth behavior is documented.
- [ ] Params are named.
- [ ] Data dependencies are listed.

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
| 2026-08-27 | Created | Initial draft |
