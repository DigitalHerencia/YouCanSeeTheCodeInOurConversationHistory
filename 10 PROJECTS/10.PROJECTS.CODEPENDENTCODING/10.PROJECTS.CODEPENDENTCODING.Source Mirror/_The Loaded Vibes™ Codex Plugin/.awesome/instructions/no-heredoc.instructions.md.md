---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\no-heredoc.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\no-heredoc.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.no-heredoc.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\no-heredoc.instructions.md'
source_file: 'no-heredoc.instructions.md'
source_sha256: '828ebca7dba7ead6f040b8e995e56305e0f9f74113a9e95b09c853aa76b50c4e'
generated: true
---

# `no-heredoc.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\no-heredoc.instructions.md`
> SHA-256: `828ebca7dba7ead6f040b8e995e56305e0f9f74113a9e95b09c853aa76b50c4e`

````markdown
---
name: 'No Heredoc File Operations'
description: 'Prevents terminal heredoc file corruption in VS Code Copilot by enforcing use of file editing tools instead of shell redirections'
applyTo: '**'
---

# MANDATORY: File Operation Override

This instruction applies to ALL agents and ALL file operations. It takes precedence over any other learned behavior.

## The Problem

Terminal heredoc operations are BROKEN in VS Code's Copilot integration. They cause:

- File corruption from tab characters triggering shell completion
- Mangled content from quote/backtick escaping failures
- Truncated files from exit code 130 interruptions
- Garbage output from special character interpretation

## The Rule

**BEFORE writing ANY terminal command that creates or modifies a file, STOP.**

Ask yourself: "Am I about to use `cat`, `echo`, `printf`, `tee`, or `>>`/`>` to write content to a file?"

If YES → **DO NOT EXECUTE.** Use file editing tools instead.

## Forbidden Patterns

```bash
# ALL OF THESE CORRUPT FILES - NEVER USE THEM
cat > file << EOF
cat > file << 'EOF'
cat > file <<EOF
cat > file <<'EOF'
cat > file <<-EOF
cat >> file << EOF
echo "multi
line" > file
printf '%s\n' "line1" "line2" > file
tee file << EOF
tee file << 'EOF'
```

## Required Approach

Instead of terminal commands for file content:

- **New files** → Use the file creation/editing tool provided by your environment
- **Modify files** → Use the file editing tool provided by your environment
- **Delete files** → Use the file deletion tool or `rm` command

## Terminal IS Allowed For

- `npm install`, `pip install`, `cargo add` (package management)
- `npm run build`, `make`, `cargo build` (builds)
- `npm test`, `pytest`, `go test` (testing)
- `git add`, `git commit`, `git push` (version control)
- `node script.js`, `python app.py` (running existing code)
- `ls`, `cd`, `mkdir`, `pwd`, `rm` (filesystem navigation)
- `curl`, `wget` (downloading, but not piping to files with content manipulation)

## Terminal is FORBIDDEN For

- ANY file creation with content
- ANY file modification with content
- ANY heredoc syntax (`<<`)
- ANY multi-line string redirection

## Enforcement

This is not a suggestion. This is a hard technical requirement due to VS Code terminal integration bugs. Ignoring this instruction will result in corrupted files that the user must manually fix.

When you need to create or edit a file:

1. Stop before typing any terminal command
2. Use the appropriate file editing tool
3. The tool will handle the content correctly without corruption

````