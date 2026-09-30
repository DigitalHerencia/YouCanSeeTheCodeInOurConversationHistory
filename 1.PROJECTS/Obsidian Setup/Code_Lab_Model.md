# Code Lab Model

## Code Lab Model Overview

The Code Lab is the engineering knowledge and implementation system for the software projects built in the vault.

It has the same general structural shape as the Project system, but it models reusable engineering knowledge rather than project execution.

The hierarchy is:

```text
Domain
└── Dev Cycle
    └── Standard
        └── Pattern
            └── Code Artifact
```

A Domain is a codebase-level application template. A Dev Cycle is a section of the development timeline for that Domain. A Standard is a segment of development work within a Cycle that defines engineering doctrine and implementation guidance. A Pattern is a reusable code module or implementation pattern associated with a Standard. Code artifacts are the actual repository files created from or informed by the Code Lab.

## Code Lab Object Model

| Code Lab Object | Definition |
|---|---|
| Domain | A reusable application/codebase template representing one of the SaaS application domains |
| Dev Cycle | A development concern or stage that can recur across Domains |
| Standard | Engineering doctrine and implementation guidance for a Cycle |
| Pattern | A reusable code module/pattern used to implement a Standard |
| Code Artifact | Actual code or repository material produced while applying a Pattern |

The conceptual correspondence with the Project Model is:

| Project Model | Code Lab |
|---|---|
| Project | Domain |
| Milestone | Dev Cycle |
| Phase | Standard |
| Task / Ticket | Pattern |
| Project Artifact | Code Artifact |

This is a structural analogy, not a claim that a Pattern is a project task. Patterns are reusable engineering modules; Tasks are units of project execution.

# Domains

Domains are the top-level Code Lab objects.

Each Domain represents a codebase template for one SaaS application domain. The canonical domain inventory is recorded in:

```text
2.AREAS/CODE/Domains/context/Ontologies.Canonical-Catalog.md
```

The current canonical catalog contains these nine application domains:

1. CRM / Pipeline Tracker
2. Project Management / Task Tracker
3. Customer Support / Ticketing System
4. Marketing Automation & Analytics
5. Invoicing & Expense Tracker
6. Social Media Scheduler
7. AI-Powered Wrapper / Micro-SaaS
8. B2B Client Portal
9. Internal Tools / Admin Portal

The canonical catalog is implementation-driven. It records the actual repository implementation rather than hypothetical or missing files.

## Domain 1 — CRM / Pipeline Tracker

The canonical implementation includes:

```text
features/crm/
components/templates/crm*
lib/actions/crmActions.ts
lib/fetchers/crmFetchers.ts
lib/workflows/crmWorkflows.ts
lib/db/selects/crm.selects.ts
lib/db/dto/crm.dto.ts
lib/db/transactions/*
schemas/crmSchemas.ts
types/crmTypes.ts
```

Primary route surfaces include:

```text
/crm/pipeline
/crm/leads
/crm/leads/new
/crm/leads/[leadId]
/crm/leads/[leadId]/edit
/crm/contacts
/crm/contacts/new
/crm/contacts/[contactId]
/crm/contacts/[contactId]/edit
/crm/accounts
/crm/accounts/new
/crm/accounts/[accountId]
/crm/accounts/[accountId]/edit
/crm/analytics
```

## Domain 2 — Project Management / Task Tracker

The canonical implementation includes:

```text
features/projects/
components/templates/projects*
lib/actions/projectsActions.ts
lib/fetchers/projectsFetchers.ts
lib/workflows/projectsWorkflows.ts
lib/db/selects/projects.selects.ts
lib/db/dto/projects.dto.ts
lib/db/transactions/*
schemas/projectsSchemas.ts
types/projectsTypes.ts
```

Primary route surfaces include:

```text
/projects
/projects/new
/projects/[projectId]
/projects/[projectId]/edit
/projects/[projectId]/tasks
/projects/[projectId]/tasks/new
/projects/[projectId]/tasks/[taskId]
/projects/[projectId]/tasks/[taskId]/edit
/projects/[projectId]/timeline
/my-tasks
```

