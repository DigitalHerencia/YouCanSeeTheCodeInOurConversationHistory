---
title: 'The Hipster Stack™ Technology Stack\template\features\settings\developer-settings-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\settings\developer-settings-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.settings.developer-settings-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\settings\developer-settings-feature.tsx'
source_file: 'developer-settings-feature.tsx'
source_sha256: '68bc5d24acf8b855e5250eabc939d521c74139bc186d4a8c875eb3d9aab8bc61'
generated: true
---

# `developer-settings-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\settings\developer-settings-feature.tsx`
> SHA-256: `68bc5d24acf8b855e5250eabc939d521c74139bc186d4a8c875eb3d9aab8bc61`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { loadedVibesCapabilities } from "@/content/loadedvibes"

const providerWebhooks = [
  "/api/clerk/webhooks",
  ...(loadedVibesCapabilities.billing ? ["/api/stripe/webhooks"] : []),
  ...(loadedVibesCapabilities.stripeConnect
    ? ["/api/stripe/connect/webhooks"]
    : []),
  "/api/cloudinary/webhooks",
] as const

export function DeveloperSettingsFeature() {
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Settings"
        title="Developer"
        description="Stable application boundaries for local extension and provider configuration."
      />
      <section className="grid max-w-2xl gap-4 border bg-card p-6">
        <h2 className="text-lg font-semibold">Provider webhook endpoints</h2>
        <ul className="grid gap-2 font-mono text-sm">
          {providerWebhooks.map((webhook) => (
            <li key={webhook}>{webhook}</li>
          ))}
        </ul>
        <p className="text-sm text-muted-foreground">
          Configure secrets through environment variables; this surface never reads or renders them.
        </p>
      </section>
    </div>
  )
}

```