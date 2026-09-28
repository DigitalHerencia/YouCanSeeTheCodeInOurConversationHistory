---
type: codelab
codelab_kind: module
id: MOD-001
ontology: CRM / Pipeline Tracker
application_path: "app/(tenant)/crm"
mastery_state: not-started
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-28
tags: [type/codelab, type/module]
---

# CRM / Pipeline Tracker

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#1. CRM / Pipeline Tracker]]

## 1. CRM / Pipeline Tracker Ontology™

### Routes → implemented entrypoints → templates

| Route                            | Implemented entrypoint                     | Template                                            |
| -------------------------------- | ------------------------------------------ | --------------------------------------------------- |
| `/crm/pipeline`                  | `features/crm/crmPipelineFeature.tsx`      | `components/templates/crmPipelineTemplate.tsx`      |
| `/crm/leads`                     | `features/crm/crmLeadsFeature.tsx`         | `components/templates/crmLeadsTemplate.tsx`         |
| `/crm/leads/new`                 | `features/crm/crmNewLeadForm.tsx`          | —                                                   |
| `/crm/leads/[leadId]`            | `features/crm/crmLeadDetailFeature.tsx`    | `components/templates/crmLeadDetailTemplate.tsx`    |
| `/crm/leads/[leadId]/edit`       | `features/crm/crmEditLeadForm.tsx`         | —                                                   |
| `/crm/contacts`                  | `features/crm/crmContactsFeature.tsx`      | `components/templates/crmContactsTemplate.tsx`      |
| `/crm/contacts/new`              | `features/crm/crmNewContactForm.tsx`       | —                                                   |
| `/crm/contacts/[contactId]`      | `features/crm/crmContactDetailFeature.tsx` | `components/templates/crmContactDetailTemplate.tsx` |
| `/crm/contacts/[contactId]/edit` | `features/crm/crmEditContactForm.tsx`      | —                                                   |
| `/crm/accounts`                  | `features/crm/crmAccountsFeature.tsx`      | `components/templates/crmAccountsTemplate.tsx`      |
| `/crm/accounts/new`              | `features/crm/crmNewAccountForm.tsx`       | —                                                   |
| `/crm/accounts/[accountId]`      | `features/crm/crmAccountDetailFeature.tsx` | `components/templates/crmAccountDetailTemplate.tsx` |
| `/crm/accounts/[accountId]/edit` | `features/crm/crmEditAccountForm.tsx`      | —                                                   |
| `/crm/analytics`                 | `features/crm/crmAnalyticsFeature.tsx`     | `components/templates/crmAnalyticsTemplate.tsx`     |

### `crm` feature inventory

```text
features/crm/crmAccountDetailFeature.tsx
features/crm/crmAccountDetailSkeleton.tsx
features/crm/crmAccountsFeature.client.tsx
features/crm/crmAccountsFeature.tsx
features/crm/crmAccountsSkeleton.tsx
features/crm/crmAnalyticsFeature.tsx
features/crm/crmAnalyticsSkeleton.tsx
features/crm/crmContactDetailFeature.tsx
features/crm/crmContactDetailSkeleton.tsx
features/crm/crmContactsFeature.client.tsx
features/crm/crmContactsFeature.tsx
features/crm/crmContactsSkeleton.tsx
features/crm/crmEditAccountForm.tsx
features/crm/crmEditContactForm.tsx
features/crm/crmEditLeadForm.tsx
features/crm/crmLeadDetailFeature.tsx
features/crm/crmLeadDetailSkeleton.tsx
features/crm/crmLeadsFeature.tsx
features/crm/crmLeadsSkeleton.tsx
features/crm/crmNewAccountForm.tsx
features/crm/crmNewContactForm.tsx
features/crm/crmNewLeadForm.tsx
features/crm/crmOpportunityForm.client.tsx
features/crm/crmPipelineFeature.client.tsx
features/crm/crmPipelineFeature.tsx
features/crm/crmPipelineSkeleton.tsx
```

### `crm` template inventory

```text
components/templates/crmAccountDetailTemplate.tsx
components/templates/crmAccountsTemplate.tsx
components/templates/crmAnalyticsTemplate.tsx
components/templates/crmContactDetailTemplate.tsx
components/templates/crmContactsTemplate.tsx
components/templates/crmLeadDetailTemplate.tsx
components/templates/crmLeadsTemplate.tsx
components/templates/crmPipelineTemplate.tsx
```

### `crm` server/application inventory

```text
lib/actions/crmActions.ts
lib/fetchers/crmFetchers.ts
lib/workflows/crmWorkflows.ts

lib/db/selects/crm.selects.ts
lib/db/dto/crm.dto.ts
lib/db/transactions/assign-crm-record.tx.ts
lib/db/transactions/record-sales-activity.tx.ts
lib/db/transactions/update-deal-stage.tx.ts

schemas/crmSchemas.ts
types/crmTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-01-01 Initialization]]
- [[MOD-01-02 Scaffolding]]
- [[MOD-01-03 Configuration]]
- [[MOD-01-04 Verification]]
- [[MOD-01-05 Data]]
- [[MOD-01-06 Features]]
- [[MOD-01-07 Testing]]
- [[MOD-01-08 Validation]]
- [[MOD-01-09 Debug]]
- [[MOD-01-10 Security]]
- [[MOD-01-11 Performance]]
- [[MOD-01-12 Observability]]
- [[MOD-01-13 CI-CD]]
- [[MOD-01-14 Code-Review]]
- [[MOD-01-15 Documentation]]
- [[MOD-01-16 Deploy]]
- [[MOD-01-17 Updates]]




## CRM Golden Slice

Source contract: [[3.RESOURCES/template/context/specs/04.crm-golden-vertical-slice]]. The CRM is a tenant surface. Preserve thin tenant-gated routes, server feature → workflow → fetcher/action boundaries, CRM templates/client companions, and existing schemas/types/selects/DTOs. Resource-level authorization is verified at server boundaries; UI rendering does not prove tenant isolation.

- Routes: `3.RESOURCES/template/app/(tenant)/crm/`
- Feature: [[3.RESOURCES/template/features/crm/crmPipelineFeature.tsx]]
- Workflow: [[3.RESOURCES/template/lib/workflows/crmWorkflows.ts]]
- Fetchers: [[3.RESOURCES/template/lib/fetchers/crmFetchers.ts]]
- Actions: [[3.RESOURCES/template/lib/actions/crmActions.ts]]
- Schemas: [[3.RESOURCES/template/schemas/crmSchemas.ts]]
- Types: [[3.RESOURCES/template/types/crmTypes.ts]]
- Code Space mount: `2.AREAS/SYSTEM/_mounts/CodependentCoding` via installed configuration.

## Acceptance trace

- [ ] Tenant-gated thin routes remain intact.
- [ ] Server feature composes workflow and CRM template.
- [ ] Reads remain in fetchers; mutation entrypoints remain in actions.
- [ ] Existing schemas/types/selects/DTOs and authz are reused.
- [ ] Evidence cites actual checks and changed files; do not assert unrun validation.