## Domain 3 — Customer Support / Ticketing System

The canonical implementation includes:

```text
features/support/
components/templates/support*
lib/actions/supportActions.ts
lib/fetchers/supportFetchers.ts
lib/workflows/supportWorkflows.ts
lib/db/selects/support.selects.ts
lib/db/dto/support.dto.ts
lib/db/transactions/*
schemas/supportSchemas.ts
types/supportTypes.ts
```

Primary route surfaces include:

```text
/support/inbox
/support/tickets/new
/support/tickets/[ticketId]
/support/knowledge-base
/support/knowledge-base/new
/support/knowledge-base/[articleId]
/support/knowledge-base/[articleId]/edit
/support/analytics
```

## Domain 4 — Marketing Automation & Analytics

The canonical implementation includes:

```text
features/marketing/
components/templates/marketing*
lib/actions/marketingActions.ts
lib/fetchers/marketingFetchers.ts
lib/workflows/marketingWorkflows.ts
lib/db/selects/marketing.selects.ts
lib/db/dto/marketing.dto.ts
lib/db/transactions/*
schemas/marketingSchemas.ts
types/marketingTypes.ts
```

Primary route surfaces include:

```text
/marketing/campaigns
/marketing/campaigns/new
/marketing/campaigns/[campaignId]
/marketing/campaigns/[campaignId]/edit
/marketing/audiences
/marketing/audiences/new
/marketing/audiences/[audienceId]
/marketing/audiences/[audienceId]/edit
/marketing/analytics
```

## Domain 5 — Invoicing & Expense Tracker

The canonical implementation includes:

```text
features/invoicing/
components/templates/invoicing*
lib/actions/invoicingActions.ts
lib/fetchers/invoicingFetchers.ts
lib/workflows/invoicingWorkflows.ts
lib/db/selects/invoicing.selects.ts
lib/db/dto/invoicing.dto.ts
lib/db/transactions/*
schemas/invoicingSchemas.ts
types/invoicingTypes.ts
```

Primary route surfaces include:

```text
/invoices
/invoices/new
/invoices/[invoiceId]
/invoices/[invoiceId]/edit
/expenses
/expenses/new
/expenses/[expenseId]
/expenses/[expenseId]/edit
```

## Domain 6 — Social Media Scheduler

The canonical implementation includes:

```text
features/social/
components/templates/social*
lib/actions/socialActions.ts
lib/fetchers/socialFetchers.ts
lib/workflows/socialWorkflows.ts
lib/db/selects/social.selects.ts
lib/db/dto/social.dto.ts
lib/db/transactions/*
schemas/socialSchemas.ts
types/socialTypes.ts
```

Primary route surfaces include:

```text
/social/calendar
/social/compose
/social/media
```

## Domain 7 — AI-Powered Wrapper / Micro-SaaS

The canonical implementation includes:

```text
features/ai/
components/templates/ai*
lib/actions/aiActions.ts
lib/fetchers/aiFetchers.ts
lib/workflows/aiWorkflows.ts
lib/db/selects/ai.selects.ts
lib/db/dto/ai.dto.ts
lib/db/transactions/*
schemas/aiSchemas.ts
types/aiTypes.ts
```

Primary route surfaces include:

```text
/ai
/ai/playground
/ai/usage
```

## Domain 8 — B2B Client Portal

The canonical implementation includes:

```text
features/portal/
components/templates/portal*
lib/actions/portalActions.ts
lib/fetchers/portalFetchers.ts
lib/workflows/portalWorkflows.ts
lib/workflows/assetWorkflows.ts
lib/db/selects/portal.selects.ts
lib/db/dto/portal.dto.ts
lib/db/transactions/*
schemas/portalSchemas.ts
types/portalTypes.ts
```

Primary route surfaces include:

```text
/portal
/portal/documents
/portal/documents/[documentId]
/portal/billing
```

