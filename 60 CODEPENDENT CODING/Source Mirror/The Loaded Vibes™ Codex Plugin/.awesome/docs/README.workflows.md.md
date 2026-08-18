---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\docs\README.workflows.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\docs\README.workflows.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.docs.readme.workflows.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\docs\README.workflows.md'
source_file: 'README.workflows.md'
source_sha256: '5657b9ed35aba812ea8eaeb9b0b31d45cf093144e70bcb24f381570924f3675d'
generated: true
---

# `README.workflows.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\docs\README.workflows.md`
> SHA-256: `5657b9ed35aba812ea8eaeb9b0b31d45cf093144e70bcb24f381570924f3675d`

```markdown
# ⚡ Agentic Workflows

[Agentic Workflows](https://github.github.com/gh-aw) are AI-powered repository automations that run coding agents in GitHub Actions. Defined in markdown with natural language instructions, they enable event-triggered and scheduled automation with built-in guardrails and security-first design.
### How to Contribute

See [CONTRIBUTING.md](../CONTRIBUTING.md#adding-agentic-workflows) for guidelines on how to contribute new workflows, improve existing ones, and share your use cases.

### How to Use Agentic Workflows

**What's Included:**
- Each workflow is a single `.md` file with YAML frontmatter and natural language instructions
- Workflows are compiled to `.lock.yml` GitHub Actions files via `gh aw compile`
- Workflows follow the [GitHub Agentic Workflows specification](https://github.github.com/gh-aw)

**To Install:**
- Install the `gh aw` CLI extension: `gh extension install github/gh-aw`
- Copy the workflow `.md` file to your repository's `.github/workflows/` directory
- Compile with `gh aw compile` to generate the `.lock.yml` file
- Commit both the `.md` and `.lock.yml` files

**To Activate/Use:**
- Workflows run automatically based on their configured triggers (schedules, events, slash commands)
- Use `gh aw run <workflow>` to trigger a manual run
- Monitor runs with `gh aw status` and `gh aw logs`

**When to Use:**
- Automate issue triage and labeling
- Generate daily status reports
- Maintain documentation automatically
- Run scheduled code quality checks
- Respond to slash commands in issues and PRs
- Orchestrate multi-step repository automation

| Name | Description | Triggers |
| ---- | ----------- | -------- |
| [Daily Issues Report](../workflows/daily-issues-report.md) | Generates a daily summary of open issues and recent activity as a GitHub issue | schedule |
| [OSPO Contributors Report](../workflows/ospo-contributors-report.md) | Monthly contributor activity metrics across an organization's repositories. | schedule, workflow_dispatch |
| [OSPO Organization Health Report](../workflows/ospo-org-health.md) | Comprehensive weekly health report for a GitHub organization. Surfaces stale issues/PRs, merge time analysis, contributor leaderboards, and actionable items needing human attention. | schedule, workflow_dispatch |
| [OSPO Stale Repository Report](../workflows/ospo-stale-repos.md) | Identifies inactive repositories in your organization and generates an archival recommendation report. | schedule, workflow_dispatch |
| [OSS Release Compliance Checker](../workflows/ospo-release-compliance-checker.md) | Analyzes a target repository against open source release requirements and posts a detailed compliance report as an issue comment. | issues, workflow_dispatch |
| [Relevance Check](../workflows/relevance-check.md) | Slash command to evaluate whether an issue or pull request is still relevant to the project | slash_command, roles |
| [Relevance Summary](../workflows/relevance-summary.md) | Manually triggered workflow that summarizes all open issues and PRs with a /relevance-check response into a single issue | workflow_dispatch |
| [Weekly Comment Sync](../workflows/weekly-comment-sync.md) | Weekly workflow that finds stale code comments or README snippets, makes text-only synchronization updates, and opens a draft pull request when changes are needed. | schedule, workflow_dispatch |

```