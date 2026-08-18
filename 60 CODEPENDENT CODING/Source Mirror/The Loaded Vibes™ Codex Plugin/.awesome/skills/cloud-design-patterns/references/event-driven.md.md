---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cloud-design-patterns\references\event-driven.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cloud-design-patterns\references\event-driven.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cloud-design-patterns.references.event-driven.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cloud-design-patterns\references\event-driven.md'
source_file: 'event-driven.md'
source_sha256: 'f340c93b3730666cc6be2167d1b1533a78d020b811622274a8867844f019a74b'
generated: true
---

# `event-driven.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cloud-design-patterns\references\event-driven.md`
> SHA-256: `f340c93b3730666cc6be2167d1b1533a78d020b811622274a8867844f019a74b`

```markdown
# Event-Driven Architecture Patterns

## Event Sourcing Pattern

**Problem**: Need complete audit trail of all changes to application state.

**Solution**: Use an append-only store to record the full series of events that describe actions taken on data in a domain.

**When to Use**:
- Requiring complete audit trail
- Implementing temporal queries (point-in-time state)
- Supporting event replay and debugging
- Implementing CQRS with eventual consistency

**Implementation Considerations**:
- Store events in append-only log
- Rebuild current state by replaying events
- Implement event versioning strategy
- Handle event schema evolution
- Consider storage growth over time
- Implement snapshots for performance

```