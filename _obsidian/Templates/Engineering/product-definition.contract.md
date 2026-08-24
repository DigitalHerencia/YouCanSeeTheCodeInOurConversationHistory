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
  - contracts/product-definition
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Contract Kind

product-definition

## Purpose

Defines what the product is, who it serves, what it refuses to be, and what success means.

## Use This Template When

You need a durable source of truth for the product identity, positioning, scope, user promise, and non-goals.

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

## Product Definition

-

## Target Users

-

## Core Promise

-

## Non-Goals

-

## Success Conditions

-

## Positioning Boundaries

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

- [ ] Product identity is clear.
- [ ] Target users are defined.
- [ ] Non-goals prevent scope drift.
- [ ] Success can be evaluated.

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
