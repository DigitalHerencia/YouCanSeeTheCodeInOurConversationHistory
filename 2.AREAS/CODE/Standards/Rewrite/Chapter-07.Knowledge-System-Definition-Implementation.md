# Chapter 07: Knowledge System Definition

**The Book of Implementation™**

## Golden pattern: the canonical filesystem

```text
TypeScripture/
  The-Book-of-Knowledge/
    Chapter-01.<Name>.md
    ...
    Chapter-24.<Name>.md
  The-Book-of-Implementation/
    Chapter-01.<Name>.md          # identical filename to its Knowledge pair
    ...
    Chapter-24.<Name>.md
  00-Chapter-Map.md
  00-Chapter-Map.json
  00-Source-Map.md
  00-Validation.json
```

## Golden pattern: the pairing rule

Chapter N in one book pairs with Chapter N in the other **by identical filename**. That is what lets a tool, a script, or a reader jump from a concept to its realization without a lookup table. It is also why a rewritten chapter must keep the original filename even if its title improves.

## Forbidden packaging

- **No faceted directory maze.** No epistemology, ontology, or topology folders (Chapter 06).
- **No embedded original-source frontmatter or `SOURCE:` compilation comments in canonical chapters.**
- **No dead Obsidian wikilinks, migration-path links, or archived-vault Dataview queries.**
- **Historical sources stay traceable through the source map**, never pasted into canonical chapters.

## Check I ran on the repository's current state

Executed against `content/` in the cloned repository:

| Property | Result |
|---|---|
| Chapters per book | 24 and 24 |
| Filenames identical across the two books | yes |
| Subfolders inside either book | 0 |
| Files beginning with YAML frontmatter | 0 |
| Files containing wikilinks (`[[`) | 0 |
| Files containing `SOURCE:` or `dataview` | 1 each, both being Chapter 07's own sentence forbidding them, so no violation |
| `00-Chapter-Map.md`, `00-Chapter-Map.json`, `00-Source-Map.md`, `00-Validation.json` | **absent** |

The books satisfy their own packaging rules. The four navigation files do not exist in the repository.

## Anatomy

- **The pairing rule is the only index the books strictly need.** The map files are a convenience layer over it.
- **`00-Validation.json` records evidence, not intent.** It should state which checks ran and what they found, using the executed, skipped, blocked, and inferred vocabulary (Chapter 12), so it cannot claim more than was observed.
- **The source map is the sole home for provenance.** That is what lets chapter bodies stay clean.

## Gap flagged, not yet closed

The four `00-*` files are specified but missing from the repository. I have generated the chapter map, its JSON form, and a validation record for the rewritten set (see the packaged delivery). The source map is not generated, because it requires tracing every chapter back to its archived source documents, which is a separate pass.

## Checklist

- [ ] Two flat folders, 24 chapters each, identical filenames across them
- [ ] No frontmatter, wikilinks, or source-compilation comments inside a chapter
- [ ] Provenance lives only in the source map
- [ ] A chapter rewrite keeps its original filename
- [ ] The validation file reports what was executed, and never more
