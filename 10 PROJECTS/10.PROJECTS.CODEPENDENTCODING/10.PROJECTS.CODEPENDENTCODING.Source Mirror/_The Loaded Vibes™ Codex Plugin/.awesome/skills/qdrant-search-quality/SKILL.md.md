---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-search-quality\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-search-quality\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.qdrant-search-quality.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-search-quality\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '3af84e9019065cd90cc79210c5833153fc62acdcf55bda359ab7876809be0803'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-search-quality\SKILL.md`
> SHA-256: `3af84e9019065cd90cc79210c5833153fc62acdcf55bda359ab7876809be0803`

```markdown
---
name: qdrant-search-quality
description: "Diagnoses and improves Qdrant search relevance. Use when someone reports 'search results are bad', 'wrong results', 'low precision', 'low recall', 'irrelevant matches', 'missing expected results', or asks 'how to improve search quality?', 'which embedding model?', 'should I use hybrid search?', 'should I use reranking?'. Also use when search quality degrades after quantization, model change, or data growth."
allowed-tools:
  - Read
  - Grep
  - Glob
---

# Qdrant Search Quality

First determine whether the problem is the embedding model, Qdrant configuration, or the query strategy. Most quality issues come from the model or data, not from Qdrant itself. If search quality is low, inspect how chunks are being passed to Qdrant before tuning any parameters. Splitting mid-sentence can drop quality 30-40%.

- Start by testing with exact search to isolate the problem [Search API](https://search.qdrant.tech/md/documentation/search/search/?s=search-api)


## Diagnosis and Tuning

Isolate the source of quality issues, tune HNSW parameters, and choose the right embedding model. [Diagnosis and Tuning](diagnosis/SKILL.md)


## Search Strategies

Hybrid search, reranking, relevance feedback, and exploration APIs for improving result quality. [Search Strategies](search-strategies/SKILL.md)

```