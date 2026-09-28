---
type: codelab
codelab_kind: module
id: MOD-005
ontology: Invoicing & Expense Tracker
application_path: "app/(tenant)/invoices, expenses"
mastery_state: not-started
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-28
tags: [type/codelab, type/module]
---

# Invoicing & Expense Tracker

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#5. Invoicing & Expense Tracker]]

## 5. Invoicing & Expense Tracker Ontology™

### Routes → implemented entrypoints → templates

| Route                        | Implemented entrypoint                   | Template                                                  |
| ---------------------------- | ---------------------------------------- | --------------------------------------------------------- |
| `/invoices`                  | `features/invoicing/invoicesFeature.tsx` | `components/templates/invoicingInvoicesTemplate.tsx`      |
| `/invoices/new`              | `features/invoicing/invoiceNewForm.tsx`  | —                                                         |
| `/invoices/[invoiceId]`      | `features/invoicing/invoiceFeature.tsx`  | `components/templates/invoicingInvoiceDetailTemplate.tsx` |
| `/invoices/[invoiceId]/edit` | `features/invoicing/invoiceEditForm.tsx` | —                                                         |
| `/expenses`                  | `features/invoicing/expensesFeature.tsx` | `components/templates/invoicingExpensesTemplate.tsx`      |
| `/expenses/new`              | `features/invoicing/expenseNewForm.tsx`  | —                                                         |
| `/expenses/[expenseId]`      | `features/invoicing/expenseFeature.tsx`  | `components/templates/invoicingExpenseDetailTemplate.tsx` |
| `/expenses/[expenseId]/edit` | `features/invoicing/expenseEditForm.tsx` | —                                                         |

### `invoicing` feature inventory

```text
features/invoicing/expenseEditForm.tsx
features/invoicing/expenseFeature.tsx
features/invoicing/expenseNewForm.tsx
features/invoicing/expenseSkeleton.tsx
features/invoicing/expensesFeature.client.tsx
features/invoicing/expensesFeature.tsx
features/invoicing/expensesSkeleton.tsx
features/invoicing/invoiceEditForm.tsx
features/invoicing/invoiceFeature.client.tsx
features/invoicing/invoiceFeature.tsx
features/invoicing/invoiceNewForm.tsx
features/invoicing/invoiceSkeleton.tsx
features/invoicing/invoicesFeature.client.tsx
features/invoicing/invoicesFeature.tsx
features/invoicing/invoicesSkeleton.tsx
```

### `invoicing` template inventory

```text
components/templates/invoicingExpenseDetailTemplate.tsx
components/templates/invoicingExpensesTemplate.tsx
components/templates/invoicingInvoiceDetailTemplate.tsx
components/templates/invoicingInvoicesTemplate.tsx
```

### `invoicing` server/application inventory

```text
lib/actions/invoicingActions.ts
lib/fetchers/invoicingFetchers.ts
lib/workflows/invoicingWorkflows.ts

lib/db/selects/invoicing.selects.ts
lib/db/dto/invoicing.dto.ts
lib/db/transactions/create-invoice.tx.ts
lib/db/transactions/invoicing.tx.ts
lib/db/transactions/update-invoice-status.tx.ts

schemas/invoicingSchemas.ts
types/invoicingTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-05-01 Initialization]]
- [[MOD-05-02 Scaffolding]]
- [[MOD-05-03 Configuration]]
- [[MOD-05-04 Verification]]
- [[MOD-05-05 Data]]
- [[MOD-05-06 Features]]
- [[MOD-05-07 Testing]]
- [[MOD-05-08 Validation]]
- [[MOD-05-09 Debug]]
- [[MOD-05-10 Security]]
- [[MOD-05-11 Performance]]
- [[MOD-05-12 Observability]]
- [[MOD-05-13 CI-CD]]
- [[MOD-05-14 Code-Review]]
- [[MOD-05-15 Documentation]]
- [[MOD-05-16 Deploy]]
- [[MOD-05-17 Updates]]

