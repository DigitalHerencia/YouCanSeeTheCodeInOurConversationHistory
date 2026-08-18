---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\find-replace-text.jsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\find-replace-text.jsx'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.adobe-illustrator-scripting.scripts.find-replace-text.jsx'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\find-replace-text.jsx'
source_file: 'find-replace-text.jsx'
source_sha256: 'd5c63429602789eb9fb2cef738d09817328ca375e46ffed425235f0abd92286d'
generated: true
---

# `find-replace-text.jsx`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\find-replace-text.jsx`
> SHA-256: `d5c63429602789eb9fb2cef738d09817328ca375e46ffed425235f0abd92286d`

```jsx
// find-replace-text.jsx
// Finds and replaces text across all text frames in the active document.
// Usage: Run from File > Scripts > Other Scripts in Adobe Illustrator.

#target illustrator

(function () {
    if (app.documents.length === 0) {
        alert("No document is open.");
        return;
    }

    var doc = app.activeDocument;

    var findStr = prompt("Find text:", "");
    if (findStr === null || findStr === "") return;

    var replaceStr = prompt("Replace with:", "");
    if (replaceStr === null) return;

    var count = 0;
    for (var i = 0; i < doc.textFrames.length; i++) {
        var tf = doc.textFrames[i];
        var original = tf.contents;
        if (original.indexOf(findStr) !== -1) {
            tf.contents = original.split(findStr).join(replaceStr);
            count++;
        }
    }

    alert("Replaced text in " + count + " text frame(s).");
})();

```