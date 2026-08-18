---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\what-context-needed\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\what-context-needed\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.what-context-needed.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\what-context-needed\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '65ed7445bf561a5e5199ac77478d2691c05019e0dc32fdddc23db9e45bd9d135'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\what-context-needed\SKILL.md`
> SHA-256: `65ed7445bf561a5e5199ac77478d2691c05019e0dc32fdddc23db9e45bd9d135`

````markdown
---
name: what-context-needed
description: 'Ask Copilot what files it needs to see before answering a question'
---

# What Context Do You Need?

Before answering my question, tell me what files you need to see.

## My Question

{{question}}

## Instructions

1. Based on my question, list the files you would need to examine
2. Explain why each file is relevant
3. Note any files you've already seen in this conversation
4. Identify what you're uncertain about

## Output Format

```markdown
## Files I Need

### Must See (required for accurate answer)
- `path/to/file.ts` — [why needed]

### Should See (helpful for complete answer)
- `path/to/file.ts` — [why helpful]

### Already Have
- `path/to/file.ts` — [from earlier in conversation]

### Uncertainties
- [What I'm not sure about without seeing the code]
```

After I provide these files, I'll ask my question again.

````