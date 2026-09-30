# Chapter 09: Pattern Catalog

**The Book of Knowledge™**

## Concept

A pattern is a reusable solution shape for a recurring problem: it has a specific responsibility, a boundary, a contract, invariants, defined failure behavior, and known relationships to its neighbors. This is the same sense the term has in the classic design-pattern literature: a pattern is a named *shape of a solution*, not a snippet you paste. The catalog is the index of the patterns this doctrine treats as canonical, and its most important property is what it refuses to include.

## Why it exists

Shared names are what make a codebase discussable. If "fetcher," "action," and "workflow" each mean a precise thing with a precise boundary, then a code review comment like "this is doing a workflow's job inside an action" is a complete, checkable sentence. Without named patterns, the same conversation becomes a paragraph of description that each person interprets differently. This is also the practical payoff of the interview-vocabulary goal: a named pattern with a known contract is something you can explain, defend, and whiteboard, where an unnamed habit is only something you do.

The catalog also exists to prevent the opposite failure, **pattern inflation**: giving every recurring helper its own name and folder until the architecture is mostly ceremony. Naming a thing does not make it an architectural layer.

## Where people get it wrong

The common mistake is treating a pattern as a template to copy verbatim, then being surprised when a copy fits badly. A pattern specifies responsibility and contract, and the code is one realization of it. The other mistake is promoting supporting utilities (a cache-tag builder, a constants file) to first-class architectural status because they're used in many places. Being widely used is not the same as owning a stable responsibility boundary.

## Your stance

Ten patterns are canonical, each a stable responsibility boundary: **P01 Fetcher** (protected reads), **P02 Server Action** (mutation transport adapter), **P03 Application Workflow** (named use-case coordination), **P04 Transaction Helper** (atomic database facts), **P05 Authentication/Authorization/Policy** (identity and authority), **P06 Webhook Processor** (durable external reconciliation), **P07 Route/Feature Orchestration** (framework and presentation composition), **P08 Layer Contract** (trust and dependency boundaries), **P09 System Lifecycle** (states, transitions, concurrency, recovery), and **P10 Governance System** (durable intent, decisions, evidence, controlled change). Each pattern states the same fields: purpose, responsibilities, non-responsibilities, inputs, outputs, dependencies, callers, callees, invariants, failure behavior, security, tenant isolation, transaction and caching behavior, validation, tests, naming, placement, lifecycle, anti-patterns, and adjacent relationships. The non-responsibilities field matters as much as the responsibilities: it is the pattern's fence. Supporting patterns (selects, DTO mappers, cache helpers, constants, utilities) are real and useful, but they do not become architectural layers merely because they have a name. Only stable responsibility boundaries earn first-class status.

## Trade-offs you're accepting

A closed, small catalog means you will sometimes have a recurring shape that doesn't have a canonical name, and you'll treat it as a supporting pattern or a local convention even when it feels important. You're accepting that because the alternative, a catalog that grows by one entry each time a helper is reused twice, dilutes the names that matter until none of them carries a precise meaning.

## See also

Book of Implementation, Chapter 09: the concrete placement of every pattern, verified against your template's folders, plus the provider, workflow, and webhook conventions.
