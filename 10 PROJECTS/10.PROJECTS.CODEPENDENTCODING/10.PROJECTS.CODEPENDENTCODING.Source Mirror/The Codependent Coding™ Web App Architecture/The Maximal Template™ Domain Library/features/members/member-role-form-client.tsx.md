---
title: 'The Hipster Stack™ Technology Stack\template\features\members\member-role-form-client.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\members\member-role-form-client.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.members.member-role-form-client.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\features\members\member-role-form-client.tsx'
source_file: 'member-role-form-client.tsx'
source_sha256: '52d39b9dc4298de71fc260652bdebe0506adaa7a2d53a1c23d54794434546ba3'
generated: true
---

# `member-role-form-client.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\members\member-role-form-client.tsx`
> SHA-256: `52d39b9dc4298de71fc260652bdebe0506adaa7a2d53a1c23d54794434546ba3`

```tsx
'use client';

import { useActionState } from 'react';

import { Button } from '@/components/ui/button';
import { updateMembershipAction } from '@/lib/actions/organizationActions';
import type { ActionResult } from '@/types/actionResultTypes';
import {
  organizationRoleLabels,
  organizationRoles,
  type OrganizationRole,
} from '@/types/authzTypes';

const initialState: ActionResult<{ role: string }> = {
  ok: true,
  data: { role: '' },
};

export function MemberRoleFormClient({
  membershipId,
  role,
}: {
  membershipId: string;
  role: OrganizationRole;
}) {
  const action = updateMembershipAction.bind(null, membershipId);
  const [state, formAction, pending] = useActionState(action, initialState);
  return (
    <form action={formAction} className="flex flex-wrap items-center gap-2">
      <select
        name="role"
        className="h-9 border bg-background px-3 text-sm"
        defaultValue={role}
      >
        {organizationRoles.map((option) => (
          <option key={option} value={option}>
            {organizationRoleLabels[option]}
          </option>
        ))}
      </select>
      <Button size="sm" variant="outline" disabled={pending}>
        {pending ? 'Saving...' : 'Update role'}
      </Button>
      {!state.ok ? (
        <span className="text-sm text-destructive">{state.formError}</span>
      ) : null}
      {state.ok && state.data.role ? (
        <span className="text-sm text-primary">Role updated.</span>
      ) : null}
    </form>
  );
}

```