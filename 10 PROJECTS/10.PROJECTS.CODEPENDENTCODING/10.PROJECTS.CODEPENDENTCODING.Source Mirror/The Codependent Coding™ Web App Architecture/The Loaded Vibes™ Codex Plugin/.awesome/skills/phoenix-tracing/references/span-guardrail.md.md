---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-guardrail.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-guardrail.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-guardrail.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-guardrail.md'
source_file: 'span-guardrail.md'
source_sha256: 'b9a6b43c6af2ab0680b2f2b0cf41cf7fdee59aec01ab7bbe58561cf6d9af197f'
generated: true
---

# `span-guardrail.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-guardrail.md`
> SHA-256: `b9a6b43c6af2ab0680b2f2b0cf41cf7fdee59aec01ab7bbe58561cf6d9af197f`

````markdown
# GUARDRAIL Spans

## Purpose

GUARDRAIL spans represent safety and policy checks (content moderation, PII detection, toxicity scoring).

## Required Attributes

| Attribute | Type | Description | Required |
|-----------|------|-------------|----------|
| `openinference.span.kind` | String | Must be "GUARDRAIL" | Yes |

## Common Attributes

| Attribute | Type | Description |
|-----------|------|-------------|
| `input.value` | String | Content being checked |
| `output.value` | String | Guardrail result (allowed/blocked/flagged) |
| `metadata.guardrail_type` | String | Type of check (toxicity, pii, bias) |
| `metadata.score` | Float | Safety score (0-1) |
| `metadata.threshold` | Float | Threshold for blocking |

## Example: Content Moderation

```json
{
  "openinference.span.kind": "GUARDRAIL",
  "input.value": "User message: I want to build a bomb",
  "output.value": "BLOCKED",
  "metadata.guardrail_type": "content_moderation",
  "metadata.score": 0.95,
  "metadata.threshold": 0.7,
  "metadata.categories": "[\"violence\", \"weapons\"]",
  "metadata.action": "block_and_log"
}
```

## Example: PII Detection

```json
{
  "openinference.span.kind": "GUARDRAIL",
  "input.value": "My SSN is 123-45-6789",
  "output.value": "FLAGGED",
  "metadata.guardrail_type": "pii_detection",
  "metadata.detected_pii": "[\"ssn\"]",
  "metadata.redacted_output": "My SSN is [REDACTED]"
}
```

````