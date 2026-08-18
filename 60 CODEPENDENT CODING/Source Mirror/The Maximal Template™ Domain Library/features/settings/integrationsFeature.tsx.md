---
title: 'The Maximal Template™ Domain Library\features\settings\integrationsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\settings\integrationsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.settings.integrationsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\settings\integrationsFeature.tsx'
source_file: 'integrationsFeature.tsx'
source_sha256: 'c85b8a257d82dcad48523bb8705aab2f5f84ed336170603205bb4cc8eb8afe9b'
generated: true
---

# `integrationsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\settings\integrationsFeature.tsx`
> SHA-256: `c85b8a257d82dcad48523bb8705aab2f5f84ed336170603205bb4cc8eb8afe9b`

```tsx
import {
  IntegrationStatusGridBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getProviderStatuses } from "@/lib/integrations/status";

export function IntegrationsFeature() {
  const integrations = getProviderStatuses();
  return (
    <>
      <PageHeaderBlock
        eyebrow="Safe provider inspection"
        title="Integration status"
        description="Configuration is derived from required environment keys. Secret values are never exposed and no live action runs from this page."
      />
      <IntegrationStatusGridBlock integrations={integrations} />
    </>
  );
}

```