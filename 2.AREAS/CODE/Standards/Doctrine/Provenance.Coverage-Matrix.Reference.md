---
title: Codependent Coding Source-to-Repository Coverage Matrix
type: reference
scope: domain
project: CodependentCoding
domain: provenance
artifact: coverage-matrix
kind: reference
namespace: codependentcoding.provenance.coverage-matrix.reference
status: active
authority: reference
parent: "[[codependentcoding.provenance.readme.reference]]"
depends_on:
  - "[[codependentcoding.manifest.map]]"
supersedes: []
tags:
  - codependentcoding/provenance
  - codependentcoding/coverage
  - status/active
created: 2026-08-08
updated: 2026-08-08
source_repository: DigitalHerencia/CodependentCoding
source_path: provenance/coverage-matrix.md
source_commit: 773a3469b80d8f8aafccecd749c60ebdb8a930ae
source_blob: 9462573a590fafde6f909869f325d19b6df9271b
source_format: markdown
---
# Source-to-Repository Coverage Matrix

This matrix answers the useful question: **does the repository actually describe the complete build system?** It is a human coverage map, not a test report.

## Required domain coverage

| Required domain | Canonical owner | Coverage |
|---|---|---|
| System identity and scope | [[codependentcoding.readme.source-document]], [[codependentcoding.docs.knowledge-system-definition.source-document]] | Covered |
| Engineering philosophy/doctrine | [[codependentcoding.docs.engineering-doctrine.source-document]] | Covered |
| Epistemology and source authority | [[codependentcoding.docs.epistemology.reference]] | Covered |
| Knowledge modeling | [[codependentcoding.docs.knowledge-modeling.reference]], ontology contract | Covered |
| Terminology/nomenclature | [[codependentcoding.docs.terminology-nomenclature.reference]] | Covered |
| Loaded Vibes™ architecture | [[codependentcoding.docs.loaded-vibes-architecture.source-document]] | Covered |
| Hipster Stack™ technologies | [[codependentcoding.docs.hipster-stack-tech.map]] | Covered |
| Layer contracts/dependency direction | [[codependentcoding.docs.layer-contracts.contract]], architecture contract | Covered |
| Runtime/system lifecycles | [[codependentcoding.docs.system-lifecycles.contract]], Pattern 09 | Covered |
| Authentication/authorization/RLS/security | [[codependentcoding.docs.security-model.contract]], Pattern 05 | Covered |
| Protected reads | Pattern 01 plus supporting data patterns | Covered |
| Server Actions/mutations | Pattern 02 | Covered |
| Application workflows | Pattern 03 | Covered |
| Transactions/concurrency | Pattern 04 | Covered |
| Webhooks/reconciliation | Pattern 06 | Covered |
| Route/feature orchestration | Pattern 07 | Covered |
| Data contracts/selects/DTOs/schemas/types | supporting data patterns | Covered |
| Presentation/client islands/components/pages/errors | supporting presentation patterns | Covered |
| Configuration/environment/cache | supporting infrastructure patterns | Covered |
| Provider/integration adapters | supporting infrastructure patterns | Covered |
| Observability/logging | supporting infrastructure patterns | Covered |
| Testing/validation | [[codependentcoding.docs.validation-conformance.contract]], supporting quality patterns | Covered |
| Deployment/delivery | supporting quality patterns | Covered |
| Governance/specification | [[codependentcoding.docs.governance-model.contract]], [[codependentcoding.docs.specification-model.contract]], Pattern 10 | Covered |
| Agent execution | [[codependentcoding.docs.agent-execution.execution]] | Covered |
| Reference implementation relationship | [[codependentcoding.docs.reference-implementations.reference]] | Covered |
| Source provenance/conflict reconciliation | [[codependentcoding.provenance.readme.reference|provenance]] | Covered |

## Source coverage

The source ledger records the complete mandatory corpus used for synthesis, including the first-person build doctrine, Codependent Coding knowledge-system specification, Vouch implementation documentation, Hipster Stack pattern references, terminology/knowledge-modeling references, engineering-practice model, system definition, and tech-stack map.

Dense source relationships are further documented in the ontology, lifecycle, pattern, and contract traceability notes.

## Boundary

Coverage means the canonical topic has an owning document or pattern. It does not mean every possible product-specific implementation choice has been frozen into universal doctrine. Product-specific behavior belongs in the generated application's PRD, specifications, ADRs, and tests.
