---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.fundamentals.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals.md'
source_file: 'fundamentals.md'
source_sha256: 'fcaa47ecc74402e2222a003662a16f7e8ba1404b664db8179c9f6a88624cfed0'
generated: true
---

# `fundamentals.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\fundamentals.md`
> SHA-256: `fcaa47ecc74402e2222a003662a16f7e8ba1404b664db8179c9f6a88624cfed0`

````markdown
# Fundamentals

Application-specific tests for AI systems. Code first, LLM for nuance, human for truth.

## Evaluator Types

| Type | Speed | Cost | Use Case |
| ---- | ----- | ---- | -------- |
| **Code** | Fast | Cheap | Regex, JSON, format, exact match |
| **LLM** | Medium | Medium | Subjective quality, complex criteria |
| **Human** | Slow | Expensive | Ground truth, calibration |

**Decision:** Code first → LLM only when code can't capture criteria → Human for calibration.

## Score Structure

| Property | Required | Description |
| -------- | -------- | ----------- |
| `name` | Yes | Evaluator name |
| `kind` | Yes | `"code"`, `"llm"`, `"human"` |
| `score` | No* | 0-1 numeric |
| `label` | No* | `"pass"`, `"fail"` |
| `explanation` | No | Rationale |

*One of `score` or `label` required.

## Binary > Likert

Use pass/fail, not 1-5 scales. Clearer criteria, easier calibration.

```python
# Multiple binary checks instead of one Likert scale
evaluators = [
    AnswersQuestion(),    # Yes/No
    UsesContext(),        # Yes/No
    NoHallucination(),    # Yes/No
]
```

## Quick Patterns

### Code Evaluator

```python
from phoenix.evals import create_evaluator

@create_evaluator(name="has_citation", kind="code")
def has_citation(output: str) -> bool:
    return bool(re.search(r'\[\d+\]', output))
```

### LLM Evaluator

```python
from phoenix.evals import ClassificationEvaluator, LLM

evaluator = ClassificationEvaluator(
    name="helpfulness",
    prompt_template="...",
    llm=LLM(provider="openai", model="gpt-4o"),
    choices={"not_helpful": 0, "helpful": 1}
)
```

### Run Experiment

```python
from phoenix.client.experiments import run_experiment

experiment = run_experiment(
    dataset=dataset,
    task=my_task,
    evaluators=[evaluator1, evaluator2],
)
print(experiment.aggregate_scores)
```

````