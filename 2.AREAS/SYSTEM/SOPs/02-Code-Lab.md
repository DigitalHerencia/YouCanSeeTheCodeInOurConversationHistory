# Code Lab SOP

## Canonical model

Domain → Dev Cycle → Standard → Pattern → Code Artifact

## Domain

A Domain is a reusable SaaS codebase template representing one product category.

Canonical domains:

1. CRM / Pipeline Tracker
2. Project Management / Task Tracker
3. Customer Support / Ticketing System
4. Marketing Automation & Analytics
5. Invoicing & Expense Tracker
6. Social Media Scheduler
7. AI-Powered Wrapper / Micro-SaaS
8. B2B Client Portal
9. Internal Tools / Admin Portal

## Dev Cycle

Dev Cycles are development timeline categories:

initialization, scaffolding, configuration, features, data, testing, validation, verification, code_review, security, performance, observability, cicd, deploy, documentation, updates, debug.

## Standards

Each Dev Cycle can contain:

- Doctrine — engineering rules and constraints.
- Implementation — approved implementation guidance.
- Rewrite — controlled restructuring guidance.

## Patterns

Patterns are reusable code modules. Canonical pattern catalog:

action, auth, authz, block, cache, config, constant, database, dto-mapper, feature, fetcher, integration, page-template, primitive, prisma-lifecycle, route, schema, select, template, transaction, type, utility, webhook, workflow.

## Code artifacts

Actual code is not stored as Code Lab knowledge. CodeSpace edits the actual repository mounted under `2.AREAS/SYSTEM/_mounts`.

Reusable doctrine remains under `2.AREAS/CODE`.

Git versions actual code and vault changes.

## Project relationship

Project planning determines what is being built. Code Lab determines reusable engineering approach. The two systems link but are not interchangeable.

## Learning

Code Lab learning follows:

Lesson → Applied Drill → Implementation Exercise → Test/Assessment → Evidence → Production Code Artifact.

A project-specific implementation does not silently become reusable doctrine.
