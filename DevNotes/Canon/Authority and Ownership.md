---
title: Authority and Ownership
role: DevNotes
system: DevNotes
workspace:
type: map
status: Active
authority: Source of Truth
created: 2026-08-28
updated: 2026-08-28
tags:
  - authority
  - ownership
  - knowledge-model
---

# Authority and Ownership

## Universal concept ownership

| Concept | Canonical owner | Question | Major consumers |
| --- | --- | --- | --- |
| Epistemology | Trust Issues | How do we know? | DevNotes, Vibes, Fuck You Pay Me |
| Ontology | Schemes | What exists and relates? | all roles |
| Terminology | Prömpter | What do we call it? | all roles |
| Taxonomy | DevNotes | How is it classified? | Chief of Staff, Schemes |
| Typology | Execution | What recurring implementation types exist? | Schemes, Vibes |
| Mereology | Vibes | What is part of what? | Schemes |
| Topology | Vibes | How are parts connected? | Execution, Schemes |
| Nomenclature | Prömpter | How are artifacts named? | DevNotes, Execution |
| Semantics | Prömpter | What does structure/state mean? | Schemes, Execution |
| Schema | Schemes | What shape is valid? | Execution, Trust Issues |
| Metadata | DevNotes | How is an instance described? | Chief of Staff, Trust Issues |
| Folksonomy | DevNotes | What informal labels may be invented? | all roles |
| Faceted classification | DevNotes | Which independent axes apply? | all roles |
| Information architecture | DevNotes | How is knowledge found? | Chief of Staff |
| Domain model | Schemes | How is business meaning represented? | Execution, Fuck You Pay Me |
| Knowledge graph | DevNotes | How are instances related? | all roles |

One owner prevents semantic forks. Other roles may apply and consume the concept.

## Role authority boundaries

- **Chief of Staff** owns lifecycle state, sequencing, milestones, blockers, scheduling, and coordination traffic.
- **Trust Issues** owns whether evidence supports a claim.
- **Execution** owns behavioral realization and implementation.
- **Vibes** owns architecture, topology, technical placement, infrastructure, and environment.
- **DevNotes** owns classification, metadata, information architecture, retrieval, and durable graph health.
- **Schemes** owns universal ontology, schemas, models, entities, relationships, cardinality, states, and invariants.
- **Prömpter** owns language, terminology, semantics, nomenclature, prompt/specification grammar, and handoff grammar.
- **Fuck You Pay Me** owns actual external/business reality, relationships, obligations, commercial state, and provider authority.

Canonical ownership does not imply exclusive use.

## Authority values

`Source of Truth`, `Working`, `Reference`, `Derived`, `Historical`

Authority describes how material should be treated epistemically. It is separate from lifecycle status.

## Traceability

```text
source
  ↓ supports
claim
  ↓ motivates
decision
  ↓ governs
specification
  ↓ implemented by
artifact
  ↓ checked by
validation
  ↓ produces
evidence
```

## Live-system authority

Use the live system for volatile facts: repository source for actual implementation, GitHub for repository execution state, deployment platform for deployment state, providers for external/financial/mail/calendar facts, and executed evidence for validation results.

DevNotes is the durable institutional-memory authority, not a replacement for every live system.

See [[Role Manifest Specification]] and [[Metadata and Knowledge Graph Contract]].
