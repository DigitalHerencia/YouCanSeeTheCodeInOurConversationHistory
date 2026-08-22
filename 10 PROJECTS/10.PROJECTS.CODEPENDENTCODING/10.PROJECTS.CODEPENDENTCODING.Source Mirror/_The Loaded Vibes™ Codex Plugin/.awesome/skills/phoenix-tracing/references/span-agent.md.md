---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.span-agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-agent.md'
source_file: 'span-agent.md'
source_sha256: '8197e4f242f0a77b9875be051a572a01f1e8c6aef22d92936eb347fcd267af03'
generated: true
---

# `span-agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\span-agent.md`
> SHA-256: `8197e4f242f0a77b9875be051a572a01f1e8c6aef22d92936eb347fcd267af03`

````markdown
# AGENT Spans

AGENT spans represent autonomous reasoning blocks (ReAct agents, planning loops, multi-step decision making).

**Required:** `openinference.span.kind` = "AGENT"

## Example

```json
{
  "openinference.span.kind": "AGENT",
  "input.value": "Book a flight to New York for next Monday",
  "output.value": "I've booked flight AA123 departing Monday at 9:00 AM"
}
```

````