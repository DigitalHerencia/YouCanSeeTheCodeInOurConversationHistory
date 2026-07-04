\# AGENTS.md



\## Purpose



This repository is a private Obsidian vault named DevNotes.



Agents working in this repo must treat it as a source-controlled knowledge system, not a normal codebase.



\## Highest-Priority Source Files



Read these first:



1\. `PROJECT\_SOURCE.md`

2\. `devnotes.home.md`

3\. `90 OBSIDIAN/Contracts/obsidian.contracts.naming-standard.md`

4\. `90 OBSIDIAN/Contracts/obsidian.contracts.property-schema.md`

5\. `90 OBSIDIAN/Contracts/obsidian.contracts.note-types.md`



\## Vault Rules



\- Preserve numbered top-level folders.

\- Preserve dot-notation filenames for durable notes.

\- Use Obsidian wikilinks for vault-internal links.

\- Use Markdown links only for external URLs.

\- Add valid YAML frontmatter to durable notes.

\- Frontmatter must be the first thing in the file.

\- Do not use Markdown `\*` bullets inside YAML frontmatter lists.

\- Do not delete legacy material unless explicitly instructed.

\- Write automation scripts into `\_OPS`.

\- Use Git checkpoints before and after structural migrations.



\## Canonical Property Shape



```yaml

\---

title:

type:

scope:

project:

domain:

artifact:

kind:

namespace:

status:

authority:

parent:

depends\_on:

supersedes:

tags:

created:

updated:

\---

```

## Folder Model



00 ZETTELKASTEN      raw capture

10 PROJECTS         project-bound knowledge

20 DOCUMENTATION    external docs and references

30 DEEP RESEARCH    research reports

40 TECH STACK       stack references

50 REGRETS...       writing and essays

90 OBSIDIAN         vault operating system

\_OPS                automation scripts

.agent-logs         tracked agent operation history



## Project Folder Model



00 PROJECT MAP

10 PRODUCT

20 CONTRACTS

30 ARCHITECTURE

40 FEATURES

50 AGENT OPS

60 EXECUTION

70 RESEARCH

80 LEGAL

90 ARCHIVE



## Format Rules



Markdown = thinking and explanation

YAML     = structured planning and contracts

JSON     = execution state and logs

Git Rules



Before structural changes:


```

git status --short

git add -A

git commit -m "checkpoint before vault migration"

```


After structural changes:


```

git add -A

git status --short

git commit -m "describe vault change"

```

Do Not

Do not flatten project folders.

Do not rename top-level folders casually.

Do not move files without preserving meaning.

Do not make Obsidian frontmatter invalid.

Do not assume .agent-logs/events.jsonl is disposable.

