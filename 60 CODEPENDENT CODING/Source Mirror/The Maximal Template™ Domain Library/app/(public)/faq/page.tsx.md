---
title: 'The Maximal Template™ Domain Library\app\(public)\faq\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\faq\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.faq.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\faq\page.tsx'
source_file: 'page.tsx'
source_sha256: 'a293140565728a1fcc0575c05583a056f6c0bc72928aff675ff156d732fd7c26'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\faq\page.tsx`
> SHA-256: `a293140565728a1fcc0575c05583a056f6c0bc72928aff675ff156d732fd7c26`

```tsx
import { FAQTwoColumns } from "@/components/blocks/faq-sections";
import { HeroSection } from "@/components/blocks/hero-sections";

export default function Page() {
  return (
    <>
      <HeroSection.Minimal
        title="Frequently asked questions"
        description="How the maximal application, recipes, and protected capabilities fit together."
      />
      <FAQTwoColumns
        title="Architecture and access"
        items={[
          {
            question: "Do I need to sign in to explore?",
            answer:
              "No. Seeded demonstration surfaces are browsable while signed out.",
          },
          {
            question: "Can signed-out visitors change data?",
            answer:
              "No. Protected writes retain authentication, authorization, scope, and validation checks.",
          },
          {
            question: "Is each recipe a separate application?",
            answer:
              "No. Every recipe is a coherent subset of one maximal application.",
          },
          {
            question: "Are providers required to browse the demo?",
            answer:
              "No. Optional integrations report their configuration state without breaking unrelated routes.",
          },
        ]}
      />
    </>
  );
}

```