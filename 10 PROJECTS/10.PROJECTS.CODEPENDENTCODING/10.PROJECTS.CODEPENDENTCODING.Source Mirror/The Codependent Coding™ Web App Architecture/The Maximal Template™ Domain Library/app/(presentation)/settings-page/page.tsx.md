---
title: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\settings-page\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\settings-page\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-presentation-.settings-page.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\settings-page\page.tsx'
source_file: 'page.tsx'
source_sha256: 'fdfa4d4de4b5fd2c70707695be466dd8c08abba67da5fdda215eafad6942c536'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(presentation)\settings-page\page.tsx`
> SHA-256: `fdfa4d4de4b5fd2c70707695be466dd8c08abba67da5fdda215eafad6942c536`

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

export default function SettingsBlocksPage() {
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