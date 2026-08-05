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
# What You Actually Built

After inspecting the repository at commit `19e2008`, the correct description is:

> **Vibes is an opinionated, production-oriented Next.js SaaS starter template and reference architecture.**

More precisely, it is currently:

- a **single-template repository**
    
- containing a **runnable starter application**
    
- with **embedded architectural governance**
    
- machine-enforced **architecture and security contracts**
    
- optional/reference subsystems
    
- a reusable presentation catalog
    
- credential-free validation gates
    

It is **not yet**:

- a published CLI package
    
- an interactive project initializer
    
- a dynamic scaffolding generator
    
- a multi-template generator platform
    
- a composable preset system
    

That is not a criticism. It means you already built the expensive part: the **canonical generated output**.

The repository explicitly describes itself as a runnable App Router SaaS starter, with product-specific examples isolated as non-authoritative reference implementations. Its stack and architecture already embody your “hipster stack”: Next.js, Clerk, Prisma, Neon, custom RBAC, RLS, Stripe, shadcn-compatible primitives, Zod, Vitest, Playwright, and pinned pnpm tooling.

---

# The Taxonomy You Should Use

## 1. Vibes today: **starter template**

A **starter template** is a complete repository intended to be copied, cloned, forked, or instantiated as the starting point for a new application.

Conceptually:

```text
Vibes repository
      │
      │ copy / clone / template expansion
      ▼
New SaaS repository
```

The source repository and generated project are structurally similar.

This is different from a generator because there is no execution engine making decisions yet.

Your current transformation is approximately:

```text
template tree → copied project tree
```

Not yet:

```text
user answers
    ↓
configuration model
    ↓
dependency resolution
    ↓
conditional modules
    ↓
rendered project
```

## 2. What you want next: **interactive project initializer**

The end-user command you described should be called an:

> **Interactive CLI project initializer backed by a composable scaffolding generator.**

A shorter product description would be:

> **An opinionated SaaS project generator.**

A technically complete description:

> A package-manager-executable CLI that collects project configuration, resolves a compatible feature graph, composes a base template with optional modules, renders project-specific files, installs dependencies, and validates the generated repository.

Possible package naming:

```powershell
pnpm dlx create-vibes@latest my-app
```

That command invokes a **project initializer**. Internally, the initializer uses a **generator**. The generator consumes **templates and modules**.

---

# Your System, Layer by Layer

```text
┌──────────────────────────────────────────────────────┐
│ pnpm dlx create-vibes my-app                         │
│ Package-manager execution mechanism                  │
└─────────────────────────┬────────────────────────────┘
                          │
                          ▼
┌──────────────────────────────────────────────────────┐
│ CLI application                                      │
│ Parses flags, renders prompts, prints progress       │
└─────────────────────────┬────────────────────────────┘
                          │
                          ▼
┌──────────────────────────────────────────────────────┐
│ Project initializer                                  │
│ Coordinates the complete creation lifecycle          │
└─────────────────────────┬────────────────────────────┘
                          │
                          ▼
┌──────────────────────────────────────────────────────┐
│ Scaffolding generator                                │
│ Resolves modules, files, dependencies, transformations│
└──────────────┬──────────────────────┬────────────────┘
               │                      │
               ▼                      ▼
┌──────────────────────────┐  ┌────────────────────────┐
│ Base template            │  │ Optional modules       │
│ Canonical Vibes skeleton │  │ Stripe Connect, etc.   │
└──────────────────────────┘  └────────────────────────┘
               │                      │
               └──────────┬───────────┘
                          ▼
┌──────────────────────────────────────────────────────┐
│ Generated SaaS repository                            │
│ Ready for pnpm install, validation, and development  │
└──────────────────────────────────────────────────────┘
```

The distinctions are:

|Term|Role in your future system|
|---|---|
|`pnpm dlx`|Downloads and temporarily executes the npm package|
|CLI|Human-facing command interface|
|Project initializer|Owns the complete create-project workflow|
|Generator|Computes and writes the output|
|Template|Files used as generation inputs|
|Module|Optional, composable unit of project functionality|
|Template engine|Renders parameterized text files, when needed|
|Preset|Named configuration selecting a compatible module set|
|Starter|The runnable application shape users receive|
|Reference implementation|Non-canonical example showing a concrete use|

---

# What Vibes Already Gets Right

## Canonical architecture

The strongest part of Vibes is not its dependency list. It is the architectural contract:

