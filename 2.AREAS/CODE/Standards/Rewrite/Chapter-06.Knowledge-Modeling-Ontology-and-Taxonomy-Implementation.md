# Chapter 06: Knowledge Modeling, Ontology and Taxonomy

**The Book of Implementation™**

## Golden pattern: where each modeling dimension lives

Verified against the live maximal template.

| Dimension | Where it lives | Real artifact |
|---|---|---|
| Ontology | Persistence schema plus a codebase-aligned catalog | `prisma/schema.prisma`, `context/Ontologies.Canonical-Catalog.md` |
| Taxonomy | Closed sets in the schema, and the canonical domain list | Prisma enums (`CrmDealStage`, `MembershipStatus`, `WebhookStatus`), decision `MAX-DEC-004` (crm, projects, support, marketing, invoicing, social, ai, portal, admin, user, common) |
| Terminology | Naming conventions and the translation table | Chapter 08 |
| Semantics | Contracts and validated shapes | Zod schemas in `schemas/`, DTO mappers in `lib/db/dto/` |
| Mereology | Composition ladder | `components/ui` (primitives) → `components/blocks` → `components/templates` → `features/` |
| Topology | Enforced import boundaries | Per-directory `no-restricted-imports` rules in `eslint.config.mjs` |
| Epistemology | Authority order and evidence states | Chapters 12 and 17, `.agents/execution/decisions.json` |
| Typology | The pattern catalog | Chapter 09 |
| Information architecture | Directory and navigation files | `AGENTS.md`, `context/docs/`, `context/specs/` |

## Golden pattern: classification stays out of the folder tree

```text
features/
  crm/            # one level: the domain (taxonomy value), not a deeper tree
    crmAccountsFeature.tsx
    crmContactsFeature.tsx
    ...
```

The domain is the only classification encoded as a folder. Everything finer (a status, a stage, a subject) is encoded in a name, an enum, or metadata, so it can overlap with other classifications without forcing a move.

## Golden pattern: rules for the documents themselves

The doctrine's own corpus follows the same rules:

- **Two flat books plus chapter maps.** Verified: `TypeScripture_The-Book-of-Knowledge/` and `TypeScripture_The-Book-of-Implementation/` each hold 24 chapters and no subfolders.
- **Chapter pairing by identical filename.** Verified: the two folders' listings are identical, so Chapter N in one book always pairs with Chapter N in the other.
- **Metadata minimum.** A canonical artifact carries only metadata that changes authority, retrieval, ownership, lifecycle, or automation. Chapters currently carry none beyond their title and book label, which is consistent with the rule.
- **Validation.** Validate unique chapter identity, book ownership, chapter pairing, and source traceability. Never validate an ontology by manufacturing directory depth.

## Anatomy

- **Each row of the table has exactly one home.** If you cannot say where a dimension lives, that dimension is either unmodeled or accidentally encoded in several places.
- **Topology is the only dimension enforced by tooling** (the ESLint import rules). Every other row is enforced by review, which is why the doctrine's rule about not creating decorative structure matters: unenforced structure decays.
- **The pairing rule is what makes the two books navigable together.** It is also why file names matter when these chapters are placed into the repository.

## Forbidden variants (enforced, not just documented)

- **No new folder level created to express a classification that does not affect retrieval, ownership, authority, or execution.**
- **No taxonomy whose criteria two readers would apply differently.** State the criterion or drop the category.
- **No ontology described in a document without an implemented counterpart** (Chapter 05).
- **No historical source frontmatter carried into a final chapter body.**

## Checklist

- [ ] Each modeling question (what exists, how it is classified, what it is called, what it may depend on) has one identified home
- [ ] Any new folder level is justified by a retrieval or enforcement benefit
- [ ] Classification criteria are explicit enough for two readers to agree
- [ ] Chapter identity and book pairing are validated by filename