## Domain 9 — Internal Tools / Admin Portal

The canonical implementation includes:

```text
features/admin/
components/templates/admin*
lib/actions/adminActions.ts
lib/fetchers/adminFetchers.ts
lib/workflows/adminWorkflows.ts
lib/db/selects/admin.selects.ts
lib/db/dto/admin.dto.ts
lib/db/transactions/*
schemas/adminSchemas.ts
types/adminTypes.ts
```

Primary route surfaces include:

```text
/admin/records
/admin/records/[recordId]
/admin/users
/admin/users/new
/admin/users/[userId]
/admin/users/[userId]/edit
/admin/audit
```

# Dev Cycles

Dev Cycles are the reusable development timeline sections applied to Domains.

The current Code Lab contains these canonical Cycle notes:

```text
initialization
scaffolding
configuration
features
data
testing
validation
verification
code_review
security
performance
observability
cicd
deploy
documentation
updates
debug
```

Their purpose is to divide development work into recognizable engineering concerns rather than treating a Domain as one undifferentiated implementation block.

## Canonical Dev Cycle Inventory

| Dev Cycle | Focus |
|---|---|
| Initialization | Establish the project/codebase starting state |
| Scaffolding | Establish structural application foundations |
| Configuration | Establish runtime, environment, and system configuration |
| Features | Build application capabilities and workflows |
| Data | Define and implement data models and data access |
| Testing | Verify behavior through automated and focused tests |
| Validation | Validate implementation against requirements and constraints |
| Verification | Confirm that implementation behaves as intended |
| Code Review | Review implementation for correctness, quality, and conformance |
| Security | Address authentication, authorization, isolation, and security concerns |
| Performance | Address runtime efficiency and performance characteristics |
| Observability | Establish visibility into application behavior and failures |
| CI/CD | Automate integration, validation, and delivery |
| Deploy | Move validated software into its runtime environment |
| Documentation | Record system behavior, decisions, and implementation knowledge |
| Updates | Maintain and evolve the implementation |
| Debug | Diagnose and correct defects |

Each Cycle is a reusable reference. A Domain uses the Cycles relevant to its development lifecycle.

# Standards

Standards are the engineering doctrine and implementation layer inside a Dev Cycle.

The Code Lab organizes Standards into three explicit categories:

```text
2.AREAS/CODE/Standards/
├── Doctrine/
├── Implementation/
└── Rewrite/
```

## Doctrine

Doctrine documents the engineering rules, contracts, terminology, governance, epistemology, system models, provenance, and reference material that define how engineering work should be understood.

The current Doctrine inventory includes families for:

- Agent contracts
- Agent execution
- Documentation
- Engineering doctrine
- Epistemology
- Governance
- Knowledge modeling
- Knowledge systems
- Layer contracts
- Loaded Vibes architecture
- Reference implementations
- Security
- Specification
- System lifecycles
- System maps
- Terminology and nomenclature
- Validation and conformance
- GitHub issue and pull-request conventions
- Manifest and catalog material
- Application workflows
- Auth/authz policy
- Data contracts
- Governance systems
- Infrastructure integrations
- Layer contracts
- Presentation patterns
- Quality policy
- Route/feature orchestration
- Server actions
- Supporting patterns
- System lifecycle
- Transaction helpers
- Webhook processing
- Provenance and traceability

## Implementation

Implementation Standards translate the engineering model into concrete implementation guidance.

The current Implementation inventory includes families for:

- Architecture contracts
- Execution contracts
- Ontology contracts
- Product contracts
- Validation contracts
- Engineering practice
- Engineering system definition
- Knowledge modeling
- Knowledge system definition and maps
- Application workflows
- Auth/authz boundaries
- Pattern catalogs
- Fetchers
- Governance systems
- Layer contracts
- Route/feature orchestration
- Server actions
- System lifecycle
- Transaction helpers
- Webhook processors
- System architecture terminology

## Rewrite

Rewrite is the third Standard layer:

```text
2.AREAS/CODE/Standards/Rewrite/
```

