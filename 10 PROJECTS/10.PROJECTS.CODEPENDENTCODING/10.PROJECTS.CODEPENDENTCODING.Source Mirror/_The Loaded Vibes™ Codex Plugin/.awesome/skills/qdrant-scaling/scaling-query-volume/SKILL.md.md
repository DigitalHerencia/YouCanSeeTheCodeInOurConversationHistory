---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-scaling\scaling-query-volume\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-scaling\scaling-query-volume\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.qdrant-scaling.scaling-query-volume.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-scaling\scaling-query-volume\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '992e499c8897fca3de1f07838d7a01317d1300d22473a09d8ca5953bb169cf29'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-scaling\scaling-query-volume\SKILL.md`
> SHA-256: `992e499c8897fca3de1f07838d7a01317d1300d22473a09d8ca5953bb169cf29`

```markdown
---
name: qdrant-scaling-query-volume
description: "Guides Qdrant query volume scaling. Use when someone asks 'query returns too many results', 'scroll performance', 'large limit values', 'paginating search results', 'fetching many vectors', or 'high cardinality results'."
---

# Scaling for Query Volume

Problem: When a query has a large limit (e.g. 1000) and there are multiple shards (e.g. 10), naively each shard must return the full 1000 results — totaling 10,000 scored points transferred and merged. This is wasteful since data is randomly distributed across auto-shards.

## Core idea

Instead of asking every shard for the full limit, ask each shard for a smaller limit computed via Poisson distribution statistics, then merge. This is safe because auto-sharding guarantees random, independent data distribution.

## When it activates

- More than 1 shard
- Auto-sharding is in use (all queried shards share the same shard key)
- The request's limit + offset >= SHARD_QUERY_SUBSAMPLING_LIMIT (128)
- The query is not exact

## Key tradeoff

 The strategy trades a small probability of slightly incomplete results for a large reduction in inter-shard data transfer, especially for high-limit queries across many shards. The 1.2x safety factor and the 99.9% Poisson threshold keep the error rate very low — comparable to inaccuracies already introduced by approximate vector indices like HNSW.
```