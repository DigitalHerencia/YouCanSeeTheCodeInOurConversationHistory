# Chapter 08: System Architecture Terminology

**The Book of Implementation™**

## Golden pattern: the naming conventions the template actually follows

Observed in the live maximal template. Where the written rule and the code disagree, the code is recorded here, because the doctrine treats the codebase as the alignment baseline (Chapter 05).

| Artifact | Convention | Real examples |
|---|---|---|
| Domain layer files (`lib/fetchers`, `lib/actions`, `lib/workflows`) | camelCase domain + plural role | `crmFetchers.ts`, `crmActions.ts`, `crmWorkflows.ts` |
| Schemas and types | camelCase domain + plural noun | `schemas/crmSchemas.ts`, `types/crmTypes.ts` |
| DB projections and DTOs | lowercase domain + dot + role suffix | `crm.selects.ts`, `crm.dto.ts` |
| Transaction helpers | kebab-case + `.tx.ts` | `add-portal-version.tx.ts`, `webhook-event.tx.ts`, `create-invoice.tx.ts` |
| Auth and authz files | plain lowercase noun | `auth.ts`, `redirects.ts`, `permissions.ts`, `policies.ts`, `roles.ts`, `resources.ts` |
| Route-group shells | kebab-case | `tenant-shell.tsx`, `public-shell.tsx`, `auth-shell.tsx`, `portal-shell.tsx` |
| Features | camelCase domain + subject + `Feature`; siblings share the stem | `crmAccountsFeature.tsx`, `crmAccountsFeature.client.tsx`, `crmAccountsSkeleton.tsx` |
| Templates | camelCase domain + subject + `Template` | `adminUsersTemplate.tsx`, `adminRecordsTemplate.tsx` |
| Route directories | kebab-case | `my-tasks`, `knowledge-base`, `sign-up` |
| Route groups | parenthesized lowercase | `(tenant)`, `(public)`, `(auth)`, `(setup)` |
| Permissions | `<domain>:<operation>` | `crm:read`, `crm:write`, `projects:write`, `ai:write` |

## Golden pattern: identifier naming

```text
Reads:        get<Domain><Subject>[ById]   getCrmAccounts, getContactById, getClosedWonCrmValue
Mutations:    <verb><Domain><Subject>      createCrmAccount, updateCrmAccount
Workflows:    <useCase>Workflow            qualifyLeadWorkflow, closeDealWorkflow, reopenOpportunityWorkflow
Transactions: <verb><Subject>Tx            addPortalVersionTx, claimWebhookEventTx, completeWebhookEventTx
Projections:  <entity>[Variant]Select      crmAccountSelect, crmDealDetailSelect
DTO mappers:  to<Entity>DTO                toCrmAccountDTO, toCrmContactDTO
Schemas:      <entity>FormSchema / update<Entity>Schema / <entity>ListCriteriaSchema
Errors:       <Cause>Error extends Error   ConcurrencyConflictError, ResourceNotFoundError,
                                           AuthorizationError, AuthenticationRequiredError
```

Names disclose responsibility and scope. `getCrmAccounts` says what and from where. `getData` does not.

## Anatomy

- **A file's suffix or plural noun tells you its layer before you open it.** That is the point of the convention.
- **The `.client.tsx` sibling** marks the client component that pairs with a server Feature of the same stem.
- **Error classes are named for the cause** and live next to the layer that throws them (`lib/db/transactions/errors.ts`, `lib/authz/`, `lib/auth/`).
- **Permission strings use a colon**, which makes them easy to distinguish from dotted capability or event names.

## Mismatches between the written rules and the code

These are real, and each is a decision for you. My recommendation follows each one.

1. **File suffixes.** The earlier Chapter 08 text says files use kebab-case plus a responsibility suffix (`.fetcher.ts`, `.action.ts`, `.workflow.ts`, `.policy.ts`, `.schema.ts`). No file in the template uses those suffixes. The domain layers use camelCase plural files instead (`crmFetchers.ts`). Only selects, DTOs, and transactions use the dotted suffix style. *Recommendation:* codify what exists, since it is consistent within each layer.
2. **Permission format.** The earlier text specifies `<resource>.<operation>[.<scope>]` (dots). The code uses `crm:read` (colon). *Recommendation:* codify the colon.
3. **Mixed casing in the UI layer.** Shells are kebab-case (`tenant-shell.tsx`), while features and templates are camelCase (`crmAccountsFeature.tsx`, `adminUsersTemplate.tsx`), and blocks are kebab-case (`bento-grid.tsx`). *Recommendation:* this is the one worth normalizing. Pick one casing for `components/` and apply it everywhere.
4. **Barrel exports.** The doctrine prefers direct imports, but `components/ui/index.ts` and `components/chart/index.ts` exist (Chapter 09).

## Forbidden variants (enforced, not just documented)

- **No generic canonical names:** `service`, `manager`, `helper`, `getData`, `saveThing`, a bare `account`.
- **No name that hides scope.** If a function is tenant-scoped or bounded, the name or its parameters say so.
- **No new architectural term for a shared or domain-specific component.** "Shared component" and "domain component" describe reuse or subject, and do not create layers. Use Primitive, Block, Template, and Feature.
- **No new casing convention introduced in one directory without applying it to its siblings.**

## Checklist

- [ ] New files follow the convention of their directory (table above)
- [ ] Function names follow the read, mutation, workflow, and transaction patterns
- [ ] Permission strings use `<domain>:<operation>`
- [ ] Error classes are named for the cause and placed beside the layer that throws them
- [ ] Any deliberate departure from a convention is recorded as a decision
