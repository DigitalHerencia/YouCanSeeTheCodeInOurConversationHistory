---
title: 'The Maximal Template™ Domain Library\app\(public)\components\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\components\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.components.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\components\page.tsx'
source_file: 'page.tsx'
source_sha256: '57b861b950b15573ca688980551dfb808c0d122f40058aa305f8defd6ff04d05'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\components\page.tsx`
> SHA-256: `57b861b950b15573ca688980551dfb808c0d122f40058aa305f8defd6ff04d05`

```tsx
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default function Page() {
  return (
    <section className="space-y-8">
      <header className="space-y-3">
        <Badge>PURE UI</Badge>
        <h1 className="text-4xl font-black uppercase">Components & blocks</h1>
        <p className="text-muted-foreground">
          Presentation primitives compose into category blocks without data,
          authorization, provider, or workflow ownership.
        </p>
      </header>
      <div className="grid gap-5 md:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle>UI primitives</CardTitle>
          </CardHeader>
          <CardContent className="flex flex-wrap gap-3">
            <Button>Primary</Button>
            <Button variant="secondary">Secondary</Button>
            <Badge>Badge</Badge>
            <Badge variant="outline">Status</Badge>
          </CardContent>
        </Card>
        <Card>
          <CardHeader>
            <CardTitle>Block categories</CardTitle>
          </CardHeader>
          <CardContent className="text-sm text-muted-foreground">
            Heroes, feature sections, pricing, FAQs, application sections,
            tables, loading states, errors, calls to action, and more.
          </CardContent>
        </Card>
      </div>
    </section>
  );
}

```