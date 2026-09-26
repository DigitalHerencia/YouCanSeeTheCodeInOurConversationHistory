# UUID/Js-Cookie

Category: Utilities
Type: Utility
Edited: December 18, 2025 8:09 PM
Docs Link: • clsx
• class-variance-authority (cva)
• tailwind-merge
• uuid
• Next.js cookies API
• js-cookie
Cover: https://images.unsplash.com/photo-1504639725590-34d0984388bd?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: CLSX, JS-Cookie, UUID

## Mental Models

- **Class merging is layered** → `clsx` for conditional logic → `cva` for variants → `tailwind-merge` for final deduplication.
- **Determinism in styling** → always merge classes through `twMerge`, never rely on Tailwind order alone.
- **IDs are disposable** → `uuid` is used only for unique references (not sequential, not for DB primary keys unless explicitly designed).
- **Cookies are context-bound** → server cookies via Next.js `cookies()` API, client cookies only when unavoidable (`js-cookie`).
- **Separation of concerns** → styling utilities never mix with state utilities; IDs and cookies only surface where persistence or uniqueness is required.

---

## Canonical Workflow

### 1. Class Handling (Baseline → Variants → Merge)

```tsx
import { clsx } from "clsx"
import { cva } from "class-variance-authority"
import { twMerge } from "tailwind-merge"

// Baseline conditional classes
const btn = clsx("px-4 py-2", isActive && "bg-blue-500")

// Variants for reuse
const button = cva("px-4 py-2 rounded", {
  variants: {
    intent: { primary: "bg-blue-500", secondary: "bg-gray-500" },
    size: { sm: "text-sm", lg: "text-lg" },
  },
  defaultVariants: { intent: "primary", size: "sm" },
})

// Deduplicate & finalize
const classes = twMerge(button({ intent: "secondary" }), "font-bold")

```

- Always build classes in **three layers**: conditional → variant → merge.
- `cva` definitions live in `lib/styles/` or `components/ui/`.

---

### 2. UUIDs for Unique Keys

```tsx
import { v4 as uuidv4 } from "uuid"

const id = uuidv4() // "3d594650-3436-11eb-b378-0242ac130002"

```

- Use only for **frontend keys, temporary identifiers, or unique tokens**.
- Do not mix with DB autoincrement IDs unless required.

---

### 3. Cookies (Server-Side)

```tsx
import { cookies } from "next/headers"

export function setThemeCookie(theme: string) {
  cookies().set("theme", theme, { httpOnly: true })
}

export function getThemeCookie() {
  return cookies().get("theme")?.value
}

```

- Server is **source of truth** for cookies.
- Use `httpOnly` for sensitive values.
- Clerk manages auth/session cookies; app sets feature flags or preferences only.

---

### 4. Cookies (Client-Side)

```tsx
import Cookies from "js-cookie"

// Read/write in browser
Cookies.set("theme", "dark", { secure: true })
const theme = Cookies.get("theme")

```

- Only when a client needs immediate state sync (e.g., UI theme).
- Always prefer server-managed cookies unless explicitly UI-only.

---

---

## Best Practices

- **Always normalize Tailwind classes through `twMerge`**.
- **Centralize `cva` definitions** in `lib/styles` for reuse.
- **Use UUID v4 for uniqueness**, never for ordering.
- **Server cookies are canonical**; client cookies are secondary.
- **Never manually string-concatenate classes or cookies** — always use utilities for determinism.

---

## Docs & References

- [clsx](https://github.com/lukeed/clsx)
- [class-variance-authority (cva)](https://cva.style/docs)
- [tailwind-merge](https://tailwind-merge.vercel.app/)
- [uuid](https://github.com/uuidjs/uuid)
- [Next.js cookies API](https://nextjs.org/docs/app/api-reference/functions/cookies)
- [js-cookie](https://github.com/js-cookie/js-cookie)

---