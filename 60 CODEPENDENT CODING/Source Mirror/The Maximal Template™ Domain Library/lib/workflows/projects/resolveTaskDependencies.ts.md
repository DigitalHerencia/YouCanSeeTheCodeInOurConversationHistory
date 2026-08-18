---
title: 'The Maximal Template™ Domain Library\lib\workflows\projects\resolveTaskDependencies.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\projects\resolveTaskDependencies.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.projects.resolvetaskdependencies.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\projects\resolveTaskDependencies.ts'
source_file: 'resolveTaskDependencies.ts'
source_sha256: 'fb8050af62b51d481d72ec65d70d1ea06c8b3c969519ad6995a836b7e5703d41'
generated: true
---

# `resolveTaskDependencies.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\projects\resolveTaskDependencies.ts`
> SHA-256: `fb8050af62b51d481d72ec65d70d1ea06c8b3c969519ad6995a836b7e5703d41`

```ts
export function resolveTaskDependencies(
  tasks: Array<{ id: string; status: string; dependsOnTaskIds: string[] }>,
) {
  const byId = new Map(tasks.map((task) => [task.id, task]));
  const visiting = new Set<string>();
  const visited = new Set<string>();
  const visit = (id: string) => {
    if (visiting.has(id)) throw new Error("Task dependencies contain a cycle.");
    if (visited.has(id)) return;
    visiting.add(id);
    for (const dependencyId of byId.get(id)?.dependsOnTaskIds ?? []) {
      if (!byId.has(dependencyId))
        throw new Error(`Task dependency ${dependencyId} does not exist.`);
      visit(dependencyId);
    }
    visiting.delete(id);
    visited.add(id);
  };
  for (const task of tasks) visit(task.id);
  return tasks
    .filter((task) =>
      task.dependsOnTaskIds.some((id) => byId.get(id)?.status !== "DONE"),
    )
    .map((task) => task.id);
}

```