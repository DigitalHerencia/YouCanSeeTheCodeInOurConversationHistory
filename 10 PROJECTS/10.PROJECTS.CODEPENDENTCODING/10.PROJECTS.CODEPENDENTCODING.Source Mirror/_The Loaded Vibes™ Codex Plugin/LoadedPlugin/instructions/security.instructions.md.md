---
title: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\security.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\security.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedplugin.instructions.security.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\security.instructions.md'
source_file: 'security.instructions.md'
source_sha256: '927e7d1e09819d28aca0e28aed9f656cf2419c867ef260176e4206c0f381432d'
generated: true
---

# `security.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedPlugin\instructions\security.instructions.md`
> SHA-256: `927e7d1e09819d28aca0e28aed9f656cf2419c867ef260176e4206c0f381432d`

````markdown
```instructions
---
name: security.instructions
applyTo: "**"
description: "Instructions for the Security DevCycle."
---

# Security DevCycle Instructions

## 1. Purpose
- Harden the application across CSP, HSTS, route protection, secret management, and logging hygiene dimensions.
- Validate that security requirements in PRD §9 and TechReq §6 are enforced.

## 2. Responsibilities
### 2.1 Policy Definition
- Review threat model, ABAC/RBAC matrices, and compliance requirements; update as needed.
- Document security policies in a centralized reference (e.g., `docs/SECURITY.md`).

### 2.2 Application Hardening
- Configure CSP/HSTS headers, secure cookies, rate limiting, and middleware guards.
- Inspect dependencies for known vulnerabilities; propose upgrades or mitigations.

### 2.3 Secret & Key Management
- Audit `.env` usage, rotate secrets where necessary, and document storage/rotation owners.
- Ensure telemetry/logging redact PII and secrets.

### 2.4 Security Testing
- Run automated scanners (e.g., `npm audit`, dependency review), targeted penetration scripts, or manual reviews for high-risk areas.
- Coordinate with Testing/Observability to capture evidence.

### 2.5 Reporting
- Summarize risks, mitigations, and residual actions for stakeholders.
- File tasks for remediation items that cannot be addressed immediately.

## 3. Inputs
- PRD/TechReq security sections
- Auth/Data outputs
- Dependency manifest + lockfiles
- Toolset for Security cycle

## 4. Outputs
- Updated security configs/middleware/docs
- Audit logs, scanner reports, or manual review notes
- Tasks + changelog entries for mitigations

## 5. Success Criteria
- Security controls meet documented requirements; outstanding risks are tracked.
- No secrets committed; telemetry sanitized.
- Human reviewer (security owner) signs off on the hardening pass.

## 6. Error Handling
- Halt if tooling indicates severe vulnerability; coordinate with stakeholders before proceeding.
- Escalate if secrets or credentials leak; rotate immediately.

## 7. Toolset Hook
Use only the tools defined in `../toolsets/security.toolset.jsonc`.

## 8. Traceability
- WHEN security posture must be assessed or improved, THE SYSTEM SHALL run this Security DevCycle (PRD §7.4, TechReq §3 DevCycle 11).
- WHEN issues exist, THE SYSTEM SHALL log mitigation plans referencing PRD §9 and TechReq §6/§7.
```

````