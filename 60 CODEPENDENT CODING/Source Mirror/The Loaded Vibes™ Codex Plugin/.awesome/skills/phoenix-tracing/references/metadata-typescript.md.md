---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.metadata-typescript.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-typescript.md'
source_file: 'metadata-typescript.md'
source_sha256: '022b0684605dc4c368ee5a3a5c1c5aed963f2a8a4706d0b948218607600cd48f'
generated: true
---

# `metadata-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-typescript.md`
> SHA-256: `022b0684605dc4c368ee5a3a5c1c5aed963f2a8a4706d0b948218607600cd48f`

````markdown
# Phoenix Tracing: Custom Metadata (TypeScript)

Add custom attributes to spans for richer observability.

## Using Context (Propagates to All Child Spans)

```typescript
import { context } from "@arizeai/phoenix-otel";
import { setMetadata } from "@arizeai/openinference-core";

context.with(
  setMetadata(context.active(), {
    experiment_id: "exp_123",
    model_version: "gpt-4-1106-preview",
    environment: "production",
  }),
  async () => {
    // All spans created within this block will have:
    // "metadata" = '{"experiment_id": "exp_123", ...}'
    await myApp.run(query);
  }
);
```

## On a Single Span

```typescript
import { traceChain } from "@arizeai/openinference-core";
import { trace } from "@arizeai/phoenix-otel";

const myFunction = traceChain(
  async (input: string) => {
    const span = trace.getActiveSpan();

    span?.setAttribute(
      "metadata",
      JSON.stringify({
        experiment_id: "exp_123",
        model_version: "gpt-4-1106-preview",
        environment: "production",
      })
    );

    return result;
  },
  { name: "my-function" }
);

await myFunction("hello");
```

````