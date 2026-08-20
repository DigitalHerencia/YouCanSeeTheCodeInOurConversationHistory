---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\template.prompt.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\template.prompt.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.prompts.template.prompt.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\template.prompt.md'
source_file: 'template.prompt.md'
source_sha256: '4622e119f70dffea0ccc19038888e1295b8889e93710233911d9fc2e6c204a33'
generated: true
---

# `template.prompt.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\prompts\template.prompt.md`
> SHA-256: `4622e119f70dffea0ccc19038888e1295b8889e93710233911d9fc2e6c204a33`

```markdown
---
name: "TemplatePrompt"
description: "Template for creating DevCycle prompts. Each prompt triggers a specific DevCycle."
argument-hint: "Provide the context or parameters for this cycle."
agent: agent
tools:['edit', 'runNotebooks', 'search', 'new', 'runCommands', 'runTasks', 'usages', 'vscodeAPI', 'problems', 'changes', 'testFailure', 'openSimpleBrowser', 'fetch', 'githubRepo', 'extensions', 'todos', 'runSubagent', 'runTests']
---

# Prompt Template

This template can be copied and customized for each DevCycle. Replace the placeholders with the specific cycle name, instruction path, and toolset.

**Instructions**: Refer to `${instructionsFile}` for detailed guidance.

**Toolset**: Use `${toolsetName}` to determine which tools are available.

When this prompt is executed, the agent reads the corresponding instructions file, loads the toolset, and begins the tasks associated with the DevCycle.

```