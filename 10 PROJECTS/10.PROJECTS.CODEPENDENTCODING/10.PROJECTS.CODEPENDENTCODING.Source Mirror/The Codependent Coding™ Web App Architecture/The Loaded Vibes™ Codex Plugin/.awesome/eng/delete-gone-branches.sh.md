---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\delete-gone-branches.sh'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\delete-gone-branches.sh'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.delete-gone-branches.sh'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\delete-gone-branches.sh'
source_file: 'delete-gone-branches.sh'
source_sha256: '8d27446604050dcc45f38e193fad6a75f3ee89664456577137330dadc54ac5d4'
generated: true
---

# `delete-gone-branches.sh`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\delete-gone-branches.sh`
> SHA-256: `8d27446604050dcc45f38e193fad6a75f3ee89664456577137330dadc54ac5d4`

```bash
#!/bin/bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: bash scripts/delete-gone-branches.sh [--apply]

Find local branches whose upstream is marked "[gone]" and delete them.

Options:
  --apply    Actually delete the branches with `git branch -D`
  --help     Show this help text

Without --apply, the script prints what it would delete.
EOF
}

apply=false

case "${1:-}" in
  "")
    ;;
  --apply)
    apply=true
    ;;
  --help|-h)
    usage
    exit 0
    ;;
  *)
    echo "Unknown option: $1" >&2
    usage >&2
    exit 1
    ;;
esac

git fetch --prune --quiet

mapfile -t gone_branches < <(
  git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads |
    while IFS= read -r line; do
      branch=${line% *}
      tracking=${line#"$branch "}
      if [[ "$tracking" == "[gone]" ]]; then
        printf '%s\n' "$branch"
      fi
    done
)

if [[ ${#gone_branches[@]} -eq 0 ]]; then
  echo "No local branches with gone upstreams found."
  exit 0
fi

current_branch="$(git branch --show-current)"

echo "Found ${#gone_branches[@]} branch(es) with gone upstreams:"
printf '  %s\n' "${gone_branches[@]}"

if [[ "$apply" != true ]]; then
  echo
  echo "Dry run only. Re-run with --apply to delete them."
  exit 0
fi

deleted_count=0

for branch in "${gone_branches[@]}"; do
  if [[ "$branch" == "$current_branch" ]]; then
    echo "Skipping current branch: $branch"
    continue
  fi

  git branch -D "$branch"
  deleted_count=$((deleted_count + 1))
done

echo
echo "Deleted $deleted_count branch(es)."

```