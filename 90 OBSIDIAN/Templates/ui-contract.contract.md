---
title: "<% tp.file.title %>"
type: contract
scope: project
project:
domain:
artifact:
kind: ui-contract
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/ui-contract
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## Contract Kind

ui-contract

## Purpose

Defines visible states, user interactions, empty/loading/error states, responsive behavior, and accessibility expectations.

## Use This Template When

A page, component, or flow needs consistent visual and behavioral rules.

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

## UI Purpose

- 

## Visible States

- 

## Interactions

- 

## Empty State

- 

## Loading State

- 

## Error State

- 

## Responsive Behavior

- 

## Accessibility

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

- [ ] Visible states are listed.
- [ ] Interaction behavior is clear.
- [ ] Error states are defined.
- [ ] Accessibility expectations exist.

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
