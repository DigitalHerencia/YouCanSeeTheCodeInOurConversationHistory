---
title: 'The Hipster Stack™ Technology Stack\template\features\settings\integration-settings-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\settings\integration-settings-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.settings.integration-settings-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\settings\integration-settings-feature.tsx'
source_file: 'integration-settings-feature.tsx'
source_sha256: '621c8b0d7090a6ba889266ea818937e7db57a565c0a5300066bd5c6f6abd3f9c'
generated: true
---

# `integration-settings-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\settings\integration-settings-feature.tsx`
> SHA-256: `621c8b0d7090a6ba889266ea818937e7db57a565c0a5300066bd5c6f6abd3f9c`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { getIntegrationReadiness } from "@/lib/fetchers/organizationFetchers"

export async function IntegrationSettingsFeature() {
  const integrations = await getIntegrationReadiness()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Settings"
        title="Integrations"
        description="Configuration readiness is reported without returning or rendering provider secrets."
      />
      <div className="grid gap-3 md:grid-cols-2">
        {integrations.map((integration) => (
          <article key={integration.id} className="border bg-card p-5">
            <div className="flex items-center justify-between gap-4">
              <h2 className="text-lg font-semibold">{integration.label}</h2>
              <span className={integration.configured ? "text-primary" : "text-muted-foreground"}>
                {integration.configured ? "Configured" : "Setup required"}
              </span>
            </div>
            <p className="mt-2 text-sm text-muted-foreground">{integration.purpose}</p>
          </article>
        ))}
      </div>
    </div>
  )
}

```