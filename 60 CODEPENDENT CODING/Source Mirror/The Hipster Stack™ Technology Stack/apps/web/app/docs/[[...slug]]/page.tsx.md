---
title: 'The Hipster Stack™ Technology Stack\apps\web\app\docs\[[...slug]]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\app\docs\[[...slug]]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.app.docs.-.slug-.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\app\docs\[[...slug]]\page.tsx'
source_file: 'page.tsx'
source_sha256: 'b85ca528d1ff50ef29cd0955148bf18ebf815ef24ab701f1e0ba2688f0c34abc'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\app\docs\[[...slug]]\page.tsx`
> SHA-256: `b85ca528d1ff50ef29cd0955148bf18ebf815ef24ab701f1e0ba2688f0c34abc`

```tsx
import Link from 'next/link';
import { notFound } from 'next/navigation';
import {
  documentation,
  readDocumentation,
  renderDocumentation,
} from '@/lib/docs';

export function generateStaticParams() {
  return documentation.map((entry) => ({ slug: [...entry.slug] }));
}

export default async function DocumentationPage({
  params,
}: {
  params: Promise<{ slug?: string[] }>;
}) {
  const { slug = [] } = await params;
  const source = readDocumentation(slug);
  if (!source) notFound();

  return (
    <main className="shell docs-shell">
      <aside className="docs-navigation">
        <span>Documentation</span>
        {documentation.map((entry) => {
          const href = `/docs${entry.slug.length ? `/${entry.slug.join('/')}` : ''}`;
          return (
            <Link
              data-active={entry.slug.join('/') === slug.join('/')}
              href={href}
              key={href}
            >
              {entry.title}
            </Link>
          );
        })}
      </aside>
      <article className="docs-content">{renderDocumentation(source)}</article>
    </main>
  );
}

```