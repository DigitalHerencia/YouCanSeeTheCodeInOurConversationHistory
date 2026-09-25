# Next.js

Category: Framework
Type: Core
Edited: December 18, 2025 8:10 PM
Docs Link: • Next.js App Router Docs
• React Server Components
Cover: https://images.unsplash.com/photo-1687603921109-46401b201195?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: App Router, Next.js, React Server Components

## Modern RSC Project

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