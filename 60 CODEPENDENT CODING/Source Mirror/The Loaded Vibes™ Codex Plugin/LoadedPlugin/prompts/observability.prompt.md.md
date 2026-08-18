---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\observability.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\observability.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.observability.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\observability.prompt.md'
source_file: 'observability.prompt.md'
source_sha256: '161f234210b4b4222061d8e0ce160c951f53acca3a0eba0be465338e6e962cd1'
generated: true
---

# `observability.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\observability.prompt.md`
> SHA-256: `161f234210b4b4222061d8e0ce160c951f53acca3a0eba0be465338e6e962cd1`

```markdown
---
name: "ObservabilityDevCyclePrompt"
description: "Instrument logging, metrics, and tracing for the stack."
argument-hint: "Explain the telemetry gaps or signals to implement."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/observability.instructions.md"
toolset: "../toolsets/observability.toolset.jsonc"
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

# Observability DevCycle Prompt

You are starting the **Observability** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/observability.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/observability.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review instrumentation requirements and existing gaps.
- Plan logging/tracing/metrics updates within toolset limits.
- Define validation steps for emitted telemetry.

## Deliver back to the human reviewer
- Instrumentation plan with components + owners.
- Alert/dashboard requirements.
- Questions about retention, privacy, or tooling.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```