```text
Pages select.
Layouts and shells frame.
Features orchestrate.
Blocks assemble.
Components render.
Primitives control low-level UI behavior.
Fetchers read.
Actions write.
Auth identifies.
Authz authorizes.
Schemas validate.
DTOs transport safe data.
Transactions persist atomically.
Webhooks reconcile provider events.
```

That rule is explicitly documented in the repository.

Your larger architecture document expresses the same system as domain workflows and explicit trust boundaries, rather than pages wired directly to a database. It further defines the central rule that routes adapt, features orchestrate, components render, fetchers read, actions write, authorization decides, transactions preserve invariants, and webhooks reconcile external truth.

That gives you something most starter kits lack:

> The generated repository has an enforceable architectural identity.

## Clean separation of canonical and non-canonical material

You already distinguish:

```text
canonical template
├── application architecture
├── governance
├── tests
├── validation
└── reusable presentation

reference-implementations/
└── vouch/
    └── product-specific examples
```

That is exactly the right direction. A concrete product implementation must not silently become the generic generator’s domain model.

## Credential-free generation target

The repository can execute substantial validation without live provider credentials. That is critical for generator design because generated-project tests cannot depend on the user having already configured Neon, Clerk, Stripe, and deployment infrastructure.

The clean-clone gate includes generation, Prisma validation, formatting, linting, type generation, TypeScript, contracts, unit tests, contract tests, and a production build.

## Explicit optionality

Stripe Connect is already treated as a separable reference module, and the repository has a removal test proving that core production behavior survives after its runtime files are removed.

That is an unusually useful precursor to modular generation.

You have effectively begun defining:

```text
core SaaS
     +
optional Stripe Connect capability
```

## Architecture enforcement rather than architecture documentation alone

The repository contains:

- human-readable context
    
- ADRs
    
- machine-readable contracts
    
- architecture validators
    
- contract tests
    
- security tests
    
- generated-output validation
    

Your source hierarchy is also explicit: user instruction, context, deterministic contracts, agent instructions, code, then implementation judgment.

This means your future generator can enforce architecture at three different moments:

```text
Generation time
    Reject incompatible configurations

Validation time
    Detect illegal repository structure/imports

Development time
    Guide humans and agents through governance
```

That is much stronger than merely copying a folder tree.

---

# What Vibes Does Not Yet Contain

The `package.json` has no executable `bin` entry, and the repository has no clear CLI or generator package. Its scripts operate and validate the starter itself.

The current conceptual architecture is:

```text
DigitalHerencia/Vibes
└── runnable starter application
```

The desired architecture is:

```text
DigitalHerencia/Vibes
├── generator implementation
├── canonical project template
├── optional generation modules
├── compatibility rules
├── generator test fixtures
└── generated-output test matrix
```

The key mistake to avoid is trying to add prompts directly to the existing application root and calling that a generator. The CLI product and the generated product have different responsibilities, dependencies, release cycles, and tests.

---

# Recommended Repository Architecture

For your case, I recommend a **pnpm workspace monorepo with a separated generator and template source**.

```text
vibes/
├── apps/
│   └── fixture-catalog/
│       └── optional visual/manual test application
│
├── packages/
│   ├── create-vibes/
│   │   ├── src/
│   │   │   ├── cli.ts
│   │   │   ├── commands/
│   │   │   │   └── create.ts
│   │   │   ├── prompts/
│   │   │   ├── config/
│   │   │   │   ├── schema.ts
│   │   │   │   └── defaults.ts
│   │   │   ├── resolver/
│   │   │   │   ├── resolve-modules.ts
│   │   │   │   └── compatibility.ts
│   │   │   ├── generator/
│   │   │   │   ├── generate.ts
│   │   │   │   ├── copy-files.ts
│   │   │   │   ├── merge-package-json.ts
│   │   │   │   └── run-transforms.ts
│   │   │   └── lifecycle/
│   │   │       ├── install.ts
│   │   │       ├── initialize-git.ts
│   │   │       └── validate.ts
│   │   └── package.json
│   │
│   ├── generator-core/
│   │   ├── src/
│   │   │   ├── module.ts
│   │   │   ├── file-plan.ts
│   │   │   ├── dependency-graph.ts
│   │   │   └── conflict-resolution.ts
│   │   └── package.json
│   │
│   ├── template-core/
│   │   ├── template/
│   │   │   └── canonical Vibes application
│   │   ├── manifest.ts
│   │   └── package.json
│   │
│   └── modules/
│       ├── clerk/
│       ├── tenancy/
│       ├── postgres-rls/
│       ├── stripe-billing/
│       ├── stripe-connect/
│       ├── presentation-catalog/
│       └── agent-governance/
│
├── fixtures/
│   ├── minimal/
│   ├── standard/
│   └── full/
│
├── tests/
│   ├── cli/
│   ├── generation/
│   ├── compatibility/
│   └── snapshots/
│
├── pnpm-workspace.yaml
└── turbo.json                 # optional, not inherently required
```

