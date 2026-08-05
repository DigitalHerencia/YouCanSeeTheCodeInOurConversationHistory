🧱 PHASE 1 — Codex Build Audit (DO THIS FIRST)

Goal: Verify reality vs claims

&#x20;Pull latest main and confirm clean build

&#x20;Confirm all PRs (#13–#22) actually merged cleanly

&#x20;Cross-check:

&#x20;each PR ↔ corresponding issue

&#x20;issue intent ↔ actual implementation

&#x20;Identify:

&#x20;unresolved TODOs

&#x20;placeholder implementations

&#x20;dead code or unused modules

Architecture checks

&#x20;Routes contain no data/business logic

&#x20;Features do not act as hidden data layer

&#x20;Fetchers are read-only

&#x20;Actions are thin adapters

&#x20;Workflows own mutations + invariants

&#x20;No Prisma / Stripe / Clerk leaks outside allowed layers

System integrity checks

&#x20;RBAC is capability-based (not role string checks)

&#x20;Tenant boundary is consistent everywhere

&#x20;Webhook system is:

&#x20;idempotent

&#x20;retry-safe

&#x20;not “find-then-create”

&#x20;No “read helpers” mutating data

🧠 PHASE 2 — Canonical Pattern Validation

Goal: Make sure your “golden patterns” are actually correct

&#x20;Review your Dev Notes definitions for:

&#x20;fetchers

&#x20;actions

&#x20;workflows

&#x20;transactions

&#x20;DTOs

&#x20;auth/authz boundaries



For each pattern:



&#x20;Does it enforce:

&#x20;correct responsibility

&#x20;correct data flow

&#x20;correct trust boundary

&#x20;Is anything:

&#x20;over-engineered

&#x20;redundant

&#x20;missing critical invariants



👉 Output: final canonical pattern spec



🧩 PHASE 3 — Pattern Enforcement

Goal: Make the repo obey the system

&#x20;Refactor all violations found in Phase 1

&#x20;Standardize:

&#x20;fetcher structure

&#x20;action structure

&#x20;workflow structure

&#x20;Remove:

&#x20;duplicate patterns

&#x20;legacy shortcuts

&#x20;Add enforcement:

&#x20;ESLint import rules

&#x20;server-only boundaries

&#x20;architecture tests



👉 Output: repo becomes internally consistent



🧪 PHASE 4 — Coherent Template Baseline

Goal: Make it actually usable as a template

&#x20;Clean clone works:

&#x20;install

&#x20;build

&#x20;dev server

&#x20;No missing imports or broken modules

&#x20;Environment config:

&#x20;validated

&#x20;documented

&#x20;Remove:

&#x20;Vouch-specific leakage

&#x20;experimental routes from production surface

&#x20;Ensure:

&#x20;sample domain is removable

&#x20;billing/connect are optional (or clearly scoped)



👉 Output: stable, reproducible base



🏗️ PHASE 5 — Generator Design (NO CODING YET)

Goal: Define what CLI is allowed to generate

&#x20;Define modules:

&#x20;base

&#x20;auth

&#x20;tenant

&#x20;rbac

&#x20;billing (optional)

&#x20;connect (optional)

&#x20;catalog (optional)

&#x20;sample domain (optional)

&#x20;Define constraints:

&#x20;what depends on what

&#x20;what cannot be combined

&#x20;Define CLI experience:

&#x20;minimal (default app)

&#x20;interactive (recommended)

&#x20;advanced (modular)



👉 Output: generator spec (this is critical)



⚙️ PHASE 6 — CLI Implementation

Goal: Build create-vibes

&#x20;CLI entrypoint (pnpm dlx create-vibes)

&#x20;Interactive prompts

&#x20;Template composition logic

&#x20;Output directory generation

&#x20;Post-install instructions



👉 Output: working local generator



☁️ PHASE 7 — Infrastructure Provisioning

Goal: turn generator into SaaS factory

&#x20;Neon provisioning

&#x20;Clerk app setup

&#x20;Vercel project creation

&#x20;GitHub repo creation

&#x20;Environment variable injection



👉 Output: fully automated bootstrap



🔥 PHASE 8 — Final Productization

&#x20;Documentation (how to use Vibes)

&#x20;Reset/rename flow

&#x20;Versioning strategy

&#x20;Template certification checklist

&#x20;Private template repo OR CLI distribution

