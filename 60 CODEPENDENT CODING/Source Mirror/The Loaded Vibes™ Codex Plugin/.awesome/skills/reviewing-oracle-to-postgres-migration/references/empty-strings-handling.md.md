---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\empty-strings-handling.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\empty-strings-handling.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.reviewing-oracle-to-postgres-migration.references.empty-strings-handling.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\empty-strings-handling.md'
source_file: 'empty-strings-handling.md'
source_sha256: '3a9dd47efaf90423c91a7413948697082c28f3b30ca16677205628e46734702f'
generated: true
---

# `empty-strings-handling.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\reviewing-oracle-to-postgres-migration\references\empty-strings-handling.md`
> SHA-256: `3a9dd47efaf90423c91a7413948697082c28f3b30ca16677205628e46734702f`

````markdown
# Oracle to PostgreSQL: Empty String Handling Differences

## Problem

Oracle automatically converts empty strings (`''`) to `NULL` in VARCHAR2 columns. PostgreSQL preserves empty strings as distinct from `NULL`. This difference can cause application logic errors and test failures during migration.

## Behavior Comparison

**Oracle:**
- Empty string (`''`) is **always** treated as `NULL` in VARCHAR2 columns
- `WHERE column = ''` never matches rows; use `WHERE column IS NULL`
- Cannot distinguish between explicit empty string and `NULL`

**PostgreSQL:**
- Empty string (`''`) and `NULL` are **distinct** values
- `WHERE column = ''` matches empty strings
- `WHERE column IS NULL` matches `NULL` values

## Code Example

```sql
-- Oracle behavior
INSERT INTO table (varchar_column) VALUES ('');
SELECT * FROM table WHERE varchar_column IS NULL;  -- Returns the row

-- PostgreSQL behavior  
INSERT INTO table (varchar_column) VALUES ('');
SELECT * FROM table WHERE varchar_column IS NULL;  -- Returns nothing
SELECT * FROM table WHERE varchar_column = '';     -- Returns the row
```

## Migration Actions

### 1. Stored Procedures
Update logic that assumes empty strings convert to `NULL`:

```sql
-- Preserve Oracle behavior (convert empty to NULL):
column = NULLIF(param, '')

-- Or accept PostgreSQL behavior (preserve empty string):
column = param
```

### 2. Application Code
Review code that checks for `NULL` and ensure it handles empty strings appropriately:

```csharp
// Before (Oracle-specific)
if (value == null) { }

// After (PostgreSQL-compatible)
if (string.IsNullOrEmpty(value)) { }
```

### 3. Tests
Update assertions to be compatible with both behaviors:

```csharp
// Migration-compatible test pattern
var value = reader.IsDBNull(columnIndex) ? null : reader.GetString(columnIndex);
Assert.IsTrue(string.IsNullOrEmpty(value));
```

### 4. Data Migration
Decide whether to:
- Convert existing `NULL` values to empty strings
- Convert empty strings to `NULL` using `NULLIF(column, '')`
- Leave values as-is and update application logic

````