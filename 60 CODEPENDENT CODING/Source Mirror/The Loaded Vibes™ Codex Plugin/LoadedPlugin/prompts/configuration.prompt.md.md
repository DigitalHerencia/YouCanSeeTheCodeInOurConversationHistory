---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\configuration.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\configuration.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.configuration.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\configuration.prompt.md'
source_file: 'configuration.prompt.md'
source_sha256: '8c4dda4d087529be69f9fa329a8720b14de0f076d425dce45edcd7e792744a5c'
generated: true
---

# `configuration.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\configuration.prompt.md`
> SHA-256: `8c4dda4d087529be69f9fa329a8720b14de0f076d425dce45edcd7e792744a5c`

```markdown
---
name: "ConfigurationDevCyclePrompt"
description: "Align workspace configs, env templates, and lint/test settings."
argument-hint: "List the configuration surfaces or tools requiring updates."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/configuration.instructions.md"
toolset: "../toolsets/configuration.toolset.jsonc"
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

# Configuration DevCycle Prompt

You are starting the **Configuration** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/configuration.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/configuration.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Re-read Scaffolding outputs to understand file locations.
- Apply instructions from configuration.instructions.md and reference the toolset for allowed commands.
- Plan lint/type/test validation runs and .env template updates.

## Deliver back to the human reviewer
- Ordered task list for configuration work.
- Risks or decisions needing human approval.
- Mapping of config files to PRD/TechReq requirements.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```