---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\settings-pageFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\settings-pageFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.settings-pagefeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\settings-pageFeatureClient.tsx'
source_file: 'settings-pageFeatureClient.tsx'
source_sha256: '44b82f76dc8be35766f8f497289f961cdacc07c09d7d87ecc2ab98d684edcd35'
generated: true
---

# `settings-pageFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\settings-pageFeatureClient.tsx`
> SHA-256: `44b82f76dc8be35766f8f497289f961cdacc07c09d7d87ecc2ab98d684edcd35`

```tsx
"use client"

import {
  AppearanceSettings,
  DangerZone,
  NotificationSettings,
  ProfileSettings,
  SecuritySettings,
  SettingsPage,
} from "@/components/blocks/settings-page"

const user = {
  name: "Ivan Roman",
  email: "ivan@example.com",
  bio: "Building deterministic payment coordination.",
  company: "Digital Herencia",
  location: "Nuevo Mexico",
  website: "https://example.com",
}

const sessions = [
  {
    id: "1",
    device: "Chrome on Windows",
    location: "Albuquerque, NM",
    lastActive: "Now",
    current: true,
  },
  { id: "2", device: "Safari on iPhone", location: "Santa Fe, NM", lastActive: "2 hours ago" },
]

export function SettingsPageFeatureClient() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <ProfileSettings user={user} onSave={() => undefined} onAvatarChange={() => undefined} />
        <NotificationSettings onSave={() => undefined} />
        <SecuritySettings
          twoFactorEnabled
          sessions={sessions}
          onChangePassword={() => undefined}
          onToggleTwoFactor={() => undefined}
          onRevokeSession={() => undefined}
        />
        <AppearanceSettings
          theme="dark"
          accentColor="blue-600"
          onThemeChange={() => undefined}
          onAccentColorChange={() => undefined}
        />
        <DangerZone
          onExportData={() => undefined}
          onDeactivate={() => undefined}
          onDelete={() => undefined}
        />
        <SettingsPage />
      </section>
    </main>
  )
}

```