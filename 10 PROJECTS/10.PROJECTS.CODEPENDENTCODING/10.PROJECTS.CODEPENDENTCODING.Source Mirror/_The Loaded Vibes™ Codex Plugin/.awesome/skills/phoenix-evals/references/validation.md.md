---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.validation.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation.md'
source_file: 'validation.md'
source_sha256: 'de9db8977f195bd2c969022a592c17eb58e5faafc455117c45328d94e000e4af'
generated: true
---

# `validation.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation.md`
> SHA-256: `de9db8977f195bd2c969022a592c17eb58e5faafc455117c45328d94e000e4af`

````markdown
# Validation

Validate LLM judges against human labels before deploying. Target >80% agreement.

## Requirements

| Requirement | Target |
| ----------- | ------ |
| Test set size | 100+ examples |
| Balance | ~50/50 pass/fail |
| Accuracy | >80% |
| TPR/TNR | Both >70% |

## Metrics

| Metric | Formula | Use When |
| ------ | ------- | -------- |
| **Accuracy** | (TP+TN) / Total | General |
| **TPR (Recall)** | TP / (TP+FN) | Quality assurance |
| **TNR (Specificity)** | TN / (TN+FP) | Safety-critical |
| **Cohen's Kappa** | Agreement beyond chance | Comparing evaluators |

## Quick Validation

```python
from sklearn.metrics import classification_report, confusion_matrix, cohen_kappa_score

print(classification_report(human_labels, evaluator_predictions))
print(f"Kappa: {cohen_kappa_score(human_labels, evaluator_predictions):.3f}")

# Get TPR/TNR
cm = confusion_matrix(human_labels, evaluator_predictions)
tn, fp, fn, tp = cm.ravel()
tpr = tp / (tp + fn)
tnr = tn / (tn + fp)
```

## Golden Dataset Structure

```python
golden_example = {
    "input": "What is the capital of France?",
    "output": "Paris is the capital.",
    "ground_truth_label": "correct",
}
```

## Building Golden Datasets

1. Sample production traces (errors, negative feedback, edge cases)
2. Balance ~50/50 pass/fail
3. Expert labels each example
4. Version datasets (never modify existing)

```python
# GOOD - create new version
golden_v2 = golden_v1 + [new_examples]

# BAD - never modify existing
golden_v1.append(new_example)
```

## Warning Signs

- All pass or all fail → too lenient/strict
- Random results → criteria unclear
- TPR/TNR < 70% → needs improvement

## Re-Validate When

- Prompt template changes
- Judge model changes
- Criteria changes
- Monthly

````