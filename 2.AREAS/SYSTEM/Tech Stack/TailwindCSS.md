# TailwindCSS

Category: UI / Styling
Type: UI Component
Edited: December 18, 2025 8:01 PM
Docs Link: • Tailwind CSS
• ShadCN UI
• Radix UI
• Framer Motion
• Next-themes
Cover: https://images.unsplash.com/photo-1508317469940-e3de49ba902e?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Radix, ShadCN UI, TailwindCSS, UI

## Mental Models

- **Server-first components**: UI components are server-rendered unless interactivity or state is needed (`use client`).
- **Component hierarchy**:
    - **Primitive/UI library** (shadcn/ui, Radix) → accessible, composable base components.
    - **Design system layer** → consistent variants, utility wrappers (`cva`, `clsx`, `tailwind-merge`).
    - **Page components** → combine primitives into feature UIs.
- **Stateful components at leaf nodes**: forms, modals, drag/drop panels live as client components.
- **Motion / animations**: Framer Motion only in client components; avoid SSR-heavy animations.
- **Theming**: use `next-themes` to manage dark/light mode; design system uses theme-aware classes.

---

## Canonical Workflow

### 1. Tailwind + shadcn/ui Setup

```tsx
// components/ui/button.tsx
"use client"
import { cva } from "class-variance-authority"
import { twMerge } from "tailwind-merge"

const button = cva(
  "rounded-lg px-4 py-2 font-medium transition",
  {
    variants: {
      intent: {
        primary: "bg-blue-600 text-white hover:bg-blue-700",
        secondary: "bg-gray-200 text-gray-800 hover:bg-gray-300",
      },
      size: {
        sm: "text-sm",
        md: "text-base",
      },
    },
    defaultVariants: { intent: "primary", size: "md" },
  }
)

export function Button({ className, intent, size, ...props }: any) {
  return <button className={twMerge(button({ intent, size }), className)} {...props} />
}

```

- **cva + tailwind-merge** = deterministic, reusable styling with variant control.
- **Leaf-level client components** only.

---

### 2. Layout & Radix Components

```tsx
// components/ui/dialog.tsx
"use client"
import * as DialogPrimitive from "@radix-ui/react-dialog"
import { cn } from "@/lib/utils"

export const Dialog = DialogPrimitive.Root
export const DialogTrigger = DialogPrimitive.Trigger
export const DialogContent = ({ className, ...props }: any) => (
  <DialogPrimitive.Content className={cn("bg-white p-6 rounded-lg", className)} {...props} />
)

```

- Radix provides **accessible primitives**.
- Wrap in your design system for consistent look.

---

### 3. Framer Motion Example

```tsx
// components/ui/animated-card.tsx
"use client"
import { motion } from "framer-motion"

export function AnimatedCard({ children }: { children: React.ReactNode }) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -10 }}
      transition={{ duration: 0.3 }}
      className="p-4 bg-white rounded-lg shadow"
    >
      {children}
    </motion.div>
  )
}

```

- Only use in **client components**.
- Keep animations simple to maintain SSR streaming performance.

---

### 4. Dark/Light Mode

```tsx
// app/layout.tsx
import { ThemeProvider } from "next-themes"

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <ThemeProvider attribute="class">{children}</ThemeProvider>
}

```

- Use Tailwind classes like `dark:bg-gray-900` for theme-aware styling.
- All components in design system inherit theme automatically.

---

## Best Practices

- **Server-first** → mark only interactive leaf nodes as `use client`.
- **Design system + cva** → avoid ad-hoc classes in pages.
- **Accessible primitives** → Radix ensures keyboard + screen reader support.
- **Motion only in client components** → don’t break SSR streaming.
- **Theme consistency** → manage in root layout, propagate via Tailwind dark classes.
- **Variant-driven styling** → deterministic class output for LLM-friendly UI generation.

---

## Docs & References

- [Tailwind CSS](https://tailwindcss.com/docs)
- [shadcn/ui](https://ui.shadcn.com/docs)
- [Radix UI](https://www.radix-ui.com/docs/primitives/overview/introduction)
- [Framer Motion](https://www.framer.com/motion/)
- [Next-themes](https://github.com/pacocoursey/next-themes)

---