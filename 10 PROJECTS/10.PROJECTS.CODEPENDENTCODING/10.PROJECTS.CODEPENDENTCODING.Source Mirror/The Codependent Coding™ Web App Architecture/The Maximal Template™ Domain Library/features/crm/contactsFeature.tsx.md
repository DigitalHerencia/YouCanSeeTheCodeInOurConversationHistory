---
title: 'The Maximal Template™ Domain Library\features\crm\contactsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\crm\contactsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.crm.contactsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\crm\contactsFeature.tsx'
source_file: 'contactsFeature.tsx'
source_sha256: '7ae92c7c6a9d7cb62c6476db942d0c68f7580e979af475219b81ebf70438f912'
generated: true
---

# `contactsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\crm\contactsFeature.tsx`
> SHA-256: `7ae92c7c6a9d7cb62c6476db942d0c68f7580e979af475219b81ebf70438f912`

```tsx
import { PageHeaderBlock } from "@/components/blocks/application-sections";
import { getContacts } from "@/lib/fetchers/crmFetchers";

import { ContactsClientFeature } from "./contactsClientFeature";

export async function ContactsFeature() {
  const contacts = await getContacts({ limit: 200, sort: "name-asc" });

  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="CRM"
        title="Contacts"
        description="People associated with accounts in the active organization."
        action={{ label: "New contact", href: "/crm/contacts/new" }}
      />
      <ContactsClientFeature contacts={contacts} />
    </div>
  );
}

```