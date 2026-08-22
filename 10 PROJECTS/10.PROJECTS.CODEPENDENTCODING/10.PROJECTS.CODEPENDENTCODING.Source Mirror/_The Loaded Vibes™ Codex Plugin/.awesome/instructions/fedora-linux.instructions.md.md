---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\fedora-linux.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\fedora-linux.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.fedora-linux.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\fedora-linux.instructions.md'
source_file: 'fedora-linux.instructions.md'
source_sha256: '9b771bd0e485ca98548440fbd28203835ecec5f9bc6db5e1066eed54eeb35f0f'
generated: true
---

# `fedora-linux.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\fedora-linux.instructions.md`
> SHA-256: `9b771bd0e485ca98548440fbd28203835ecec5f9bc6db5e1066eed54eeb35f0f`

```markdown
---
description: 'Guidance for Fedora (Red Hat family) systems, dnf workflows, SELinux, and modern systemd practices.'
applyTo: '**'
---

# Fedora Administration Guidelines

Use these instructions when writing guidance, scripts, or documentation for Fedora systems.

## Platform Alignment

- State the Fedora release number when relevant.
- Prefer modern tooling (`dnf`, `systemctl`, `firewall-cmd`).
- Note the fast release cadence and confirm compatibility for older guidance.

## Package Management

- Use `dnf` for installs and updates, and `dnf history` for rollback.
- Inspect packages with `dnf info` and `rpm -qi`.
- Mention COPR repositories only with clear support caveats.

## Configuration & Services

- Use systemd drop-ins in `/etc/systemd/system/<unit>.d/`.
- Use `journalctl` for logs and `systemctl status` for service health.
- Prefer `firewalld` unless using `nftables` explicitly.

## Security

- Keep SELinux enforcing unless the user requests permissive mode.
- Use `semanage`, `setsebool`, and `restorecon` for policy changes.
- Recommend targeted fixes instead of broad `audit2allow` rules.

## Deliverables

- Provide commands in copy-paste-ready blocks.
- Include verification steps after changes.
- Offer rollback steps for risky operations.

```