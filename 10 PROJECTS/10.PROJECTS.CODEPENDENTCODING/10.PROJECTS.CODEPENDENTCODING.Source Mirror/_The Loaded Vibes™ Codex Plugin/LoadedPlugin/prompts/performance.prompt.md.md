---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\performance.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\performance.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.performance.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\performance.prompt.md'
source_file: 'performance.prompt.md'
source_sha256: '86d243d9ae4e8a9dc1781ac4831a0789c65cdc87825978425267468f972c8987'
generated: true
---

# `performance.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\performance.prompt.md`
> SHA-256: `86d243d9ae4e8a9dc1781ac4831a0789c65cdc87825978425267468f972c8987`

```markdown
---
name: "PerformanceDevCyclePrompt"
description: "Profile and optimize performance hotspots."
argument-hint: "Share the metrics or user flows that need tuning."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/performance.instructions.md"
toolset: "../toolsets/performance.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Performance DevCycle Prompt

You are starting the **Performance** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/performance.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/performance.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Gather baseline metrics and tooling scripts.
- Plan optimizations (bundles, queries, caching).
- Coordinate with Observability for metrics capture.

## Deliver back to the human reviewer
- Benchmark/optimization plan.
- Potential trade-offs or risks.
- Questions about targets or constraints.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```