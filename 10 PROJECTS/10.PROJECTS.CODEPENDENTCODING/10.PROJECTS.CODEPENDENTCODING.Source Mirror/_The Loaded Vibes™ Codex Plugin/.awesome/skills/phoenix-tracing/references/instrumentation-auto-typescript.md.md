---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-auto-typescript.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-auto-typescript.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.instrumentation-auto-typescript.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-auto-typescript.md'
source_file: 'instrumentation-auto-typescript.md'
source_sha256: 'f3a62694fc2ee509daa7c9bfdb3149ccf162909192bd69e758f0234fbaceb082'
generated: true
---

# `instrumentation-auto-typescript.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\instrumentation-auto-typescript.md`
> SHA-256: `f3a62694fc2ee509daa7c9bfdb3149ccf162909192bd69e758f0234fbaceb082`

````markdown
# Auto-Instrumentation (TypeScript)

Automatically create spans for LLM calls without code changes.

## Supported Frameworks

- **LLM SDKs:** OpenAI
- **Frameworks:** LangChain
- **Install:** `npm install @arizeai/openinference-instrumentation-{name}`

## Setup

**CommonJS (automatic):**

```javascript
const { register } = require("@arizeai/phoenix-otel");
const OpenAI = require("openai");

register({ projectName: "my-app" });

const client = new OpenAI();
```

**ESM (manual required):**

```typescript
import { register, registerInstrumentations } from "@arizeai/phoenix-otel";
import { OpenAIInstrumentation } from "@arizeai/openinference-instrumentation-openai";
import OpenAI from "openai";

register({ projectName: "my-app" });

const instrumentation = new OpenAIInstrumentation();
instrumentation.manuallyInstrument(OpenAI);
registerInstrumentations({ instrumentations: [instrumentation] });
```

**Why:** ESM imports are hoisted before `register()` runs.

## Limitations

**What auto-instrumentation does NOT capture:**

```typescript
async function myWorkflow(query: string): Promise<string> {
  const preprocessed = await preprocess(query);        // Not traced
  const response = await client.chat.completions.create(...);  // Traced (auto)
  const postprocessed = await postprocess(response);   // Not traced
  return postprocessed;
}
```

**Solution:** Add manual instrumentation for custom logic:

```typescript
import { traceChain } from "@arizeai/openinference-core";

const myWorkflow = traceChain(
  async (query: string): Promise<string> => {
    const preprocessed = await preprocess(query);
    const response = await client.chat.completions.create(...);
    const postprocessed = await postprocess(response);
    return postprocessed;
  },
  { name: "my-workflow" }
);
```

## Combining Auto + Manual

```typescript
import { register } from "@arizeai/phoenix-otel";
import { traceChain } from "@arizeai/openinference-core";

register({ projectName: "my-app" });

const client = new OpenAI();

const workflow = traceChain(
  async (query: string) => {
    const preprocessed = await preprocess(query);
    const response = await client.chat.completions.create(...);  // Auto-instrumented
    return postprocess(response);
  },
  { name: "my-workflow" }
);
```

````