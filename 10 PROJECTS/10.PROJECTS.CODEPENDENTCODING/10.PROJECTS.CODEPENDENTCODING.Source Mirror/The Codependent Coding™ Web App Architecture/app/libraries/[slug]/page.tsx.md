---
title: 'The Hipster Stack™ Technology Stack\apps\web\app\libraries\[slug]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\app\libraries\[slug]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.app.libraries.-slug-.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\app\libraries\[slug]\page.tsx'
source_file: 'page.tsx'
source_sha256: '67bb36976aff74917cad517a98a4428c28d6dc048bfcdd80980321d8c7af935a'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\app\libraries\[slug]\page.tsx`
> SHA-256: `67bb36976aff74917cad517a98a4428c28d6dc048bfcdd80980321d8c7af935a`

```tsx
import { notFound } from 'next/navigation';
import { LibraryDetail } from '@/features/libraries/library-detail';
import { getLibrary, libraries } from '@/lib/libraries';

export function generateStaticParams() {
  return libraries.map((library) => ({ slug: library.slug }));
}

export default async function LibraryPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const library = getLibrary(slug);
  if (!library) notFound();

  return <LibraryDetail library={library} />;
}

```