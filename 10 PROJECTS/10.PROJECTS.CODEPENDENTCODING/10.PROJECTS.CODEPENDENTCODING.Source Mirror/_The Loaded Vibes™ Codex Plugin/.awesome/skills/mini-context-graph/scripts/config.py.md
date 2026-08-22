---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\config.py'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\config.py'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.mini-context-graph.scripts.config.py'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\config.py'
source_file: 'config.py'
source_sha256: '62890ab78a21ba9a0148bf12f3b703a6bbea95234a6923242c42ef945f8fc050'
generated: true
---

# `config.py`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\mini-context-graph\scripts\config.py`
> SHA-256: `62890ab78a21ba9a0148bf12f3b703a6bbea95234a6923242c42ef945f8fc050`

```python
"""
config.py — Global configuration constants for the Context Graph Skill.

Data directories are resolved from environment variables so the skill can be
used from any project without writing data inside the skill package itself.

  MINI_CONTEXT_GRAPH_DATA_DIR  — where graph.json, index.json, etc. live
  MINI_CONTEXT_GRAPH_WIKI_DIR  — where wiki pages, index.md, and log.md live

Both default to subdirectories of the current working directory when the env
vars are not set, so data ends up in the consuming project's directory.
"""

import os
from pathlib import Path

_BASE = Path(os.environ.get("MINI_CONTEXT_GRAPH_BASE", str(Path.cwd())))
DATA_DIR = Path(os.environ.get("MINI_CONTEXT_GRAPH_DATA_DIR", str(_BASE / "data")))
WIKI_DIR = Path(os.environ.get("MINI_CONTEXT_GRAPH_WIKI_DIR", str(_BASE / "wiki")))

MAX_GRAPH_DEPTH: int = 2
MIN_CONFIDENCE: float = 0.6
MAX_NODES: int = 50

```