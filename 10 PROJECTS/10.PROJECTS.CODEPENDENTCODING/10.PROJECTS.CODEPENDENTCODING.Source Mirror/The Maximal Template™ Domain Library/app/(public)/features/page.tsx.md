---
title: 'The Maximal Template™ Domain Library\app\(public)\features\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\features\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.features.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\features\page.tsx'
source_file: 'page.tsx'
source_sha256: '32b4e7e073b7904fc38866d102a88466738d24f6e3f6a5ffc915d2ed411d342c'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\features\page.tsx`
> SHA-256: `32b4e7e073b7904fc38866d102a88466738d24f6e3f6a5ffc915d2ed411d342c`

```tsx
import {
  Bot,
  BriefcaseBusiness,
  CircleDollarSign,
  Headphones,
  Kanban,
  Megaphone,
  Shield,
  Share2,
  Users,
} from "lucide-react";

import { FeatureGrid } from "@/components/blocks/feature-sections";
import { HeroSection } from "@/components/blocks/hero-sections";

const recipeFeatures = [
  [
    BriefcaseBusiness,
    "CRM",
    "Accounts, contacts, pipeline, and authorized analytics.",
  ],
  [
    Kanban,
    "Projects",
    "Projects, tasks, milestones, dependencies, and assignments.",
  ],
  [
    Headphones,
    "Support",
    "Tenant-aware inbox, ticket lifecycle, and knowledge base.",
  ],
  [
    Megaphone,
    "Marketing",
    "Audiences, campaigns, steps, and performance reporting.",
  ],
  [
    CircleDollarSign,
    "Invoicing",
    "Decimal-safe invoices, expenses, and billing access.",
  ],
  [
    Share2,
    "Social",
    "Account variants, scheduling, media, and publication state.",
  ],
  [Bot, "AI", "Provider-neutral generation records, usage, and entitlements."],
  [
    Users,
    "Client portal",
    "Strict client visibility, documents, versions, and approvals.",
  ],
  [
    Shield,
    "Admin",
    "Explicit privileged capabilities and auditable operations.",
  ],
] as const;

export default function Page() {
  return (
    <>
      <HeroSection.Minimal
        title="Nine recipes. One application."
        description="Each domain has real nouns and boundaries while sharing identity, tenancy, assets, audit, and idempotency."
      />
      <FeatureGrid.WithIcons
        title="Supported recipe domains"
        columns={3}
        features={recipeFeatures.map(([Icon, title, description]) => ({
          icon: <Icon className="size-7" />,
          title,
          description,
        }))}
      />
    </>
  );
}

```