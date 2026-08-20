---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\prompt.template.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\prompt.template.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.templates.prompt.template.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\prompt.template.md'
source_file: 'prompt.template.md'
source_sha256: '4291c1efd7c23c4142733640793fbb263a744fc4db8111959db49dc2be95e2c6'
generated: true
---

# `prompt.template.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\prompt.template.md`
> SHA-256: `4291c1efd7c23c4142733640793fbb263a744fc4db8111959db49dc2be95e2c6`

````markdown
---

## name: prompt.template applyTo: "\*\*/\*.prompt.md" description: Template for DevCycle prompt files.

# Prompt File Template

This file defines the standard structure and behavior of **DevCycle prompt files**. Prompts are the entry points to each DevCycle, triggering the agent to execute the correct instructions with the proper toolset.

Prompts are fully language‑agnostic and stack‑agnostic.

## Purpose

- Trigger a specific DevCycle.
- Load the corresponding instructions file.
- Bind the correct toolset to the agent.
- Route execution to the custom agent.
- Keep the workflow deterministic and predictable.

## Frontmatter Structure

Each prompt file uses YAML frontmatter:

```yaml
---
description: Short description of what this prompt triggers.
name: Human‑friendly prompt name.
argument-hint: Instruction shown in the chat input field.
agent: Name of the custom agent to run (default: agent).
model: Optional model override.
tools:
  - filesystem/*
  - github/*
---
```

## Body Structure

The body of the prompt contains the **exact instructions sent to the LLM** when the prompt is invoked.

### Required Elements

- Identify the DevCycle being initiated.
- Instruct the agent to load that DevCycle’s instruction file.
- Instruct the agent to use the corresponding toolset.
- Instruct the agent to keep the human in the loop.

### Example Template Body

```markdown
# ${name} DevCycle Prompt

You are starting the **${name}** DevCycle.

Follow these rules:
- Load the instructions file located at `../instructions/${name}.instructions.md`.
- Load the toolset file located at `../toolsets/${name}.toolset.jsonc`.
- Use only the tools declared in this DevCycle’s toolset.
- Follow global instructions.
- Follow the stack‑specific custom agent instructions.
- Surface decisions for human approval.

Output:
- Summary of planned actions
- Any clarification questions
- A breakdown of tasks derived from PRD + TechReq
```

## Prompt Responsibilities

- Provide clear DevCycle initiation.
- Point to the correct instruction file.
- Point to the correct toolset file.
- Activate the correct custom agent.
- Define behavior for deterministic execution.

## Notes

- Prompts are Markdown files.
- Prompts must reside in `/prompts`.
- Prompts do not include stack‑specific logic.
- Prompts must be one‑to‑one with DevCycles.


````