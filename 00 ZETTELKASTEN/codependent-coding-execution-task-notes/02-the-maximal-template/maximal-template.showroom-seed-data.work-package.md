---
title: "Replace Proof-of-Existence Seeds with Showroom-Quality Data"
type: work-package
scope: project
project: "The Maximal Template"
domain: "showroom"
artifact: "showroom-seed-data"
kind: work-package
namespace: maximal-template.showroom-seed-data.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  []
supersedes: []
tags:
  - projects/maximal-template
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Showroom"
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