It exists as part of the Code Lab Standard structure for work that revises or rewrites implementation guidance and related engineering material.

# Patterns

Patterns are reusable code modules and implementation patterns.

The canonical Pattern catalog currently contains:

```text
action
auth
authz
block
cache
config
constant
database
dto-mapper
feature
fetcher
integration
page-template
primitive
prisma-lifecycle
route
schema
select
template
transaction
type
utility
webhook
workflow
```

These are not generic tasks. Each Pattern describes a repeatable implementation shape that can be applied to the appropriate Standard and Dev Cycle.

## Pattern Categories

The Pattern catalog covers several recurring implementation layers:

```text
Application
├── route
├── feature
├── workflow
├── action
└── fetcher

Data
├── database
├── select
├── transaction
├── prisma-lifecycle
├── dto-mapper
└── schema

Security / Runtime
├── auth
├── authz
├── cache
├── config
├── integration
└── webhook

Presentation
├── block
├── page-template
├── primitive
└── template

Supporting
├── constant
├── type
└── utility
```

The exact applicability of a Pattern depends on the Domain, Dev Cycle, and Standard in which it is being used.

# Domain → Dev Cycle → Standard → Pattern

The complete Code Lab relationship is:

```text
Domain
│
├── Dev Cycle
│   │
│   ├── Standard
│   │   │
│   │   └── Pattern
│   │       │
│   │       └── Code Artifact
│   │
│   └── ...
│
└── ...
```

For example:

```text
CRM / Pipeline Tracker
    ↓
Features
    ↓
Implementation Standard
    ↓
Feature Pattern
    ↓
features/crm/crmPipelineFeature.tsx
```

Another implementation path may look like:

```text
CRM / Pipeline Tracker
    ↓
Data
    ↓
Implementation Standard
    ↓
Select Pattern
    ↓
lib/db/selects/crm.selects.ts
```

And:

```text
CRM / Pipeline Tracker
    ↓
Security
    ↓
Doctrine / Implementation Standard
    ↓
Authz Pattern
    ↓
lib/authz/*
```

The actual repository implementation remains the final reference for which files exist and how the architecture is expressed.

# Code Artifacts

Code artifacts are the actual implementation files associated with Code Lab knowledge.

For project work, code artifacts are mounted into:

```text
2.AREAS/SYSTEM/_mounts
```

The CodeSpace workflow provides the editing surface for those mounted repositories.

The Code Lab does not duplicate the source code into the knowledge layer. It provides the reusable knowledge, doctrine, standards, and patterns used to understand and implement the source code.

The relationship is:

```text
Code Lab knowledge
        ↓
Domain / Cycle / Standard / Pattern
        ↓
CodeSpace
        ↓
Mounted repository
        ↓
Actual code artifact
```

# Canonical Application Architecture

The canonical catalog records this observed implementation relationship:

```text
Route
  ↓
Server Feature
  ↓
Domain Template
  ↓
Shared Presentation Block / UI

Route
  ↓
Client Form
  ↓
UI primitives

Feature
  ↓
Workflow / Fetcher

Workflow
  ↓
Fetcher / Action

Action / Fetcher
  ↓
DB selects / DTOs / Transactions
```

Cross-cutting systems are shared rather than duplicated by Domain:

```text
Authorization
    ↓
lib/authz/

Provider adapters
    ↓
lib/integrations/

Design system
    ↓
app/globals.css
components/ui/*
```

Business/application orchestration lives under:

```text
lib/workflows/
```

The current implementation does not treat presentation blocks as a second business-logic namespace.

# Cross-Cutting Code Lab Inventory

## Authorization

The canonical shared authorization layer is:

```text
lib/authz/permissions.ts
lib/authz/policies.ts
lib/authz/resources.ts
lib/authz/roles.ts
```

## Shared Database Runtime

```text
lib/db/client.ts
lib/db/provider.ts
lib/db/tenant.ts
```

Additional shared transactions include:

