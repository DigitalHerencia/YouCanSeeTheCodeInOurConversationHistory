# Next/React

Programming Languages: TypeScript
Category: Framework
Type: Core
Edited: December 18, 2025 7:52 PM
Docs Link: • Next.js App Router Docs
• React Server Components
• Clerk Middleware Docs
• Server Actions
Cover: https://images.unsplash.com/photo-1633356122544-f134324a6cee?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: App Router, Data Fetching, React Hook Form, React Server Components, Server Actions

## Mental Models

- **Server-first rendering**: every component is a Server Component by default. Only mark as `use client` if you need state, effects, or event listeners.
- **Server Actions replace most API routes**: DB queries, mutations, and business logic belong here.
- **Layouts are persistent**: use them for shared nav, sidebar, providers. They survive route transitions.
- **Route Groups `( )`**: organize without affecting URL.
- **Dynamic routes `[param]`**: params come from URL, but authorization is always derived from session.
- **Streaming SSR + ISR**: send partial UI while server is still fetching. Use caching for determinism.
- **Middleware as first guard**: block unauthenticated/unauthorized requests at the edge before they touch your server.

---

## Directory Structure

```bash
app/
  (marketing)/
    page.tsx              # Public landing
  (dashboard)/
    layout.tsx            # Auth-required layout
    page.tsx              # User dashboard
    projects/
      page.tsx
      actions.ts          # Server Actions for project CRUD
      components/         # Feature-specific UI
  api/
    webhook/route.ts      # Edge API routes (e.g. Stripe webhooks)
  actions/
    auth.ts               # Global auth actions
    user.ts               # Global user actions
  components/
    ui/                   # shadcn/ui primitives
    forms/                # Form components
    charts/               # Visualization
  lib/
    auth.ts               # Clerk session helpers
    db.ts                 # Prisma client
    cache.ts              # Redis + unstable_cache
    utils.ts              # Shared helpers
  styles/
    globals.css
  middleware.ts           # Edge middleware for auth/protection

```

---

## Canonical Patterns

### 1. Route Groups

```bash
app/
  (marketing)/page.tsx → /
  (dashboard)/layout.tsx → /dashboard

```

- Keeps marketing and app UIs cleanly separated.
- Route groups don’t change URL paths.

### 2. Dynamic Routes

```tsx
// app/(dashboard)/[userId]/page.tsx
import { auth } from "@clerk/nextjs/server"
import { db } from "@/lib/db"
import { redirect } from "next/navigation"

export default async function UserDashboard({ params }: { params: { userId: string } }) {
  const { userId: sessionUserId } = auth()

  if (!sessionUserId) redirect("/sign-in")
  if (params.userId !== sessionUserId) redirect(`/dashboard/${sessionUserId}`)

  const user = await db.user.findUnique({ where: { id: sessionUserId } })
  if (!user) redirect("/sign-in")

  return <h1>Welcome, {user.name}</h1>
}

```

- Params are decorative, **auth is canonical**.
- Always validate `[userId]` against session.

### 3. Layout Auth Gate

```tsx
// app/(dashboard)/layout.tsx
import { auth } from "@clerk/nextjs/server"
import { redirect } from "next/navigation"

export default async function DashboardLayout({ children }: { children: React.ReactNode }) {
  const { userId } = auth()
  if (!userId) redirect("/sign-in")

  return (
    <section className="dashboard">
      <nav>...</nav>
      <main>{children}</main>
    </section>
  )
}

```

- Forces all nested routes to be protected.
- No need to duplicate session checks in every page.

### 4. Middleware for Edge Blocking

```tsx
// middleware.ts
import { authMiddleware } from "@clerk/nextjs"

export default authMiddleware({
  publicRoutes: ["/", "/sign-in", "/sign-up", "/api/webhook(.*)"],
})

export const config = {
  matcher: ["/((?!_next|.*\\..*).*)"],
}

```

- Stops unauthorized traffic before it reaches your layouts.

---

## Server Actions for Routing Logic

```tsx
// app/(dashboard)/projects/actions.ts
"use server"

import { db } from "@/lib/db"
import { auth } from "@clerk/nextjs/server"

export async function createProject(data: { name: string }) {
  const { userId } = auth()
  if (!userId) throw new Error("Unauthorized")

  return db.project.create({
    data: { name: data.name, ownerId: userId },
  })
}

```

- Always scope by `userId`.
- No “open” DB queries.

---

## Official References

- [Next.js App Router Docs](https://nextjs.org/docs/app)
- [React Server Components](https://react.dev/reference/react-server)
- [Clerk Middleware Docs](https://clerk.com/docs/nextjs/middleware)
- [Server Actions](https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions)

---