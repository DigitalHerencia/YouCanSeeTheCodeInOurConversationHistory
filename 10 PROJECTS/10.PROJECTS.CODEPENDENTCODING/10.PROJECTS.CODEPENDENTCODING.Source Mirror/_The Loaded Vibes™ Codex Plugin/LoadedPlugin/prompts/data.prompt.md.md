---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\data.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\data.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.data.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\data.prompt.md'
source_file: 'data.prompt.md'
source_sha256: '7c4a6e40fbee45a4467c72c6d97d8ee91683804f63a543a340fd4a7347894a25'
generated: true
---

# `data.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\data.prompt.md`
> SHA-256: `7c4a6e40fbee45a4467c72c6d97d8ee91683804f63a543a340fd4a7347894a25`

```markdown
---
name: "DataDevCyclePrompt"
description: "Design and evolve Prisma + Neon data models and migrations."
argument-hint: "Explain the schema or data operations to implement."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/data.instructions.md"
toolset: "../toolsets/data.toolset.jsonc"
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

# Data DevCycle Prompt

You are starting the **Data** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/data.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/data.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review domain requirements plus existing schema/migrations.
- Identify safety checks (backups, rollbacks, seeding).
- Plan validation commands (pnpm prisma format/validate) and Neon considerations.

## Deliver back to the human reviewer
- Schema/migration task list.
- Risk map (breaking changes, downtime).
- Questions for human approval (e.g., destructive migrations).

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```