---
type: module
id: MOD-009
ontology: "Internal Tools / Admin Portal"
application_path: "app/(tenant)/admin"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
source: "[[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]]"
---
# Internal Tools / Admin Portal

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#9. Internal Tools / Admin Portal]]

## 9. Internal Tools / Admin Portal Ontology™

### Routes → implemented entrypoints → templates

| Route                        | Implemented entrypoint                        | Template                                             |
| ---------------------------- | --------------------------------------------- | ---------------------------------------------------- |
| `/admin/records`             | `features/admin/adminRecordsFeature.tsx`      | `components/templates/adminRecordsTemplate.tsx`      |
| `/admin/records/[recordId]`  | `features/admin/adminRecordDetailFeature.tsx` | `components/templates/adminRecordDetailTemplate.tsx` |
| `/admin/users`               | `features/admin/adminUsersFeature.tsx`        | `components/templates/adminUsersTemplate.tsx`        |
| `/admin/users/new`           | `features/admin/adminNewUserForm.tsx`         | —                                                    |
| `/admin/users/[userId]`      | `features/admin/adminUserDetailFeature.tsx`   | `components/templates/adminUserDetailTemplate.tsx`   |
| `/admin/users/[userId]/edit` | `features/admin/adminEditUserForm.tsx`        | —                                                    |
| `/admin/audit`               | `features/admin/adminAuditFeature.tsx`        | `components/templates/adminAuditTemplate.tsx`        |

### `admin` feature inventory

```text
features/admin/adminAuditFeature.client.tsx
features/admin/adminAuditFeature.tsx
features/admin/adminAuditSkeleton.tsx
features/admin/adminEditUserForm.tsx
features/admin/adminNewUserForm.tsx
features/admin/adminRecordDetailFeature.tsx
features/admin/adminRecordDetailSkeleton.tsx
features/admin/adminRecordsFeature.tsx
features/admin/adminRecordsSkeleton.tsx
features/admin/adminUserDetailFeature.client.tsx
features/admin/adminUserDetailFeature.tsx
features/admin/adminUserDetailSkeleton.tsx
features/admin/adminUsersFeature.client.tsx
features/admin/adminUsersFeature.tsx
features/admin/adminUsersSkeleton.tsx
```

### `admin` template inventory

```text
components/templates/adminAuditTemplate.tsx
components/templates/adminRecordDetailTemplate.tsx
components/templates/adminRecordsTemplate.tsx
components/templates/adminUserDetailTemplate.tsx
components/templates/adminUsersTemplate.tsx
```

### `admin` server/application inventory

```text
lib/actions/adminActions.ts
lib/fetchers/adminFetchers.ts
lib/workflows/adminWorkflows.ts

lib/db/selects/admin.selects.ts
lib/db/dto/admin.dto.ts
lib/db/transactions/admin.tx.ts

schemas/adminSchemas.ts
types/adminTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

# Cross-Cutting Integration Inventory

Provider adapters are shared implementation infrastructure. They are listed once here instead of being duplicated into ontology sections without direct import evidence.

```text
lib/integrations/status.ts

lib/integrations/cloudinary/client.ts
lib/integrations/cloudinary/transformations.ts
lib/integrations/cloudinary/upload.ts

lib/integrations/hugging-face/client.ts
lib/integrations/hugging-face/embeddings.ts
lib/integrations/hugging-face/inference.ts

lib/integrations/sendgrid/client.ts
lib/integrations/sendgrid/email.ts
lib/integrations/sendgrid/webhooks.ts

lib/integrations/stripe/checkout.ts
lib/integrations/stripe/client.ts
lib/integrations/stripe/portal.ts
lib/integrations/stripe/subscriptions.ts
lib/integrations/stripe/webhooks.ts

