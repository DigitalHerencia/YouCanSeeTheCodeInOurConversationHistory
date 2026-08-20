---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-overview.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-overview.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.evaluators-overview.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-overview.md'
source_file: 'evaluators-overview.md'
source_sha256: 'c7185a595ee9ed94d492fb5a4457ca8ebec0e4250da88250421f83bb5ec7fbfc'
generated: true
---

# `evaluators-overview.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-overview.md`
> SHA-256: `c7185a595ee9ed94d492fb5a4457ca8ebec0e4250da88250421f83bb5ec7fbfc`

````markdown
# Evaluators: Overview

When and how to build automated evaluators.

## Decision Framework

```
Should I Build an Evaluator?
        │
        ▼
Can I fix it with a prompt change?
    YES → Fix the prompt first
    NO  → Is this a recurring issue?
          YES → Build evaluator
          NO  → Add to watchlist
```

**Don't automate prematurely.** Many issues are simple prompt fixes.

## Evaluator Requirements

1. **Clear criteria** - Specific, not "Is it good?"
2. **Labeled test set** - 100+ examples with human labels
3. **Measured accuracy** - Know TPR/TNR before deploying

## Evaluator Lifecycle

1. **Discover** - Error analysis reveals pattern
2. **Design** - Define criteria and test cases
3. **Implement** - Build code or LLM evaluator
4. **Calibrate** - Validate against human labels
5. **Deploy** - Add to experiment/CI pipeline
6. **Monitor** - Track accuracy over time
7. **Maintain** - Update as product evolves

## What NOT to Automate

- **Rare issues** - <5 instances? Watchlist, don't build
- **Quick fixes** - Fixable by prompt change? Fix it
- **Evolving criteria** - Stabilize definition first

````