---
type: module
id: MOD-01
title: CRM / Pipeline Tracker
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
source: "[[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]]"
---
# CRM / Pipeline Tracker

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[4.ARCHIVE/40.ARCHIVE.CODEPENDENTCODING/40.ARCHIVE.CODEPENDENTCODING.Dev-Cycles.Source-Document]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


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
