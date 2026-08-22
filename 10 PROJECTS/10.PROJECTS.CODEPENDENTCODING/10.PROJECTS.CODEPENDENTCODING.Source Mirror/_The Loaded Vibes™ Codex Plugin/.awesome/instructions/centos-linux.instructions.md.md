---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\centos-linux.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\centos-linux.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.centos-linux.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\centos-linux.instructions.md'
source_file: 'centos-linux.instructions.md'
source_sha256: '8cf9e52de20756c8f145ad7bc18efa13fccb182db19152bce5acc42e071a5d3f'
generated: true
---

# `centos-linux.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\centos-linux.instructions.md`
> SHA-256: `8cf9e52de20756c8f145ad7bc18efa13fccb182db19152bce5acc42e071a5d3f`

```markdown
---
description: 'Guidance for CentOS administration, RHEL-compatible tooling, and SELinux-aware operations.'
applyTo: '**'
---

# CentOS Administration Guidelines

Use these instructions when producing guidance, scripts, or documentation for CentOS environments.

## Platform Alignment

- Identify CentOS version (Stream vs. legacy) and tailor commands.
- Prefer `dnf` for Stream/8+ and `yum` for CentOS 7.
- Use RHEL-compatible terminology and paths.

## Package Management

- Verify repositories with GPG checks enabled.
- Use `dnf info`/`yum info` and `dnf repoquery` for package details.
- Use `dnf versionlock` or `yum versionlock` for stability where needed.
- Call out EPEL dependencies and how to enable/disable them safely.

## Configuration & Services

- Place service environment files in `/etc/sysconfig/` when required.
- Use systemd drop-ins for overrides and `systemctl` for control.
- Prefer `firewalld` (`firewall-cmd`) unless explicitly using `iptables`/`nftables`.

## Security

- Keep SELinux in enforcing mode whenever possible.
- Use `semanage`, `restorecon`, and `setsebool` for policy adjustments.
- Reference `/var/log/audit/audit.log` for denials.

## Deliverables

- Provide commands in copy-paste-ready blocks.
- Include verification steps after changes.
- Offer rollback steps for risky operations.

```