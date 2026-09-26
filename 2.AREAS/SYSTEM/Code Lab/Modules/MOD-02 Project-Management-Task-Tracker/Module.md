---
type: module
id: MOD-02
title: Project Management / Task Tracker
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
source: "[[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]]"
---
# Project Management / Task Tracker

## Applied application
The real Code Space application is the applied curriculum. Use existing Maximal Template code and its approved contracts.

## Curriculum source
[[4.ARCHIVE/40.ARCHIVE.CODEPENDENTCODING/40.ARCHIVE.CODEPENDENTCODING.Dev-Cycles.Source-Document]] · Maximal Template ontology catalog: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog]].


## Canonical Maximal Template ontology source
Source: [[3.RESOURCES/template/context/Ontologies.Canonical-Catalog#2. Project Management / Task Tracker]]

## 2. Project Management / Task Tracker Ontology™

### Routes → implemented entrypoints → templates

| Route                                       | Implemented entrypoint                  | Template                                             |
| ------------------------------------------- | --------------------------------------- | ---------------------------------------------------- |
| `/projects`                                 | `features/projects/projectsFeature.tsx` | `components/templates/projectsTemplate.tsx`          |
| `/projects/new`                             | `features/projects/projectNewForm.tsx`  | —                                                    |
| `/projects/[projectId]`                     | `features/projects/projectFeature.tsx`  | `components/templates/projectDetailTemplate.tsx`     |
| `/projects/[projectId]/edit`                | `features/projects/projectEditForm.tsx` | —                                                    |
| `/projects/[projectId]/tasks`               | `features/projects/tasksFeature.tsx`    | `components/templates/projectTasksTemplate.tsx`      |
| `/projects/[projectId]/tasks/new`           | `features/projects/taskNewForm.tsx`     | —                                                    |
| `/projects/[projectId]/tasks/[taskId]`      | `features/projects/taskFeature.tsx`     | `components/templates/projectTaskDetailTemplate.tsx` |
| `/projects/[projectId]/tasks/[taskId]/edit` | `features/projects/taskEditForm.tsx`    | —                                                    |
| `/projects/[projectId]/timeline`            | `features/projects/timelineFeature.tsx` | `components/templates/projectTimelineTemplate.tsx`   |
| `/my-tasks`                                 | `features/projects/myTasksFeature.tsx`  | `components/templates/myTasksTemplate.tsx`           |

### `projects` feature inventory

```text
features/projects/myTasksFeature.tsx
features/projects/myTasksSkeleton.tsx
features/projects/projectEditForm.tsx
features/projects/projectFeature.tsx
features/projects/projectNewForm.tsx
features/projects/projectSkeleton.tsx
features/projects/projectsFeature.client.tsx
features/projects/projectsFeature.tsx
features/projects/projectsSkeleton.tsx
features/projects/taskEditForm.tsx
features/projects/taskFeature.client.tsx
features/projects/taskFeature.tsx
features/projects/taskNewForm.tsx
features/projects/taskSkeleton.tsx
features/projects/tasksFeature.client.tsx
features/projects/tasksFeature.tsx
features/projects/tasksSkeleton.tsx
features/projects/timelineFeature.tsx
features/projects/timelineSkeleton.tsx
```

### `projects` template inventory

```text
components/templates/myTasksTemplate.tsx
components/templates/projectDetailTemplate.tsx
components/templates/projectTaskDetailTemplate.tsx
components/templates/projectTasksTemplate.tsx
components/templates/projectTimelineTemplate.tsx
components/templates/projectsTemplate.tsx
```

### `projects` server/application inventory

```text
lib/actions/projectsActions.ts
lib/fetchers/projectsFetchers.ts
lib/workflows/projectsWorkflows.ts

lib/db/selects/projects.selects.ts
lib/db/dto/projects.dto.ts
lib/db/transactions/projects.tx.ts
lib/db/transactions/update-task-status.tx.ts

schemas/projectsSchemas.ts
types/projectsTypes.ts
```

Authorization for this ontology uses the shared `lib/authz/` files listed above rather than ontology-specific permission/policy files.

---

## Module assessment
Complete lesson gates with linked Drill Evidence; use a Milestone Review for assessment.

## Lessons
- [[MOD-02-01 Initialization]]
- [[MOD-02-02 Scaffolding]]
- [[MOD-02-03 Configuration]]
- [[MOD-02-04 Verification]]
- [[MOD-02-05 Data]]
- [[MOD-02-06 Features]]
- [[MOD-02-07 Testing]]
- [[MOD-02-08 Validation]]
- [[MOD-02-09 Debug]]
- [[MOD-02-10 Security]]
- [[MOD-02-11 Performance]]
- [[MOD-02-12 Observability]]
- [[MOD-02-13 CI-CD]]
- [[MOD-02-14 Code-Review]]
- [[MOD-02-15 Documentation]]
- [[MOD-02-16 Deploy]]
- [[MOD-02-17 Updates]]
