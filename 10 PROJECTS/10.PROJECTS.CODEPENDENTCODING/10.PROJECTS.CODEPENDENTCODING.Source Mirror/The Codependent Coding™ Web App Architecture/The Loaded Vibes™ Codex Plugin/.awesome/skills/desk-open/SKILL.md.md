---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\desk-open\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\desk-open\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.desk-open.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\desk-open\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '6a121626c42f18a50a4e0c232901b979ef0ffc02c552feffb3af360326f76e7d'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\desk-open\SKILL.md`
> SHA-256: `6a121626c42f18a50a4e0c232901b979ef0ffc02c552feffb3af360326f76e7d`

````markdown
---
name: desk-open
description: 'Create and open a new desk in the workshop. Sets up the folder structure, initial journal, and desk identity so the next session that sits down finds the trail.'
---

# Open a Desk

Create a new desk in the workshop with the standard structure.

## When to use

- The operator wants to start a new workstream
- Work arrives that doesn't belong to any existing desk
- A topic needs its own frame (its own history, its own priors)

## What it creates

Given a workshop directory and a desk name, create:

```
desks/<desk-name>/
  journal.md       # persistent memory — read at start, written at end
  .signals/        # structured signal output (JSON) — dashboard reads this
```

## How to use

1. **Choose a name.** Short, descriptive, kebab-case. The name is
   how the operator and other desks refer to this desk.
   Examples: `security-scan`, `api-review`, `ops`, `cloud-workshop`

2. **Check if it already exists.** If `desks/<desk-name>/` already
   has a `journal.md`, the desk is live — **do not overwrite it.**
   Instead, resume it: read the journal and continue from where it
   left off. If the operator explicitly wants a fresh start, they
   must rename or archive the existing desk first.

3. **Create the structure.** Make the directory, initial journal,
   and signals folder:

   ```
   desks/<desk-name>/journal.md
   desks/<desk-name>/.signals/
   ```

4. **Write the first journal entry.** The journal starts with:
   - What this desk is for (its focus/purpose)
   - What repos or work it covers (if applicable)
   - Any initial context the first session needs

5. **Announce it.** Tell the operator what was created and what
   the desk's focus is.

## Session orientation

This skill initializes storage — it does not launch a session.
A desk becomes active when a Copilot session references its
directory. The session workflow:

1. The operator (or TA) starts a session and says "sit at the
   `<desk-name>` desk"
2. The session reads `desks/<desk-name>/journal.md` to load priors
3. Work happens — the session uses `signal-write` to emit signals
   and `desk-journal` to persist state at the end
4. The next session repeats from step 2

The desk identity comes from which journal is read, not from a
persistent process. Desks are long-running in *state* (the journal
carries forward), not in *runtime* (each session is independent).

## Journal format

```markdown
# <Desk Name> — Journal

## <date> — Desk opened
- **Purpose:** <what this desk focuses on>
- **Scope:** <repos, areas, or work this desk covers>
- **Next step:** <what the first session should do>
```

## Principles

- A desk is a peer, not a sub-agent. It has equal standing to
  disagree with other desks.
- The journal is the memory. Without it, the next session starts
  blind. Write enough that someone starting from zero finds the way.
- One desk, one focus. If the scope is too broad, open two desks.
  Each desk's value comes from its specific frame — dilute the
  frame and you lose the value.

````