---
tags: []
title: Untitled
date created: Saturday, August 22nd 2026, 10:22:25 pm
date modified: Saturday, August 22nd 2026, 10:40:16 pm
---

# Untitled

lets start by pretending we have a generic website:

📦Website  
┣ 📂app  
┃ ┣ 📂(auth)  
┃ ┃ ┣ 📂A1  
┃ ┃ ┃ ┗ 📜page.tsx

┃ ┃ ┣ 📂A2  
┃ ┃ ┃ ┗ 📜page.tsx

┃ ┃ ┣ 📜error.tsx  
┃ ┃ ┗ 📜layout.tsx

┃ ┣ 📂(presentation)  
┃ ┃ ┣ 📂auth-forms  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂catalog  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂config-page  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂cta-section  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂error-pages  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂faq-section  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂feature-grid  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂hero-section  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂invoice  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂onboarding-flow  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂process-panel  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂settings-page  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂stats-section  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂status  
┃ ┃ ┃ ┗ 📜page.tsx

┃ ┃ ┣ 📜loading

┃ ┃ ┣ 📜error

┃ ┃ ┗ 📜layout.tsx

┃ ┣ 📂(public)  
┃ ┃ ┣ 📂pA  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂pB  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂pC  
┃ ┃ ┃ ┗ 📜page.tsx

┃ ┃ ┣ 📜loading

┃ ┃ ┣ 📜error  
┃ ┃ ┗ 📜layout.tsx  
┃ ┣ 📂(tenant)  
┃ ┃ ┣ 📂tA  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂tB  
┃ ┃ ┃ ┗ 📜page.tsx  
┃ ┃ ┣ 📂tC  
┃ ┃ ┃ ┗ 📜page.tsx

┃ ┃ ┣ 📜error  
┃ ┃ ┗ 📜layout.tsx  
┃ ┣ 📜global-error.tsx  
┃ ┣ 📜globals.css  
┃ ┣ 📜layout.tsx  
┃ ┣ 📜loading.tsx  
┃ ┣ 📜not-found.tsx  
┃ ┗ 📜page.tsx  
┣ 📂components  
┃ ┣ 📂blocks  
┃ ┃ ┣ 📜auth-forms.tsx  
┃ ┃ ┣ 📜cta-section.tsx  
┃ ┃ ┣ 📜error-pages.tsx  
┃ ┃ ┣ 📜faq-section.tsx  
┃ ┃ ┣ 📜feature-grid.tsx  
┃ ┃ ┣ 📜hero-section.tsx  
┃ ┃ ┣ 📜invoice.tsx  
┃ ┃ ┣ 📜onboarding-flow\.tsx  
┃ ┃ ┣ 📜page-hero.tsx  
┃ ┃ ┣ 📜process-panel.tsx  
┃ ┃ ┣ 📜settings-page.tsx  
┃ ┃ ┣ 📜stat-grid.tsx  
┃ ┃ ┣ 📜stats-section.tsx  
┃ ┃ ┗ 📜status.tsx  
┃ ┣ 📂navigation  
┃ ┃ ┣ 📜auth-footer.tsx  
┃ ┃ ┣ 📜auth-header.tsx  
┃ ┃ ┣ 📜mobile-bottom-nav.tsx  
┃ ┃ ┣ 📜public-footer.tsx  
┃ ┃ ┣ 📜public-header.tsx  
┃ ┃ ┣ 📜tenant-footer.tsx  
┃ ┃ ┗ 📜tenant-header.tsx

┃ ┣ 📂layouts  
┃ ┃ ┣ 📜A1.tsx  
┃ ┃ ┣ 📜A2.tsx  
┃ ┃ ┣ 📜pA.tsx  
┃ ┃ ┣ 📜pB.tsx  
┃ ┃ ┣ 📜pC.tsx  
┃ ┃ ┣ 📜tA.tsx

