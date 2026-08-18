---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tA\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tA\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.-presentation-.ta.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tA\page.tsx'
source_file: 'page.tsx'
source_sha256: '5b2ec001d270290e56016c212b59b511aa0d961dc6113102fd498e876a7de3a0'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tA\page.tsx`
> SHA-256: `5b2ec001d270290e56016c212b59b511aa0d961dc6113102fd498e876a7de3a0`

```tsx
export default function TenantPageA() {
  return (
    <main className="min-h-screen p-2 text-white md:p-8">
      <section className="grid min-h-[calc(100vh-3rem)] grid-rows-3 gap-2 md:min-h-[calc(100vh-4rem)] md:gap-2">
        <div className="grid grid-cols-1 gap-2 md:grid-cols-2 md:gap-2">
          <Panel title="Top Left" />
          <Panel title="Top Right" />
        </div>

        <Panel title="Middle Row" />

        <Panel title="Bottom Row" />
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