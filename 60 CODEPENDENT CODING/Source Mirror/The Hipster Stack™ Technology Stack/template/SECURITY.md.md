---
title: 'The Hipster Stack™ Technology Stack\template\SECURITY.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\SECURITY.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.security.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\SECURITY.md'
source_file: 'SECURITY.md'
source_sha256: '9caa824faedb643c215cc15de6ee761eac17c34850d7a83d486acd2cb5e4f581'
generated: true
---

# `SECURITY.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\SECURITY.md`
> SHA-256: `9caa824faedb643c215cc15de6ee761eac17c34850d7a83d486acd2cb5e4f581`

````markdown
# Security policy

## Reporting

Report suspected credential exposure or security vulnerabilities privately to the repository owner. Do not place credential values, raw provider payloads, environment files, or exploit details containing private data in an Issue, pull request, commit, screenshot, log, or chat transcript.

## Repository credential policy

- Provider-local state and generated credential files are not source artifacts.
- Only `.env.example` may be committed; it must contain non-live example values.
- Private keys, credentialed non-local database URLs, dumps, local databases, and generated release archives are rejected by the repository scanner.
- GitHub Actions receives read-only repository contents permission and does not persist checkout credentials.
- Provider credentials belong in the provider or deployment platform's secret store, scoped to the narrowest required environment and capability.

Run the complete repository security gate from PowerShell:

```powershell
pwsh -NoProfile -File scripts/Test-RepositorySecurity.ps1
```

See [the credential incident runbook](docs/runbooks/credential-incident.md) for containment, rotation, and history-cleanup responsibilities.

````