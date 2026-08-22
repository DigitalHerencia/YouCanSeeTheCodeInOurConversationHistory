---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-version-upgrade\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-version-upgrade\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.qdrant-version-upgrade.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-version-upgrade\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '1a6722e67b24970d52ef94386e162e97f4b4c10eb1599d6d0165050df2ba4993'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\qdrant-version-upgrade\SKILL.md`
> SHA-256: `1a6722e67b24970d52ef94386e162e97f4b4c10eb1599d6d0165050df2ba4993`

```markdown
---
name: qdrant-version-upgrade
description: "Guidance on how to upgrade your Qdrant version without interrupting the availability of your application and ensuring data integrity."
---


# Qdrant Version Upgrade

Qdrant has the following guarantees about version compatibility:

- Major and minor versions of Qdrant and SDK are expected to match. For example, Qdrant 1.17.x is compatible with SDK 1.17.x.

- Qdrant is tested for backward compatibility between minor versions. For example, Qdrant 1.17.x should be compatible with SDK 1.16.x. Qdrant server 1.16.x is also expected to be compatible with SDK 1.17.x, but only for the subset of features that were available in 1.16.x.

- For migration to the next minor version, it is recommended to first upgrade the SDK to the next minor version and then upgrade the Qdrant server.

- Storage compatibility is only guaranteed for one minor version. For example, data stored with Qdrant 1.16.x is expected to be compatible with Qdrant 1.17.x. If you need to migrate more than one minor version, it is required do the upgrade step by step, one minor version at a time. For example, to migrate from 1.15.x to 1.17.x, you need to first upgrade to 1.16.x and then to 1.17.x. Note: Qdrant Cloud automates this process, so you can directly upgrade from 1.15.x to 1.17.x without intermediate steps.

- A Qdrant cluster with a replication factor of 2 or higher can be upgraded without downtime by performing a rolling upgrade. This means that you can upgrade one node at a time while the other nodes continue to serve requests. This allows you to maintain availability of your application during the upgrade process. More about replication factor: [Replication factor](https://search.qdrant.tech/md/documentation/operations/distributed_deployment/?s=replication-factor)

For managing Qdrant version upgrades in Qdrant Cloud, you can use the [qcloud](https://github.com/qdrant/qcloud-cli) CLI tool.

```