---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\production-guardrails.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\production-guardrails.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.production-guardrails.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\production-guardrails.md'
source_file: 'production-guardrails.md'
source_sha256: '5b2d90b7d959c15d4687b80777d2712186cf5d7ef7f51b8f524f067c83f31cea'
generated: true
---

# `production-guardrails.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\production-guardrails.md`
> SHA-256: `5b2d90b7d959c15d4687b80777d2712186cf5d7ef7f51b8f524f067c83f31cea`

````markdown
# Production: Guardrails vs Evaluators

Guardrails block in real-time. Evaluators measure asynchronously.

## Key Distinction

```
Request → [INPUT GUARDRAIL] → LLM → [OUTPUT GUARDRAIL] → Response
                                            │
                                            └──→ ASYNC EVALUATOR (background)
```

## Guardrails

| Aspect | Requirement |
| ------ | ----------- |
| Timing | Synchronous, blocking |
| Latency | < 100ms |
| Purpose | Prevent harm |
| Type | Code-based (deterministic) |

**Use for:** PII detection, prompt injection, profanity, length limits, format validation.

## Evaluators

| Aspect | Characteristic |
| ------ | -------------- |
| Timing | Async, background |
| Latency | Can be seconds |
| Purpose | Measure quality |
| Type | Can use LLMs |

**Use for:** Helpfulness, faithfulness, tone, completeness, citation accuracy.

## Decision

| Question | Answer |
| -------- | ------ |
| Must block harmful content? | Guardrail |
| Measuring quality? | Evaluator |
| Need LLM judgment? | Evaluator |
| < 100ms required? | Guardrail |
| False positives = angry users? | Evaluator |

## LLM Guardrails: Rarely

Only use LLM guardrails if:
- Latency budget > 1s
- Error cost >> LLM cost
- Low volume
- Fallback exists

**Key Principle:** Guardrails prevent harm (block). Evaluators measure quality (log).

````