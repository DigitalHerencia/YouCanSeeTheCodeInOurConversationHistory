---
title: 'The Hipster Stack™ Technology Stack\template\features\members\invitation-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\members\invitation-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.members.invitation-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\members\invitation-feature.tsx'
source_file: 'invitation-feature.tsx'
source_sha256: '7d0f30ed3dffdbc11bb0f4edc4be8dd4a013e55b8a9146b61230e5c4c4ff1f3b'
generated: true
---

# `invitation-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\members\invitation-feature.tsx`
> SHA-256: `7d0f30ed3dffdbc11bb0f4edc4be8dd4a013e55b8a9146b61230e5c4c4ff1f3b`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { InvitationFormClient } from "@/features/members/invitation-form-client"

export function InvitationFeature() {
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Team"
        title="Invite a teammate."
        description="Application roles and capabilities remain local even though Clerk owns identity."
      />
      <InvitationFormClient />
    </div>
  )
}

```