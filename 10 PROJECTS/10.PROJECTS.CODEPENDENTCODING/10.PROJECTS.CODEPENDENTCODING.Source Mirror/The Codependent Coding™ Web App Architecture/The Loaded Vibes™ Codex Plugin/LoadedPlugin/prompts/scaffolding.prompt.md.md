---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\scaffolding.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\scaffolding.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.scaffolding.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\scaffolding.prompt.md'
source_file: 'scaffolding.prompt.md'
source_sha256: '8fef8e2ad770ceb44fbcf2e467877c305129ac403dbf3fc4efefb8bb883f5f06'
generated: true
---

# `scaffolding.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\scaffolding.prompt.md`
> SHA-256: `8fef8e2ad770ceb44fbcf2e467877c305129ac403dbf3fc4efefb8bb883f5f06`

```markdown
---
name: "ScaffoldingDevCyclePrompt"
description: "Set up baseline folders, configs, and scripts for new work."
argument-hint: "Describe the scaffolding assets you need to create or adjust."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/scaffolding.instructions.md"
toolset: "../toolsets/scaffolding.toolset.jsonc"
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

# Scaffolding DevCycle Prompt

You are starting the **Scaffolding** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/scaffolding.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/scaffolding.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review structure requirements from docs/PRD.md and docs/TECH_REQUIREMENTS.md.
- Load prior Initialization findings to ensure prerequisites exist.
- Prepare a project map describing directories, entrypoints, and placeholders.

## Deliver back to the human reviewer
- Implementation plan referencing key folders/files.
- Clarification questions for ambiguous modules.
- List of directories/files to create with rationale.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```