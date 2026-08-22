---
title: 'The Maximal Template™ Domain Library\features\crm\contactEditFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\crm\contactEditFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.crm.contacteditfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\crm\contactEditFeature.tsx'
source_file: 'contactEditFeature.tsx'
source_sha256: '79a8985869a88f74d745ecdc78a0b7a60ce943489364eaf6bf18ebef12c871cd'
generated: true
---

# `contactEditFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\crm\contactEditFeature.tsx`
> SHA-256: `79a8985869a88f74d745ecdc78a0b7a60ce943489364eaf6bf18ebef12c871cd`

```tsx
import { notFound } from "next/navigation";

import { getContactById } from "@/lib/fetchers/crmFetchers";
import { contactIdSchema } from "@/schemas/crmSchemas";

import { ContactEditForm } from "./contactEditForm";

export async function ContactEditFeature({ contactId }: { contactId: string }) {
  const parsedId = contactIdSchema.safeParse(contactId);
  if (!parsedId.success) notFound();

  const contact = await getContactById(parsedId.data);
  if (!contact) notFound();

  return <ContactEditForm contact={contact} />;
}

```