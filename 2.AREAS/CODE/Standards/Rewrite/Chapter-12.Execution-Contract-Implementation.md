# Chapter 12: Execution Contract

**The Book of Implementation™**

## Placement

This chapter's "golden pattern" is a governance directory structure, not application code — its job is to route intent and evidence to the right files, not to run at request time.

```text
AGENTS.md                     # the directory itself — points to everything below
context/docs/                 # durable, human-owned intent
  architecture.md
  auth.md
  design.md
  prd.md
  tech-requirements.md
context/specs/                # scoped implementation instructions, issue-shaped
  00.architectural-contract.md
  ...
.agents/contracts/            # deterministic, machine-readable translations of the docs above
  product.yaml
  design.yaml
  validation.yaml
.agents/execution/            # mutable, per-session evidence — never product/architecture intent
  decisions.json
  progress.json
  handoff.json
```

## Golden pattern — the governance flow, stated explicitly

```text
Owner intent
    ↓
context/docs        (durable human-readable intent)
    ↓
context/specs        (scoped, issue-shaped build instructions)
    ↓
.agents/contracts     (deterministic machine-readable contract)

Agent work
    ↓
.agents/execution      (mutable evidence: decisions, progress, handoff)
```

## Anatomy

- **`AGENTS.md` itself carries no product, architecture, or design content** — its only job is to say where each kind of information lives, so there's exactly one place to look up "where does X belong," rather than that answer being folklore.
- **`context/docs/` is durable and human-owned** — architecture, auth/tenancy intent, design system, product requirements. This is what changes rarely and requires human authority to change at all.
- **`context/specs/` is scoped, issue-shaped work instruction** — narrower than the docs, meant to describe one unit of implementation work and its acceptance criteria, explicitly stated to never override current explicit owner instruction.
- **`.agents/contracts/` is a deterministic, machine-checkable translation** of the human docs — `product.yaml`, `design.yaml`, `validation.yaml` — the layer an agent (or a CI check) can parse without needing to interpret prose.
- **`.agents/execution/` is the only mutable layer**, and it's explicitly evidence, not intent: `decisions.json` (what was decided during the work), `progress.json` (what was done and what evidence backs it), `handoff.json` (state for the next session to pick up from) — separated because a decision, a status, and a continuation point are three different kinds of fact with different lifetimes.

## Real worked example

This is the live `AGENTS.md` from the maximal template, in full — not excerpted, because the whole point of this chapter is that the structure itself is the pattern:

```text
# The Maximal Template™ — Governance Directory

This file is the directory for repository governance.

It does not define product requirements, architecture, design rules,
implementation instructions, validation policy, or execution state.
Those responsibilities belong to the files listed below.

## Human-readable intent
context/docs/ contains the durable human-readable description of the
product and implemented system: architecture.md, auth.md, design.md,
prd.md, tech-requirements.md.

## Build instructions
context/specs/ contains scoped implementation instructions formatted
as issues. Specs describe implementation work and acceptance criteria.
They do not override current explicit owner instruction.

## Machine-readable contracts
.agents/contracts/ contains deterministic machine-readable translations
of human intent: product.yaml, design.yaml, validation.yaml.
Contracts translate the human governance. They do not create
independent product intent.

## Codex execution state
.agents/execution/ contains mutable Codex execution records:
decisions.json, progress.json, handoff.json.
Execution files record actions and evidence. They do not define
product, architecture, or design requirements.

## Governance relationship
Owner intent → context/docs → context/specs → .agents/contracts
Codex work → .agents/execution
When clarification of intent is required, the owner is the source of truth.
```

## Golden pattern — the evidence-state contract itself

```yaml
execution:
  read_before_change:
    - active-specification
    - architecture
    - security
    - affected-lifecycle
    - affected-code-and-tests
  implement: smallest-contract-compliant-change
  evidence_states: [executed, skipped, blocked, inferred]
  evidence_scope:
    exact_artifact: required
    exact_property: required
    filtered_result_is_not: repository-wide-pass
    unrelated_baseline_failure_is_not: changed-scope-failure
  forbidden:
    - manufacture-evidence
    - silently-change-authority
    - expose-secrets
    - weaken-security-without-approval
  completion:
    - scope-implemented
    - public-contracts-synchronized
    - required-evidence-recorded
    - known-critical-contradictions-resolved
```

## Forbidden variants (enforced, not just documented)

- **No product/architecture content written into `.agents/execution/`.** That directory is evidence about work done, never a place where new requirements get decided.
- **No spec in `context/specs/` overriding a direct, current instruction from the owner.** Specs describe scoped work; they don't outrank the person who owns the product.
- **No evidence reported as `executed` when it was actually `inferred`, `skipped`, or `blocked`.** Each of the four states is a distinct claim; picking the more confident-sounding one when the honest one is less flattering defeats the entire point of the vocabulary.
- **No repository-wide claim from a filtered/scoped result, and no changed-scope blame assigned to a pre-existing unrelated failure.**

## Checklist

- [ ] Relevant `context/docs/` and `context/specs/` files read before any change is made
- [ ] Change scoped to the smallest contract-compliant diff
- [ ] Every verification claim tagged with its true evidence state (executed/skipped/blocked/inferred), naming the exact artifact and property checked
- [ ] No filtered result generalized to a full-repository pass
- [ ] Anything touching privileged routes, tenant/auth/RLS/idempotency guarantees, secrets, or irreversible migrations flagged for human escalation, not resolved unilaterally
