---
title: Tech Stack
entity: sop
document_id: Technical Reference
version: 2025-12-29
source_status: Reference
source: Notion
source_url: https://app.notion.com/2d8a4e63bf2380d1809fe3f01772a93d
tags:
  - digital-herencia/sop
  - tech-stack
---

# Modern Enterprise Multi-Tenant SaaS Platform

This migrated source defines a secure, performant multi-tenant SaaS reference architecture.

## Framework and runtime

- Next.js App Router + React Server Components: v16.1.x in source
- React: v19.2.x in source
- Node.js: v20.x in source
- TypeScript: v5.9.x in source
- pnpm: v8.x–v9.x in source
- Turbo: v1.x in source

These are preserved as source claims, not silently updated to current versions.

## Identity and RBAC

- Clerk for authentication/session management
- Clerk webhooks for synchronization
- Svix for webhook verification
- custom tenant + role tables rather than Clerk Organizations
- tenant-scoped roles and fine-grained permissions
- authorization rechecked server-side
- tenant IDs on tenant-scoped entities
- optional Postgres RLS as defense in depth

## Billing

The source uses Clerk Billing for feature gating/payment processing and describes Free, Pro, and Enterprise tiers. It requires server-side plan checks and subscription-event synchronization for audit/reporting.

## Database and ORM

- Neon PostgreSQL
- pooled connection for application runtime
- Prisma ORM
- Neon adapter/serverless driver where required

## Webhooks

Requirements include Svix verification, event parsing, transactions/upserts, idempotency using stored event IDs, audit logging, and fast responses with heavy work deferred where needed.

## API and middleware

- Clerk middleware for authentication
- session → user → tenant context
- server endpoints revalidate tenant context
- centralized authorization helpers such as `requireAuth` / `requirePermission`

## UI

- shadcn/ui
- high-level blocks for layout patterns
- TanStack Table patterns for data tables
- Recharts-backed charts

## Files

Use object storage rather than Postgres blobs; use presigned URLs, server-side MIME validation, database metadata, and retention-aware soft delete.

## Observability and QA

- structured logging
- metrics/monitoring
- Vitest unit testing
- Playwright E2E
- coverage verification

## Deployment

- Vercel
- GitHub Actions
- lockfile discipline
- ESLint / Prettier

## Glossary

Tenant, Role, Permission, Billing Plan, Webhook, Svix.
