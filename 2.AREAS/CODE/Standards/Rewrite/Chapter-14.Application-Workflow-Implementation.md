# Chapter 14: Application Workflow

**The Book of Implementation™**

## Placement

```text
lib/workflows/
  crmWorkflows.ts
  supportWorkflows.ts
  adminWorkflows.ts
  marketingWorkflows.ts
  assetWorkflows.ts
  ...
```

## Golden pattern — read composition (concurrent, independent reads)

```ts
export async function get<Domain>WorkspaceWorkflow(limit = 100) {
  const [<listA>, <listB>] = await Promise.all([
    get<ListA>(limit),
    get<ListB>({ limit, sort: "<default>" }),
  ]);
  return { <listA>, <listB> };
}
```

## Golden pattern — business-rule sequencing (read, validate, conditioned write)

```ts
export async function qualify<Entity>Workflow(entityId: string) {
  const entity = await get<Entity>ById(entityId);
  if (!entity) throw new Error("<Entity> was not found.");
  if (entity.status !== "LEAD") throw new Error("Only a lead can be qualified.");

  return update<Entity>({
    entityId: entity.id,
    ...entity,
    status: "ACTIVE",
    expectedUpdatedAt: new Date(entity.updatedAt),
  });
}
```

## Anatomy

- **`Promise.all` for independent reads** — the workflow is the right place to notice two pieces of data don't depend on each other and fetch them concurrently, rather than each landing in separate sequential calls from the feature layer.
- **The business rule (`status !== "LEAD"`) lives in the workflow, not in the Action or the UI** — the Action (`update<Entity>`) stays a generic, reusable write; the *specific* rule about when qualification is allowed is a use-case concern, which is what a workflow is for.
- **`expectedUpdatedAt: new Date(entity.updatedAt)`** — the workflow, having just read the entity, supplies the optimistic-concurrency value the underlying Action requires (per Chapter 18), rather than the caller needing to know that detail.
- **The workflow calls `get<Entity>ById` and `update<Entity>` — a Fetcher and an Action it doesn't own** — it never touches Prisma or the transaction helpers directly; if it needs a different shape of read, that's a new Fetcher, not an inline query here.

## Real worked example

Verified against the live `crmWorkflows.ts` in the maximal template:

```ts
export async function getCrmWorkspaceWorkflow(limit = 100) {
  const [deals, contacts] = await Promise.all([
    getCrmDeals(limit),
    getContacts({ limit, sort: "name-asc" }),
  ]);
  return { deals, contacts };
}

export async function getCrmRecordWorkflow(
  kind: "deal" | "contact" | "account",
  id: string,
) {
  if (kind === "deal") return getCrmDeal(id);
  if (kind === "account") return getCrmAccount(id);
  return getContactById(id);
}

export async function qualifyLeadWorkflow(contactId: string) {
  const contact = await getContactById(contactId);
  if (!contact) throw new Error("CRM lead was not found.");
  if (contact.status !== "LEAD") throw new Error("Only a lead can be qualified.");
  return updateContact({
    contactId: contact.id,
    firstName: contact.firstName,
    lastName: contact.lastName,
    email: contact.email,
    phone: contact.phone,
    title: contact.title,
    status: "ACTIVE",
    expectedUpdatedAt: new Date(contact.updatedAt),
  });
}

export async function closeDealWorkflow(input: CloseDealCommand) {
  return updateCrmDealStage({ ...input, stage: input.outcome });
}

export async function reopenOpportunityWorkflow(input: ReopenOpportunityCommand) {
  return updateCrmDealStage({ ...input, stage: "QUALIFIED" });
}
```

Note `closeDealWorkflow` and `reopenOpportunityWorkflow` are thin — sometimes a workflow really is just a named, domain-meaningful alias over an existing Action call with a fixed parameter. That's fine: the value is in the name and the discoverability (`reopenOpportunityWorkflow` reads as a business action, `updateCrmDealStage({ stage: "QUALIFIED" })` doesn't), not in every workflow needing to justify itself with heavy logic.

## Forbidden variants (enforced, not just documented)

- **No Prisma/`tx` calls inside a workflow.** All persistence access goes through a Fetcher or Action; a workflow composes, it doesn't query.
- **No provider SDK calls inside a workflow.** Provider mechanics belong to `lib/integrations`; a workflow calls an integration function, it doesn't call Stripe/SendGrid/etc. directly.
- **No business rule that spans a read and a write duplicated in a feature component.** If a UI component contains an `if` that decides whether a mutation is allowed based on current state, that logic belongs in a workflow instead.
- **No workflow reaching into another domain's Fetchers/Actions to route around a missing one of its own** — if `crmWorkflows.ts` needs a new kind of CRM read, that's a new function in `crmFetchers.ts`, not a workaround.

## Checklist

- [ ] Independent reads inside the workflow run concurrently (`Promise.all`), not sequentially, when there's no data dependency
- [ ] Any business rule spanning a read and a conditioned write lives here, not in the UI or the Action
- [ ] No direct Prisma/`tx` or provider SDK call appears anywhere in the file
- [ ] Only established Fetchers, Actions, and integrations are called
- [ ] The workflow is imported into a Feature and orchestrated there, not called ad hoc from multiple unrelated components
