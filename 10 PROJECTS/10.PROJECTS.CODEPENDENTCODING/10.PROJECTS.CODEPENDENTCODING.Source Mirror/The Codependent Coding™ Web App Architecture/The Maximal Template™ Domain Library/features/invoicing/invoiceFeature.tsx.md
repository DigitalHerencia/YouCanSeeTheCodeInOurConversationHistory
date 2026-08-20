---
title: 'The Maximal Template™ Domain Library\features\invoicing\invoiceFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\invoicing\invoiceFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.invoicing.invoicefeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\invoicing\invoiceFeature.tsx'
source_file: 'invoiceFeature.tsx'
source_sha256: '374bda7b576b116074c075dcc91e276ca8f6cdca1840ccf44bbc856590f9c017'
generated: true
---

# `invoiceFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\invoicing\invoiceFeature.tsx`
> SHA-256: `374bda7b576b116074c075dcc91e276ca8f6cdca1840ccf44bbc856590f9c017`

```tsx
import {
  DataTableBlock,
  EmptyStateBlock,
  PageHeaderBlock,
  RecordDetailBlock,
} from "@/components/blocks/application-sections";
import { getInvoice } from "@/lib/fetchers/invoicingFetchers";
export async function InvoiceFeature({ invoiceId }: { invoiceId: string }) {
  const invoice = await getInvoice(invoiceId);
  if (!invoice)
    return (
      <EmptyStateBlock
        title="Invoice not found"
        description="No invoice is visible with this identifier."
      />
    );
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow={`Invoice #${invoice.number}`}
        title={invoice.customerName}
      />
      <RecordDetailBlock
        title="Invoice totals"
        status={invoice.status}
        items={[
          {
            label: "Subtotal",
            value: `${invoice.currency} ${invoice.subtotal}`,
          },
          { label: "Tax", value: `${invoice.currency} ${invoice.taxTotal}` },
          { label: "Total", value: `${invoice.currency} ${invoice.total}` },
          {
            label: "Issued",
            value: invoice.issuedAt
              ? new Date(invoice.issuedAt).toLocaleDateString()
              : "—",
          },
          {
            label: "Due",
            value: invoice.dueAt
              ? new Date(invoice.dueAt).toLocaleDateString()
              : "—",
          },
        ]}
      />
      <DataTableBlock
        columns={[
          { key: "description", label: "Line" },
          { key: "quantity", label: "Quantity" },
          { key: "price", label: "Unit price" },
          { key: "total", label: "Total" },
        ]}
        rows={invoice.lines.map((line) => ({
          id: line.id,
          cells: {
            description: line.description,
            quantity: line.quantity,
            price: line.unitPrice,
            total: line.lineTotal,
          },
        }))}
      />
    </div>
  );
}

```