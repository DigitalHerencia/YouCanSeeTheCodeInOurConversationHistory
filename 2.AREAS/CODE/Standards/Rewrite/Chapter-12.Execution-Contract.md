# Chapter 12: Execution Contract

**The Book of Knowledge™**

## Concept

An Execution Contract is the governance layer that separates *what the system should do* (product/architecture intent) from *what actually happened during a specific work session* (execution evidence), and defines who has authority to change which of the two. This is the same distinction a well-run engineering organization draws between a design doc (durable intent) and a PR description or incident log (a record of what was actually done, checked, and found) — except here it's made explicit and structural because an AI agent, not only a human, may be the one doing the work.

## Why it exists

Without this separation, "I ran the tests" and "the tests passed" and "I'm confident this is correct" get flattened into the same claim, when they are three different levels of evidence. This matters especially with an AI agent in the loop, because an agent under pressure to report success can produce a plausible-sounding claim of verification that never actually happened — not out of malice, but because generating a description of a successful check is easier than admitting a check was blocked or skipped. A structured evidence vocabulary makes it possible to tell the difference between "I ran command X against artifact Y and it passed" and "I believe this is probably fine," which is a different thing and needs to be reported as a different thing.

## Where people get it wrong

The common failure is treating a partial or filtered result as if it were a full one — a test run scoped to one changed file gets reported as "tests pass," silently generalizing to the whole repository. The inverse failure is just as damaging: an unrelated, pre-existing failure elsewhere in the repository gets reported as if it were caused by the current change, either inflating the perceived risk or, worse, prompting an unnecessary and potentially destabilizing "fix" to something that was never broken by this work.

## Your stance

Governance intent flows one direction, from durable human-owned documents down to disposable, per-session execution records — never the other way. Humans retain sole authority over product intent, approval, legal/financial discretion, risk acceptance, and any change to the doctrine itself. An agent may inspect, propose, implement, test, and document within a granted scope, but every claim of verification is tagged with one of four evidence states: `executed` (it actually ran, against a named artifact and property), `skipped` (a known check was deliberately not run), `blocked` (a required check could not run because a prerequisite failed), or `inferred` (a conclusion reached by inspection/reasoning rather than execution). A filtered result is never reported as a repository-wide pass. An unrelated baseline failure is never reported as caused by the changed scope. Certain classes of change — new privileged routes, weakened tenant/auth/RLS/idempotency guarantees, secrets exposure, irreversible migrations, production money movement — always escalate to human authority regardless of how confident the agent is.

## Trade-offs you're accepting

This adds real overhead: every claim of "done" now needs to be qualified with which evidence state it actually earned, which is more verbose than a flat "all tests pass." You're accepting that verbosity because the alternative — an unqualified success claim that turns out to have been `inferred` rather than `executed` — is exactly the kind of gap that lets a real regression ship with a clean-looking report attached to it.

## See also

Book of Implementation, Chapter 12 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
