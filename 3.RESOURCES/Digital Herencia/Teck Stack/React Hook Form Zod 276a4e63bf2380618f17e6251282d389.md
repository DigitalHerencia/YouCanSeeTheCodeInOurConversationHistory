# React Hook Form/Zod

Category: Forms & Validation
Type: Library
Edited: December 18, 2025 8:04 PM
Docs Link: • React Hook Form
• Zod
• RHF + Zod Resolver
• Next.js Server Actions
Cover: https://images.unsplash.com/photo-1583339793403-3d9b001b6008?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: React Hook Form, Server Actions, Zod

---

## Mental Models

- **Server-first data handling**: forms mutate server state via **Server Actions**; client only handles input state and validation.
- **Shared schema validation**: define validation rules in **Zod** so both client and server use the same rules.
- **Leaf client components**: forms are always `use client` components, but they call server actions for mutations.
- **Deterministic behavior**: validation + mutation are predictable, preventing runtime type errors or inconsistent data.
- **ABAC/RBAC enforcement**: server-side validation always respects user permissions.

---

## Canonical Workflow

### 1. Define Shared Zod Schema

```tsx
// lib/validation/project.ts
import { z } from "zod"

export const projectSchema = z.object({
  name: z.string().min(3, "Project name too short"),
  description: z.string().optional(),
})
export type ProjectInput = z.infer<typeof projectSchema>

```

- Single source of truth for validation.
- Types automatically generated for TypeScript safety.

---

### 2. Server Action for Form Submission

```tsx
// app/(dashboard)/projects/actions.ts
"use server"
import { db } from "@/lib/db"
import { projectSchema } from "@/lib/validation/project"
import { auth } from "@clerk/nextjs/server"

export async function createProject(data: unknown) {
  const { userId } = auth()
  if (!userId) throw new Error("Unauthorized")

  const parsed = projectSchema.parse(data) // Zod validation server-side

  return db.project.create({
    data: { ...parsed, ownerId: userId },
  })
}

```

- Server-side validation ensures **ABAC & RBAC compliance**.
- Deterministic: same schema used client and server.

---

### 3. Client Form Component with RHF + Zod

```tsx
// components/forms/ProjectForm.tsx
"use client"
import { useForm } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import { projectSchema, ProjectInput } from "@/lib/validation/project"
import { createProject } from "@/app/(dashboard)/projects/actions"

export function ProjectForm() {
  const { register, handleSubmit, formState } = useForm<ProjectInput>({
    resolver: zodResolver(projectSchema),
  })

  const onSubmit = async (data: ProjectInput) => {
    try {
      await createProject(data)
      alert("Project created")
    } catch (err) {
      console.error(err)
      alert("Error creating project")
    }
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register("name")} placeholder="Project Name" />
      {formState.errors.name && <span>{formState.errors.name.message}</span>}
      <textarea {...register("description")} placeholder="Description (optional)" />
      <button type="submit">Create</button>
    </form>
  )
}

```

- Client-side validation improves UX.
- Server-side validation is authoritative.

---

### 4. Integration Notes

- Always wrap form submissions in **Server Actions**.
- Use `zodResolver` for deterministic validation error mapping.
- Combine with **auth** and **ABAC** checks for multi-user apps.
- Can extend with **input-otp** for multi-step secure flows.

---

## Best Practices

- **Shared schema** = single source of truth (avoid duplicate validation).
- **Server-first validation** = authoritative; client validation = UX only.
- **Use TypeScript types inferred from Zod** everywhere.
- **Combine RHF with Leaf Client Components** for form modularity.
- **Always scope data mutations** with authenticated `userId` or ABAC rules.

---

## Docs & References

- [React Hook Form](https://react-hook-form.com/)
- [Zod](https://zod.dev/)
- [RHF + Zod Resolver](https://react-hook-form.com/get-started#SchemaValidation)
- [Next.js Server Actions](https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions)

---