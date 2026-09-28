# Hearth Property Registry v0.1

## Purpose

This registry answers the question: **which properties exist, who owns them, and who has to touch them?**

The answer is deliberately small at the human surface.

## Rule

A property exists for one of three reasons:

1. a plugin or Base needs machine-readable state;
2. the system must preserve a typed relationship or provenance edge;
3. the value is a genuine human decision/judgment.

Only #3 receives a normal Meta Bind editing control. Machine and computed fields are maintained by automation.

## Universal machine properties

| Property | Owner | User edits? | Why |
|---|---|---:|---|
| `id` | system | No | stable identity |
| `type` | system | No | ontology |
| `title` | user/system | Yes via rename | human identity |
| `created` | system | No | provenance |
| `updated` | system | No | freshness |
| `tags` | system + optional user topic tagging | limited | semantic discovery |
| `schema_version` | system | No | migration/compatibility |
| `last_reconciled` | system | No | automation audit |

## Project

### User-facing Meta Bind controls

`status` · `priority` · `target_end` · `current_focus` · `blocker` · `codelab_enabled`

### Machine/computed

`id` · `type` · `project_type` · `project_code` · `cycle` · `milestone` · `phase` · `target_start` · `progress` · `health` · `current_milestone` · `current_phase` · `next_action` · `open_task_count` · `completed_task_count` · `archive_state` · provenance fields

## Milestone

### User-facing

`status` · `target_end`

### Machine/computed

`id` · `project` · `number` · `project_code` · `phases` · `progress` · `health` · `next_action` · review/provenance fields

## Phase

### User-facing

`status` · `target_end` · `risk`

### Machine/computed

`id` · `project` · `milestone` · `number` · `start` · `tasks` · `progress` · `health` · `next_action` · Code Lab `module`/`lesson` links when enabled

## TaskNotes task

TaskNotes remains authoritative for task execution.

### User-facing

`status` · `priority` · `due` · `scheduled` · `blocker`

### Machine/computed

`project` · `milestone` · `phase` · `ticket_code` · `project_code` · `source_requirement` · `source_document` · `produced` · `evidence` · `completed`/completion timestamp · Code Lab drill links

The task body can contain acceptance criteria and execution notes without turning those into dozens of properties.

## Document

### User-facing

`status` · `review_status`

### Machine/computed

`id` · `type` · `project` · `authority` · `document_code` · `traces_to` · `implements` · `satisfies` · `validated_by` · `source_task` · `supersedes`

## Resource

### User-facing

`resource_state` · `resource_role` · `review_due`

### Machine/computed

`id` · `resource_type` · `source_kind` · `authority` · `source_url` · `creator` · `published` · `accessed` · `version` · `project_links` · `knowledge_links` · `codelab_links` · `related_patterns` · `superseded_by` · `capture_source`

## Code Lab

### User-facing

`mastery_state` · `confidence` · `next_review`

### Machine/computed

`id` · `ontology` · `module` · `lesson` · `project` · `pattern_target` · `attempt_count` · `last_attempted` · `mastery` · `production_evidence`

## Daily

### User-facing

`focus_project` · `focus_domain`

Everything else in the daily note is generated content or human-authored prose. Do not create properties for every generated section.

## What is intentionally NOT a property

The following should remain body content or generated views unless a concrete plugin requirement appears:

- “What happened yesterday”
- “What are we doing today”
- meeting discussion notes
- qualitative reflections
- long-form blockers
- roadmap narratives
- acceptance-criteria prose
- arbitrary counters that can be computed in Bases
- duplicate project/phase/task names

## Property UX rule

A user should normally see between 3 and 7 editable controls on an object. A note may technically contain more frontmatter than that, but machine metadata should disappear into the machinery.
