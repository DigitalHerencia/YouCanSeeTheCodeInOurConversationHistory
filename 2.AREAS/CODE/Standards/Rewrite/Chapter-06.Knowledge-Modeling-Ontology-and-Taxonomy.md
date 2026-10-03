# Chapter 06: Knowledge Modeling, Ontology and Taxonomy

**The Book of Knowledge™**

## Concept

Every system carries a model of itself, whether or not anyone wrote it down. Knowledge modeling is the practice of making that model deliberate by separating the different questions a model answers. Engineers routinely blur these questions into "the architecture," and the blur is where confusion starts. The vocabulary below is standard across information science, software architecture, and knowledge engineering, and each term maps to something concrete in a codebase.

## The knowledge-model stack

- **Ontology**: what exists and how those things relate. In code, the domain model: Organization, Membership, Deal, Invoice, and the relationships between them.
- **Taxonomy**: how known things are classified. In code, the closed sets: status enums, role lists, the list of business domains.
- **Terminology and nomenclature**: what each concept is called (Chapter 08).
- **Semantics**: what a name or a contract means, precisely enough that two readers agree.
- **Mereology**: part-whole relationships. In code, composition: a primitive is part of a block, a block is part of a template, a template is part of a feature.
- **Topology**: connection and dependency structure. In code, which layer may import which (Chapter 11).
- **Epistemology**: what counts as evidence and authority. In code and process, the evidence states and the authority ordering (Chapters 12 and 17).
- **Typology**: recurring kinds of things. In code, the pattern catalog (Chapter 09).
- **Information architecture**: how humans and machines find the knowledge again. In a repository, the directory, the indexes, and the navigation files.

## Why it exists

Separating these questions lets you notice which one you are actually asking. "Where does this file go" is an information-architecture question. "Can this layer call that one" is a topology question. "Is this the same thing as that" is an ontology question. Answering an ontology question by rearranging folders is the classic mistake: it changes where the answer is stored without deciding what the answer is.

## Where people get it wrong

The common failure is encoding every dimension in the filesystem. The result is a deep folder tree that tries to express classification, ownership, lifecycle, and dependency simultaneously, and expresses none of them reliably. A folder can only hold one parent, but a concept usually belongs to several classifications at once, so a tree forces an arbitrary choice and hides the others.

## Your stance

Do not force every conceptual dimension into the filesystem. Classification belongs in the model and its metadata unless physical separation materially improves retrieval or enforcement. A folder is not an ontology, and an ontology is not a reason to create six levels of folders. Taxonomy criteria must be explicit enough that two readers place the same artifact in the same category. If a classification does not affect retrieval, ownership, authority, or execution, it may not deserve a separate physical category at all.

## Trade-offs you're accepting

Keeping structure physically shallow means some classifications live only in metadata or in an index, which is one more place to keep current. You're accepting that in exchange for a tree that stays navigable and for classifications that can overlap without forcing a false either-or.

## See also

Book of Implementation, Chapter 06: where each modeling dimension lives in your template, and the rules for the doctrine's own documents.
