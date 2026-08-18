---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-synthetic-python.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-synthetic-python.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.experiments-synthetic-python.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-synthetic-python.md'
source_file: 'experiments-synthetic-python.md'
source_sha256: '1a844f416780466c35f760ed9b90876afc0a2bdbff24ec9307a1941d670c2d2a'
generated: true
---

# `experiments-synthetic-python.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\experiments-synthetic-python.md`
> SHA-256: `1a844f416780466c35f760ed9b90876afc0a2bdbff24ec9307a1941d670c2d2a`

````markdown
# Experiments: Generating Synthetic Test Data

Creating diverse, targeted test data for evaluation.

## Dimension-Based Approach

Define axes of variation, then generate combinations:

```python
dimensions = {
    "issue_type": ["billing", "technical", "shipping"],
    "customer_mood": ["frustrated", "neutral", "happy"],
    "complexity": ["simple", "moderate", "complex"],
}
```

## Two-Step Generation

1. **Generate tuples** (combinations of dimension values)
2. **Convert to natural queries** (separate LLM call per tuple)

```python
# Step 1: Create tuples
tuples = [
    ("billing", "frustrated", "complex"),
    ("shipping", "neutral", "simple"),
]

# Step 2: Convert to natural query
def tuple_to_query(t):
    prompt = f"""Generate a realistic customer message:
    Issue: {t[0]}, Mood: {t[1]}, Complexity: {t[2]}
    
    Write naturally, include typos if appropriate. Don't be formulaic."""
    return llm(prompt)
```

## Target Failure Modes

Dimensions should target known failures from error analysis:

```python
# From error analysis findings
dimensions = {
    "timezone": ["EST", "PST", "UTC", "ambiguous"],  # Known failure
    "date_format": ["ISO", "US", "EU", "relative"],   # Known failure
}
```

## Quality Control

- **Validate**: Check for placeholder text, minimum length
- **Deduplicate**: Remove near-duplicate queries using embeddings
- **Balance**: Ensure coverage across dimension values

## When to Use

| Use Synthetic | Use Real Data |
| ------------- | ------------- |
| Limited production data | Sufficient traces |
| Testing edge cases | Validating actual behavior |
| Pre-launch evals | Post-launch monitoring |

## Sample Sizes

| Purpose | Size |
| ------- | ---- |
| Initial exploration | 50-100 |
| Comprehensive eval | 100-500 |
| Per-dimension | 10-20 per combination |

````