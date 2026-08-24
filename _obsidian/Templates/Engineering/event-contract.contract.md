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
  - contracts/event-contract
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
role: devnotes
system: devnotes
workspace:
---

# <% tp.file.title %>

## Contract Kind

event-contract

## Purpose

Defines events, producers, consumers, payloads, ordering expectations, idempotency, replay, and failure handling.

## Use This Template When

State changes are emitted, consumed, audited, replayed, or used to trigger downstream workflows.

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

## Event Catalog

-

## Producers

-

## Consumers

-

## Payloads

-

## Ordering

-

## Idempotency

-

## Replay Rules

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

- [ ] Events are named.
- [ ] Payloads are defined.
- [ ] Consumers are listed.
- [ ] Idempotency is addressed.

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
