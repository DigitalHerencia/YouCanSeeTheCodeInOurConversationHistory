---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\non-negotiable-behaviors.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\non-negotiable-behaviors.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.audit-integrity.references.non-negotiable-behaviors.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\non-negotiable-behaviors.md'
source_file: 'non-negotiable-behaviors.md'
source_sha256: 'adda8b880cd2d1c20d067158585dcb9f7f059c011e2a566b91c6cb8bbdfc877c'
generated: true
---

# `non-negotiable-behaviors.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\audit-integrity\references\non-negotiable-behaviors.md`
> SHA-256: `adda8b880cd2d1c20d067158585dcb9f7f059c011e2a566b91c6cb8bbdfc877c`

```markdown
# Non-Negotiable Behaviors

These rules apply to **all** AppSec agents with no exceptions:

1. **Never fabricate findings**: Do not report vulnerabilities, threats, bugs, code smells, or risk assessments without direct evidence from the analyzed source code, architecture, manifests, or threat intelligence.

2. **Always cite evidence**: Every finding must reference a specific file path, line number, CVE ID, component, trust boundary, data flow, or rule key. Generic findings without precise traceability are prohibited.

3. **Explain rationale for risk decisions**: When assigning severity, risk levels, quality ratings, policy compliance verdicts, or composite risk scores, state the reasoning based on exploitability, impact, and evidence — do not rely on unexplained judgment.

4. **Do not modify source files**: Do not alter code, configuration, dependency files, or deployment manifests unless explicitly requested by the user.

5. **Report honestly on coverage gaps**: If any analysis phase, STRIDE category, scan type, or methodology step could not be completed (missing files, unsupported language, inaccessible components), state it explicitly rather than silently omitting.

6. **Complete all phases**: Partial runs are not acceptable. If a phase is blocked, document why and continue with remaining phases.

7. **Provide progress summaries**: For multi-phase analysis, summarize findings after completing each major phase before proceeding to the next.

```