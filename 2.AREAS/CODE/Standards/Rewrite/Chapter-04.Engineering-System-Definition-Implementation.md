# Chapter 04: Engineering System Definition

**The Book of Implementation™**

## Golden pattern: the backbone topology

Verified against the live maximal template.

```text
lib/
  actions/               # domain-organized mutations: <domain>Actions.ts
  auth/                  # authentication and identity; Clerk lives here
                         #   auth.ts  clerk.ts  redirects.ts  clerk-webhooks.ts
  authz/                 # roles.ts  permissions.ts  policies.ts  resources.ts
  cache/                 # invalidate.ts  life.ts  tags.ts
  constants/             # limits.ts  pagination.ts  routes.ts
  db/
    dto/                 # <domain>.dto.ts       persistence record -> application DTO
    selects/             # <domain>.selects.ts   explicit typed Prisma projections
    transactions/        # <name>.tx.ts          atomic local database operations
    client.ts            # Prisma client using the Neon adapter
    provider.ts          # transaction context for provider/webhook work
    tenant.ts            # authenticated tenant + RLS transaction context
  fetchers/              # domain-organized reads: <domain>Fetchers.ts
  integrations/          # one folder per provider: client + capability files
  utils/                 # generic helpers only
  workflows/             # domain use-case composition: <domain>Workflows.ts
schemas/                 # domain-organized Zod validation: <domain>Schemas.ts
types/                   # domain-organized TypeScript types: <domain>Types.ts
prisma/                  # schema.prisma, migrations/, seed.ts
generated/prisma/        # generated output; gitignored; never hand-edit
proxy.ts                 # Clerk session middleware only (see below)
prisma.config.ts         # Prisma tooling configuration
```

## What `proxy.ts` is, and is not

```ts
import { clerkMiddleware } from "@clerk/nextjs/server";
export default clerkMiddleware();
// export const config = { matcher: [...] }  // skips static assets, always runs for api/trpc
```

It hydrates the Clerk session so `auth()` works downstream. It is not an authorization boundary. The template's own validation contract says so explicitly: `.agents/contracts/validation.yaml` sets `route_matcher_owns_full_tenant_authorization: false`. Authorization lives in Fetchers, Actions, and policies (Chapter 15), and the tenant gate lives in `app/(tenant)/layout.tsx`. This matches Clerk's current guidance to protect resources as close to the data as possible.

## Concern-first placement

Third-party code is not automatically an integration. The concern wins over the vendor label.

| Provider | Home | Reason |
|---|---|---|
| Clerk | `lib/auth/` | identity is a first-class concern |
| Neon, Prisma | `lib/db/`, `prisma/` | persistence is a first-class concern |
| Stripe, SendGrid, Cloudinary, Hugging Face, Vercel Blob | `lib/integrations/<provider>/` | everything else provider-shaped |

## Golden pattern: operational flows

```text
Read:      caller -> Fetcher -> auth/authz -> tenant DB context -> Prisma select -> DTO mapper -> caller
Write:     caller -> Action -> Zod validation -> auth/authz -> tenant DB context -> transaction helper -> DTO -> caller
Process:   caller -> Workflow -> existing Fetchers / Actions / Integrations -> business result
Webhook:   provider -> app/api/<provider>/webhooks/route.ts -> integration helper -> claim / process / complete
Vocabulary: semantic owner -> derived TypeScript / Zod / Prisma / provider / UI representations
```

## Anatomy

- **Domain naming stays shallow and predictable:** `crmActions.ts`, `crmFetchers.ts`, `crmWorkflows.ts`, `crmTypes.ts`, `crmSchemas.ts`. The same pattern applies to every domain, so a file's location is derivable from its name.
- **`lib/db/provider.ts` is separate from `tenant.ts` on purpose.** Webhook work has no signed-in user, so it needs a different transaction context (`withProviderTransaction`, `withProviderOrganizationTransaction`) than the authenticated tenant context.
- **Domain rules live with their owner.** Invoice arithmetic sits in `lib/db/transactions/create-invoice.tx.ts` and uses `Prisma.Decimal` with four decimal places, not in `lib/utils`. That is the abstraction rule applied correctly.

## Gaps flagged, not yet closed

1. **`lib/utils/money.ts` contains an unused floating-point helper.** `roundCurrency` computes `Math.round((value + Number.EPSILON) * 100) / 100` on JavaScript numbers, and a repo-wide search found no caller. It is dead code, but it is the kind that gets picked up later for real money math, where floats lose precision (Chapter 13). Either delete it or move it behind a decimal-based implementation. `assertSameCurrency` in the same file is a domain invariant sitting in a utility module, a smaller instance of the same smell.
2. **The Stripe checkout capability is unused and unguarded.** `createCheckoutSession` in `lib/integrations/stripe/checkout.ts` accepts `priceId`, `successUrl`, and `cancelUrl` straight from its caller and forwards them to Stripe. Nothing in the repo calls it yet, so there is no exposure today. The doctrine's Security Model requires price identifiers and return URLs to be server-derived or allowlisted, and this function does not enforce that, so the first caller must, or the function should be hardened before it gets one. I did not review `portal.ts`.

## Forbidden variants (enforced, not just documented)

- **No generic `service`, `manager`, or `helper` layer.** Workflows are the composition layer, and utilities are only for helpers with no better owner.
- **No business rule (transition matrix, invoice arithmetic, provider content limit, scheduling policy) in `utils/`.** Keep it with the operation that enforces it.
- **No treating `proxy.ts` as authorization.** It hydrates the session and nothing more.
- **No hand edits under `generated/prisma/`, and no generated type promoted to product authority.**
- **No barrel exports by default.** Import from the owning file.

## Checklist

- [ ] New code lands in the `lib` directory that owns its responsibility
- [ ] A new helper has a stable meaning and more than one real caller before it joins `utils/`
- [ ] Any rule about money, state transitions, or provider limits sits with its domain owner
- [ ] Authorization is enforced in the Fetcher, Action, or policy, never delegated to `proxy.ts`
- [ ] Provider-supplied identifiers and URLs are derived or allowlisted server-side before use
