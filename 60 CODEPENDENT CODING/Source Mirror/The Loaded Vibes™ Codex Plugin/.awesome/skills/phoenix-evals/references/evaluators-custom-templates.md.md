---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-custom-templates.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-custom-templates.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-evals.references.evaluators-custom-templates.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-custom-templates.md'
source_file: 'evaluators-custom-templates.md'
source_sha256: '1774e2ee026a0a5da06237c486c22fe0eafacc2135c7a3f978833fff3a171b6b'
generated: true
---

# `evaluators-custom-templates.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-evals\references\evaluators-custom-templates.md`
> SHA-256: `1774e2ee026a0a5da06237c486c22fe0eafacc2135c7a3f978833fff3a171b6b`

````markdown
# Evaluators: Custom Templates

Design LLM judge prompts.

## Complete Template Pattern

```python
TEMPLATE = """Evaluate faithfulness of the response to the context.

<context>{{context}}</context>
<response>{{output}}</response>

CRITERIA:
"faithful" = ALL claims supported by context
"unfaithful" = ANY claim NOT in context

EXAMPLES:
Context: "Price is $10" → Response: "It costs $10" → faithful
Context: "Price is $10" → Response: "About $15" → unfaithful

EDGE CASES:
- Empty context → cannot_evaluate
- "I don't know" when appropriate → faithful
- Partial faithfulness → unfaithful (strict)

Answer (faithful/unfaithful):"""
```

## Template Structure

1. Task description
2. Input variables in XML tags
3. Criteria definitions
4. Examples (2-4 cases)
5. Edge cases
6. Output format

## XML Tags

```
<question>{{input}}</question>
<response>{{output}}</response>
<context>{{context}}</context>
<reference>{{reference}}</reference>
```

## Common Mistakes

| Mistake | Fix |
| ------- | --- |
| Vague criteria | Define each label exactly |
| No examples | Include 2-4 cases |
| Ambiguous format | Specify exact output |
| No edge cases | Address ambiguity |

````