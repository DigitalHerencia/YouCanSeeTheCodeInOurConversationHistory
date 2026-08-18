---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\references\object-model-quick-reference.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\references\object-model-quick-reference.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.adobe-illustrator-scripting.references.object-model-quick-reference.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\references\object-model-quick-reference.md'
source_file: 'object-model-quick-reference.md'
source_sha256: '83234b798727d2c570a5a822f1221c3bf5f2230c8fa3e7ef8f195ef1a61f3736'
generated: true
---

# `object-model-quick-reference.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\adobe-illustrator-scripting\references\object-model-quick-reference.md`
> SHA-256: `83234b798727d2c570a5a822f1221c3bf5f2230c8fa3e7ef8f195ef1a61f3736`

````markdown
# Illustrator JavaScript Object Model Quick Reference

## Containment Hierarchy

```
Application (app)
 └─ Document
     ├─ Layer
     │   ├─ pathItems[]        → PathItem → PathPoint[]
     │   ├─ compoundPathItems[] → CompoundPathItem
     │   ├─ textFrames[]       → TextFrame
     │   │   ├─ characters[]   → TextRange (single char)
     │   │   ├─ words[]        → TextRange (word)
     │   │   ├─ paragraphs[]   → TextRange (paragraph)
     │   │   ├─ lines[]        → TextRange (line)
     │   │   └─ insertionPoints[]
     │   ├─ placedItems[]      → PlacedItem
     │   ├─ rasterItems[]      → RasterItem
     │   ├─ meshItems[]        → MeshItem
     │   ├─ pluginItems[]      → PluginItem
     │   ├─ graphItems[]       → GraphItem
     │   ├─ symbolItems[]      → SymbolItem → Symbol
     │   ├─ groupItems[]       → GroupItem (recursive pageItems)
     │   ├─ nonNativeItems[]   → NonNativeItem
     │   └─ legacyTextItems[]  → LegacyTextItem
     ├─ Artboard[]
     ├─ Swatch[] / Spot[] / Gradient[] / Pattern[]
     ├─ GraphicStyle[] / Brush[] / Symbol[]
     ├─ Story[]
     ├─ CharacterStyle[] / ParagraphStyle[]
     ├─ Variable[] / Dataset[]
     └─ View[]
```

## Artwork Item Types (pageItems members)

| Type | typename | Collection | Notes |
|---|---|---|---|
| Path | `PathItem` | `pathItems` | Lines, shapes, freeform paths |
| Compound path | `CompoundPathItem` | `compoundPathItems` | Multiple paths combined |
| Group | `GroupItem` | `groupItems` | Contains nested pageItems |
| Text frame | `TextFrame` | `textFrames` | Point, area, or path text |
| Placed image | `PlacedItem` | `placedItems` | Linked external files |
| Raster image | `RasterItem` | `rasterItems` | Embedded bitmaps |
| Mesh | `MeshItem` | `meshItems` | Gradient mesh objects |
| Graph | `GraphItem` | `graphItems` | Chart/graph objects |
| Plugin item | `PluginItem` | `pluginItems` | Plugin-generated art |
| Symbol instance | `SymbolItem` | `symbolItems` | Instance of a Symbol |
| Non-native | `NonNativeItem` | `nonNativeItems` | Foreign objects |
| Legacy text | `LegacyTextItem` | `legacyTextItems` | Pre-CS text objects |

## Color Object Types

| Object | Color Space | Value Range | Notes |
|---|---|---|---|
| `RGBColor` | RGB | 0-255 per channel | `.red`, `.green`, `.blue` |
| `CMYKColor` | CMYK | 0-100 per channel | `.cyan`, `.magenta`, `.yellow`, `.black` |
| `GrayColor` | Grayscale | 0-100 | `.gray` (0=black, 100=white) |
| `LabColor` | Lab | L: 0-100, a/b: -128 to 127 | `.l`, `.a`, `.b` |
| `SpotColor` | Spot | tint 0-100 | `.spot`, `.tint` |
| `PatternColor` | Pattern | - | `.pattern`, `.matrix` |
| `GradientColor` | Gradient | - | `.gradient`, `.origin`, `.angle` |
| `NoColor` | None | - | Transparent/no fill |

## Common Scripting Constants

### Document and Color

- `DocumentColorSpace.RGB` / `.CMYK`

### Text

- `Justification.LEFT` / `.CENTER` / `.RIGHT` / `.FULLJUSTIFY` / `.FULLJUSTIFYLASTLINELEFT` / `.FULLJUSTIFYLASTLINECENTER` / `.FULLJUSTIFYLASTLINERIGHT`
- `TextType.POINTTEXT` / `.AREATEXT` / `.PATHTEXT`
- `FontBaselineOption.NORMALBASELINE` / `.SUPERSCRIPT` / `.SUBSCRIPT`

### Paths

- `PointType.SMOOTH` / `.CORNER`
- `StrokeCap.BUTTENDCAP` / `.ROUNDENDCAP` / `.PROJECTINGENDCAP`
- `StrokeJoin.MITERENDJOIN` / `.ROUNDENDJOIN` / `.BEVELENDJOIN`

### Transformations

- `Transformation.DOCUMENTORIGIN` / `.BOTTOM` / `.BOTTOMLEFT` / `.BOTTOMRIGHT` / `.CENTER` / `.LEFT` / `.RIGHT` / `.TOP` / `.TOPLEFT` / `.TOPRIGHT`

### Blend Modes

- `BlendModes.NORMAL` / `.MULTIPLY` / `.SCREEN` / `.OVERLAY` / `.SOFTLIGHT` / `.HARDLIGHT` / `.COLORDODGE` / `.COLORBURN` / `.DARKEN` / `.LIGHTEN` / `.DIFFERENCE` / `.EXCLUSION` / `.HUE` / `.SATURATIONBLEND` / `.COLORBLEND` / `.LUMINOSITY`

### Element Placement

- `ElementPlacement.PLACEATBEGINNING` / `.PLACEATEND` / `.PLACEBEFORE` / `.PLACEAFTER` / `.INSIDE`

### Z-Order

- `ZOrderMethod.BRINGTOFRONT` / `.SENDTOBACK` / `.BRINGFORWARD` / `.SENDBACKWARD`

### Save/Export

- `SaveOptions.SAVECHANGES` / `.DONOTSAVECHANGES` / `.PROMPTTOSAVECHANGES`
- `ExportType.PNG24` / `.PNG8` / `.JPEG` / `.SVG` / `.TIFF` / `.PHOTOSHOP` / `.AUTOCAD` / `.FLASH` / `.GIF`
- `Compatibility.ILLUSTRATOR8` through `.ILLUSTRATOR24`
- `PDFCompatibility.ACROBAT4` through `.ACROBAT8`

### Gradient

- `GradientType.LINEAR` / `.RADIAL`

### Variables

- `VariableKind.TEXTUAL` / `.IMAGE` / `.VISIBILITY` / `.GRAPH`

### User Interaction

- `UserInteractionLevel.DISPLAYALERTS` / `.DONTDISPLAYALERTS`

### Print

- `PrintArtworkDesignation.ALLLAYERS` / `.VISIBLELAYERS` / `.VISIBLEPRINTABLELAYERS`

## Unit Conversions

| From | To Points | Formula |
|---|---|---|
| Inches | Points | `inches * 72` |
| Centimeters | Points | `cm * 28.346` |
| Millimeters | Points | `mm * 2.834645` |
| Picas | Points | `picas * 12` |
| Em units | Points | `(emUnits * fontSize) / 1000` |

````