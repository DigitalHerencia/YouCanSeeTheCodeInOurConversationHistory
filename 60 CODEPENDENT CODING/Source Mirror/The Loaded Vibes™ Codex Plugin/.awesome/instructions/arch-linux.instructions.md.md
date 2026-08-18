---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\arch-linux.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\arch-linux.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.arch-linux.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\arch-linux.instructions.md'
source_file: 'arch-linux.instructions.md'
source_sha256: '30308f27f7ccd547343706d13746ebead8083f9f303b13770b1de03f0522ad93'
generated: true
---

# `arch-linux.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\arch-linux.instructions.md`
> SHA-256: `30308f27f7ccd547343706d13746ebead8083f9f303b13770b1de03f0522ad93`

```markdown
---
description: 'Guidance for Arch Linux administration, pacman workflows, and rolling-release best practices.'
applyTo: '**'
---

# Arch Linux Administration Guidelines

Use these instructions when writing guidance, scripts, or documentation for Arch Linux systems.

## Platform Alignment

- Emphasize the rolling-release model and the need for full upgrades.
- Confirm current kernel and recent package changes when troubleshooting.
- Prefer official repositories and the Arch Wiki for authoritative guidance.

## Package Management

- Use `pacman -Syu` for full system upgrades; avoid partial upgrades.
- Inspect packages with `pacman -Qi`, `pacman -Ql`, and `pacman -Ss`.
- Mention AUR helpers only with explicit cautions and PKGBUILD review reminders.

## Configuration & Services

- Keep configuration under `/etc` and avoid editing files in `/usr`.
- Use systemd drop-ins in `/etc/systemd/system/<unit>.d/`.
- Use `systemctl` and `journalctl` for service control and logs.

## Security

- Note reboot requirements after kernel or core library upgrades.
- Recommend least-privilege `sudo` usage and minimal packages.
- Call out firewall tooling expectations (nftables/ufw) explicitly.

## Deliverables

- Provide commands in copy-paste-ready blocks.
- Include validation steps after changes.
- Offer rollback or cleanup steps for risky operations.

```