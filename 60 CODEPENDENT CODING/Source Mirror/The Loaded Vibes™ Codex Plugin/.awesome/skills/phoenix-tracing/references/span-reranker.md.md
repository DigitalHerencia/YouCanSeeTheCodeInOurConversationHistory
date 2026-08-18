---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-reranker.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-reranker.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-reranker.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-reranker.md'
source_file: 'span-reranker.md'
source_sha256: 'c43b0fa029a857813b4d795ec64d5cb4416832cd40aa73b9bb159b3814113d2e'
generated: true
---

# `span-reranker.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-reranker.md`
> SHA-256: `c43b0fa029a857813b4d795ec64d5cb4416832cd40aa73b9bb159b3814113d2e`

````markdown
# RERANKER Spans

## Purpose

RERANKER spans represent reordering of retrieved documents (Cohere Rerank, cross-encoder models).

## Required Attributes

| Attribute | Type | Description | Required |
|-----------|------|-------------|----------|
| `openinference.span.kind` | String | Must be "RERANKER" | Yes |

## Attribute Reference

### Reranker Parameters

| Attribute | Type | Description |
|-----------|------|-------------|
| `reranker.model_name` | String | Reranker model identifier |
| `reranker.query` | String | Query used for reranking |
| `reranker.top_k` | Integer | Number of documents to return |

### Input Documents

| Attribute Pattern | Type | Description |
|-------------------|------|-------------|
| `reranker.input_documents.{i}.document.id` | String | Input document ID |
| `reranker.input_documents.{i}.document.content` | String | Input document content |
| `reranker.input_documents.{i}.document.score` | Float | Original retrieval score |
| `reranker.input_documents.{i}.document.metadata` | String (JSON) | Document metadata |

### Output Documents

| Attribute Pattern | Type | Description |
|-------------------|------|-------------|
| `reranker.output_documents.{i}.document.id` | String | Output document ID (reordered) |
| `reranker.output_documents.{i}.document.content` | String | Output document content |
| `reranker.output_documents.{i}.document.score` | Float | New reranker score |
| `reranker.output_documents.{i}.document.metadata` | String (JSON) | Document metadata |

### Score Comparison

Input scores (from retriever) vs. output scores (from reranker):

```json
{
  "reranker.input_documents.0.document.id": "doc_A",
  "reranker.input_documents.0.document.score": 0.7,
  "reranker.input_documents.1.document.id": "doc_B",
  "reranker.input_documents.1.document.score": 0.9,
  "reranker.output_documents.0.document.id": "doc_B",
  "reranker.output_documents.0.document.score": 0.95,
  "reranker.output_documents.1.document.id": "doc_A",
  "reranker.output_documents.1.document.score": 0.85
}
```

In this example:
- Input: doc_B (0.9) ranked higher than doc_A (0.7)
- Output: doc_B still highest but both scores increased
- Reranker confirmed retriever's ordering but refined scores

## Examples

### Complete Reranking Example

```json
{
  "openinference.span.kind": "RERANKER",
  "reranker.model_name": "cohere-rerank-v2",
  "reranker.query": "What is machine learning?",
  "reranker.top_k": 2,
  "reranker.input_documents.0.document.id": "doc_123",
  "reranker.input_documents.0.document.content": "Machine learning is a subset...",
  "reranker.input_documents.1.document.id": "doc_456",
  "reranker.input_documents.1.document.content": "Supervised learning algorithms...",
  "reranker.input_documents.2.document.id": "doc_789",
  "reranker.input_documents.2.document.content": "Neural networks are...",
  "reranker.output_documents.0.document.id": "doc_456",
  "reranker.output_documents.0.document.content": "Supervised learning algorithms...",
  "reranker.output_documents.0.document.score": 0.95,
  "reranker.output_documents.1.document.id": "doc_123",
  "reranker.output_documents.1.document.content": "Machine learning is a subset...",
  "reranker.output_documents.1.document.score": 0.88
}
```

````