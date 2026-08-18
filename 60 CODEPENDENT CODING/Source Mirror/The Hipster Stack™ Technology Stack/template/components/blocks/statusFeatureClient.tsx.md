---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\statusFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\statusFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.statusfeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\statusFeatureClient.tsx'
source_file: 'statusFeatureClient.tsx'
source_sha256: 'aea232e47f58ef34d6b49819df90241d18530462b879ebd722222c4ae5ff8b91'
generated: true
---

# `statusFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\statusFeatureClient.tsx`
> SHA-256: `aea232e47f58ef34d6b49819df90241d18530462b879ebd722222c4ae5ff8b91`

```tsx
"use client"

import {
  createStatusPreviewVouch,
  saveStatusPreviewAmount,
  saveStatusPreviewWindow,
} from "@/components/(presentation)/presentationOperations"
import { VouchCreationWizard } from "@/components/blocks/status"
import type { VouchCreationDraft } from "@/types/presentationPreviewTypes"

export interface StatusFeatureClientProps {
  initialDraft?: Partial<VouchCreationDraft>
}

export function StatusFeatureClient({ initialDraft }: StatusFeatureClientProps) {
  return (
    <VouchCreationWizard
      initialDraft={initialDraft}
      onSaveAmount={saveStatusPreviewAmount}
      onSaveWindow={saveStatusPreviewWindow}
      onCreateVouch={createStatusPreviewVouch}
    />
  )
}

```