# Metadata and Knowledge-Graph Contract

## Universal properties

```yaml
title:
namespace:
role:
system:
workspace:
type:
status:
authority:
created:
updated:
tags:
```

## Type-specific facets

Only when useful:

```yaml
domain:
layer:
surface:
scope:
lifecycle:
priority:
health:
phase:
progress:
target:
confidence:
impact:
repository:
cover:
source_kind:
```

## Typed relationships

```yaml
part_of:
depends_on:
implements:
refines:
validates:
evidence_for:
derived_from:
supersedes:
governed_by:
connects_to:
```

## Authority

```text
canonical
supporting
implementation-evidence
project-specific
operational
```

Authority is epistemic role, not lifecycle.

## Status families

Knowledge:

```text
draft review active superseded archived
```

Work:

```text
backlog ready in-progress in-review blocked done cancelled
```

Decision:

```text
proposed accepted rejected superseded
```

Validation:

```text
passed failed skipped blocked inferred
```

Legacy metadata remains valid during migration. Do not silently map old values without reviewing actual meaning.
