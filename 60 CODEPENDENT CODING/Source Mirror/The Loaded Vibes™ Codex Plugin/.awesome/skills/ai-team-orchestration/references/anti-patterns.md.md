---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\ai-team-orchestration\references\anti-patterns.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\ai-team-orchestration\references\anti-patterns.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.ai-team-orchestration.references.anti-patterns.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\ai-team-orchestration\references\anti-patterns.md'
source_file: 'anti-patterns.md'
source_sha256: 'dadff4d08469aabda29c3792de4cd2991b61733d47ed4779ea8b7cdbebbb2946'
generated: true
---

# `anti-patterns.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\ai-team-orchestration\references\anti-patterns.md`
> SHA-256: `dadff4d08469aabda29c3792de4cd2991b61733d47ed4779ea8b7cdbebbb2946`

```markdown
# Anti-Patterns

| Avoid | Prefer | Why |
|---|---|---|
| One agent owns planning, implementation, testing, and approval | Keep Producer, Dev, and optional QA responsibilities distinct | Independent perspectives reduce blind spots without requiring ceremony for every change. |
| Hardcoded tool or model allowlists | Inherit the developer's enabled tools and selected model | Extensions and MCP tools remain available without plugin updates. |
| A mandatory process for every change | Scale planning, review, and QA to risk | Small changes stay fast; high-impact changes receive more scrutiny. |
| Universal Git command recipes | Follow repository contribution and branch policy | Projects use different remotes, protections, and merge strategies. |
| Rewriting shared history or discarding unknown work | Preserve work and coordinate destructive actions | Parallel sessions and contributors may depend on existing state. |
| Large plans that duplicate project documentation | Record only outcomes, constraints, decisions, and next actions | Concise context is easier to maintain and recover. |
| Bugs and decisions kept only in chat | Use the repository's issue tracker and durable context | Future sessions can discover them. |
| QA fixes application source | QA reports behavior; Dev implements fixes | Separation preserves independent verification. |
| Treating every automated suggestion as a requirement | Assess relevance, confidence, scope, and practical risk | Review should improve the product, not expand scope without limit. |

```