---
title: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0006-shared-webhook-ledger.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0006-shared-webhook-ledger.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.docs.adr.adr-0006-shared-webhook-ledger.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\docs\adr\adr-0006-shared-webhook-ledger.md'
source_file: 'adr-0006-shared-webhook-ledger.md'
source_sha256: '4f046b3ee67074b691969cd01263c48ff8c914ab280d44ee9a46a0f714d8bbcb'
generated: true
---

# `adr-0006-shared-webhook-ledger.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\docs\adr\adr-0006-shared-webhook-ledger.md`
> SHA-256: `4f046b3ee67074b691969cd01263c48ff8c914ab280d44ee9a46a0f714d8bbcb`

```markdown
---
title: "ADR-0006: Shared Webhook Ledger"
status: "Accepted"
date: "2026-08-03"
authors: "Repository maintainers"
tags: ["architecture", "webhooks", "reliability"]
supersedes: ""
superseded_by: ""
---

# ADR-0006: Shared Webhook Ledger

## Status

Accepted

## Context

Provider events are untrusted, replayable, concurrent, and potentially out of order. An existing row does not prove processing completed.

## Decision

All provider webhooks use a shared durable ledger with received, processing, processed, ignored, and failed states. Signature verification precedes mapping; claims are atomic; terminal duplicates acknowledge safely; failed or stale work follows an explicit retry policy.

## Consequences

### Positive

- **POS-001**: Duplicate and concurrent delivery becomes observable and recoverable.
- **POS-002**: Providers share one reliability contract.

### Negative

- **NEG-001**: Claiming, retries, and bounded error metadata add persistence complexity.
- **NEG-002**: Operators must monitor failed and stale processing claims instead of treating receipt as completion.

## Alternatives Considered

### Find then create

- **ALT-001**: **Description**: Query for an event before inserting and processing it.
- **ALT-002**: **Rejection Reason**: Concurrent delivery can race and duplicate consequences.

## Implementation Notes

- **IMP-001**: Store sanitized bounded metadata, never unrestricted payloads or secrets.
- **IMP-002**: Provider-specific workflows consume normalized validated events.
- **IMP-003**: `attemptCount` is the fencing token; a superseded worker must roll back its side effects.
- **IMP-004**: Processing claims become stale after five minutes and may then be reclaimed.

## References

- **REF-001**: ADR-0005, ADR-0007, and ADR-0008.

```