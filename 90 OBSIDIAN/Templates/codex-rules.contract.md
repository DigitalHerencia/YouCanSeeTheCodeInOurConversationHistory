---
title: "<% tp.file.title %>"
type: contract
scope: project
project:
domain:
artifact:
kind: codex-rules
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/codex-rules
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## Contract Kind

codex-rules

## Purpose

Defines agent execution rules, boundaries, stop conditions, verification requirements, and forbidden shortcuts.

## Use This Template When

Codex or another agent will modify code, docs, prompts, schemas, workflows, or repo structure.

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

## Execution Rules

- 

## Allowed Changes

- 

## Forbidden Changes

- 

## Boundary Rules

- 

## Stop Conditions

- 

## Verification Requirements

- 

## Reporting Format

- 

## Failure Handling

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

- [ ] Allowed work is explicit.
- [ ] Forbidden work is explicit.
- [ ] Stop conditions exist.
- [ ] Verification is mandatory.

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
