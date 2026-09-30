# Chapter 11: Layer Contract

**The Book of Knowledge™**

## Concept

A Layer Contract is the explicit answer, for every architectural layer, to five questions: what does it own, what may it know, what may it call, what may call it, and how does trust change as execution crosses it. This is the generalized, systemic version of what Chapters 15, 16, 18, 20, and 21 each already state for their own layer — this chapter is the index that makes the whole set of boundaries visible and checkable together, rather than each one only discoverable by reading its own chapter in isolation.

## Why it exists

Individual layer rules ("Fetchers never write," "Workflows never call Prisma directly") are each defensible on their own, but the real value only shows up when they're checked *against each other* for gaps — a boundary that's airtight in one direction but silently open in another is still a vulnerability. Naming "what may call it" for every layer, not just "what it may call," is what surfaces those asymmetries: if a Feature is allowed to call a Fetcher, but nothing stops a route from also calling that same Fetcher directly and bypassing the Feature's composition — is that intended, or an accidental crack in the boundary? A layer contract forces that question to be answered explicitly rather than discovered by accident.

## Where people get it wrong

Teams that document layer responsibilities usually document only the "owns" and "may call" columns — what a layer is for and what it's allowed to reach into. The "may call it" and "how trust changes" columns get skipped because they feel redundant with the layer being called. They aren't: a layer can correctly document that it only calls approved things below it, while still being reachable from somewhere above it that was never supposed to have access, because nobody wrote down who's allowed to call in.

## Your stance

Every layer's contract is stated in full, in both directions: **Fetcher** owns reads, may know the tenant-scoped `tx` and access context, may call Prisma selects and DTO mappers, may be called by Workflows and (directly, for simple cases) Features — never by routes or components directly. **Action** owns mutations, may know the same tenant context, may call schemas/policy/transaction helpers, may be called by Workflows and Features — never by routes directly, never by other Actions silently reimplementing shared logic instead of composing. **Workflow** owns composition and business-rule sequencing, may call Fetchers/Actions/integrations, may be called by Features — never touches Prisma or provider SDKs itself. **Feature** owns presentation orchestration, may call Workflows (and Fetchers directly for the simplest read-only cases), may be called only by route files. **Route** owns HTTP/framework adapting, may call Features (and, narrowly, workflows for revalidation/redirect logic), is called by the framework itself, and is the one layer that must never quietly absorb business logic just because it's convenient to have it there. A change in trust level (unauthenticated → authenticated → authorized → tenant-scoped) is never assumed to have already happened by the time execution reaches a given layer; each layer that depends on a trust level re-establishes or re-checks it rather than inheriting it silently.

## Trade-offs you're accepting

Writing the "may call it" and trust-transition columns explicitly, for every layer, is more documentation than most projects bother with — and it can feel like restating the obvious from the other layer's perspective. You're accepting that redundancy because it's exactly what turns "I'm pretty sure nothing calls this directly" into a checkable, auditable claim instead of an assumption nobody has actually verified.

## See also

Book of Implementation, Chapter 11 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
