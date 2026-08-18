---
title: 'The Maximal Template™ Domain Library\features\crm\accountFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\crm\accountFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.crm.accountfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\crm\accountFeature.tsx'
source_file: 'accountFeature.tsx'
source_sha256: 'ede898dec0924bd8400cde0be3649a7490d80a4a53da695ab5f15506e5d040db'
generated: true
---

# `accountFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\crm\accountFeature.tsx`
> SHA-256: `ede898dec0924bd8400cde0be3649a7490d80a4a53da695ab5f15506e5d040db`

```tsx
import {
  EmptyStateBlock,
  PageHeaderBlock,
  RecordDetailBlock,
} from "@/components/blocks/application-sections";
import { getCrmAccount } from "@/lib/fetchers/crmFetchers";

export async function AccountFeature({ accountId }: { accountId: string }) {
  const account = await getCrmAccount(accountId);
  if (!account)
    return (
      <EmptyStateBlock
        title="Account not found"
        description="No visible account matches this identifier in the active organization."
      />
    );
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="CRM account" title={account.name} />
      <RecordDetailBlock
        title="Account details"
        status={account.status}
        items={[
          { label: "Industry", value: account.industry ?? "—" },
          { label: "Website", value: account.website ?? "—" },
          { label: "Contacts", value: String(account.contactCount) },
          { label: "Deals", value: String(account.dealCount) },
          { label: "Notes", value: account.notes ?? "—" },
        ]}
      />
    </div>
  );
}

```