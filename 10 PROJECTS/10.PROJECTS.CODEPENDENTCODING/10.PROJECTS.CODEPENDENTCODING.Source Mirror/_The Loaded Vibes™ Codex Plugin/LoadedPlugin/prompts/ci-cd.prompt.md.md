---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\ci-cd.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\ci-cd.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.ci-cd.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\ci-cd.prompt.md'
source_file: 'ci-cd.prompt.md'
source_sha256: 'b702cbc079b66d5e93cae24d8f7fc9d99d9b80c50e310bc42df182190d10b070'
generated: true
---

# `ci-cd.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\ci-cd.prompt.md`
> SHA-256: `b702cbc079b66d5e93cae24d8f7fc9d99d9b80c50e310bc42df182190d10b070`

```markdown
---
name: "CiCdDevCyclePrompt"
description: "Build and refine CI/CD pipelines, caching, and policies."
argument-hint: "Specify the pipeline targets or automation changes."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/ci-cd.instructions.md"
toolset: "../toolsets/ci-cd.toolset.jsonc"
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

# CI/CD DevCycle Prompt

You are starting the **CI/CD** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/ci-cd.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/ci-cd.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Inventory existing pipelines + desired stages.
- Plan updates to workflow files, caching, secrets.
- Decide validation steps (dry-run, branch protection checks).

## Deliver back to the human reviewer
- Pipeline task breakdown.
- Risks or approvals required (secrets, permissions).
- Questions about deployment strategy.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```