## Why this architecture fits Vibes

You have enough complexity that a single `templates/` directory inside one CLI package will eventually become brittle.

You need to distinguish:

1. **Generator runtime**
    
2. **Canonical output**
    
3. **Optional capabilities**
    
4. **Generation contracts**
    
5. **Generated-project verification**
    

That is a legitimate monorepo boundary, not monorepo theater.

---

# The Generator Should Not Template Everything

This is one of the most important design decisions.

Do **not** convert the entire Vibes source tree into Handlebars, EJS, or string-interpolation templates.

Most files should remain literal files.

Use three transformation classes.

## Class A: literal copy

Most application files should simply be copied:

```text
components/ui/button.tsx
lib/authz/authorize.ts
scripts/validate-architecture.mjs
tests/contract/architecture-surface.test.ts
```

No template syntax. No rendering.

Benefits:

- ordinary TypeScript remains ordinary TypeScript
    
- editors, linters, and tests can inspect template source directly
    
- fewer escaping and formatting problems
    
- template source can itself compile and run
    

## Class B: structured transformation

Use parsers or object-level edits for structured files:

```text
package.json
tsconfig.json
components.json
.env.example
pnpm-workspace.yaml
```

For example, do not generate `package.json` through arbitrary string replacement.

Use a deterministic merge:

```text
base package manifest
    +
selected module dependency contributions
    +
selected script contributions
    +
project metadata
    ↓
normalized package.json
```

## Class C: textual rendering

Use a template engine only for genuinely parameterized files:

```text
README.md
package name
application title
optional documentation fragments
possibly generated environment comments
```

Mental model:

```text
                     ┌─ literal copy
source file ─────────┼─ structured merge
                     └─ textual render
```

The generator manifest should declare which operation applies to each input.

---

# Your Most Important Abstraction: A Generation Module

A module is not just a directory copied when a checkbox is selected.

A proper module owns a complete capability contribution.

Conceptually:

```ts
interface GeneratorModule {
  id: string;
  description: string;

  requires?: string[];
  conflicts?: string[];
  implies?: string[];

  files?: FileContribution[];
  dependencies?: DependencyContribution;
  environment?: EnvironmentContribution[];
  scripts?: ScriptContribution[];
  transforms?: Transform[];
  validations?: ValidationContribution[];
  documentation?: DocumentationContribution[];
}
```

For example:

```text
stripe-connect
├── requires
│   ├── stripe-billing
│   ├── tenancy
│   └── database
├── contributes
│   ├── integration files
│   ├── webhook route
│   ├── Prisma models
│   ├── environment variables
│   ├── tests
│   ├── package dependencies
│   └── documentation
└── validates
    ├── provider scoping
    ├── removable-module contract
    └── build success
```

This is the difference between **conditional file copying** and **composable generation**.

---

# Dependency Graphs in Your Generator

Your options are not independent booleans.

For example:

```text
Stripe Connect
      │
      ├── requires Stripe core
      ├── requires tenant model
      ├── requires database
      └── requires webhook infrastructure

PostgreSQL RLS
      │
      ├── requires database tenancy
      ├── requires runtime tenant context
      └── requires restricted runtime role

Custom RBAC
      │
      ├── requires local users
      └── requires tenant memberships
```

A plausible graph:

```text
core
├── next-app
├── type-safety
├── validation
└── governance

database
├── prisma
└── neon

identity
└── clerk
    └── local-user-sync

tenancy
├── database
├── identity
└── memberships

rbac
└── tenancy

rls
├── tenancy
└── database

stripe-billing
├── tenancy
├── identity
└── webhook-ledger

stripe-connect
├── stripe-billing
├── rbac
└── webhook-ledger
```

This graph must be resolved before writing files.

```text
raw answers
    ↓
normalized configuration
    ↓
dependency closure
    ↓
compatibility validation
    ↓
ordered module plan
    ↓
file/dependency/transformation plan
    ↓
generation
```

Do not let prompts directly cause file operations. Prompts produce a configuration. The configuration is resolved separately.

That separation enables:

- interactive CLI usage
    
- non-interactive CI usage
    
- presets
    
- configuration files
    
- reproducible generator tests
    

