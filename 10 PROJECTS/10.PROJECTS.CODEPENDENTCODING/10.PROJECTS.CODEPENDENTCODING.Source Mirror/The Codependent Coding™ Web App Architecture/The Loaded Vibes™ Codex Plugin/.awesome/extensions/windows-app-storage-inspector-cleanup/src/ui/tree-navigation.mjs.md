---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\ui\tree-navigation.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\ui\tree-navigation.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.windows-app-storage-inspector-cleanup.src.ui.tree-navigation.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\ui\tree-navigation.mjs'
source_file: 'tree-navigation.mjs'
source_sha256: 'c89403b6ab78f1b4bdc0ebbe59034687269fb2908c5a98f592df46134d93ab5b'
generated: true
---

# `tree-navigation.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\ui\tree-navigation.mjs`
> SHA-256: `c89403b6ab78f1b4bdc0ebbe59034687269fb2908c5a98f592df46134d93ab5b`

```javascript
export function normalizePath(value) {
    return String(value ?? "")
        .replaceAll("/", "\\")
        .replace(/\\+$/, "")
        .toLowerCase();
}

export function containsPath(parentPath, targetPath) {
    const parent = normalizePath(parentPath);
    const target = normalizePath(targetPath);
    return parent === "" || target === parent || target.startsWith(`${parent}\\`);
}

export function getParentPath(value) {
    const path = String(value ?? "").replaceAll("/", "\\").replace(/\\+$/, "");
    const separatorIndex = path.lastIndexOf("\\");
    if (separatorIndex < 0) {
        return path;
    }
    return separatorIndex === 2 ? path.slice(0, separatorIndex + 1) : path.slice(0, separatorIndex);
}

export function findTreeStackForPath(tree, targetPath) {
    if (!tree || !normalizePath(targetPath)) {
        return [];
    }

    const stack = [tree];
    let node = tree;
    while (true) {
        const child = node.children?.find((item) => !item.aggregate && containsPath(item.path, targetPath));
        if (!child) {
            return stack;
        }
        stack.push(child);
        node = child;
    }
}

```