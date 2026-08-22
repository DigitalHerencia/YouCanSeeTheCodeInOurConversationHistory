---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\creating-oracle-to-postgres-migration-bug-report\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\creating-oracle-to-postgres-migration-bug-report\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.creating-oracle-to-postgres-migration-bug-report.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\creating-oracle-to-postgres-migration-bug-report\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '993ffe2426a60038b6917068d52a8784eda3aa90d9894e3e840b3c7f289cbb41'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\creating-oracle-to-postgres-migration-bug-report\SKILL.md`
> SHA-256: `993ffe2426a60038b6917068d52a8784eda3aa90d9894e3e840b3c7f289cbb41`

```markdown
---
name: creating-oracle-to-postgres-migration-bug-report
description: 'Creates structured bug reports for defects found during Oracle-to-PostgreSQL migration. Use when documenting behavioral differences between Oracle and PostgreSQL as actionable bug reports with severity, root cause, and remediation steps.'
---

# Creating Bug Reports for Oracle-to-PostgreSQL Migration

## When to Use

- Documenting a defect caused by behavioral differences between Oracle and PostgreSQL
- Writing or reviewing a bug report for an Oracle-to-PostgreSQL migration project

## Bug Report Format

Use the template in [references/BUG-REPORT-TEMPLATE.md](references/BUG-REPORT-TEMPLATE.md). Each report must include:

- **Status**: ✅ RESOLVED, ⛔ UNRESOLVED, or ⏳ IN PROGRESS
- **Component**: Affected endpoint, repository, or stored procedure
- **Test**: Related automated test names
- **Severity**: Low / Medium / High / Critical — based on impact scope
- **Problem**: Expected Oracle behavior vs. observed PostgreSQL behavior
- **Scenario**: Ordered reproduction steps with seed data, operation, expected result, and actual result
- **Root Cause**: The specific Oracle/PostgreSQL behavioral difference causing the defect
- **Solution**: Changes made or required, with explicit file paths
- **Validation**: Steps to confirm the fix on both databases

## Oracle-to-PostgreSQL Guidance

- **Oracle is the source of truth** — frame expected behavior from the Oracle baseline
- Call out data layer nuances explicitly: empty string vs. NULL, type coercion strictness, collation, sequence values, time zones, padding, constraints
- Client code changes should be avoided unless required for correct behavior; when proposed, document and justify them clearly

## Writing Style

- Plain language, short sentences, clear next actions
- Present or past tense consistently
- Bullets and numbered lists for steps and validations
- Minimal SQL excerpts and logs as evidence; omit sensitive data and keep snippets reproducible
- Stick to existing runtime/language versions; avoid speculative fixes

## Filename Convention

Save bug reports to `.github/oracle-to-postgres-migration/Reports/{ProjectName}/BUG_REPORT_<DescriptiveSlug>.md` where:
- `{ProjectName}` is the project's assembly/folder name with spaces normalized to `-` (e.g. `MyApp.DataAccess`)
- `<DescriptiveSlug>` is a short PascalCase identifier describing the defect (e.g., `EmptyStringNullHandling`, `RefCursorUnwrapFailure`)

```