---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-chain.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-chain.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-chain.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-chain.md'
source_file: 'span-chain.md'
source_sha256: 'd538e4d760268eedd891f6c988fcee5261229da83b4e65b5e713405c03ac53e4'
generated: true
---

# `span-chain.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-chain.md`
> SHA-256: `d538e4d760268eedd891f6c988fcee5261229da83b4e65b5e713405c03ac53e4`

````markdown
# CHAIN Spans

## Purpose

CHAIN spans represent orchestration layers in your application (LangChain chains, custom workflows, application entry points). Often used as root spans.

## Required Attributes

| Attribute                 | Type   | Description     | Required |
| ------------------------- | ------ | --------------- | -------- |
| `openinference.span.kind` | String | Must be "CHAIN" | Yes      |

## Common Attributes

CHAIN spans typically use [Universal Attributes](fundamentals-universal-attributes.md):

- `input.value` - Input to the chain (user query, request payload)
- `output.value` - Output from the chain (final response)
- `input.mime_type` / `output.mime_type` - Format indicators

## Example: Root Chain

```json
{
  "openinference.span.kind": "CHAIN",
  "input.value": "{\"question\": \"What is the capital of France?\"}",
  "input.mime_type": "application/json",
  "output.value": "{\"answer\": \"The capital of France is Paris.\", \"sources\": [\"doc_123\"]}",
  "output.mime_type": "application/json",
  "session.id": "session_abc123",
  "user.id": "user_xyz789"
}
```

## Example: Nested Sub-Chain

```json
{
  "openinference.span.kind": "CHAIN",
  "input.value": "Summarize this document: ...",
  "output.value": "This document discusses..."
}
```

````