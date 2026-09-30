# Neon/Prisma

Category: Database
Type: Integration
Edited: December 18, 2025 7:55 PM
Docs Link: • Prisma Docs
• Prisma + Next.js
• Neon Postgres Serverless
• Prisma Migrations
Cover: https://www.notion.so/image/https%3A%2F%2Fwww.simplilearn.com%2Fice9%2Ffree_resources_article_thumb%2FBest_Data_Science_Courses_in_India.jpg
Tags: Neon, PostgreSQL, Prisma

## Mental Models

- **Server-first access**: all DB queries must occur in Server Components or Server Actions. Never query directly from client components.
- **Schema-driven modeling**: the Prisma schema is the single source of truth. Changes here generate both types and DB migrations.
- **Scoped queries**: always filter by authenticated user when needed (enforce ABAC).
- **Migration workflow**: local dev → `prisma migrate dev` → deploy migrations to Neon in staging/production.
- **Connection management**: Neon is serverless; reuse Prisma client instances globally to avoid exhausting connections.
- **Deterministic outcomes**: predictable DB state and types generated via Prisma.

---

## Canonical Workflow

### 1. Prisma Client Setup

```tsx
// lib/db.ts
import { PrismaClient } from "@prisma/client"

declare global {
  // Prevent multiple clients in dev HMR
  var prisma: PrismaClient | undefined
}

export const db = global.prisma || new PrismaClient()
if (process.env.NODE_ENV !== "production") global.prisma = db

```

- Ensures **singleton Prisma client** in dev and prod.
- Avoids connection exhaustion in serverless environments.

---

### 2. Prisma Schema Example

```
// prisma/schema.prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id       String   @id @default(cuid())
  email    String   @unique
  name     String?
  role     String   @default("user")
  projects Project[]
}

model Project {
  id      String @id @default(cuid())
  name    String
  ownerId String
  owner   User   @relation(fields: [ownerId], references: [id])
}

```

- Defines **relations** (owner → projects) for ABAC checks.
- Type-safe, auto-generated types available in TypeScript.

---

### 3. Server Action for CRUD

```tsx
// app/(dashboard)/projects/actions.ts
"use server"
import { db } from "@/lib/db"
import { auth } from "@clerk/nextjs/server"

export async function getUserProjects() {
  const { userId } = auth()
  if (!userId) throw new Error("Unauthorized")

  return db.project.findMany({
    where: { ownerId: userId },
    orderBy: { name: "asc" },
  })
}

export async function createProject(data: { name: string }) {
  const { userId } = auth()
  if (!userId) throw new Error("Unauthorized")

  return db.project.create({
    data: { name: data.name, ownerId: userId },
  })
}

```

- Always scope queries to **session.userId**.
- Type-safe queries thanks to Prisma client.

---

### 4. Migration Workflow

```bash
# Development
npx prisma migrate dev --name init

# Generate client after schema change
npx prisma generate

# Production deployment
npx prisma migrate deploy

```

- Deterministic: schema → migration → client types → server code.
- Never skip `prisma generate`; types drive all Server Actions.

---

### 5. Tips for Serverless Neon

- Reuse Prisma client (singleton pattern).
- Avoid long-lived connections; Neon serverless handles concurrency but each lambda invocation is ephemeral.
- Use **connection pooling** if you have high concurrent traffic.

---

## Best Practices

- **All DB access server-side**; never expose raw queries to the client.
- **Always scope by userId** for ABAC enforcement.
- **Leverage Prisma type safety** to prevent runtime errors.
- Keep **schema, migrations, and generated client** in sync.
- **Use indexes** in Postgres for columns used in filtering (e.g., `ownerId`).

---

## Docs & References

- [Prisma Docs](https://www.prisma.io/docs/)
- [Prisma + Next.js](https://www.prisma.io/docs/guides/nextjs)
- [Neon Postgres Serverless](https://neon.tech/docs)
- [Prisma Migrations](https://www.prisma.io/docs/concepts/components/prisma-migrate)

---