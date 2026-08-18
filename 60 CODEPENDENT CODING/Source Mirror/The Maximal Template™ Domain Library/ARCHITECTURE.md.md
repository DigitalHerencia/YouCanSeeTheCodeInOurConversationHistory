---
title: 'The Maximal Template™ Domain Library\ARCHITECTURE.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\ARCHITECTURE.md'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.architecture.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\ARCHITECTURE.md'
source_file: 'ARCHITECTURE.md'
source_sha256: 'c158a9593e2bea970b7627189187e4c46a54f48ba791d6062710697e51f2df3d'
generated: true
---

# `ARCHITECTURE.md`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\ARCHITECTURE.md`
> SHA-256: `c158a9593e2bea970b7627189187e4c46a54f48ba791d6062710697e51f2df3d`

```markdown
# Maximal Template architecture map

The canonical human architecture contract lives in [`context/docs/architecture.md`](context/docs/architecture.md), with repository governance and source precedence defined by [`AGENTS.md`](AGENTS.md). The numbered files in `context/specs/` own approved implementation scope.

This root file is a concise compatibility map and does not override those sources.

| Responsibility              | Location                              |
| --------------------------- | ------------------------------------- |
| Static public presentation  | `app/(public)` + `components/blocks/` |
| Application orchestration   | `features/`                           |
| React Hook Form             | Feature form + `components/ui/`       |
| Persisted read              | `lib/fetchers/`                       |
| Ordinary CRUD write         | `lib/actions/`                        |
| Prisma select               | `lib/db/selects/`                     |
| DTO mapper                  | `lib/db/dto/`                         |
| Atomic database helper      | `lib/db/transactions/`                |
| Clerk authentication        | `lib/auth/`                           |
| RBAC, ABAC, resource policy | `lib/authz/`                          |
| Provider behavior           | `lib/integrations/{provider}/`        |
| Webhook HTTP lifecycle      | `app/api/{provider}/.../route.ts`     |
| Remaining domain logic      | `lib/workflows/{domain}/`             |

Normal presentation flows `components/ui -> components/blocks -> features -> app`. React Hook Form features are the explicit exception and compose UI primitives directly. Blocks remain pure presentation.

Static public content is not the marketing domain. `marketing` means marketing automation and analytics. The public demo is browsable signed out, while protected mutations still require authentication, authorization, resource or tenant scope, runtime validation, and RLS where applicable.

```