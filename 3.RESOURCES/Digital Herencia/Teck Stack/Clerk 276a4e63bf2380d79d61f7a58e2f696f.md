# Clerk

Category: Auth
Type: Integration
Edited: December 18, 2025 7:56 PM
Docs Link: • Clerk Next.js Server Components
• Clerk Middleware
• RBAC & ABAC patterns
• Next.js Server Actions
Cover: https://www.notion.so/image/https%3A%2F%2Fkivuto.com%2Fwp-content%2Fuploads%2F2021%2F06%2FUser_Authentication_Best_Practices_Image.jpg
Tags: ABAC, Clerk, Middleware, RBAC

## Mental Models

- **Auth is canonical source of truth**: never trust URL params, form inputs, or client state. Use Clerk session `userId` everywhere.
- **Middleware first**: block unauthenticated requests at the edge before they hit layouts or actions.
- **Layout-level protection**: layouts handle coarse-grained auth (all children require login).
- **Server Actions enforce fine-grained ABAC/RBAC**: permissions, resource ownership, roles.
- **Layered enforcement**:
    1. **Edge middleware** → public vs protected routes
    2. **Server Actions** → resource-level access checks
    3. **Optional client checks** → UI visibility only (never security-critical)

---

## Canonical Workflow

### 1. Middleware Protection

```tsx
// middleware.ts
import { authMiddleware } from "@clerk/nextjs"

export default authMiddleware({
  publicRoutes: ["/", "/sign-in", "/sign-up", "/api/webhook(.*)"],
})

export const config = {
  matcher: ["/((?!_next|.*\\..*).*)"], // all routes except static/next internals
}

```

- Edge-level authentication gate.
- Prevents unauthorized traffic before server code executes.

---

### 2. Layout Auth Enforcement

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

- Only authenticated users reach nested pages.
- Coarse-grained: prevents unauthorized access to the dashboard subtree.

---

### 3. Server Actions + ABAC/RBAC

```tsx
// app/(dashboard)/projects/actions.ts
"use server"

import { db } from "@/lib/db"
import { auth } from "@clerk/nextjs/server"

// RBAC: role-based permission
const canCreateProject = (role: string) => role === "admin" || role === "user"

export async function createProject(data: { name: string }) {
  const { userId, sessionClaims } = auth()
  if (!userId) throw new Error("Unauthorized")

  // RBAC check
  const role = sessionClaims?.role || "user"
  if (!canCreateProject(role)) throw new Error("Forbidden")

  // ABAC: enforce resource ownership
  return db.project.create({
    data: { name: data.name, ownerId: userId },
  })
}

```

- **RBAC**: checks roles before allowing operations.
- **ABAC**: ensures all DB mutations are scoped to the authenticated user.
- **Server-first enforcement**: even if client UI hides buttons, server denies unauthorized attempts.

---

### 4. Client Integration (Optional)

```tsx
// components/ui/ProtectedButton.tsx
"use client"
import { useAuth } from "@clerk/nextjs"

export function ProtectedButton({ children, onClick }: { children: React.ReactNode; onClick: () => void }) {
  const { isSignedIn } = useAuth()
  if (!isSignedIn) return null
  return <button onClick={onClick}>{children}</button>
}

```

- UI-level check only for visibility/UX.
- Security never relies on client state.

---

## Best Practices

- **Never trust URL params for auth**. Always map to session.userId.
- **Always scope queries to userId**.
- **Middleware + Layout + Server Action** = three layers of protection.
- Use **session claims** from Clerk for RBAC roles.
- **Feature flags** can live in ABAC logic.

---

## Docs & References

- [Clerk Next.js Server Components](https://clerk.com/docs/nextjs/server-components)
- [Clerk Middleware](https://clerk.com/docs/nextjs/middleware)
- [RBAC & ABAC patterns](https://auth0.com/docs/authorization)
- [Next.js Server Actions](https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions)

---