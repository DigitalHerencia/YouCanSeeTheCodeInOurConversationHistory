---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\retry-protocol.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\retry-protocol.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.audit-integrity.references.retry-protocol.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\retry-protocol.md'
source_file: 'retry-protocol.md'
source_sha256: '4dbfd76214926b3101ef01c95059c7d9e14ddf09eee144c4bda32f49cdcdb34b'
generated: true
---

# `retry-protocol.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\retry-protocol.md`
> SHA-256: `4dbfd76214926b3101ef01c95059c7d9e14ddf09eee144c4bda32f49cdcdb34b`

```markdown
# Retry Protocol

On tool failure or empty results:

1. **Retry once** with a refined query or a different search pattern.
2. **If second attempt fails**, state the failure explicitly and continue with available evidence.
3. **Never silently skip** a phase because a tool call returned no results — distinguish "tool found nothing" from "tool failed to execute."
4. **Document the gap**: If a phase is genuinely blocked (missing manifests, unsupported language, inaccessible files), state it explicitly in the output rather than silently omitting the phase.

```