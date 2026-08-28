---
title: "ui-contract.contract"
type: contract
scope: project
project:
domain:
artifact:
kind: checklist
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/verification-checklist
  - status/draft
created: 2026-08-25
updated: 2026-08-25
---

# ui-contract.contract

## Contract Kind

verification-checklist

## Purpose

Defines concrete checks required before accepting a change, release, refactor, migration, or generated output.

## Use This Template When

You need a final gate that prevents wishful thinking, incomplete execution, or silent drift.

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

## Verification Scope

- 

## Functional Checks

- 

## Architecture Checks

- 

## Security Checks

- 

## Data Checks

- 

## UI Checks

- 

## Test Checks

- 

## Release Checks

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

- [ ] Checks are concrete.
- [ ] Each check can pass or fail.
- [ ] Critical blockers are named.
- [ ] Evidence requirements are included.

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
