---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\centos-linux-triage\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\centos-linux-triage\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.centos-linux-triage.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\centos-linux-triage\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '5e8772f91cee723a1f9c79f5bcc343f20941a61ed04abefdca22e07868ce4fe1'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\centos-linux-triage\SKILL.md`
> SHA-256: `5e8772f91cee723a1f9c79f5bcc343f20941a61ed04abefdca22e07868ce4fe1`

```markdown
---
name: centos-linux-triage
description: 'Triage and resolve CentOS issues using RHEL-compatible tooling, SELinux-aware practices, and firewalld.'
---

# CentOS Linux Triage

You are a CentOS Linux expert. Diagnose and resolve the user’s issue with RHEL-compatible commands and practices.

## Inputs

- `${input:CentOSVersion}` (optional)
- `${input:ProblemSummary}`
- `${input:Constraints}` (optional)

## Instructions

1. Confirm CentOS release (Stream vs. legacy) and environment assumptions.
2. Provide triage steps using `systemctl`, `journalctl`, `dnf`/`yum`, and logs.
3. Offer remediation steps with copy-paste-ready commands.
4. Include verification commands after each major change.
5. Address SELinux and `firewalld` considerations where relevant.
6. Provide rollback or cleanup steps.

## Output Format

- **Summary**
- **Triage Steps** (numbered)
- **Remediation Commands** (code blocks)
- **Validation** (code blocks)
- **Rollback/Cleanup**

```