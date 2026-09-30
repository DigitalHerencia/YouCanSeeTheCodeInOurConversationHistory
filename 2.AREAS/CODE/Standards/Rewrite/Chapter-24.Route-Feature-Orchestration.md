# Chapter 24: Route / Feature Orchestration

**The Book of Knowledge™**

## Concept

This is the composition discipline at the very top of the UI stack, and it operates on two distinct axes at once: **route orchestration** — the route-group layout assembling the chrome shared by every page in that group (header, nav, sidebar — a **layout shell**) — and **feature orchestration** — an individual page composing a Feature, which in turn composes pure presentational Templates with a Workflow's data. A page route itself does neither of these; it is a thin **adapter** between the framework's routing/streaming mechanics and the actual feature underneath.

## Why it exists

Keeping the route file thin and pushing composition into layouts and features is what makes **streaming and partial rendering** (React's Suspense boundaries) actually effective. If a page route contains real logic or markup beyond a Suspense boundary and a fallback, that logic is now entangled with the routing layer, making it harder to reason about what streams, in what order, and harder to reuse the same composed feature somewhere else (a modal, a different route) without dragging routing concerns along with it. Separating "what data-dependent chrome does this whole section share" (route orchestration, solved once per route group) from "what does this specific page need" (feature orchestration, solved per page) also avoids re-deriving shared navigation/authentication state on every single page.

## Where people get it wrong

A common shortcut is putting data fetching or business logic directly in the page component "since it's already an async Server Component and it's convenient" — which quietly turns the routing layer into a feature layer, and makes the loading/error boundaries route-specific rather than reusable. The mirror-image mistake is duplicating shared chrome (auth redirect checks, layout shell markup) inside individual page files instead of the shared layout, which both bloats every page and creates drift the moment the shared chrome needs to change.

## Your stance

A route-group layout is where authentication/onboarding gating happens once for the whole group, and where the shared layout **shell** (header, nav, sidebar) is assembled and wrapped around whatever page renders inside it. A page route itself does nothing but: wrap the relevant Feature in a `Suspense` boundary with a purpose-built skeleton fallback for dynamic content, or rely on Next.js's own `loading.tsx` for genuinely static/non-dynamic content (marketing pages) where a custom skeleton adds nothing. The Feature is where the actual composition happens — pure presentational output (built from Templates, built from Blocks, built from shadcn primitives) combined with the data/actions a Workflow provides — and the Feature itself carries no business logic; it renders what the Workflow gives it and wires the intended interactions to Actions.

## Trade-offs you're accepting

This means an extra file (a skeleton component, sometimes a dedicated client sub-component) for every feature that streams, where a single page file with inline logic would have been fewer files to open. You're accepting that overhead because it's what keeps the routing layer swappable and the feature layer reusable — a Feature that doesn't know or care which route rendered it can be dropped into a modal, a different route, or a test harness without modification.

## See also

Book of Implementation, Chapter 24 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
