# Chapter 18: Server Action

**The Book of Knowledge™**

## Concept

A Server Action is the write-side counterpart to a Fetcher: the single, structural entry point through which a mutation reaches the database. Where a Fetcher enforces **read-path segregation**, a Server Action enforces **command-path segregation** — every state change in the system is a discrete, named, independently-authorized command, not an implicit side effect of some other operation. This is the same discipline **CQRS** applies on the write side, and it's also, not coincidentally, what a well-designed REST or RPC write endpoint has always been trying to be.

## Why it exists

The failure mode a Server Action prevents is **trusting client-shaped input as if it were already validated, authorized, server state**. A raw form submission, a fetch body, a client-constructed payload — none of it is trustworthy until the server has independently re-derived who's asking, whether they're allowed to ask, and whether the data they sent conforms to the schema the server actually expects. Skipping any one of those three checks is how you get **mass assignment bugs** (a client sends a field it shouldn't be able to set, like `organizationId` or `role`, and the server naively persists it), **broken object-level authorization** (a client is logged in and allowed to update *an* account, but not necessarily *this* account), and **lost-update races** (two clients edit the same record concurrently and the second write silently clobbers the first).

## Where people get it wrong

The common shortcut is to trust that "the user is logged in" is equivalent to "the user is allowed to do this specific thing to this specific record." Authentication answers the first question; it says nothing about the second. Another common shortcut is skipping concurrency control entirely — writing a naive `update` by primary key with no check on the record's prior state, which silently accepts a stale write from a user looking at outdated data.

## Your stance

Every mutation is a **thin Server Action**: it validates raw input against a Zod schema first (rejecting anything malformed before it touches business logic), resolves identity, opens a tenant-scoped transaction, re-fetches and re-checks ownership/authorization against the *actual current record* (not just the caller's general permission level) for anything that isn't a pure create, and only then performs the write — mapped back out through a DTO, never returning a raw persistence record. Where a resource could be edited by two people at once, the write is conditioned on the record's last-known `updatedAt` (an **optimistic concurrency check**), so a stale write fails loudly instead of silently overwriting newer data.

## Trade-offs you're accepting

Every action re-derives authorization from scratch even when a Fetcher already proved the caller could read the record moments earlier — that's deliberate redundancy, not laziness; read access and write access are different questions and answering one does not answer the other. You're also accepting that every update on a shared resource needs an extra round trip to fetch the current `updatedAt`, and a small amount of UI work to handle the resulting conflict gracefully, in exchange for never silently losing a user's edit.

## See also

Book of Implementation, Chapter 18 — the golden pattern, a worked real-world example (create and update), and the enforced anti-patterns.
