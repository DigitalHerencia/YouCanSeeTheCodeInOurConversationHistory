---
title: 'The Hipster Stack™ Technology Stack\docs\getting-started.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\docs\getting-started.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.docs.getting-started.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\docs\getting-started.md'
source_file: 'getting-started.md'
source_sha256: '732ba57eacee2147b5a04a8bca727a36e68099ba5a685f99f162d37a96041e38'
generated: true
---

# `getting-started.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\docs\getting-started.md`
> SHA-256: `732ba57eacee2147b5a04a8bca727a36e68099ba5a685f99f162d37a96041e38`

````markdown
# Getting started

Hipster Stack requires Node.js 24 and pnpm.

## Generate a project

```powershell
pnpm dlx hipster-stack@latest create my-product
```

The interactive flow asks about supported optional surfaces, identity, and visual direction. To generate reproducibly from an exported configuration:

```powershell
pnpm dlx hipster-stack@latest create my-product --config hipsterstack.json --yes
```

Use `--dry-run` to review the plan without writing, `--skip-install` to leave dependencies uninstalled, or `--no-git` to skip repository initialization.

## Continue locally

Enter the generated directory, read its README and `.env.example`, configure the services you own, then run:

```powershell
hipster-stack doctor
hipster-stack explain
```

Provider accounts, credentials, migrations, deployment, and production verification remain your responsibility.

````