---
title: 'The Maximal Template™ Domain Library\app\(tenant)\invoices\[invoiceId]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\invoices\[invoiceId]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.invoices.-invoiceid-.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\invoices\[invoiceId]\page.tsx'
source_file: 'page.tsx'
source_sha256: 'd7b74bbe0284ba7297f60c2900b6be9fa1bc90a9cdfc1fc10053f5c6120eb570'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\invoices\[invoiceId]\page.tsx`
> SHA-256: `d7b74bbe0284ba7297f60c2900b6be9fa1bc90a9cdfc1fc10053f5c6120eb570`

```tsx
import { InvoiceFeature } from "@/features/invoicing/invoiceFeature";

// URL ownership stops here; orchestration is delegated to the feature.
export default async function Page({
  params,
}: {
  params: Promise<{ invoiceId: string }>;
}) {
  const { invoiceId } = await params;
  return <InvoiceFeature invoiceId={invoiceId} />;
}

```