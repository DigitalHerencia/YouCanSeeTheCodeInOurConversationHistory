---
title: File Types for Documentation
source: https://chatgpt.com/c/69ee582c-bb58-83e8-8752-8b1ef020886f
created: 05/06/2026
parent:
description: "note/file archetypes: recurring documentation objects like PRDs, contracts, prompts, specs, ADRs, handoff docs, etc."
tags: []
type:
  - system
---
([Past chat](https://chatgpt.com/c/69fa5004-f568-83e8-8fed-4491eaa56e9d "TUI Integration Strategy"))([Past chat](https://chatgpt.com/c/69fae44f-dcc8-83e8-b78e-c8ab98426f7d "Codex Prep for Stripe"))([Gmail](https://mail.google.com/mail/#all/19ddfc58bc7cc43e "Codex Product Update: GPT-5.5 and more ways to work with Codex"))([Gmail](https://mail.google.com/mail/#all/19dc225d3e8e1bcc "Introducing GPT-5.5"))([Gmail](https://mail.google.com/mail/#all/19d45c94a9b5f21e "OpenAI Dev News: GPT-5.4, Plugins in Codex, and other fun things"))([Gmail](https://mail.google.com/mail/#all/19d8e072981d11cb "Dart launches Custom Agents🚀"))([Gmail](https://mail.google.com/mail/#all/19d450f732f61af7 "Dart Update: Agent comments, cover images, and dictation polish"))([Gmail](https://mail.google.com/mail/#all/19cd40bb8a060461 "Agent workspaces, GitHub copilot, and fullscreen chat"))([Gmail](https://mail.google.com/mail/#all/19b23645022e38ec "[Task Update] Lunchtime tutorials with action prompts"))([Gmail](https://mail.google.com/mail/#all/19b203ff80abc1ab "Getting the most out of Notion AI"))([Files](file://my_files/file_000000003d3c722f8653d899c4090d76 "Pasted markdown.md"))([Files](file://my_files/file_00000000268071f78a377659996a6461 "codebase-export-2026-04-25 (1).md"))([Files](file://my_files/file_00000000505071f7a3c23892640c447d "codebase-export-2026-04-25.md"))

Yeah, I get exactly what you mean.

You’re asking for  For your work, Obsidian should become less “notes app” and more **personal product/engineering knowledge base**.

A good organizing principle:

> **Every file should either capture intent, define a contract, explain a decision, guide execution, record state, or preserve reusable knowledge.**

Modern documentation practice also supports this split: Diátaxis separates docs into tutorials, how-to guides, reference, and explanation; ADR practice separates durable decisions from general docs; OpenAPI formalizes machine-readable API contracts; GitHub community files establish common repo-level documentation conventions. ([diataxis.fr](https://diataxis.fr/?utm_source=chatgpt.com "Diátaxis"))

## The main file types you commonly generate

### 1. Product / business intent files

These explain **what the product is and why it exists**.

Common types:

- **Product Brief**
    
- **PRD**
    
- **MVP Scope**
    
- **Feature Brief**
    
- **User Stories**
    
- **User Flows**
    
- **Launch Copy**
    
- **Positioning Memo**
    
- **ICP / Persona Notes**
    
- **Market Thesis**
    
- **Competitor Analysis**
    
- **Pricing Model**
    
- **Monetization Plan**
    
- **Risk Register**
    
- **Roadmap**
    
- **Release Criteria**
    
- **Go-to-Market Plan**
    
- **Demo Script**
    
- **Pitch Notes**
    
- **Naming / Branding Notes**
    
- **Design Principles**
    

For your projects, these are the human-facing “why/what” layer.

Example names:

```txt
prd.md
mvp-scope.md
user-flows.md
launch-copy.md
pricing-model.md
positioning.md
risk-register.md
roadmap.md
```

---

### 2. Domain model / contract files

These are some of your most important files. They define the **truth of the system**.

Common types:

- **Domain Model**
    
- **Domain Contract**
    
- **Entity Catalog**
    
- **Relationship Map**
    
- **State Machine**
    
- **Lifecycle Contract**
    
- **Role Contract**
    
- **Permission Contract**
    
- **Authorization Matrix**
    
- **Readiness Gates**
    
- **Acceptance Gates**
    
- **Business Rules**
    
- **Invariant List**
    
- **Validation Rules**
    
- **Error Taxonomy**
    
- **Workflow Contract**
    
- **Event Contract**
    
- **Audit Contract**
    
- **Analytics Contract**
    
- **Notification Contract**
    
- **Billing Contract**
    
- **Integration Contract**
    

Example names:

```txt
domain-model.md
domain-contract.md
roles.md
authz-matrix.md
state-machine.md
readiness-gates.md
acceptance-gates.md
business-rules.md
analytics-contract.md
billing-contract.md
```

For your `.agents/contracts` style, many of these can also exist as machine-readable YAML:

```txt
domain-model.yaml
roles.yaml
authz.yaml
routes.yaml
features.yaml
analytics.yaml
acceptance-gates.yaml
```

---

### 3. Architecture / engineering design files

These explain **how the system is built**.

Common types:

- **System Architecture Overview**
    
- **Technical Requirements Document**
    
- **Architecture Decision Record**
    
- **Architecture Decision Log**
    
- **Data Flow Diagram Note**
    
- **Service Boundary Spec**
    
- **Module Boundary Spec**
    
- **Layering Rules**
    
- **Server/Client Boundary Rules**
    
- **Database Architecture**
    
- **Auth Architecture**
    
- **Payment Architecture**
    
- **Cache Strategy**
    
- **Queue / Job Strategy**
    
- **Webhook Strategy**
    
- **Error Handling Strategy**
    
- **Observability Strategy**
    
- **Security Model**
    
- **Deployment Architecture**
    
- **Environment Strategy**
    
- **Scalability Notes**
    
- **Migration Plan**
    
- **Refactor Plan**
    
- **Dependency Analysis**
    

ADRs are especially useful because they capture one significant decision, the context, the alternatives rejected, and the consequences. ([AWS Documentation](https://docs.aws.amazon.com/prescriptive-guidance/latest/architectural-decision-records/adr-process.html?utm_source=chatgpt.com "ADR process - AWS Prescriptive Guidance"))

Example names:

```txt
architecture-overview.md
technical-requirements.md
adr-0001-use-neon-postgres.md
adr-0002-use-clerk-auth.md
server-client-boundaries.md
cache-strategy.md
webhook-strategy.md
deployment-architecture.md
```

---

### 4. Feature implementation files

These bridge product intent and actual code.

Common types:

- **Feature Spec**
    
- **Feature Contract**
    
- **Feature Work Package**
    
- **Implementation Plan**
    
- **Route Spec**
    
- **Page Spec**
    
- **Component Spec**
    
- **Form Spec**
    
- **Action Spec**
    
- **Fetcher Spec**
    
- **DTO Spec**
    
- **Schema Spec**
    
- **Validation Spec**
    
- **Empty State Spec**
    
- **Loading State Spec**
    
- **Error State Spec**
    
- **Permission Behavior Spec**
    
- **Test Plan**
    
- **QA Checklist**
    
- **Demo Checklist**
    
- **Completion Report**
    

Example names:

```txt
feature-vouch-create-flow.md
feature-payment-setup.md
route-spec.md
component-spec.md
form-spec.md
action-spec.md
fetcher-spec.md
dto-spec.md
qa-checklist.md
completion-report.md
```

For your stack, this is where I’d explicitly map:

```txt
app route → feature shell → fetchers/actions → schemas → types → db/selects → db/transactions
```

---

### 5. Agent / Codex / automation files

This is a category you use more than most people, and it deserves first-class treatment.

Common types:

- **Agent Instructions**
    
- **Codex Mega Prompt**
    
- **Codex Work Package**
    
- **Patch Prompt**
    
- **Audit Prompt**
    
- **Refactor Prompt**
    
- **Enforcement Prompt**
    
- **Bugfix Prompt**
    
- **Handoff Prompt**
    
- **Repo Orientation Prompt**
    
- **Scaffold Prompt**
    
- **Implementation Contract**
    
- **Stop Conditions**
    
- **Verification Checklist**
    
- **Post-Run Report Template**
    
- **Regression Sweep Prompt**
    
- **Prompt Changelog**
    
- **Known Agent Failure Modes**
    
- **Tooling Instructions**
    
- **MCP Setup Notes**
    
- **Model Usage Strategy**
    
- **Rate Limit Strategy**
    

Example names:

```txt
codex-work-package.md
codex-mega-prompt.md
post-refactor-audit-prompt.md
boundary-enforcement-prompt.md
handoff-prompt.md
agent-instructions.md
stop-conditions.md
verification-checklist.md
known-agent-failures.md
```

Your `.agents` structure already points toward this split:

```txt
.agents/docs/          human intent
.agents/contracts/     machine-readable truth
.agents/instructions/  agent interpretation rules
.agents/execution/     state, reports, backlog, handoff
.agents/prompts/       reusable agent commands
```

That is worth preserving.

---

### 6. Repo / project governance files

These define how the project is maintained.

Common types:

- **README**
    
- **Contributing Guide**
    
- **Security Policy**
    
- **Support Policy**
    
- **License Notes**
    
- **Code of Conduct**
    
- **Changelog**
    
- **Release Notes**
    
- **Issue Template**
    
- **Pull Request Template**
    
- **Branching Strategy**
    
- **Commit Convention**
    
- **Definition of Done**
    
- **Definition of Ready**
    
- **Engineering Standards**
    
- **Review Checklist**
    
- **Testing Policy**
    
- **Deprecation Policy**
    

GitHub treats files like README, LICENSE, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, and SUPPORT as common “community health” files for repositories. ([GitHub Docs](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/about-community-profiles-for-public-repositories?utm_source=chatgpt.com "About community profiles for public repositories"))

Example names:

```txt
readme-notes.md
contributing.md
security-policy.md
support-policy.md
changelog.md
release-notes.md
pull-request-template.md
definition-of-done.md
engineering-standards.md
```

---

### 7. API / integration files

These define external and internal boundaries.

Common types:

- **API Contract**
    
- **OpenAPI Spec**
    
- **Endpoint Catalog**
    
- **Webhook Contract**
    
- **Webhook Event Matrix**
    
- **Provider Integration Spec**
    
- **Stripe Integration Spec**
    
- **Clerk Integration Spec**
    
- **External Service Mapping**
    
- **Request / Response DTO Catalog**
    
- **Error Response Catalog**
    
- **Idempotency Strategy**
    
- **Rate Limit Contract**
    
- **Secrets / Env Var Matrix**
    
- **OAuth Flow Notes**
    
- **Provider Return URL Spec**
    
- **Reconciliation Strategy**
    

OpenAPI is the major standard for describing HTTP APIs in a way that both humans and tooling can understand. ([Swagger](https://swagger.io/specification/?utm_source=chatgpt.com "OpenAPI Specification - Version 3.1.0"))

Example names:

```txt
api-contract.md
openapi.yaml
endpoint-catalog.md
webhook-contract.md
stripe-integration.md
clerk-integration.md
provider-return-flows.md
idempotency-strategy.md
env-var-matrix.md
```

---

### 8. Database / data model files

These are critical for your Prisma + Postgres work.

Common types:

- **Schema Notes**
    
- **Entity Relationship Notes**
    
- **Table Catalog**
    
- **Field Dictionary**
    
- **Enum Catalog**
    
- **Index Strategy**
    
- **Constraint Strategy**
    
- **Migration Plan**
    
- **Seed Data Plan**
    
- **Transaction Contract**
    
- **Query Shape Catalog**
    
- **Select Shape Catalog**
    
- **DTO Mapping Notes**
    
- **Tenant Isolation Rules**
    
- **Data Retention Policy**
    
- **Audit Log Model**
    
- **Soft Delete Policy**
    
- **Backfill Plan**
    
- **Reconciliation Query Notes**
    

Example names:

```txt
database-model.md
table-catalog.md
enum-catalog.md
index-strategy.md
migration-plan.md
transaction-contracts.md
query-shapes.md
select-shapes.md
tenant-isolation.md
audit-log-model.md
```

---

### 9. UX / UI / design system files

These define how the product feels and behaves.

Common types:

- **Design System**
    
- **Component Inventory**
    
- **Component Contract**
    
- **Page Inventory**
    
- **Layout Spec**
    
- **Interaction Spec**
    
- **Visual Language**
    
- **Brand System**
    
- **Copy System**
    
- **Empty State Catalog**
    
- **Loading State Catalog**
    
- **Error State Catalog**
    
- **Responsive Behavior Spec**
    
- **Accessibility Checklist**
    
- **Navigation Model**
    
- **Information Architecture**
    
- **User Journey Map**
    
- **Wireframe Notes**
    
- **Mockup Analysis**
    
- **Golden Prototype Notes**
    

Example names:

```txt
design-system.md
component-inventory.md
component-contracts.md
visual-language.md
copy-system.md
empty-states.md
error-states.md
navigation-model.md
golden-prototypes.md
mockup-analysis.md
```

For your current workflow, “golden prototype notes” are important because you often identify one page/component set as the new standard and then refactor everything else toward it.

---

### 10. Testing / QA files

These convert “it seems done” into “it is verifiably done.”

Common types:

- **Test Plan**
    
- **Unit Test Matrix**
    
- **Integration Test Matrix**
    
- **E2E Test Plan**
    
- **Regression Checklist**
    
- **Smoke Test Checklist**
    
- **Acceptance Test Checklist**
    
- **Manual QA Script**
    
- **Edge Case Catalog**
    
- **Bug Reproduction Note**
    
- **Bug Triage Note**
    
- **Fix Verification Note**
    
- **Known Issues**
    
- **Failure Mode Catalog**
    
- **Pre-Launch Checklist**
    
- **Post-Deploy Verification**
    

Example names:

```txt
test-plan.md
unit-test-matrix.md
e2e-test-plan.md
regression-checklist.md
manual-qa-script.md
edge-cases.md
bug-reproduction.md
known-issues.md
pre-launch-checklist.md
```

---

### 11. Operations / execution files

These are “what is happening right now?”

Common types:

- **Project Status**
    
- **Execution Log**
    
- **Daily Build Log**
    
- **Sprint Plan**
    
- **Backlog**
    
- **Task Matrix**
    
- **Decision Log**
    
- **Progress Report**
    
- **Handoff Report**
    
- **Blocker Log**
    
- **Risk Log**
    
- **Dependency Log**
    
- **Release Checklist**
    
- **Deployment Runbook**
    
- **Incident Report**
    
- **Postmortem**
    
- **Maintenance Plan**
    
- **Archive Note**
    

Example names:

```txt
project-status.md
execution-log.md
daily-build-log.md
backlog.md
task-matrix.md
decision-log.md
progress-report.md
handoff.md
blocker-log.md
deployment-runbook.md
postmortem.md
```

Your `.agents/execution` pattern maps well here:

```txt
backlog.json
decisions.json
progress.json
handoff.json
validation.json
```

---

### 12. Learning / reference files

These are reusable knowledge notes, not tied to one project.

Common types:

- **Concept Note**
    
- **Pattern Note**
    
- **Anti-Pattern Note**
    
- **Library Notes**
    
- **Framework Notes**
    
- **Tool Notes**
    
- **CLI Cheat Sheet**
    
- **Debugging Notes**
    
- **Error Encyclopedia**
    
- **Snippet Library**
    
- **Command Cookbook**
    
- **Research Summary**
    
- **Comparison Note**
    
- **Glossary**
    
- **Terminology Map**
    
- **Reading Notes**
    
- **Source Notes**
    

Example names:

```txt
nextjs-rsc-patterns.md
prisma-transaction-patterns.md
stripe-connect-notes.md
clerk-auth-patterns.md
powershell-cheatsheet.md
termcn-reference.md
error-encyclopedia.md
command-cookbook.md
glossary.md
```

---

### 13. Obsidian-specific meta files

These make the vault useful instead of becoming a pile of markdown.

Common types:

- **MOC — Map of Content**
    
- **Project Index**
    
- **Domain Index**
    
- **Feature Index**
    
- **Prompt Index**
    
- **Decision Index**
    
- **Glossary Index**
    
- **Template Index**
    
- **Backlink Hub**
    
- **Inbox**
    
- **Scratchpad**
    
- **Capture Note**
    
- **Permanent Note**
    
- **Archive Index**
    

Example names:

```txt
MOC - Projects.md
MOC - Vouch.md
MOC - RateLtd.md
MOC - Architecture.md
MOC - Prompts.md
MOC - Decisions.md
MOC - Templates.md
Inbox.md
Scratchpad.md
```

This is probably the biggest unlock for you in Obsidian. You do not need to backlink everything. Just backlink the durable nouns:

```txt
[[Vouch]]
[[RateLtd]]
[[Stripe Connect]]
[[Clerk]]
[[Domain Model]]
[[AuthZ]]
[[ADR]]
[[Codex Work Package]]
[[Payment Readiness]]
[[TermCN]]
```

---

## The most valuable master list for you

Here is the clean taxonomy I’d use for your vault.

```txt
00 Inbox
- Inbox Note
- Scratchpad
- Raw Prompt Capture
- Meeting Capture
- Idea Capture

01 Maps of Content
- Project MOC
- Domain MOC
- Feature MOC
- Architecture MOC
- Prompt MOC
- Decision MOC
- Tooling MOC
- Template MOC

10 Product
- Product Brief
- PRD
- MVP Scope
- Roadmap
- User Stories
- User Flows
- Positioning
- Launch Copy
- Pricing Model
- GTM Plan
- Risk Register

20 Domains
- Domain Model
- Domain Contract
- Entity Catalog
- State Machine
- Lifecycle Contract
- Role Contract
- AuthZ Matrix
- Readiness Gates
- Business Rules
- Acceptance Gates
- Analytics Contract

30 Architecture
- Architecture Overview
- Technical Requirements
- ADR
- Decision Log
- Boundary Rules
- Data Flow
- Service Boundary
- Cache Strategy
- Webhook Strategy
- Security Model
- Deployment Architecture
- Migration Plan

40 Features
- Feature Spec
- Feature Contract
- Work Package
- Route Spec
- Page Spec
- Component Spec
- Form Spec
- Action Spec
- Fetcher Spec
- DTO Spec
- Schema Spec
- QA Checklist
- Completion Report

50 Engineering
- Database Model
- Table Catalog
- Enum Catalog
- Query Shapes
- Transaction Contracts
- API Contract
- Endpoint Catalog
- OpenAPI Spec
- Integration Spec
- Env Var Matrix
- Error Taxonomy
- Testing Plan

60 Design
- Design System
- Component Inventory
- Visual Language
- Brand System
- Copy System
- Navigation Model
- Empty States
- Error States
- Accessibility Checklist
- Golden Prototype Notes

70 Agent Ops
- Agent Instructions
- Codex Work Package
- Mega Prompt
- Refactor Prompt
- Audit Prompt
- Enforcement Prompt
- Bugfix Prompt
- Handoff Prompt
- Stop Conditions
- Verification Checklist
- Known Agent Failures
- Prompt Changelog

80 Operations
- Project Status
- Execution Log
- Backlog
- Task Matrix
- Progress Report
- Handoff
- Blocker Log
- Release Checklist
- Deployment Runbook
- Incident Report
- Postmortem

90 Reference
- Concept Note
- Pattern Note
- Anti-Pattern Note
- Tool Notes
- CLI Cheat Sheet
- Command Cookbook
- Error Encyclopedia
- Snippet Library
- Research Summary
- Glossary

99 Archive
- Deprecated Spec
- Superseded ADR
- Old Prompt
- Legacy Architecture
- Historical Notes
```

## The files I’d make mandatory per serious project

For something like **Vouch**, **RateLtd**, **CtrlPlus**, or any future SaaS/TUI/product repo, I’d require these:

```txt
MOC - Project.md
product-brief.md
prd.md
mvp-scope.md
domain-model.md
domain-contract.md
roles.md
authz-matrix.md
state-machine.md
routes.md
features.md
technical-requirements.md
architecture-overview.md
adr-index.md
design-system.md
component-inventory.md
api-contract.md
database-model.md
env-var-matrix.md
test-plan.md
release-checklist.md
codex-work-packages.md
agent-instructions.md
verification-checklist.md
handoff.md
```

For your agent-heavy workflow, I’d add these as non-negotiable:

```txt
codex-mega-prompt.md
codex-rate-limit-strategy.md
post-refactor-audit-prompt.md
boundary-enforcement-prompt.md
known-agent-failures.md
implementation-contract.md
stop-conditions.md
completion-report-template.md
```

## Best practical Obsidian rule

Use backlinks around **concepts**, not every note.

Bad:

```txt
Today I worked on [[the]] [[payment]] [[page]] and [[fixed]] [[stuff]].
```

Good:

```txt
Updated [[Vouch Payment Readiness]] after the [[Stripe Connect]] role-mapping fix.
Impacts [[AuthZ Matrix]], [[Readiness Gates]], and [[Settlement State Machine]].
```

That gives you a graph that actually means something.