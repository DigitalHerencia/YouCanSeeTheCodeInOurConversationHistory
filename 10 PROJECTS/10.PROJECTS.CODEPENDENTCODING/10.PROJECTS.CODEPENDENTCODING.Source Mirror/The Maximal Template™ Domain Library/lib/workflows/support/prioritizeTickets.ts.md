---
title: 'The Maximal Template™ Domain Library\lib\workflows\support\prioritizeTickets.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\support\prioritizeTickets.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.support.prioritizetickets.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\support\prioritizeTickets.ts'
source_file: 'prioritizeTickets.ts'
source_sha256: '7fc1125c5ae3b54fb3309d3825d305764bf0ef5f609052b8e5b7adf42cc56997'
generated: true
---

# `prioritizeTickets.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\support\prioritizeTickets.ts`
> SHA-256: `7fc1125c5ae3b54fb3309d3825d305764bf0ef5f609052b8e5b7adf42cc56997`

```ts
const priorityWeight: Record<string, number> = {
  URGENT: 4,
  HIGH: 3,
  NORMAL: 2,
  LOW: 1,
};
export function prioritizeTickets<
  T extends { priority: string; createdAt: Date; resolutionDueAt: Date | null },
>(tickets: T[], now = new Date()) {
  return [...tickets].sort((a, b) => {
    const score = (ticket: T) =>
      (priorityWeight[ticket.priority] ?? 0) * 1_000_000 +
      (ticket.resolutionDueAt && ticket.resolutionDueAt <= now
        ? 10_000_000
        : 0) +
      (now.getTime() - ticket.createdAt.getTime()) / 3_600_000;
    return score(b) - score(a);
  });
}

```