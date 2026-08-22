---
title: 'The Maximal Template™ Domain Library\app\(tenant)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.layout.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'e205757e663b87726d576a72452c435901d724f617d51b78e064f95130c285e3'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\layout.tsx`
> SHA-256: `e205757e663b87726d576a72452c435901d724f617d51b78e064f95130c285e3`

```tsx
import type { ReactNode } from "react";

import { TenantShell } from "@/components/shells/tenant-shell";

/** Template recipe surfaces are public so the superset can be inspected without auth. */
export default function TenantLayout({
  children,
}: Readonly<{ children: ReactNode }>) {
  return <TenantShell>{children}</TenantShell>;
}

```