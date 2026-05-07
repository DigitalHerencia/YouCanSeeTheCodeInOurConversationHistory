---
title: Contracts
source: https://chatgpt.com/c/69ee582c-bb58-83e8-8752-8b1ef020886f
created: 05/06/2026
parent:
  - OBSIDIAN
description: How do we decide what bucket something belongs in, what it’s called, and where it lives?
tags:
  - contracts
  - Obsidian
type:
  - system
---
## Core idea

A contract gets its identity from four things:

```txt
scope + project + domain + contract-kind
```

Example:

```txt
project.vouch.payments.settlement-state-machine
project.rateltd.commands.command-registry
project.ctrlplus.visualizer.catalog-pipeline
vault.obsidian.notes.note-taxonomy
```

That becomes the **namespace**.

The file path is just the filesystem version of that namespace.

```txt
PROJECTS/Vouch/contracts/payments/settlement-state-machine.yaml
PROJECTS/RateLtd/contracts/commands/command-registry.yaml
OBSIDIAN/contracts/notes/note-taxonomy.yaml
```

## The terms

### 1. Scope

The level of authority.

```txt
vault       applies to your entire Obsidian system
project     applies to one project
domain      applies to one bounded business/technical area
feature     applies to one feature
module      applies to one implementation module
operation   applies to a workflow, runbook, or Codex execution
reference   reusable knowledge, not project authority
archive     deprecated / historical
```

Examples:

```txt
vault.obsidian.notes.taxonomy
project.vouch.product.positioning
domain.vouch.payments.lifecycle
feature.rateltd.git-diff-viewer.behavior
operation.codex.rateltd.implementation-pass
```

---

### 2. Project

The product or repo boundary.

For you:

```txt
vouch
rateltd
ctrlplus
meatharness
borderpulse
codependentcoding
devnotes
```

Project answers:

> “What product/system owns this truth?”

Example:

```yaml
project: vouch
```

---

### 3. Domain

The area where rules belong together.

A domain is **not just a folder name**. It is a zone of meaning where the same nouns, rules, states, and permissions keep showing up together.

For **Vouch**, domains might be:

```txt
product
identity
users
vouches
payments
payouts
confirmations
settlement
readiness
authz
legal
messaging
dashboard
settings
agent-ops
```

For **RateLtd**, domains might be:

```txt
product
tui-shell
commands
filesystem
repositories
git-diffs
powershell
termcn-ui
monaco
settings
sessions
task-runner
agent-ops
packaging
```

For **CtrlPlus**, domains might be:

```txt
product
tenancy
authz
customers
vehicles
wrap-catalog
visualizer
media
cloudinary
huggingface
billing
dashboard
agent-ops
```

Domain answers:

> “What part of the system does this contract govern?”

---

### 4. Contract kind

The type of truth being defined.

Common contract kinds:

```txt
product-definition
domain-model
state-machine
lifecycle
roles
authz
readiness-gates
acceptance-gates
feature-inventory
route-map
module-spec
data-model
api-contract
event-contract
webhook-contract
integration-contract
ui-contract
copy-contract
test-contract
codex-rules
work-package
verification-checklist
handoff
```

Contract kind answers:

> “What shape of rule is this?”

---

## The naming formula

Use this:

```txt
{scope}.{project}.{domain}.{contract-kind}
```

Examples:

```txt
project.vouch.payments.lifecycle
project.vouch.authz.roles
project.vouch.confirmations.state-machine
project.vouch.readiness.acceptance-gates

project.rateltd.commands.command-registry
project.rateltd.tui-shell.layout-contract
project.rateltd.git-diffs.module-spec
project.rateltd.agent-ops.codex-work-package

project.ctrlplus.visualizer.golden-prototype-contract
project.ctrlplus.wrap-catalog.data-model
project.ctrlplus.media.integration-contract
```

## Matching file paths

Mirror the namespace, but keep folders readable:

```txt
PROJECTS/
  Vouch/
    contracts/
      payments/
        lifecycle.yaml
        settlement-state-machine.yaml
      confirmations/
        confirmation-window.yaml
        pin-fallback.yaml
      authz/
        roles.yaml
        permissions.yaml
      readiness/
        gates.yaml

  RateLtd/
    contracts/
      commands/
        command-registry.yaml
        command-execution.yaml
      tui-shell/
        layout-contract.yaml
        navigation-contract.yaml
      git-diffs/
        module-spec.yaml
      agent-ops/
        codex-work-package.yaml
        verification-checklist.yaml
```

