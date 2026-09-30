# UpStash/Redis

Programming Languages: TypeScript
Category: State / Cache
Type: Core
Edited: December 18, 2025 7:59 PM
Docs Link: • Next.js unstable_cache
• Upstash Redis Docs
• Clerk Server-Side Auth
Cover: https://www.notion.so/image/https%3A%2F%2Fas2.ftcdn.net%2Fjpg%2F02%2F19%2F99%2F65%2F1000_F_219996555_phCgM63YppVJyw5qFC4OjcjLnFXWAZ0q.jpg
Tags: Cache, React Server Components, Server Actions, State

## Mental Models

- **Server-first state**: primary source of truth is server-side DB or edge cache. Client-side state only exists for interactivity (forms, drag/drop, charts).
- **Two-level caching**:
    1. **Local server cache** (`unstable_cache`) → short-lived, single-instance per request caching.
    2. **Global edge cache** (`Upstash Redis`) → shared across serverless instances, persistent.
- **Session-driven auth state**: Clerk sessions are always server-side; client only reads to show UI.
- **Deterministic caching**: cache key must include all variables affecting query results (e.g., userId + filters).
- **Rate-limiting as state**: store counters in Redis to throttle requests per user or IP.

---

## Canonical Workflow

### 1. Server-Side Caching with `unstable_cache`

```tsx
// lib/cache.ts
import { unstable_cache } from "next/cache"
import { db } from "./db"

export const getCachedProjects = unstable_cache(async (userId: string) => {
  return db.project.findMany({ where: { ownerId: userId }, orderBy: { name: "asc" } })
}, {
  revalidate: 60, // seconds
})

```

- **Key principle**: cache by input parameters (`userId`).
- **Revalidation** ensures deterministic stale-while-revalidate behavior.
- Works only in **Server Components or Server Actions**.

---

### 2. Global Edge Cache with Upstash Redis

```tsx
// lib/redis.ts
import { Redis } from "@upstash/redis"

export const redis = new Redis({
  url: process.env.UPSTASH_REDIS_REST_URL!,
  token: process.env.UPSTASH_REDIS_REST_TOKEN!,
})

// Example: rate-limiting per user
export async function incrementRequestCount(userId: string) {
  const count = await redis.incr(`req:${userId}`)
  await redis.expire(`req:${userId}`, 60) // reset every 60s
  return count
}

```

- Use Redis for **global shared state** across serverless instances.
- Can implement **ABAC counters**, session sync, or feature flags.

---

### 3. Clerk Session Management

```tsx
// lib/auth.ts
import { auth } from "@clerk/nextjs/server"

export function getSessionUser() {
  const { userId, sessionClaims } = auth()
  if (!userId) throw new Error("Unauthorized")
  return { userId, role: sessionClaims?.role || "user" }
}

```

- All server-side state and caching must reference `userId`.
- Never rely on client cookies for security-critical decisions.

---

### 4. Server Action + Cache Example

```tsx
// app/(dashboard)/projects/actions.ts
"use server"
import { getCachedProjects } from "@/lib/cache"
import { getSessionUser } from "@/lib/auth"

export async function listProjects() {
  const { userId } = getSessionUser()
  return getCachedProjects(userId)
}

```

- Combines **auth + deterministic caching**.
- Ensures that each user only ever sees their own data.

---

## Best Practices

- **Always include userId in cache keys** for per-user caching.
- **Combine unstable_cache + Redis** for short-term vs long-term performance.
- **Avoid caching sensitive data client-side**.
- **Revalidate often** if data is frequently updated.
- **Rate-limit using Redis** to protect serverless endpoints.
- **Server Actions are canonical place** to mutate cached state.

---

## Docs & References

- [Next.js unstable_cache](https://nextjs.org/docs/app/building-your-application/data-fetching/caching)
- [Upstash Redis Docs](https://upstash.com/docs)
- [Clerk Server-Side Auth](https://clerk.com/docs/nextjs/server-components)

---