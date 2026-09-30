# Chapter 21: Webhook Processor

**The Book of Knowledge™**

## Concept

A Webhook Processor consumes an asynchronous, out-of-band notification from a third-party provider (Stripe, Clerk, SendGrid) and turns it into a durable, exactly-once-effect state change in your own system — despite the notification arriving over an inherently unreliable channel (HTTP, possibly retried, possibly delayed, possibly delivered more than once). The core discipline is **idempotent event consumption**: the same event, delivered any number of times, must produce the same end state, not repeated side effects.

## Why it exists

Providers cannot guarantee exactly-once delivery — they guarantee *at-least-once*, which means your endpoint **will** receive duplicate events, sometimes minutes or hours apart (retries after timeouts, redelivery after an outage). If your handler isn't idempotent, a duplicate delivery double-charges a customer, double-sends an email, or double-provisions a resource. There is also a distinct, easily-confused pair of properties here worth naming precisely: **atomicity** (a database transaction either fully commits or fully rolls back — a property of a single transaction) and **idempotency** (repeating the same operation produces the same result — a property of the operation across multiple attempts, potentially across multiple transactions). A webhook handler needs both, and they solve different problems: atomicity protects one attempt from partially applying; idempotency protects the system from a *second* attempt after the first one already succeeded.

## Where people get it wrong

The common shortcut is a handler that verifies the signature, then just applies the change: update the subscription, send the email, whatever. This is correct exactly once. On the first retry (which will happen — provider infrastructure retries on any non-2xx response, including a 200 that arrived but got lost on the network), the change is applied a second time. A second common mistake is doing the "check if we've already processed this" lookup and the "mark as processed" write as two separate, non-atomic steps — which just narrows the race window instead of closing it; two near-simultaneous deliveries can both pass the check before either has written the mark.

## Your stance

Every webhook goes through four non-negotiable steps, in order: **(1) verify the provider's cryptographic signature** before trusting anything in the payload — this proves the request actually came from the provider, not from anyone who found the endpoint URL; **(2) atomically claim the event** using its `(provider, eventId)` pair as an idempotency key, in a single statement that both checks for a prior claim and inserts the new one — this is the step that must not be split into a separate check-then-write; **(3) apply the business-logic effect** inside its own transaction; **(4) mark the event's outcome** (processed or failed) so a genuine retry after a real failure is still possible, but a duplicate of an already-succeeded event is a no-op. Network calls to other providers never happen inside the same database transaction as step 2 or 4 — a transaction is database-local and short; an external call is neither.

## Trade-offs you're accepting

The claim-then-process-then-mark sequence is three separate steps where a naive handler has one, and it means writing (and maintaining) a small piece of concurrency-aware SQL rather than a plain ORM call. You're accepting that complexity because the alternative failure mode — a duplicate Stripe event silently double-provisioning a subscription — is a customer-facing billing bug, not an abstract correctness concern.

## See also

Book of Implementation, Chapter 21 — the golden pattern, a worked real-world example (Stripe), and the enforced anti-patterns.
