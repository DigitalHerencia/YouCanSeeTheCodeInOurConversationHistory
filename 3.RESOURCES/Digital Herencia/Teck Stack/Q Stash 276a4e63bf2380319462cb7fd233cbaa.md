# Q Stash

Category: Utilities
Type: Infra
Edited: December 18, 2025 8:14 PM
Docs Link: • Upstash QStash
• Vercel Background Functions
Cover: https://images.unsplash.com/photo-1607799279861-4dd421887fb3?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Vercel

## Mental Models

- **Don’t block the request.** Long tasks run async.
- **At-least-once delivery** → jobs may retry, must be idempotent.
- **Queue, don’t sleep** → never `setTimeout` in API routes.
- **Use external runners** → Vercel functions aren’t long-lived.

---

## Canonical Workflow

### 1. Queue Setup (Upstash QStash)

```tsx
// lib/qstash.ts
import { Client } from "@upstash/qstash"

export const qstash = new Client({ token: process.env.QSTASH_TOKEN! })

```

---

### 2. Publish Job

```tsx
await qstash.publishJSON({
  url: `${process.env.BASE_URL}/api/process-job`,
  body: { userId },
})

```

---

### 3. Worker API

```tsx
// app/api/process-job/route.ts
import { NextResponse } from "next/server"

export async function POST(req: Request) {
  const { userId } = await req.json()
  // process background task
  return NextResponse.json({ ok: true })
}

```

---

## Best Practices

- Offload heavy DB ops, emails, webhooks.
- Always idempotent: safe to retry.
- Logs/alerts on failure.

---

## Docs & References

- Upstash QStash
- Vercel Background Functions

---