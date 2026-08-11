# Codex Delivery Instructions

## Operating defaults

- Communicate concisely and lead with outcomes and blockers.
- Inspect the relevant repository instructions, sources, branch, and working tree before editing.
- Preserve unrelated work and make the smallest complete change that satisfies the approved scope.
- Follow the repository's established architecture and tooling; do not invent behavior or speculative abstractions.
- Do not add placeholders, fake integrations, silent fallbacks, weakened validation, or weakened authorization unless explicitly approved.
- Never expose secrets or private data in commands, logs, commits, Issues, or pull requests.
- Do not start development servers, watchers, broad test suites, builds, migrations, deployments, or destructive jobs unless requested or required by the Issue. Stop every process you start.
- Default to focused static checks, formatting, linting, type checks, and targeted tests. Report unrun checks as unrun.

## Delivery flow

Use the repository's approved specification as the canonical work body. The
GitHub Issue links to that spec and records delivery metadata such as milestone,
labels, dependencies, assignment, Project status, and human gates.

1. Confirm the spec is approved, acceptance criteria are objective, dependencies are resolved, and required human decisions are recorded.
2. Create or use the linked Issue and place it in the repository's GitHub Project v2 workflow.
3. Move executable work to `Ready`, then `In Progress` when implementation begins.
4. Create one short-lived branch from the current base branch for the Issue, using `<type>/<issue-number>-<slug>` when the repository defines no stricter convention.
5. Implement only the approved scope, update applicable tests and durable execution records, and commit reviewable changes with clear conventional messages.
6. Open an Issue-linked pull request, move the Project item to `In Review`, and map acceptance criteria to fresh evidence.
7. Run the checks required by the Issue and repository. Address review findings and rerun affected checks.
8. When evidence and required gates are satisfied, squash-merge unless the repository specifies another strategy, then automatically delete the merged branch.
9. Move the Project item to `Done`, close the Issue, and update execution history after merge verification.

Recommended Project statuses are `Backlog`, `Ready`, `In Progress`, `In Review`,
`Changes Requested`, `Verification`, `Blocked`, and `Done`.

## Solo-developer policy

- Branch protection and required-review rules are optional, not completion requirements.
- Force pushes to the developer's short-lived Issue branch are permitted when useful for cleaning history; never force-push another contributor's branch without approval.
- Keep process proportional. Do not create ceremony, duplicate documents, or retrospective evidence that does not improve delivery safety.
- Pull requests and fresh checks remain the professional evidence boundary even when the same person authors and merges the work.

## Execution records

When a repository uses execution JSON, update it with the change it describes:

- `progress.json` tracks phases, modules, Issues, pull requests, blockers, Project state, and verification.
- `handoff.json` contains the one active implementation package and its review evidence; clear or archive it after merge or cancellation.
- `decisions.json` is append-only for accepted decisions, supersessions, and merged change history. Do not rewrite historical entries.

Execution files coordinate delivery; they do not override accepted context,
decisions, specifications, Issues, or pull requests.

## Evidence and gates

- Never report an unrun check as passing. Record the command, result, relevant evidence, and verified commit when required.
- Stop before production deployment, destructive or irreversible data changes, legal or compliance decisions, financial-policy changes, security-control weakening, secret rotation requiring owner action, or external publication of private source.
- State the exact gate, why it applies, the owner's required action, and what resumes after approval.
- Work is complete when the approved outcome exists, acceptance criteria and required checks pass, evidence and execution records are current, and the pull request is merged and verified where required.
