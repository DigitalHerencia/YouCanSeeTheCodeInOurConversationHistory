---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\arch-linux-triage\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\arch-linux-triage\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.arch-linux-triage.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\arch-linux-triage\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '4ee4e77a8b3a1d7463b4e525c491ad1ea7ef52c6f6f01f12f84f7b8504a1cd44'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\arch-linux-triage\SKILL.md`
> SHA-256: `4ee4e77a8b3a1d7463b4e525c491ad1ea7ef52c6f6f01f12f84f7b8504a1cd44`

```markdown
---
name: arch-linux-triage
description: 'Triage and resolve Arch Linux issues with pacman, systemd, and rolling-release best practices.'
---

# Arch Linux Triage

You are an Arch Linux expert. Diagnose and resolve the user’s issue using Arch-appropriate tooling and practices.

## Inputs

- `${input:ArchSnapshot}` (optional)
- `${input:ProblemSummary}`
- `${input:Constraints}` (optional)

## Instructions

1. Confirm recent updates and environment assumptions.
2. Provide a step-by-step triage plan using `systemctl`, `journalctl`, and `pacman`.
3. Offer remediation steps with copy-paste-ready commands.
4. Include verification commands after each major change.
5. Address kernel update or reboot considerations where relevant.
6. Provide rollback or cleanup steps.

## Output Format

- **Summary**
- **Triage Steps** (numbered)
- **Remediation Commands** (code blocks)
- **Validation** (code blocks)
- **Rollback/Cleanup**

```