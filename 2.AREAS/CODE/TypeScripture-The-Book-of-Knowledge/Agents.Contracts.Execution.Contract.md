---
title: Codependent Coding Execution Contract
type: contract
scope: domain
project: CodependentCoding
domain: agent-execution
artifact: machine-contract
kind: contract
namespace: codependentcoding.agents.contracts.execution.contract
status: active
authority: source-of-truth
parent: "[[codependentcoding.manifest.map]]"
depends_on:
  - "[[codependentcoding.docs.agent-execution.execution]]"
supersedes: []
tags:
  - codependentcoding/contracts
  - codependentcoding/execution
  - status/active
created: 2026-08-08
updated: 2026-08-08
source_repository: DigitalHerencia/CodependentCoding
source_path: .agents/contracts/execution.yaml
source_commit: 773a3469b80d8f8aafccecd749c60ebdb8a930ae
source_blob: d5236ce1fe38de3d6e8371f111a2184a915dd5f4
source_format: yaml
---
# Execution Machine Contract

The original machine-readable payload is preserved verbatim below.

```yaml
version: 1
status: final
owner: docs/18-agent-execution.md
scope: agent-execution-principles

principles:
  execution_state_is_operational_not_canonical: true
  completion_requires-truthful-evidence: true
  confidence-cannot-substitute-for-execution: true
  known-blockers-must-remain-visible: true
  smallest-correct-change: true

workflow:
  - read-governing-context
  - identify-contradictions-and-scope
  - define-files-interfaces-migrations-and-tests
  - implement-smallest-correct-change
  - run-affected-application-gates
  - update-docs-and-contracts-for-public-boundary-changes
  - report-executed-skipped-blocked-and-inferred-work-truthfully

escalate_when:
  - human-product-decision-required
  - authority-or-security-boundary-would-change
  - destructive-production-action-required
  - secret-disclosure-required
  - financial-or-legal-discretion-required
```
