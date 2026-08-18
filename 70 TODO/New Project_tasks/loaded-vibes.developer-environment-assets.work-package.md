---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "ril9s27cmsy9ywhy"
title: "loaded-vibes.developer-environment-assets.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:21:50.470Z"
updatedAt: "2026-08-18T06:21:50.470Z"
---

# Package Developer-Environment Assets for Ordinary Objects

**Priority:** P1  
**Phase:** Environment  
**Task status:** Backlog

## Outcome

Provide the environment/configuration assets explicitly required by the new plugin direction without embedding secrets or obsolete assumptions.

## Why This Exists

The master names ESLint, Prettier, `.gitattributes`, `.gitignore`, `.editorconfig`, global `AGENTS.md`, Codex config, and GitHub commit/PR instructions.

## Execution Checklist

- [ ] Normalize ESLint configuration and architecture-aware rules.
- [ ] Normalize Prettier configuration.
- [ ] Provide `.editorconfig`.
- [ ] Provide `.gitattributes` appropriate to Windows/Git workflows.
- [ ] Provide `.gitignore` without hiding important generated/runtime evidence.
- [ ] Provide global/application `AGENTS.md` template with universal workflow and architecture provenance.
- [ ] Provide Codex `config.toml` template for required plugin/MCP configuration only where actually supported.
- [ ] Provide GitHub commit instructions.
- [ ] Provide GitHub pull-request instructions.
- [ ] Ensure no credential values or machine-specific paths are baked into templates.

## Acceptance Criteria

- [ ] Assets are portable and secret-free.
- [ ] Windows/PowerShell workflows are supported.
- [ ] Environment assets reinforce rather than duplicate architecture canon.

## Dependencies

- [[loaded-vibes.plugin-package-architecture.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `codex-delivery-instructions.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]