## Example contract header

Every contract should start with the same metadata block:

```yaml
id: project.vouch.payments.settlement-state-machine
kind: state-machine
scope: project
project: vouch
domain: payments
namespace: project.vouch.payments
status: active
authority: source-of-truth
version: 0.1.0

appliesTo:
  routes:
    - app/(tenant)/vouches/[vouchId]/page.tsx
  actions:
    - lib/actions/paymentActions.ts
    - lib/actions/vouchActions.ts
  fetchers:
    - lib/fetchers/paymentFetchers.ts
  schemas:
    - schemas/payment.ts
  types:
    - types/payment.ts

dependsOn:
  - project.vouch.authz.roles
  - project.vouch.readiness.gates
  - project.vouch.confirmations.state-machine

supersedes: []
```

Then the body defines the actual rules:

```yaml
states:
  - pending_authorization
  - authorized
  - confirmation_open
  - dual_confirmed
  - captured
  - voided
  - refunded
  - expired

invariants:
  - Funds must not capture unless both participants confirmed presence.
  - Failed or incomplete confirmation defaults to non-release.
  - Provider state must be reconciled before capture, void, or refund.

transitions:
  authorize:
    from: pending_authorization
    to: authorized
    requires:
      - payer_payment_ready
      - active_vouch
      - terms_accepted

  capture:
    from: dual_confirmed
    to: captured
    requires:
      - payer_confirmed
      - payee_confirmed
      - provider_authorization_valid
      - idempotency_key
```

## The decision rule

When deciding the domain, ask:

```txt
1. What noun is this mostly about?
2. What rules would break if this changed?
3. Which code modules must obey it?
4. Does it define business truth, implementation structure, UI behavior, or agent behavior?
5. Would another project reuse it, or is it project-specific?
```

Examples:

```txt
“Funds release only after both people confirm.”
→ project.vouch.settlement.state-machine

“Payee needs payout readiness before accepting.”
→ project.vouch.readiness.gates

“Codex must not put Prisma in UI components.”
→ project.global.architecture.boundary-rules
or project.vouch.agent-ops.codex-rules

“RateLtd command palette must run real PowerShell commands.”
→ project.rateltd.commands.execution-contract

“TermCN layout regions and navigation behavior.”
→ project.rateltd.tui-shell.layout-contract
```

## Split vs merge rule

Split contracts when:

```txt
- different actors are involved
- different state machines are involved
- different code owners/modules obey them
- one file would become too broad
- rules change at different speeds
```

Merge contracts when:

```txt
- rules always change together
- they describe one lifecycle
- separating them would create duplicate references
- the distinction is only aesthetic
```

Example for Vouch:

```txt
Do not merge:
payments + confirmations + authz

Because:
payments = provider money movement
confirmations = presence signals
authz = who may act

But connect them through dependsOn.
```

## The clean mental model

Think of every contract as having an address:

```txt
project.vouch.payments.lifecycle
```

That address means:

```txt
scope: project
project: vouch
domain: payments
kind: lifecycle
```

Then the path becomes obvious:

```txt
PROJECTS/Vouch/contracts/payments/lifecycle.yaml
```

And the Obsidian title becomes obvious:

```txt
Vouch Payments Lifecycle Contract
```

## The practical standard I’d use for you

For every serious project:

```txt
contracts/
  product/
    definition.yaml
    positioning.yaml
    scope.yaml

  domain/
    model.yaml
    glossary.yaml
    invariants.yaml

  authz/
    roles.yaml
    permissions.yaml

  architecture/
    boundaries.yaml
    route-map.yaml
    data-flow.yaml

  features/
    inventory.yaml
    acceptance-gates.yaml

  agent-ops/
    codex-rules.yaml
    work-packages.yaml
    verification-checklist.yaml
```

Then add domain-specific folders only when the project needs them:

```txt
Vouch:
  payments/
  payouts/
  confirmations/
  readiness/
  settlement/
  legal/

RateLtd:
  tui-shell/
  commands/
  powershell/
  git-diffs/
  filesystem/
  termcn-ui/
  monaco/
```

That is the dot-connecting piece:

> **Domain is the rule boundary. Namespace is the contract’s stable address. File path is the namespace rendered onto disk.**