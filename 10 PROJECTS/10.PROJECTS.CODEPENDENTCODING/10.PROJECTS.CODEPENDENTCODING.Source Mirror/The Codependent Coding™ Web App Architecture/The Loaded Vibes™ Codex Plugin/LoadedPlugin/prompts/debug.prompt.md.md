---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\debug.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\debug.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.debug.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\debug.prompt.md'
source_file: 'debug.prompt.md'
source_sha256: '6e2e6a1451a14acb57ec78ce0408c7b081b7ac328f01e4004d5b63954057a826'
generated: true
---

# `debug.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\debug.prompt.md`
> SHA-256: `6e2e6a1451a14acb57ec78ce0408c7b081b7ac328f01e4004d5b63954057a826`

```markdown
---
name: "DebugDevCyclePrompt"
description: "Triage regressions and stabilize failing scenarios."
argument-hint: "Describe the bug, symptoms, or logs available."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/debug.instructions.md"
toolset: "../toolsets/debug.toolset.jsonc"
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

# Debug DevCycle Prompt

You are starting the **Debug** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/debug.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/debug.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Collect reproduction info, logs, and impacted areas.
- Plan diagnostic steps using toolset resources.
- Define validation steps to confirm fixes.

## Deliver back to the human reviewer
- Issue triage summary with hypotheses.
- Fix plan + test strategy.
- Questions for reporters or stakeholders.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```