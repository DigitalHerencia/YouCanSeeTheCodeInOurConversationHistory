---
title: 'The Maximal Template™ Domain Library\lib\integrations\status.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\status.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.status.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\status.ts'
source_file: 'status.ts'
source_sha256: 'b8b76e650fd0c8a47bdbdc5ed9668ad1ebac15df4e5380b3072c3e7186cd3f35'
generated: true
---

# `status.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\status.ts`
> SHA-256: `b8b76e650fd0c8a47bdbdc5ed9668ad1ebac15df4e5380b3072c3e7186cd3f35`

```ts
import "server-only";

export type ProviderState = "CONFIGURED" | "MISSING SECRET";
export interface ProviderStatus {
  name: string;
  purpose: string;
  state: ProviderState;
  mode: "LIVE" | "SANDBOX" | "NOT PROVISIONED";
}

function configured(...values: Array<string | undefined>): ProviderState {
  return values.every((value) => Boolean(value?.trim()))
    ? "CONFIGURED"
    : "MISSING SECRET";
}

export function getProviderStatuses(): ProviderStatus[] {
  return [
    {
      name: "Stripe",
      purpose: "Subscription checkout, billing portal, and verified webhooks.",
      state: configured(
        process.env.STRIPE_SECRET_KEY,
        process.env.STRIPE_WEBHOOK_SECRET,
      ),
      mode: "SANDBOX",
    },
    {
      name: "Vercel Blob",
      purpose: "Private original files and application-owned object storage.",
      state: configured(process.env.BLOB_READ_WRITE_TOKEN),
      mode: "NOT PROVISIONED",
    },
    {
      name: "Cloudinary",
      purpose: "Image delivery, transformations, and media derivatives.",
      state: configured(
        process.env.CLOUDINARY_CLOUD_NAME,
        process.env.CLOUDINARY_API_KEY,
        process.env.CLOUDINARY_API_SECRET,
      ),
      mode: "NOT PROVISIONED",
    },
    {
      name: "SendGrid",
      purpose: "Transactional email and authenticated delivery events.",
      state: configured(
        process.env.SENDGRID_API_KEY,
        process.env.SENDGRID_FROM_EMAIL,
        process.env.SENDGRID_WEBHOOK_VERIFICATION_KEY,
      ),
      mode: "NOT PROVISIONED",
    },
    {
      name: "Hugging Face",
      purpose: "Text generation and embedding provider mechanics.",
      state: configured(process.env.HUGGINGFACE_ACCESS_TOKEN),
      mode: "NOT PROVISIONED",
    },
  ];
}

```