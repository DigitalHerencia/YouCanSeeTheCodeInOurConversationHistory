---
title: "Apply the Visual System Consistently Across Site, Constituter, Simples, and Docs"
type: work-package
scope: project
project: "Public Website and Documentation"
domain: "design-system"
artifact: "visual-system-consistency"
kind: work-package
namespace: website-docs.visual-system-consistency.work-package
status: active
authority: working-note
parent: "[[website-docs.execution.tasks.map]]"
depends_on:
  []
supersedes: []
tags:
  - projects/website-docs
  - work-package
  - work/backlog
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Design System"
---

# Apply the Visual System Consistently Across Site, Constituter, Simples, and Docs

**Priority:** P1  
**Phase:** Design System  
**Task status:** Backlog

## Outcome

Ensure every public/tool/documentation surface feels like the same dark industrial system while respecting usability for dense technical content.

## Why This Exists

The website specification defines black/near-black backgrounds, white text, teal signal/glow, display/body/code font roles, desert/banner assets, and explicit anti-patterns.

## Execution Checklist

- [ ] Normalize semantic tokens for canvas, text, signal, borders, states, charts, and focus.
- [ ] Normalize border radius, border width, hard-shadow, spacing, and motion scales.
- [ ] Verify heading/body/code font-role fallbacks.
- [ ] Use desert/banner artwork only where specified and ensure footer layering works.
- [ ] Adapt BoldKit/shadcn primitives rather than accepting visually inconsistent defaults.
- [ ] Avoid pastel/rainbow/cartoon neo-brutal styling.
- [ ] Check contrast, keyboard focus, reduced motion, responsive density, and code readability.
- [ ] Keep Constituter dense/tool-like while docs remain readable.

## Acceptance Criteria

- [ ] All major surfaces share one recognizable design language.
- [ ] Semantic token use prevents one-off color drift.
- [ ] Accessibility and responsive behavior remain functional despite the aggressive visual style.

## Dependencies

- None recorded.

## Source Basis

- `Codependent Coding™ Website Design & Content Specification.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
