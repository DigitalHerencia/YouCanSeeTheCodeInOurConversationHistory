---
title: 'The Maximal Template™ Domain Library\lib\integrations\stripe\subscriptions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\stripe\subscriptions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.stripe.subscriptions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\stripe\subscriptions.ts'
source_file: 'subscriptions.ts'
source_sha256: 'fc83d6c88d61f034d9b47b30f90245d82ac34a9084832a2039198351f556c697'
generated: true
---

# `subscriptions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\stripe\subscriptions.ts`
> SHA-256: `fc83d6c88d61f034d9b47b30f90245d82ac34a9084832a2039198351f556c697`

```ts
import type Stripe from "stripe";

function mapStatus(status: Stripe.Subscription.Status) {
  switch (status) {
    case "trialing":
      return "TRIALING" as const;
    case "active":
      return "ACTIVE" as const;
    case "paused":
      return "PAUSED" as const;
    case "canceled":
    case "incomplete_expired":
      return "CANCELED" as const;
    default:
      return "PAST_DUE" as const;
  }
}

export function toBillingSubscriptionInput(subscription: Stripe.Subscription) {
  const organizationId = subscription.metadata.organizationId;
  if (!organizationId)
    throw new Error("Stripe subscription metadata.organizationId is required.");
  const customerId =
    typeof subscription.customer === "string"
      ? subscription.customer
      : subscription.customer.id;
  const periodEnd = subscription.items.data.reduce(
    (latest, item) => Math.max(latest, item.current_period_end),
    0,
  );
  return {
    organizationId,
    provider: "stripe",
    providerCustomerId: customerId,
    providerSubscriptionId: subscription.id,
    planKey:
      subscription.items.data[0]?.price.lookup_key ??
      subscription.items.data[0]?.price.id ??
      "unmapped",
    status: mapStatus(subscription.status),
    currentPeriodEnd: periodEnd ? new Date(periodEnd * 1000) : null,
    cancelAtPeriodEnd: subscription.cancel_at_period_end,
  };
}

export function getBillingSubscriptionInputFromEvent(event: Stripe.Event) {
  if (!event.type.startsWith("customer.subscription.")) return null;
  return toBillingSubscriptionInput(event.data.object as Stripe.Subscription);
}

```