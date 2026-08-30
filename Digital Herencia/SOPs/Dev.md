---
title: Dev
entity: sop
document_id: DevCycle Instructions
source_status: Source Collection
source: Notion
source_url: https://app.notion.com/2dba4e63bf23803aafc0c58095ec268f
tags:
  - digital-herencia/sop
  - development
  - devcycle
---

# DevCycle Instructions

The Notion `Dev` SOP is a large collection of stack-agnostic development-cycle instructions. The migrated operating concepts recovered from the source include the following cycles.

## CI/CD

Purpose: automate testing, building, deployment, and quality/security enforcement.

Required concerns include linting, type checking when applicable, unit/integration/E2E tests, builds, preview/production deployment, promotion/approval, rollback, GitHub Actions, secure secret handling, validation against PRD/TechReq, and human approval.

## Code Review

Purpose: evaluate correctness, maintainability, standards compliance, and implementation alignment with PRD/TechReq.

Responsibilities include diff review, architectural consistency, anti-pattern detection, lint/format/type/security checks, acceptance-criteria validation, line/module-specific feedback, required fixes, and human approval before completion.

## Configuration

Purpose: establish the project configuration baseline.

Concerns include linters, formatters, type checkers, testing frameworks, configuration files, `.env.example`, workspace settings, consistency against PRD/TechReq, validation, and explicit handling of conflicting/missing configuration.

## Data

Purpose: translate PRD/TechReq data requirements into a structured schema, migration plan, and seed requirements.

Concerns include entities, fields, relationships, validation, indexes/query patterns, constraints/lifecycle events, safe migrations, seed scenarios, consistency checks, and halting on unresolved schema ambiguity.

## Debug

Purpose: identify, diagnose, fix, retest, and document defects.

The cycle requires root-cause analysis, expected-vs-actual comparison, targeted fixes, regression testing, validation against requirements, and explicit handling when defects cannot be reproduced.

## Deploy

Purpose: release to production with validation and rollback readiness.

Concerns include build artifacts, environment/secrets, correct branch/tag, deployment execution, smoke/E2E/health checks, logs/runtime behavior, rollback triggers, and human approval.

## Documentation

Purpose: externalize current project state for human understanding and generate/update core repository documentation and templates from validated requirements and completed development work.

## Source-preservation note

The Notion page contains a substantially larger instruction corpus than can be represented by a single database row. This note preserves the retrieved cycle semantics and its original Notion source URL. No new DevCycle doctrine has been invented during migration.