---

# Simulated CLI Flow

Here is a realistic first version.

```text
PS> pnpm dlx create-vibes@latest acme-console

◆ Project directory
│  ./acme-console
│
◆ Choose a preset
│  ● Standard SaaS
│  ○ Minimal foundation
│  ○ Full platform
│  ○ Custom
│
◆ Include tenant organizations?
│  Yes
│
◆ Authorization model
│  ● Local RBAC with stable capabilities
│  ○ Authentication only
│
◆ Enable PostgreSQL row-level security?
│  Yes
│
◆ Billing
│  ● Stripe subscriptions
│  ○ Stripe subscriptions + Connect
│  ○ None
│
◆ Include the presentation catalog?
│  Yes, development-only
│
◆ Include repository governance for Codex?
│  Yes
│
◆ Initialize Git?
│  Yes
│
◆ Install dependencies?
│  Yes
│
◇ Resolved configuration
│
│  Preset                 standard
│  Authentication          Clerk
│  Database                Neon + Prisma
│  Tenancy                 enabled
│  Authorization           local-rbac
│  Database containment    PostgreSQL RLS
│  Billing                 Stripe subscriptions
│  Presentation catalog    development-only
│  Agent governance        enabled
│
◇ Generated 284 files
◇ Installed dependencies with pnpm
◇ Generated Prisma client
◇ Ran credential-free validation
│
└─ acme-console is ready.
```

For automation:

```powershell
pnpm dlx create-vibes@latest acme-console `
  --preset standard `
  --billing stripe `
  --rls `
  --catalog `
  --agent-governance `
  --install `
  --git
```

And for complete reproducibility:

```powershell
pnpm dlx create-vibes@latest --config ./vibes.config.json
```

---

# Do Not Ask Questions About Fixed Opinions

A generator is not improved by exposing every implementation detail as a prompt.

Your system is explicitly opinionated. Preserve that.

Bad prompt surface:

```text
Use App Router?
Use TypeScript?
Use strict mode?
Use Zod?
Use DTOs?
Keep Prisma out of components?
Use fetchers for protected reads?
```

Those are architectural invariants, not consumer preferences.

Your philosophy already treats the system as domain architecture with explicit trust boundaries. The layer table assigns routing, orchestration, presentation, reads, writes, authorization, persistence mapping, transactions, integrations, and governance to explicit locations.

Therefore:

```text
Fixed invariant
    ≠ prompt

Supported product variation
    = prompt or preset
```

Good questions include:

- tenant-aware or single-tenant
    
- subscription billing or no billing
    
- Stripe Connect or no Connect
    
- include example project domain or produce empty domain shell
    
- include presentation catalog
    
- include agent governance
    
- initialize Git
    
- install dependencies
    

Even some of those may be better expressed as **presets** rather than 15 prompts.

---

# Presets Before Infinite Customization

Start with three configurations.

## `minimal`

```text
Next.js
TypeScript
Tailwind/shadcn primitives
Zod environment validation
testing and CI
architecture governance
no Clerk
no database
no billing
```

## `standard`

```text
Everything in minimal
Clerk
Neon + Prisma
local application user
organizations/memberships
custom RBAC
PostgreSQL RLS
Stripe subscriptions
webhook ledger
```

## `full`

```text
Everything in standard
Stripe Connect
presentation catalog
expanded reference architecture
release validation suite
agent governance
```

Then add `custom`.

This lowers your test matrix dramatically.

Without presets, ten binary switches theoretically produce:

```text
2^10 = 1,024 configurations
```

You cannot meaningfully verify all of those.

With three supported presets plus a bounded custom mode, you can define a manageable **support envelope**.

---

# Generated-Output Testing

The generator needs two separate test layers.

## Layer 1: generator tests

Test the generator engine itself:

```text
prompt normalization
configuration schema validation
dependency closure
conflict detection
file collision behavior
package manifest merging
deterministic output
failure cleanup
```

## Layer 2: generated-project tests

Generate representative fixtures and run their own validation:

```text
create-vibes --preset minimal
    → install
    → validate:ci

create-vibes --preset standard
    → install
    → validate:ci

create-vibes --preset full
    → install
    → validate:ci
    → connect-removal test
```

Diagram:

```text
generator source
      │
      ├── unit tests
      ├── resolver tests
      └── transformation tests
              │
              ▼
      generated fixtures
              │
              ├── formatting
              ├── linting
              ├── typechecking
              ├── contract tests
              ├── production build
              └── security validation
