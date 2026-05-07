Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path ".obsidian")) {
  throw "Run this from the DevNotes vault root."
}

function Ensure-Dir {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    New-Item -ItemType Directory -Force -Path $Path | Out-Null
    Write-Host "DIR + $Path" -ForegroundColor Green
  }
}

function Write-Template {
  param(
    [string]$FileName,
    [string]$Title,
    [string]$Kind,
    [string]$Purpose,
    [string]$UseWhen,
    [string[]]$Sections,
    [string[]]$Checks
  )

  $dir = "90 OBSIDIAN/OB-Templates/Contracts"
  Ensure-Dir $dir
  $path = Join-Path $dir $FileName

  if (Test-Path -LiteralPath $path) {
    Write-Host "SKIP exists: $path" -ForegroundColor Yellow
    return
  }

  $sectionText = ($Sections | ForEach-Object { "## $_`n`n- `n" }) -join "`n"
  $checkText = ($Checks | ForEach-Object { "- [ ] $_" }) -join "`n"

  $content = @"
---
title: "<% tp.file.title %>"
type: contract
scope: project
project:
domain:
artifact:
kind: $Kind
namespace:
status: draft
authority: source-of-truth
parent:
depends_on: []
supersedes: []
tags:
  - contracts/$Kind
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## Contract Kind

$Kind

## Purpose

$Purpose

## Use This Template When

$UseWhen

## Authority

This document is a contract. It defines source-of-truth rules that implementation, prompts, tests, and future documentation must obey until this contract is superseded.

## Scope

### Governs

- 
- 
- 

### Does Not Govern

- 
- 
- 

## Non-Negotiable Rules

1. 
2. 
3. 

## Required Invariants

- 
- 
- 

$sectionText

## Dependencies

| Dependency | Type | Reason |
|---|---|---|
|  |  |  |

## Implementation References

| Area | Path / Link | Notes |
|---|---|---|
| Routes |  |  |
| Actions |  |  |
| Fetchers |  |  |
| Components |  |  |
| Schemas |  |  |
| Types |  |  |
| Data |  |  |
| Tests |  |  |

## Failure Modes

| Failure | Cause | Required Handling |
|---|---|---|
|  |  |  |

## Acceptance Criteria

$checkText

## Verification Checklist

- [ ] Namespace is correct.
- [ ] Scope is explicit.
- [ ] Domain boundary is clear.
- [ ] Rules are testable.
- [ ] Forbidden behavior is documented.
- [ ] Dependencies are linked.
- [ ] Implementation references are listed.
- [ ] This contract does not duplicate another active source-of-truth note.

## Open Questions

- 

## Changelog

| Date | Change | Reason |
|---|---|---|
| <% tp.date.now("YYYY-MM-DD") %> | Created | Initial draft |
"@

  $content | Set-Content -LiteralPath $path -Encoding UTF8
  Write-Host "WRITE $path" -ForegroundColor Cyan
}

