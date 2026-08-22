---
title: 'The Maximal Template™ Domain Library\features\invoicing\invoicesFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\invoicing\invoicesFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.invoicing.invoicesfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\invoicing\invoicesFeature.tsx'
source_file: 'invoicesFeature.tsx'
source_sha256: '3ccda65dc3b22725b48971096e9bf6c0623713bc364c351e39643cd32878c92d'
generated: true
---

# `invoicesFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\invoicing\invoicesFeature.tsx`
> SHA-256: `3ccda65dc3b22725b48971096e9bf6c0623713bc364c351e39643cd32878c92d`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getInvoices } from "@/lib/fetchers/invoicingFetchers";
export async function InvoicesFeature() {
  const invoices = await getInvoices();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Invoicing"
        title="Invoices"
        action={{ label: "New invoice", href: "/invoices/new" }}
      />
      <DataTableBlock
        columns={[
          { key: "number", label: "Invoice" },
          { key: "customer", label: "Customer" },
          { key: "total", label: "Total" },
          { key: "status", label: "Status" },
          { key: "due", label: "Due" },
        ]}
        rows={invoices.map((invoice) => ({
          id: invoice.id,
          href: `/invoices/${invoice.id}`,
          cells: {
            number: `#${invoice.number}`,
            customer: invoice.customerName,
            total: `${invoice.currency} ${invoice.total}`,
            status: invoice.status,
            due: invoice.dueAt
              ? new Date(invoice.dueAt).toLocaleDateString()
              : null,
          },
        }))}
      />
    </div>
  );
}

```