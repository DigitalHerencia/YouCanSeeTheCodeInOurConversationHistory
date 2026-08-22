---
title: 'The Maximal Template™ Domain Library\features\dashboard\dashboardFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\dashboard\dashboardFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.dashboard.dashboardfeature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\features\dashboard\dashboardFeature.tsx'
source_file: 'dashboardFeature.tsx'
source_sha256: 'dc7c86d1fc609302f486d1984fc496eeb1758568d2a8a86b3ec1533e756adb18'
generated: true
---

# `dashboardFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\dashboard\dashboardFeature.tsx`
> SHA-256: `dc7c86d1fc609302f486d1984fc496eeb1758568d2a8a86b3ec1533e756adb18`

```tsx
import { Bot, Kanban, ReceiptText, Users } from "lucide-react";

import { FeatureGrid } from "@/components/blocks/feature-sections";
import { HeroSection } from "@/components/blocks/hero-sections";

export function DashboardFeature() {
  return (
    <>
      <HeroSection.Minimal
        title="Application dashboard"
        description="Open a recipe workspace. Persisted metrics appear only through its authorized fetcher."
      />
      <FeatureGrid.WithIcons
        title="Workspaces"
        columns={2}
        features={[
          {
            icon: <Users className="size-7" />,
            title: "CRM",
            description: "Manage tenant-scoped accounts, contacts, and deals.",
          },
          {
            icon: <Kanban className="size-7" />,
            title: "Projects",
            description: "Coordinate projects, milestones, and assigned tasks.",
          },
          {
            icon: <ReceiptText className="size-7" />,
            title: "Invoicing",
            description: "Create decimal-safe invoices and track expenses.",
          },
          {
            icon: <Bot className="size-7" />,
            title: "AI workspace",
            description: "Run selected models with explicit usage records.",
          },
        ]}
      />
    </>
  );
}

```