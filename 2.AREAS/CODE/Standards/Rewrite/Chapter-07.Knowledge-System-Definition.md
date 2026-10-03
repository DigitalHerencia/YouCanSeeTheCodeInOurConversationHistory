# Chapter 07: Knowledge System Definition

**The Book of Knowledge™**

## Concept

A knowledge system definition states what the documentation set *is*, what each of its parts owns, and what authority it carries. It is the doctrine applied to itself. In industry vocabulary this is the **documentation architecture**: the decision about which document owns which kind of statement, so that the same fact is never defined twice and a reader can always tell which source wins.

## Identity

TypeScripture™ is the canonical doctrine, composed of two books. The Book of Knowledge™ owns meaning, authority, definitions, constraints, relationships, decision rules, and evidence semantics. The Book of Implementation™ owns concrete realization: interfaces, schemas, file placement, code, configuration, workflows, tests, and executable boundaries. The split is by *kind of statement*: "what it means and why" in one book, "how it is built and where it goes" in the other.

## Why it exists

Documentation sets rot in a predictable way. The same rule gets written in three places, the copies drift, and a reader can no longer tell which version is current. A defined ownership split prevents this: each statement has one home, and anything else that mentions it points there. The second failure it prevents is the unlabeled authority conflict, where a README, a spec, and the code disagree and nobody has said which one is right.

## Authority

Current explicit human intent controls. Canonical doctrine controls reusable engineering truth. Approved product specifications control scoped product change. Machine contracts encode deterministic subsets of the above. Implementation and tests are evidence. This is the same ordering as the governance authority order in Chapter 17. A lower layer can expose a defect in a higher one, but it never silently overwrites it.

## Change rule

Change the canonical owner first, then propagate to the affected contracts, implementation, tests, and maps. After reconciliation, exactly one active definition should remain. The order matters: changing the implementation first and the doctrine "later" is how documentation becomes a record of what used to be true.

## Sufficiency

The system is sufficient when a competent human or agent can recover what a concept means, who owns it, how it is implemented, which invariants apply, and what evidence supports it, without reconstructing the architecture from contradictory archives. That is the practical test for whether the corpus is finished: not whether it is long, but whether a newcomer can answer those five questions from it alone.

## Trade-offs you're accepting

A two-book split means a reader sometimes has to open two files to understand one concept, and the pairing has to be maintained. You're accepting that because a single combined document tends to blur "what it means" into "how it's currently coded," and the first is meant to outlive the second.

## See also

Book of Implementation, Chapter 07: the canonical file layout, the pairing rule, the packaging prohibitions, and the check I ran on the repository's current state.
