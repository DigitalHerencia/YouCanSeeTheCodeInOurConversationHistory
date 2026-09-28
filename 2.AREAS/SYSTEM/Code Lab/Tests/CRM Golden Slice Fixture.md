---
type: codelab-test
id: TEST-001.CRM
module: "[[2.AREAS/SYSTEM/Code Lab/Modules/MOD-01 CRM-Pipeline-Tracker/Module]]"
project: "[[1.PROJECTS/ENG-M1-P1.2-CONFIG Project-Configuration/Project]]"
source: "[[3.RESOURCES/template/context/specs/04.crm-golden-vertical-slice]]"
status: pending
created: 2026-09-26
tags: [type/codelab, type/evidence]
---
# CRM Golden Slice Fixture

Derived from the supplied Maximal Template CRM contract and existing application files; it introduces no new CRM requirements.

## Acceptance trace

- [ ] Tenant-gated thin routes.
- [ ] Server feature → workflow → fetcher/action boundaries.
- [ ] Existing templates and client companions retained.
- [ ] Existing CRM schemas and types reused.
- [ ] Resource-level authorization and tenant scoping evidenced at server boundaries.
- [ ] Actual TaskNotes work and verification evidence linked.

## Existing contract references

- `3.RESOURCES/template/context/specs/04.crm-golden-vertical-slice.md`
- `3.RESOURCES/template/schemas/crmSchemas.ts`
- `3.RESOURCES/template/types/crmTypes.ts`
- `3.RESOURCES/template/features/crm/`
- `3.RESOURCES/template/lib/workflows/crmWorkflows.ts`

## Verification

Record results only after checks run. UI presence alone does not prove authorization, RLS, or cross-tenant isolation.
