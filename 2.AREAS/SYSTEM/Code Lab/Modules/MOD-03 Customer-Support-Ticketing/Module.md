---
type: module
id: MOD-003
ontology: "Customer Support / Ticketing"
application_path: "app/(tenant)/support"
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
# Customer Support / Ticketing

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#3. Customer Support / Ticketing System]]

## 3. Customer Support / Ticketing System Ontology™

### Routes → implemented entrypoints → templates

| Route                                      | Implemented entrypoint                          | Template                                                   |
| ------------------------------------------ | ----------------------------------------------- | ---------------------------------------------------------- |
| `/support/inbox`                           | `features/support/inboxFeature.tsx`             | `components/templates/supportInboxTemplate.tsx`            |
| `/support/tickets/new`                     | `features/support/ticketNewForm.tsx`            | —                                                          |
| `/support/tickets/[ticketId]`              | `features/support/ticketFeature.tsx`            | `components/templates/supportTicketTemplate.tsx`           |
| `/support/knowledge-base`                  | `features/support/knowledgeBaseFeature.tsx`     | `components/templates/supportKnowledgeBaseTemplate.tsx`    |
| `/support/knowledge-base/new`              | `features/support/knowledgeArticleNewForm.tsx`  | —                                                          |
| `/support/knowledge-base/[articleId]`      | `features/support/knowledgeArticleFeature.tsx`  | `components/templates/supportKnowledgeArticleTemplate.tsx` |
| `/support/knowledge-base/[articleId]/edit` | `features/support/knowledgeArticleEditForm.tsx` | —                                                          |
| `/support/analytics`                       | `features/support/supportAnalyticsFeature.tsx`  | `components/templates/supportAnalyticsTemplate.tsx`        |

### `support` feature inventory

```text
features/support/inboxFeature.client.tsx
features/support/inboxFeature.tsx
features/support/inboxSkeleton.tsx
features/support/knowledgeArticleEditForm.tsx
features/support/knowledgeArticleFeature.tsx
features/support/knowledgeArticleNewForm.tsx
features/support/knowledgeArticleSkeleton.tsx
features/support/knowledgeBaseFeature.client.tsx
features/support/knowledgeBaseFeature.tsx
features/support/knowledgeBaseSkeleton.tsx
features/support/supportAnalyticsFeature.tsx
features/support/supportAnalyticsSkeleton.tsx
features/support/ticketFeature.client.tsx
features/support/ticketFeature.tsx
features/support/ticketNewForm.tsx
features/support/ticketSkeleton.tsx
```

### `support` template inventory

```text
components/templates/supportAnalyticsTemplate.tsx
components/templates/supportInboxTemplate.tsx
components/templates/supportKnowledgeArticleTemplate.tsx
components/templates/supportKnowledgeBaseTemplate.tsx
components/templates/supportTicketTemplate.tsx
```

### `support` server/application inventory

```text
lib/actions/supportActions.ts
lib/fetchers/supportFetchers.ts
lib/workflows/supportWorkflows.ts

lib/db/selects/support.selects.ts
lib/db/dto/support.dto.ts
lib/db/transactions/support.tx.ts
lib/db/transactions/update-ticket-status.tx.ts

schemas/supportSchemas.ts
types/supportTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-03-01 Initialization]]
- [[MOD-03-02 Scaffolding]]
- [[MOD-03-03 Configuration]]
- [[MOD-03-04 Verification]]
- [[MOD-03-05 Data]]
- [[MOD-03-06 Features]]
- [[MOD-03-07 Testing]]
- [[MOD-03-08 Validation]]
- [[MOD-03-09 Debug]]
- [[MOD-03-10 Security]]
- [[MOD-03-11 Performance]]
- [[MOD-03-12 Observability]]
- [[MOD-03-13 CI-CD]]
- [[MOD-03-14 Code-Review]]
- [[MOD-03-15 Documentation]]
- [[MOD-03-16 Deploy]]
- [[MOD-03-17 Updates]]

