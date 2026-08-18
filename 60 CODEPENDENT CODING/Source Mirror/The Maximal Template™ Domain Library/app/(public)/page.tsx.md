---
title: 'The Maximal Template™ Domain Library\app\(public)\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\page.tsx'
source_file: 'page.tsx'
source_sha256: '6a8ea34ab65975ef2f7f4416749fca9effc6eb270d40bcb424bf9146da1f4e51'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\page.tsx`
> SHA-256: `6a8ea34ab65975ef2f7f4416749fca9effc6eb270d40bcb424bf9146da1f4e51`

```tsx
import { Boxes, ShieldCheck, Workflow } from "lucide-react";

import { CTASimple } from "@/components/blocks/cta-sections";
import { FeatureGrid } from "@/components/blocks/feature-sections";
import { HeroSection } from "@/components/blocks/hero-sections";
import { StatsSection } from "@/components/blocks/stats-sections";

const capabilities = [
  {
    icon: <Boxes className="size-7" />,
    title: "One superset",
    description:
      "Every supported recipe shares one application core instead of drifting into separate applications.",
  },
  {
    icon: <ShieldCheck className="size-7" />,
    title: "Tenant aware",
    description:
      "Authentication, application authorization, scoped queries, and PostgreSQL RLS reinforce the same boundary.",
  },
  {
    icon: <Workflow className="size-7" />,
    title: "Prunable recipes",
    description:
      "Loaded Vibes can select complete recipe slices without inventing a parallel architecture.",
  },
];

export default function Page() {
  return (
    <>
      <HeroSection.Centered
        badge="Canonical SaaS superset"
        title="Build once."
        titleHighlight="Configure precisely."
        description="The Maximal Template™ is the coherent source implementation for tenant-aware generated applications."
        primaryAction={{ label: "Explore dashboard", href: "/dashboard" }}
        secondaryAction={{ label: "Inspect CRM", href: "/crm/contacts" }}
      />
      <FeatureGrid.WithIcons
        subtitle="Architecture"
        title="Shared where it should be"
        features={capabilities}
      />
      <StatsSection.Grid
        stats={[
          { value: "9", label: "Recipe domains" },
          { value: "1", label: "Tenant model" },
          { value: "1", label: "Application architecture" },
          { value: "0", label: "Generic service layers" },
        ]}
      />
      <CTASimple
        title="Walk through the complete system"
        description="Inspect application surfaces and architecture before choosing capabilities."
        primaryAction={{ label: "Browse application", href: "/dashboard" }}
        secondaryAction={{ label: "View capabilities", href: "/features" }}
      />
    </>
  );
}

```