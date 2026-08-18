---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\cache-coordinator.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\cache-coordinator.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.pr-artifact-explorer.cache-coordinator.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\cache-coordinator.mjs'
source_file: 'cache-coordinator.mjs'
source_sha256: 'dddcbbb25db64cc0b58e135689975c0b76b95a058cf699e1d32043340dd45b25'
generated: true
---

# `cache-coordinator.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\cache-coordinator.mjs`
> SHA-256: `dddcbbb25db64cc0b58e135689975c0b76b95a058cf699e1d32043340dd45b25`

```javascript
function trackedOperation(callback) {
  const operation = Promise.resolve().then(callback);
  return {
    operation,
    // Waiters need ordering only; the initiating maintenance request owns failures.
    barrier: operation.then(
      () => undefined,
      () => undefined,
    ),
  };
}

export class CacheMaintenanceCoordinator {
  constructor() {
    this.artifactDeletions = new Map();
    this.cacheClear = null;
  }

  inspectionBarrier(artifactId) {
    return (
      this.cacheClear?.barrier ??
      this.artifactDeletions.get(String(artifactId))?.barrier ??
      null
    );
  }

  async deleteArtifact(artifactId, callback) {
    const id = String(artifactId);
    while (true) {
      const existing = this.artifactDeletions.get(id);
      if (existing) return existing.operation;
      if (!this.cacheClear) break;
      await this.cacheClear.barrier;
    }

    const tracked = trackedOperation(callback);
    this.artifactDeletions.set(id, tracked);
    try {
      return await tracked.operation;
    } finally {
      if (this.artifactDeletions.get(id) === tracked) {
        this.artifactDeletions.delete(id);
      }
    }
  }

  async clearCache(callback) {
    if (this.cacheClear) return this.cacheClear.operation;

    const tracked = trackedOperation(async () => {
      await Promise.all(
        [...this.artifactDeletions.values()].map((entry) => entry.barrier),
      );
      return callback();
    });
    this.cacheClear = tracked;
    try {
      return await tracked.operation;
    } finally {
      if (this.cacheClear === tracked) this.cacheClear = null;
    }
  }
}

```