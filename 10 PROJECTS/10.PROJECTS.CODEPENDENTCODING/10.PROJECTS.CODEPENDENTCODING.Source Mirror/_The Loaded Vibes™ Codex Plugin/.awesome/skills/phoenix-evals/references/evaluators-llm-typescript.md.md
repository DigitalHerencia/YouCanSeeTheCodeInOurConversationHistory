---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-llm-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-llm-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.evaluators-llm-typescript.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-llm-typescript.md'
source_file: 'evaluators-llm-typescript.md'
source_sha256: '6c056b80e6a80790b93484bd701edccd7539d689691a10dae33fa50f804773d4'
generated: true
---

# `evaluators-llm-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-llm-typescript.md`
> SHA-256: `6c056b80e6a80790b93484bd701edccd7539d689691a10dae33fa50f804773d4`

````markdown
# Evaluators: LLM Evaluators in TypeScript

LLM evaluators use a language model to judge outputs. Uses Vercel AI SDK.

## Quick Start

```typescript
import { createClassificationEvaluator } from "@arizeai/phoenix-evals";
import { openai } from "@ai-sdk/openai";

const helpfulness = await createClassificationEvaluator<{
  input: string;
  output: string;
}>({
  name: "helpfulness",
  model: openai("gpt-4o"),
  promptTemplate: `Rate helpfulness.
<question>{{input}}</question>
<response>{{output}}</response>
Answer (helpful/not_helpful):`,
  choices: { not_helpful: 0, helpful: 1 },
});
```

## Template Variables

Use XML tags: `<question>{{input}}</question>`, `<response>{{output}}</response>`, `<context>{{context}}</context>`

## Custom Evaluator with asExperimentEvaluator

```typescript
import { asExperimentEvaluator } from "@arizeai/phoenix-client/experiments";

const customEval = asExperimentEvaluator({
  name: "custom",
  kind: "LLM",
  evaluate: async ({ input, output }) => {
    // Your LLM call here
    return { score: 1.0, label: "pass", explanation: "..." };
  },
});
```

## Pre-Built Evaluators

```typescript
import { createFaithfulnessEvaluator } from "@arizeai/phoenix-evals";

const faithfulnessEvaluator = createFaithfulnessEvaluator({
  model: openai("gpt-4o"),
});
```

## Best Practices

- Be specific about criteria
- Include examples in prompts
- Use `<thinking>` for chain of thought

````