---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\tools\retrieval_engine.py'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\tools\retrieval_engine.py'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.mini-context-graph.scripts.tools.retrieval-engine.py'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\tools\retrieval_engine.py'
source_file: 'retrieval_engine.py'
source_sha256: '7e11a3e8e0abafbed5c57304b4f09c6239804ed38197db8fb4d72ec4735939d2'
generated: true
---

# `retrieval_engine.py`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\tools\retrieval_engine.py`
> SHA-256: `7e11a3e8e0abafbed5c57304b4f09c6239804ed38197db8fb4d72ec4735939d2`

```python
"""
retrieval_engine.py — BFS-based graph traversal for context retrieval.

Input: seed node_ids + depth
Output: list of node_ids within traversal depth filtered by min_confidence
"""
from __future__ import annotations

import sys
from pathlib import Path
from collections import deque

# Allow imports from parent package
sys.path.insert(0, str(Path(__file__).parent.parent))

from tools import graph_store
import config


def retrieve(
    seed_node_ids: list[str],
    depth: int = config.MAX_GRAPH_DEPTH,
    min_confidence: float = config.MIN_CONFIDENCE,
    max_nodes: int = config.MAX_NODES,
) -> list[str]:
    """
    BFS from seed nodes up to `depth` hops.

    Returns a list of node_ids (including seeds) within the traversal,
    filtered by min_confidence on edges and capped at max_nodes.
    """
    visited: set[str] = set()
    # Queue items: (node_id, current_depth)
    queue: deque[tuple[str, int]] = deque()

    for seed in seed_node_ids:
        if seed not in visited:
            visited.add(seed)
            queue.append((seed, 0))

    while queue:
        if len(visited) >= max_nodes:
            break

        node_id, current_depth = queue.popleft()

        if current_depth >= depth:
            continue

        neighbors = graph_store.get_neighbors(node_id, min_confidence=min_confidence)
        for neighbor in neighbors:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append((neighbor, current_depth + 1))
                if len(visited) >= max_nodes:
                    break

    return list(visited)

```