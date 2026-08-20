---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-overview.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-overview.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.fundamentals-overview.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-overview.md'
source_file: 'fundamentals-overview.md'
source_sha256: '30cfdd28b69b7fb817388fa63923156715beee74f82536bcf32a0fec605e6f34'
generated: true
---

# `fundamentals-overview.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-overview.md`
> SHA-256: `30cfdd28b69b7fb817388fa63923156715beee74f82536bcf32a0fec605e6f34`

````markdown
# Overview and Traces & Spans

This document covers the fundamental concepts of OpenInference traces and spans in Phoenix.

## Overview

OpenInference is a set of semantic conventions for AI and LLM applications based on OpenTelemetry. Phoenix uses these conventions to capture, store, and analyze traces from AI applications.

**Key Concepts:**

- **Traces** represent end-to-end requests through your application
- **Spans** represent individual operations within a trace (LLM calls, retrievals, tool invocations)
- **Attributes** are key-value pairs attached to spans using flattened, dot-notation paths
- **Span Kinds** categorize the type of operation (LLM, RETRIEVER, TOOL, etc.)

## Traces and Spans

### Trace Hierarchy

A **trace** is a tree of **spans** representing a complete request:

```
Trace ID: abc123
├─ Span 1: CHAIN (root span, parent_id = null)
│  ├─ Span 2: RETRIEVER (parent_id = span_1_id)
│  │  └─ Span 3: EMBEDDING (parent_id = span_2_id)
│  └─ Span 4: LLM (parent_id = span_1_id)
│     └─ Span 5: TOOL (parent_id = span_4_id)
```

### Context Propagation

Spans maintain parent-child relationships via:

- `trace_id` - Same for all spans in a trace
- `span_id` - Unique identifier for this span
- `parent_id` - References parent span's `span_id` (null for root spans)

Phoenix uses these relationships to:

- Build the span tree visualization in the UI
- Calculate cumulative metrics (tokens, errors) up the tree
- Enable nested querying (e.g., "find CHAIN spans containing LLM spans with errors")

### Span Lifecycle

Each span has:

- `start_time` - When the operation began (Unix timestamp in nanoseconds)
- `end_time` - When the operation completed
- `status_code` - OK, ERROR, or UNSET
- `status_message` - Optional error message
- `attributes` - object with all semantic convention attributes

````