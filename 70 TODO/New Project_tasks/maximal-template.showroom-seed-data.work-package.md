---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "qf38wq94msy9z0z7"
title: "maximal-template.showroom-seed-data.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:21:56.275Z"
updatedAt: "2026-08-18T06:21:56.275Z"
---

# Replace Proof-of-Existence Seeds with Showroom-Quality Data

**Priority:** P0  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Populate the existing demo organization with realistic, relational data that makes every major UI archetype visually meaningful.

## Why This Exists

The audited database had roughly one record per domain, which proves schema existence but cannot demonstrate pipelines, kanban boards, analytics, queues, calendars, timelines, or audit history.

## Execution Checklist

- [ ] Keep one demo organization unless a multi-tenant visual example is explicitly needed.
- [ ] Create realistic CRM accounts, contacts, deals, stages, owners, activity, and pipeline distributions.
- [ ] Create multiple projects, milestones, tasks, statuses, assignees, deadlines, and dependencies.
- [ ] Create support tickets across open, escalated, pending, and resolved states with conversation/history.
- [ ] Create campaigns/audiences/results sufficient for marketing analytics.
- [ ] Create invoices/expenses across draft, sent, paid, overdue, and other supported states.
- [ ] Populate social calendar, drafts, scheduled/published posts, and media references.
- [ ] Populate AI generation history/usage states without exposing secrets.
- [ ] Populate portal documents and approvals/statuses where supported.
- [ ] Populate admin/audit events with believable actors and categories.
- [ ] Use deterministic seed values so screenshots/tests remain reproducible.

## Acceptance Criteria

- [ ] Every recipe has enough records to demonstrate its intended UI archetype.
- [ ] Relationships are coherent and do not create impossible tenant/resource combinations.
- [ ] Seed execution is repeatable.
- [ ] No real PII or secrets are introduced.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `The Maximal Template™ Demo Doctrine.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]