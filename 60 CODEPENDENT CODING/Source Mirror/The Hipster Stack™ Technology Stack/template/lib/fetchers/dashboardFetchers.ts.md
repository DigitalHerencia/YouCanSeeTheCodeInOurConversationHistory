---
title: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\dashboardFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\dashboardFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.fetchers.dashboardfetchers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\dashboardFetchers.ts'
source_file: 'dashboardFetchers.ts'
source_sha256: 'f5791c2e79eec1ca3ca9e65b6036e893cb767da3515e3d0671d85d393b2b5504'
generated: true
---

# `dashboardFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\fetchers\dashboardFetchers.ts`
> SHA-256: `f5791c2e79eec1ca3ca9e65b6036e893cb767da3515e3d0671d85d393b2b5504`

```ts
import "server-only"

import { getProjectListState } from "@/lib/fetchers/projectFetchers"
import type { DashboardStateDTO } from "@/types/projectTypes"

export async function getDashboardState(): Promise<DashboardStateDTO> {
  const projectState = await getProjectListState()

  return {
    projectCount: projectState.projects.length,
    recentProjects: projectState.projects.slice(0, 4),
    empty: projectState.empty,
  }
}

```