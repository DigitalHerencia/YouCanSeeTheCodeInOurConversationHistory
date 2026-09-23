---
title: ChatGPT Projects Operating System
type: map
scope: project
project: ChatGPT Projects
domain: chatgpt-projects
artifact: operating-system
kind: map
namespace: chatgpt-projects.project.map
status: active
authority: derived
parent: "[[devnotes.projects.map]]"
depends_on:
  - "[[software-development.engineering-practice.stupid-lesson.reference]]"
supersedes: []
tags:
  - projects/chatgpt-projects
  - chatgpt/projects
  - operating-system
  - status/active
created: 2026-08-11
updated: 2026-08-11
---

# ChatGPT Projects Operating System

> [!info] Authority
> This note preserves the reviewed 2026-08-11 ChatGPT Project operating-system package as durable institutional memory. It is **derived**, not a claim that every Project is currently configured exactly this way. Live Project settings, current user instructions, and connected-system state remain operational truth.

## Purpose

The eight ChatGPT Projects form a small specialized operating system. Each Project owns a recurring responsibility boundary; the user remains the orchestration authority. The system is intentionally a routing model rather than a mandatory pipeline.

The governing idea from the source package is:

> Structure exists to reduce the distance between intent and a finished result.

## Role Topology

| Project | Primary responsibility | Explicit non-owner |
|---|---|---|
| [[chatgpt-projects.prompter.configuration.source-document|Prömpter]] | Prompt engineering and requirements normalization | Default execution |
| [[chatgpt-projects.trust-issues.configuration.source-document|Trust Issues]] | Independent post-execution verification and bounded remediation | New product/assurance scope |
| [[chatgpt-projects.execution.configuration.source-document|Execution]] | Bounded implementation and GitHub delivery | Platform redesign and independent final verification |
| [[chatgpt-projects.vibes.configuration.source-document|Vibes]] | Platform engineering, DevOps, system design, deep troubleshooting | Default feature implementation |
| [[chatgpt-projects.devnotes.configuration.source-document|DevNotes]] | Institutional memory and Obsidian knowledge architecture | Implementation, operations, QA, business ops, scheduling |
| [[chatgpt-projects.fuck-you-pay-me.configuration.source-document|Fuck You Pay Me]] | Business operations, RevOps, sales/admin/financial follow-through | Software implementation |
| [[chatgpt-projects.data-modeler.configuration.source-document|Data Modeler]] | Domain modeling, Postgres/Prisma/data boundaries and transactions | Full feature implementation and platform ops |
| [[chatgpt-projects.chief-of-staff.configuration.source-document|Chief of Staff]] | Schedule, reminders, priorities, cadence and follow-through | Technical orchestration of every Project |

## Routing Model

Use the minimum set of Projects that materially helps.

1. Wording, instruction design, or reusable prompts → [[chatgpt-projects.prompter.configuration.source-document|Prömpter]].
2. Domain semantics, data relationships, persistence, migrations, DTOs, or transactions → [[chatgpt-projects.data-modeler.configuration.source-document|Data Modeler]].
3. Architecture, tooling, CI/CD, configuration, deployment, environment, or deep technical diagnosis → [[chatgpt-projects.vibes.configuration.source-document|Vibes]].
4. Bounded implementation and delivery → [[chatgpt-projects.execution.configuration.source-document|Execution]].
5. A completion claim that needs independent evidence → [[chatgpt-projects.trust-issues.configuration.source-document|Trust Issues]].
6. Context worth preserving across sessions → [[chatgpt-projects.devnotes.configuration.source-document|DevNotes]].
7. Leads, customers, invoices, money, correspondence, or business obligations → [[chatgpt-projects.fuck-you-pay-me.configuration.source-document|Fuck You Pay Me]].
8. Time, priorities, reminders, routines, deadlines, or follow-up timing → [[chatgpt-projects.chief-of-staff.configuration.source-document|Chief of Staff]].

A task may cross boundaries, but no task is required to visit every Project.

## Common Handoffs

A useful handoff contains only what the receiving role needs: objective/originating specification, current artifact or repository reference, relevant constraints/invariants, current state, unresolved question or next action, and evidence that materially affects the next decision.

- Prömpter → Execution: implementation-ready prompt/spec with objective scope and acceptance criteria.
- Prömpter → Data Modeler: domain/modeling problem with product semantics and constraints.
- Data Modeler → Execution: approved entities, relations, states, invariants, schema/migration plan, query/DTO/transaction contracts, and focused acceptance criteria.
- Vibes → Execution: architecture/governance/root-cause decision plus bounded implementation change.
- Execution → Trust Issues: originating requirements, actual artifact, completion claims, checks actually run, and known limitations.
- Trust Issues → Execution: confirmed defects and evidence only, not a new backlog.
- Any Project → DevNotes: only context with real future recovery value.
- Any Project → Chief of Staff: future commitment with a concrete trigger, time/cadence, and useful next action.
- Fuck You Pay Me → Chief of Staff: follow-up dates, payment deadlines, outreach reminders, or waiting conditions.

## Cross-Cutting Proportionality

[[software-development.engineering-practice.stupid-lesson.reference|The Stupid Lesson]] constrains the whole operating model:

1. Identify the actual outcome.
2. Use the least elaborate structure or evidence that materially helps establish it.
3. Scale rigor with consequence, uncertainty, irreversibility, and blast radius.
4. Do not create validators, governance, documentation, meetings, or automation whose principal output is more metawork.
5. Stop when decision-relevant uncertainty is resolved.

## Cheap Recovery

A bad model run should be cheap to abandon. Preserve the specification, current artifact/state, and concrete failure; then start a clean thread or hand the bounded state to another role. Use Trust Issues for factual completion disputes, DevNotes for durable lessons, and Chief of Staff only when the interruption changes timing or follow-through.

## Source Authority

When source material conflicts, use this order:

1. Current explicit user instruction.
2. The active Project's own instructions.
3. For repository work, repository-local AGENTS/instructions/specifications/contracts and live state.
4. User-owned canonical doctrine for the domain, including [[codependentcoding.knowledge-system.definition.source-document]], [[loadedvibes.project.source-document]], and DevNotes contracts where applicable.
5. Persistent Project sources.
6. Generic third-party agents, plugins, and skills as techniques.
7. General model knowledge.

Uploading an agent or skill as a source does not recursively install its persona, original tools, or mandatory ceremony. Static references do not prove current product state.

## System Decisions Preserved from the Package

- The user remains the orchestrator; there is no supreme orchestration Project.
- Do not create dedicated Product, Design, or Marketing Projects merely to complete an org chart.
- Product strategy remains primarily user-owned, with Prömpter and Vibes assisting where appropriate.
- Design remains an invoked capability until it becomes a recurring independent context domain.
- Marketing remains with commercial operations until workload justifies a split.
- Google Drive may be a browseable document surface, but GitHub and other connected live systems remain the source of truth for volatile state.

## Time-Sensitive Assumptions from the 2026-08-11 Source Package

The source package recorded several OpenAI product constraints current on 2026-08-11, including limits around Project files, Scheduled Tasks, and Custom Instructions. These are intentionally **not promoted to timeless rules here**. Re-check current official OpenAI documentation whenever those facts affect an operation.

## Provenance

This map consolidates the package README, status report, operating model, handoff playbook, source-authority rules, source audit, product-constraint snapshot, and eight Project instruction/source manifests that were processed from `00 ZETTELKASTEN` on 2026-08-11. Copied third-party agent/skill/plugin snapshots were treated as provenance and techniques, not new DevNotes canon.
