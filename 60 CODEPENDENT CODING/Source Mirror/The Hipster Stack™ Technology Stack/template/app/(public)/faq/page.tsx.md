---
title: 'The Hipster Stack™ Technology Stack\template\app\(public)\faq\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(public)\faq\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-public-.faq.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(public)\faq\page.tsx'
source_file: 'page.tsx'
source_sha256: 'cd1317036fe53ba8b535bb2f043947ac5c1e2586dbe977c6263696fb930d77ab'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(public)\faq\page.tsx`
> SHA-256: `cd1317036fe53ba8b535bb2f043947ac5c1e2586dbe977c6263696fb930d77ab`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

const questions = [
  {
    question: "Does this use Clerk organizations?",
    answer: "No. Clerk identifies users. Local Prisma rows authorize access to resources.",
  },
  {
    question: "Where do mutations live?",
    answer:
      "Internal app writes use Server Actions under lib/actions. API routes are reserved for webhooks.",
  },
  {
    question: "Can public pages compose components directly?",
    answer:
      "Yes, static public pages can compose blocks directly when they do not call backend operations.",
  },
]

export default function FaqPage() {
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Architecture FAQ"
        title="Boundaries before features."
        description="This starter keeps the default decisions explicit so implementation work lands in the right layer."
      />
      <section className="grid gap-3">
        {questions.map((item) => (
          <Card key={item.question}>
            <CardHeader>
              <CardTitle>{item.question}</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-muted-foreground">{item.answer}</p>
            </CardContent>
          </Card>
        ))}
      </section>
    </div>
  )
}

```