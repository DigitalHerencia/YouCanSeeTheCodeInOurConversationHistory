## Summary

The Vouch codebase is using a **Stripe Connect + PaymentIntents manual-capture integration**, not Checkout, Payment Links, Billing, or subscriptions.

The integration shape I found is:

- **Payer setup:** Stripe Customer + SetupIntent for saving a payer payment method.
- **Payee payout setup:** Stripe **Connect Accounts v2** with dashboard: "express" and hosted onboarding links.
- **Vouch payment:** Stripe PaymentIntent with capture_method: "manual" so funds can be authorized first, then captured only after both parties confirm.
- **Platform fee / Connect routing:** code attempts to use application_fee_amount and transfer_data.destination when a connected account is available.
- **Resolution:** on dual confirmation, capture/release; on expiration or cancellation, cancel uncaptured PaymentIntent or refund captured payment.
- **Webhooks:** signed Stripe webhook route exists and processes PaymentIntent/refund events idempotently through local webhook ledgers.

Stripe MCP account lookup shows the connected Dashboard account is:

- **Stripe account:** acct_1TQHH2GuFcEUvSe9
- **Display name:** Vouch
- **API keys page:** [dashboard.stripe.com/acct_1TQHH2GuFcEUvSe9/apikeys](https://dashboard.stripe.com/acct_1TQHH2GuFcEUvSe9/apikeys)

## Files Involved

Primary Stripe integration files:

- D:\Vouch\lib\stripe\client.ts
- D:\Vouch\lib\stripe\config.ts
- D:\Vouch\lib\stripe\webhook-events.ts
- D:\Vouch\lib\stripe\status-map.ts
- D:\Vouch\lib\integrations\stripe\client.ts
- D:\Vouch\lib\integrations\stripe\connect.ts
- D:\Vouch\lib\integrations\stripe\identity.ts
- D:\Vouch\lib\integrations\stripe\payment-intents.ts
- D:\Vouch\lib\integrations\stripe\webhooks.ts
- D:\Vouch\lib\payments\adapters\stripe-payment-adapter.ts
- D:\Vouch\lib\payments\webhooks\process-stripe-webhook.ts
- D:\Vouch\app\api\webhooks\stripe\route.ts
- D:\Vouch\lib\actions\paymentActions.ts
- D:\Vouch\lib\actions\vouchActions.ts
- D:\Vouch\lib\jobs\expire-vouches.ts
- D:\Vouch\lib\jobs\reconcile-payments.ts
- D:\Vouch\prisma\schema.prisma

Project Stripe docs and decisions:

- D:\Vouch\.agents\stripe\vouch-stripe-architecture.md
- D:\Vouch\.agents\stripe\stripe-connect-integration.md
- D:\Vouch\.agents\docs\stripe-connect-integration.md

## What Still Needs Code Work

The main missing pieces are not Dashboard configuration. They are code completion issues:

1. **Frontend Stripe Elements are missing.**  
    The server returns clientSecret values for SetupIntents and PaymentIntents, but I did not find loadStripe, <Elements>, PaymentElement, confirmSetup, or confirmPayment usage in the app. Users currently cannot complete saved payment method setup or payment authorization through Stripe Elements.
    
2. **PaymentIntent authorization timing needs correction.**  
    createVouch initializes a manual PaymentIntent immediately, before payee acceptance and without a connected account destination. The project architecture doc says preferred sequencing is after payee acceptance because the payee connected account is known then.
    
3. **Connect charge flow must be made internally consistent.**  
    createStripePaymentAuthorization can create a destination-style PaymentIntent with transfer_data.destination, but releaseStripePaymentForCompletedVouch also creates a separate transfer after capture. The code should choose one supported Stripe Connect flow for Vouch. For this product, the likely clean path is:
    
    - create manual-capture PaymentIntent after payee acceptance,
    - include transfer_data.destination and application_fee_amount,
    - capture only after dual confirmation,
    - do not create an extra transfers.create for the same payment.
4. **Accounts v2 status reconciliation is too thin.**  
    refreshStripeConnectReadiness infers readiness from configuration.recipient.status, but should reconcile the actual Accounts v2 fields/capability state required by Stripe for recipient transfers and hosted onboarding.
    
5. **Old Stripe webhook stub file should be removed or implemented.**  
    D:\Vouch\lib\integrations\stripe\webhooks.ts contains scaffold functions that throw SCAFFOLD_NOT_IMPLEMENTED. The real webhook path uses D:\Vouch\lib\stripe\webhook-events.ts, so the stub is misleading.
    
6. **Webhook event coverage is incomplete.**  
    The processor handles PaymentIntent and refund events, and ignores account/identity events. Vouch still needs account/update reconciliation for payout readiness and probably capture/charge/transfer outcomes relevant to the chosen Connect flow.
    
7. **Setup return handling is not a complete Stripe-hosted flow.**  
    startPaymentMethodSetup creates a SetupIntent and returns a local URL with a client secret, but without a client Elements confirmation flow there is no reliable setup_intent return reference to reconcile.
    
8. **Admin reconciliation is mostly audit-only.**  
    reconcilePaymentStatus and reconcileRefundStatus record requests but do not actually retrieve and update Stripe state there. The job file has real retrieval logic; admin retry should call that path.
    
9. **Contract validation for payment provider sandbox remains unproven.**  
    I did not run live sandbox flows. The acceptance gates require sandbox initialization, authorization, release, and refund/non-capture testing.
    

## Stripe Dashboard Setup Guide

Use the Stripe Dashboard account acct_1TQHH2GuFcEUvSe9 for these tasks.

### 1. Confirm Account And Mode

1. Open the Vouch Stripe Dashboard.
2. Make sure you know whether you are configuring **sandbox/test mode** or **live mode**.
3. Complete sandbox setup first.
4. Repeat the same required settings in live mode before launch.

Stripe keeps sandbox and live objects/settings separate, including webhook endpoints and API keys.

### 2. API Keys

1. Go to [API keys](https://dashboard.stripe.com/acct_1TQHH2GuFcEUvSe9/apikeys).
2. Copy the publishable key into:
    - NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
3. Use a server-side secret key or restricted key for:
    - STRIPE_SECRET_KEY
4. Do not expose STRIPE_SECRET_KEY to the browser.
5. For production, prefer a restricted API key after testing required permissions.
6. Rotate keys before going live if any keys were copied into local files, logs, screenshots, or shared channels.

Expected permissions if using a restricted key:

- Customers: write/read
- SetupIntents: write/read
- PaymentIntents: write/read
- Refunds: write/read
- Transfers: write/read only if the final code keeps separate transfers
- Connect Accounts v2 / Account Links: write/read
- Webhook event reads are not required for signature verification, but useful for operations

### 3. Connect Platform Settings

1. Go to Connect settings in the Dashboard.
2. Complete the platform profile/registration.
3. Configure platform branding for hosted onboarding and Express Dashboard:
    - business name: Vouch
    - support email
    - support URL
    - brand color/icon/logo
4. Enable hosted onboarding for connected accounts.
5. Confirm the connected account model matches code:
    - Accounts v2
    - dashboard: express
    - platform/application responsible for fees and losses
    - recipient transfer capability requested
6. Review whether this liability model is acceptable for Vouch before production. Express-style accounts with application liability mean Vouch has operational responsibility for negative balances and risk monitoring.

### 4. Connected Account Capabilities

The code creates Accounts v2 recipient accounts with Stripe balance transfer capability. In Dashboard:

1. Confirm Connect is enabled.
2. Confirm connected accounts can receive transfers/payouts in the countries Vouch supports.
3. Configure supported countries. The code defaults to US.
4. Avoid enabling broad international onboarding until the code handles cross-border restrictions.
5. Do not enable payment methods or account capabilities that imply marketplace discovery, disputes, reviews, or unrelated services.

### 5. Payment Methods

1. Go to payment method settings.
2. Enable card payments at minimum.
3. Keep dynamic payment methods enabled only for payment methods compatible with:
    - manual capture,
    - Connect,
    - Vouch’s refund/void/non-capture rules.
4. Avoid enabling delayed or asynchronous payment methods until the code explicitly handles delayed final status.
5. Test 3DS/SCA-required cards before going live.

### 6. Webhook Endpoint

For local development:

`stripe listen --forward-to localhost:3000/api/webhooks/stripe`

Use the CLI-provided whsec_... value as STRIPE_WEBHOOK_SECRET locally.

For production:

1. Go to Workbench/Webhooks in Stripe Dashboard.
2. Create a webhook endpoint:
    - URL: https://YOUR_PRODUCTION_DOMAIN/api/webhooks/stripe
3. Select events needed by the code and near-term implementation:
    - payment_intent.created
    - payment_intent.requires_action
    - payment_intent.amount_capturable_updated
    - payment_intent.succeeded
    - payment_intent.canceled
    - payment_intent.payment_failed
    - refund.created
    - refund.updated
    - refund.failed
    - charge.refunded
    - account/connected account update events needed once payout reconciliation is implemented
4. Reveal the endpoint signing secret.
5. Set it as STRIPE_WEBHOOK_SECRET in the production environment.
6. Do not reuse a CLI webhook secret for Dashboard webhooks; they are different secrets.

### 7. Environment Variables

Set these in local .env.local and production hosting secrets:

`NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_... STRIPE_SECRET_KEY=sk_... or rk_... STRIPE_WEBHOOK_SECRET=whsec_... NEXT_PUBLIC_APP_URL=https://your-production-domain`

The repo also lists STRIPE_SIGNING_SECRET; the code accepts it as a fallback, but standardize on STRIPE_WEBHOOK_SECRET.

### 8. Production Go-Live Checklist

Before production:

1. Upgrade or confirm Stripe API/library version.
2. Confirm live API keys are configured, not sandbox keys.
3. Register the live webhook endpoint.
4. Confirm webhook signature verification passes in production.
5. Confirm the production app does not log secrets, raw provider payloads, card data, or identity documents.
6. Run duplicate webhook tests.
7. Run incomplete confirmation expiration tests.
8. Run authorization cancel tests for uncaptured PaymentIntents.
9. Run capture/release tests after both confirmations.

10. Run refund tests for any captured payment state.
11. Confirm connected account onboarding works from a real user account.
12. Confirm payout readiness changes when Stripe requirements are incomplete.
13. Review Dashboard team access and require strong 2FA.
14. Confirm Vouch copy does not call the product escrow, marketplace, arbitration, dispute resolution, or a broker.

## Validation

- pnpm lint — not run
- pnpm typecheck — not run
- pnpm test — not run
- pnpm prisma:validate — not run
- pnpm validate:contracts — not run
- Stripe MCP account lookup — run, returned account acct_1TQHH2GuFcEUvSe9
- Stripe docs lookup — run through Stripe MCP and official Stripe docs search

## Contract Gates Checked

- payment_flow_review — partially checked; selected flow is documented, but implementation has flow consistency gaps.
- webhook_idempotency — code has signature verification and ledger idempotency, but event coverage is incomplete.
- payment_provider_sandbox — not validated; requires real sandbox flows.
- no_platform_custody — architecture intends provider-backed flow, but the current pre-acceptance platform-only authorization needs review against the contract.
- deterministic_resolution — code paths exist for release/refund/void, but frontend authorization and sandbox validation are incomplete.

## Sources

Official Stripe docs used:

- [Configure connected accounts with Accounts v2](https://docs.stripe.com/connect/accounts-v2/connected-account-configuration)
- [Connect account management in Dashboard](https://docs.stripe.com/connect/dashboard)
- [PaymentIntents manual capture and refunds](https://docs.stripe.com/refunds)
- [Webhook quickstart](https://docs.stripe.com/webhooks/quickstart)
- [Webhook signature verification](https://docs.stripe.com/webhooks/signature)
- [Stripe go-live checklist](https://docs.stripe.com/get-started/checklist/go-live)
- [Stripe account checklist](https://docs.stripe.com/get-started/account/checklist)