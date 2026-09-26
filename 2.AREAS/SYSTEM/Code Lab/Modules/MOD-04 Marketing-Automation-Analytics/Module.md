---
type: module
id: MOD-04
title: Marketing Automation & Analytics
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
source: "[[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]]"
---
# Marketing Automation & Analytics

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[4.ARCHIVE/40.ARCHIVE.CODEPENDENTCODING/40.ARCHIVE.CODEPENDENTCODING.Dev-Cycles.Source-Document]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#4. Marketing Automation & Analytics]]

## 4. Marketing Automation & Analytics Ontology™

### Routes → implemented entrypoints → templates

| Route                                    | Implemented entrypoint                             | Template                                                   |
| ---------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------- |
| `/marketing/campaigns`                   | `features/marketing/campaignsFeature.tsx`          | `components/templates/marketingCampaignsTemplate.tsx`      |
| `/marketing/campaigns/new`               | `features/marketing/campaignNewForm.tsx`           | —                                                          |
| `/marketing/campaigns/[campaignId]`      | `features/marketing/campaignFeature.tsx`           | `components/templates/marketingCampaignDetailTemplate.tsx` |
| `/marketing/campaigns/[campaignId]/edit` | `features/marketing/campaignEditForm.tsx`          | —                                                          |
| `/marketing/audiences`                   | `features/marketing/audiencesFeature.tsx`          | `components/templates/marketingAudiencesTemplate.tsx`      |
| `/marketing/audiences/new`               | `features/marketing/audienceNewForm.tsx`           | —                                                          |
| `/marketing/audiences/[audienceId]`      | `features/marketing/audienceFeature.tsx`           | `components/templates/marketingAudienceDetailTemplate.tsx` |
| `/marketing/audiences/[audienceId]/edit` | `features/marketing/audienceEditForm.tsx`          | —                                                          |
| `/marketing/analytics`                   | `features/marketing/marketingAnalyticsFeature.tsx` | `components/templates/marketingAnalyticsTemplate.tsx`      |

### `marketing` feature inventory

```text
features/marketing/audienceEditForm.tsx
features/marketing/audienceFeature.tsx
features/marketing/audienceNewForm.tsx
features/marketing/audienceSkeleton.tsx
features/marketing/audiencesFeature.client.tsx
features/marketing/audiencesFeature.tsx
features/marketing/audiencesSkeleton.tsx
features/marketing/campaignEditForm.tsx
features/marketing/campaignFeature.client.tsx
features/marketing/campaignFeature.tsx
features/marketing/campaignNewForm.tsx
features/marketing/campaignForm.client.tsx
features/marketing/campaignSkeleton.tsx
features/marketing/campaignsFeature.client.tsx
features/marketing/campaignsFeature.tsx
features/marketing/campaignsSkeleton.tsx
features/marketing/marketingAnalyticsFeature.tsx
features/marketing/marketingAnalyticsSkeleton.tsx
```

### `marketing` template inventory

```text
components/templates/marketingAnalyticsTemplate.tsx
components/templates/marketingAudienceDetailTemplate.tsx
components/templates/marketingAudiencesTemplate.tsx
components/templates/marketingCampaignDetailTemplate.tsx
components/templates/marketingCampaignsTemplate.tsx
```

### `marketing` server/application inventory

```text
lib/actions/marketingActions.ts
lib/fetchers/marketingFetchers.ts
lib/workflows/marketingWorkflows.ts

lib/db/selects/marketing.selects.ts
lib/db/dto/marketing.dto.ts
lib/db/transactions/marketing.tx.ts

schemas/marketingSchemas.ts
types/marketingTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-04-01 Initialization]]
- [[MOD-04-02 Scaffolding]]
- [[MOD-04-03 Configuration]]
- [[MOD-04-04 Verification]]
- [[MOD-04-05 Data]]
- [[MOD-04-06 Features]]
- [[MOD-04-07 Testing]]
- [[MOD-04-08 Validation]]
- [[MOD-04-09 Debug]]
- [[MOD-04-10 Security]]
- [[MOD-04-11 Performance]]
- [[MOD-04-12 Observability]]
- [[MOD-04-13 CI-CD]]
- [[MOD-04-14 Code-Review]]
- [[MOD-04-15 Documentation]]
- [[MOD-04-16 Deploy]]
- [[MOD-04-17 Updates]]
