---
title: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\connectFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\connectFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.fetchers.connectfetchers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\connectFetchers.ts'
source_file: 'connectFetchers.ts'
source_sha256: '296379e76c8e1770e94b98b0dc15a28746a55f32a53d576cf2bb0e99d626e321'
generated: true
---

# `connectFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\fetchers\connectFetchers.ts`
> SHA-256: `296379e76c8e1770e94b98b0dc15a28746a55f32a53d576cf2bb0e99d626e321`

```ts
import "server-only"

import { requireTenantContext } from "@/lib/auth/session"
import { assertCapability } from "@/lib/authz/assertions"
import { withTenantContext } from "@/lib/db/withTenantContext"
import type { ConnectReadinessDTO } from "@/types/connectTypes"

export async function getConnectReadiness(): Promise<ConnectReadinessDTO> {
  const context = await requireTenantContext()
  assertCapability(context, "connect.manage")
  const readiness = await withTenantContext(context.organization.id, (tx) =>
    tx.connectAccount.findUnique({
      where: { organizationId: context.organization.id },
      select: {
        status: true,
        detailsSubmitted: true,
        chargesEnabled: true,
        payoutsEnabled: true,
        requirementsDueCount: true,
        disabledReason: true,
        providerUpdatedAt: true,
      },
    })
  )
  return readiness
    ? { ...readiness, providerUpdatedAt: readiness.providerUpdatedAt.toISOString() }
    : null
}

```