┃ ┃ ┣ 📜tA.tsx  
┃ ┃ ┗ 📜tC.tsx  
┃ ┣ 📂shells  
┃ ┃ ┣ 📜auth-shell.tsx  
┃ ┃ ┣ 📜public-shell.tsx  
┃ ┃ ┗ 📜tenant-shell.tsx  
┃ ┗ 📂ui  
┃ ┃ ┣ 📜accordion.tsx  
┃ ┃ ┣ 📜alert.tsx  
┃ ┃ ┣ 📜avatar.tsx  
┃ ┃ ┣ 📜badge.tsx  
┃ ┃ ┣ 📜button.tsx  
┃ ┃ ┣ 📜card.tsx  
┃ ┃ ┣ 📜checkbox.tsx  
┃ ┃ ┣ 📜dialog.tsx  
┃ ┃ ┣ 📜dropdown-menu.tsx  
┃ ┃ ┣ 📜empty-state.tsx  
┃ ┃ ┣ 📜field.tsx  
┃ ┃ ┣ 📜input.tsx  
┃ ┃ ┣ 📜label.tsx  
┃ ┃ ┣ 📜marquee.tsx  
┃ ┃ ┣ 📜progress.tsx  
┃ ┃ ┣ 📜separator.tsx  
┃ ┃ ┣ 📜sheet.tsx  
┃ ┃ ┣ 📜skeleton.tsx  
┃ ┃ ┣ 📜switch.tsx  
┃ ┃ ┣ 📜tabs.tsx  
┃ ┃ ┣ 📜textarea.tsx  
┃ ┃ ┗ 📜timeline.tsx  
┃ ┣ 📂content  
┃ ┃ ┣ 📜auth.ts  
┃ ┃ ┣ 📜public.ts  
┃ ┃ ┣ 📜tenant.ts  
┃ ┃ ┣ 📜navigation.ts  
┃ ┃ ┗ 📜site.ts  
┃ ┣ 📂context  
┃ ┃ ┣ 📜application-workflow.md  
┃ ┃ ┣ 📜auth-authz-boundary.md  
┃ ┃ ┣ 📜fetcher.md  
┃ ┃ ┣ 📜layer-contract.md  
┃ ┃ ┣ 📜route-feature-orchestration.md  
┃ ┃ ┣ 📜server-action.md  
┃ ┃ ┣ 📜transaction-helper.md  
┃ ┃ ┗ 📜webhook-processor.md  
┃ ┣ 📂features  
┃ ┃ ┣ 📂auth  
┃ ┃ ┃ ┣ 📜signinForm.tsx  
┃ ┃ ┃ ┗ 📜signupForm.tsx  
┃ ┃ ┗ 📂tenant  
┃ ┃ ┃ ┣📜tenantFeature.tsx  
┃ ┃ ┃ ┗📜tenantClientFeature.tsx  
┃ ┣ 📂lib  
┃ ┃ ┣ 📂actions  
┃ ┃ ┃ ┗ 📜tenantActions.ts  
┃ ┃ ┣ 📂auth  
┃ ┃ ┃ ┣ 📜client.ts  
┃ ┃ ┃ ┣ 📜redirects.ts  
┃ ┃ ┃ ┗ 📜session.ts  
┃ ┃ ┣ 📂authz  
┃ ┃ ┃ ┣ 📜roles.ts  
┃ ┃ ┃ ┣ 📜permissions.ts  
┃ ┃ ┃ ┣ 📜policies.ts  
┃ ┃ ┣ 📂cache  
┃ ┃ ┃ ┣ 📜cache-tags.ts  
┃ ┃ ┃ ┗ 📜revalidate.ts  
┃ ┃ ┣ 📂db  
┃ ┃ ┃ ┣ 📂dto  
┃ ┃ ┃ ┃ ┗ 📜tenant.mappers.ts  
┃ ┃ ┃ ┣ 📂selects  
┃ ┃ ┃ ┃ ┗ 📜tenant.selects.ts  
┃ ┃ ┃ ┣ 📂transactions  
┃ ┃ ┃ ┃ ┗ 📜tenant.transactions.ts  
┃ ┃ ┃ ┗ 📜prisma.ts  
┃ ┃ ┣ 📂fetchers  
┃ ┃ ┃ ┗ 📜tenantFetchers.ts  
┃ ┃ ┣ 📂workflows  
┃ ┃ ┃ ┗ 📜tenantWorkflows.ts  
┃ ┃ ┣ 📜env.ts  
┃ ┃ ┗ 📜utils.ts  
┃ ┣ 📂prisma  
┃ ┃ ┣ 📂migrations  
┃ ┃ ┃ ┣ 📂20260804062000_tenant  
┃ ┃ ┃ ┃ ┗ 📜migration.sql  
┃ ┃ ┃ ┗ 📜migration_lock.toml  
┃ ┃ ┗ 📜schema.prisma  
┃ ┣ 📂schemas  
┃ ┃ ┗ 📜tenantSchemas.ts  
┃ ┣ 📂types  
┃ ┃ ┗ 📜tenantTypes.ts  
┣ 📜.editorconfig  
┣ 📜.env.example  
┣ 📜.gitattributes  
┣ 📜.gitignore  
┣ 📜.node-version  
┣ 📜.prettierignore  
┣ 📜AGENTS.md  
┣ 📜components.json  
┣ 📜eslint.config.mjs  
┣ 📜LICENSE  
┣ 📜next-env.d.ts  
┣ 📜next.config.ts  
┣ 📜package.json  
┣ 📜playwright.config.ts  
┣ 📜pnpm-lock.yaml  
┣ 📜pnpm-workspace.yaml  
┣ 📜postcss.config.mjs  
┣ 📜prettier.config.mjs  
┣ 📜prisma.config.ts  
┣ 📜proxy.ts  
┣ 📜README.md  
┣ 📜SECURITY.md  
┣ 📜tsconfig.json  
┣ 📜vercel.json  
┣ 📜vitest.config.ts  
┣ 📜vitest.integration.config.ts  
┗ 📜vitest.setup.ts

