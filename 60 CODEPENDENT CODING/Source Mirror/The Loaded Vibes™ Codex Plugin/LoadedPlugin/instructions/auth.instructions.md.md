---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\auth.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\auth.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.instructions.auth.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\auth.instructions.md'
source_file: 'auth.instructions.md'
source_sha256: 'ed1d8dcd5e95a72ad50b29e1645cc20a7b7a52e737f144f0d65126dacba6229f'
generated: true
---

# `auth.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\auth.instructions.md`
> SHA-256: `ed1d8dcd5e95a72ad50b29e1645cc20a7b7a52e737f144f0d65126dacba6229f`

````markdown
```instructions
---
name: auth.instructions
applyTo: "**"
description: "Instructions for the Auth DevCycle."
---

# Auth DevCycle Instructions

## 1. Purpose
- Integrate Clerk authentication, enforce ABAC/RBAC, and define onboarding/offboarding flows.
- Ensure user/session security, secrets handling, and compliance requirements are satisfied.

## 2. Responsibilities
### 2.1 Identity Integration
- Configure Clerk SDKs, environment variables, and middleware per TechReq §3 DevCycle 6.
- Define session validation in middleware/Server Components and document required headers/cookies.

### 2.2 Access Control Modeling
- Implement role- or attribute-based checks aligned with PRD personas and tenancy model.
- Centralize authorization utilities (e.g., `lib/authz.ts`) with typed policies.

### 2.3 User Lifecycle Flows
- Design onboarding, invitation, suspension, and deletion flows referencing PRD §5 stakeholders.
- Ensure UI states exist for pending verification, revoked access, and recovery scenarios.

### 2.4 Secret & Session Hygiene
- Confirm tokens are stored server-side, sanitized before logging, and rotated per security guidance.
- Update `.env.example` + documentation with required Clerk keys and rotation cadence.

### 2.5 Validation & Auditing
- Write unit/integration tests for auth helpers.
- Document audit requirements (login attempts, admin actions) for Observability DevCycle.

## 3. Inputs
- Data schema (user/tenant tables)
- PRD personas + security requirements
- Clerk configuration docs
- Toolset access (Clerk MCP/fetch, filesystem, sequential thinking)

## 4. Outputs
- Auth configuration files, middleware, helper utilities
- Updated `.env.example`
- Tests verifying auth rules
- Tasks for unresolved auth items + changelog updates

## 5. Success Criteria
- Auth flows cover all PRD personas and failure states.
- Authorization utilities are reusable and tested.
- Secrets are documented without exposing real values.

## 6. Error Handling
- Stop if required env vars or Clerk config is missing.
- Escalate if auth changes impact migrations or data models without Data DevCycle coordination.

## 7. Toolset Hook
Use only tools declared in `../toolsets/auth.toolset.jsonc`.

## 8. Traceability
- WHEN authentication needs implementation or updates, THE SYSTEM SHALL run this Auth DevCycle to enforce security mandates (PRD §7.4, TechReq §3 DevCycle 6).
- WHEN auth risks are found, THE SYSTEM SHALL log mitigation tasks referencing PRD §9 and TechReq §6.
```

````