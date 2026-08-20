---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\batch-export-png.jsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\batch-export-png.jsx'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.adobe-illustrator-scripting.scripts.batch-export-png.jsx'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\batch-export-png.jsx'
source_file: 'batch-export-png.jsx'
source_sha256: 'f0dc0fb89708d9990c58370db701d76102a31607c848fc46f425ddea60a04596'
generated: true
---

# `batch-export-png.jsx`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\scripts\batch-export-png.jsx`
> SHA-256: `f0dc0fb89708d9990c58370db701d76102a31607c848fc46f425ddea60a04596`

```jsx
// batch-export-png.jsx
// Exports every open Illustrator document as a PNG24 file to a chosen folder.
// Usage: Run from File > Scripts > Other Scripts in Adobe Illustrator.

#target illustrator

(function () {
    if (app.documents.length === 0) {
        alert("No documents are open.");
        return;
    }

    var outputFolder = Folder.selectDialog("Select output folder for PNG export");
    if (!outputFolder) return;

    var savedInteraction = app.userInteractionLevel;
    app.userInteractionLevel = UserInteractionLevel.DONTDISPLAYALERTS;

    try {
        for (var i = app.documents.length - 1; i >= 0; i--) {
            var doc = app.documents[i];
            var fileName = doc.name.replace(/\.[^.]+$/, "");
            var destFile = new File(outputFolder + "/" + fileName + ".png");

            var pngOpts = new ExportOptionsPNG24();
            pngOpts.transparency = true;
            pngOpts.artBoardClipping = true;
            pngOpts.horizontalScale = 100;
            pngOpts.verticalScale = 100;

            doc.exportFile(destFile, ExportType.PNG24, pngOpts);
        }
        alert("Exported " + app.documents.length + " file(s) to:\n" + outputFolder.fsName);
    } catch (e) {
        alert("Export error: " + e.message);
    } finally {
        app.userInteractionLevel = savedInteraction;
    }
})();

```