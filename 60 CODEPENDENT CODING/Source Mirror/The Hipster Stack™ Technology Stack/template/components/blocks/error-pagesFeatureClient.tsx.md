---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\error-pagesFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\error-pagesFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.error-pagesfeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\error-pagesFeatureClient.tsx'
source_file: 'error-pagesFeatureClient.tsx'
source_sha256: '0741999bd4b48b929d1154ed5d2030ffe3de8eeeff8be4ca3f908075c8028f3c'
generated: true
---

# `error-pagesFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\error-pagesFeatureClient.tsx`
> SHA-256: `0741999bd4b48b929d1154ed5d2030ffe3de8eeeff8be4ca3f908075c8028f3c`

```tsx
"use client"

import {
  ComingSoonPage,
  ForbiddenPage,
  GenericErrorPage,
  MaintenancePage,
  NotFoundPage,
  OfflinePage,
  ServerErrorPage,
} from "@/components/blocks/error-pages"

export function ErrorPagesFeatureClient() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <NotFoundPage showSearch backHref="#" />
        <ServerErrorPage
          errorId="ERR-500-VOUCH"
          onRetry={() => undefined}
          supportEmail="support@example.com"
        />
        <MaintenancePage
          estimatedTime="45 minutes"
          features={["Payment reconciliation", "Webhook retries", "Status updates"]}
          statusPageUrl="#"
        />
        <OfflinePage onRetry={() => undefined} />
        <ForbiddenPage loginHref="#" />
        <ComingSoonPage launchDate={new Date("2026-12-01T00:00:00")} />
        <GenericErrorPage
          title="Payment State Unavailable"
          description="We could not retrieve provider-backed payment state."
          actions={[
            { label: "Retry", variant: "default" },
            { label: "Home", href: "#", variant: "outline" },
          ]}
        />
      </section>
    </main>
  )
}

```