---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\faq-sectionFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\faq-sectionFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.faq-sectionfeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\faq-sectionFeatureClient.tsx'
source_file: 'faq-sectionFeatureClient.tsx'
source_sha256: '42922b614743ce5e3062146dff2d545429e902dc224f3390a3fd94415465e037'
generated: true
---

# `faq-sectionFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\faq-sectionFeatureClient.tsx`
> SHA-256: `42922b614743ce5e3062146dff2d545429e902dc224f3390a3fd94415465e037`

```tsx
import {
  FAQAccordion,
  FAQSimpleList,
  FAQTwoColumns,
  FAQWithCategories,
  FAQWithContact,
  type FAQItem,
} from "@/components/blocks/faq-section"

const items: FAQItem[] = [
  {
    question: "What releases funds?",
    answer: "Both parties must confirm presence inside the confirmation window.",
  },
  {
    question: "Can one side release funds?",
    answer: "No. One-sided confirmation never releases funds.",
  },
  { question: "Is Vouch escrow?", answer: "No. Vouch coordinates provider-backed payment state." },
  {
    question: "What happens after expiry?",
    answer: "The payment resolves to refund, void, or non-capture.",
  },
]

export function FaqSectionFeatureClient() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <FAQAccordion
          title="Questions"
          subtitle="FAQ"
          description="Common Vouch questions."
          items={items}
        />
        <FAQTwoColumns title="Payment Rules" items={items} />
        <FAQWithCategories
          title="Browse by Category"
          categories={[
            { name: "Payments", items: items.slice(0, 2) },
            { name: "Boundaries", items: items.slice(2) },
          ]}
        />
        <FAQWithContact
          title="Support FAQ"
          items={items}
          contactAction={{ label: "Contact Support" }}
        />
        <FAQSimpleList title="Simple Answers" items={items} />
      </section>
    </main>
  )
}

```