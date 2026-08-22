---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\production-python.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\production-python.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.production-python.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\production-python.md'
source_file: 'production-python.md'
source_sha256: 'af8c9472068fc61f5a007e3b1d3e698011f5d64180933381b713d24b2e57d981'
generated: true
---

# `production-python.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\production-python.md`
> SHA-256: `af8c9472068fc61f5a007e3b1d3e698011f5d64180933381b713d24b2e57d981`

````markdown
# Phoenix Tracing: Production Guide (Python)

**CRITICAL: Configure batching, data masking, and span filtering for production deployment.**

## Metadata

| Attribute | Value |
|-----------|-------|
| Priority | Critical - production readiness |
| Impact | Security, Performance |
| Setup Time | 5-15 min |

## Batch Processing

**Enable batch processing for production efficiency.** Batching reduces network overhead by sending spans in groups rather than individually.

## Data Masking (PII Protection)

**Environment variables:**

```bash
export OPENINFERENCE_HIDE_INPUTS=true          # Hide input.value
export OPENINFERENCE_HIDE_OUTPUTS=true         # Hide output.value
export OPENINFERENCE_HIDE_INPUT_MESSAGES=true  # Hide LLM input messages
export OPENINFERENCE_HIDE_OUTPUT_MESSAGES=true # Hide LLM output messages
export OPENINFERENCE_HIDE_INPUT_IMAGES=true    # Hide image content
export OPENINFERENCE_HIDE_INPUT_TEXT=true      # Hide embedding text
export OPENINFERENCE_BASE64_IMAGE_MAX_LENGTH=10000  # Limit image size
```

**Python TraceConfig:**

```python
from phoenix.otel import register
from openinference.instrumentation import TraceConfig

config = TraceConfig(
    hide_inputs=True,
    hide_outputs=True,
    hide_input_messages=True
)
register(trace_config=config)
```

**Precedence:** Code > Environment variables > Defaults

---

## Span Filtering

**Suppress specific code blocks:**

```python
from phoenix.otel import suppress_tracing

with suppress_tracing():
    internal_logging()  # No spans generated
```

````