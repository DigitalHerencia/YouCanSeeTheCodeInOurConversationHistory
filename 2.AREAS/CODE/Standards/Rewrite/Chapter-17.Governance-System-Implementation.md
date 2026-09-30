# Chapter 17: Governance System

**The Book of Implementation™**

## Placement: the minimal project package

```text
README.md                        # identity and scope
AGENTS.md                        # compact operating rules and the governance directory
context/docs/                    # durable product / architecture / auth / design docs
context/specs/                   # scoped, consequential change specifications
.agents/contracts/               # deterministic machine-readable subsets (only where automation benefits)
.agents/execution/               # mutable, temporary task state
  decisions.json                 # accepted decisions (the ADR log)
  progress.json                  # what was done, with evidence
  handoff.json                   # state for the next session
```

## Golden pattern: a decision record

```json
{
  "id": "<PREFIX>-DEC-<NNN>",
  "status": "accepted",
  "title": "<the decision, stated as a rule>",
  "decision": "<what was chosen, the boundary it draws, and what it does NOT change>",
  "affected_specs": ["<spec numbers>"]
}
```

## Golden pattern: a change record

A meaningful change record states: why the change was made, what behavior changed, which contracts or migrations are affected, the security and tenant impact, which evidence was executed and which was skipped, rollout and rollback where relevant, and the remaining risk.

## Anatomy

- **Decisions are stated as rules, with their boundary.** A good `decision` field says what it changes *and* what it deliberately leaves alone, which is what prevents a later reader from over-applying it.
- **`affected_specs` links a decision to the specs it constrains**, so a change to a spec can be checked against the decisions that touch it.
- **`status` is explicit.** An accepted decision can later be superseded, and a superseded decision stays in the log with its status changed instead of being deleted, so the reasoning trail survives.
- **Execution files record evidence and state, never intent.** `decisions.json` is the one place in `.agents/execution/` that holds durable decisions, and its own `purpose` field says execution state does not override the context docs or active specs.

## Real worked example

Verified against the live `.agents/execution/decisions.json` in the maximal template (12 accepted decisions). Three of them:

```json
{
  "id": "MAX-DEC-001",
  "status": "accepted",
  "title": "Public content is not the marketing domain",
  "decision": "Static landing, features, pricing, FAQ, contact, terms, privacy, and similar pages belong to app/(public). Marketing names the marketing-automation business domain.",
  "affected_specs": ["00", "01"]
},
{
  "id": "MAX-DEC-002",
  "status": "accepted",
  "title": "Public demo browseability is separate from mutation authority",
  "decision": "Signed-out visitors may browse seeded/read-only demo surfaces across recipe domains. Real protected mutations still require server authentication, application authorization, tenant/resource scope, validation, and RLS where applicable.",
  "affected_specs": ["00", "01", "04", "06", "07"]
},
{
  "id": "MAX-DEC-004",
  "status": "accepted",
  "title": "Use canonical domain vocabulary",
  "decision": "Use crm, projects, support, marketing, invoicing, social, ai, portal, admin, user, common across repository organization where applicable.",
  "affected_specs": ["00", "01", "05", "06"]
}
```

`MAX-DEC-001` is a vocabulary decision that prevents a naming collision (`public` pages versus the `marketing` business domain). `MAX-DEC-002` is a security decision: it explicitly separates *browsing* from *mutation authority*, so the demo's read-only surface can never be read as a relaxation of the mutation rules. `MAX-DEC-004` fixes the canonical domain names used to organize the repository, which is the decision-log version of the single-semantic-owner rule from Chapter 03.

## Forbidden variants (enforced, not just documented)

- **No governance artifact whose only purpose is proving other governance artifacts exist.** No manifests, checksum ledgers, or validator harnesses that check that Markdown files are present. Validate runtime behavior in the real application.
- **No decision recorded without its boundary.** A decision that doesn't say what it leaves unchanged will be over-applied.
- **No deleting a superseded decision.** Change its status and keep the reasoning trail.
- **No mutable execution file carrying product, architecture, or design intent.** Intent lives in `context/docs/` and `context/specs/`.
- **No silent change to a security, tenant, or authority rule.** A change of that kind is a decision, and it needs an owner's approval and a record.

## Checklist

- [ ] Any change to a boundary, security rule, or tenant rule has a decision record with an id, status, and stated boundary
- [ ] Each decision lists the specs it affects
- [ ] Superseded decisions are marked, not removed
- [ ] The change record states evidence executed versus skipped, security/tenant impact, and remaining risk
- [ ] No new artifact was created merely to prove governance artifacts exist