Tenant Page A

```tsx
import { tenantClientFeature } from "@/features/tenant/tenantClientFeature"

export default function tA() {

  return <InferenceFeature />

}
```


Tenant Layout A `components/layouts/tA.tsx`

```tsx
export default function TenantPageA() {
  return (
    <main className="min-h-screen p-2 text-white md:p-8">
      <section className="grid min-h-[calc(100vh-3rem)] grid-rows-3 gap-2 md:min-h-[calc(100vh-4rem)] md:gap-2">
        <div className="grid grid-cols-1 gap-2 md:grid-cols-2 md:gap-2">
          <Panel title="Top Left" />
          <Panel title="Top Right" />
        </div>
        <Panel title="Middle Row" />
        <Panel title="Bottom Row" />
      </section>
    </main>
  )
}
function Panel({ title }: { title: string }) {
  return (
    <div className="flex min-h-0 border border-neutral-400 bg-black p-6 md:p-8">
      <div className="flex w-full flex-col justify-between gap-6">
        <div className="space-y-2">
          <p className="text-xs font-medium tracking-wide text-blue-600 uppercase">Section</p>
          <h2 className="text-xl font-semibold tracking-tight text-white">{title}</h2>
          <p className="max-w-prose text-sm leading-6 text-neutral-400">
            Content sits inside consistent padding with balanced X/Y spacing.
          </p>
        </div>
      </div>
    </div>
  )
}
```

Tenant Feature `features/tenant/tenantClientFeature.tsx`

```tsx
"use client"

import { Invoice, InvoiceList, InvoiceSummary, Receipt } from "@/components/blocks/invoice"

const invoiceData = {
  invoiceNumber: "INV-2026-001",
  issueDate: "May 20, 2026",
  dueDate: "May 27, 2026",
  status: "pending" as const,
  from: {
    name: "Vouch Operations",
    company: "Digital Herencia",
    address: "100 Plaza St",
    city: "Albuquerque",
    state: "NM",
    zip: "87102",
    email: "billing@example.com",
  },
  to: {
    name: "Client Account",
    address: "500 Market St",
    city: "San Francisco",
    state: "CA",
    zip: "94105",
    email: "client@example.com",
  },
  items: [
    { description: "Commitment coordination", quantity: 1, unitPrice: 750, total: 750 },
    { description: "Provider reconciliation", quantity: 1, unitPrice: 250, total: 250 },
  ],
  subtotal: 1000,
  tax: { label: "Tax", rate: 0, amount: 0 },
  total: 1000,
  notes: "Funds release only after both parties confirm in time.",
  terms: "Payment state is coordinated through the payment provider.",
}
const receiptData = {
  receiptNumber: "RCT-2026-001",
  date: "May 20, 2026",
  merchant: {
    name: "Vouch",
    address: "Nuevo Mexico",
    phone: "(555) 010-2026",
  },
  items: [
    { name: "Vouch fee", quantity: 1, price: 50 },
    { name: "Payment coordination", quantity: 1, price: 950 },
  ],
  subtotal: 1000,
  tax: 0,
  total: 1000,
  paymentMethod: "Card",
  cardLast4: "4242",
}
const invoices = [
  {
    id: "1",
    invoiceNumber: "INV-001",
    clientName: "Client One",
    date: "May 20, 2026",
    amount: 1000,
    status: "paid" as const,
  },
  {
    id: "2",
    invoiceNumber: "INV-002",
    clientName: "Client Two",
    date: "May 21, 2026",
    amount: 1250,
    status: "pending" as const,
  },
  {
    id: "3",
    invoiceNumber: "INV-003",
    clientName: "Client Three",
    date: "May 22, 2026",
    amount: 750,
    status: "overdue" as const,
  },
]
export function tenantClientFeature() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <Invoice
          data={invoiceData}
          onDownload={() => undefined}
          onPrint={() => undefined}
          onSendEmail={() => undefined}
        />
        <Receipt data={receiptData} onDownload={() => undefined} />
        <InvoiceSummary
          invoiceNumber="INV-2026-002"
          clientName="Vouch Client"
          issueDate="May 20, 2026"
          dueDate="May 27, 2026"
          amount={1000}
          status="pending"
          href="/vouches/demo-vouch"
          onView={() => undefined}
          onDownload={() => undefined}
        />
        <InvoiceList invoices={invoices} onView={() => undefined} onDownload={() => undefined} />
      </section>
    </main>
  )
}
```


