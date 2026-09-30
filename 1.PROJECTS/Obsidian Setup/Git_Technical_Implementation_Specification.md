# Git Technical Implementation Specification

## Purpose

Git provides version control for the vault and mounted repositories.

Git records repository history. It does not manage projects, tasks, dashboards, Code Lab knowledge, or source editing.

## Vault Repository

The vault repository is:

```text
DigitalHerencia/YouCanSeeTheCodeInOurConversationHistory
```

The normal Git workflow remains:

```text
Edit
  ↓
Working tree
  ↓
Review
  ↓
Commit
  ↓
Push
```

## Mounted Repositories

Mounted repositories live under:

```text
2.AREAS/SYSTEM/_mounts/
```

Each mounted repository retains its own Git history and repository identity.

The vault must not merge a mounted repository's history into the vault repository merely because the files are accessible through Obsidian.

## Git Plugin Boundary

The Obsidian Git plugin may provide:

- pull;
- commit;
- push;
- status;
- diff;
- history;
- automatic backup according to explicit configuration.

It must not silently change project state.

## Hearth Integration

Hearth may surface Git status and recent activity.

The dashboard links to Git information rather than recreating Git history.

## Commit Contract

A commit should correspond to a coherent change.

Do not automatically commit every note edit unless that behavior is deliberately configured and understood.

## Project Relationship

Project work may reference commits as evidence:

```text
Task
  ↓
Code Artifact
  ↓
Commit
```

A commit does not automatically complete a TaskNote.

## Security

Git workflows must not commit:

- secrets;
- credentials;
- private keys;
- machine-specific caches;
- generated artifacts that the repository explicitly excludes.

The existing repository's ignore rules remain authoritative for repository hygiene.

## Rules

1. Git owns history.
2. CodeSpace owns editing.
3. Project management owns task completion.
4. Code Lab owns reusable engineering knowledge.
5. Hearth presents Git state.
6. Mounted repositories retain independent repository boundaries.
7. Never infer task completion from a commit alone.
8. Do not silently push or rewrite history.
