---
title: "route-map.contract"
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
  - contracts/state-machine
  - status/draft
created: 2026-08-25
updated: 2026-08-25
---

# route-map.contract

## Contract Kind

state-machine

## Purpose

Defines allowed states, transitions, guards, terminal states, invalid transitions, and reconciliation behavior.

## Use This Template When

A workflow can move between states and invalid transitions would create bugs, money risk, trust risk, or data corruption.

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

## States

- 

## Initial State

- 

## Terminal States

- 

## Transitions

- 

## Transition Guards

- 

## Invalid Transitions

- 

## Reconciliation Rules

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

- [ ] Every state is defined.
- [ ] Every transition has from/to states.
- [ ] Guards are explicit.
- [ ] Invalid transitions are named.

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
| 2026-08-25 | Created | Initial draft |
