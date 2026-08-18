---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: '0c45ca52ce863db7275f9c19eaecc6934c7e5281fc511266eccb57d7c2a02a01'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\layout.tsx`
> SHA-256: `0c45ca52ce863db7275f9c19eaecc6934c7e5281fc511266eccb57d7c2a02a01`

```tsx
import type { ReactNode } from "react"

import { TenantShell } from "@/components/shells/tenant-shell"

export default function TenantLayout({ children }: { children: ReactNode }) {
  return <TenantShell>{children}</TenantShell>
}

```