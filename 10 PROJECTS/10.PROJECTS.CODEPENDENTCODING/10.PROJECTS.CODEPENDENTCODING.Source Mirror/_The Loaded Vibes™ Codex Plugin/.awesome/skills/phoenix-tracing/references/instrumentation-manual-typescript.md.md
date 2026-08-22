---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-manual-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-manual-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.instrumentation-manual-typescript.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-manual-typescript.md'
source_file: 'instrumentation-manual-typescript.md'
source_sha256: 'b7cc82dec46a47ecbe2b6a73f584cea23b1f9519f35222e0958a2c44de638b60'
generated: true
---

# `instrumentation-manual-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-manual-typescript.md`
> SHA-256: `b7cc82dec46a47ecbe2b6a73f584cea23b1f9519f35222e0958a2c44de638b60`

````markdown
# Manual Instrumentation (TypeScript)

Add custom spans using convenience wrappers or withSpan for fine-grained tracing control.

## Setup

```bash
npm install @arizeai/phoenix-otel @arizeai/openinference-core
```

```typescript
import { register } from "@arizeai/phoenix-otel";
register({ projectName: "my-app" });
```

## Quick Reference

| Span Kind | Method | Use Case |
|-----------|--------|----------|
| CHAIN | `traceChain` | Workflows, pipelines, orchestration |
| AGENT | `traceAgent` | Multi-step reasoning, planning |
| TOOL | `traceTool` | External APIs, function calls |
| RETRIEVER | `withSpan` | Vector search, document retrieval |
| LLM | `withSpan` | LLM API calls (prefer auto-instrumentation) |
| EMBEDDING | `withSpan` | Embedding generation |
| RERANKER | `withSpan` | Document re-ranking |
| GUARDRAIL | `withSpan` | Safety checks, content moderation |
| EVALUATOR | `withSpan` | LLM evaluation |

## Convenience Wrappers

```typescript
import { traceChain, traceAgent, traceTool } from "@arizeai/openinference-core";

// CHAIN - workflows
const pipeline = traceChain(
  async (query: string) => {
    const docs = await retrieve(query);
    return await generate(docs, query);
  },
  { name: "rag-pipeline" }
);

// AGENT - reasoning
const agent = traceAgent(
  async (question: string) => {
    const thought = await llm.generate(`Think: ${question}`);
    return await processThought(thought);
  },
  { name: "my-agent" }
);

// TOOL - function calls
const getWeather = traceTool(
  async (city: string) => fetch(`/api/weather/${city}`).then(r => r.json()),
  { name: "get-weather" }
);
```

## withSpan for Other Kinds

```typescript
import { withSpan, getInputAttributes, getRetrieverAttributes } from "@arizeai/openinference-core";

// RETRIEVER with custom attributes
const retrieve = withSpan(
  async (query: string) => {
    const results = await vectorDb.search(query, { topK: 5 });
    return results.map(doc => ({ content: doc.text, score: doc.score }));
  },
  {
    kind: "RETRIEVER",
    name: "vector-search",
    processInput: (query) => getInputAttributes(query),
    processOutput: (docs) => getRetrieverAttributes({ documents: docs })
  }
);
```

**Options:**

```typescript
withSpan(fn, {
  kind: "RETRIEVER",              // OpenInference span kind
  name: "span-name",              // Span name (defaults to function name)
  processInput: (args) => {},     // Transform input to attributes
  processOutput: (result) => {},  // Transform output to attributes
  attributes: { key: "value" }    // Static attributes
});
```

## Capturing Input/Output

**Always capture I/O for evaluation-ready spans.** Use `getInputAttributes` and `getOutputAttributes` helpers for automatic MIME type detection:

```typescript
import {
  getInputAttributes,
  getOutputAttributes,
  withSpan,
} from "@arizeai/openinference-core";

const handleQuery = withSpan(
  async (userInput: string) => {
    const result = await agent.generate({ prompt: userInput });
    return result;
  },
  {
    name: "query.handler",
    kind: "CHAIN",
    // Use helpers - automatic MIME type detection
    processInput: (input) => getInputAttributes(input),
    processOutput: (result) => getOutputAttributes(result.text),
  }
);

await handleQuery("What is 2+2?");
```

**What gets captured:**

```json
{
  "input.value": "What is 2+2?",
  "input.mime_type": "text/plain",
  "output.value": "2+2 equals 4.",
  "output.mime_type": "text/plain"
}
```

**Helper behavior:**
- Strings → `text/plain`
- Objects/Arrays → `application/json` (automatically serialized)
- `undefined`/`null` → No attributes set

**Why this matters:**
- Phoenix evaluators require `input.value` and `output.value`
- Phoenix UI displays I/O prominently for debugging
- Enables exporting data for fine-tuning datasets

### Custom I/O Processing

Add custom metadata alongside standard I/O attributes:

```typescript
const processWithMetadata = withSpan(
  async (query: string) => {
    const result = await llm.generate(query);
    return result;
  },
  {
    name: "query.process",
    kind: "CHAIN",
    processInput: (query) => ({
      "input.value": query,
      "input.mime_type": "text/plain",
      "input.length": query.length,  // Custom attribute
    }),
    processOutput: (result) => ({
      "output.value": result.text,
      "output.mime_type": "text/plain",
      "output.tokens": result.usage?.totalTokens,  // Custom attribute
    }),
  }
);
```

## See Also

- **Span attributes:** `span-chain.md`, `span-retriever.md`, `span-tool.md`, etc.
- **Attribute helpers:** https://docs.arize.com/phoenix/tracing/manual-instrumentation-typescript#attribute-helpers
- **Auto-instrumentation:** `instrumentation-auto-typescript.md` for framework integrations

````