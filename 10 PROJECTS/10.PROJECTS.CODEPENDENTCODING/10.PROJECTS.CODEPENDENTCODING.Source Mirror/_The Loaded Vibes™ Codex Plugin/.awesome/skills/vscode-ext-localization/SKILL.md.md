---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\vscode-ext-localization\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\vscode-ext-localization\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.vscode-ext-localization.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\vscode-ext-localization\SKILL.md'
source_file: 'SKILL.md'
source_sha256: 'a238b58545bc23476ac0bd6451e9b01a225cb125096b90b3425e8e08943e3d6c'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\vscode-ext-localization\SKILL.md`
> SHA-256: `a238b58545bc23476ac0bd6451e9b01a225cb125096b90b3425e8e08943e3d6c`

```markdown
---
name: vscode-ext-localization
description: 'Guidelines for proper localization of VS Code extensions, following VS Code extension development guidelines, libraries and good practices'
---

# VS Code extension localization

This skill helps you localize every aspect of VS Code extensions

## When to use this skill

Use this skill when you need to:
- Localize new or existing contributed configurations (settings), commands, menus, views or walkthroughs
- Localize new or existing messages or other string resources contained in extension source code that are displayed to the end user

# Instructions

VS Code localization is composed by three different approaches, depending on the resource that is being localized. When a new localizable resource is created or updated, the corresponding localization for all currently available languages must be created/updated.

1. Configurations like Settings, Commands, Menus, Views, ViewsWelcome, Walkthrough Titles and Descriptions, defined in `package.json`
  -> An exclusive `package.nls.LANGID.json` file, like `package.nls.pt-br.json` of Brazilian Portuguese (`pt-br`) localization
2. Walkthrough content (defined in its own `Markdown` files)
  -> An exclusive `Markdown` file like `walkthrough/someStep.pt-br.md` for Brazilian Portuguese localization
3. Messages and string located in extension source code (JavaScript or TypeScript files)
  -> An exclusive `bundle.l10n.pt-br.json` for Brazilian Portuguese localization

```