Invoice UI Block
```tsx
import * as React from "react"
import { Button } from "@/components/ui/button"
import { Separator } from "@/components/ui/separator"
import { Download, Printer, Mail, Check, Clock, AlertCircle } from "lucide-react"

// ============================================================================
// Common Types
// ============================================================================

export interface InvoiceItem {
  description: string
  quantity: number

  unitPrice: number

  unitPriceLabel?: string

  total?: number

  totalLabel?: string

}

export interface InvoiceAddress {

  name: string

  company?: string

  address: string

  city: string

  state?: string

  zip: string

  country?: string

  email?: string

  phone?: string

}

export interface InvoiceData {

  title?: string

  invoiceNumber: string

  issueDate: string

  dueDate: string

  status?: "paid" | "pending" | "overdue" | string

  from: InvoiceAddress

  to: InvoiceAddress

  items: InvoiceItem[]

  subtotal: number

  tax?: { label: string; rate: number; amount: number }

  discount?: { label: string; amount: number }

  total: number

  notes?: string

  terms?: string

  details?: Array<{ label: string; value: string }>

  actions?: React.ReactNode

  paymentInfo?: {

    bankName?: string

    accountNumber?: string

    routingNumber?: string

    paymentMethods?: string[]

  }

}

// ============================================================================

// INVOICE VARIANT 1: Full Invoice

// ============================================================================

export interface InvoiceProps {

  data: InvoiceData

  logo?: React.ReactNode

  onDownload?: () => void

  onPrint?: () => void

  onSendEmail?: () => void

}

export function Invoice({ data, logo, onDownload, onPrint, onSendEmail }: InvoiceProps) {

  const computedSubtotal = data.items.reduce(

    (sum, item) => sum + (item.total ?? item.quantity * item.unitPrice),

    0

  )

  const computedTotal = computedSubtotal + (data.tax?.amount ?? 0) - (data.discount?.amount ?? 0)

  if ((import.meta as ImportMeta & { env?: { DEV?: boolean } }).env?.DEV) {

    if (Math.abs(computedSubtotal - data.subtotal) > 0.01) {

      console.warn(

        `[Invoice] subtotal mismatch: passed ${data.subtotal.toFixed(2)}, computed ${computedSubtotal.toFixed(2)}`

      )

    }

    if (Math.abs(computedTotal - data.total) > 0.01) {

      console.warn(

        `[Invoice] total mismatch: passed ${data.total.toFixed(2)}, computed ${computedTotal.toFixed(2)}`

      )

    }

  }

  const statusConfig = {

    paid: { bg: "bg-blue-600", text: "text-white", icon: Check },

    pending: { bg: "bg-blue-600", text: "text-white", icon: Clock },

    overdue: { bg: "bg-red-600", text: "text-white", icon: AlertCircle },

  }

  const status =

    data.status && data.status in statusConfig

      ? statusConfig[data.status as keyof typeof statusConfig]

      : null

  return (

    <div className="mx-auto max-w-4xl">

      {/* Actions Bar */}

      <div className="mb-6 flex items-center justify-between print:hidden">

        <h2 className="text-2xl font-black uppercase">Invoice</h2>

        <div className="flex gap-2">

          {onSendEmail && (

            <Button variant="outline" size="sm" onClick={onSendEmail}>

              <Mail className="mr-2 h-4 w-4" />

              Email

            </Button>

          )}

          {onPrint && (

            <Button variant="outline" size="sm" onClick={onPrint}>

              <Printer className="mr-2 h-4 w-4" />

              Print

            </Button>

          )}

          {onDownload && (

            <Button size="sm" onClick={onDownload}>

              <Download className="mr-2 h-4 w-4" />

              Download

            </Button>

          )}

        </div>

      </div>

      {/* Invoice Document */}

      <div className="border-3 border-neutral-400 bg-black shadow-[8px_8px_0px_oklch(54.6%_0.245_262.881)] print:border-0 print:shadow-none">

        <div className="p-8 md:p-12">

          {/* Header */}

          <div className="mb-8 flex flex-col gap-6 md:flex-row md:items-start md:justify-between">

            <div>

              {logo && <div className="mb-4">{logo}</div>}

              <AddressBlock address={data.from} />

            </div>

            <div className="space-y-2 text-left md:text-right">

              <h3 className="text-4xl font-black tracking-tight uppercase">

                {data.title ?? "Invoice"}

              </h3>

              <div className="space-y-1 text-sm">

                <p>

                  <span className="font-bold text-neutral-400 uppercase">Invoice #:</span>{" "}

                  <span className="font-medium">{data.invoiceNumber}</span>

                </p>

                <p>

                  <span className="font-bold text-neutral-400 uppercase">Issue Date:</span>{" "}

                  <span className="font-medium">{data.issueDate}</span>

                </p>

                <p>

                  <span className="font-bold text-neutral-400 uppercase">Due Date:</span>{" "}

                  <span className="font-medium">{data.dueDate}</span>

                </p>

              </div>

              {status && (

                <div

                  className={`inline-flex items-center gap-1 px-3 py-1 text-xs font-bold uppercase ${status.bg} ${status.text}`}

                >

                  <status.icon className="h-3 w-3" />

                  {data.status}

                </div>

              )}

            </div>

          </div>

          {/* Bill To */}

          <div className="mb-8 border-3 border-neutral-400 bg-neutral-900 p-4">

            <p className="mb-2 text-xs font-bold text-neutral-400 uppercase">Bill To</p>

            <AddressBlock address={data.to} />

          </div>

          {/* Items Table */}

          <div className="mb-8 overflow-x-auto">

            <table className="w-full">

              <thead>

                <tr className="border-b-3 border-neutral-400">

                  <th className="py-3 text-left text-sm font-black uppercase">Description</th>

                  <th className="w-24 py-3 text-center text-sm font-black uppercase">Qty</th>

                  <th className="w-32 py-3 text-right text-sm font-black uppercase">Unit Price</th>

                  <th className="w-32 py-3 text-right text-sm font-black uppercase">Total</th>

                </tr>

              </thead>

              <tbody>

                {data.items.map((item) => (

                  <tr

                    key={`invoice-item-${item.description}`}

                    className="border-b border-neutral-400"

                  >

                    <td className="py-4">{item.description}</td>

                    <td className="py-4 text-center">{item.quantity}</td>

                    <td className="py-4 text-right font-mono">

                      {item.unitPriceLabel ?? `$${item.unitPrice.toFixed(2)}`}

                    </td>

                    <td className="py-4 text-right font-mono font-bold">

                      {item.totalLabel ??

                        `$${(item.total || item.quantity * item.unitPrice).toFixed(2)}`}

                    </td>

                  </tr>

                ))}

              </tbody>

            </table>

          </div>

          {/* Totals */}

          <div className="mb-8 flex justify-end">

            <div className="w-full max-w-xs space-y-2">

              <div className="flex justify-between py-2">

                <span className="text-neutral-400">Subtotal</span>

                <span className="font-mono font-bold">${data.subtotal.toFixed(2)}</span>

              </div>

              {data.tax && (

                <div className="flex justify-between py-2">

                  <span className="text-neutral-400">

                    {data.tax.label} ({data.tax.rate}%)

                  </span>

                  <span className="font-mono">${data.tax.amount.toFixed(2)}</span>

                </div>

              )}

              {data.discount && (

                <div className="flex justify-between py-2 text-blue-600">

                  <span>{data.discount.label}</span>

                  <span className="font-mono">-${data.discount.amount.toFixed(2)}</span>

                </div>

              )}

              <Separator className="h-0.5 bg-neutral-900" />

              <div className="flex justify-between py-2">

                <span className="text-lg font-black uppercase">Total</span>

                <span className="font-mono text-2xl font-black">${data.total.toFixed(2)}</span>

              </div>

            </div>

          </div>

          {/* Payment Info */}

          {data.paymentInfo && (

            <div className="mb-8 border-3 border-neutral-400 bg-blue-600 p-4">

              <p className="mb-3 text-xs font-bold text-neutral-400 uppercase">

                Payment Information

              </p>

              <div className="grid gap-4 text-sm md:grid-cols-2">

                {data.paymentInfo.bankName && (

                  <div>

                    <p className="font-bold">Bank Name</p>

                    <p className="text-neutral-400">{data.paymentInfo.bankName}</p>

                  </div>

                )}

                {data.paymentInfo.accountNumber && (

                  <div>

                    <p className="font-bold">Account Number</p>

                    <p className="font-mono text-neutral-400">{data.paymentInfo.accountNumber}</p>

                  </div>

                )}

                {data.paymentInfo.routingNumber && (

                  <div>

                    <p className="font-bold">Routing Number</p>

                    <p className="font-mono text-neutral-400">{data.paymentInfo.routingNumber}</p>

                  </div>

                )}

                {data.paymentInfo.paymentMethods && (

                  <div>

                    <p className="font-bold">Accepted Methods</p>

                    <p className="text-neutral-400">{data.paymentInfo.paymentMethods.join(", ")}</p>

                  </div>

                )}

              </div>

            </div>

          )}

          {/* Notes & Terms */}

          {(data.notes || data.terms) && (

            <div className="grid gap-6 text-sm md:grid-cols-2">

              {data.notes && (

                <div>

                  <p className="mb-2 text-xs font-bold text-neutral-400 uppercase">Notes</p>

                  <p className="text-neutral-400">{data.notes}</p>

                </div>

              )}

              {data.terms && (

                <div>

                  <p className="mb-2 text-xs font-bold text-neutral-400 uppercase">

                    Terms & Conditions

                  </p>

                  <p className="text-neutral-400">{data.terms}</p>

                </div>

              )}

            </div>

          )}

          {data.details && (

            <div className="mt-8 grid gap-3 text-sm md:grid-cols-2">

              {data.details.map((detail) => (

                <div key={detail.label} className="border-2 border-neutral-400 p-3">

                  <p className="text-xs font-bold text-neutral-400 uppercase">{detail.label}</p>

                  <p className="mt-1">{detail.value}</p>

                </div>

              ))}

            </div>

          )}

          {data.actions && <div className="mt-8">{data.actions}</div>}

        </div>

      </div>

    </div>

  )

}

// ============================================================================

// INVOICE VARIANT 2: Compact Receipt

// ============================================================================

export interface ReceiptData {

  receiptNumber: string

  date: string

  merchant: {

    name: string

    address?: string

    phone?: string

  }

  items: Array<{

    name: string

    quantity?: number

    price: number

  }>

  subtotal: number

  tax?: number

  total: number

  paymentMethod?: string

  cardLast4?: string

}

export interface ReceiptProps {

  data: ReceiptData

  logo?: React.ReactNode

  onDownload?: () => void

}

export function Receipt({ data, logo, onDownload }: ReceiptProps) {

  return (

    <div className="mx-auto min-w-lg">

      <div className="border-3 border-neutral-400 bg-black shadow-[6px_6px_0px_oklch(54.6%_0.245_262.881)]">

        <div className="space-y-6 p-6">

          {/* Header */}

          <div className="space-y-2 text-center">

            {logo && <div className="mb-4 flex justify-center">{logo}</div>}

            <h2 className="text-xl font-black uppercase">{data.merchant.name}</h2>

            {data.merchant.address && (

              <p className="text-sm text-neutral-400">{data.merchant.address}</p>

            )}

            {data.merchant.phone && (

              <p className="text-sm text-neutral-400">{data.merchant.phone}</p>

            )}

          </div>

          <Separator className="h-0.5 border-dashed bg-neutral-900" />

          {/* Receipt Info */}

          <div className="space-y-1 text-center text-sm">

            <p className="font-bold uppercase">Receipt #{data.receiptNumber}</p>

            <p className="text-neutral-400">{data.date}</p>

          </div>

          <Separator className="h-0.5 border-dashed bg-neutral-900" />

          {/* Items */}

          <div className="space-y-2">

            {data.items.map((item) => (

              <div key={item.name} className="flex justify-between text-sm">

                <span>

                  {item.quantity && item.quantity > 1 && `${item.quantity}x `}

                  {item.name}

                </span>

                <span className="font-mono">${item.price.toFixed(2)}</span>

              </div>

            ))}

          </div>

          <Separator className="h-0.5 border-dashed bg-neutral-900" />

          {/* Totals */}

          <div className="space-y-2">

            <div className="flex justify-between text-sm">

              <span className="text-neutral-400">Subtotal</span>

              <span className="font-mono">${data.subtotal.toFixed(2)}</span>

            </div>

            {data.tax !== undefined && (

              <div className="flex justify-between text-sm">

                <span className="text-neutral-400">Tax</span>

                <span className="font-mono">${data.tax.toFixed(2)}</span>

              </div>

            )}

            <div className="flex justify-between font-bold">

              <span className="uppercase">Total</span>

              <span className="font-mono text-lg">${data.total.toFixed(2)}</span>

            </div>

          </div>

          <Separator className="h-0.5 border-dashed bg-neutral-900" />

          {/* Payment Method */}

          {data.paymentMethod && (

            <div className="space-y-1 text-center text-sm">

              <p className="text-neutral-400">Paid with {data.paymentMethod}</p>

              {data.cardLast4 && <p className="font-mono">•••• {data.cardLast4}</p>}

            </div>

          )}

          {/* Thank You */}

          <div className="text-center">

            <p className="text-sm font-bold uppercase">Thank You!</p>

          </div>

          {/* Download */}

          {onDownload && (

            <Button variant="outline" className="w-full print:hidden" onClick={onDownload}>

              <Download className="mr-2 h-4 w-4" />

              Download Receipt

            </Button>

          )}

        </div>

      </div>

    </div>

  )

}

// ============================================================================

// INVOICE VARIANT 3: Invoice Summary Card

// ============================================================================

export interface InvoiceSummaryProps {

  invoiceNumber: string

  clientName: string

  issueDate: string

  dueDate: string

  amount: number

  amountLabel?: string

  status: "paid" | "pending" | "overdue" | string

  href?: string

  onView?: () => void

  onDownload?: () => void

}

export function InvoiceSummary({

  invoiceNumber,

  clientName,

  issueDate,

  dueDate,

  amount,

  amountLabel,

  status,

  href,

  onView,

  onDownload,

}: InvoiceSummaryProps) {

  const statusConfig = {

    paid: { bg: "bg-blue-600", border: "border-blue-600", text: "text-white" },

    pending: { bg: "bg-blue-600", border: "border-blue-600", text: "text-white" },

    overdue: { bg: "bg-red-600", border: "border-red-600", text: "text-red-600" },

  }

  const statusStyle =

    status in statusConfig

      ? statusConfig[status as keyof typeof statusConfig]

      : statusConfig.pending

  return (

    <div className="border-3 border-neutral-400 bg-black p-4 shadow-[4px_4px_0px_oklch(54.6%_0.245_262.881)] transition-all hover:-translate-x-0.5 hover:-translate-y-0.5 hover:shadow-[6px_6px_0px_oklch(54.6%_0.245_262.881)]">

      <div className="mb-4 flex items-start justify-between">

        <div>

          <p className="text-lg font-black">{invoiceNumber}</p>

          <p className="text-sm text-neutral-400">{clientName}</p>

        </div>

        <div

          className={`border-2 px-2 py-1 text-xs font-bold uppercase ${statusStyle.bg} ${statusStyle.border} ${statusStyle.text}`}

        >

          {status}

        </div>

      </div>

      <div className="mb-4 grid grid-cols-2 gap-4 text-sm">

        <div>

          <p className="text-xs font-bold text-neutral-400 uppercase">Issued</p>

          <p className="font-medium">{issueDate}</p>

        </div>

        <div>

          <p className="text-xs font-bold text-neutral-400 uppercase">Due</p>

          <p className="font-medium">{dueDate}</p>

        </div>

      </div>

      <div className="flex items-center justify-between">

        <p className="font-mono text-2xl font-black">{amountLabel ?? `$${amount.toFixed(2)}`}</p>

        <div className="flex gap-2">

          {onDownload && (

            <Button variant="ghost" size="sm" onClick={onDownload}>

              <Download className="h-4 w-4" />

            </Button>

          )}

          {(onView || href) && (

            <Button size="sm" onClick={onView} asChild={!!href}>

              {href ? <a href={href}>View</a> : "View"}

            </Button>

          )}

        </div>

      </div>

    </div>

  )

}

// ============================================================================

// INVOICE VARIANT 4: Invoice List

// ============================================================================

export interface InvoiceListItem {

  id: string

  invoiceNumber: string

  clientName: string

  date: string

  amount: number

  status: "paid" | "pending" | "overdue"

}

export interface InvoiceListProps {

  invoices: InvoiceListItem[]

  onView?: (id: string) => void

  onDownload?: (id: string) => void

}

export function InvoiceList({ invoices, onView, onDownload }: InvoiceListProps) {

  const statusConfig = {

    paid: "bg-blue-600 text-white",

    pending: "bg-blue-600 text-white",

    overdue: "bg-red-600 text-white",

  }

  return (

    <div className="border-3 border-neutral-400 bg-black">

      {/* Header */}

      <div className="grid grid-cols-12 gap-2 border-b-3 border-neutral-400 bg-black p-4 text-xs font-bold uppercase">

        <div className="col-span-2">Invoice</div>

        <div className="col-span-3">Client</div>

        <div className="col-span-2">Date</div>

        <div className="col-span-2 text-right">Amount</div>

        <div className="col-span-2 text-right">Status</div>

        <div className="col-span-1" />

      </div>

      {/* Rows */}

      {invoices.map((invoice) => (

        <div

          key={invoice.id}

          className="grid grid-cols-12 items-center gap-2 border-b border-neutral-400 p-4 transition-colors hover:bg-black"

        >

          <div className="col-span-2 truncate font-bold">{invoice.invoiceNumber}</div>

          <div className="col-span-3 truncate text-neutral-400">{invoice.clientName}</div>

          <div className="col-span-2 text-sm text-neutral-400">{invoice.date}</div>

          <div className="col-span-2 text-right font-mono font-bold">

            ${invoice.amount.toFixed(2)}

          </div>

          <div className="col-span-2 flex justify-end">

            <span

              className={`px-2 py-0.5 text-xs font-bold whitespace-nowrap uppercase ${statusConfig[invoice.status]}`}

            >

              {invoice.status}

            </span>

          </div>

          <div className="col-span-1 flex items-center justify-end gap-1">

            {onDownload && (

              <Button

                variant="ghost"

                size="sm"

                className="h-7 w-7 p-0"

                onClick={() => onDownload(invoice.id)}

              >

                <Download className="h-3 w-3" />

              </Button>

            )}

            {onView && (

              <Button

                variant="ghost"

                size="sm"

                className="h-7 w-7 p-0"

                onClick={() => onView(invoice.id)}

              >

                →

              </Button>

            )}

          </div>

        </div>

      ))}

    </div>

  )

}

// ============================================================================

// Helper Components

// ============================================================================

function AddressBlock({ address }: { address: InvoiceAddress }) {

  return (

    <div className="space-y-1 text-sm">

      <p className="font-bold">{address.name}</p>

      {address.company && <p>{address.company}</p>}

      <p className="text-neutral-400">{address.address}</p>

      <p className="text-neutral-400">

        {address.city}

        {address.state && `, ${address.state}`} {address.zip}

      </p>

      {address.country && <p className="text-neutral-400">{address.country}</p>}

      {address.email && <p className="text-neutral-400">{address.email}</p>}

      {address.phone && <p className="text-neutral-400">{address.phone}</p>}

    </div>

  )

}

// ============================================================================

// Export all variants

// ============================================================================

export const InvoiceBlocks = {

  Full: Invoice,

  Receipt: Receipt,

  Summary: InvoiceSummary,

  List: InvoiceList,

}
```
