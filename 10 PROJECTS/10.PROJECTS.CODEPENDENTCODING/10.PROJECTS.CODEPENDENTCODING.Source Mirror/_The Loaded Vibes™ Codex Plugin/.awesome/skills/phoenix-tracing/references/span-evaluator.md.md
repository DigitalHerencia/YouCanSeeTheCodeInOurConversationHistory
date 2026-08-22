---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-evaluator.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-evaluator.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-evaluator.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-evaluator.md'
source_file: 'span-evaluator.md'
source_sha256: '265cc27238135a35e839068d80ea7bf98d1d2712662f06850f2ef78396c8401b'
generated: true
---

# `span-evaluator.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-evaluator.md`
> SHA-256: `265cc27238135a35e839068d80ea7bf98d1d2712662f06850f2ef78396c8401b`

````markdown
# EVALUATOR Spans

## Purpose

EVALUATOR spans represent quality assessment operations (answer relevance, faithfulness, hallucination detection).

## Required Attributes

| Attribute | Type | Description | Required |
|-----------|------|-------------|----------|
| `openinference.span.kind` | String | Must be "EVALUATOR" | Yes |

## Common Attributes

| Attribute | Type | Description |
|-----------|------|-------------|
| `input.value` | String | Content being evaluated |
| `output.value` | String | Evaluation result (score, label, explanation) |
| `metadata.evaluator_name` | String | Evaluator identifier |
| `metadata.score` | Float | Numeric score (0-1) |
| `metadata.label` | String | Categorical label (relevant/irrelevant) |

## Example: Answer Relevance

```json
{
  "openinference.span.kind": "EVALUATOR",
  "input.value": "{\"question\": \"What is the capital of France?\", \"answer\": \"The capital of France is Paris.\"}",
  "input.mime_type": "application/json",
  "output.value": "0.95",
  "metadata.evaluator_name": "answer_relevance",
  "metadata.score": 0.95,
  "metadata.label": "relevant",
  "metadata.explanation": "Answer directly addresses the question with correct information"
}
```

## Example: Faithfulness Check

```json
{
  "openinference.span.kind": "EVALUATOR",
  "input.value": "{\"context\": \"Paris is in France.\", \"answer\": \"Paris is the capital of France.\"}",
  "input.mime_type": "application/json",
  "output.value": "0.5",
  "metadata.evaluator_name": "faithfulness",
  "metadata.score": 0.5,
  "metadata.label": "partially_faithful",
  "metadata.explanation": "Answer makes unsupported claim about Paris being the capital"
}
```

````