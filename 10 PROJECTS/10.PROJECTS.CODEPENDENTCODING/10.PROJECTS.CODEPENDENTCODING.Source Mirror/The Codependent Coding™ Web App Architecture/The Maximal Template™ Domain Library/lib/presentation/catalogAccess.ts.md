---
title: 'The Hipster Stack™ Technology Stack\template\lib\presentation\catalogAccess.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\presentation\catalogAccess.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.presentation.catalogaccess.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\presentation\catalogAccess.ts'
source_file: 'catalogAccess.ts'
source_sha256: 'caf52fbdb7ad87ecdc98d1d407c6f922975d93513c077307dbc83323e60b3f79'
generated: true
---

# `catalogAccess.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\presentation\catalogAccess.ts`
> SHA-256: `caf52fbdb7ad87ecdc98d1d407c6f922975d93513c077307dbc83323e60b3f79`

```ts
import "server-only"

export function isPresentationCatalogEnabled(): boolean {
  return (
    process.env.NODE_ENV !== "production" || process.env.PRESENTATION_CATALOG_ENABLED === "true"
  )
}

```