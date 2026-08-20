---
title: 'The Hipster Stack™ Technology Stack\template\lib\cache\cache-tags.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\cache\cache-tags.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.cache.cache-tags.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\cache\cache-tags.ts'
source_file: 'cache-tags.ts'
source_sha256: '5b136f2c1560f24f9a8eb1031befcac9124ef576f850a3c7dabfcd182dc1c0aa'
generated: true
---

# `cache-tags.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\cache\cache-tags.ts`
> SHA-256: `5b136f2c1560f24f9a8eb1031befcac9124ef576f850a3c7dabfcd182dc1c0aa`

```ts
export const cacheTags = {
  dashboard: (userId: string) => `dashboard:${userId}`,
  projectList: (userId: string) => `projects:${userId}`,
  project: (projectId: string) => `project:${projectId}`,
}

```