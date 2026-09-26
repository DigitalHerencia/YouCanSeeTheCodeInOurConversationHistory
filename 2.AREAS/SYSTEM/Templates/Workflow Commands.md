# Hearth Workflow Commands

## Automatic execution reconciliation
Hearth Automation listens for TaskNotes and project hierarchy changes, assigns IDs to new TaskNotes records, and derives progress, health, counts, and next action from explicit relations only. It reconciles once at startup. Use the command **Hearth Automation: Reconcile Hearth state** when a refresh is needed immediately.

## Daily snapshots
Opening a note under 2.AREAS/DAILY refreshes its generated regions automatically. Use **Hearth Automation: Refresh current Hearth Daily note** to refresh on demand. Human notes stay between the human markers and are not overwritten.

## Generate cadence on demand
Use the matching QuickAdd **Generate … Meeting** choice. It creates a dated note under 2.AREAS/DAILY/Meetings and skips a duplicate. Seven cadence types are defined in [[2.AREAS/DAILY/Cadence]].

## Create a project
Use QuickAdd **New Project**. Hearth Automation’s Templater user script generates the project ID and project code plus Charter, Roadmap, Project Index, project-local milestone Kanban, M1, and P1.1 starter notes. It is idempotent and leaves existing notes untouched.

## Create a task
Use the existing QuickAdd **New Task** TaskNotes command. TaskNotes remains the sole task store.
