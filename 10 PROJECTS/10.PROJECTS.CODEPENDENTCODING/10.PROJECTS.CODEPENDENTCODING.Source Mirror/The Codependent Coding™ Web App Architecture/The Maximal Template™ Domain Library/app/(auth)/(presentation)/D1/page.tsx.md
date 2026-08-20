---
title: 'The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\D1\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\D1\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-auth-.-presentation-.d1.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\D1\page.tsx'
source_file: 'page.tsx'
source_sha256: 'f81d59643f0f76a289bab2aae14f06862f285264afca9d2921ea037ec12f0dde'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\D1\page.tsx`
> SHA-256: `f81d59643f0f76a289bab2aae14f06862f285264afca9d2921ea037ec12f0dde`

```tsx
export default function AuthPageD1() {
  return (
    <main className="h-dvh min-h-0 w-full overflow-hidden">
      <section className="grid h-full min-h-0 w-full grid-cols-1 overflow-hidden md:grid-cols-2">
        <div className="hidden min-h-0 md:block">
          <AuthContentPanel />
        </div>

        <div className="min-h-0">
          <SignInFormPanel />
        </div>
      </section>
    </main>
  )
}

function AuthContentPanel() {
  return (
    <div className="flex h-full min-h-0 w-full flex-col justify-center overflow-hidden border-r border-neutral-400 p-6 md:p-8">
      <div className="flex w-full flex-col gap-6">
        <div className="space-y-2">
          <p className="text-xs font-medium tracking-wide text-blue-600 uppercase">Section</p>
          <h2 className="text-xl font-semibold tracking-tight text-white">authContent</h2>
          <p className="max-w-prose text-sm leading-6 text-neutral-400">
            Content sits inside consistent padding with balanced X/Y spacing.
          </p>
        </div>
      </div>
    </div>
  )
}

function SignInFormPanel() {
  return (
    <div className="flex h-full min-h-0 w-full flex-col items-center justify-center overflow-hidden p-6 pt-24 pb-20 md:p-8">
      <div className="flex w-full max-w-xl flex-col gap-6">
        <div className="space-y-2">
          <p className="text-xs font-medium tracking-wide text-blue-600 uppercase">Section</p>
          <h2 className="text-xl font-semibold tracking-tight text-white">signInForm</h2>
          <p className="max-w-prose text-sm leading-6 text-neutral-400">
            Content sits inside consistent padding with balanced X/Y spacing.
          </p>
        </div>
      </div>
    </div>
  )
}

```