---
title: 'The Maximal Template™ Domain Library\features\projects\tasksFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\projects\tasksFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.projects.tasksfeature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\features\projects\tasksFeature.tsx'
source_file: 'tasksFeature.tsx'
source_sha256: '684f1f2e64565b88e850d3ec7f2489913db0b83626669b557003cbb9e20ccdf8'
generated: true
---

# `tasksFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\projects\tasksFeature.tsx`
> SHA-256: `684f1f2e64565b88e850d3ec7f2489913db0b83626669b557003cbb9e20ccdf8`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getMyTasks, getProjectTasks } from "@/lib/fetchers/projectsFetchers";

export async function TasksFeature({ projectId }: { projectId?: string }) {
  const tasks = projectId
    ? await getProjectTasks(projectId)
    : await getMyTasks();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Projects"
        title={projectId ? "Project tasks" : "My tasks"}
        description="Assignment and tenant scope are enforced before task DTOs reach this table."
      />
      <DataTableBlock
        columns={[
          { key: "title", label: "Task" },
          { key: "status", label: "Status" },
          { key: "priority", label: "Priority" },
          { key: "assignee", label: "Assignee" },
          { key: "due", label: "Due" },
        ]}
        rows={tasks.map((task) => ({
          id: task.id,
          cells: {
            title: task.title,
            status: task.status,
            priority: task.priority,
            assignee: task.assignee?.displayName ?? null,
            due: task.dueAt ? new Date(task.dueAt).toLocaleDateString() : null,
          },
        }))}
      />
    </div>
  );
}

```