---
title: 'The Maximal Template™ Domain Library\features\invoicing\expensesFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\invoicing\expensesFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.invoicing.expensesfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\invoicing\expensesFeature.tsx'
source_file: 'expensesFeature.tsx'
source_sha256: '642e844b4df579a13be6eedb91aa91c42405b077527ceda63b84d0c7fcaee3e3'
generated: true
---

# `expensesFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\invoicing\expensesFeature.tsx`
> SHA-256: `642e844b4df579a13be6eedb91aa91c42405b077527ceda63b84d0c7fcaee3e3`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getExpenses } from "@/lib/fetchers/invoicingFetchers";
export async function ExpensesFeature() {
  const expenses = await getExpenses();
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Invoicing" title="Expenses" />
      <DataTableBlock
        columns={[
          { key: "vendor", label: "Vendor" },
          { key: "amount", label: "Amount" },
          { key: "status", label: "Status" },
          { key: "date", label: "Incurred" },
          { key: "submitter", label: "Submitted by" },
        ]}
        rows={expenses.map((expense) => ({
          id: expense.id,
          cells: {
            vendor: expense.vendor,
            amount: `${expense.currency} ${expense.amount}`,
            status: expense.status,
            date: new Date(expense.incurredAt).toLocaleDateString(),
            submitter: expense.submitter,
          },
        }))}
      />
    </div>
  );
}

```