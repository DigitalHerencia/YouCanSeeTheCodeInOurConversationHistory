---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-model-selection.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-model-selection.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.fundamentals-model-selection.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-model-selection.md'
source_file: 'fundamentals-model-selection.md'
source_sha256: '05c26d1daa77b1ce71c7028733501e395299ae0dcf70de757d287d3a05ffb76b'
generated: true
---

# `fundamentals-model-selection.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals-model-selection.md`
> SHA-256: `05c26d1daa77b1ce71c7028733501e395299ae0dcf70de757d287d3a05ffb76b`

````markdown
# Model Selection

Error analysis first, model changes last.

## Decision Tree

```
Performance Issue?
       │
       ▼
Error analysis suggests model problem?
    NO  → Fix prompts, retrieval, tools
    YES → Is it a capability gap?
          YES → Consider model change
          NO  → Fix the actual problem
```

## Judge Model Selection

| Principle | Action |
| --------- | ------ |
| Start capable | Use gpt-4o first |
| Optimize later | Test cheaper after criteria stable |
| Same model OK | Judge does different task |

```python
# Start with capable model
judge = ClassificationEvaluator(
    llm=LLM(provider="openai", model="gpt-4o"),
    ...
)

# After validation, test cheaper
judge_cheap = ClassificationEvaluator(
    llm=LLM(provider="openai", model="gpt-4o-mini"),
    ...
)
# Compare TPR/TNR on same test set
```

## Don't Model Shop

```python
from phoenix.client import Client

client = Client()

# BAD
for model in ["gpt-4o", "claude-3", "gemini-pro"]:
    results = client.experiments.run_experiment(
        dataset=dataset,
        task=lambda input, _model=model: task(input, model=_model),
        evaluators=evaluators,
    )

# GOOD
failures = analyze_errors(results)
# "Ignores context" → Fix prompt
# "Can't do math" → Maybe try better model
```

## When Model Change Is Warranted

- Failures persist after prompt optimization
- Capability gaps (reasoning, math, code)
- Error analysis confirms model limitation

````