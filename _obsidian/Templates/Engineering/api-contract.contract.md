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
  - contracts/api-contract
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Contract Kind

api-contract

## Purpose

Defines endpoints, request contracts, response contracts, errors, auth, idempotency, and integration behavior.

## Use This Template When

A system boundary exposes or consumes HTTP APIs, server actions, RPC-like operations, or provider calls.

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

## Endpoint Catalog

-

## Requests

-

## Responses

-

## Errors

-

## Auth

-

## Idempotency

-

## Rate Limits

-

## Examples

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

- [ ] Requests are defined.
- [ ] Responses are defined.
- [ ] Errors are defined.
- [ ] Auth requirements are explicit.

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
