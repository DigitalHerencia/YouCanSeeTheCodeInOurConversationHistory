# Chapter 14: Application Workflow

**The Book of Knowledge™**

## Concept

A Workflow is a **use-case-shaped composition function**: it combines already-established Fetchers, Actions, and pure business rules into one named operation that answers a real product question ("what does this user's CRM workspace look like right now," "qualify this lead," "reopen this opportunity") — without containing any persistence logic of its own. In more standard terms, this is close to what's sometimes called an **application service** or **use-case layer** in a layered architecture, sitting directly above the data-access boundary and directly below the presentation layer, existing specifically so business rules that span more than one Fetcher/Action don't end up duplicated inside UI code.

## Why it exists

Without this layer, a feature component that needs to show three related pieces of data (say, deals and contacts together) either makes three separate calls itself and stitches them together in presentation code, or — worse — a Fetcher or Action grows extra responsibility to cover the combined case, blurring its boundary. Multi-step business rules face the same problem: "qualifying a lead" isn't a single database write, it's a rule ("only a lead can be qualified") plus a read plus a conditioned write — logic that has to live somewhere, and putting it in the UI layer means the presentation code now owns a business invariant, which is exactly backwards from "the server is the source of truth."

## Where people get it wrong

The common shortcut is letting this composition logic leak into the feature/component layer directly — a React Server Component that calls two Fetchers itself and applies a business rule inline before rendering. This works the first time; it stops working the moment a second feature needs the same combined view or the same rule, and now the logic is duplicated (or the component is imported somewhere it doesn't belong, purely to reuse its logic). The other common mistake is the opposite: putting this composition logic inside a Fetcher or Action itself, which quietly turns a single-purpose read/write boundary into a grab-bag, defeating the whole point of having a clean, narrow Fetcher/Action layer underneath.

## Your stance

Workflows own composition and business-rule sequencing; they never query the database directly and never call a provider SDK directly — they call existing Fetchers, Actions, and integrations, and combine their results (including running independent reads concurrently where there's no data dependency between them). A workflow is where a business invariant that spans a read and a conditioned write actually lives — "only a lead can be qualified" is a workflow-level rule, checked after reading current state and before issuing the write, not duplicated in the UI and not silently assumed by the Action. Workflows are imported into Features and orchestrated there alongside pure, logic-free UI — the feature layer's only job is to call the workflow and render what it returns.

## Trade-offs you're accepting

This adds a layer of indirection between "the UI needs data" and "the data is fetched" — a component can't just reach for a Fetcher directly if a Workflow already exists for that use case, even when the difference feels academic for a trivial case. You're accepting that indirection because the alternative is deciding, feature by feature, whether *this* composition or *this* business rule needs its own layer — a decision that gets made inconsistently under deadline pressure, which is exactly how duplicated business logic accumulates.

## See also

Book of Implementation, Chapter 14 — the golden pattern, a worked real-world example, and the enforced anti-patterns.
