---
title: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.crm.contacts.-contactid-.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\page.tsx'
source_file: 'page.tsx'
source_sha256: '4a47a5d64c62d13033f8b4af5bcc895a469828ef824caddd3bb791af7722cc9f'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\page.tsx`
> SHA-256: `4a47a5d64c62d13033f8b4af5bcc895a469828ef824caddd3bb791af7722cc9f`

```tsx
import { Suspense } from "react";

import { ContactDetailFeature } from "@/features/crm/contactDetailFeature";
import { ContactDetailSkeleton } from "@/features/crm/contactDetailSkeleton";

export default async function Page({
  params,
}: {
  params: Promise<{ contactId: string }>;
}) {
  const { contactId } = await params;
  return (
    <Suspense fallback={<ContactDetailSkeleton />}>
      <ContactDetailFeature contactId={contactId} />
    </Suspense>
  );
}

```