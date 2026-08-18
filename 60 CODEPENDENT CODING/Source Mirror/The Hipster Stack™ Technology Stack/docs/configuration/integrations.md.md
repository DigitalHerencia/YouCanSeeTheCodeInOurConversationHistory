---
title: 'The Hipster Stack™ Technology Stack\docs\configuration\integrations.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\docs\configuration\integrations.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.docs.configuration.integrations.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\docs\configuration\integrations.md'
source_file: 'integrations.md'
source_sha256: '409fd26d4ea5b548a069fb2a6ad868e79918909cc61d2073a5c089381db626a5'
generated: true
---

# `integrations.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\docs\configuration\integrations.md`
> SHA-256: `409fd26d4ea5b548a069fb2a6ad868e79918909cc61d2073a5c089381db626a5`

```markdown
# Integrations and provider ownership

The template includes supported server-side boundaries for Clerk, Neon/PostgreSQL, Stripe, Cloudinary, Hugging Face, Mapbox, and Vercel-oriented deployment. Billing and Stripe Connect are optional generated surfaces; the other boundaries are part of the fixed template foundation.

Hipster Stack does not create provider accounts, collect secrets, provision infrastructure, run production migrations, register webhooks, choose commercial policy, or deploy for you.

Start from the generated `.env.example`. Configure provider projects and credentials in your own environments, run `hipster-stack doctor`, then verify every provider-backed journey before production promotion.

```