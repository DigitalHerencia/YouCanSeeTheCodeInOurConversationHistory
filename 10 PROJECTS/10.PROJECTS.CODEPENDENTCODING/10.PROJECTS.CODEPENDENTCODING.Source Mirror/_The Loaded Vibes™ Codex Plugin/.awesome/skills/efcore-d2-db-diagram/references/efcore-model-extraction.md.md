---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\efcore-model-extraction.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\efcore-model-extraction.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.efcore-d2-db-diagram.references.efcore-model-extraction.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\efcore-model-extraction.md'
source_file: 'efcore-model-extraction.md'
source_sha256: '68605a8487c4c56c01924a23ba2b1df37f5d02bebe6e1799e42f98b818d0fe17'
generated: true
---

# `efcore-model-extraction.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\efcore-d2-db-diagram\references\efcore-model-extraction.md`
> SHA-256: `68605a8487c4c56c01924a23ba2b1df37f5d02bebe6e1799e42f98b818d0fe17`

```markdown
# EF Core Model Extraction

## Files to inspect

Inspect, in this order:

1. `DbContext` classes.
2. `DbSet<T>` declarations.
3. `OnModelCreating`.
4. `IEntityTypeConfiguration<T>` classes.
5. Entity classes.
6. Migrations and model snapshot.
7. Data annotations.

## Mapping priority

When sources conflict, use:

1. Latest migration / model snapshot.
2. Fluent API.
3. Data annotations.
4. EF Core conventions.
5. C# shape.

## Important EF Core APIs

Look for:

- `ToTable`
- `HasKey`
- `HasAlternateKey`
- `HasIndex`
- `IsUnique`
- `Property`
- `HasColumnName`
- `HasColumnType`
- `IsRequired`
- `HasMaxLength`
- `HasConversion`
- `HasOne`
- `WithMany`
- `WithOne`
- `HasForeignKey`
- `OnDelete`
- `OwnsOne`
- `OwnsMany`
- `UsingEntity`
- `Ignore`

## Migrations

Use migrations to detect:

- Actual table names.
- Join tables.
- Shadow FK columns.
- Indexes.
- Composite keys.
- Delete behaviors.
- Migration-only tables.

```