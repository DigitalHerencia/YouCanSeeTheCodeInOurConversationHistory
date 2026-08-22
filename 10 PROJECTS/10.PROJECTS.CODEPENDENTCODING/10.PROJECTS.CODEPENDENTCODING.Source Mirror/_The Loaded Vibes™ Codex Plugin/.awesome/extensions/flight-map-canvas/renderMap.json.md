---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\flight-map-canvas\renderMap.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\flight-map-canvas\renderMap.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.flight-map-canvas.rendermap.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\flight-map-canvas\renderMap.json'
source_file: 'renderMap.json'
source_sha256: '78b9e1f72c85dc0f034caea3b41c7da83487ada232fda444ef9af6013bdc9b91'
generated: true
---

# `renderMap.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\flight-map-canvas\renderMap.json`
> SHA-256: `78b9e1f72c85dc0f034caea3b41c7da83487ada232fda444ef9af6013bdc9b91`

```json
{
    "map": {
        "width": 2210,
        "height": 1290,
        "tileZoom": 15,
        "tileSize": 100,
        "loadRadius": 25,
        "unloadRadius": 9,
        "startAltitude": 200,
        "fogDensity": 0.00092,
        "radiusFeather": 28.5,
        "maxTiles": 600
    },
    "filler": {
        "sampleInterval": 55,
        "updateIntervalSec": 15,
        "perimeter": {
            "patchCount": 15,
            "patchSize": 15
        },
        "center": {
            "patchCount": 4,
            "patchSize": 7
        },
        "padding": {
            "patchCount": 6,
            "patchSize": 9
        }
    },
    "cloud": {
        "enabled": true,
        "opacity": 0.35,
        "speed": 0.0004,
        "coverage": 0.5,
        "scale": 0.008
    }
}

```