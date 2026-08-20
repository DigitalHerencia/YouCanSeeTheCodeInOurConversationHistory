---
title: 'The Hipster Stack™ Technology Stack\template\lib\cache\revalidate.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\cache\revalidate.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.cache.revalidate.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\cache\revalidate.ts'
source_file: 'revalidate.ts'
source_sha256: 'a322a4e04a846b711eb0d386007a046c271ec8b184a18a80c0c74241f623a979'
generated: true
---

# `revalidate.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\cache\revalidate.ts`
> SHA-256: `a322a4e04a846b711eb0d386007a046c271ec8b184a18a80c0c74241f623a979`

```ts
import "server-only"

import { revalidatePath, revalidateTag } from "next/cache"

import { cacheTags } from "@/lib/cache/cache-tags"

export function revalidateProjectSurfaces(input: { userId: string; projectId?: string }) {
  revalidatePath("/dashboard")
  revalidatePath("/projects")
  revalidateTag(cacheTags.dashboard(input.userId), "max")
  revalidateTag(cacheTags.projectList(input.userId), "max")

  if (input.projectId) {
    revalidateTag(cacheTags.project(input.projectId), "max")
  }
}

export function revalidateOrganizationSurfaces() {
  revalidatePath("/settings/organization")
  revalidatePath("/team")
}

```