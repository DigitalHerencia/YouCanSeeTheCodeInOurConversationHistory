---
title: 'The Maximal Template™ Domain Library\.github\PULL_REQUEST_TEMPLATE.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\.github\PULL_REQUEST_TEMPLATE.md'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.github.pull-request-template.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\.github\PULL_REQUEST_TEMPLATE.md'
source_file: 'PULL_REQUEST_TEMPLATE.md'
source_sha256: '4dd243c0fc57e44bcc1bd31d32beec93863db1eef75498dc607aebdb805e1b41'
generated: true
---

# `PULL_REQUEST_TEMPLATE.md`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\.github\PULL_REQUEST_TEMPLATE.md`
> SHA-256: `4dd243c0fc57e44bcc1bd31d32beec93863db1eef75498dc607aebdb805e1b41`

```markdown
## Outcome

Describe the bounded outcome this PR implements.

## Spec / Issue

- Spec:
- Issue:

## Architectural boundaries touched

- [ ] Routes / HTTP
- [ ] Features
- [ ] Blocks / navigation / shells / UI
- [ ] Fetchers
- [ ] CRUD actions
- [ ] DB selects / DTOs / transactions
- [ ] Auth
- [ ] Authz
- [ ] Integrations
- [ ] Workflows
- [ ] Cache
- [ ] Schemas / types
- [ ] Prisma lifecycle
- [ ] Recipe selection / shared foundation

## Contract check

- [ ] File placement follows the canonical classifier.
- [ ] Features do not import `components/ui/*` directly.
- [ ] Persisted reads/writes use the correct boundaries.
- [ ] Auth/authz/tenant boundaries are preserved where applicable.
- [ ] No unnecessary directory or client-component architecture was introduced.
- [ ] Webhook HTTP lifecycle remains in `app/api` where applicable.

## Validation evidence

List only checks actually run and their observed result.

## Remaining limitations

State anything intentionally not verified, not changed, or deferred.

```