---
title: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.crm.contacts.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\page.tsx'
source_file: 'page.tsx'
source_sha256: '41760e87ac0cd0a7e88fb0faca3b982d3e536cc2e06617a86b281eabf57ddb68'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\crm\contacts\page.tsx`
> SHA-256: `41760e87ac0cd0a7e88fb0faca3b982d3e536cc2e06617a86b281eabf57ddb68`

```tsx
import { Suspense } from "react";

import { ContactsFeature } from "@/features/crm/contactsFeature";
import { ContactsSkeleton } from "@/features/crm/contactsSkeleton";

export default function Page() {
  return (
    <Suspense fallback={<ContactsSkeleton />}>
      <ContactsFeature />
    </Suspense>
  );
}

```