---
title: 'The Hipster Stack™ Technology Stack\docs\configuration\project.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\docs\configuration\project.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.docs.configuration.project.md'
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
source_path: 'The Hipster Stack™ Technology Stack\docs\configuration\project.md'
source_file: 'project.md'
source_sha256: '04eae81c7e689f88b40ec1e366e4b5d76c339e7d823ce62d95aa31a9efc5ea8c'
generated: true
---

# `project.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\docs\configuration\project.md`
> SHA-256: `04eae81c7e689f88b40ec1e366e4b5d76c339e7d823ce62d95aa31a9efc5ea8c`

```markdown
# Project configuration

`hipster-stack create [directory]` controls the destination. The recipe `name` controls package identity, while `identity.displayName` controls visible product naming.

Lifecycle flags:

- `--name <package-name>` overrides the recipe package name.
- `--config <path>` loads the shared JSON contract.
- `--yes` runs non-interactively.
- `--no-git` skips Git initialization.
- `--skip-install` skips dependency installation and generated acceptance validation.
- `--dry-run` plans without writing files.

Generation refuses an unsafe non-empty destination.

```