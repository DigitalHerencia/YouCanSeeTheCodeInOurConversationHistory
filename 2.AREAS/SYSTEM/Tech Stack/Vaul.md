# Vaul

Category: Mobile / Responsive
Type: UI Component
Edited: December 18, 2025 8:08 PM
Docs Link: • Tailwind CSS Responsive
• Vaul Sheets & Drawers
• Embla Carousel
• React Resizable Panels
Cover: https://www.notion.so/image/https%3A%2F%2Fmishpacha.com%2Fwp-content%2Fuploads%2F2022%2F07%2FSo-You-Want-to-Be-a%25E2%2580%25A6-Web-Developer-R.jpg
Tags: Embla, Resizable Panels, TailwindCSS, Vaul

## Mental Models

- **Mobile-first design**: Tailwind classes are applied with mobile-first philosophy (`sm:`, `md:`, `lg:`).
- **Server-first rendering**: responsive layouts are defined in server components; interactivity (carousels, resizable panels) in client components.
- **Component modularity**: drawers, sheets, carousels, and resizable panels live as **leaf client components**.
- **Deterministic layout behavior**: layout breakpoints, panel sizes, and carousel configurations are consistent across devices.
- **UX consistency**: maintain predictable behavior across touch, keyboard, and pointer devices.

---

## Canonical Workflow

### 1. Tailwind Responsive Layout

```tsx
// components/layouts/DashboardLayout.tsx
import React from "react"

export function DashboardLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex flex-col lg:flex-row min-h-screen">
      <aside className="bg-gray-100 w-full lg:w-64 p-4">Sidebar</aside>
      <main className="flex-1 p-4">{children}</main>
    </div>
  )
}

```

- `flex-col` on mobile, `flex-row` on `lg:` breakpoint.
- Deterministic and server-rendered layout.

---

### 2. Vaul Drawer / Sheet

```tsx
// components/ui/Drawer.tsx
"use client"
import * as Sheet from "vaul"

export function Drawer({ children }: { children: React.ReactNode }) {
  return (
    <Sheet.Root>
      <Sheet.Trigger>Open</Sheet.Trigger>
      <Sheet.Overlay className="fixed inset-0 bg-black/50" />
      <Sheet.Content className="fixed right-0 top-0 h-full w-80 bg-white p-4">
        {children}
      </Sheet.Content>
    </Sheet.Root>
  )
}

```

- Client-only for interactive sheets/drawers.
- Deterministic opening/closing behavior.

---

### 3. Embla Carousel

```tsx
// components/ui/Carousel.tsx
"use client"
import { EmblaCarousel } from "embla-carousel-react"
import "embla-carousel/embla-carousel.css"

export function Carousel({ slides }: { slides: string[] }) {
  const [emblaRef] = EmblaCarousel({ loop: true })
  return (
    <div className="overflow-hidden" ref={emblaRef}>
      <div className="flex">
        {slides.map((slide, i) => (
          <div key={i} className="flex-none w-full">{slide}</div>
        ))}
      </div>
    </div>
  )
}

```

- Client-only component, deterministic looping.
- Works with responsive widths automatically.

---

### 4. Resizable Panels

```tsx
// components/ui/ResizablePanels.tsx
"use client"
import { Panel, PanelGroup } from "react-resizable-panels"

export function ResizablePanelsLayout() {
  return (
    <PanelGroup direction="horizontal">
      <Panel defaultSize={25}>Left Panel</Panel>
      <Panel defaultSize={75}>Right Panel</Panel>
    </PanelGroup>
  )
}

```

- Deterministic panel sizing on initial load.
- User adjustments stored in local state if needed.

---

## Best Practices

- **Mobile-first Tailwind** for consistent breakpoints.
- **Client-only interactivity** for sheets, drawers, carousels, and panels.
- **Server-first layout** → avoid hydration mismatch issues.
- **Maintain deterministic defaults** for panel sizes and carousel loops.
- **Combine responsive Tailwind + interactive components** carefully to avoid layout shifts.

---

## Docs & References

- [Tailwind CSS Responsive](https://tailwindcss.com/docs/responsive-design)
- [Vaul Sheets & Drawers](https://vaul.dev/)
- [Embla Carousel](https://www.embla-carousel.com/)
- [React Resizable Panels](https://github.com/bvaughn/react-resizable-panels)

---