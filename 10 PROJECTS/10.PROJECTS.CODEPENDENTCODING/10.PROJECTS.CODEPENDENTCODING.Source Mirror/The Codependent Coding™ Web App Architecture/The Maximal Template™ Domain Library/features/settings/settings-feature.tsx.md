---
title: 'The Hipster Stack™ Technology Stack\template\features\settings\settings-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\settings\settings-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.settings.settings-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\settings\settings-feature.tsx'
source_file: 'settings-feature.tsx'
source_sha256: '9f9dd72f64fdae9e30c82139f4e742591ed1fe4c6672a9b8ac9f48a62568d9de'
generated: true
---

# `settings-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\settings\settings-feature.tsx`
> SHA-256: `9f9dd72f64fdae9e30c82139f4e742591ed1fe4c6672a9b8ac9f48a62568d9de`

```tsx
import { UserProfile } from "@clerk/nextjs"
import Link from "next/link"

import { PageHero } from "@/components/blocks/page-hero"
import { Button } from "@/components/ui/button"
import { loadedVibesCapabilities } from "@/content/loadedvibes"

const settingsLinks = [
  { href: "/settings/profile", label: "Profile" },
  { href: "/settings/organization", label: "Organization" },
  { href: "/settings/members", label: "Members" },
  { href: "/settings/integrations", label: "Integrations" },
  ...(loadedVibesCapabilities.billing ? [{ href: "/settings/billing", label: "Billing" }] : []),
  { href: "/settings/developer", label: "Developer" },
] as const

export function SettingsFeature() {
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Settings"
        title="Clerk owns account controls."
        description="Account management stays with the auth provider. App authorization remains local and row-backed."
      />
      <nav className="flex flex-wrap gap-2" aria-label="Settings sections">
        {settingsLinks.map((item) => (
          <Button key={item.href} asChild variant="outline" size="sm">
            <Link href={item.href}>{item.label}</Link>
          </Button>
        ))}
      </nav>
      <UserProfile routing="path" path="/settings" />
    </div>
  )
}

```