---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation-evaluators-python.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation-evaluators-python.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.validation-evaluators-python.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation-evaluators-python.md'
source_file: 'validation-evaluators-python.md'
source_sha256: '062caf097ac9703d08ccd697f776940c4619d1412a3daaedec3cd13e11cca428'
generated: true
---

# `validation-evaluators-python.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\validation-evaluators-python.md`
> SHA-256: `062caf097ac9703d08ccd697f776940c4619d1412a3daaedec3cd13e11cca428`

````markdown
# Validating Evaluators (Python)

Validate LLM evaluators against human-labeled examples. Target >80% TPR/TNR/Accuracy.

## Calculate Metrics

```python
from sklearn.metrics import classification_report, confusion_matrix

print(classification_report(human_labels, evaluator_predictions))

cm = confusion_matrix(human_labels, evaluator_predictions)
tn, fp, fn, tp = cm.ravel()
tpr = tp / (tp + fn)
tnr = tn / (tn + fp)
print(f"TPR: {tpr:.2f}, TNR: {tnr:.2f}")
```

## Correct Production Estimates

```python
def correct_estimate(observed, tpr, tnr):
    """Adjust observed pass rate using known TPR/TNR."""
    return (observed - (1 - tnr)) / (tpr - (1 - tnr))
```

## Find Misclassified

```python
# False Positives: Evaluator pass, human fail
fp_mask = (evaluator_predictions == 1) & (human_labels == 0)
false_positives = dataset[fp_mask]

# False Negatives: Evaluator fail, human pass
fn_mask = (evaluator_predictions == 0) & (human_labels == 1)
false_negatives = dataset[fn_mask]
```

## Red Flags

- TPR or TNR < 70%
- Large gap between TPR and TNR
- Kappa < 0.6

````