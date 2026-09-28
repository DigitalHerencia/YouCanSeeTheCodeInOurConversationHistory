# Hearth Migration Manifest

## Current project inventory

| Project | Domain | Milestone | Phase | Status | Work dates |
|---|---|---|---|---|---|
| DES-M1-P1.1-DESVERIFY – Design Verification | DES | M1 | P1.1 | In progress | 2026-01-08 → 2026-01-22 |
| DES-M1-P1.1-UXARCH – UX Architecture | DES | M1 | P1.1 | Done | 2026-01-01 → 2026-01-15 |
| ENG-M1-P1.1-INIT – Environment Initialization | ENG | M1 | P1.1 | Done | 2026-01-01 → 2026-01-15 |
| ENG-M1-P1.2-CONFIG – Project Configuration | ENG | M1 | P1.2 | In progress | 2026-01-08 → 2026-01-22 |
| MKT-M1-P1.1-POS – Positioning | MKT | M1 | P1.1 | Done | 2026-01-01 → 2026-01-15 |
| MKT-M1-P1.1-PUBSETUP – Public Presence Setup | MKT | M1 | P1.1 | In progress | 2026-01-08 → 2026-01-22 |
| OPS-M1-P1.1-GOV – LLC & Governance | OPS | M1 | P1.1 | In progress | 2026-01-08 → 2026-01-22 |
| OPS-M1-P1.1-OKR – OKRs & Constraints | OPS | M1 | P1.1 | Done | 2026-01-01 → 2026-01-15 |
| PROD-M1-P1.1-PRD – Problem Definition | PROD | M1 | P1.1 | Done | 2026-01-01 → 2026-01-15 |
| PROD-M1-P1.1-VERIFY – PRD Verification | PROD | M1 | P1.1 | In progress | 2026-01-08 → 2026-01-22 |
| RES-M1-P1.1-A&S - Arrays & Strings | RES | M1 | P1.1 | Done | 2026-01-01 → 2026-01-15 |

## Tasks

Current exported task count: **40**.

Task execution remains in TaskNotes under `2.AREAS/SYSTEM/_Tasks`.

Six tasks were already verified in live Notion as having no Project relation. They must remain unassigned and enter the repair queue:

- `T02 Execute IP assignments` — not done
- `T02 Validate assumptions & constraints` — not done
- `T02 Validate user journeys` — not done
- `T02 TypeScript strict config` — not done
- `T02 Set up Twitter profile` — not done
- `T05 128. longest consecutive sequence` — done

Do not assign any task to a project by title similarity.

## Canonical recurring meetings

| Meeting | Cadence | Type |
|---|---|---|
| Daily Standup | Daily | Standup |
| Engineering Meeting | Daily | Engineering |
| Design Meeting | Daily | Design |
| Operations Meeting | Daily | Operations |
| Weekly Sync | Weekly | Weekly Sync |
| Sprint Planning | Biweekly | Sprint Planning |
| Post-mortem | Biweekly | Post-mortem |

Meeting notes are generated on demand under `2.AREAS/DAILY/`. Do not generate the entire recurring history during normal operation.

## Meeting template content

### Daily Standup
- What did we do yesterday?
- What are we doing today?
- Potential blockers?
- Action items

### Engineering Meeting
- Stretch
- Tasks: owner, task definition, why, testing plan, success criteria
- Questions
- Notes

### Design Meeting
- Goals / agenda
- Discussion notes
- Action items

### Operations Meeting
- Progress Updates
- Metrics Dashboard Review: KPIs, Financials
- Topics to discuss: problem/options
- Other actions: approval/vote
- Notes
- Follow-up Actions with owner

### Weekly Sync
- What happened last week?
- What are we doing this week?
- Potential blockers?
- Action Items

### Sprint Planning
- Sprint Goal
- Sprint Backlog
- Team & Roles
- Notes

### Post-mortem
- User Facing Impact
- Timeline
- Relevant Metrics
- Notes: Cause Analysis, Resolution, Future Work
- Action Items

## Notion SOP translation

`Project Type → Project → Milestone → Phase → Task`.

Ticket work codes remain:
`[TEAM]-[MILESTONE]-[PHASE]-[PROJECT]-[TICKET]`.

New stable project IDs use the form `TEAM-M#-NNN`; derived work codes use the full milestone/phase/project form.