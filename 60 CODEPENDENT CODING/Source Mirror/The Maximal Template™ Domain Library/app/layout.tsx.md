---
title: 'The Maximal Template™ Domain Library\app\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.layout.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'acb8a1f52d321e9cd5a6ceb0a04d6dd6293cd2e80513d916d288c4b646a224a9'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\layout.tsx`
> SHA-256: `acb8a1f52d321e9cd5a6ceb0a04d6dd6293cd2e80513d916d288c4b646a224a9`

```tsx
import { ClerkProvider } from "@clerk/nextjs";
import type { ReactNode } from "react";
import "./globals.css";

// The root layout owns only the document frame; product shells remain reusable.
export default function RootLayout({
  children,
}: Readonly<{ children: ReactNode }>) {
  return (
    <html lang="en" className="dark" style={{ colorScheme: "dark" }}>
      <body>
        <ClerkProvider>{children}</ClerkProvider>
      </body>
    </html>
  );
}

```