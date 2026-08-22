---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\arize-ai-provider-integration\references\ax-setup.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\arize-ai-provider-integration\references\ax-setup.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.arize-ai-provider-integration.references.ax-setup.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\arize-ai-provider-integration\references\ax-setup.md'
source_file: 'ax-setup.md'
source_sha256: 'f25bbbfb9e86a3e0c0238c1b797d7fd96b60d1384c3a1539647d2dd52f6299be'
generated: true
---

# `ax-setup.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\arize-ai-provider-integration\references\ax-setup.md`
> SHA-256: `f25bbbfb9e86a3e0c0238c1b797d7fd96b60d1384c3a1539647d2dd52f6299be`

```markdown
# ax CLI — Troubleshooting

Consult this only when an `ax` command fails. Do NOT run these checks proactively.

## Check version first

If `ax` is installed (not `command not found`), always run `ax --version` before investigating further. The version must be `0.14.0` or higher — many errors are caused by an outdated install. If the version is too old, see **Version too old** below.

## `ax: command not found`

**macOS/Linux:**
1. Check common locations: `~/.local/bin/ax`, `~/Library/Python/*/bin/ax`
2. Install: `uv tool install arize-ax-cli` (preferred), `pipx install arize-ax-cli`, or `pip install arize-ax-cli`
3. Add to PATH if needed: `export PATH="$HOME/.local/bin:$PATH"`

**Windows (PowerShell):**
1. Check: `Get-Command ax` or `where.exe ax`
2. Common locations: `%APPDATA%\Python\Scripts\ax.exe`, `%LOCALAPPDATA%\Programs\Python\Python*\Scripts\ax.exe`
3. Install: `pip install arize-ax-cli`
4. Add to PATH: `$env:PATH = "$env:APPDATA\Python\Scripts;$env:PATH"`

## Version too old (below 0.14.0)

Upgrade: `uv tool install --force --reinstall arize-ax-cli`, `pipx upgrade arize-ax-cli`, or `pip install --upgrade arize-ax-cli`

## SSL/certificate error

- macOS: `export SSL_CERT_FILE=/etc/ssl/cert.pem`
- Linux: `export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt`
- Fallback: `export SSL_CERT_FILE=$(python -c "import certifi; print(certifi.where())")`

## Subcommand not recognized

Upgrade ax (see above) or use the closest available alternative.

## Still failing

Stop and ask the user for help.

```