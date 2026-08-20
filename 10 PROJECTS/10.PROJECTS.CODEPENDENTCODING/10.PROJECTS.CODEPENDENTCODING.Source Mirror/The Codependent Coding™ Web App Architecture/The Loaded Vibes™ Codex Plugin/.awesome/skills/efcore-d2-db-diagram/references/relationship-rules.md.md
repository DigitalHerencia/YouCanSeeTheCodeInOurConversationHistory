---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\relationship-rules.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\relationship-rules.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.efcore-d2-db-diagram.references.relationship-rules.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\relationship-rules.md'
source_file: 'relationship-rules.md'
source_sha256: '9a3105d65b6018c76d147933c45063db5535193da68ed40bd198ac1270d50bce'
generated: true
---

# `relationship-rules.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\relationship-rules.md`
> SHA-256: `9a3105d65b6018c76d147933c45063db5535193da68ed40bd198ac1270d50bce`

````markdown
# Relationship Rules

## One-to-many

Detected from:

- `HasOne(...).WithMany(...)`
- FK property on dependent entity.
- Collection navigation on principal entity.

Render dependent to principal:

```d2
Orders.ClientId -> Clients.Id: "N:1"
```

## One-to-one

Detected from:

- `HasOne(...).WithOne(...)`
- Unique FK index.
- Shared primary key relationship.

Render dependent to principal:

```d2
ClientProfiles.ClientId -> Clients.Id: "1:1"
```

## Many-to-many

Detected from:

- `UsingEntity`
- Two collection navigations without explicit join entity.
- Migration-created join table with two FKs and composite key.

Render the join table explicitly by default.

## Owned types

Detected from:

- `OwnsOne`
- `OwnsMany`
- `[Owned]`

Inline by default unless table splitting or separate table mapping is detected.

## Optional relationships

A relationship is optional when:

- FK is nullable.
- `IsRequired(false)` is configured.
- Migration column is nullable.

Use dashed line for optional relationships.

````