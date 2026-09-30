# Technical Stack SOP

## Purpose

This SOP records the approved engineering stack used by Code Lab domains and project implementations.

## Application

- Next.js App Router / React Server Components
- React
- TypeScript
- Node.js
- pnpm
- Vercel

## Data

- PostgreSQL
- Neon
- Prisma

## Identity and authorization

- Clerk authentication/session management
- Custom tenant, role, and permission model
- Server-side authorization enforcement
- Clerk webhook synchronization
- Svix signature verification where applicable

## UI

- shadcn/ui
- Tailwind-compatible design system
- TanStack Table where tabular interaction requires it
- Recharts for charts where needed

## Testing

- Unit tests
- Integration tests
- Playwright end-to-end tests
- Type checking
- Linting

## Delivery

- GitHub
- GitHub Actions
- Vercel deployments

## Storage

Use object storage for blobs. Keep application metadata and relational data in PostgreSQL.

## Engineering constraints

Tenant boundaries must be enforced server-side. Authentication is not authorization. Every tenant-scoped operation resolves tenant context and applies permission checks before data access.

The stack is implemented through Code Lab Standards and Patterns rather than copied into project notes as generic boilerplate.
