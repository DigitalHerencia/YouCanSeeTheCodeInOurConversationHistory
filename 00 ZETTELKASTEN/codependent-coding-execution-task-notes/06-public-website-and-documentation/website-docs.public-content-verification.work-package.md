---
title: "Run Final Public Content, Link, and Claim Verification"
type: work-package
scope: project
project: "Public Website and Documentation"
domain: "release"
artifact: "public-content-verification"
kind: work-package
namespace: website-docs.public-content-verification.work-package
status: active
authority: working-note
parent: "[[website-docs.execution.tasks.map]]"
depends_on:
  - "[[website-docs.public-docs-information-architecture.work-package]]"
  - "[[website-docs.maximal-template-library-docs.work-package]]"
  - "[[website-docs.hipster-stack-procurement-generator-docs.work-package]]"
  - "[[website-docs.loaded-vibes-public-docs.work-package]]"
  - "[[website-docs.visual-system-consistency.work-package]]"
supersedes: []
tags:
  - projects/website-docs
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Release"
---

# Run Final Public Content, Link, and Claim Verification

**Priority:** P0  
**Phase:** Release  
**Task status:** Backlog

## Outcome

Verify that the public site/docs correspond to current product roles, implemented capabilities, and runtime evidence before treating the site as the definitive public face.

## Why This Exists

The corpus contains transitional names and intentionally illustrative showroom claims, so final publication needs a truth pass.

## Execution Checklist

- [ ] Check all navigation and internal docs links.
- [ ] Check product-role language against current canon.
- [ ] Check CLI/config names against actually shipped runtime.
- [ ] Check Simple/Ontology/provider catalogs against implementation truth.
- [ ] Check Loaded Vibes agent/skill lists against actual package.
- [ ] Check security/runtime badges against evidence.
- [ ] Check code/config examples against supported versions.
- [ ] Check image/assets and dark-surface logo variants.
- [ ] Check responsive/mobile/keyboard behavior.
- [ ] Record unresolved claims and remove/qualify them before final publication.

## Acceptance Criteria

- [ ] No known broken internal links remain.
- [ ] No transitional name is presented as shipped unless verified.
- [ ] No unsupported capability is advertised as available.
- [ ] Public claims match executed evidence or are explicitly architectural/future-state.

## Dependencies

- [[website-docs.public-docs-information-architecture.work-package]]
- [[website-docs.maximal-template-library-docs.work-package]]
- [[website-docs.hipster-stack-procurement-generator-docs.work-package]]
- [[website-docs.loaded-vibes-public-docs.work-package]]
- [[website-docs.visual-system-consistency.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `The Maximal Template™ Backlog.md`
- `Codependent Coding™ Website Design & Content Specification.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
