---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\self-reflection-quality-gate.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\self-reflection-quality-gate.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.audit-integrity.references.self-reflection-quality-gate.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\self-reflection-quality-gate.md'
source_file: 'self-reflection-quality-gate.md'
source_sha256: '12e17024710d6378eb318538e71bf0572c5acb050f889c564beab19086954901'
generated: true
---

# `self-reflection-quality-gate.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\self-reflection-quality-gate.md`
> SHA-256: `12e17024710d6378eb318538e71bf0572c5acb050f889c564beab19086954901`

```markdown
# Self-Reflection Quality Gate

After completing analysis, internally score the output across domain-relevant categories (1–10 scale).

## Scoring Rules

- **Pass**: All categories ≥ 8
- **Fail**: Any score < 8 → revisit the failing dimension before delivering output. Max 2 rework iterations.
- **If unresolvable after 2 iterations**: Deliver output with an explicit confidence note stating which dimension fell short and why.

## Base Categories (All Agents)

| Category          | Question                                                                                | Threshold |
| ----------------- | --------------------------------------------------------------------------------------- | :-------: |
| **Completeness**  | Were all required phases/categories evaluated with evidence?                            |    ≥ 8    |
| **Accuracy**      | Are findings backed by concrete references (code, architecture, CVEs), not speculation? |    ≥ 8    |
| **Actionability** | Does every Critical/High finding have a specific, implementable fix or mitigation?      |    ≥ 8    |
| **Consistency**   | Are severity ratings, mappings, and verdicts internally consistent?                     |    ≥ 8    |
| **Coverage**      | Were all entry points, trust boundaries, modules, or manifests identified and analyzed? |    ≥ 8    |

## Domain-Specific Extensions

### Multi-tool Pipeline — add:

| **Deduplication** | Are cross-tool duplicates properly merged with corroboration notes? | ≥ 8 |

### Code Quality (SonarQube-style) — adapt Completeness to:

| **Completeness** | Were all issue types (Bugs, Vulnerabilities, Hotspots, Smells, Duplication) evaluated? | ≥ 8 |

### SAST/SCA — adapt Coverage to:

| **Coverage** | Were all entry points taint-traced and all dependency manifests audited? | ≥ 8 |

### STRIDE Threat Modeling — adapt Completeness to:

| **Completeness** | Were all six STRIDE categories evaluated for every trust boundary and data flow? | ≥ 8 |

### STRIDE-LM — adapt Completeness and Coverage to:

| **Completeness** | Were all seven STRIDE-LM categories evaluated for every asset and trust boundary? | ≥ 8 |
| **Coverage** | Were all lateral movement paths, trust boundaries, and post-exploitation chains assessed? | ≥ 8 |

### Code Review — adapt Coverage to:

| **Coverage** | Were all entry points, trust boundaries, and data flows traced from source to sink? | ≥ 8 |

```