---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tC\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tC\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.-presentation-.tc.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tC\page.tsx'
source_file: 'page.tsx'
source_sha256: 'ae49fb521a93989db06f0b41f07246422dcff031046fc961df3ac8b24506f1ad'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\tC\page.tsx`
> SHA-256: `ae49fb521a93989db06f0b41f07246422dcff031046fc961df3ac8b24506f1ad`

```tsx
export default function TenantPageC() {
  return (
    <main className="min-h-screen p-2 text-white md:p-8">
      <section className="grid min-h-[calc(100vh-3rem)] grid-rows-2 gap-2 md:min-h-[calc(100vh-4rem)] md:gap-2">
        <Panel title="Header" />
        <Panel title="Body" />
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