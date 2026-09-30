# Chapter 16: Fetcher

**The Book of Knowledge™**

## Concept

A Fetcher is your implementation of **read-path segregation**: every read operation is isolated behind a dedicated, single-purpose function that owns authentication, authorization, tenant scoping, and shape — rather than being issued ad hoc wherever data happens to be needed. In industry terms, this is the read side of **CQRS** (Command Query Responsibility Segregation) applied at the application-code level, not the infrastructure level — you're not running separate databases for reads and writes, you're just refusing to let reads and writes share a code path, so each can be reasoned about, tested, and secured on its own terms.

## Why it exists

Without this boundary, the natural failure mode is **authorization drift**: a query gets written once, correctly scoped and permission-checked, and then six months later someone (often you, at 1am) writes a second query against the same table that skips the check because "it's just a read." Reads are where authorization bugs hide, precisely because they feel safe. A Fetcher makes the check structural instead of a habit — you cannot call the function without the check running, because the check is inside the function, not beside it.

The second failure mode it prevents is the **N+1 query problem**: fetching a list, then issuing one additional query per row to enrich it. This is a classic performance foot-gun that's invisible in local dev with ten rows and catastrophic in production with ten thousand. Framing reads as purpose-built questions ("give me this aggregate," "give me this bounded page") rather than generic model dumps forces you to answer with one query instead of N+1.

## Where people get it wrong

The naive version — common in tutorials and in code written under deadline pressure — queries the ORM directly inside a component or route handler, with the authorization check (if it exists at all) living as a separate `if` statement nearby. This works until the component is reused somewhere the check doesn't apply, or the check is copy-pasted incorrectly, or a second engineer adds a new call site and doesn't know the check convention exists. The bug isn't in the logic; it's in the fact that there was no single place the logic had to live.

## Your stance

Every persistence read in the system goes through a Fetcher. A Fetcher is responsible for, in order: authenticating the caller, authorizing the specific operation, entering the correct tenant-scoped database context, executing an explicitly-projected query (never `select *` equivalent), and mapping the result through a **Data Transfer Object (DTO)** before it leaves the data boundary — so a persistence-shaped record (with its internal columns, foreign keys, and soft-delete flags) never accidentally becomes the application's public shape. Fetchers never write. If a read needs validated input (a date range, a filter, a page cursor) that crosses an untrusted boundary, it's validated with a schema library (Zod) before the query runs.

## Trade-offs you're accepting

This costs you indirection: a one-line query becomes a named function, a select clause, and a DTO mapper. For a solo hobby project this is arguably over-engineering. You're accepting that cost deliberately because the alternative — inline queries scattered through components — doesn't scale past the point where you're the only person who has to remember the rules, and doesn't survive you forgetting them yourself.

## See also

Book of Implementation, Chapter 16 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
