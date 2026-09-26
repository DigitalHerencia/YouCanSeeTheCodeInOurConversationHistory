---
type: module
id: MOD-07
title: AI-Powered Wrapper / Micro-SaaS
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
source: "[[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]]"
---
# AI-Powered Wrapper / Micro-SaaS

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[4.ARCHIVE/40.ARCHIVE.CODEPENDENTCODING/40.ARCHIVE.CODEPENDENTCODING.Dev-Cycles.Source-Document]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#7. AI-Powered Wrapper / Micro-SaaS]]

## 7. AI-Powered Wrapper / Micro-SaaS Ontology™

### Routes → implemented entrypoints → templates

| Route            | Implemented entrypoint                | Template                                        |
| ---------------- | ------------------------------------- | ----------------------------------------------- |
| `/ai`            | `features/ai/aiGenerationFeature.tsx` | `components/templates/aiGenerationTemplate.tsx` |
| `/ai/playground` | `features/ai/aiPlaygroundFeature.tsx` | `components/templates/aiPlaygroundTemplate.tsx` |
| `/ai/usage`      | `features/ai/aiUsageFeature.tsx`      | `components/templates/aiUsageTemplate.tsx`      |

### `ai` feature inventory

```text
features/ai/aiGenerationFeature.tsx
features/ai/aiGenerationSkeleton.tsx
features/ai/aiPlaygroundFeature.client.tsx
features/ai/aiPlaygroundFeature.tsx
features/ai/aiPlaygroundSkeleton.tsx
features/ai/aiUsageFeature.tsx
features/ai/aiUsageSkeleton.tsx
```

### `ai` template inventory

```text
components/templates/aiGenerationTemplate.tsx
components/templates/aiPlaygroundTemplate.tsx
components/templates/aiUsageTemplate.tsx
```

### `ai` server/application inventory

```text
lib/actions/aiActions.ts
lib/fetchers/aiFetchers.ts
lib/workflows/aiWorkflows.ts

lib/db/selects/ai.selects.ts
lib/db/dto/ai.dto.ts
lib/db/transactions/ai.tx.ts
lib/db/transactions/complete-ai-generation.tx.ts

schemas/aiSchemas.ts
types/aiTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-07-01 Initialization]]
- [[MOD-07-02 Scaffolding]]
- [[MOD-07-03 Configuration]]
- [[MOD-07-04 Verification]]
- [[MOD-07-05 Data]]
- [[MOD-07-06 Features]]
- [[MOD-07-07 Testing]]
- [[MOD-07-08 Validation]]
- [[MOD-07-09 Debug]]
- [[MOD-07-10 Security]]
- [[MOD-07-11 Performance]]
- [[MOD-07-12 Observability]]
- [[MOD-07-13 CI-CD]]
- [[MOD-07-14 Code-Review]]
- [[MOD-07-15 Documentation]]
- [[MOD-07-16 Deploy]]
- [[MOD-07-17 Updates]]
