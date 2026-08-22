---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_observability.template.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_observability.template.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.templates.devcycle-observability.template.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_observability.template.md'
source_file: 'devcycle_observability.template.md'
source_sha256: 'c9229abf8abc8b3142f595c9f021275e2278ae7f2eb8349cf169b780c055ae6f'
generated: true
---

# `devcycle_observability.template.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\templates\devcycle_observability.template.md`
> SHA-256: `c9229abf8abc8b3142f595c9f021275e2278ae7f2eb8349cf169b780c055ae6f`

```markdown
---
name: observability.instructions
applyTo: "**"
description: Instructions for the Observability DevCycle.
---

# Observability DevCycle Instructions

The **Observability** DevCycle defines how the system is monitored, logged, traced, and measured in real-world execution. This phase is stack-agnostic at the instruction level.

## 1. Purpose
- Ensure the system is fully observable during runtime.
- Provide monitoring, logging, tracing, and alerting capabilities.
- Align observability design with PRD + TechReq.

## 2. Responsibilities
### 2.1 Define Logging Strategy
The agent MUST:
- Identify what events should be logged.
- Define required metadata for logs.
- Define severity/level structure (info, warn, error, etc.).
- Ensure logs avoid PII exposure.

### 2.2 Define Metrics Strategy
The agent MUST specify:
- Key performance indicators (KPIs).
- Business-critical metrics.
- Operational metrics.
- Error rate metrics.

### 2.3 Define Tracing Strategy
- Establish basic request tracing.
- Identify multi-step workflows requiring trace spans.
- Map high-level architecture to traceable segments.

### 2.4 Define Alerts
The agent MUST:
- Identify critical failure conditions.
- Define alert triggers.
- Specify severity tiers.

### 2.5 Ensure Compliance with PRD + TechReq
The agent MUST:
- Validate observability requirements exist in specs.
- Surface missing monitoring or reporting expectations.

## 3. Inputs
- PRD
- TechReq
- Performance DevCycle outputs
- Toolset for Observability phase

## 4. Outputs
- Logging specification
- Metrics specification
- Tracing specification
- Alerts specification
- Tasks added to `todo.md`
- Changelog entry summarizing observability decisions

## 5. Success Criteria
Observability DevCycle is complete when:
- Logging rules are fully defined
- Metrics are mapped to system behaviors
- Tracing is logically planned
- Alert conditions cover critical scenarios
- Human approves the observability specification

## 6. Error Handling
The agent MUST:
- Halt if observability is insufficient to detect critical failures
- Detect missing or contradictory metrics
- Identify unclear workflow traces
- Provide corrective recommendations

These instructions define the complete behavior of the Observability DevCycle.


```