---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-5-skills.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-5-skills.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.cli-mastery.references.module-5-skills.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-5-skills.md'
source_file: 'module-5-skills.md'
source_sha256: '7db75faebac0640af47b7e8a0afe01420e60602576dcefe281908c06010c98e9'
generated: true
---

# `module-5-skills.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\cli-mastery\references\module-5-skills.md`
> SHA-256: `7db75faebac0640af47b7e8a0afe01420e60602576dcefe281908c06010c98e9`

```markdown
# Module 5: Skills System

## What are skills?

- Specialized capability packages the AI can invoke
- Think of them as "expert modes" with domain-specific knowledge
- Managed via `/skills` command

## Skill locations

| Level | Location |
|-------|----------|
| User | `~/.copilot/skills/<name>/SKILL.md` or `~/.agents/skills/<name>/SKILL.md` |
| Repo | `.github/skills/<name>/SKILL.md` |
| Org | Shared via org-level config |

## Creating a custom skill

1. Create the directory: `mkdir -p ~/.copilot/skills/my-skill/` (or `mkdir -p ~/.agents/skills/my-skill/`)
2. Create `SKILL.md` with YAML frontmatter (`name`, `description`, optional `tools`)
3. Write detailed instructions for the AI's behavior
4. Verify with `/skills`

## Skill design best practices

- **Clear description** — helps the AI match tasks to your skill automatically
- **Focused scope** — each skill should do ONE thing well
- **Include instructions** — specify exactly how the skill should operate
- **Test thoroughly** — use `/skills` to verify, then invoke and check results

## Auto-matching

When you describe a task, the AI checks if any skill matches and suggests using it.

```