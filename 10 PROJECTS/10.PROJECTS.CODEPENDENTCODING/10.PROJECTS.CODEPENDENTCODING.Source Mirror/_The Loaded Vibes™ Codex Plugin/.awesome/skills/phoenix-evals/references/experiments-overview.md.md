---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-overview.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-overview.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.experiments-overview.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-overview.md'
source_file: 'experiments-overview.md'
source_sha256: '105b66a275b205d1ff45cb120df2f5d2d927c00b0cdd1255d59a8f0aa46c9598'
generated: true
---

# `experiments-overview.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-overview.md`
> SHA-256: `105b66a275b205d1ff45cb120df2f5d2d927c00b0cdd1255d59a8f0aa46c9598`

````markdown
# Experiments: Overview

Systematic testing of AI systems with datasets, tasks, and evaluators.

## Structure

```
DATASET     → Examples: {input, expected_output, metadata}
TASK        → function(input) → output
EVALUATORS  → (input, output, expected) → score
EXPERIMENT  → Run task on all examples, score results
```

## Basic Usage

```python
from phoenix.client import Client

client = Client()
experiment = client.experiments.run_experiment(
    dataset=my_dataset,
    task=my_task,
    evaluators=[accuracy, faithfulness],
    experiment_name="improved-retrieval-v2",
)

print(experiment.aggregate_scores)
# {'accuracy': 0.85, 'faithfulness': 0.92}
```

## Workflow

1. **Create dataset** - From traces, synthetic data, or manual curation
2. **Define task** - The function to test (your LLM pipeline)
3. **Select evaluators** - Code and/or LLM-based
4. **Run experiment** - Execute and score
5. **Analyze & iterate** - Review, modify task, re-run

## Dry Runs

Test setup before full execution:

```python
experiment = client.experiments.run_experiment(
    dataset=dataset,
    task=task,
    evaluators=evaluators,
    dry_run=3,
)  # Just 3 examples
```

## Async Usage

Use `AsyncClient` when your task or evaluators make network calls and you want higher throughput:

```python
from phoenix.client import AsyncClient

client = AsyncClient()
experiment = await client.experiments.run_experiment(
    dataset=my_dataset,
    task=my_async_task,
    evaluators=[accuracy, faithfulness],
    experiment_name="improved-retrieval-v2",
)
```

## Best Practices

- **Name meaningfully**: `"improved-retrieval-v2-2024-01-15"` not `"test"`
- **Version datasets**: Don't modify existing
- **Multiple evaluators**: Combine perspectives

````