---
title: 'The Maximal Template™ Domain Library\features\invoicing\invoiceEditorFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\invoicing\invoiceEditorFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.invoicing.invoiceeditorfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\invoicing\invoiceEditorFeature.tsx'
source_file: 'invoiceEditorFeature.tsx'
source_sha256: 'c5c54bce56cea3e6e3ae3abbd3f0c66960342e8a2eb89baecd356a4d37d6594b'
generated: true
---

# `invoiceEditorFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\invoicing\invoiceEditorFeature.tsx`
> SHA-256: `c5c54bce56cea3e6e3ae3abbd3f0c66960342e8a2eb89baecd356a4d37d6594b`

```tsx
"use client";
import { useState } from "react";
import { useForm } from "react-hook-form";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { createInvoice } from "@/lib/actions/invoicingActions";
type InvoiceForm = {
  customerName: string;
  customerEmail: string;
  description: string;
  quantity: string;
  unitPrice: string;
  taxRate: string;
};
export function InvoiceEditorFeature() {
  const {
    register,
    handleSubmit,
    reset,
    formState: { isSubmitting },
  } = useForm<InvoiceForm>({ defaultValues: { quantity: "1", taxRate: "0" } });
  const [error, setError] = useState<string | null>(null);
  const submit = handleSubmit(async (values) => {
    setError(null);
    try {
      await createInvoice({
        customerName: values.customerName,
        customerEmail: values.customerEmail || null,
        currency: "USD",
        lines: [
          {
            description: values.description,
            quantity: values.quantity,
            unitPrice: values.unitPrice,
            taxRate: values.taxRate,
          },
        ],
      });
      reset({
        quantity: "1",
        taxRate: "0",
        customerName: "",
        customerEmail: "",
        description: "",
        unitPrice: "",
      });
    } catch (cause) {
      setError(
        cause instanceof Error
          ? cause.message
          : "Unable to create the invoice.",
      );
    }
  });
  return (
    <form
      onSubmit={(event) => void submit(event)}
      className="max-w-3xl space-y-5 border-3 border-foreground bg-card p-6"
    >
      <div className="grid gap-4 sm:grid-cols-2">
        <div className="space-y-2">
          <Label htmlFor="invoice-customer">Customer</Label>
          <Input
            id="invoice-customer"
            {...register("customerName", { required: true })}
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="invoice-email">Email</Label>
          <Input
            id="invoice-email"
            type="email"
            {...register("customerEmail")}
          />
        </div>
      </div>
      <fieldset className="grid gap-4 border-2 border-foreground p-4 sm:grid-cols-4">
        <legend className="px-2 text-xs font-black uppercase">Line item</legend>
        <div className="space-y-2 sm:col-span-2">
          <Label htmlFor="invoice-description">Description</Label>
          <Input
            id="invoice-description"
            {...register("description", { required: true })}
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="invoice-quantity">Quantity</Label>
          <Input
            id="invoice-quantity"
            inputMode="decimal"
            {...register("quantity", { required: true })}
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="invoice-price">Unit price</Label>
          <Input
            id="invoice-price"
            inputMode="decimal"
            {...register("unitPrice", { required: true })}
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="invoice-tax">Tax rate</Label>
          <Input
            id="invoice-tax"
            inputMode="decimal"
            {...register("taxRate", { required: true })}
          />
        </div>
      </fieldset>
      {error ? (
        <p role="alert" className="text-sm font-bold text-destructive">
          {error}
        </p>
      ) : null}
      <Button type="submit" disabled={isSubmitting}>
        {isSubmitting ? "Creating…" : "Create invoice"}
      </Button>
    </form>
  );
}

```