lib/integrations/vercel-blob/client.ts
lib/integrations/vercel-blob/delete.ts
lib/integrations/vercel-blob/upload.ts
```

Current provider-facing Route Handler families include:

```text
app/api/ai/generate/route.ts
app/api/clerk/webhooks/route.ts
app/api/sendgrid/webhooks/route.ts
app/api/stripe/webhooks/route.ts
```

# Shared Database Runtime

```text
lib/db/client.ts
lib/db/provider.ts
lib/db/tenant.ts
```

Additional cross-cutting transactions currently include:

```text
lib/db/transactions/clerk-user.tx.ts
lib/db/transactions/errors.ts
lib/db/transactions/idempotency.tx.ts
lib/db/transactions/onboarding.tx.ts
lib/db/transactions/webhook-event.tx.ts
```

# Shared Schema and Type Inventory

Cross-cutting schema files:

```text
schemas/commonSchemas.ts
schemas/integrationSchemas.ts
```

Cross-cutting type files:

```text
types/access.ts
types/commonTypes.ts
types/integrationTypes.ts
types/uiTypes.ts
```

The older `types/*Interfaces.ts` family is not present in the current repository and is therefore not part of this catalog.

# Design-System Sources

The implemented global design system is sourced from:

```text
app/globals.css
app/layout.tsx
```

Chart-specific palettes live at:

```text
components/chart/palettes.ts
```

`components/ui/palettes.ts` is not present in the current codebase and is not canonical.

# Explicitly Removed Obsolete Inventory Assumptions

This revision intentionally removes the following older catalog assumptions because the corresponding implementation is not present:

- generic `DataGridTemplate.tsx`, `WorkspaceTemplate.tsx`, `FormTemplate.tsx`, `ProfileTemplate.tsx`, `DashboardTemplate.tsx`, `BillingTemplate.tsx`, `DocsTemplate.tsx`, `AdminTemplate.tsx`, `StepperTemplate.tsx`, and `CalanderTemplate.tsx` files;
- ontology-specific `[STUB — BUILD]` block files such as `kanban-board.tsx`, `data-table-section.tsx`, `record-detail-section.tsx`, `activity-timeline.tsx`, `analytics-dashboard.tsx`, `support-inbox.tsx`, `ticket-workspace.tsx`, `knowledge-base.tsx`, `campaign-workflow.tsx`, `social-calendar.tsx`, `post-composer.tsx`, `media-library.tsx`, `ai-chat-workspace.tsx`, `ai-playground.tsx`, `usage-dashboard.tsx`, `file-vault.tsx`, `approval-panel.tsx`, and admin-specific stub blocks;
- per-operation action/fetcher/workflow directory trees that were replaced by consolidated domain files in the actual repository;
- per-domain authz files that do not exist;
- domain-specific cache/constants/params symmetry files that do not exist;
- `types/*Interfaces.ts` files that do not exist;
- routes that are absent from the current route tree, including the older CRM deals/activities/settings surfaces, project milestones surface, social post detail/edit surfaces, portal approvals surface, and other obsolete entries.

# Governing Alignment Rule

This catalog is an inventory of the existing Maximal Template implementation.

When future implementation changes are intentionally accepted by the owner, update this catalog to describe those changes.

Do not change the implementation merely to make it conform to this catalog.

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-09-01 Initialization]]
- [[MOD-09-02 Scaffolding]]
- [[MOD-09-03 Configuration]]
- [[MOD-09-04 Verification]]
- [[MOD-09-05 Data]]
- [[MOD-09-06 Features]]
- [[MOD-09-07 Testing]]
- [[MOD-09-08 Validation]]
- [[MOD-09-09 Debug]]
- [[MOD-09-10 Security]]
- [[MOD-09-11 Performance]]
- [[MOD-09-12 Observability]]
- [[MOD-09-13 CI-CD]]
- [[MOD-09-14 Code-Review]]
- [[MOD-09-15 Documentation]]
- [[MOD-09-16 Deploy]]
- [[MOD-09-17 Updates]]

