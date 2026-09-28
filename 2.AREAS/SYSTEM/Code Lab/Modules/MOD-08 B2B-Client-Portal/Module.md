---
type: codelab
codelab_kind: module
id: MOD-008
ontology: B2B Client Portal
application_path: "app/(tenant)/portal"
mastery_state: not-started
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-28
tags: [type/codelab, type/module]
---

# B2B Client Portal

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#8. B2B Client Portal]]

## 8. B2B Client Portal Ontology™

### Routes → implemented entrypoints → templates

| Route                            | Implemented entrypoint                 | Template                                                |
| -------------------------------- | -------------------------------------- | ------------------------------------------------------- |
| `/portal`                        | `features/portal/portalFeature.tsx`    | `components/templates/portalHomeTemplate.tsx`           |
| `/portal/documents`              | `features/portal/documentsFeature.tsx` | `components/templates/portalDocumentsTemplate.tsx`      |
| `/portal/documents/[documentId]` | `features/portal/documentFeature.tsx`  | `components/templates/portalDocumentDetailTemplate.tsx` |
| `/portal/billing`                | `features/portal/billingFeature.tsx`   | `components/templates/portalBillingTemplate.tsx`        |

### `portal` feature inventory

```text
features/portal/billingFeature.tsx
features/portal/billingSkeleton.tsx
features/portal/portalDocumentControls.client.tsx
features/portal/workspaceFileUpload.client.tsx
features/portal/documentFeature.client.tsx
features/portal/documentFeature.tsx
features/portal/documentSkeleton.tsx
features/portal/documentsFeature.client.tsx
features/portal/documentsFeature.tsx
features/portal/documentsSkeleton.tsx
features/portal/portalFeature.tsx
features/portal/portalSkeleton.tsx
```

### `portal` template inventory

```text
components/templates/portalBillingTemplate.tsx
components/templates/portalDocumentDetailTemplate.tsx
components/templates/portalDocumentsTemplate.tsx
components/templates/portalHomeTemplate.tsx
```

### `portal` server/application inventory

```text
lib/actions/portalActions.ts
lib/fetchers/portalFetchers.ts
lib/workflows/portalWorkflows.ts
lib/workflows/assetWorkflows.ts

lib/db/selects/portal.selects.ts
lib/db/dto/portal.dto.ts
lib/db/transactions/add-portal-version.tx.ts
lib/db/transactions/portal.tx.ts

schemas/portalSchemas.ts
types/portalTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-08-01 Initialization]]
- [[MOD-08-02 Scaffolding]]
- [[MOD-08-03 Configuration]]
- [[MOD-08-04 Verification]]
- [[MOD-08-05 Data]]
- [[MOD-08-06 Features]]
- [[MOD-08-07 Testing]]
- [[MOD-08-08 Validation]]
- [[MOD-08-09 Debug]]
- [[MOD-08-10 Security]]
- [[MOD-08-11 Performance]]
- [[MOD-08-12 Observability]]
- [[MOD-08-13 CI-CD]]
- [[MOD-08-14 Code-Review]]
- [[MOD-08-15 Documentation]]
- [[MOD-08-16 Deploy]]
- [[MOD-08-17 Updates]]

