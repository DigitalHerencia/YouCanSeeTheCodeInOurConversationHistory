---
title: 'The Maximal Template™ Domain Library\app\(public)\terms\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\terms\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.terms.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\terms\page.tsx'
source_file: 'page.tsx'
source_sha256: '9870e6fd5e59e25f61f95c95d657ddc9b63a0ae7d2a7f734cea0458ce86f4b61'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\terms\page.tsx`
> SHA-256: `9870e6fd5e59e25f61f95c95d657ddc9b63a0ae7d2a7f734cea0458ce86f4b61`

```tsx
import { FAQSimpleList } from "@/components/blocks/faq-sections";
import { HeroSection } from "@/components/blocks/hero-sections";

export default function Page() {
  return (
    <>
      <HeroSection.Minimal
        title="Terms template"
        description="Generic demonstration content for applications generated from The Maximal Template™."
      />
      <FAQSimpleList
        title="Template notice"
        items={[
          {
            question: "Is this production legal text?",
            answer:
              "No. Replace this demonstration content with terms approved for the generated product before publication.",
          },
          {
            question: "What does this route demonstrate?",
            answer:
              "A static public legal-information surface composed directly from reusable presentation blocks.",
          },
        ]}
      />
    </>
  );
}

```