---
title: Codependent Coding Code Space Workspace
namespace: codependent-coding.vibes.code-space-pilot.execution
role: vibes
system: codependent-coding
workspace: codependent-coding
type: execution
status: active
authority: implementation-evidence
source_root: D:/TheCodependentCodingWebAppArchitecture
mount_path: _mounts/CodependentCoding
repository_status: source-directory-not-git-checkout
created: 2026-08-23
updated: 2026-08-23
tags:
  - workspace/codependent-coding
  - obsidian/code-space
  - migration/pilot
---

# Code Space Workspace

## Implemented

- Code Space 2.3.0 external mounts are enabled in local-only plugin state.
- The complete trusted Codependent Coding source directory is mounted at `_mounts/CodependentCoding`.
- The plugin is configured to use one Windows junction, not an entire development drive.
- Mount data remains Git-ignored because it contains a machine-specific absolute path.

## Authority boundary

The mounted source directory is not a Git checkout. Code Space exposes it as live code without inferring repository provenance or mounting any other path.

## Migration result

The generated Source Mirror was removed after explicit approval. Durable notes now link to live files through `_mounts/CodependentCoding`; no code-copy note tree remains in DevNotes.
