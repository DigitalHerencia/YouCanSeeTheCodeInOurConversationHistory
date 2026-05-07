---
title: "<% tp.file.title %>"
type: contract
scope: project
project:
domain:
artifact:
kind: work-package
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/work-package
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## Contract Kind

work-package

## Purpose

Defines a bounded implementation job with objective scope, inputs, outputs, constraints, and completion evidence.

## Use This Template When

You need to hand a precise job to Codex, ChatGPT, or future-you without losing intent.

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

## Objective

- 

## Context

- 

## Inputs

- 

## Expected Outputs

- 

## Constraints

- 

## Step Plan

- 

## Verification

- 

## Completion Report

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

- [ ] Objective is bounded.
- [ ] Inputs are listed.
- [ ] Outputs are concrete.
- [ ] Completion evidence is required.

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
