# Vault Validation One-Sheet

Run these checks after opening the vault. Each test should produce the stated behavior.

| Test | Action | Expected result |
|---|---|---|
| Home | Open Hearth | Clean Home opens with search/background and minimal cards |
| Command | Open Command Center | Today, deadlines, calendar, focus, and standup are visible |
| Project | QuickAdd → New Project | User-named project folder is generated under `1.PROJECTS` |
| Milestones | Inspect generated project | M1/M2/M3 exist |
| Phases | Open each milestone | Three phases exist under the correct milestone |
| RoadMaps | Inspect RoadMaps | One RoadMap exists for every phase |
| Kanban | Open milestone boards | Exactly one board per milestone; cards are phases only |
| Task | QuickAdd → New Task | TaskNote is created in `2.AREAS/SYSTEM/_Tasks` with canonical ID |
| Task state | Change status with Meta Bind | Frontmatter updates and TaskNotes reflects it |
| Project context | Open Project Command Center | One selected project controls displayed project data |
| Daily | Create/open Daily Note | Daily template loads and task/standup links resolve |
| Zettelkasten | Capture inbox item | Item lands in Inbox and can be refactored |
| Clipping | Web Clipper capture | Clipping lands in Zettelkasten Clippings |
| AI thread | Capture exported thread | AI Thread template is applied |
| Resource | Process Inbox | Processed resource reaches `3.RESOURCES` |
| Code Lab | Create/open Domain/Pattern | Code Lab object links resolve |
| CodeSpace | Open mounted code | CodeSpace edits `2.AREAS/SYSTEM/_mounts` content |
| Git | Open Vault dashboard | Status, changes, history, and activity are visible |
| Toolbar | Open each PARA area | Contextual toolbar changes with folder |
| Reading | Open note in Reading view | Reading actions are available without editing controls |
| Editing | Open note in edit view | Editing/refactor/table/code controls are available |
| Meta Bind | Edit mutable property | Property changes persist without breaking identity |
| Callouts | Insert semantic callout | Callout renders consistently |
| Icons | Browse PARA tree | Folder/file icon scheme is consistent |
| CSS | Toggle visual snippets | Dark modern theme remains readable and stable |
| Archive | Archive/restore an item | Item leaves active views and returns correctly |
| Reconcile | Run Hearth reconcile | Dashboard relationships are repaired without creating duplicates |

Failure handling: stop at the first broken ownership boundary, fix the underlying workflow/configuration, then rerun the dependent tests.
