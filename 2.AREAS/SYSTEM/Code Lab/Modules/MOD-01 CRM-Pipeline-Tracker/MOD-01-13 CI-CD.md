---
type: lesson
id: LESS-001.13
module: "[[Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
mastery_state: not-started
mastery: 0
confidence: 0
next_review: null
created: 2026-09-26
updated: 2026-09-26
tags: [type/codelab]
lesson: "CI/CD"
mastery_state: not-started
mastery: 0
confidence: 0
last_attempted: ""
next_review: ""
---
# CI/CD

## Doctrine
Apply this DevCycle to its real Maximal Template surface. Record actual changed paths, checks, evidence, and remaining constraints.

## DevCycle source
[[3.RESOURCES/Digital Herencia/SOPs/Dev 2dba4e63bf23803aafc0c58095ec268f#CI/CD DevCycle Instructions]]

The **CI/CD** DevCycle defines how continuous integration and continuous deployment workflows are automated, validated, and aligned with the project’s requirements. This DevCycle is universal and stack-agnostic.

## 1. Purpose

- Automate testing, building, and deployment.
- Ensure consistency across all project branches.
- Enforce quality and security requirements through automated workflows.

## 2. Responsibilities

### 2.1 Define CI Workflow Requirements

The agent MUST specify workflows for:
- Linting
- Type-checking (if applicable)
- Running unit tests
- Running integration tests
- Running E2E tests
- Building the project

### 2.2 Define CD Workflow Requirements

The agent MUST define:
- Preview deployment workflow
- Production deployment workflow
- Promotion and approval steps
- Rollback plan

### 2.3 Configure GitHub Actions

The agent MUST generate or update:
- `.github/workflows/*.yml` configuration files
- Reusable workflow blocks (if applicable)
- Secret references for environment variables

### 2.4 Enforce Constraints

The agent MUST:
- Follow global instructions
- Use only tools in the CI/CD toolset
- Use secure secret handling
- Enforce proper branching strategy

### 2.5 Validate Requirements

The agent MUST:
- Validate that the CI pipeline executes correctly
- Validate that the CD workflow aligns with PRD + TechReq
- Detect missing steps or insecure automations

## 3. Inputs

- PRD
- TechReq
- All prior DevCycle outputs
- Toolset for CI/CD phase

## 4. Outputs

- CI configuration files
- CD configuration files
- Deployment plan
- Tasks added to `todo.md`
- Changelog entry summarizing CI/CD creation or updates

## 5. Success Criteria

The CI/CD DevCycle is complete when:
- All workflows exist and run without errors
- Deployment flow aligns with project requirements
- Secrets and environment variables are properly referenced
- Human approves the CI/CD setup

## 6. Error Handling

The agent MUST:
- Halt if required workflows cannot be validated
- Flag insecure configurations
- Detect missing secrets or environment variables
- Provide corrective actions

These instructions define the complete behavior of the CI/CD DevCycle.


## Applied drill
Link the TaskNotes task that implements this DevCycle.

## Human controls
Mastery: `INPUT[number:mastery]` · Confidence: `INPUT[number:confidence]` · State: `INPUT[select(option(not-started), option(in-progress), option(in-review), option(mastered)):mastery_state]` · Review: `INPUT[date:next_review]`





