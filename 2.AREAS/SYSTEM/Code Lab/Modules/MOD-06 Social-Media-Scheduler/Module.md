---
type: module
id: MOD-06
title: Social Media Scheduler
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
source: "[[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]]"
---
# Social Media Scheduler

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[4.ARCHIVE/40.ARCHIVE.CODEPENDENTCODING/40.ARCHIVE.CODEPENDENTCODING.Dev-Cycles.Source-Document]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#6. Social Media Scheduler]]

## 6. Social Media Scheduler Ontology™

### Routes → implemented entrypoints → templates

| Route              | Implemented entrypoint                    | Template                                          |
| ------------------ | ----------------------------------------- | ------------------------------------------------- |
| `/social/calendar` | `features/social/calendarFeature.tsx`     | `components/templates/socialCalendarTemplate.tsx` |
| `/social/compose`  | `features/social/composerFeature.tsx`     | `components/templates/socialComposeTemplate.tsx`  |
| `/social/media`    | `features/social/mediaLibraryFeature.tsx` | `components/templates/socialMediaTemplate.tsx`    |

### `social` feature inventory

```text
features/social/calendarFeature.client.tsx
features/social/calendarFeature.tsx
features/social/calendarSkeleton.tsx
features/social/composerFeature.client.tsx
features/social/composerFeature.tsx
features/social/composerSkeleton.tsx
features/social/mediaAssetControls.client.tsx
features/social/mediaLibraryFeature.client.tsx
features/social/mediaLibraryFeature.tsx
features/social/mediaLibrarySkeleton.tsx
```

### `social` template inventory

```text
components/templates/socialCalendarTemplate.tsx
components/templates/socialComposeTemplate.tsx
components/templates/socialMediaTemplate.tsx
```

### `social` server/application inventory

```text
lib/actions/socialActions.ts
lib/fetchers/socialFetchers.ts
lib/workflows/socialWorkflows.ts

lib/db/selects/social.selects.ts
lib/db/dto/social.dto.ts
lib/db/transactions/schedule-social-post.tx.ts
lib/db/transactions/social.tx.ts

schemas/socialSchemas.ts
types/socialTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-06-01 Initialization]]
- [[MOD-06-02 Scaffolding]]
- [[MOD-06-03 Configuration]]
- [[MOD-06-04 Verification]]
- [[MOD-06-05 Data]]
- [[MOD-06-06 Features]]
- [[MOD-06-07 Testing]]
- [[MOD-06-08 Validation]]
- [[MOD-06-09 Debug]]
- [[MOD-06-10 Security]]
- [[MOD-06-11 Performance]]
- [[MOD-06-12 Observability]]
- [[MOD-06-13 CI-CD]]
- [[MOD-06-14 Code-Review]]
- [[MOD-06-15 Documentation]]
- [[MOD-06-16 Deploy]]
- [[MOD-06-17 Updates]]
