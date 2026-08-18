---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-embedding.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-embedding.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-embedding.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-embedding.md'
source_file: 'span-embedding.md'
source_sha256: '4a19464c071cc8b15388567e74a876269689194a56ee79f93570720c85910db2'
generated: true
---

# `span-embedding.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-embedding.md`
> SHA-256: `4a19464c071cc8b15388567e74a876269689194a56ee79f93570720c85910db2`

````markdown
# EMBEDDING Spans

## Purpose

EMBEDDING spans represent vector generation operations (text-to-vector conversion for semantic search).

## Required Attributes

| Attribute | Type | Description | Required |
|-----------|------|-------------|----------|
| `openinference.span.kind` | String | Must be "EMBEDDING" | Yes |
| `embedding.model_name` | String | Embedding model identifier | Recommended |

## Attribute Reference

### Single Embedding

| Attribute | Type | Description |
|-----------|------|-------------|
| `embedding.model_name` | String | Embedding model identifier |
| `embedding.text` | String | Input text to embed |
| `embedding.vector` | String (JSON array) | Generated embedding vector |

**Example:**
```json
{
  "embedding.model_name": "text-embedding-ada-002",
  "embedding.text": "What is machine learning?",
  "embedding.vector": "[0.023, -0.012, 0.045, ..., 0.001]"
}
```

### Batch Embeddings

| Attribute Pattern | Type | Description |
|-------------------|------|-------------|
| `embedding.embeddings.{i}.embedding.text` | String | Text at index i |
| `embedding.embeddings.{i}.embedding.vector` | String (JSON array) | Vector at index i |

**Example:**
```json
{
  "embedding.model_name": "text-embedding-ada-002",
  "embedding.embeddings.0.embedding.text": "First document",
  "embedding.embeddings.0.embedding.vector": "[0.1, 0.2, 0.3, ..., 0.5]",
  "embedding.embeddings.1.embedding.text": "Second document",
  "embedding.embeddings.1.embedding.vector": "[0.6, 0.7, 0.8, ..., 0.9]"
}
```

### Vector Format

Vectors stored as JSON array strings:
- Dimensions: Typically 384, 768, 1536, or 3072
- Format: `"[0.123, -0.456, 0.789, ...]"`
- Precision: Usually 3-6 decimal places

**Storage Considerations:**
- Large vectors can significantly increase trace size
- Consider omitting vectors in production (keep `embedding.text` for debugging)
- Use separate vector database for actual similarity search

## Examples

### Single Embedding

```json
{
  "openinference.span.kind": "EMBEDDING",
  "embedding.model_name": "text-embedding-ada-002",
  "embedding.text": "What is machine learning?",
  "embedding.vector": "[0.023, -0.012, 0.045, ..., 0.001]",
  "input.value": "What is machine learning?",
  "output.value": "[0.023, -0.012, 0.045, ..., 0.001]"
}
```

### Batch Embeddings

```json
{
  "openinference.span.kind": "EMBEDDING",
  "embedding.model_name": "text-embedding-ada-002",
  "embedding.embeddings.0.embedding.text": "First document",
  "embedding.embeddings.0.embedding.vector": "[0.1, 0.2, 0.3]",
  "embedding.embeddings.1.embedding.text": "Second document",
  "embedding.embeddings.1.embedding.vector": "[0.4, 0.5, 0.6]",
  "embedding.embeddings.2.embedding.text": "Third document",
  "embedding.embeddings.2.embedding.vector": "[0.7, 0.8, 0.9]"
}
```

````