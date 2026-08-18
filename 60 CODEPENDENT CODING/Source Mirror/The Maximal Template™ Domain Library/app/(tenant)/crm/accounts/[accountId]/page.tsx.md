---
title: 'The Maximal Template™ Domain Library\app\(tenant)\crm\accounts\[accountId]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\crm\accounts\[accountId]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.crm.accounts.-accountid-.page.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\crm\accounts\[accountId]\page.tsx'
source_file: 'page.tsx'
source_sha256: '0cf5dc638f78f430f88dffeb2dddffa729aca4f925dd6a0f54054e415adab983'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\crm\accounts\[accountId]\page.tsx`
> SHA-256: `0cf5dc638f78f430f88dffeb2dddffa729aca4f925dd6a0f54054e415adab983`

```tsx
import { AccountFeature } from "@/features/crm/accountFeature";

// URL ownership stops here; orchestration is delegated to the feature.
export default async function Page({
  params,
}: {
  params: Promise<{ accountId: string }>;
}) {
  const { accountId } = await params;
  return <AccountFeature accountId={accountId} />;
}

```