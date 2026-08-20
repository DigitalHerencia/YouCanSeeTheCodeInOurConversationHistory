---
title: 'The Hipster Stack™ Technology Stack\template\features\members\invitation-form-client.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\members\invitation-form-client.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.members.invitation-form-client.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\members\invitation-form-client.tsx'
source_file: 'invitation-form-client.tsx'
source_sha256: 'ba57f697857ea7e1c3e1b6626532e8b0d7040ffade32d5d2c20d9727627307ef'
generated: true
---

# `invitation-form-client.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\members\invitation-form-client.tsx`
> SHA-256: `ba57f697857ea7e1c3e1b6626532e8b0d7040ffade32d5d2c20d9727627307ef`

```tsx
'use client';

import { useActionState } from 'react';

import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { inviteOrganizationMemberAction } from '@/lib/actions/organizationActions';
import type { ActionResult } from '@/types/actionResultTypes';
import {
  defaultInvitationRole,
  invitationRoles,
  organizationRoleLabels,
} from '@/types/authzTypes';

const initialState: ActionResult<{ id: string }> = {
  ok: true,
  data: { id: '' },
};

export function InvitationFormClient() {
  const [state, action, pending] = useActionState(
    inviteOrganizationMemberAction,
    initialState,
  );
  return (
    <form action={action} className="grid max-w-lg gap-4">
      <Label htmlFor="invite-email">Email</Label>
      <Input id="invite-email" name="email" type="email" required />
      <Label htmlFor="invite-role">Role</Label>
      <select
        id="invite-role"
        name="role"
        className="h-10 border bg-background px-3"
        defaultValue={defaultInvitationRole}
      >
        {invitationRoles.map((role) => (
          <option key={role} value={role}>
            {organizationRoleLabels[role]}
          </option>
        ))}
      </select>
      {!state.ok ? (
        <p className="text-sm text-destructive">{state.formError}</p>
      ) : null}
      {state.ok && state.data.id ? (
        <p className="text-sm text-primary">Invitation recorded.</p>
      ) : null}
      <Button disabled={pending}>
        {pending ? 'Inviting...' : 'Invite member'}
      </Button>
    </form>
  );
}

```