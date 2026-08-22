---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\d2-erd-style.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\d2-erd-style.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.efcore-d2-db-diagram.references.d2-erd-style.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\d2-erd-style.md'
source_file: 'd2-erd-style.md'
source_sha256: 'bbd4dd3c5451895b1ec03ef0290be70e955feb4a7a463eeb8a7001c46b184063'
generated: true
---

# `d2-erd-style.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\d2-erd-style.md`
> SHA-256: `bbd4dd3c5451895b1ec03ef0290be70e955feb4a7a463eeb8a7001c46b184063`

````markdown
# D2 ERD Style

## Recommended header

```d2
vars: {
  d2-config: {
    layout-engine: elk
    theme-id: 300
  }
}
```

## Table node

```d2
Clients: {
  shape: sql_table
  Id: uuid {constraint: primary_key}
  Name: varchar(200)
  Status: enum
}
```

## Relationship

```d2
Offers.ClientId -> Clients.Id: "N:1"
```

## Styles

```d2
classes: {
  join_table: {
    style.stroke-dash: 4
  }
  technical: {
    style.opacity: 0.55
  }
  optional_relation: {
    style.stroke-dash: 3
  }
}
```

````