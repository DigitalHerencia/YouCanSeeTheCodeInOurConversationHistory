# Stripe

Category: Payments / Billing
Type: Integration
Edited: December 18, 2025 8:15 PM
Docs Link: • Stripe Checkout
• Stripe Webhooks
• Next.js API Routes
Cover: https://images.unsplash.com/photo-1594904351111-a072f80b1a71?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: API, Stripe

## Mental Models

- **Never trust client amounts** → calculate price server-side.
- **Webhook-first** → external systems confirm payment, not the UI.
- **Fail-closed** → unverified webhooks = no fulfillment.
- **API wrappers live in /lib** → centralize integration code.

---

## Canonical Workflow

### 1. Stripe Payment Intent

```tsx
// app/actions/checkout.ts
"use server"
import Stripe from "stripe"

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

export async function createCheckoutSession() {
  const session = await stripe.checkout.sessions.create({
    mode: "payment",
    payment_method_types: ["card"],
    line_items: [{ price: "price_123", quantity: 1 }],
    success_url: `${process.env.BASE_URL}/success`,
    cancel_url: `${process.env.BASE_URL}/cancel`,
  })

  return session.url
}

```

---

### 2. Stripe Webhook Verification

```tsx
// app/api/webhook/stripe/route.ts
import Stripe from "stripe"
import { headers } from "next/headers"
import { NextResponse } from "next/server"

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

export async function POST(req: Request) {
  const sig = headers().get("stripe-signature")!
  const body = await req.text()

  let event
  try {
    event = stripe.webhooks.constructEvent(body, sig, process.env.STRIPE_WEBHOOK_SECRET!)
  } catch (err) {
    return new NextResponse("Webhook error", { status: 400 })
  }

  if (event.type === "checkout.session.completed") {
    // fulfill order
  }

  return NextResponse.json({ received: true })
}

```

---

### 3. External API Calls

```tsx
// lib/github.ts
export async function fetchRepos(user: string) {
  const res = await fetch(`https://api.github.com/users/${user}/repos`, {
    headers: { Authorization: `Bearer ${process.env.GITHUB_TOKEN}` },
    cache: "no-store",
  })
  return res.json()
}

```

---

## Best Practices

- Prices & validation on server only.
- Verify all incoming webhooks.
- Rate-limit outbound API calls.
- Centralize API wrappers.

---

## Docs & References

- [Stripe Checkout](https://stripe.com/docs/payments/checkout)
- [Stripe Webhooks](https://stripe.com/docs/webhooks)
- Next.js API Routes

---