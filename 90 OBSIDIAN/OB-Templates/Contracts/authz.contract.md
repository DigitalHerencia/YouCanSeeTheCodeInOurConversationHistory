---
title: "<% tp.file.title %>"
type: contract
scope: project
project:
domain:
artifact:
kind: authz
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/authz
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## Contract Kind

authz

## Purpose

Defines permission boundaries, guards, access rules, ownership checks, and authorization verification.

## Use This Template When

A route, action, fetcher, object, or workflow needs explicit rules for who can do what and when.

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

## Authorization Model

- 

## Access Rules

- 

## Ownership Rules

- 

## Route Guards

- 

## Action Guards

- 

## Fetcher Guards

- 

## Test Cases

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

- [ ] Access rules are explicit.
- [ ] Ownership checks are documented.
- [ ] Server-side enforcement is required.
- [ ] Bypass paths are named.

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
