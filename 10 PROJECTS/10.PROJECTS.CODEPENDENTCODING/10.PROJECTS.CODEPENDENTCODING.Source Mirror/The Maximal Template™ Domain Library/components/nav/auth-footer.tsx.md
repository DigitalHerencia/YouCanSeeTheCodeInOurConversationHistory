---
title: 'The Maximal Template™ Domain Library\components\nav\auth-footer.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\nav\auth-footer.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.nav.auth-footer.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\nav\auth-footer.tsx'
source_file: 'auth-footer.tsx'
source_sha256: 'd5249f4925acd15e9c66ba063ad5885c43f2a5dbf323dc019baf8b3dc9c8656f'
generated: true
---

# `auth-footer.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\nav\auth-footer.tsx`
> SHA-256: `d5249f4925acd15e9c66ba063ad5885c43f2a5dbf323dc019baf8b3dc9c8656f`

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
  );
}

```