$templates = @(
  @{
    FileName = "product-definition.contract.md"
    Title = "Product Definition Contract"
    Kind = "product-definition"
    Purpose = "Defines what the product is, who it serves, what it refuses to be, and what success means."
    UseWhen = "You need a durable source of truth for the product identity, positioning, scope, user promise, and non-goals."
    Sections = @("Product Definition","Target Users","Core Promise","Non-Goals","Success Conditions","Positioning Boundaries")
    Checks = @("Product identity is clear.","Target users are defined.","Non-goals prevent scope drift.","Success can be evaluated.")
  },
  @{
    FileName = "domain-model.contract.md"
    Title = "Domain Model Contract"
    Kind = "domain-model"
    Purpose = "Defines the canonical nouns, entities, relationships, invariants, and vocabulary of a domain."
    UseWhen = "The same nouns keep appearing across code, docs, prompts, database models, routes, and UI states."
    Sections = @("Domain Vocabulary","Entities","Relationships","Invariants","Forbidden Interpretations","Glossary")
    Checks = @("Domain nouns are canonical.","Entity relationships are explicit.","Invariants are documented.","Ambiguous terms are resolved.")
  },
  @{
    FileName = "state-machine.contract.md"
    Title = "State Machine Contract"
    Kind = "state-machine"
    Purpose = "Defines allowed states, transitions, guards, terminal states, invalid transitions, and reconciliation behavior."
    UseWhen = "A workflow can move between states and invalid transitions would create bugs, money risk, trust risk, or data corruption."
    Sections = @("States","Initial State","Terminal States","Transitions","Transition Guards","Invalid Transitions","Reconciliation Rules")
    Checks = @("Every state is defined.","Every transition has from/to states.","Guards are explicit.","Invalid transitions are named.")
  },
  @{
    FileName = "lifecycle.contract.md"
    Title = "Lifecycle Contract"
    Kind = "lifecycle"
    Purpose = "Defines the end-to-end lifecycle of a domain object, workflow, user journey, or operational process."
    UseWhen = "You need to describe what happens from creation to completion, expiration, archive, or failure."
    Sections = @("Lifecycle Overview","Creation","Active Phase","Mutation Rules","Completion","Expiration","Archive Rules")
    Checks = @("Lifecycle start is defined.","Lifecycle end states are defined.","Mutation rules are explicit.","Failure paths are included.")
  },
  @{
    FileName = "roles.contract.md"
    Title = "Roles Contract"
    Kind = "roles"
    Purpose = "Defines actors, responsibilities, capabilities, forbidden actions, and role-specific expectations."
    UseWhen = "Multiple actors use the system and each actor needs a clear responsibility and permission boundary."
    Sections = @("Actors","Role Responsibilities","Role Capabilities","Forbidden Actions","Role Conflicts","Role-Specific UI Rules")
    Checks = @("Each role has a clear purpose.","Allowed actions are listed.","Forbidden actions are listed.","Role conflicts are handled.")
  },
  @{
    FileName = "authz.contract.md"
    Title = "AuthZ Contract"
    Kind = "authz"
    Purpose = "Defines permission boundaries, guards, access rules, ownership checks, and authorization verification."
    UseWhen = "A route, action, fetcher, object, or workflow needs explicit rules for who can do what and when."
    Sections = @("Authorization Model","Access Rules","Ownership Rules","Route Guards","Action Guards","Fetcher Guards","Test Cases")
    Checks = @("Access rules are explicit.","Ownership checks are documented.","Server-side enforcement is required.","Bypass paths are named.")
  },
  @{
    FileName = "readiness-gates.contract.md"
    Title = "Readiness Gates Contract"
    Kind = "readiness-gates"
    Purpose = "Defines prerequisites that must be satisfied before a user, account, object, or workflow can proceed."
    UseWhen = "The system must block, warn, or redirect based on setup state, verification state, or provider readiness."
    Sections = @("Gate Overview","Required Gates","Blocking Conditions","Warning Conditions","Bypass Rules","UI Messaging","Recheck Rules")
    Checks = @("All gates are named.","Blocking behavior is clear.","User-facing messaging is defined.","Recheck behavior is specified.")
  },
  @{
    FileName = "acceptance-gates.contract.md"
    Title = "Acceptance Gates Contract"
    Kind = "acceptance-gates"
    Purpose = "Defines objective completion criteria for features, workflows, releases, migrations, or agent work packages."
    UseWhen = "You need to prevent vague completion claims and require verifiable evidence before work is accepted."
    Sections = @("Acceptance Summary","Functional Gates","Data Gates","UI Gates","Security Gates","Test Gates","Release Gates")
    Checks = @("Acceptance gates are measurable.","Required evidence is listed.","Failure means not done.","Release blockers are explicit.")
  },
  @{
    FileName = "feature-inventory.contract.md"
    Title = "Feature Inventory Contract"
    Kind = "feature-inventory"
    Purpose = "Defines the canonical list of features, status, ownership, dependencies, and required behavior."
    UseWhen = "A project has multiple features and you need one source of truth for scope, status, and dependencies."
    Sections = @("Feature Catalog","Feature Status","Required Features","Deferred Features","Dependencies","Completion Rules","Cut Lines")
    Checks = @("Every feature has a status.","Required vs deferred is clear.","Dependencies are documented.","Scope cut lines exist.")
  },
  @{
    FileName = "route-map.contract.md"
    Title = "Route Map Contract"
    Kind = "route-map"
    Purpose = "Defines application routes, ownership, page intent, auth requirements, params, search params, and data dependencies."
    UseWhen = "Routes need to remain thin, intentional, protected, and aligned with feature/domain ownership."
    Sections = @("Route Catalog","Route Ownership","Auth Requirements","Params","Search Params","Data Dependencies","Redirect Rules")
    Checks = @("Each route has an owner.","Auth behavior is documented.","Params are named.","Data dependencies are listed.")
  },
  @{
    FileName = "module-spec.contract.md"
    Title = "Module Spec Contract"
    Kind = "module-spec"
    Purpose = "Defines module boundaries, responsibilities, imports, exports, dependency rules, and forbidden coupling."
    UseWhen = "You need to keep a codebase from drifting into tangled imports, mixed responsibilities, or unclear ownership."
    Sections = @("Module Purpose","Owned Responsibilities","Public Interface","Allowed Imports","Forbidden Imports","Data Flow","Boundary Tests")
    Checks = @("Module responsibility is clear.","Allowed imports are defined.","Forbidden imports are defined.","Public API is documented.")
  },
  @{
    FileName = "data-model.contract.md"
    Title = "Data Model Contract"
    Kind = "data-model"
    Purpose = "Defines entities, fields, relationships, enums, indexes, constraints, DTO mappings, and persistence rules."
    UseWhen = "Database shape, transport shape, and business rules need to agree before implementation."
    Sections = @("Entities","Fields","Enums","Relationships","Indexes","Constraints","DTO Mapping","Migration Notes")
    Checks = @("Entities are listed.","Critical fields are defined.","Relationships are explicit.","DTO mapping is included.")
  },
  @{
    FileName = "api-contract.contract.md"
    Title = "API Contract"
    Kind = "api-contract"
    Purpose = "Defines endpoints, request contracts, response contracts, errors, auth, idempotency, and integration behavior."
    UseWhen = "A system boundary exposes or consumes HTTP APIs, server actions, RPC-like operations, or provider calls."
    Sections = @("Endpoint Catalog","Requests","Responses","Errors","Auth","Idempotency","Rate Limits","Examples")
    Checks = @("Requests are defined.","Responses are defined.","Errors are defined.","Auth requirements are explicit.")
  },
  @{
    FileName = "event-contract.contract.md"
    Title = "Event Contract"
    Kind = "event-contract"
    Purpose = "Defines events, producers, consumers, payloads, ordering expectations, idempotency, replay, and failure handling."
    UseWhen = "State changes are emitted, consumed, audited, replayed, or used to trigger downstream workflows."
    Sections = @("Event Catalog","Producers","Consumers","Payloads","Ordering","Idempotency","Replay Rules","Failure Handling")
    Checks = @("Events are named.","Payloads are defined.","Consumers are listed.","Idempotency is addressed.")
  },
  @{
    FileName = "webhook-contract.contract.md"
    Title = "Webhook Contract"
    Kind = "webhook-contract"
    Purpose = "Defines inbound and outbound webhook events, verification, retry behavior, reconciliation, and failure recovery."
    UseWhen = "External providers or internal services send asynchronous event notifications."
    Sections = @("Webhook Catalog","Verification","Payloads","Retry Rules","Idempotency","Reconciliation","Failure Handling","Security")
    Checks = @("Webhook verification is required.","Retry behavior is clear.","Idempotency is defined.","Reconciliation rules exist.")
  },
  @{
    FileName = "integration-contract.contract.md"
    Title = "Integration Contract"
    Kind = "integration-contract"
    Purpose = "Defines provider responsibilities, credentials, data mapping, flows, failures, reconciliation, and operational boundaries."
    UseWhen = "The project depends on an external service like Stripe, Clerk, Cloudinary, Hugging Face, Vercel, or GitHub."
    Sections = @("Provider Role","Credential Model","User Flow","Data Mapping","Failure Modes","Reconciliation","Operational Limits","Security")
    Checks = @("Provider role is clear.","Credential handling is defined.","Failure modes are listed.","Reconciliation is specified.")
  },
  @{
    FileName = "ui-contract.contract.md"
    Title = "UI Contract"
    Kind = "ui-contract"
    Purpose = "Defines visible states, user interactions, empty/loading/error states, responsive behavior, and accessibility expectations."
    UseWhen = "A page, component, or flow needs consistent visual and behavioral rules."
    Sections = @("UI Purpose","Visible States","Interactions","Empty State","Loading State","Error State","Responsive Behavior","Accessibility")
    Checks = @("Visible states are listed.","Interaction behavior is clear.","Error states are defined.","Accessibility expectations exist.")
  },
  @{
    FileName = "copy-contract.contract.md"
    Title = "Copy Contract"
    Kind = "copy-contract"
    Purpose = "Defines product language, labels, messages, forbidden claims, legal boundaries, and terminology consistency."
    UseWhen = "Words matter for trust, compliance, conversion, onboarding, or product positioning."
    Sections = @("Voice Rules","Approved Terms","Forbidden Terms","UI Copy","Legal-Sensitive Copy","Error Messages","Empty States","Examples")
    Checks = @("Approved language is listed.","Forbidden claims are listed.","Legal-sensitive copy is marked.","Examples are included.")
  },
  @{
    FileName = "test-contract.contract.md"
    Title = "Test Contract"
    Kind = "test-contract"
    Purpose = "Defines test coverage requirements, regression checks, fixtures, mocks, acceptance tests, and verification workflow."
    UseWhen = "A feature or domain must be protected by repeatable tests before it can be considered shippable."
    Sections = @("Coverage Requirements","Unit Tests","Integration Tests","E2E Tests","Fixtures","Regression Cases","Manual QA","Release Verification")
    Checks = @("Coverage requirements are explicit.","Regression cases are listed.","Manual QA exists where needed.","Release verification is concrete.")
  },
  @{
    FileName = "codex-rules.contract.md"
    Title = "Codex Rules Contract"
    Kind = "codex-rules"
    Purpose = "Defines agent execution rules, boundaries, stop conditions, verification requirements, and forbidden shortcuts."
    UseWhen = "Codex or another agent will modify code, docs, prompts, schemas, workflows, or repo structure."
    Sections = @("Execution Rules","Allowed Changes","Forbidden Changes","Boundary Rules","Stop Conditions","Verification Requirements","Reporting Format","Failure Handling")
    Checks = @("Allowed work is explicit.","Forbidden work is explicit.","Stop conditions exist.","Verification is mandatory.")
  },
  @{
    FileName = "work-package.contract.md"
    Title = "Work Package Contract"
    Kind = "work-package"
    Purpose = "Defines a bounded implementation job with objective scope, inputs, outputs, constraints, and completion evidence."
    UseWhen = "You need to hand a precise job to Codex, ChatGPT, or future-you without losing intent."
    Sections = @("Objective","Context","Inputs","Expected Outputs","Constraints","Step Plan","Verification","Completion Report")
    Checks = @("Objective is bounded.","Inputs are listed.","Outputs are concrete.","Completion evidence is required.")
  },
  @{
    FileName = "verification-checklist.contract.md"
    Title = "Verification Checklist Contract"
    Kind = "verification-checklist"
    Purpose = "Defines concrete checks required before accepting a change, release, refactor, migration, or generated output."
    UseWhen = "You need a final gate that prevents wishful thinking, incomplete execution, or silent drift."
    Sections = @("Verification Scope","Functional Checks","Architecture Checks","Security Checks","Data Checks","UI Checks","Test Checks","Release Checks")
    Checks = @("Checks are concrete.","Each check can pass or fail.","Critical blockers are named.","Evidence requirements are included.")
  },
  @{
    FileName = "handoff.contract.md"
    Title = "Handoff Contract"
    Kind = "handoff"
    Purpose = "Defines current state, completed work, remaining work, blockers, risks, assumptions, and next operator instructions."
    UseWhen = "Work is being paused, transferred, resumed later, or handed from one agent/operator/session to another."
    Sections = @("Current State","Completed Work","Remaining Work","Known Blockers","Risks","Assumptions","Next Actions","Recovery Instructions")
    Checks = @("Current state is clear.","Completed work is listed.","Remaining work is actionable.","Next actions are explicit.")
  }
)

foreach ($template in $templates) {
  Write-Template `
    -FileName $template.FileName `
    -Title $template.Title `
    -Kind $template.Kind `
    -Purpose $template.Purpose `
    -UseWhen $template.UseWhen `
    -Sections $template.Sections `
    -Checks $template.Checks
}

Write-Host ""
Write-Host "PASS 3B COMPLETE" -ForegroundColor Green
git status --short