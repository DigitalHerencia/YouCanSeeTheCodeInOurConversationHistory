---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tB\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tB\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.-presentation-.tb.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tB\page.tsx'
source_file: 'page.tsx'
source_sha256: 'ecb5e69b31b90294faec5f0ca4f17e38d47b9cb87e00a8838477e69d25f54416'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tB\page.tsx`
> SHA-256: `ecb5e69b31b90294faec5f0ca4f17e38d47b9cb87e00a8838477e69d25f54416`

```tsx
export default function TenantPageC() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <Panel title="Top" />
      </section>
    </main>
  )
}

function Panel({ title }: { title: string }) {
  return (
    <div className="flex min-h-0 border border-neutral-400 bg-black p-6 md:p-8">
      <div className="flex w-full flex-col justify-between gap-6">
        <div className="space-y-2">
          <p className="text-xs font-medium tracking-wide text-blue-600 uppercase">Section</p>
          <h2 className="text-xl font-semibold tracking-tight text-white">{title}</h2>
          <p className="max-w-prose text-sm leading-6 text-neutral-400">
            Content sits inside consistent padding with balanced X/Y spacing.
          </p>
        </div>
      </div>
    </div>
  )
}

```