---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\code-review.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\code-review.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.code-review.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\code-review.prompt.md'
source_file: 'code-review.prompt.md'
source_sha256: '63cc995f128532da3fcb60538f1e1032144b469f2bdd2e33b18bebd813b38451'
generated: true
---

# `code-review.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\code-review.prompt.md`
> SHA-256: `63cc995f128532da3fcb60538f1e1032144b469f2bdd2e33b18bebd813b38451`

```markdown
---
name: "CodeReviewDevCyclePrompt"
description: "Conduct asynchronous code review and quality audits."
argument-hint: "Summarize the code that needs review or feedback."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/code-review.instructions.md"
toolset: "../toolsets/code-review.toolset.jsonc"
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

# Code Review DevCycle Prompt

You are starting the **Code Review** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/code-review.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/code-review.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Load diff context, related DevCycles, and testing evidence.
- Plan review focus areas (security, accessibility, performance, etc.).
- Outline how findings will be categorized and reported.

## Deliver back to the human reviewer
- Review checklist + severity definitions.
- Questions for author/stakeholders.
- Timeline for delivering the review.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```