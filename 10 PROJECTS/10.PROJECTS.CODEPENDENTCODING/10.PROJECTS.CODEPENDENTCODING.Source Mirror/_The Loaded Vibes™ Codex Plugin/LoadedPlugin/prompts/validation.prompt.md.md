---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\validation.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\validation.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.validation.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\validation.prompt.md'
source_file: 'validation.prompt.md'
source_sha256: '1abb499dc0ebcf6dc3602f58990b4fbc452e5e948c7e1ecae1df2946b504c54b'
generated: true
---

# `validation.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\validation.prompt.md`
> SHA-256: `1abb499dc0ebcf6dc3602f58990b4fbc452e5e948c7e1ecae1df2946b504c54b`

```markdown
---
name: "ValidationDevCyclePrompt"
description: "Validate implementation against PRD and Tech Requirements."
argument-hint: "List the acceptance criteria or flows to validate."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/validation.instructions.md"
toolset: "../toolsets/validation.toolset.jsonc"
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

# Validation DevCycle Prompt

You are starting the **Validation** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/validation.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/validation.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Align validation scope with PRD stories and human expectations.
- Plan walkthrough order, evidence capture, and sign-off criteria.
- Identify dependencies (test data, feature flags).

## Deliver back to the human reviewer
- Validation checklist referencing PRD IDs.
- Questions for stakeholders if requirements unclear.
- Plan for evidence artifacts (screenshots, logs).

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```