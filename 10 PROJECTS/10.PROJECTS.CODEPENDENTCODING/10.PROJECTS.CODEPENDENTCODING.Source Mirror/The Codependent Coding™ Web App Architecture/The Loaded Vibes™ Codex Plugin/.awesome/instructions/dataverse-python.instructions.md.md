---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\dataverse-python.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\dataverse-python.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.dataverse-python.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\dataverse-python.instructions.md'
source_file: 'dataverse-python.instructions.md'
source_sha256: '2b671b7e2e99083bd7c755c94f8c0a2f2d927c98d66519cdec7a67514ceadd87'
generated: true
---

# `dataverse-python.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\dataverse-python.instructions.md`
> SHA-256: `2b671b7e2e99083bd7c755c94f8c0a2f2d927c98d66519cdec7a67514ceadd87`

````markdown
---
applyTo: '**'
---
# Dataverse SDK for Python — Getting Started

- Install the Dataverse Python SDK and prerequisites.
- Configure environment variables for Dataverse tenant, client ID, secret, and resource URL.
- Use the SDK to authenticate via OAuth and perform CRUD operations.

## Setup
- Python 3.10+
- Recommended: virtual environment

## Install
```bash
pip install dataverse-sdk
```

## Auth Basics
- Use OAuth with Azure AD app registration.
- Store secrets in `.env` and load via `python-dotenv`.

## Common Tasks
- Query tables
- Create/update rows
- Batch operations
- Handle pagination and throttling

## Tips
- Reuse clients; avoid frequent re-auth.
- Add retries for transient failures.
- Log requests for troubleshooting.

````