---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-code-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-code-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.evaluators-code-typescript.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-code-typescript.md'
source_file: 'evaluators-code-typescript.md'
source_sha256: '9d5dfa3cc5e6f931296afda0655128ba3770897f09b5ee6ea9366da129a35059'
generated: true
---

# `evaluators-code-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-code-typescript.md`
> SHA-256: `9d5dfa3cc5e6f931296afda0655128ba3770897f09b5ee6ea9366da129a35059`

````markdown
# Evaluators: Code Evaluators in TypeScript

Deterministic evaluators without LLM. Fast, cheap, reproducible.

## Basic Pattern

```typescript
import { createEvaluator } from "@arizeai/phoenix-evals";

const containsCitation = createEvaluator<{ output: string }>(
  ({ output }) => /\[\d+\]/.test(output) ? 1 : 0,
  { name: "contains_citation", kind: "CODE" }
);
```

## With Full Results (asExperimentEvaluator)

```typescript
import { asExperimentEvaluator } from "@arizeai/phoenix-client/experiments";

const jsonValid = asExperimentEvaluator({
  name: "json_valid",
  kind: "CODE",
  evaluate: async ({ output }) => {
    try {
      JSON.parse(String(output));
      return { score: 1.0, label: "valid_json" };
    } catch (e) {
      return { score: 0.0, label: "invalid_json", explanation: String(e) };
    }
  },
});
```

## Parameter Types

```typescript
interface EvaluatorParams {
  input: Record<string, unknown>;
  output: unknown;
  expected: Record<string, unknown>;
  metadata: Record<string, unknown>;
}
```

## Common Patterns

- **Regex**: `/pattern/.test(output)`
- **JSON**: `JSON.parse()` + zod schema
- **Keywords**: `output.includes(keyword)`
- **Similarity**: `fastest-levenshtein`

````