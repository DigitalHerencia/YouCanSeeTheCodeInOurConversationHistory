# Chapter 19: System Lifecycle

**The Book of Knowledge™**

## Concept

A lifecycle is the complete specification of how something stateful changes over time: the legal states it can be in, the named transitions between them, who or what is authorized to trigger each transition, what must be true before and after, and what happens when a transition fails or is attempted twice. In formal terms this is a **finite state machine** with guards, plus the operational concerns (concurrency, recovery, audit) that a textbook state diagram usually leaves out. A status enum is not a lifecycle. An enum lists the *states*; a lifecycle also defines the *transitions*, and the transitions are where the bugs live.

## Why it exists

The failure mode is the **illegal transition**: a record moves from a state it should never have left, or into one it should never be able to reach, because nothing in the code says which moves are legal. An invoice that goes from `CANCELED` back to `ACTIVE`, a webhook event that is processed twice because two workers both saw it as `RECEIVED`, a membership that is `REVOKED` but still passes an access check because one code path only tests for "exists." Each is individually a small oversight, and collectively they are the state-machine version of the authorization drift described in Chapter 15. Writing the lifecycle down forces every transition to have a name, an owner, and a guard, which makes an unnamed transition visible as a gap instead of a silent behavior.

## Where people get it wrong

The common shortcut is treating a status column as free-form: any code path may `update({ status: "X" })` whenever it feels appropriate. This is fine on day one and unmanageable by month six, because the set of legal moves exists only as folklore spread across the code paths that happen to write the column. The second mistake is designing the happy path only. A lifecycle that lists `RECEIVED → PROCESSING → PROCESSED` but has no answer for "the worker crashed in `PROCESSING`" has left out the state that actually pages someone at 3am.

## Your stance

Every durable, stateful thing in the system has its lifecycle specified across the same fixed set of concerns: identity and tenant ownership, entry conditions, the actors and triggers that may cause transitions, the authorization required, the canonical owner of each transition (one workflow per transition, never several), the ordered stages, the invariants, transaction behavior, failure behavior, retry and recovery, concurrency and idempotency, completion outputs, observability, and the evidence that proves the lifecycle behaves as specified. Lifecycles come in classes: domain entity lifecycles (a CRM deal moving `LEAD → QUALIFIED → PROPOSAL → NEGOTIATION → WON/LOST`), access lifecycles (a membership moving `INVITED → ACTIVE → SUSPENDED → REVOKED`), provider-mirror lifecycles (a local billing subscription mirroring Stripe's state), and operation lifecycles (an idempotency record moving through `STARTED` to a terminal state, a webhook event moving `RECEIVED → PROCESSING → PROCESSED` or `FAILED`). Provider state and domain state use separate vocabularies: Stripe's word for a subscription state is not automatically your word, and a redirect, a browser timer, or the order in which a provider happens to deliver events never creates product truth. Terminal states have defined meaning, and a "recoverable" state (like `FAILED` for a webhook) is distinct from a terminal one, because recovery is a transition and needs its own guard.

## Trade-offs you're accepting

Specifying a full lifecycle for every stateful entity is real up-front work, and most entities' lifecycles turn out simpler than the grammar suggests: many are three or four states with one obvious transition each. You're accepting that overhead because the grammar is cheap to fill in for simple cases and prevents the expensive case, the entity whose lifecycle turns out to have been complicated all along and was never written down.

## See also

Book of Implementation, Chapter 19: the golden pattern, worked real-world examples from your schema and webhook code, and the enforced anti-patterns.
