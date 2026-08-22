---
title: 'The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_security.template.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_security.template.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.dev-cycles.devcycle-security.template.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_security.template.md'
source_file: 'devcycle_security.template.md'
source_sha256: '84072be98201a03273042f03a418c69f795fe64006663691c9a6bd5c5d576331'
generated: true
---

# `devcycle_security.template.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\dev-cycles\devcycle_security.template.md`
> SHA-256: `84072be98201a03273042f03a418c69f795fe64006663691c9a6bd5c5d576331`

```markdown
---
name: security.instructions
applyTo: "**"
description: Instructions for the Security DevCycle.
---

# Security DevCycle Instructions

The **Security** DevCycle enforces systemwide protection, privacy requirements, boundary controls, and safe operation rules. This phase ensures that the entire system—from auth to data to features—is hardened against misuse, exploitation, or accidental data exposure.

This phase is entirely stack-agnostic at the instruction level.

## 1. Purpose
- Secure the application across all layers.
- Validate compliance with PRD + TechReq security requirements.
- Enforce least-privilege access across tools, APIs, MCP servers, and features.
- Protect user data, session integrity, and system boundaries.

## 2. Responsibilities
### 2.1 Review Authentication & Authorization
The agent MUST:
- Validate that Auth DevCycle rules are enforced everywhere.
- Ensure privileged routes are protected.
- Detect privilege escalation opportunities.

### 2.2 Enforce Systemwide Security Headers
Define universal requirements for:
- Content-Security-Policy (CSP)
- HSTS
- X-XSS-Protection
- X-Frame-Options
- Referrer-Policy
- Permissions-Policy

Stack-specific agent decides implementation.

### 2.3 Protect Data Privacy
The agent MUST:
- Identify all PII fields in the Data DevCycle
- Ensure proper handling, redaction, and retention rules
- Validate logging does not expose sensitive fields

### 2.4 Restrict Access to Tools and MCP Servers
Toolset security boundaries MUST:
- Restrict access to only required servers
- Validate proper scoping of permissions
- Detect excessive capabilities

### 2.5 Evaluate External Integrations
For all external services or APIs:
- Validate secret handling
- Validate access scopes
- Detect insecure configurations

## 3. Inputs
- Auth DevCycle outputs
- Data DevCycle outputs
- Feature modules
- Toolset for Security phase
- PRD + TechReq security requirements

## 4. Outputs
- Security audit report
- Updated toolset restrictions
- Secured headers specification
- PII handling policy
- Tasks added to `todo.md`
- Changelog entry summarizing security improvements

## 5. Success Criteria
Security DevCycle is complete when:
- No unauthorized access paths exist
- All PII is properly protected
- Security headers are defined
- Toolset boundaries are correct
- Human approves the audit

## 6. Error Handling
The agent MUST:
- Halt if critical vulnerabilities exist
- Detect missing auth protection
- Surface insecure defaults
- Provide specific correction tasks

These instructions define the complete behavior of the Security DevCycle.


```