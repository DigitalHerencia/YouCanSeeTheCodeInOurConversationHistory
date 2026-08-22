---
title: 'The Hipster Stack™ Technology Stack\apps\web\components\site-footer.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\components\site-footer.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.components.site-footer.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\components\site-footer.tsx'
source_file: 'site-footer.tsx'
source_sha256: '4412101d2fb8c901a61f82a4cf721d120608e5fc29d25b1dd87079acddd9a16c'
generated: true
---

# `site-footer.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\components\site-footer.tsx`
> SHA-256: `4412101d2fb8c901a61f82a4cf721d120608e5fc29d25b1dd87079acddd9a16c`

```tsx
import Link from 'next/link';

export function SiteFooter() {
  return (
    <footer className="site-footer">
      <div className="footer-bar">
        <Link
          className="heritage-wordmark"
          href="/"
          aria-label="Digital Herencia"
        >
          <strong>Digital Herencia</strong>
          <small>A Data Cartel</small>
        </Link>
        <nav aria-label="Footer navigation">
          <Link href="/">About</Link>
          <a href="mailto:hello@digitalherencia.com">Contact</a>
          <span>Privacy</span>
          <span>Terms</span>
        </nav>
        <small>© 2026 Digital Herencia</small>
      </div>
    </footer>
  );
}

```