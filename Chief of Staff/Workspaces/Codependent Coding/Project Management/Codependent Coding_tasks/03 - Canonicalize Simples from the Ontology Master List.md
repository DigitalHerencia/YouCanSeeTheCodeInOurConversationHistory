---
pm-task: true
projectId: klb30ky6lcbogzet
parentId:
id: cwz4l3c0iee3814s
title: Canonicalize Simples from the Ontology Master List
type: task
status: ready
priority: high
start: 2026-08-20
due: ""
progress: 20
assignees: []
tags:
  - codependent-coding
  - simples
  - ontology
subtaskIds: []
dependencies:
  - i42wstxptn680fly
createdAt: 2026-08-18T18:23:00.000Z
updatedAt: 2026-08-20T08:48:00.000Z
role: chief-of-staff
system: codependent-coding
workspace: codependent-coding
authority: reference
updated: 2026-08-24
projects: "[[Codependent Coding]]"
dateModified: 2026-08-25T17:19:06.428-06:00
tasknotes_manual_order: tnfffffffffe
---

# Canonicalize Simples from the Ontology Master List

## Outcome

Turn the real supported source files implied by `Ontologies.md` into source-backed Simple records that can power docs, the demo/hardened source views, dependency resolution, and generation.

## Source rule

`Ontologies.md` is the master inventory. A Simple record represents a real supported source unit; aggregate concepts such as Database may map and group many file-level Simples.

## For every Simple

- [ ] Architecture / Codependent Coding knowledge tab content.
- [ ] Technical implementation tab content.
- [ ] Public Demo Golden Prototype source.
- [ ] Hardened Golden Prototype source.
- [ ] Explicit Hardening Delta where the two differ.
- [ ] `uses`, `requires`, `permits`, `conditional`, `prohibits`, variants, providers, and Ontology membership.
- [ ] Generation disposition: invariant, derived, selectable, or presentation-configurable.
- [ ] Evidence/validation and owner approval state.

## Existing proof

The Database/read-path slice already contains real review-state Simple records and demonstrates public-vs-hardened source consequences. Preserve and extend that model rather than replacing it.

## Acceptance

Every supported source item required by the nine Ontology™ defaults is either represented by a canonical Simple, explicitly marked as an implementation gap/stub, or deliberately excluded with a reason.
