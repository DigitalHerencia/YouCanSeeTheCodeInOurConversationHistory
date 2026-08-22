---
title: 'The Maximal Template™ Domain Library\features\crm\contactDetailFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\crm\contactDetailFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.crm.contactdetailfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\crm\contactDetailFeature.tsx'
source_file: 'contactDetailFeature.tsx'
source_sha256: 'c5e481e7f9c2695eeacbe2c64ae1ffa3a7f49192801311c38994afba434524e8'
generated: true
---

# `contactDetailFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\crm\contactDetailFeature.tsx`
> SHA-256: `c5e481e7f9c2695eeacbe2c64ae1ffa3a7f49192801311c38994afba434524e8`

```tsx
import {
  PageHeaderBlock,
  RecordDetailBlock,
} from "@/components/blocks/application-sections";
import { notFound } from "next/navigation";

import { getContactById } from "@/lib/fetchers/crmFetchers";
import { contactIdSchema } from "@/schemas/crmSchemas";

export async function ContactDetailFeature({
  contactId,
}: {
  contactId: string;
}) {
  const parsedId = contactIdSchema.safeParse(contactId);
  if (!parsedId.success) notFound();

  const contact = await getContactById(parsedId.data);
  if (!contact) notFound();

  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="CRM contact"
        title={`${contact.firstName} ${contact.lastName}`}
        action={{
          label: "Edit contact",
          href: `/crm/contacts/${contact.id}/edit`,
        }}
      />
      <RecordDetailBlock
        title="Contact details"
        status={contact.status}
        items={[
          { label: "Email", value: contact.email ?? "—" },
          { label: "Phone", value: contact.phone ?? "—" },
          { label: "Title", value: contact.title ?? "—" },
          { label: "Account", value: contact.account?.name ?? "Unassigned" },
          { label: "Owner", value: contact.owner?.displayName ?? "Unassigned" },
        ]}
      />
    </div>
  );
}

```