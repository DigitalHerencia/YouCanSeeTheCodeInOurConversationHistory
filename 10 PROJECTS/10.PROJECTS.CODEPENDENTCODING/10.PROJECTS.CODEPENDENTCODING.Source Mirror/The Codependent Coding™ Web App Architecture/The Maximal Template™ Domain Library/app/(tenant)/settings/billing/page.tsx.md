---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\settings\billing\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\settings\billing\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.settings.billing.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\settings\billing\page.tsx'
source_file: 'page.tsx'
source_sha256: '5d7b9fd80776c654d86be51d6c137971bdd9846356f28b82dd15f16bd83d8c9a'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\settings\billing\page.tsx`
> SHA-256: `5d7b9fd80776c654d86be51d6c137971bdd9846356f28b82dd15f16bd83d8c9a`

```tsx
import { BillingSettingsFeature } from "@/features/billing/billing-settings-feature"
import { loadedVibesCapabilities } from "@/content/loadedvibes"
import { notFound } from "next/navigation"

export default function BillingSettingsPage() {
  if (!loadedVibesCapabilities.billing) notFound()
  return <BillingSettingsFeature />
}

```