---
title: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-webhooks-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-webhooks-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.admin.admin-webhooks-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-webhooks-feature.tsx'
source_file: 'admin-webhooks-feature.tsx'
source_sha256: '34f7ad3e3bd027687d93c7639cf9cc26e95f36653b06a1e3928cc97400b4ce7a'
generated: true
---

# `admin-webhooks-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\admin\admin-webhooks-feature.tsx`
> SHA-256: `34f7ad3e3bd027687d93c7639cf9cc26e95f36653b06a1e3928cc97400b4ce7a`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { getAdminWebhooks } from "@/lib/fetchers/adminFetchers"

export async function AdminWebhooksFeature() {
  const webhooks = await getAdminWebhooks()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Application administration"
        title="Webhooks"
        description="Recent provider processing state and bounded failure details from the idempotency ledger."
      />
      <div className="grid gap-3">
        {webhooks.map((webhook) => (
          <article key={webhook.id} className="grid gap-1 border bg-card p-4 md:grid-cols-3">
            <div>
              <p className="font-medium">{webhook.provider}</p>
              <p className="text-sm text-muted-foreground">{webhook.eventType}</p>
            </div>
            <p className="text-sm">
              {webhook.status} · attempt {webhook.attemptCount}
            </p>
            <p className="text-sm text-muted-foreground">
              {webhook.processingError ?? "No processing error"}
            </p>
          </article>
        ))}
        {webhooks.length === 0 ? (
          <p className="text-muted-foreground">No webhooks recorded.</p>
        ) : null}
      </div>
    </div>
  )
}

```