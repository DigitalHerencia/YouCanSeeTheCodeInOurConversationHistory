---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-flattening.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-flattening.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.fundamentals-flattening.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-flattening.md'
source_file: 'fundamentals-flattening.md'
source_sha256: 'b6dbad9707b2606331c28b0ba0a68444df61cc6115add1cdc4afad7b38f24536'
generated: true
---

# `fundamentals-flattening.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\fundamentals-flattening.md`
> SHA-256: `b6dbad9707b2606331c28b0ba0a68444df61cc6115add1cdc4afad7b38f24536`

````markdown
# Flattening Convention

OpenInference flattens nested data structures into dot-notation attributes for database compatibility, OpenTelemetry compatibility, and simple querying.

## Flattening Rules

**Objects → Dot Notation**

```javascript
{ llm: { model_name: "gpt-4", token_count: { prompt: 10, completion: 20 } } }
// becomes
{ "llm.model_name": "gpt-4", "llm.token_count.prompt": 10, "llm.token_count.completion": 20 }
```

**Arrays → Zero-Indexed Notation**

```javascript
{ llm: { input_messages: [{ role: "user", content: "Hi" }] } }
// becomes
{ "llm.input_messages.0.message.role": "user", "llm.input_messages.0.message.content": "Hi" }
```

**Message Convention: `.message.` segment required**

```
llm.input_messages.{index}.message.{field}
llm.input_messages.0.message.tool_calls.0.tool_call.function.name
```

## Complete Example

```javascript
// Original
{
  openinference: { span: { kind: "LLM" } },
  llm: {
    model_name: "claude-3-5-sonnet-20241022",
    invocation_parameters: { temperature: 0.7, max_tokens: 1000 },
    input_messages: [{ role: "user", content: "Tell me a joke" }],
    output_messages: [{ role: "assistant", content: "Why did the chicken cross the road?" }],
    token_count: { prompt: 5, completion: 10, total: 15 }
  }
}

// Flattened (stored in Phoenix spans.attributes JSONB)
{
  "openinference.span.kind": "LLM",
  "llm.model_name": "claude-3-5-sonnet-20241022",
  "llm.invocation_parameters": "{\"temperature\": 0.7, \"max_tokens\": 1000}",
  "llm.input_messages.0.message.role": "user",
  "llm.input_messages.0.message.content": "Tell me a joke",
  "llm.output_messages.0.message.role": "assistant",
  "llm.output_messages.0.message.content": "Why did the chicken cross the road?",
  "llm.token_count.prompt": 5,
  "llm.token_count.completion": 10,
  "llm.token_count.total": 15
}
```

````