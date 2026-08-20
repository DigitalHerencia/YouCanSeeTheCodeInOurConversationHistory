---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\next-intl-add-language\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\next-intl-add-language\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.next-intl-add-language.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\next-intl-add-language\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '67f02613e2001e601e8ac1b07c35af9b8428c50b6abb77218e752d0898735e35'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\next-intl-add-language\SKILL.md`
> SHA-256: `67f02613e2001e601e8ac1b07c35af9b8428c50b6abb77218e752d0898735e35`

```markdown
---
name: next-intl-add-language
description: 'Add new language to a Next.js + next-intl application'
---

This is a guide to add a new language to a Next.js project using next-intl for internationalization,

- For i18n, the application uses next-intl.
- All translations are in the directory `./messages`.
- The UI component is `src/components/language-toggle.tsx`.
- Routing and middleware configuration are handled in:
  - `src/i18n/routing.ts`
  - `src/middleware.ts`

When adding a new language:

- Translate all the content of `en.json` to the new language. The goal is to have all the JSON entries in the new language for a complete translation.
- Add the path in `routing.ts` and `middleware.ts`.
- Add the language to `language-toggle.tsx`.

```