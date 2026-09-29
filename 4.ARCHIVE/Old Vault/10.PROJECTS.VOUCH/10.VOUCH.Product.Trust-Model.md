---
title: Untitled
source:
created: 05/05/2026
parent:
description:
tags: []
type:
---
# How the Machine Becomes Trustworthy

User intent creates a proposed state. Stripe confirms money state. Clerk confirms identity/session. Vouch confirms workflow state. Database transactions commit state transitions. Webhooks reconcile provider truth. UI only displays the result.

## The Core Rule

For Vouch, the deterministic machine should be built around a few hard gates.

1. ***Readiness*** A user cannot create or accept a Vouch unless the setup fetcher says they are ready. That readiness is not vibes. It comes from local DB records synchronized with Clerk, Stripe customer/payment readiness, Stripe connected account payout readiness, terms acceptance, and verification state if required.

2. ***Vouch Creation*** Creating a Vouch should produce a draft or pending payment state with a fixed pricing snapshot. Amount, Vouch fee, Stripe/provider fee offset, total paid, application fee, currency, participants, confirmation window, and expiration rules all get frozen. No recalculating later from whatever the current pricing logic happens to be.

3. ***Payment Authorization*** The customer/client pays through Stripe. Vouch does not treat payment as authorized until Stripe says the PaymentIntent is in the correct provider state. Local state follows Stripe state, not browser state. If the browser crashes, redirects weirdly, or the client lies, it does not matter.

4. ***Invite and Acceptance*** The invite token is just a controlled access path. Accepting it binds the recipient only if the token is valid, not expired, not already accepted, not self-acceptance, and the user passes setup gates. That action happens server-side and writes an audit event.

5. ***Confirmation*** Each party can only confirm for themselves, inside the confirmation window, once. A single confirmation never releases money. Late confirmation never releases money. Admin never rewrites confirmation truth. Both valid confirmations inside the window are the only path to release.

6. ***Resolution*** The resolution job or action looks at system state, not stories. If both confirmations exist inside the window, capture/release. If conditions fail, refund, void, or non-capture depending on the current Stripe PaymentIntent state. The exact provider operation depends on whether funds are authorized, captured, capturable, canceled, succeeded, or failed.

7. ***Webhooks*** Stripe webhooks are the correction layer. They make provider truth durable when async events arrive. Every webhook must be idempotent, recorded, deduped, and mapped to internal state carefully. A duplicate webhook should do nothing harmful. A late webhook should reconcile, not invent a new outcome.

8. ***Audit*** Every important transition writes an audit event: created, paid/authorized, invite sent, invite opened, accepted, confirmed by merchant, confirmed by customer, released, refunded, expired, failed, retried. That gives the system a replayable story without needing subjective disputes.
## Outcomes Follow State

That is how the machine becomes trustworthy: every path either satisfies the rule or it does not. No judgment layer. No override layer. No “close enough." 

- State transitions must be narrow, named, validated, transactional, idempotent, and provider-aware.
- The UI can request transitions. It cannot create truth.
- Stripe can confirm payment facts. It cannot decide Vouch business meaning by itself.
- Users can confirm presence. They cannot force settlement alone.
- Admins can inspect and retry technical failures. They cannot arbitrate outcomes.

## Technical Explanation

Vouch operates as a software platform on Stripe Connect using destination charges with platform-level application fees, where Stripe serves as the regulated payments infrastructure, ledger authority for payment movement, and capability authority for payout eligibility, while Vouch remains strictly a workflow and settlement-coordination layer.

Operationally, each Vouch begins with creation of a PaymentIntent on the platform account for the gross transaction amount. That gross amount represents the principal commitment amount plus the platform fee and any fee-loading strategy used to offset network and processor costs. The PaymentIntent is created with explicit metadata binding it to the internal Vouch object, payer identity, intended beneficiary connected account, confirmation window, settlement rule set, and immutable pricing snapshot.

At confirmation, Vouch uses Stripe’s confirmation flow to move the PaymentIntent into an authorized state, where funds are reserved against the payer’s issuing bank but remain uncaptured. Economically, this creates committed purchasing power without immediate settlement, allowing Vouch to establish meaningful financial consequence while preserving reversibility. In card acquiring terms, Vouch is deliberately operating in an authorization-first, deferred-capture model rather than immediate capture with post hoc refund logic.

Once authorization succeeds, Stripe becomes the source of truth for reserve state, authorization validity, capturable amount, failure conditions, and downstream settlement eligibility. Vouch mirrors that truth locally through webhook-driven reconciliation, persisting an internal state transition only after provider-confirmed events such as PaymentIntent succeeded, amount capturable updated, canceled, payment failed, or charge refunded. All webhook processing is idempotent, event-sequenced, and mapped to deterministic internal transitions so provider truth and application truth converge continuously.

The beneficiary side of the transaction is represented by a fully onboarded Connect account with active transfer and payout capabilities. KYC, sanctions screening, beneficial ownership collection, tax reporting readiness, payout rails configuration, and capability activation remain delegated to Stripe Connect onboarding and ongoing capability lifecycle management. Vouch does not intermediate compliance obligations; it gates workflow eligibility based on Stripe capability state.

The core commercial primitive is deferred settlement conditioned on bilateral attestation. Vouch defines a bounded confirmation window around the scheduled appointment, for example one hour pre-event and one hour post-event, within which each authenticated participant independently submits an irrevocable presence confirmation. These confirmations are authenticated at the identity layer and recorded as independent protocol attestations. Neither attestation alone is settlement-authorizing. Only bilateral confirmation within the valid window satisfies settlement conditions.

When bilateral confirmation is achieved, Vouch executes capture on the authorized PaymentIntent. Stripe then performs final clearing and settlement, deducts processing fees, allocates the platform’s application fee, and routes net proceeds through Connect to the beneficiary account according to the destination charge configuration. At that point, settlement reaches economic finality subject only to standard network-level exceptions.

If bilateral confirmation conditions are not met before authorization expiry or before the protocol’s settlement deadline, Vouch deterministically voids or cancels the uncaptured authorization. This releases reserved funds back to the payer without requiring a refund flow because no final settlement occurred. If capture had already occurred under some exceptional technical sequence, reversal is handled via explicit refund orchestration, but the preferred design is authorization cancellation rather than settled-funds refund whenever feasible, because operational complexity, fee leakage, and reconciliation burden are materially lower.

From a controls perspective, Vouch is intentionally removing discretionary settlement surfaces. There is no internal arbitration desk, no evidence adjudication pipeline, no manual fund award path, and no unilateral participant-triggered settlement authority. Settlement eligibility is computed strictly from authenticated participant actions, provider-confirmed reserve state, bounded temporal rules, and immutable transaction metadata.

In payments architecture terms, Vouch is effectively implementing a deterministic conditional settlement protocol on top of Stripe’s authorization, capture, refund, transfer, and connected-account capability primitives, while outsourcing regulated money movement, custody, compliance, and payout execution to Stripe’s existing financial rails.

