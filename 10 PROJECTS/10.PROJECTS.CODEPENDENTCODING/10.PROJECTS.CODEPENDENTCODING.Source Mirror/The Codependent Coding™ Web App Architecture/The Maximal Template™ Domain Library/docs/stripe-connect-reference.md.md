---
title: 'The Hipster Stack™ Technology Stack\template\docs\stripe-connect-reference.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\docs\stripe-connect-reference.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.docs.stripe-connect-reference.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\docs\stripe-connect-reference.md'
source_file: 'stripe-connect-reference.md'
source_sha256: 'f4c718913e7c9f13587a36e17ed5bd216bfe4b445a8e67a50e4460aa0e7b5e1f'
generated: true
---

# `stripe-connect-reference.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\docs\stripe-connect-reference.md`
> SHA-256: `f4c718913e7c9f13587a36e17ed5bd216bfe4b445a8e67a50e4460aa0e7b5e1f`

```markdown
# Optional Stripe Connect reference

This module is a removable architecture reference, not enabled product policy or proof of a live Connect configuration. Subscription billing does not import it and remains independently buildable.

## Charge and liability model

The reference uses a platform-created destination charge through Stripe-hosted Checkout. The PaymentIntent uses manual capture, `on_behalf_of`, a single `transfer_data.destination`, and a server-configured `application_fee_amount`. Amount is a positive integer in minor units; currency, fee basis points, connected account, and return URLs are resolved on the server.

For destination charges, the platform balance bears Stripe fees, refunds, disputes, and chargebacks. A full refund sets both `reverse_transfer` and `refund_application_fee` so the destination transfer and platform fee unwind with the customer refund. This financial and legal posture requires an owner decision before live enablement.

## Runtime boundaries

- `connect.manage` is owner-only.
- Stripe-hosted onboarding owns identity and compliance collection.
- Local readiness is a normalized mirror of current Stripe account state and is never accepted from the browser.
- Capture, cancellation, refund, and recovery retrieve current Stripe state and verify the connected-account scope before mutation.
- Provider mutations use stable local idempotency keys.
- The Connect webhook has its own signature secret and ledger namespace at `/api/stripe/connect/webhooks`.
- Only bounded identifiers, integer amounts, currency, statuses, readiness fields, and sanitized recovery metadata are persisted.

## Removal and live gates

Run `pnpm test:connect-removal` to copy the repository to an isolated temporary directory, remove all optional Connect runtime files and their tests, and run the core Next.js production build. Historical migrations and inert schema types remain so existing databases are not destructively rewritten.

Live enablement still requires approved platform liability, Stripe Connect account/capability configuration, country and cross-border review, hosted onboarding and Checkout branding, webhook registration and secret provisioning, production migration approval, deployment, and credentialed lifecycle verification.

Official references:

- https://docs.stripe.com/connect/charges
- https://docs.stripe.com/connect/destination-charges
- https://docs.stripe.com/connect/onboarding
- https://docs.stripe.com/payments/place-a-hold-on-a-payment-method
- https://docs.stripe.com/connect/webhooks

```