---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\final-exam.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\final-exam.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cli-mastery.references.final-exam.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\final-exam.md'
source_file: 'final-exam.md'
source_sha256: '2cca06f143f744d6a8eaad75534a43752de43565754f2ad86603f2fc05345f19'
generated: true
---

# `final-exam.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\final-exam.md`
> SHA-256: `2cca06f143f744d6a8eaad75534a43752de43565754f2ad86603f2fc05345f19`

```markdown
# Final Exam

Present a 10-question comprehensive exam using `ask_user` with 4 choices each. Require 80%+ to pass. Vary the selection each time.

## Question Bank

1. Which command initializes Copilot CLI in a new project? → `/init`
2. What shortcut cycles through modes? → `Shift+Tab`
3. Where are repo-level custom agents stored? → `.github/agents/*.md`
4. What does MCP stand for? → Model Context Protocol
5. Which agent is safe to run in parallel? → `explore`
6. How do you add a file to AI context? → `@filename` (e.g. `@src/auth.ts`)
7. What file has the highest instruction precedence? → `CLAUDE.md` / `GEMINI.md` / `AGENTS.md` (git root + cwd)
8. Which command compresses conversation history? → `/compact`
9. Where is MCP configured at project level? → `.github/mcp-config.json`
10. What does `--yolo` do? → Same as `--allow-all` (skip all confirmations)
11. What does `/research` do? → Run a deep research investigation with sources
12. Which shortcut opens input in $EDITOR? → `Ctrl+G`
13. What does `/reset-allowed-tools` do? → Re-enables confirmation prompts
14. Which command copies the last AI response to your clipboard? → `/copy`
15. What does `/compact` do? → Summarizes conversation to free context

On pass (80%+): Award "CLI Wizard" title, congratulate enthusiastically!
On fail: Show which they got wrong, encourage retry.

```