```text
lib/db/transactions/clerk-user.tx.ts
lib/db/transactions/errors.ts
lib/db/transactions/idempotency.tx.ts
lib/db/transactions/onboarding.tx.ts
lib/db/transactions/webhook-event.tx.ts
```

## Shared Schema and Types

```text
schemas/commonSchemas.ts
schemas/integrationSchemas.ts

types/access.ts
types/commonTypes.ts
types/integrationTypes.ts
types/uiTypes.ts
```

## Shared Helpers

```text
lib/cache/invalidate.ts
lib/cache/life.ts
lib/cache/tags.ts

lib/constants/limits.ts
lib/constants/pagination.ts

lib/utils/chartExport.ts
lib/utils/cn.ts
lib/utils/dates.ts
lib/utils/mathCurves.ts
lib/utils/money.ts
lib/utils/motionCore.ts
lib/utils/strings.ts
```

## Provider Integrations

```text
lib/integrations/status.ts

lib/integrations/cloudinary/
lib/integrations/hugging-face/
lib/integrations/sendgrid/
lib/integrations/stripe/
lib/integrations/vercel-blob/
```

The canonical provider families include:

```text
Cloudinary
Hugging Face
SendGrid
Stripe
Vercel Blob
```

Provider adapters are cross-cutting implementation infrastructure. They are not assigned to a Domain solely because their names appear in a Domain.

# Code Lab Navigation

The Code Lab is navigated through:

```text
2.AREAS/CODE/
├── Domains/
│   └── context/
│       └── Ontologies.Canonical-Catalog.md
├── Cycles/
├── Standards/
│   ├── Doctrine/
│   ├── Implementation/
│   └── Rewrite/
└── Patterns/
```

The Domain catalog provides the canonical application inventory.

Cycles provide the reusable development timeline.

Standards provide the engineering doctrine and implementation guidance.

Patterns provide reusable implementation modules.

Mounted repositories provide the actual code.

# Code Lab Workflow

The intended workflow is:

```text
Identify Project
      ↓
Identify relevant Domain
      ↓
Identify relevant Dev Cycle
      ↓
Identify applicable Standard
      ↓
Identify applicable Pattern
      ↓
Implement in mounted repository
      ↓
Review / validate code artifact
      ↓
Update Code Lab knowledge when the implementation establishes or changes a reusable pattern
```

A Project uses Code Lab knowledge; Code Lab does not become a second Project tracker.

# Project / Code Lab Integration

The Project system and Code Lab system meet through the Project Codebase map.

```text
Project
│
├── Milestone
│   └── Phase
│       └── Task
│
└── Codebase
    │
    ├── Domain
    │   └── Dev Cycle
    │       └── Standard
    │           └── Pattern
    │
    └── Mounted Code Artifacts
```

A project task can link to the Code Lab Pattern or Standard that informs its implementation.

A project artifact can document the engineering decision or implementation produced from Code Lab material.

A Code Lab Pattern can be reused by multiple Projects.

A Domain can provide the architectural starting point for multiple projects without becoming a project itself.

# Code Lab Outputs

The Code Lab produces or maintains:

- Domain maps
- Canonical application catalogs
- Dev Cycle references
- Engineering Doctrine
- Implementation Standards
- Rewrite Standards
- Pattern references
- Pattern catalogs
- Architecture references
- Provenance and traceability references
- Mounted repository relationships
- Code artifact references

The Code Lab is therefore both a knowledge system and an implementation reference system.

# Governing Alignment Rule

The Code Lab describes the engineering system actually being built and the reusable engineering knowledge used to build it.

The canonical application inventory is grounded in:

```text
2.AREAS/CODE/Domains/context/Ontologies.Canonical-Catalog.md
```

The implementation hierarchy is:

```text
Domain
→ Dev Cycle
→ Standard
→ Pattern
→ Code Artifact
```

The Project hierarchy remains:

```text
Project
→ Milestone
→ Phase
→ Task / Ticket
→ Project Artifact
```

These models are intentionally parallel and integrated, but they are not interchangeable.
