---
title: 'The Maximal Template™ Domain Library\features\portal\billingFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\portal\billingFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.portal.billingfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\portal\billingFeature.tsx'
source_file: 'billingFeature.tsx'
source_sha256: 'd67737d5aaf08910e046759575821edb8d22f4ec26a7e2680475b21e52d695f9'
generated: true
---

# `billingFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\portal\billingFeature.tsx`
> SHA-256: `d67737d5aaf08910e046759575821edb8d22f4ec26a7e2680475b21e52d695f9`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
  RecordDetailBlock,
} from "@/components/blocks/application-sections";
import { getPortalBilling } from "@/lib/fetchers/portalFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function BillingFeature() {
  const billing = await getPortalBilling();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Client portal"
        title="Billing"
        description="Billing access is separately authorized from general portal access."
      />
      {billing.subscription ? (
        <RecordDetailBlock
          title={billing.subscription.planKey}
          status={billing.subscription.status}
          items={[
            {
              label: "Period end",
              value: billing.subscription.currentPeriodEnd
                ? new Date(
                    billing.subscription.currentPeriodEnd,
                  ).toLocaleDateString()
                : "Not set",
            },
            {
              label: "Cancels at period end",
              value: billing.subscription.cancelAtPeriodEnd ? "Yes" : "No",
            },
          ]}
        />
      ) : null}
      <DataTableBlock
        columns={[
          { key: "number", label: "Invoice" },
          { key: "customer", label: "Customer" },
          { key: "status", label: "Status" },
          { key: "total", label: "Total" },
          { key: "due", label: "Due" },
        ]}
        rows={billing.invoices.map((invoice) => ({
          id: invoice.id,
          href: `/invoices/${invoice.id}`,
          cells: {
            number: `#${invoice.number}`,
            customer: invoice.customerName,
            status: invoice.status,
            total: `${invoice.currency} ${invoice.total}`,
            due: invoice.dueAt
              ? new Date(invoice.dueAt).toLocaleDateString()
              : null,
          },
        }))}
        emptyMessage="No invoices are available for this organization."
      />
    </div>
  );
}

```