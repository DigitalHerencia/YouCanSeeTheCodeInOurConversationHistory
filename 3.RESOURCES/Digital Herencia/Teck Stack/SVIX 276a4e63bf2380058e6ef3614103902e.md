# SVIX

Category: Security
Type: Core
Edited: December 18, 2025 8:10 PM
Docs Link: • Upstash Ratelimit
• SVIX Webhooks
• Next.js Middleware
• Clerk Middleware Auth
Cover: https://images.unsplash.com/photo-1614064643087-96ce7f0737c8?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Middleware, Rate Limiting, WebHooks

## Mental Models

- **Defense in layers** → middleware at edge blocks early, rate limit stops abuse, webhooks verified cryptographically.
- **Server is authority** → never trust client input, all checks enforced in server actions/middleware.
- **Deterministic policies** → rate limit rules, auth checks, and webhook signatures are consistent and versioned.
- **Fail-closed** → if auth/rate limit/webhook validation fails, default is reject, not allow.
- **Minimal surface** → only expose APIs required, everything else lives inside server actions.

---

## Canonical Workflow

### 1. Rate Limiting (Edge)

```tsx
// middleware.ts
import { Ratelimit } from "@upstash/ratelimit"
import { Redis } from "@upstash/redis"
import { NextResponse } from "next/server"

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(50, "1 m"), // 50 reqs per minute
})

export async function middleware(req: Request) {
  const ip = req.headers.get("x-forwarded-for") ?? "anonymous"
  const { success } = await ratelimit.limit(ip)

  if (!success) {
    return new NextResponse("Rate limit exceeded", { status: 429 })
  }

  return NextResponse.next()
}

```

- Applied globally via `middleware.ts`.
- Use `@upstash/ratelimit` for edge performance.
- Identify users by IP or `userId` if authenticated.

---

### 2. Webhook Verification (SVIX)

```tsx
// app/api/webhook/route.ts
import { Webhook } from "svix"
import { headers } from "next/headers"
import { NextResponse } from "next/server"

export async function POST(req: Request) {
  const payload = await req.text()
  const headersList = headers()

  const svix = new Webhook(process.env.SVIX_SECRET!)
  try {
    svix.verify(payload, {
      "svix-id": headersList.get("svix-id")!,
      "svix-timestamp": headersList.get("svix-timestamp")!,
      "svix-signature": headersList.get("svix-signature")!,
    })
  } catch (err) {
    return new NextResponse("Invalid signature", { status: 400 })
  }

  // Process verified event
  return NextResponse.json({ ok: true })
}

```

- Always verify **before parsing JSON**.
- Use `svix` package, store secret in `process.env`.
- Reject immediately on invalid signature.

---

### 3. Middleware Auth Enforcement

```tsx
// middleware.ts
import { auth } from "@clerk/nextjs/server"
import { NextResponse } from "next/server"

export default function middleware(req: Request) {
  const { userId } = auth()

  if (!userId) {
    return NextResponse.redirect(new URL("/sign-in", req.url))
  }

  return NextResponse.next()
}

```

- Middleware checks **session existence**.
- Use route matchers to apply only to protected routes (`/dashboard/*`).
- Redirect unauthenticated traffic to `/sign-in`.

---

### 4. Server Actions Fine-Grain Auth

```tsx
// app/actions/user.ts
"use server"
import { auth } from "@clerk/nextjs/server"

export async function getUserData() {
  const { userId } = auth()
  if (!userId) throw new Error("Unauthorized")

  // fetch data securely server-side
}

```

- Middleware gates **access**, server actions gate **ownership/roles**.
- Always double-check in server actions to prevent bypass.

---

---

## Best Practices

- Apply **rate limiting in middleware** with Upstash.
- Always **verify webhooks** with SVIX, fail-closed on error.
- **Redirect unauthenticated users** early at the edge.
- Apply **RBAC/ABAC** inside server actions (per-resource checks).
- Never expose unprotected API routes — default to server actions + middleware.

---

## Docs & References

- [Upstash Ratelimit](https://upstash.com/docs/ratelimit)
- [SVIX Webhooks](https://docs.svix.com/)
- [Next.js Middleware](https://nextjs.org/docs/app/building-your-application/routing/middleware)
- [Clerk Middleware Auth](https://clerk.com/docs/nextjs/middleware)

---