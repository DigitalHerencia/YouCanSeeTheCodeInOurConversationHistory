---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\migrating-oracle-to-postgres-stored-procedures\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\migrating-oracle-to-postgres-stored-procedures\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.migrating-oracle-to-postgres-stored-procedures.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\migrating-oracle-to-postgres-stored-procedures\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '9e4b7233a4ec43e0581d5511ce07a3d6607cdfb8a36b22f884e72c7b7e69f1a5'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\migrating-oracle-to-postgres-stored-procedures\SKILL.md`
> SHA-256: `9e4b7233a4ec43e0581d5511ce07a3d6607cdfb8a36b22f884e72c7b7e69f1a5`

````markdown
---
name: migrating-oracle-to-postgres-stored-procedures
description: 'Migrates Oracle PL/SQL stored procedures to PostgreSQL PL/pgSQL. Translates Oracle-specific syntax, preserves method signatures and type-anchored parameters, leverages orafce where appropriate, and applies explicit collation mapping (`COLLATE "C"` only when appropriate, locale collations when required). Use when converting Oracle stored procedures or functions to PostgreSQL equivalents during a database migration.'
---

# Migrating Stored Procedures from Oracle to PostgreSQL

Translate Oracle PL/SQL stored procedures and functions to PostgreSQL PL/pgSQL equivalents.

## Workflow

```
Progress:
- [ ] Step 1: Read the Oracle source procedure
- [ ] Step 2: Translate to PostgreSQL PL/pgSQL
- [ ] Step 3: Write the migrated procedure to Postgres output directory
```

**Step 1: Read the Oracle source procedure**

Read the Oracle stored procedure from `.github/oracle-to-postgres-migration/DDL/Oracle/Procedures and Functions/`. Consult the Oracle table/view definitions at `.github/oracle-to-postgres-migration/DDL/Oracle/Tables and Views/` for type resolution.

**Step 2: Translate to PostgreSQL PL/pgSQL**

Apply these translation rules:

- Translate all Oracle-specific syntax to PostgreSQL equivalents.
- Preserve original functionality and control flow logic.
- Keep type-anchored input parameters (e.g., `PARAM_NAME IN table_name.column_name%TYPE`).
- Use explicit types (`NUMERIC`, `VARCHAR`, `INTEGER`) for output parameters passed to other procedures — do not type-anchor these.
- Do not alter method signatures.
- Do not prefix object names with schema names unless already present in the Oracle source.
- Leave exception handling and rollback logic unchanged.
- Do not generate `COMMENT` or `GRANT` statements.
- Apply collation intentionally when ordering text:
  - Use `COLLATE "C"` only when Oracle-compatible binary ordering is required and no other sort order is specified.
  - If Oracle used explicit linguistic sorting (for example `NLS_SORT = French`), map to an explicit PostgreSQL locale collation instead of `"C"`.
  - Use `SELECT collname, collprovider, collcollate, collctype FROM pg_collation ORDER BY collname;` to discover collations in the target environment.
- Treat `UNION ALL` as a review checkpoint. Validate plan quality per branch and restructure if combined-branch planning causes regressions (for example, unexpected sequential scans on large tables).
- Leverage the `orafce` extension when it improves clarity or fidelity.

Consult the PostgreSQL table/view definitions at `.github/oracle-to-postgres-migration/DDL/Postgres/{ProjectName}/Tables and Views/` for target schema details.

**Step 3: Write the migrated procedure to Postgres output directory**

Place each migrated procedure in its own file under `.github/oracle-to-postgres-migration/DDL/Postgres/{ProjectName}/Procedures and Functions/{PACKAGE_NAME_IF_APPLICABLE}/`. One procedure per file.

> `{ProjectName}` is the project's assembly/folder name with spaces normalized to `-` (e.g. `MyApp.DataAccess`). This matches the path used by the agent and other migration skills.

````