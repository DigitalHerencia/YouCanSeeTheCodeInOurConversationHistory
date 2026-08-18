---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-footer.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-footer.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.auth-footer.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-footer.tsx'
source_file: 'auth-footer.tsx'
source_sha256: 'fee73dda8be9ed74b916baa83d6d51221a28202091393efd629a4698c57a95d9'
generated: true
---

# `auth-footer.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\auth-footer.tsx`
> SHA-256: `fee73dda8be9ed74b916baa83d6d51221a28202091393efd629a4698c57a95d9`

```tsx
// components/auth/auth-footer.tsx

export function AuthFooter() {
  return (
    <footer className="px-6 py-4 md:px-10">
      <p className="font-mono text-xs text-neutral-400 md:text-sm">
        Copyright &copy; {new Date().getFullYear()}
        <span className="font-bold text-blue-600"> Vouch</span>
        <span className="mx-2 text-neutral-400"> All rights reserved.</span>
      </p>
    </footer>
  )
}

```