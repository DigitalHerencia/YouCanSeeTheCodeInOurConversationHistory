---
title: Codependent Coding Code Space Pilot
namespace: codependent-coding.vibes.code-space-pilot.execution
role: vibes
system: codependent-coding
workspace: codependent-coding
type: execution
status: active
authority: implementation-evidence
source_root: D:/_The Codependent Coding™ WebApp Architecture_/The Hipster Stack™ Technology Stack
mount_path: _mounts/TheHipsterStack
repository_status: git-checkout
created: 2026-08-23
updated: 2026-08-23
tags:
  - workspace/codependent-coding
  - obsidian/code-space
  - migration/pilot
---

# Code Space Pilot

## Implemented

- Code Space 2.3.0 external mounts are enabled in local-only plugin state.
- The specific trusted Hipster Stack repository is mounted at `_mounts/TheHipsterStack`.
- The plugin is configured to use a Windows junction, not an entire development drive.
- Mount data remains Git-ignored because it contains a machine-specific absolute path.

## Authority boundary

The mounted source is a real Git checkout. Its repository boundary is preserved inside the narrow mount, so Code Space exposes live code without treating the surrounding development tree as one repository. A second nested Git checkout, `The Maximal Template™ Domain Library`, was identified as a future candidate but is not mounted by this pilot.

## Source Mirror result

The recorded SHA-256 values for all 3,076 generated Source Mirror artifacts match files under the surrounding Codependent Coding source root. That classification remains independent of the narrower live-repository mount. See [[devnotes.source-mirror.classification.report]].

> [!blocked] Deletion gate
> No Source Mirror file may be deleted until explicit approval and verification that namespace links, path-qualified wikilinks, embeds, Dataview queries, and replacement live-code links remain usable.