```

Your existing validation suite becomes the **acceptance contract for generated output**. That is the biggest practical leverage in what you already built.

---

# Static Template vs Dynamic Generator for Vibes

|Concern|Static starter|Dynamic generator|
|---|--:|--:|
|Initial implementation|Low|Medium–high|
|Easy to understand|Strong|Moderate|
|Supports feature choices|Weak|Strong|
|Output combinations|One|Many|
|Drift risk|Low|High|
|Test matrix|Small|Potentially explosive|
|Module removal|Manual|Declarative|
|Upgrade path|Difficult|Still difficult|
|Maintenance burden|Manageable|Significant|

The correct immediate move is **not** to make every subsystem optional.

Use this progression:

```text
Stage 1
Canonical static template

Stage 2
CLI that copies and personalizes canonical template

Stage 3
Three tested presets

Stage 4
A small number of composable modules

Stage 5
Only then consider third-party plugins
```

You are at the end of Stage 1.

---

# What You Can Begin Applying Today

## Phase 1: Wrap the template without changing its architecture

Build the smallest legitimate initializer:

```text
pnpm dlx create-vibes my-app
```

It should:

1. validate the destination
    
2. copy the canonical template
    
3. rename the package
    
4. update generic project metadata
    
5. remove template-only evidence or workbench artifacts
    
6. optionally initialize Git
    
7. optionally install dependencies
    
8. run `validate:fast` or `validate:ci`
    

No module system yet.

This proves packaging, path handling, Windows behavior, cleanup, and generated-output validation.

## Phase 2: Identify variability explicitly

Classify every current Vibes path:

|Classification|Meaning|
|---|---|
|Core|Always generated|
|Optional|Controlled by supported module selection|
|Reference|Available as examples, not active runtime|
|Workbench-only|Never generated|
|Generated metadata|Created specifically per target project|

Do not begin conditional generation until this inventory exists.

## Phase 3: Extract only the clearest module

Stripe Connect is the strongest first candidate because:

- it is already described as optional
    
- it is separate from subscription billing
    
- it has a removal contract
    
- its dependency requirements are visible
    
- it exercises files, environment variables, schema, routes, tests, and documentation
    

That gives you a realistic module system proof without modularizing the entire codebase.

## Phase 4: Add presets

Add `standard` and `full` first. Add `minimal` only after deciding what “minimal” means architecturally.

---

# The Main Architectural Risk

Your greatest risk is not bad CLI code. It is **template-source divergence**.

A common failure mode:

```text
template source
    differs from
generated fixture
    differs from
the application used for actual development
```

Then fixes are applied to only one copy.

Avoid this by choosing one canonical model.

The strongest model for Vibes is:

```text
packages/template-core/template/
            │
            ├── is directly runnable/testable
            └── is the source copied by create-vibes
```

Do not separately maintain:

```text
Vibes application
Vibes template copy
Vibes generated fixture
```

unless one is mechanically derived.

---

# The Second Major Risk: Upgrades

Creation is easy compared with upgrades.

After generation, consumers modify their repositories. A future command such as:

```text
pnpm dlx create-vibes upgrade
```

cannot safely overwrite architecture without understanding user changes.

Treat these as different products:

```text
create-vibes
    Creates a repository once

vibes codemods
    Performs narrow versioned migrations

shared packages
    Deliver reusable runtime behavior through dependencies
```

Do not promise full starter upgrades in the first generator version.

For reusable behavior that must receive ongoing fixes, consider publishing it as a package rather than copying it into every project. But do that selectively; turning all application architecture into framework packages can make the starter harder to understand and customize.

---

# Precise Verdict

You spent those tokens producing something materially valuable, but the result should be evaluated correctly:

> You built a **high-assurance canonical SaaS starter**, not yet a scaffolding generator.

Its key assets are:

- a validated generated-output target
    
- strong layer boundaries
    
- provider and security isolation
    
- optional subsystem precedent
    
- machine-readable governance
    
- reusable presentation taxonomy
    
- credential-free acceptance gates
    

The next thing Codex should build is **not another SaaS template**. It should build a thin, separate `create-vibes` initializer around the existing template, followed by a bounded module and preset system.

The sentence you can use in your notes or when instructing Codex is:

> **Build `create-vibes` as an interactive, package-manager-executable project initializer backed by a deterministic scaffolding generator. Preserve Vibes as the canonical runnable template source, separate generator runtime from generated application code, model optional capabilities as dependency-aware generation modules, and validate representative generated fixtures using the template’s existing credential-free architecture, contract, security, and production-build gates.**