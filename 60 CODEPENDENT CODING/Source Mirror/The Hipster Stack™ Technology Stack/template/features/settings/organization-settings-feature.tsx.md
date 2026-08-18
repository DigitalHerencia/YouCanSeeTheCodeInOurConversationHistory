---
title: 'The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.settings.organization-settings-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-feature.tsx'
source_file: 'organization-settings-feature.tsx'
source_sha256: '9265924ab0901b53b2e3ae283e7d1163dd9ca95e3c96b0e3b8cf5981088a62fa'
generated: true
---

# `organization-settings-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\settings\organization-settings-feature.tsx`
> SHA-256: `9265924ab0901b53b2e3ae283e7d1163dd9ca95e3c96b0e3b8cf5981088a62fa`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { OrganizationSettingsFormClient } from "@/features/settings/organization-settings-form-client"
import { getOrganizationSettings } from "@/lib/fetchers/organizationFetchers"

export async function OrganizationSettingsFeature() {
  const organization = await getOrganizationSettings()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Settings"
        title="Organization"
        description="Manage application-owned tenant identity through an authorized workflow."
      />
      <OrganizationSettingsFormClient name={organization.name} />
      <dl className="grid max-w-xl gap-2 border bg-card p-6 text-sm">
        <div className="flex justify-between gap-4">
          <dt className="text-muted-foreground">Slug</dt>
          <dd>{organization.slug}</dd>
        </div>
        <div className="flex justify-between gap-4">
          <dt className="text-muted-foreground">Status</dt>
          <dd>{organization.status}</dd>
        </div>
      </dl>
    </div>
  )
}

```