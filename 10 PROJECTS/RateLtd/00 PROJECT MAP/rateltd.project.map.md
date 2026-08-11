---
title: RateLtd Project Map
type: map
scope: project
project: RateLtd
domain: project
artifact: map
kind: map
namespace: rateltd.project.map
status: active
authority: source-of-truth
parent: "[[devnotes.projects.map]]"
depends_on:
  - "[[rateltd.product.vision]]"
  - "[[rateltd.product.local-context-protocol.contract]]"
  - "[[rateltd.product.local-operations-console.contract]]"
  - "[[rateltd.product.protocol-completeness.contract]]"
supersedes: []
tags:
  - projects/rateltd
  - maps/project
  - status/active
created:
updated: 2026-08-11
---

# RateLtd Index

RateLtd is the renamed and expanded version of the existing MeatHarness Ink/TypeScript TUI. The product direction is a repo-agnostic local operator console for coding, editing, command execution, filesystem work, Git/GitHub workflows, logs, diagnostics, and agent-assisted implementation.

## Core Documents

- [[rateltd.product.vision]]
- [[rateltd.features.inventory]]
- [[rateltd.architecture.plan]]
- [[rateltd.modules.specifications.contract]]
- [[rateltd.integrations.plan.contract]]
- [[rateltd.execution.task-matrix]]
- [[rateltd.codex.work-packages]]
- [[rateltd.decisions-and-risks]]

## Product Modules

- [[rateltd.modules.specifications.contract#LauncherLtd]]
- [[rateltd.modules.specifications.contract#RateLtd Dashboard]]
- [[rateltd.modules.specifications.contract#EditorLtd]]
- [[rateltd.modules.specifications.contract#CommanderLtd]]
- [[rateltd.modules.specifications.contract#DifferLtd]]
- [[rateltd.modules.specifications.contract#LoggerLtd]]
- [[rateltd.modules.specifications.contract#PreferLtd]]
- [[rateltd.modules.specifications.contract#HelpLtd]]

## Integration Areas

- [[rateltd.integrations.plan.contract#termcn]]
- [[rateltd.integrations.plan.contract#PowerShell]]
- [[rateltd.integrations.plan.contract#Monaco]]
- [[rateltd.integrations.plan.contract#git-split-diffs]]
- [[rateltd.integrations.plan.contract#GitHub]]
- [[rateltd.integrations.plan.contract#Local Repo Scavenging]]

## Execution Tracking

- [[rateltd.execution.task-matrix]]
- [[rateltd.codex.work-packages]]
- [[rateltd.decisions-and-risks]]

## Naming Rule

Use RateLtd naming everywhere with capital `L` and lowercase `td`.

Correct names:

- RateLtd
- LauncherLtd
- EditorLtd
- CommanderLtd
- DifferLtd
- LoggerLtd
- PreferLtd
- HelpLtd

Do not use `LTD`, `Ltd` inconsistently, or the old MeatHarness name in user-facing surfaces unless documenting migration.
