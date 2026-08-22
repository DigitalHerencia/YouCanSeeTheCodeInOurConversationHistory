---
title: 'The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_deploy.template.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_deploy.template.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.dev-cycles.devcycle-deploy.template.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_deploy.template.md'
source_file: 'devcycle_deploy.template.md'
source_sha256: '34eae710f5aa3b4e47b8b6ad187c2f405e37a632075f73b2c5816f3e3f320b5d'
generated: true
---

# `devcycle_deploy.template.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_deploy.template.md`
> SHA-256: `34eae710f5aa3b4e47b8b6ad187c2f405e37a632075f73b2c5816f3e3f320b5d`

```markdown
---
name: deploy.instructions
applyTo: "**"
description: Instructions for the Deploy DevCycle.
---

# Deploy DevCycle Instructions

The **Deploy** DevCycle defines the universal workflow for releasing the application into a production environment. This phase ensures reliable shipping, post-deploy validation, and rollback readiness. It is fully stack-agnostic at the instruction level.

## 1. Purpose
- Deploy the application to the designated production environment.
- Validate successful release through smoke tests and minimal E2E flows.
- Ensure rollback capability in case of deployment issues.

## 2. Responsibilities
### 2.1 Prepare Deployment Artifacts
The agent MUST:
- Ensure the build artifacts from CI/CD are complete.
- Validate environment variable availability.
- Confirm all necessary secrets are configured.

### 2.2 Execute Deployment
The agent MUST:
- Trigger the production deployment process.
- Document deployment parameters.
- Ensure the correct branch/tag is being deployed.

### 2.3 Run Post-Deployment Validation
The agent MUST perform:
- Smoke tests
- Basic E2E validations
- Health checks

### 2.4 Verify Deployment Stability
The agent MUST:
- Validate logs and runtime behavior.
- Detect immediate regressions.
- Identify any deployment-related faults.

### 2.5 Rollback Readiness
The agent MUST confirm:
- A rollback strategy exists.
- Rollback triggers and conditions are defined.
- Rollback execution steps are ready.

## 3. Inputs
- CI/CD DevCycle outputs
- PRD
- TechReq
- Toolset for Deploy phase
- Build artifacts

## 4. Outputs
- Deployment report
- Smoke test results
- Updated logs and monitoring notes
- Tasks added to `todo.md`
- Changelog entry summarizing deployment

## 5. Success Criteria
Deploy DevCycle is complete when:
- Deployment executes successfully
- Validation tests pass
- No critical issues are detected
- Rollback plan is verified
- Human approves deployment state

## 6. Error Handling
The agent MUST:
- Halt deployment on missing artifacts or secrets
- Abort if critical smoke tests fail
- Provide rollback instructions when needed
- Document failures with actionable remediation steps

These instructions define the complete behavior of the Deploy DevCycle.


```