---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-anti-patterns.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-anti-patterns.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.fundamentals-anti-patterns.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-anti-patterns.md'
source_file: 'fundamentals-anti-patterns.md'
source_sha256: '3ebb6528d09eaf4bd6b7749eedb75597e527f79ea1abf3b151364c1b5504cb59'
generated: true
---

# `fundamentals-anti-patterns.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-anti-patterns.md`
> SHA-256: `3ebb6528d09eaf4bd6b7749eedb75597e527f79ea1abf3b151364c1b5504cb59`

````markdown
# Anti-Patterns

Common mistakes and fixes.

| Anti-Pattern | Problem | Fix |
| ------------ | ------- | --- |
| Generic metrics | Pre-built scores don't match your failures | Build from error analysis |
| Vibe-based | No quantification | Measure with experiments |
| Ignoring humans | Uncalibrated LLM judges | Validate >80% TPR/TNR |
| Premature automation | Evaluators for imagined problems | Let observed failures drive |
| Saturation blindness | 100% pass = no signal | Keep capability evals at 50-80% |
| Similarity metrics | BERTScore/ROUGE for generation | Use for retrieval only |
| Model switching | Hoping a model works better | Error analysis first |
| Single-run scoring | LLM judges and non-deterministic tasks add per-run noise that can drown the signal from a prompt change on a small dataset | Set `repetitions` on `runExperiment` (or grow the dataset) when the task or judge is an LLM call |

## Quantify Changes

```python
from phoenix.client import Client

client = Client()
baseline = client.experiments.run_experiment(dataset=dataset, task=old_prompt, evaluators=evaluators)
improved = client.experiments.run_experiment(dataset=dataset, task=new_prompt, evaluators=evaluators)
print(f"Improvement: {improved.pass_rate - baseline.pass_rate:+.1%}")
```

## Don't Use Similarity for Generation

```python
# BAD
score = bertscore(output, reference)

# GOOD
correct_facts = check_facts_against_source(output, context)
```

## Error Analysis Before Model Change

```python
# BAD
for model in models:
    results = test(model)

# GOOD
failures = analyze_errors(results)
# Then decide if model change is warranted
```

````