---
title: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\edit\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\edit\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.crm.contacts.-contactid-.edit.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\edit\page.tsx'
source_file: 'page.tsx'
source_sha256: '9153470714f661af0b93e5160745ba94fc8ca22e130d20778b1053fd65475866'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\[contactId]\edit\page.tsx`
> SHA-256: `9153470714f661af0b93e5160745ba94fc8ca22e130d20778b1053fd65475866`

```tsx
import { Suspense } from "react";

import { ContactDetailSkeleton } from "@/features/crm/contactDetailSkeleton";
import { ContactEditFeature } from "@/features/crm/contactEditFeature";

export default async function Page({
  params,
}: {
  params: Promise<{ contactId: string }>;
}) {
  const { contactId } = await params;
  return (
    <Suspense fallback={<ContactDetailSkeleton />}>
      <ContactEditFeature contactId={contactId} />
    </Suspense>
  );
}

```