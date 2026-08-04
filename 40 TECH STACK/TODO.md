---
title: Untitled
type:
scope:
project:
domain:
artifact:
kind:
namespace:
authority:
parent:
depends_on:
supersedes:
tags: []
created: 08/04/2026
updated:
---
# PHASE 1 — Codex Build Audit (DO THIS FIRST)

### Goal: Verify reality vs claims

- [ ]  Pull latest `main` and confirm clean build
- [ ]  Confirm all PRs (#13–#22) actually merged cleanly
- [ ]  Cross-check:
    - [ ]  each PR ↔ corresponding issue
    - [ ]  issue intent ↔ actual implementation
- [ ]  Identify:
    - [ ]  unresolved TODOs
    - [ ]  placeholder implementations
    - [ ]  dead code or unused modules

### Architecture checks

- [ ]  Routes contain no data/business logic
- [ ]  Features do not act as hidden data layer
- [ ]  Fetchers are read-only
- [ ]  Actions are thin adapters
- [ ]  Workflows own mutations + invariants
- [ ]  No Prisma / Stripe / Clerk leaks outside allowed layers

### System integrity checks

- [ ]  RBAC is capability-based (not role string checks)
- [ ]  Tenant boundary is consistent everywhere
- [ ]  Webhook system is:
    - [ ]  idempotent
    - [ ]  retry-safe
    - [ ]  not “find-then-create”
- [ ]  No “read helpers” mutating data

---

#  PHASE 2 — Canonical Pattern Validation

### Goal: Make sure your “golden patterns” are actually correct

- [ ]  Review your Dev Notes definitions for:
    - [ ]  fetchers
    - [ ]  actions
    - [ ]  workflows
    - [ ]  transactions
    - [ ]  DTOs
    - [ ]  auth/authz boundaries

For each pattern:

- [ ]  Does it enforce:
    - [ ]  correct responsibility
    - [ ]  correct data flow
    - [ ]  correct trust boundary
- [ ]  Is anything:
    - [ ]  over-engineered
    - [ ]  redundant
    - [ ]  missing critical invariants

Output: **final canonical pattern spec**

---

# PHASE 3 — Pattern Enforcement

### Goal: Make the repo obey the system

- [ ]  Refactor all violations found in Phase 1
- [ ]  Standardize:
    - [ ]  fetcher structure
    - [ ]  action structure
    - [ ]  workflow structure
- [ ]  Remove:
    - [ ]  duplicate patterns
    - [ ]  legacy shortcuts
- [ ]  Add enforcement:
    - [ ]  ESLint import rules
    - [ ]  server-only boundaries
    - [ ]  architecture tests

Output: **repo becomes internally consistent**

---

# PHASE 4 — Coherent Template Baseline

### Goal: Make it actually usable as a template

- [ ]  Clean clone works:
    - [ ]  install
    - [ ]  build
    - [ ]  dev server
- [ ]  No missing imports or broken modules
- [ ]  Environment config:
    - [ ]  validated
    - [ ]  documented
- [ ]  Remove:
    - [ ]  Vouch-specific leakage
    - [ ]  experimental routes from production surface
- [ ]  Ensure:
    - [ ]  sample domain is removable
    - [ ]  billing/connect are optional (or clearly scoped)

Output: **stable, reproducible base**

---

# PHASE 5 — Generator Design (NO CODING YET)

### Goal: Define what CLI is allowed to generate

- [ ]  Define modules:
    - [ ]  base
    - [ ]  auth
    - [ ]  tenant
    - [ ]  rbac
    - [ ]  billing (optional)
    - [ ]  connect (optional)
    - [ ]  catalog (optional)
    - [ ]  sample domain (optional)
- [ ]  Define constraints:
    - [ ]  what depends on what
    - [ ]  what cannot be combined
- [ ]  Define CLI experience:
    - [ ]  minimal (default app)
    - [ ]  interactive (recommended)
    - [ ]  advanced (modular)

Output: **generator spec (this is critical)**

---

# PHASE 6 — CLI Implementation

### Goal: Build `create-vibes`

- [ ]  CLI entrypoint (`pnpm dlx create-vibes`)
- [ ]  Interactive prompts
- [ ]  Template composition logic
- [ ]  Output directory generation
- [ ]  Post-install instructions

Output: **working local generator**

---

# PHASE 7 — Infrastructure Provisioning

### Goal: turn generator into SaaS factory

- [ ]  Neon provisioning
- [ ]  Clerk app setup
- [ ]  Vercel project creation
- [ ]  GitHub repo creation
- [ ]  Environment variable injection

Output: **fully automated bootstrap**

---

# PHASE 8 — Final Productization

- [ ]  Documentation (how to use Vibes)
- [ ]  Reset/rename flow
- [ ]  Versioning strategy
- [ ]  Template certification checklist
- [ ]  Private template repo OR CLI distribution