---
title: 'The Hipster Stack™ Technology Stack\apps\web\components\site-header.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\components\site-header.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.components.site-header.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\components\site-header.tsx'
source_file: 'site-header.tsx'
source_sha256: 'e80dc9fd7155e7b4654cd4dd85c1a9357a49723eacbe967f83d28e5ca05a4063'
generated: true
---

# `site-header.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\components\site-header.tsx`
> SHA-256: `e80dc9fd7155e7b4654cd4dd85c1a9357a49723eacbe967f83d28e5ca05a4063`

```tsx
import Link from 'next/link';
import { ArrowRight } from 'lucide-react';

export function SiteHeader() {
  return (
    <header className="site-header">
      <Link
        className="wordmark hipster-wordmark"
        href="/"
        aria-label="Hipster Stack home"
      >
        <strong>The Hipster Stack™</strong>
        <small>Constituted not Composable</small>
      </Link>
      <nav aria-label="Primary navigation">
        <Link href="/">Product</Link>
        <Link href="/libraries">Simples</Link>
        <Link href="/docs">Docs</Link>
        <Link className="nav-cta" href="/configure">
          The Constituter™
          <span>
            <ArrowRight aria-hidden="true" />
          </span>
        </Link>
      </nav>
    </header>
  );
}

```